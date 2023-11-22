Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F67F4340
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638640.995439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kA7-0005Xl-Ne; Wed, 22 Nov 2023 10:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638640.995439; Wed, 22 Nov 2023 10:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5kA7-0005UM-KN; Wed, 22 Nov 2023 10:08:51 +0000
Received: by outflank-mailman (input) for mailman id 638640;
 Wed, 22 Nov 2023 10:08:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5kA6-0005P7-R3
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:08:50 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21dc6033-891f-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 11:08:50 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507b9408c61so9068298e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 02:08:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4004000000b003316b3d69b3sm15906855wrp.46.2023.11.22.02.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 02:08:49 -0800 (PST)
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
X-Inumbo-ID: 21dc6033-891f-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700647729; x=1701252529; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5ri/afd9l7K9gJ4ID7RYwGNxuD67yELjRyPBNv+Ryg=;
        b=P3dngzCvqXDv6mv0vZoWudg7YzNJFO17wXbPFB6xKbOULIhk58Ux0HjObzyPl8h/FT
         ojtCdMQcimd2nQfCAEhfc2cRvsyb6b76hCgsvMvbgxReCkxeXOtOpgH5tndBgt7ULlq3
         9HdIadB9r5fXjoDV7WaFho8IKocpFqX1/ZgJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647729; x=1701252529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5ri/afd9l7K9gJ4ID7RYwGNxuD67yELjRyPBNv+Ryg=;
        b=CwXnExzaowPmdZ2wQuPcJC6Ok8SX0fc/zi2PZ3ijuxeQRWeGJROq40xza5ewpdh+JC
         xUnbsO0ODJeo1NbE0RI9LJZZu5VqrwZBd2MwNCxZmIlY/h/1qnYNM+Dxr72hrC7Djoo9
         LXVti/pPUiQZulFKTi9LcFc44upcdQ32tikSto0a5dh2e8IRzUiP2lRgdcVxaAspBU2z
         5kgCknVCby05oRW7bgdClvWW2vX+VvJBH6q1gUzUvdbUQVfDVL9VI6RgsM3j2DtpJby7
         XiAiIiRo7WPGGin/9TGgdK9WAjMFxunz6kCwpyClEB9MbTLA7SHbiMEVeo1o799cEL1X
         /Grw==
X-Gm-Message-State: AOJu0YyKOQ56uBOoa1L+isnpPDLllXkYmwQoOaP90ikvyJ/buqIroi2v
	mZYykgOv/ijTYZBvZ6zVVcjerw==
X-Google-Smtp-Source: AGHT+IGs0am0dOuYiyug+92WeHnWkaclLsIWIkKm/ld8+mW2dF3g74VGZrmS5nz6izzEB6INXm3OMg==
X-Received: by 2002:ac2:54a4:0:b0:509:f45c:fae6 with SMTP id w4-20020ac254a4000000b00509f45cfae6mr1395138lfk.10.1700647729507;
        Wed, 22 Nov 2023 02:08:49 -0800 (PST)
Date: Wed, 22 Nov 2023 11:08:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <ZV3TL7BtSxC-sv7z@macbook>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <40585213-99ac-43b4-9432-03d739ec452c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <40585213-99ac-43b4-9432-03d739ec452c@suse.com>

On Thu, Nov 16, 2023 at 02:33:14PM +0100, Jan Beulich wrote:
> __init{const,data}_cf_clobber can have an effect only for pointers
> actually populated in the respective tables. While not the case for SVM
> right now, VMX installs a number of pointers only under certain
> conditions. Hence the respective functions would have their ENDBR purged
> only when those conditions are met. Invoke "pruning" functions after
> having copied the respective tables, for them to install any "missing"
> pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )

Shouldn't this better use cpu_has_xen_ibt?

Otherwise the clobbering done in _apply_alternatives() won't be
engaged, so it's pointless to set the extra fields.

> +        return;
> +
> +    /* Nothing at present. */
> +}
> +
>  void svm_vmexit_handler(void)
>  {
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
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
> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
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

Hm, I find this quite fragile, as it's easy to add a new handler
without realizing that addition here might also be required.

I don't really have good ideas about how to handle this, unless we
populate unused handlers with some poison and loop over the structure
as an array of pointers and choke on finding one of them pointing to
NULL.

Thanks, Roger.

