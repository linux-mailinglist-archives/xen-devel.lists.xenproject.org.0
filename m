Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1E73A55A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553720.864444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMYd-0006CP-BI; Thu, 22 Jun 2023 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553720.864444; Thu, 22 Jun 2023 15:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMYd-00069z-8H; Thu, 22 Jun 2023 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 553720;
 Thu, 22 Jun 2023 15:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOAB=CK=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qCMYb-00069t-K4
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:49:13 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 551ffe76-1114-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:49:12 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3a2so49674555e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 08:49:12 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m12-20020a7bcb8c000000b003f9b66a9376sm7922227wmi.42.2023.06.22.08.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 08:49:11 -0700 (PDT)
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
X-Inumbo-ID: 551ffe76-1114-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687448951; x=1690040951;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9/9KNTlVUHhpEt8lsfJ0Za/edtPSUz3JyYHhj4xBv4Q=;
        b=L164uMFZKF+a03YJmG7XR6Qht+VMltHVQJ1gTyqbzMU0wC5eOtF7F/oziKWjy7h/Re
         wSt7p/UKRrzxxXRw7oTE7jX79qYPgROLQFgzf17hHkwdyeKd1cTfYIiU4vJ8/K1JDYmw
         BWbMePXbrri+0k7+6U8qds2ZxxaUJDHHDNknI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687448951; x=1690040951;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/9KNTlVUHhpEt8lsfJ0Za/edtPSUz3JyYHhj4xBv4Q=;
        b=D/e6UBiZukwmm8FO1P2Ds5gJMId3toVz63uTTlBsWm7mCZcBxp3Vh7od329LZY8MW+
         3bKkT+VHduCjce+EOHQCXBcKsTa1FfDMzuauqscNpBVsfDzB89I5edBWZ8Fe4YpGmQ0t
         +TY7iCSSZJDnln+JDFVb1rTOvDbJvpJU0U0vHNGAEavgUHMCdE4snO7Cwu8Dhmztkn0E
         IWeFat45wfmZR9iFN812fqCayyKss+A1PkxdhWoeaDcsKvzcSdft9QraReFSkfgTaL2Y
         j/MvcTIKsENImVsMQ24MTtUQgLGOS99zQHCSZdHTLjrNa7LMHADgzI7fQipPPx9ecIi/
         NIYw==
X-Gm-Message-State: AC+VfDzKeOItA4qQYlhY22Pq7xtKHkZLQ6GxPkLn7+oirITjxajyY2GD
	H2jR577lFXe/H3K2NQZ6AAommg==
X-Google-Smtp-Source: ACHHUZ4R8VYAVm+A8IeUSahS+cjmKP9LtLIVsSpEvZHU/LpJuzPVG0t68+wrvRvYpfYMkXNdiB9jsw==
X-Received: by 2002:a7b:cb56:0:b0:3f7:e48b:974d with SMTP id v22-20020a7bcb56000000b003f7e48b974dmr18844576wmj.27.1687448951652;
        Thu, 22 Jun 2023 08:49:11 -0700 (PDT)
Message-ID: <64946d77.7b0a0220.2c099.b17b@mx.google.com>
X-Google-Original-Message-ID: <ZJRtdc0FQp3BnDOS@EMEAENGAAD19049.>
Date: Thu, 22 Jun 2023 16:49:09 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot
 path
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-2-alejandro.vallejo@cloud.com>
 <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>
 <6493289f.7b0a0220.7f086.11fd@mx.google.com>
 <32c42471-9e93-58d8-9973-38fce5dcc4d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32c42471-9e93-58d8-9973-38fce5dcc4d3@suse.com>

On Thu, Jun 22, 2023 at 09:54:01AM +0200, Jan Beulich wrote:
> On 21.06.2023 18:43, Alejandro Vallejo wrote:
> > Sure, to everything before this
> > 
> >>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> >>> index 168cd58f36..46b0cd8dbb 100644
> >>> --- a/xen/arch/x86/cpu/intel.c
> >>> +++ b/xen/arch/x86/cpu/intel.c
> >>> @@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
> >>>  		c->x86_cache_alignment = 128;
> >>>  
> >>>  	/* Unmask CPUID levels and NX if masked: */
> >>> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> >>> -
> >>> -	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
> >>> -				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
> >>> -	if (disable) {
> >>> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> >>> -		bootsym(trampoline_misc_enable_off) |= disable;
> >>> -		bootsym(trampoline_efer) |= EFER_NXE;
> >>> -	}
> >>> +	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {
> >>
> >> There's no need to change rdmsrl() to rdmsr_safe(),
> > I thought we established before some hypervisors might not implement it. In
> > that case this function would crash. More gracefully than a triple fault,
> > sure, but still not a very friendly thing to do.
> 
> Yet then in early boot code you also don't (and can't) recover from getting
> #GP(0), in case that might really happen.
> 
> Jan
That's true, strictly speaking, but that case is restricted to the
incredibly unlikely case of "no NX and no MSR". As is, if we ever boot
on an Intel machine without that MSR we'll hit #GP(0), regardless of NX.

Not that it matters a whole lot though. It's pretty unlikely we'll ever
trip there.

Alejandro

