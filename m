Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4A7F8624
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 23:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640964.999764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6efN-0006lC-JP; Fri, 24 Nov 2023 22:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640964.999764; Fri, 24 Nov 2023 22:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6efN-0006i3-G1; Fri, 24 Nov 2023 22:28:53 +0000
Received: by outflank-mailman (input) for mailman id 640964;
 Fri, 24 Nov 2023 22:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Spf=HF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6efL-0006hx-S1
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 22:28:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7068a01-8b18-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 23:28:50 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b27726369so16705155e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 14:28:50 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040b3807ec38sm4861984wmb.33.2023.11.24.14.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 14:28:49 -0800 (PST)
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
X-Inumbo-ID: d7068a01-8b18-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700864929; x=1701469729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jigi7JLBGC52EdYWf5218yQYyxx3D5XldiBSdv1Xus=;
        b=g085WizITxZJodH2nqYugouguEGGi5I7fw03rMn/rXLQ18VwXk1/OfjDp3Wrva67om
         VnFI4js7R0lWKTlAq3Fjmt0WL/Bm5DodkKgHZA9L8aVIrEzWwGod8wXHvKMzLBkOv2JI
         jRi/2sh718Xl+jiX6O9qcvg1Lnx/yuDw7pzeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700864929; x=1701469729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jigi7JLBGC52EdYWf5218yQYyxx3D5XldiBSdv1Xus=;
        b=i/kfdzymE6bUDG5TjaH9/1ApFoNW2rLFJRC6zRhZdzExuwMb4zSfqlI/4u8XRaYk+T
         zS5FicPRUUhQHJsJQJFtrohwcEGixpG6KGycaBx2DF/pi0pgEPO3e4BVWyZv85oanAyc
         W9a/gVthBcuD2mqMUx4n4gN/Xh1jHWnLQFm/QUzj/a/uB5Z22MR83dwH/mndrkZImE25
         a6ctjfSMn8KtYxQyo/OB/yW9k7fZKYV0sYFz32BtiNAagLewdm5Ot90VY1uaKOd/wL4s
         J+1vFx7rNC9nF+5e7plQOS8rTKX7pE2pn7xSHkgXjSUszs+QcDQFYZse7EgSgJYGW7nU
         I2eA==
X-Gm-Message-State: AOJu0YwqTePp70b8EDQLDcvl+vlovlHb84t+qKYzhDVIlFvPUjlWCBSE
	DRuBTC0HsKRzotM8f+B2wQrVow==
X-Google-Smtp-Source: AGHT+IHIDQhvJwBIomk0XHW25kwumr6iS/6gcwSs8ezMoKWIbDqwqK1cmtSW0pL9srye/2HMsQv2AQ==
X-Received: by 2002:a05:600c:1f82:b0:408:364e:34a2 with SMTP id je2-20020a05600c1f8200b00408364e34a2mr3700206wmb.10.1700864929359;
        Fri, 24 Nov 2023 14:28:49 -0800 (PST)
Message-ID: <c7e50f7f-690e-4402-a873-1534d01c6434@citrix.com>
Date: Fri, 24 Nov 2023 22:28:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <8112f1f9-3e3a-4839-9124-9adb87f82c29@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8112f1f9-3e3a-4839-9124-9adb87f82c29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/11/2023 8:39 am, Jan Beulich wrote:
> __init{const,data}_cf_clobber can have an effect only for pointers
> actually populated in the respective tables. While not the case for SVM
> right now, VMX installs a number of pointers only under certain
> conditions. Hence the respective functions would have their ENDBR purged
> only when those conditions are met. Invoke "pruning" functions after
> having copied the respective tables, for them to install any "missing"
> pointers.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

In theory Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but see
later.

I have to admit that I'd overlooked this point when putting together
__init{}_cf_clobber originally.  Then again, I did have more urgent
things on my mind at the time.

> ---
> This is largely cosmetic for present hardware, which when supporting
> CET-IBT likely also supports all of the advanced VMX features for which
> hook pointers are installed conditionally. The only case this would make
> a difference there is when use of respective features was suppressed via
> command line option (where available). For future hooks it may end up
> relevant even by default, and it also would be if AMD started supporting
> CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
> continues to default to off.
>
> Originally I had meant to put the SVM and VMX functions in presmp-
> initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
> before hvm/hvm.o. And I don't think I want to fiddle with link order
> here.

An alternative is the form I used for microcode, where start_{vmx,svm}()
fills in fns, and doesn't have to fill in all hooks.

That will be more amenable to Kconfig-ing generally, and will probably
be less fragile to getting forgotten.

> ---
> v2: Use cpu_has_xen_ibt in prune_{svm,vmx}().
>
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
>      else if ( cpu_has_svm )
>          fns = start_svm();
>  
> +    if ( fns )
> +        hvm_funcs = *fns;
> +
> +    prune_vmx();
> +    prune_svm();
> +
>      if ( fns == NULL )
>          return 0;
>  
> -    hvm_funcs = *fns;
>      hvm_enabled = 1;
>  
>      printk("HVM: %s enabled\n", fns->name);
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
>      return &svm_function_table;
>  }
>  
> +void __init prune_svm(void)
> +{
> +    /*
> +     * Now that svm_function_table was copied, populate all function pointers
> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> +     * much of an effect as possible.
> +     */
> +    if ( !cpu_has_xen_ibt )
> +        return;
> +
> +    /* Nothing at present. */
> +}
> +
>  void asmlinkage svm_vmexit_handler(void)
>  {
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3033,6 +3033,30 @@ const struct hvm_function_table * __init
>      return &vmx_function_table;
>  }
>  
> +void __init prune_vmx(void)
> +{
> +    /*
> +     * Now that vmx_function_table was copied, populate all function pointers
> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> +     * much of an effect as possible.
> +     */
> +    if ( !cpu_has_xen_ibt )
> +        return;
> +
> +    vmx_function_table.set_descriptor_access_exiting =
> +        vmx_set_descriptor_access_exiting;
> +
> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
> +    vmx_function_table.process_isr            = vmx_process_isr;
> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
> +
> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
> +
> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
> +    vmx_function_table.test_pir            = vmx_test_pir;

That said...

This (the hooks being conditional in the first place) is bogus to begin
with.  Posted interrupts (or not) are a per-VM property even if we don't
wire this up properly yet.  It will be forced to be done properly in
order to support nested virt, as L0 Xen *must* comply with the settings
chosen by the L1 hypervisor.

So the choice to use the hooks will have to come from per-vCPU state,
and not from the conditional-ness of them.

Any chance I can talk you into instead making the hooks unconditional? 
If not, someone (George was volunteering) is going to have to undo this
in fairly short order.

~Andrew

