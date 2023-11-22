Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0847F4008
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638503.995096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iVX-0006Kb-8s; Wed, 22 Nov 2023 08:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638503.995096; Wed, 22 Nov 2023 08:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iVX-0006IP-64; Wed, 22 Nov 2023 08:22:51 +0000
Received: by outflank-mailman (input) for mailman id 638503;
 Wed, 22 Nov 2023 08:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5iVV-0006IG-IE
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:22:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f85efa-8910-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:22:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b2c9ee8ecso7743915e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 00:22:46 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e1-20020adff341000000b0032f79e55eb8sm16366242wrp.16.2023.11.22.00.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 00:22:45 -0800 (PST)
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
X-Inumbo-ID: 50f85efa-8910-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700641366; x=1701246166; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YFKNBjfD/PkQhA9VIQbKBAC9DnXe1BmDgX7SOX2CKU=;
        b=YoLIUsltcEUkswFXOLvThGwOSRnIUBmmYHRAaUs4lJSQVAkZBBes41U8gB6kIkEuIx
         WcU26S2VD0u6xzrVy/JglivovlYBeQYwLgWL8rdF2emriLVM2irykKOiU3AEEfcQW97q
         xIRElUlBCe6JajxmzSpR35EwJDJ8AZEYwUyds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641366; x=1701246166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YFKNBjfD/PkQhA9VIQbKBAC9DnXe1BmDgX7SOX2CKU=;
        b=dV6UUDewu+ThQpSPwH/6EmkOwiJYuYtqjKXqpioYdJqiRarrTZALYx1U8x9KzM1RAs
         rxZEVWIJEBsQkLiCVEsj/5ddEOiJx4MA3XU0g8g5e4bav1jRker/wAzI544LwLR29BG7
         vlZmEaCHho/iRNUwW6V6A/5tn5p0XnkV13u87Dnxvtu97Jt9FMIrDgqlB6dzf92A2KMe
         qQjO3x4Us+sejtf991TTUpiFsuxh+4KwwNiPgz1NryV/cUplS5HTN2mbFzPjzd0uBfJJ
         DLPjlxl0+QEfIPWPezdZx4aqR9CdqxD+6DxSX7ErvpsapjYhbA+GynZwGLV0IJkGJCG5
         mDYA==
X-Gm-Message-State: AOJu0Ywd0gE1IFsl1RnMntmuafJBKfH/LlA0CIMZqs67koGdqCiJr8HK
	BtaTZI3w68qn/60mWvZA219jUg==
X-Google-Smtp-Source: AGHT+IF3YpJXIxLFu+wO0o2tssM3r5rKecX2ziTwt8R71kqcE0EokJ0Gpd1q05AYLm8TuCSjnbv4hg==
X-Received: by 2002:a05:600c:1c06:b0:3fe:2a98:a24c with SMTP id j6-20020a05600c1c0600b003fe2a98a24cmr1076689wms.26.1700641366106;
        Wed, 22 Nov 2023 00:22:46 -0800 (PST)
Date: Wed, 22 Nov 2023 09:22:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Message-ID: <ZV26VGxA6ZZS7LAZ@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
 <ZVzZy-KYgdAsqRE3@macbook.local>
 <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>

On Tue, Nov 21, 2023 at 06:27:02PM +0100, Jan Beulich wrote:
> On 21.11.2023 17:24, Roger Pau Monné wrote:
> > On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
> >> ... or we fail to enable the functionality on the BSP for other reasons.
> >> The only place where hardware announcing the feature is recorded is the
> >> raw CPU policy/featureset.
> >>
> >> Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
> >>  
> >>      if ( !ret )
> >>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> >> +    else
> >> +    {
> >> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
> >> +
> >> +        /*
> >> +         * _vmx_vcpu_up() may have made it past feature identification.
> >> +         * Make sure all dependent features are off as well.
> >> +         */
> >> +        vmx_basic_msr              = 0;
> >> +        vmx_pin_based_exec_control = 0;
> >> +        vmx_cpu_based_exec_control = 0;
> >> +        vmx_secondary_exec_control = 0;
> >> +        vmx_vmexit_control         = 0;
> >> +        vmx_vmentry_control        = 0;
> >> +        vmx_ept_vpid_cap           = 0;
> >> +        vmx_vmfunc                 = 0;
> > 
> > Are there really any usages of those variables if VMX is disabled in
> > CPUID?
> 
> I wanted to be on the safe side, as to me the question was "Are there really
> _no_ uses anywhere of those variables if VMX is disabled in CPUID?" And I
> couldn't easily convince myself of this being the case, seeing how all of
> vmcs.h's cpu_has_* are defined (and I'm pretty sure we have uses outside of
> arch/x86/hvm/vmx/).

Wouldn't that have exploded already if initialization of _vmx_cpu_up()
failed? (regardless of whether the CPUID flag is cleared or not)

My main concern is that it's very easy for the variables here getting
out of sync with the ones used by vmx_init_vmcs_config().

It might have been nice to place all those fields in an array that we
could just zero here without having to account for each individual
variable.

Thanks, Roger.

