Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39261A9C7B3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967754.1357479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HJQ-00063G-O3; Fri, 25 Apr 2025 11:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967754.1357479; Fri, 25 Apr 2025 11:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HJQ-00060J-Kd; Fri, 25 Apr 2025 11:33:44 +0000
Received: by outflank-mailman (input) for mailman id 967754;
 Fri, 25 Apr 2025 11:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snHQ=XL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u8HJP-00060B-Li
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:33:43 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23ccafed-21c9-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 13:33:42 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f728aeedacso759534a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:33:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7011fbfb2sm1159402a12.3.2025.04.25.04.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 04:33:41 -0700 (PDT)
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
X-Inumbo-ID: 23ccafed-21c9-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745580822; x=1746185622; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lLm29aqWt0rWLPledrWyLIqIdL9SmfRnysXh5mS0LM=;
        b=hScnNWqjoxKwPSe15VcB34GBpOC6YJhyzFbzbWXnWi8x78225AdN+Tm6PApr0m9LBN
         IVv8sLYHWa87Zr/8qwFgNcNOy3/kBIvpnaZysN0GMo/wcRtq7VbFzMAMcVYaHL1Clq3J
         8d2y6Dc32xmglSLUxiefNGyT3mFyMenVE6GOZgVQiNv6e/DGOzz47PGfNz7CuDDIcdMl
         qYJ/4fwDLtkjuAlA0JP2wY7Yw5ERoBwj6Hkg7EJleFjQJ4jGQLRffgJOMVI9jSeHpT6d
         C1dA3YGrcjgbxn+pNQ4eEcSbx7XFyerLhjXKu2LmuI9ZS+FGgFRBfc4HNFQKp6J/WjNj
         hFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580822; x=1746185622;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lLm29aqWt0rWLPledrWyLIqIdL9SmfRnysXh5mS0LM=;
        b=GbQmjkazm00V9exYt9wYW8Kqw7CJ+7/qWrHuR6gGw/TM1arh1+7GeO06rTsf62Pn9Z
         qvfLpIb3zf+qkcPyli45fFuShkH4IptyeICB3TGtVt9aVr7F46tTfgRnJEvfn8wY6gHj
         hKQuY+CIRs1judC05tloCv+O0fleqz5z6pDj6OBzeGhGdCkVnOne69NLduMtoax17WoY
         hn1CuxUP/Uou6IIaxEdVQSSOH4+mt8D+h67PImYNlyyIa29OtezAR4KvxcBDpsJbMijd
         PV6w5eYz1NAtN2CuqE6HrO2GrwlCvAERpppGsNwKfJNq7aUKUNq5KHLyMolfcQWK9qTf
         FUXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDX2vl3ssHDnsnv88rGJAKh6d4jPdDF/HT11k1v7MtgIfsA5fviowdCEJ+EN+stNgFgkpjHweR71E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGrlXOhjSBHLVusjKjorscmKYWncnAzRjUNFWZ8MBuh8xGO2+e
	+wxRVfsc/XMlnlqptFhfOfCc8djgwJlxFUC2Jxszany9Jn/8fZHx
X-Gm-Gg: ASbGnctR2vxJvWapZhCDkwsxNt3A0/fEctQWp7Yt4OupGbosjgZfXcg3+qThJNvB7wS
	ZnvMFFlradVmp+dMmcP1eedP60WEUh/XUzKrShxPdDDIDCREugUYMOhmxP9F0JQJjp/YNZuAP9p
	hSg0G9OjnZE85aQeTiYGNClnbhuyL+FDlqEbqEmQK9yS7XJjeoYgPOpqNIKq/5NH14qTAK14MRd
	Lr5tZ94ZYqkCk/RbbRiHOwPWMTdsYuDr+n0xJ5Qnn7RhGvZxrQRoZF6J2z/P56QN7HJU4CfK3ig
	0OoU/JSxQiJHiwMh72HoqOxv/Ns8SL50o5jDPwSsr3K1VS6Q2Xpacukis1URl2QVMSsSXEL2qvA
	sbmdP8IPwf65SwnKp
X-Google-Smtp-Source: AGHT+IFRFg34y/gA5gkIRukpwnkZSkPsgTj+556Vz9IEGGH4kjvQ43UVh3ViDBeeW9rVUR8qZ3qbAA==
X-Received: by 2002:a05:6402:5009:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5f722577ec8mr1259665a12.1.1745580821461;
        Fri, 25 Apr 2025 04:33:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Zgr0ogap5EvgzVoR73L0BTzY"
Message-ID: <123a6576-c56c-40f5-b87d-c84248d46fac@gmail.com>
Date: Fri, 25 Apr 2025 13:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen/mm: Switch some APIs over to pte_attr_t
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250425112415.245585-3-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------Zgr0ogap5EvgzVoR73L0BTzY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/25/25 1:24 PM, Andrew Cooper wrote:
> From: Shawn Anastasio<sanastasio@raptorengineering.com>
>
> Several APIs take an architecture-dependent set of flags in an unsigned int,
> but this needs to be a wider type to support PPC.
>
> The new type pte_attr_t has been introduced for this purpose, so switch to it
> in map_pages_to_xen(), __vmap() and modify_xen_mappings{,_lite}().
>
> No functional change.
>
> Suggested-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Signed-off-by: Shawn Anastasio<sanastasio@raptorengineering.com>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> ---
>   xen/arch/arm/mmu/pt.c   | 4 ++--
>   xen/arch/ppc/mm-radix.c | 2 +-
>   xen/arch/riscv/pt.c     | 2 +-

As I wrote here, probably, as a part of this patch we also wants to do the following changes:
   https://lore.kernel.org/xen-devel/192683d3-8777-45c2-b8a8-546bf171a7aa@gmail.com/T/#u

I'm okay with sending the mentioned changes in the link as a separate patch when I will introduce
Svpmbt extension which uses 61 and 62 bits. Let me know if you are okay with that?

If you think that these changes should be part of this patch then something similar for Arm should
be done too now.

~ Oleksii

>   xen/arch/x86/mm.c       | 6 +++---
>   xen/common/efi/boot.c   | 4 ++--
>   xen/common/vmap.c       | 2 +-
>   xen/include/xen/mm.h    | 7 ++++---
>   xen/include/xen/vmap.h  | 3 ++-
>   8 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index 11cb1c66dac8..4726e713efd3 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -696,7 +696,7 @@ static int xen_pt_update(unsigned long virt,
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       return xen_pt_update(virt, mfn, nr_mfns, flags);
>   }
> @@ -714,7 +714,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>   }
>   
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
> index 9a00ae416af0..d5385ec9dd4b 100644
> --- a/xen/arch/ppc/mm-radix.c
> +++ b/xen/arch/ppc/mm-radix.c
> @@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       BUG_ON("unimplemented");
>   }
> diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
> index 857619d48df1..918b1b91abde 100644
> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -504,7 +504,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>   int map_pages_to_xen(unsigned long virt,
>                        mfn_t mfn,
>                        unsigned long nr_mfns,
> -                     unsigned int flags)
> +                     pte_attr_t flags)
>   {
>       /*
>        * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 1cf236516789..0e6c766be4aa 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5442,7 +5442,7 @@ int map_pages_to_xen(
>       unsigned long virt,
>       mfn_t mfn,
>       unsigned long nr_mfns,
> -    unsigned int flags)
> +    pte_attr_t flags)
>   {
>       bool locking = system_state > SYS_STATE_boot;
>       l3_pgentry_t *pl3e = NULL, ol3e;
> @@ -5860,7 +5860,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>    *
>    * It is an error to call with present flags over an unpopulated range.
>    */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       bool locking = system_state > SYS_STATE_boot;
>       l3_pgentry_t *pl3e = NULL;
> @@ -6156,7 +6156,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>    * the non-inclusive boundary will be updated.
>    */
>   void init_or_livepatch modify_xen_mappings_lite(
> -    unsigned long s, unsigned long e, unsigned int nf)
> +    unsigned long s, unsigned long e, pte_attr_t nf)
>   {
>       unsigned long v = s, fm, flags;
>   
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 143b5681ba92..e39fbc3529c4 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1676,7 +1676,7 @@ void __init efi_init_memory(void)
>       struct rt_extra {
>           struct rt_extra *next;
>           unsigned long smfn, emfn;
> -        unsigned int prot;
> +        pte_attr_t prot;
>       } *extra, *extra_head = NULL;
>   
>       free_ebmalloc_unused_mem();
> @@ -1691,7 +1691,7 @@ void __init efi_init_memory(void)
>           EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>           u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
>           unsigned long smfn, emfn;
> -        unsigned int prot = PAGE_HYPERVISOR_RWX;
> +        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
>           paddr_t mem_base;
>           unsigned long mem_npages;
>   
> diff --git a/xen/common/vmap.c b/xen/common/vmap.c
> index 47225fecc067..d6991421f3f7 100644
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -222,7 +222,7 @@ static void vm_free(const void *va)
>   }
>   
>   void *__vmap(const mfn_t *mfn, unsigned int granularity,
> -             unsigned int nr, unsigned int align, unsigned int flags,
> +             unsigned int nr, unsigned int align, pte_attr_t flags,
>                enum vmap_region type)
>   {
>       void *va = vm_alloc(nr * granularity, align, type);
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index ae1c48a61545..e89942b87d1e 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -64,6 +64,7 @@
>   #include <xen/bug.h>
>   #include <xen/compiler.h>
>   #include <xen/mm-frame.h>
> +#include <xen/mm-types.h>
>   #include <xen/types.h>
>   #include <xen/list.h>
>   #include <xen/spinlock.h>
> @@ -113,11 +114,11 @@ int map_pages_to_xen(
>       unsigned long virt,
>       mfn_t mfn,
>       unsigned long nr_mfns,
> -    unsigned int flags);
> +    pte_attr_t flags);
>   /* Alter the permissions of a range of Xen virtual address space. */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
>   void modify_xen_mappings_lite(unsigned long s, unsigned long e,
> -                              unsigned int nf);
> +                              pte_attr_t nf);
>   int destroy_xen_mappings(unsigned long s, unsigned long e);
>   /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>   mfn_t xen_map_to_mfn(unsigned long va);
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 26c831757a11..327a2597826d 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -9,6 +9,7 @@
>   #define __XEN_VMAP_H__
>   
>   #include <xen/mm-frame.h>
> +#include <xen/mm-types.h>
>   #include <xen/page-size.h>
>   
>   /* Identifiers for the linear ranges tracked by vmap */
> @@ -57,7 +58,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
>    * @return Pointer to the mapped area on success; NULL otherwise.
>    */
>   void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> -             unsigned int align, unsigned int flags, enum vmap_region type);
> +             unsigned int align, pte_attr_t flags, enum vmap_region type);
>   
>   /*
>    * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
--------------Zgr0ogap5EvgzVoR73L0BTzY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/25/25 1:24 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">From: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>

Several APIs take an architecture-dependent set of flags in an unsigned int,
but this needs to be a wider type to support PPC.

The new type pte_attr_t has been introduced for this purpose, so switch to it
in map_pages_to_xen(), __vmap() and modify_xen_mappings{,_lite}().

No functional change.

Suggested-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
---
 xen/arch/arm/mmu/pt.c   | 4 ++--
 xen/arch/ppc/mm-radix.c | 2 +-
 xen/arch/riscv/pt.c     | 2 +-</pre>
    </blockquote>
    <pre>As I wrote here, probably, as a part of this patch we also wants to do the following changes:
  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/192683d3-8777-45c2-b8a8-546bf171a7aa@gmail.com/T/#u">https://lore.kernel.org/xen-devel/192683d3-8777-45c2-b8a8-546bf171a7aa@gmail.com/T/#u</a>

I'm okay with sending the mentioned changes in the link as a separate patch when I will introduce
Svpmbt extension which uses 61 and 62 bits. Let me know if you are okay with that?

If you think that these changes should be part of this patch then something similar for Arm should
be done too now.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-3-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/x86/mm.c       | 6 +++---
 xen/common/efi/boot.c   | 4 ++--
 xen/common/vmap.c       | 2 +-
 xen/include/xen/mm.h    | 7 ++++---
 xen/include/xen/vmap.h  | 3 ++-
 8 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 11cb1c66dac8..4726e713efd3 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -696,7 +696,7 @@ static int xen_pt_update(unsigned long virt,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
@@ -714,7 +714,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return xen_pt_update(s, INVALID_MFN, (e - s) &gt;&gt; PAGE_SHIFT, 0);
 }
 
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 9a00ae416af0..d5385ec9dd4b 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -265,7 +265,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 857619d48df1..918b1b91abde 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -504,7 +504,7 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
-                     unsigned int flags)
+                     pte_attr_t flags)
 {
     /*
      * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1cf236516789..0e6c766be4aa 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5442,7 +5442,7 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags)
+    pte_attr_t flags)
 {
     bool locking = system_state &gt; SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL, ol3e;
@@ -5860,7 +5860,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  *
  * It is an error to call with present flags over an unpopulated range.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf)
 {
     bool locking = system_state &gt; SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -6156,7 +6156,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  * the non-inclusive boundary will be updated.
  */
 void init_or_livepatch modify_xen_mappings_lite(
-    unsigned long s, unsigned long e, unsigned int nf)
+    unsigned long s, unsigned long e, pte_attr_t nf)
 {
     unsigned long v = s, fm, flags;
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 143b5681ba92..e39fbc3529c4 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1676,7 +1676,7 @@ void __init efi_init_memory(void)
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
-        unsigned int prot;
+        pte_attr_t prot;
     } *extra, *extra_head = NULL;
 
     free_ebmalloc_unused_mem();
@@ -1691,7 +1691,7 @@ void __init efi_init_memory(void)
         EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
         u64 len = desc-&gt;NumberOfPages &lt;&lt; EFI_PAGE_SHIFT;
         unsigned long smfn, emfn;
-        unsigned int prot = PAGE_HYPERVISOR_RWX;
+        pte_attr_t prot = PAGE_HYPERVISOR_RWX;
         paddr_t mem_base;
         unsigned long mem_npages;
 
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index 47225fecc067..d6991421f3f7 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -222,7 +222,7 @@ static void vm_free(const void *va)
 }
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity,
-             unsigned int nr, unsigned int align, unsigned int flags,
+             unsigned int nr, unsigned int align, pte_attr_t flags,
              enum vmap_region type)
 {
     void *va = vm_alloc(nr * granularity, align, type);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index ae1c48a61545..e89942b87d1e 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -64,6 +64,7 @@
 #include &lt;xen/bug.h&gt;
 #include &lt;xen/compiler.h&gt;
 #include &lt;xen/mm-frame.h&gt;
+#include &lt;xen/mm-types.h&gt;
 #include &lt;xen/types.h&gt;
 #include &lt;xen/list.h&gt;
 #include &lt;xen/spinlock.h&gt;
@@ -113,11 +114,11 @@ int map_pages_to_xen(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags);
+    pte_attr_t flags);
 /* Alter the permissions of a range of Xen virtual address space. */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
+int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);
 void modify_xen_mappings_lite(unsigned long s, unsigned long e,
-                              unsigned int nf);
+                              pte_attr_t nf);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 26c831757a11..327a2597826d 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -9,6 +9,7 @@
 #define __XEN_VMAP_H__
 
 #include &lt;xen/mm-frame.h&gt;
+#include &lt;xen/mm-types.h&gt;
 #include &lt;xen/page-size.h&gt;
 
 /* Identifiers for the linear ranges tracked by vmap */
@@ -57,7 +58,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
  * @return Pointer to the mapped area on success; NULL otherwise.
  */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region type);
+             unsigned int align, pte_attr_t flags, enum vmap_region type);
 
 /*
  * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
</pre>
    </blockquote>
  </body>
</html>

--------------Zgr0ogap5EvgzVoR73L0BTzY--

