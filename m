Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD128738BD0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553014.863321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0vL-0001q3-8I; Wed, 21 Jun 2023 16:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553014.863321; Wed, 21 Jun 2023 16:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0vL-0001nX-5b; Wed, 21 Jun 2023 16:43:15 +0000
Received: by outflank-mailman (input) for mailman id 553014;
 Wed, 21 Jun 2023 16:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqSO=CJ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qC0vK-0001nP-09
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:43:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63947b7-1052-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 18:43:12 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f904dcc1e2so52439845e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 09:43:12 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003f735ba7736sm5430740wmj.46.2023.06.21.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 09:43:11 -0700 (PDT)
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
X-Inumbo-ID: b63947b7-1052-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687365792; x=1689957792;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rm1oHLYmSLx19Oi4lcZTT+w4Of8vQxJJKbWSwgAOSZQ=;
        b=OnO8gn/qPjvhmgedUDc2wydFdAEfpuM5DvwsUY1pwJ09Cf8r5g8WDgvd6KmkABMFhc
         UAbUTQlKn8fB+7ckhoZUoT7flKzdmrVH9Pbkd8DByIEQNlhi8pt3cep3tz6MZ/+Zw/xg
         MBJeBb9ItOm4NtMFePcs3qkduHbHbRca20Oh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687365792; x=1689957792;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm1oHLYmSLx19Oi4lcZTT+w4Of8vQxJJKbWSwgAOSZQ=;
        b=Dr8SYf3aZUBZ24jxTvTTlthDMLH115wyqZr9rA/PU+uvJht+74gu9voo/DpRVmxLJu
         mO1ZzScw5wfTmL3HzRcqrrM9PZH+6ZepZuA0FsjHVYbjpDn7XGlsIDwHWXTfk8Ebsv5S
         U5hqSd2RBuQIr3Hfw4u0Z/4IgAs0HEgflX/F46ueUnknpcDLwgqeXETlXI2nIKERvokD
         laAyMbqWJcm263ECg7Rpp8jc52rOfzJeQCVAIjlbsEZN0S8Bd9GiMIk8XIE1RvkufNyi
         454POUYyOQxbirA+dmMLslaL3mPWLgTc3mC2PqU1euQsDUi6S65471DuLVmVuPAZDhqq
         tmpw==
X-Gm-Message-State: AC+VfDwXfJsc+WL1/xwioKiIOiVQFg29iDHcWO22WrturO3J8aGsDS9V
	QyxgSFGkpwjuazYK3IWDs9M1Cw==
X-Google-Smtp-Source: ACHHUZ7cK4dWID5ocute2D38hV8zFHng1XIVFg0Lj5visSmSfGC7K8AnV0wSbgfDCa+M9/wt33WGkg==
X-Received: by 2002:a7b:c399:0:b0:3f9:b827:cbcc with SMTP id s25-20020a7bc399000000b003f9b827cbccmr4526180wmj.30.1687365792124;
        Wed, 21 Jun 2023 09:43:12 -0700 (PDT)
Message-ID: <6493289f.7b0a0220.7f086.11fd@mx.google.com>
X-Google-Original-Message-ID: <ZJMonvXrLGImWUlh@EMEAENGAAD19049.>
Date: Wed, 21 Jun 2023 17:43:10 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot
 path
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-2-alejandro.vallejo@cloud.com>
 <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>

Sure, to everything before this

> > diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> > index 168cd58f36..46b0cd8dbb 100644
> > --- a/xen/arch/x86/cpu/intel.c
> > +++ b/xen/arch/x86/cpu/intel.c
> > @@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> >  		c->x86_cache_alignment = 128;
> >  
> >  	/* Unmask CPUID levels and NX if masked: */
> > -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> > -
> > -	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
> > -				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
> > -	if (disable) {
> > -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> > -		bootsym(trampoline_misc_enable_off) |= disable;
> > -		bootsym(trampoline_efer) |= EFER_NXE;
> > -	}
> > +	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {
> 
> There's no need to change rdmsrl() to rdmsr_safe(),
I thought we established before some hypervisors might not implement it. In
that case this function would crash. More gracefully than a triple fault,
sure, but still not a very friendly thing to do.

> and not doing so will shrink this diff a lot.
This particular one, yes. That said, looking more carefully I'd say I
should remove the XD_DISABLE parts of those lines altogether. It is
unconditionally cleared on boot now and will never ever have a non-zero
value at this point.

> The only thing you need to alter the re-enable NX printk(), which
> probably wants to move ahead of the "if (disable)" and source itself
> from bootsym(trampoline_misc_enable_off) instead.
Alternatively I could just get rid of the printk. As it is after this patch
even the BSP starts off with NX enabled.  EFER is updated as early as the
trampoline, which is as early as it would've happened before regardless of
XD_DISABLE.

Alejandro

