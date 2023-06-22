Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CED73A446
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553665.864353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLs9-0005gt-3T; Thu, 22 Jun 2023 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553665.864353; Thu, 22 Jun 2023 15:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCLs9-0005e5-0a; Thu, 22 Jun 2023 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 553665;
 Thu, 22 Jun 2023 15:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCLs7-0005dz-Bd
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:05:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32462e91-110e-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 17:05:16 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so4228514f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 08:05:16 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t13-20020adff60d000000b003119633ecb5sm7197472wrp.88.2023.06.22.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 08:05:16 -0700 (PDT)
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
X-Inumbo-ID: 32462e91-110e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687446316; x=1690038316;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fanvZ+Zy+ZA6GiSa2e3JgPYvG9aa0C9eMyVaDXuAmo4=;
        b=OyTkfDwZ7l9VmNbAazsa/DSPfeC8LkiZSg7XieM8qSd6r/9ZB1XU9Cr3CoPAaiRsmy
         wUnvEdKfbVIaycsnTHr89EoQTw4MjFrQixIHqY0q6SwOufHNOViCcr2c71iJIHiqKED9
         SFIV3sFW9N/+oblnV/b692kClV9RXLW8Pe4YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446316; x=1690038316;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fanvZ+Zy+ZA6GiSa2e3JgPYvG9aa0C9eMyVaDXuAmo4=;
        b=GOMNgf9Yfz4NxIQsQrz8x6FdWh5bg5nZux9trzAhjImAMObJJk/1ewMitc88rxxlCZ
         qfdPUoo1WDrR6cQgPo0WW56gZlmENZeoV3+8yR4WhuxGbYA71c7jlCvu76ZxeC3ddxjK
         3wri1YeLYFmBNvvmQOOj4mIQpzwJdGZbBeFL4swCJju8zYcexnf5veDnNCuKbPfZBdBX
         vrPEqJZeX8vUkd1axnYYkR/E8sXGTKjVFk+bdZf5JoIBIpslH2rkW6eSSIlVEZ/YprtA
         1QBRAbrRnOOWOi01P3jBcZDh+v+dktjp8YZf0k5zvgAmnsJndTq3G6QY4z5eekWpb82Y
         CHCQ==
X-Gm-Message-State: AC+VfDwxGVLLE8TBu1h88IkgB4pQ/w08zcDb4MrRdFgfO6PvBqK45RVN
	xyXghygsfwaNgbHWdNZek/sJaw==
X-Google-Smtp-Source: ACHHUZ6ZPDdyz0I05p1VsGih0+D7ParzXip7S/ZLKA+G+h1iVELbUKEM2mISSK6AB1vBWOm9Fu3w7g==
X-Received: by 2002:a5d:55c3:0:b0:311:112d:eaeb with SMTP id i3-20020a5d55c3000000b00311112deaebmr13033004wrw.33.1687446316238;
        Thu, 22 Jun 2023 08:05:16 -0700 (PDT)
Message-ID: <6494632c.df0a0220.3b155.47fe@mx.google.com>
X-Google-Original-Message-ID: <ZJRjKnIsR3T4EgUN@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 16:05:14 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 5/5] x86/microcode: Disable microcode update handler
 if DIS_MCU_UPDATE is set
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-6-alejandro.vallejo@cloud.com>
 <37caa77c-f3ee-3bee-951e-cc0ea417f539@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37caa77c-f3ee-3bee-951e-cc0ea417f539@suse.com>

On Tue, Jun 20, 2023 at 11:51:00AM +0200, Jan Beulich wrote:
> On 15.06.2023 17:48, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/cpu/common.c
> > +++ b/xen/arch/x86/cpu/common.c
> > @@ -352,6 +352,11 @@ void __init early_cpu_init(void)
> >  			    &c->x86_capability[FEATURESET_7c0],
> >  			    &c->x86_capability[FEATURESET_7d0]);
> >  
> > +		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
> > +			rdmsr(MSR_ARCH_CAPABILITIES,
> > +			      c->x86_capability[FEATURESET_m10Al],
> > +			      c->x86_capability[FEATURESET_m10Ah]);
> 
> Is this still going to be needed if early_microcode_init() uniformly
> does this, for things to be correct for tsx_init() (as pointed out
> in the other patch)?
Yes. This is needed so MSR_ARCH_CAPS are available in order to check
DIS_MCU_LOAD before the microcode update itself. early_cpu_init() does the
read before the microcode update, while early_microcode_init() refreshes
the fields that might have been modified after the update AND are needed
before the general CPU detection logic.

> 
> > --- a/xen/arch/x86/cpu/microcode/intel.c
> > +++ b/xen/arch/x86/cpu/microcode/intel.c
> > @@ -387,8 +387,22 @@ static struct microcode_patch *cf_check cpu_request_microcode(
> >  
> >  void __init intel_get_ucode_ops(struct microcode_ops *ops)
> >  {
> > +    uint64_t mcu_ctrl;
> > +
> >      ops->cpu_request_microcode = cpu_request_microcode;
> >      ops->collect_cpu_info      = collect_cpu_info;
> >      ops->apply_microcode       = apply_microcode;
> >      ops->compare_patch         = compare_patch;
> > +
> > +    if ( cpu_has_mcu_ctrl )
> > +    {
> > +        rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> > +        /*
> > +         * If DIS_MCU_LOAD is set applying microcode updates won't work. We
> > +         * can still query the current version and things like that, so
> > +         * we'll leave the other handlers in place.
> > +         */
> > +        if ( mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD )
> > +            ops->apply_microcode = NULL;
> > +    }
> 
> While this won't address Andrew's request (afaict), but only the
> cf_clobber requirement, I think you want to drop removing of the struct
> instances from patch 2, return pointers from the new per-vendor
> functions, and simply introduce another static instance of struct
> microcode_ops here, with the one hook simply left unset. This lives in
> init data, so the size increase is of no major concern.
> 
> Jan
As mentioned in other email. This is my bad for not having understood the
ultimate readon for cf_clobber. I'll just leave the structs as is.

Alejandro

