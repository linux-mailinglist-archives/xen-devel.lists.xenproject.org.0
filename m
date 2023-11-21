Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089F7F339A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638015.994204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TYN-0006Xl-TX; Tue, 21 Nov 2023 16:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638015.994204; Tue, 21 Nov 2023 16:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TYN-0006V7-Qe; Tue, 21 Nov 2023 16:24:47 +0000
Received: by outflank-mailman (input) for mailman id 638015;
 Tue, 21 Nov 2023 16:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5TYL-0006V1-Rc
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:24:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b12783b-888a-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:24:44 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so4067744f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:24:44 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0032f7e832cabsm14814210wrx.90.2023.11.21.08.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:24:44 -0800 (PST)
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
X-Inumbo-ID: 7b12783b-888a-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700583884; x=1701188684; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bqiesDvo4kLuIVNtEPM9rOdv7pmWMXtSj6dc9QiBJtI=;
        b=Newp2b8MZets2nVYEfTJd7nhKROtVYza9HmhuLvyLD9b0od+2Jx0w1bg95vNajkSX1
         SYG5AeqHzkPoR3WKrO17OPZupttyzzF8uErOphOTHIivyrt8s07bHj5y+Ty0/E9hf8D6
         7E1BVeUInLzTVzY0/TQbFOeVdhmf7BlpViurs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583884; x=1701188684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqiesDvo4kLuIVNtEPM9rOdv7pmWMXtSj6dc9QiBJtI=;
        b=v8kjQOhyps/WhLfdCU8hdde7dGX6HXoHrq8Sg/CczGjDMPLINWXb4X3LcUwPmAa2KN
         xphAA+0BCYhXKkI8+PmrBeDvc8RLd1+1bz3qyz5+RE5+rljDcWN0DQ9BqvDlVtShm0HH
         S4Rq8t8A9GJFW5MN3own11B7zAb9p+VuZ46EmQMsHytehfLpHwiOeSZxVCr4fFSsFGmT
         vFfWSkhldTh3kBG3A4HqNhu0fF98qQ7N+yESW86winOrafxIhkN/H9cu3eY9Fw1Lf9Vh
         IZQzq3GchwYsKU6hCCllMGeh0Z30bKEM2iX2EURm47S9XkWYAM+fMVLdIrK+MRsz284G
         8mzw==
X-Gm-Message-State: AOJu0Yz4UUXhh5KTvbaymlpZC5hjl5/5VGCxnzaCWzdKPQsGtYivSyh5
	HIQIU5BPqHAdv6Pbz/KlaxYbZA==
X-Google-Smtp-Source: AGHT+IFLYJ6y8uS0p/tqLG+SyGRDWt6F7JKryU+PimKYbUKVdfi4me1qTY/MNAFO2QlSy1KMigNjJw==
X-Received: by 2002:a05:6000:1acc:b0:331:762e:6b0c with SMTP id i12-20020a0560001acc00b00331762e6b0cmr7630771wry.19.1700583884283;
        Tue, 21 Nov 2023 08:24:44 -0800 (PST)
Date: Tue, 21 Nov 2023 17:24:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Message-ID: <ZVzZy-KYgdAsqRE3@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>

On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
> ... or we fail to enable the functionality on the BSP for other reasons.
> The only place where hardware announcing the feature is recorded is the
> raw CPU policy/featureset.
> 
> Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2543,6 +2543,7 @@ const struct hvm_function_table * __init
>  
>      if ( _svm_cpu_up(true) )
>      {
> +        setup_clear_cpu_cap(X86_FEATURE_SVM);
>          printk("SVM: failed to initialise.\n");
>          return NULL;
>      }
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
>  
>      if ( !ret )
>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> +    else
> +    {
> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
> +
> +        /*
> +         * _vmx_vcpu_up() may have made it past feature identification.
> +         * Make sure all dependent features are off as well.
> +         */
> +        vmx_basic_msr              = 0;
> +        vmx_pin_based_exec_control = 0;
> +        vmx_cpu_based_exec_control = 0;
> +        vmx_secondary_exec_control = 0;
> +        vmx_vmexit_control         = 0;
> +        vmx_vmentry_control        = 0;
> +        vmx_ept_vpid_cap           = 0;
> +        vmx_vmfunc                 = 0;

Are there really any usages of those variables if VMX is disabled in
CPUID?

Thanks, Roger.

