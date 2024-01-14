Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97182D1FB
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 20:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667169.1038193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rP63y-0001T7-J7; Sun, 14 Jan 2024 19:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667169.1038193; Sun, 14 Jan 2024 19:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rP63y-0001QU-Fe; Sun, 14 Jan 2024 19:22:30 +0000
Received: by outflank-mailman (input) for mailman id 667169;
 Sun, 14 Jan 2024 19:22:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rP63w-0001QM-Hh
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 19:22:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rP63v-0004Z8-Ti; Sun, 14 Jan 2024 19:22:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rP63v-0003QL-N8; Sun, 14 Jan 2024 19:22:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=9cJjGSaVGnf1vbKh8q2IJoaYMuhKMVd7+zrJ3BMtR9o=; b=wNeheuFLWDk8E9g9SS22F/ZOfz
	FokX/w0k2ae7XvzLGLym2ErBNU4J/0fMWMyd6KT/8xU+WP9+xazTPz6AHCzdLsNGvRk9Z9CJMGyiQ
	kS2Yd7ol1OH/7H+su1XUCHc0mLsquNWqv1Lkc+Wa2vIjN4IMebyD1/hV57qaPUCB5hTA=;
Message-ID: <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org>
Date: Sun, 14 Jan 2024 19:22:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech>
 <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
 <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 13/01/2024 17:07, Carlo Nonato wrote:
>>> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
>>> index 37b6d230ad..66b674eeab 100644
>>> --- a/xen/arch/arm/mmu/setup.c
>>> +++ b/xen/arch/arm/mmu/setup.c
>>> @@ -7,6 +7,7 @@
>>>
>>>    #include <xen/init.h>
>>>    #include <xen/libfdt/libfdt.h>
>>> +#include <xen/llc-coloring.h>
>>>    #include <xen/sizes.h>
>>>    #include <xen/vmap.h>
>>>
>>> @@ -39,6 +40,10 @@ DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>>>    static DEFINE_PAGE_TABLE(cpu0_pgtable);
>>>    #endif
>>>
>>> +#ifdef CONFIG_LLC_COLORING
>>> +static DEFINE_PAGE_TABLE(xen_colored_temp);
>>> +#endif
>>
>> Does this actually need to be static?
> 
> Why it shouldn't be static? I don't want to access it from another file.

My question was whether this could be allocated dynamically (or possibly 
re-use an existing set of page tables). In particular with the fact that 
we will need more than 1 page to cover the whole Xen binary.

Looking at the use xen_colored_temp. This is pretty much the same as 
xen_map[i] but with different permissions. So what you could do is 
preparing xen_map[i] with very permissive permissions (i.e. RWX) and 
then enforcing the permission once the TTBR has been switched.

Something like that (tested without cache coloring):

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index a3a263a5d94b..f7ac5cabf92c 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -306,7 +306,11 @@ void __init setup_pagetables(unsigned long 
boot_phys_offset, paddr_t xen_paddr)
      p[0].pt.table = 1;
      p[0].pt.xn = 0;

-    /* Break up the Xen mapping into pages and protect them separately. */
+    /*
+     * Break up the Xen mapping into pages. We will protect the
+     * permissions later in order to allow xen_xenmap to be used for
+     * when relocating Xen.
+     */
      for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
      {
          vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
@@ -315,13 +319,7 @@ void __init setup_pagetables(unsigned long 
boot_phys_offset, paddr_t xen_paddr)
              break;
          pte = pte_of_xenaddr(va);
          pte.pt.table = 1; /* third level mappings always have this bit 
set */
-        if ( is_kernel_text(va) || is_kernel_inittext(va) )
-        {
-            pte.pt.xn = 0;
-            pte.pt.ro = 1;
-        }
-        if ( is_kernel_rodata(va) )
-            pte.pt.ro = 1;
+        pte.pt.xn = 0; /* Permissions will be enforced later. Allow 
execution */
          xen_xenmap[i] = pte;
      }

@@ -352,6 +350,37 @@ void __init setup_pagetables(unsigned long 
boot_phys_offset, paddr_t xen_paddr)

      switch_ttbr(ttbr);

+    /* Protect Xen */
+    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
+        lpae_t *entry = xen_xenmap + i;
+
+        if ( !is_kernel(va) )
+            break;
+
+        pte = read_atomic(entry);
+
+        if ( is_kernel_text(va) || is_kernel_inittext(va) )
+        {
+            pte.pt.xn = 0;
+            pte.pt.ro = 1;
+        } else if ( is_kernel_rodata(va) ) {
+            pte.pt.ro = 1;
+            pte.pt.xn = 1;
+        } else {
+            pte.pt.xn = 1;
+            pte.pt.ro = 0;
+        }
+
+        write_pte(entry, pte);
+    }
+
+    /*
+     * We modified live page-tables. Ensure the TBLs are invalidated
+     * before setting enforcing the WnX permissions.
+     */
+    flush_xen_tlb_local();
      xen_pt_enforce_wnx();

  #ifdef CONFIG_ARM_32

> 
>> And if yes, then is it necessary
>> to be kept the boot as completed?
> 
> Nope. __initdata?

Yes.

[...]

>> It feels wrong to keep the full Xen (even temporarily) just for CPU
>> bring-up. But I don't think this is necessary. The secondary CPUs
>> outside of code in head.S, secondary CPU should only need to access to
>> init_ttbr and smp_cpu_up.
>>
>> The last one is already questionable because the CPU should never wait
>> in Xen. Instead they would be held somewhere else. But that's separate
>> issue.
>>
>> Anyway, if you move init_ttbr and smp_cpu_up in the identity mapped
>> area, then you will not need to copy of Xen. Instead, secondary CPUs
>> should be able to jump to the new Xen directly.
> 
> So to recap:
> 
> 1) How to move variables in the identity map area?
> __attribute__((section(".text.idmap"))) triggers some warning when assembling.
> 
> Warning: setting incorrect section attributes for .text.idmap
> 
> 2) If I'm not mistaken the identity mapping is read only (PAGE_HYPERVISOR_RX)
> and forcing it to be PAGE_HYPERVISOR_RW breaks something else.
The warning above has nothing to do with the attributes used in the 
page-tables. It is telling you have multiple .text.idmap section with 
different attributes.

There are a couple of ways to solve it:
    1. Define init_ttbr in head.S
    2. Use a different section (e.g. .data.idmap) and add it in the linker.

Note that this means the init_ttbr cannot be written directly. But you 
can solve this problem by re-mapping the address.

> 
> 3) To access the identity mapping area I would need some accessor that takes
> an address and returns it + phys_offset, or is there a better way to do it?

I am not sure I understand what you mean. Can you clarify?


> 
> 4) Maybe I misinterpreted the above comment, but I would still need to copy
> Xen in the physically colored space. What I can drop is the temporary virtual
> space used to access the "old" variables.

Correct.

> 
> 5) The identity mapping at runtime, at the moment, is pointing to the new
> colored space because of how pte_of_xenaddr is implemented. This means that if
> I want to use it to access the old variables, I would need to keep it a real
> identity mapping, right?

Why would you need to access the old variables?

>> This will also avoid to spread cache coloring changes in every Xen
>> components.
> 
> Maybe I'm missing something, but even with this identity mapping "shortcut" I
> would still need to touch the same amount of files, for example when init_ttbr
> or smp_up_cpu are accessed, they would need to use identity virtual addresses.

My point was not related to the amount of files you are touching. But 
the number of ...

> 
>>> +    if ( llc_coloring_enabled )

... if ( llc_coloring_enabled ) you sprinkle in Xen. I would really like 
to reduce to the strict minimum. Also...

[...]

>>> @@ -751,8 +899,13 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>>        {
>>>            if ( !llc_coloring_init() )
>>>                panic("Xen LLC coloring support: setup failed\n");
>>> +        xen_bootmodule->size = xen_colored_map_size(_end - _start);
>>> +        xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
>>
>> As you update xen_bootmodule, wouldn't this mean that the non-relocated >> Xen would could be passed to the bootallocator?

... as I wrote ealier your current approach seems to have a flaw. As you 
overwrite xen_bootmodule->{start, size}. setup_mm() will end up to add 
the old Xen region to the boot allocator. This is before any secondary 
CPUs are booted up.

IOW, the allocator may provide some memory from the old Xen and nothing 
good will happen from that.

The only way to solve it is to add another module. So the memory is 
skipped by setup_mm(). However see below.

> 
> Yes that should be memory that in the end would not be needed so it must
> return to the boot-allocator (if that's what you mean). But how to do
> that?

You can't really discard the old temporary Xen. This may work today 
because we don't support CPU hotplug or suspend/resume. But there was 
some series on the ML to enable it and I don't see any reason why 
someone would not want to use the features with cache coloring.

So the old temporary Xen would have to be kept around forever. This is 
up to 8MB of memory wasted.

The right approach is to have the secondary CPU boot code (including the 
variables it is using) fitting in the same page (or possibly multiple so 
long this is small and physically contiguous). With that it doesn't 
matter where is the trampoline, it could stay at the old place, but we 
would only waste a few pages rather than up 8MB as it is today.

Cheers,

-- 
Julien Grall

