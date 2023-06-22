Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E6B739EB7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 12:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553504.864094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHnX-0007le-42; Thu, 22 Jun 2023 10:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553504.864094; Thu, 22 Jun 2023 10:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHnX-0007jj-19; Thu, 22 Jun 2023 10:44:19 +0000
Received: by outflank-mailman (input) for mailman id 553504;
 Thu, 22 Jun 2023 10:44:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qCHnV-0007jd-Fl
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 10:44:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCHnT-00059I-80; Thu, 22 Jun 2023 10:44:15 +0000
Received: from [54.239.6.188] (helo=[192.168.27.222])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCHnT-0001QS-1g; Thu, 22 Jun 2023 10:44:15 +0000
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
	bh=xv7O+LVYjCdeUXAun5cb7QmCeY6WRzfn1Y2fMQuYuvU=; b=Gm9/4QXgl809fB637evUr4Ahu7
	IajnzVA7NtTgZy/3ZbrYnlq0z+/oqIdhCq2x0bIen4XWI5rgEIGmHKxVxHEDGQwjiPKT0HX5Uu9oj
	uiFXvSzz0ndY7NzgiJQiAbRjVO1kLlNHMcGAwmMl12hZ0uhTdsxjPrjkkvyWHmenXbfQ=;
Message-ID: <558e68c4-1a2d-5a9e-4070-5b894e14a3f4@xen.org>
Date: Thu, 22 Jun 2023 11:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
 <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
 <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
 <a99a8246-bc80-07b9-dacc-f117ace37027@xen.org>
 <aa2c8649-4acd-bcf4-d547-e3609bb1a0a2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aa2c8649-4acd-bcf4-d547-e3609bb1a0a2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Sorry for the late reply.

On 13/01/2023 09:22, Jan Beulich wrote:
> On 13.01.2023 00:20, Julien Grall wrote:
>> On 04/01/2023 10:27, Jan Beulich wrote:
>>> On 23.12.2022 13:22, Julien Grall wrote:
>>>> On 22/12/2022 11:12, Jan Beulich wrote:
>>>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>>>> @@ -165,7 +165,24 @@ restore_all_guest:
>>>>>>             and   %rsi, %rdi
>>>>>>             and   %r9, %rsi
>>>>>>             add   %rcx, %rdi
>>>>>> -        add   %rcx, %rsi
>>>>>> +
>>>>>> +         /*
>>>>>> +          * Without a direct map, we have to map first before copying. We only
>>>>>> +          * need to map the guest root table but not the per-CPU root_pgt,
>>>>>> +          * because the latter is still a xenheap page.
>>>>>> +          */
>>>>>> +        pushq %r9
>>>>>> +        pushq %rdx
>>>>>> +        pushq %rax
>>>>>> +        pushq %rdi
>>>>>> +        mov   %rsi, %rdi
>>>>>> +        shr   $PAGE_SHIFT, %rdi
>>>>>> +        callq map_domain_page
>>>>>> +        mov   %rax, %rsi
>>>>>> +        popq  %rdi
>>>>>> +        /* Stash the pointer for unmapping later. */
>>>>>> +        pushq %rax
>>>>>> +
>>>>>>             mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>>>>>             mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>>>>>             mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>>>>>> @@ -177,6 +194,14 @@ restore_all_guest:
>>>>>>             sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>>>>>                     ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>>>>>             rep movsq
>>>>>> +
>>>>>> +        /* Unmap the page. */
>>>>>> +        popq  %rdi
>>>>>> +        callq unmap_domain_page
>>>>>> +        popq  %rax
>>>>>> +        popq  %rdx
>>>>>> +        popq  %r9
>>>>>
>>>>> While the PUSH/POP are part of what I dislike here, I think this wants
>>>>> doing differently: Establish a mapping when putting in place a new guest
>>>>> page table, and use the pointer here. This could be a new per-domain
>>>>> mapping, to limit its visibility.
>>>>
>>>> I have looked at a per-domain approach and this looks way more complex
>>>> than the few concise lines here (not mentioning the extra amount of
>>>> memory).
>>>
>>> Yes, I do understand that would be a more intrusive change.
>>
>> I could be persuaded to look at a more intrusive change if there are a
>> good reason to do it. To me, at the moment, it mostly seem a matter of
>> taste.
>>
>> So what would we gain from a perdomain mapping?
> 
> Rather than mapping/unmapping once per hypervisor entry/exit, we'd
> map just once per context switch. Plus we'd save ugly/fragile assembly
> code (apart from the push/pop I also dislike C functions being called
> from assembly which aren't really meant to be called this way: While
> these two may indeed be unlikely to ever change, any such change comes
> with the risk of the assembly callers being missed - the compiler
> won't tell you that e.g. argument types/count don't match parameters
> anymore).

I think I have managed to write what you suggested. I would like to 
share to get early feedback before resending the series.

There are also a couple of TODOs (XXX) in place where I am not sure if 
this is correct.

diff --git a/xen/arch/x86/include/asm/config.h 
b/xen/arch/x86/include/asm/config.h
index fbc4bb3416bd..320ddb9e1e77 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -202,7 +202,7 @@ extern unsigned char boot_edid_info[128];
  /* Slot 260: per-domain mappings (including map cache). */
  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + 
PAGETABLE_ORDER))
-#define PERDOMAIN_SLOTS         3
+#define PERDOMAIN_SLOTS         4
  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
                                   (PERDOMAIN_SLOT_MBYTES << 20))
  /* Slot 4: mirror of per-domain mappings (for compat xlat area 
accesses). */
@@ -316,6 +316,16 @@ extern unsigned long xen_phys_start;
  #define ARG_XLAT_START(v)        \
      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))

+/* CR3 shadow mapping area. The fourth per-domain-mapping sub-area */
+#define SHADOW_CR3_VIRT_START   PERDOMAIN_VIRT_SLOT(3)
+#define SHADOW_CR3_ENTRIES      MAX_VIRT_CPUS
+#define SHADOW_CR3_VIRT_END     (SHADOW_CR3_VIRT_START +    \
+                                 (MAX_VIRT_CPUS * PAGE_SIZE))
+
+/* The address of a particular VCPU's c3 */
+#define SHADOW_CR3_VCPU_VIRT_START(v) \
+    (SHADOW_CR3_VIRT_START + ((v)->vcpu_id * PAGE_SIZE))
+
  #define ELFSIZE 64

  #define ARCH_CRASH_SAVE_VMCOREINFO
diff --git a/xen/arch/x86/include/asm/domain.h 
b/xen/arch/x86/include/asm/domain.h
index c2d9fc333be5..d5989224f4a3 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -273,6 +273,7 @@ struct time_scale {
  struct pv_domain
  {
      l1_pgentry_t **gdt_ldt_l1tab;
+    l1_pgentry_t **shadow_cr3_l1tab;

      atomic_t nr_l4_pages;

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9741d28cbc96..b64ee1ca47f6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -509,6 +509,13 @@ void share_xen_page_with_guest(struct page_info 
*page, struct domain *d,
      spin_unlock(&d->page_alloc_lock);
  }

+#define shadow_cr3_idx(v) \
+    ((v)->vcpu_id >> PAGETABLE_ORDER)
+
+#define pv_shadow_cr3_pte(v) \
+    ((v)->domain->arch.pv.shadow_cr3_l1tab[shadow_cr3_idx(v)] + \
+     ((v)->vcpu_id & (L1_PAGETABLE_ENTRIES - 1)))
+
  void make_cr3(struct vcpu *v, mfn_t mfn)
  {
      struct domain *d = v->domain;
@@ -516,6 +523,18 @@ void make_cr3(struct vcpu *v, mfn_t mfn)
      v->arch.cr3 = mfn_x(mfn) << PAGE_SHIFT;
      if ( is_pv_domain(d) && d->arch.pv.pcid )
          v->arch.cr3 |= get_pcid_bits(v, false);
+
+    /* Update the CR3 mapping */
+    if ( is_pv_domain(d) )
+    {
+        l1_pgentry_t *pte = pv_shadow_cr3_pte(v);
+
+        /* XXX Do we need to call get page first? */
+        l1e_write(pte, l1e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
+        /* XXX Can the flush be reduced to the page? */
+        /* XXX Do we always call with current? */
+        flush_tlb_local();
+    }
  }

  void write_ptbase(struct vcpu *v)
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 5c92812dc67a..064645ccc261 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -288,6 +288,19 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
                                1U << GDT_LDT_VCPU_SHIFT);
  }

+static int pv_create_shadow_cr3_l1tab(struct vcpu *v)
+{
+    return create_perdomain_mapping(v->domain, 
SHADOW_CR3_VCPU_VIRT_START(v),
+                                    1, v->domain->arch.pv.shadow_cr3_l1tab,
+                                    NULL);
+}
+
+static void pv_destroy_shadow_cr3_l1tab(struct vcpu *v)
+
+{
+    destroy_perdomain_mapping(v->domain, SHADOW_CR3_VCPU_VIRT_START(v), 1);
+}
+
  void pv_vcpu_destroy(struct vcpu *v)
  {
      if ( is_pv_32bit_vcpu(v) )
@@ -297,6 +310,7 @@ void pv_vcpu_destroy(struct vcpu *v)
      }

      pv_destroy_gdt_ldt_l1tab(v);
+    pv_destroy_shadow_cr3_l1tab(v);
      XFREE(v->arch.pv.trap_ctxt);
  }

@@ -311,6 +325,10 @@ int pv_vcpu_initialise(struct vcpu *v)
      if ( rc )
          return rc;

+    rc = pv_create_shadow_cr3_l1tab(v);
+    if ( rc )
+        goto done;
+
      BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
                   PAGE_SIZE);
      v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, 
X86_NR_VECTORS);
@@ -346,10 +364,12 @@ void pv_domain_destroy(struct domain *d)

      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
                                GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+    destroy_perdomain_mapping(d, SHADOW_CR3_VIRT_START, 
SHADOW_CR3_ENTRIES);

      XFREE(d->arch.pv.cpuidmasks);

      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
+    FREE_XENHEAP_PAGE(d->arch.pv.shadow_cr3_l1tab);
  }

  void noreturn cf_check continue_pv_domain(void);
@@ -371,6 +391,12 @@ int pv_domain_initialise(struct domain *d)
          goto fail;
      clear_page(d->arch.pv.gdt_ldt_l1tab);

+    d->arch.pv.shadow_cr3_l1tab =
+        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
+    if ( !d->arch.pv.shadow_cr3_l1tab )
+        goto fail;
+    clear_page(d->arch.pv.shadow_cr3_l1tab);
+
      if ( levelling_caps & ~LCAP_faulting &&
           (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
          goto fail;
@@ -381,6 +407,11 @@ int pv_domain_initialise(struct domain *d)
      if ( rc )
          goto fail;

+    rc = create_perdomain_mapping(d, SHADOW_CR3_VIRT_START,
+                                  SHADOW_CR3_ENTRIES, NULL, NULL);
+    if ( rc )
+        goto fail;
+
      d->arch.ctxt_switch = &pv_csw;

      d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : 
opt_xpti_domu;
diff --git a/xen/arch/x86/x86_64/asm-offsets.c 
b/xen/arch/x86/x86_64/asm-offsets.c
index 287dac101ad4..ed486607bf15 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -51,6 +51,7 @@ void __dummy__(void)
      OFFSET(UREGS_kernel_sizeof, struct cpu_user_regs, es);
      BLANK();

+    OFFSET(VCPU_id, struct vcpu, vcpu_id);
      OFFSET(VCPU_processor, struct vcpu, processor);
      OFFSET(VCPU_domain, struct vcpu, domain);
      OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8b77d7113bbf..678876a32177 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -165,7 +165,16 @@ restore_all_guest:
          and   %rsi, %rdi
          and   %r9, %rsi
          add   %rcx, %rdi
+
+        /*
+         * The address in the vCPU cr3 is always mapped in the shadow
+         * cr3 virt area.
+         */
+        mov   VCPU_id(%rbx), %rsi
+        shl   $PAGE_SHIFT, %rsi
+        movabs $SHADOW_CR3_VIRT_START, %rcx
          add   %rcx, %rsi
+
          mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
          mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
          mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
> 
> Jan

-- 
Julien Grall

