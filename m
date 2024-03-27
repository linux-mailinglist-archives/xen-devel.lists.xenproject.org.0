Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298388DCCC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698469.1090153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRjz-0005S1-6U; Wed, 27 Mar 2024 11:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698469.1090153; Wed, 27 Mar 2024 11:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRjz-0005PC-3T; Wed, 27 Mar 2024 11:46:47 +0000
Received: by outflank-mailman (input) for mailman id 698469;
 Wed, 27 Mar 2024 11:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpRjx-0005P6-Si
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:46:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee1259e-ec2f-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 12:46:43 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso132500866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:46:43 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a17090775e700b00a4576dd5a8csm5298632ejc.201.2024.03.27.04.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:46:42 -0700 (PDT)
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
X-Inumbo-ID: aee1259e-ec2f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711540003; x=1712144803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYJhOp1HdiZ30o0KUf7gZsyGPQk3iQ3CCRuFDUz34rc=;
        b=F9mKAP7ozOm1vInxxvwSoJVegwR2JqqRm8Gg+Ye8f8XgLfzrrj7rMWl7tGbiEZJrWI
         frOQfgfvf9kFN771Oqc0LkNUOH9cjuYsChL7Jr8q6qdLJ6Nyr0xSNzJllD/tp/VcStAj
         5ZyYJ86fSsnwQCewN+f2eVTMi/EK7e48YN4R6QC/C2cZLxbyS/Zd0kNaEt9oexbAGXhf
         9jA8WPrdPXr8D+yeaQrJ3DlsRTdYXROHKC7i+G3IN/wE9ieCoa9uLWRFTZj6eBn5ObzR
         lNkFnRSV2AKxnPDxS6gL0k8Ksa4LXk5sLGfAOd/3gxn9Ejs4rZqYQWAlWvJr2sOBDT/0
         ZksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540003; x=1712144803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYJhOp1HdiZ30o0KUf7gZsyGPQk3iQ3CCRuFDUz34rc=;
        b=LLgW/QZNGlhA8rzlANXtlJ1+znSQdT+1cTYXpMIdcS5DCVnwd5lGElqnCILSLOzu6/
         IS+Lyc7z4woyo2zzTrGKLGLbkRbABxsFoqBpU/7XQa4NLt0KYGtz8DOqjPp3v6+HLRxC
         JVQ8c47eMh4s4XiOxGmbGCXf8Q+l3REoLnRyQV0nmpX16Md4ZkHZgoiJxOtxq7fKSoGq
         IvimAD5WELRsC1ky9uuWCduRlFaZZInxlWoWM5g3VKeahJox2bBd4fFooySaK1bg0+iQ
         to1M1AJ+oGrsF2SAOeYrY6m29oVtPyB0IZ8cVXr3Ttb04bYysTxsvAB5BeFfiTO9snXv
         jy6w==
X-Forwarded-Encrypted: i=1; AJvYcCWU21hWJLMvJPbUun4i+VXaQOhb0HxYk64ZhAhHeCCSQAeXMDIiECVW3KGEeKucoAP8mWqztMh/IrQFoFztPMae3jaBGfq86O1yT76t5Z0=
X-Gm-Message-State: AOJu0YwRETdsG6yTZmEYQMRwQgHMU8nm71Y8SL5fyae52/PBgm5HvNay
	KX8/oVBgCMFpxOKWTm4mnVpFxMLWjV0erIuwXpTiRwRV7n/OIlmPmC53eRUJlUeEl14W1D2YtC+
	c
X-Google-Smtp-Source: AGHT+IG9y/e3br/wLk0Rx0Yrc9YZCZ9ogzlw5ruUcIzUPkD+ipliq//08GYJYjaMMqKGEpkqTA8eNg==
X-Received: by 2002:a17:906:6a04:b0:a4a:306a:ab9b with SMTP id qw4-20020a1709066a0400b00a4a306aab9bmr4398557ejc.0.1711540003120;
        Wed, 27 Mar 2024 04:46:43 -0700 (PDT)
Message-ID: <a2246242-627a-493b-9cd4-c76b0cb301ee@suse.com>
Date: Wed, 27 Mar 2024 12:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Xen PV CPA W^X violation false-positives
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
References: <20240124165401.35784-1-jandryuk@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240124165401.35784-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.01.24 17:54, Jason Andryuk wrote:
> Xen PV domains show CPA W^X violations like:
> 
> CPA detected W^X violation: 0000000000000064 -> 0000000000000067 range: 0xffff888000010000 - 0xffff888000010fff PFN 10
> WARNING: CPU: 0 PID: 30 at arch/x86/mm/pat/set_memory.c:613 __change_page_attr_set_clr+0x113a/0x11c0
> Modules linked in: xt_physdev xt_MASQUERADE iptable_nat nf_nat nf_conntrack libcrc32c nf_defrag_ipv4 ip_tables x_tables xen_argo(O)
> CPU: 0 PID: 30 Comm: kworker/0:2 Tainted: G           O       6.1.38 #1
> Workqueue: events bpf_prog_free_deferred
> RIP: e030:__change_page_attr_set_clr+0x113a/0x11c0
> Code: 4c 89 f1 4c 89 e2 4c 89 d6 4c 89 8d 70 ff ff ff 4d 8d 86 ff 0f 00 00 48 c7 c7 f0 3c da 81 c6 05 d0 0e 0e 01 01 e8 f6 71 00 00 <0f> 0b 4c 8b 8d 70 ff ff ff e9 2a fd ff ff 48 8b 85 60 ff ff ff 48
> RSP: e02b:ffffc90000367c48 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 000ffffffffef064 RCX: 0000000000000000
> RDX: 0000000000000003 RSI: 00000000fffff7ff RDI: 00000000ffffffff
> RBP: ffffc90000367d48 R08: 0000000000000000 R09: ffffc90000367aa0
> R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000067
> R13: 0000000000000001 R14: ffff888000010000 R15: ffffc90000367d60
> FS:  0000000000000000(0000) GS:ffff88800b800000(0000) knlGS:0000000000000000
> CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fdbaeda01c0 CR3: 0000000004312000 CR4: 0000000000050660
> Call Trace:
>   <TASK>
>   ? show_regs.cold+0x1a/0x1f
>   ? __change_page_attr_set_clr+0x113a/0x11c0
>   ? __warn+0x7b/0xc0
>   ? __change_page_attr_set_clr+0x113a/0x11c0
>   ? report_bug+0x111/0x1a0
>   ? handle_bug+0x4d/0xa0
>   ? exc_invalid_op+0x19/0x70
>   ? asm_exc_invalid_op+0x1b/0x20
>   ? __change_page_attr_set_clr+0x113a/0x11c0
>   ? __change_page_attr_set_clr+0x113a/0x11c0
>   ? debug_smp_processor_id+0x17/0x20
>   ? ___cache_free+0x2e/0x1e0
>   ? _raw_spin_unlock+0x1e/0x40
>   ? __purge_vmap_area_lazy+0x2ea/0x6b0
>   set_direct_map_default_noflush+0x7c/0xa0
>   __vunmap+0x1ac/0x280
>   __vfree+0x1d/0x60
>   vfree+0x27/0x40
>   __bpf_prog_free+0x44/0x50
>   bpf_prog_free_deferred+0x104/0x120
>   process_one_work+0x1ca/0x3d0
>   ? process_one_work+0x3d0/0x3d0
>   worker_thread+0x45/0x3c0
>   ? process_one_work+0x3d0/0x3d0
>   kthread+0xe2/0x110
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork+0x1f/0x30
>   </TASK>
> ---[ end trace 0000000000000000 ]---
> 
> Xen provides a set of page tables that the guest executes out of when it
> starts.  The L1 entries are shared between level2_ident_pgt and
> level2_kernel_pgt, and xen_setup_kernel_pagetable() sets the NX bit in
> the level2_ident_pgt entries.  verify_rwx() only checks the l1 entry and
> reports a false-positive violation.
> 
> Here is a dump of some kernel virtual addresses and the corresponding
> L1 and L2 entries:
> This is the start of the directmap (ident) and they have NX (bit 63) set
> in the PMD.
> ndvm-pv (1): [    0.466778] va=ffff888000000000 pte=0010000000000027 level: 1
> ndvm-pv (1): [    0.466788] va=ffff888000000000 pmd=800000000242c067 level: 2
> Directmap for kernel text:
> ndvm-pv (1): [    0.466795] va=ffff888001000000 pte=0010000001000065 level: 1
> ndvm-pv (1): [    0.466801] va=ffff888001000000 pmd=8000000002434067 level: 2
> ndvm-pv (1): [    0.466807] va=ffff888001010000 pte=0010000001010065 level: 1
> ndvm-pv (1): [    0.466814] va=ffff888001010000 pmd=8000000002434067 level: 2
> The start of the kernel text highmap is unmapped:
> ndvm-pv (1): [    0.466820] va=ffffffff80000000 pte=0000000000000000 level: 3
> ndvm-pv (1): [    0.466826] va=ffffffff80000000 pmd=0000000000000000 level: 3
> Kernel PMD for .text has NX bit clear
> ndvm-pv (1): [    0.466832] va=ffffffff81000000 pte=0010000001000065 level: 1
> ndvm-pv (1): [    0.466838] va=ffffffff81000000 pmd=0000000002434067 level: 2
> Kernel PTE for rodata_end has NX bit set
> ndvm-pv (1): [    0.466846] va=ffffffff81e62000 pte=8010000001e62025 level: 1
> ndvm-pv (1): [    0.466874] va=ffffffff81e62000 pmd=000000000243b067 level: 2
> Directmap of rodata_end
> ndvm-pv (1): [    0.466907] va=ffff888001e62000 pte=8010000001e62025 level: 1
> ndvm-pv (1): [    0.466913] va=ffff888001e62000 pmd=800000000243b067 level: 2
> Directmap of a low RAM address
> ndvm-pv (1): [    0.466920] va=ffff888000010000 pte=0010000000010027 level: 1
> ndvm-pv (1): [    0.466926] va=ffff888000010000 pmd=800000000242c067 level: 2
> Directmap of another RAM address close to but below kernel text
> ndvm-pv (1): [    0.466932] va=ffff88800096c000 pte=001000000096c027 level: 1
> ndvm-pv (1): [    0.466938] va=ffff88800096c000 pmd=8000000002430067 level: 2
> 
> Here are some L2 entries showing the differing NX bits for l2_ident vs.
> l2_kernel while they point at the same L1 addresses
> ndvm-pv (1): [    0.466944]  l2_ident[  0] pmd=800000000242c067
> ndvm-pv (1): [    0.466949]  l2_ident[  1] pmd=800000000242d067
> ndvm-pv (1): [    0.466955]  l2_ident[  8] pmd=8000000002434067
> ndvm-pv (1): [    0.466959]  l2_ident[  9] pmd=8000000002435067
> ndvm-pv (1): [    0.466964]  l2_ident[ 14] pmd=800000000243a067
> ndvm-pv (1): [    0.466969]  l2_ident[ 15] pmd=800000000243b067
> ndvm-pv (1): [    0.466974] l2_kernel[  8] pmd=0000000002434067
> ndvm-pv (1): [    0.466979] l2_kernel[  9] pmd=0000000002435067
> ndvm-pv (1): [    0.466984] l2_kernel[ 14] pmd=000000000243a067
> ndvm-pv (1): [    0.466989] l2_kernel[ 15] pmd=000000000243b067
> 
> One option is to add a fallback check for verify_rwx() to check the PMD
> permissions to silence the warning.  Something like below.  I think it's
> not readily generalizable as it hardcodes checking the PMD.  That works
> for Xen where L1 PTEs are always used, but wouldn't work for Non-Xen.

I don't think this would be a real issue, as it is only Xen PV code setting
the NX bit is PMD entries.

And in case it really becomes an issue, the higher level page tables could be
checked, too.

> The other option would be to duplicate L1 page tables.  Xen PV doesn't
> support large pages, so the kernel highmap can't use large pages.  The
> increased memory would add up though.

Indeed, so I don't think this would be a good idea.

> 
> Regards,
> Jason
> ---
>   arch/x86/mm/pat/set_memory.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index e9b448d1b1b7..904129b411ee 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -641,6 +641,20 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
>   	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
>   		return new;
>   
> +	if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) == _PAGE_RW) {

This if is a little bit strange, as the condition can't ever be false.

I'd rather test "if (npg == 1)" as this is the case where a PMD entry is really
existing, ...

> +		pmd_t *pmd = lookup_pmd_address(start);
> +
> +		if (pmd && pmd_val(*pmd) & _PAGE_NX) {

... removing the need to test for pmd to be not NULL.

> +			pr_debug_once("CPA PMD 0x%016lx NX prevents PTE W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> +				      pmd_flags(*pmd),
> +				      (unsigned long long)pgprot_val(old),
> +				      (unsigned long long)pgprot_val(new),
> +				      start, end, pfn);

I'd scratch that pr_debug(), as it doesn't really help.

> +
> +			return new;
> +		}
> +	}
> +
>   	end = start + npg * PAGE_SIZE - 1;
>   	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
>   		  (unsigned long long)pgprot_val(old),

Jason, do you want to send a V2 with your Signed-off, or would you like me to
try upstreaming the patch?


Juergen

