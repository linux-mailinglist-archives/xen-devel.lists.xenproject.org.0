Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3268A1E54
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704146.1100334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzDk-0001R4-0C; Thu, 11 Apr 2024 18:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704146.1100334; Thu, 11 Apr 2024 18:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzDj-0001OV-TT; Thu, 11 Apr 2024 18:32:23 +0000
Received: by outflank-mailman (input) for mailman id 704146;
 Thu, 11 Apr 2024 18:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruzDi-0001O6-25
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:32:22 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d42a66b2-f831-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 20:32:20 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c60e308067so20476b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 11:32:19 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac84293000000b00430ea220b32sm1210660qtl.71.2024.04.11.11.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 11:32:17 -0700 (PDT)
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
X-Inumbo-ID: d42a66b2-f831-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712860338; x=1713465138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xOUyJBpvtd3S+XB9J0vZVLH/aIBOJc7oYN0Qi3Iji78=;
        b=FCZbOjO7YqrjrPbmdx8yyznP+XpDBvAuKSYTOKOW47waPAA20CScErYD/90BW9dcKe
         owrNowLRn5Q1o7SMBUCZAO61+Q1/YMT8MFiIruNXxTxK8AaNOvJX9CXyRpzuPw/FG4Jb
         1mmj0MZG3gX8BGj6iNFVpE8Cs39u5Yj5Fx1Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712860338; x=1713465138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOUyJBpvtd3S+XB9J0vZVLH/aIBOJc7oYN0Qi3Iji78=;
        b=oVLe+SMKnNiu6OT7238Pdkjd3cAwn5wQxycweaElynihGZibYrAEzYF3ps0/FRXbmO
         L7/fnBNSwm6BR6q8Ec8VE+cG4yn3UcE4lnzaR4dn08IW168kM2JjobR2jFwCYja3eD4b
         KzWyrgdeS0L3sfSqAxyrd9PODqGZW2NKiwy/QFWpYUaSyekheP9dU/kdu+2LgBRz77n0
         Cai/TdlDZijHge68s/6BHmpF5tHS6vbLoxHjVa4OXaaHBS+b1Dtv4FfXDx6eCE7gKQoX
         LQhuBOJ1pHYDVn7Vycns5ZRk/ek18bhM6nCK3m21uhlfe9kJJORlnF+PfRYGNZ9r051F
         4juA==
X-Forwarded-Encrypted: i=1; AJvYcCUinaBMmPJ5VrWExxLjZKDA4nxjU/i1UxR3WpNNZceyTu3FcyfQx5uQZbh9hERaaneUakBZC8SrEq26gZTfeL9KvhOaCsOhBRcaT39fgro=
X-Gm-Message-State: AOJu0Yzlgk8KohKCHQJIP/ndTRelMWVtiFnGqUIb9uGYTAEQlwSx11AD
	qdr3xjAAyriBlTVjMbb7eYcWmPsHcmIc2Rnv38RpR5eKVFI7lz1erW0jb/Qrh10=
X-Google-Smtp-Source: AGHT+IFMiRGWJhDMEHPE+BGY8FJFGuUPUiVJEtqw0GVRifAabQPwCsRhAc0UMtuiqwKfU3X6ZClO0g==
X-Received: by 2002:a05:6808:2382:b0:3c5:fb64:1573 with SMTP id bp2-20020a056808238200b003c5fb641573mr581672oib.27.1712860338564;
        Thu, 11 Apr 2024 11:32:18 -0700 (PDT)
Message-ID: <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com>
Date: Thu, 11 Apr 2024 19:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/2] Implemented AMD SEV discovery and enabling.
To: Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
 <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2024 4:36 pm, Andrei Semenov wrote:
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index ab92333673..a5903613f0 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
>  	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
>  }
>  
> +#ifdef CONFIG_HVM
> +static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
> +{
> +	unsigned int  eax, ebx, ecx, edx;
> +	uint64_t syscfg;
> +
> +	if (!smp_processor_id()) {

c == &boot_cpu_info.

> +
> +		cpuid_count(0x80000000,0,&eax, &ebx, &ecx, &edx);
> +
> +		if (eax <  0x8000001f)
> +			return;

Max leaf is already collected.  c->extended_cpuid_level


> +
> +		cpuid_count(0x8000001f,0,&eax, &ebx, &ecx, &edx);
> +
> +		if (eax & 0x1)
> +			setup_force_cpu_cap(X86_FEATURE_SME);
> +
> +		if (eax & 0x2) {
> +			setup_force_cpu_cap(X86_FEATURE_SEV);
> +			max_sev_asid = ecx;
> +			min_sev_asid = edx;
> +		}
> +
> +		if (eax & 0x3)
> +			pte_c_bit_mask = 1UL << (ebx & 0x3f);

This is decoding the main SEV feature leaf, but outside of normal
mechanisms.

I've got half a mind to brute-force through the remaining work to
un-screw our boot sequence order, and express this in a cpu-policy
straight away.  This is wanted for the SVM leaf info too.

Leave it with me for a bit.


> +	}
> +
> +	if (!(cpu_has_sme || cpu_has_sev))
> +		return;
> +
> +	if (!smp_processor_id()) {
> +		if (cpu_has_sev)
> +			printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
> +			min_sev_asid, max_sev_asid);

Why do we have a min as well as a max?  Isn't min always 1?

> +	}
> +
> +	rdmsrl(MSR_K8_SYSCFG, syscfg);
> +
> +	if (syscfg & SYSCFG_MEM_ENCRYPT) {
> +		return;
> +	}
> +
> +	syscfg |= SYSCFG_MEM_ENCRYPT;
> +	wrmsrl(MSR_K8_SYSCFG, syscfg);
> +}
> +#endif
> +
>  static void cf_check init_amd(struct cpuinfo_x86 *c)
>  {
>  	u32 l, h;
> @@ -1305,6 +1354,10 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	check_syscfg_dram_mod_en();
>  
>  	amd_log_freq(c);
> +
> +#ifdef CONFIG_HVM
> +	amd_enable_mem_encrypt(c);
> +#endif

I think we want to drop the CONFIG_HVM here.

Memory encryption is an all-or-nothing thing.  If it's active, it
affects all pagetables that Xen controls, even dom0's.  And we likely do
want get to the point of Xen running on encrypted mappings even if dom0
can't operate it very nicely.

Thoughts?

>  }
>  
>  const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
> index 760d2954da..9773d539ef 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -6,3 +6,4 @@ obj-y += nestedsvm.o
>  obj-y += svm.o
>  obj-y += svmdebug.o
>  obj-y += vmcb.o
> +obj-y += sev.o

Please keep this sorted by object file name.

> diff --git a/xen/arch/x86/hvm/svm/sev.c b/xen/arch/x86/hvm/svm/sev.c
> new file mode 100644
> index 0000000000..336fad25f5
> --- /dev/null
> +++ b/xen/arch/x86/hvm/svm/sev.c
> @@ -0,0 +1,4 @@
> +#include <asm/sev.h>
> +uint64_t __read_mostly pte_c_bit_mask;
> +unsigned int __read_mostly min_sev_asid;
> +unsigned int __read_mostly max_sev_asid;

Several things.  All new files should come with an SPDX tag.  Unless you
have other constraints, GPL-2.0-only is preferred.  There also wants to
be at least a oneline summary of what's going on here.

All these variables look like they should be __ro_after_init.  However,
it's rather hard to judge, given no users yet.

pte_c_bit_mask may want to be an intpte_t rather than uint64_t.

~Andrew

