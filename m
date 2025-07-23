Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FFB0ECED
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053508.1422287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUdu-0006SY-1Q; Wed, 23 Jul 2025 08:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053508.1422287; Wed, 23 Jul 2025 08:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUdt-0006Py-Uw; Wed, 23 Jul 2025 08:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1053508;
 Wed, 23 Jul 2025 08:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT0Q=2E=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueUds-0006Ps-5k
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:16:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 432f1fda-679d-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 10:15:58 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so70186015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 01:15:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca4d74asm15433372f8f.63.2025.07.23.01.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 01:15:57 -0700 (PDT)
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
X-Inumbo-ID: 432f1fda-679d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753258558; x=1753863358; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCcwlQg9z59lcHf74xT+BxCBCsoB0QsLWitZWj/wPgc=;
        b=UjQ8CP7osSPtQcE3lTfazn7HMpMXeVqncVdLeR8tib7hXiUJJf6oHfxUeUcV5NIZbw
         +KvgbPWEuQjMyZLE7oZrbOOnEYJ9kKEN/D7kl2Gh0JboBgtH9xVm/Abqf9E7zn+5nYop
         flb0/Tm5Rz88b2wZxIVM9+Eokv49u4UvOJYe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258558; x=1753863358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCcwlQg9z59lcHf74xT+BxCBCsoB0QsLWitZWj/wPgc=;
        b=Kl7ry5rtib6g/dOiOH+cxfuQRcRIjuxb8EEzAGpWxWcBunnsCWZSaw1mh3VMdjUZqQ
         UgyA5CvFKPlOEE4QhRORmTwIVBKcpV73iOPYSAAiQ5QwkpiTbTxPT1IO4p9WR6B3mWpy
         FueGH0WsCqWmF1f7DObhDPHgeTwgOgwT2Npj2/UA27oyom9haOcfYcAeqEcRsKHbofkT
         tx3J5G057wquAU9va8FkqGi04M6Dfpa/EZG87QSj+O9yMM2+PFXeV5Oe0QgXcNB0AWZF
         leXp7OH0609ZhXO1NIxbplfxvv9SycfMYtAVTCvNQTAYA+HoKRBgo3E2Bb9Z/lJY+4wP
         rkpg==
X-Gm-Message-State: AOJu0Yz+bid6JKMb3NtEfOxy/+nqHmGDwYqMFsVUnfiul4wmHITXjI7L
	gHVQUy1qwXp/46gEizzQ4e3fV+Z+teuuIPpSGH5T8SAkpGYlrCHQ7UKhz9EIOxqRx1k=
X-Gm-Gg: ASbGncvO356Ir+6gnA/u+Yo7yWjDbglxWOZiA9oJF68x44ZWNLz7ed0mt3mvuUPMqWh
	Xv74eCD0t7kJ+rt2IktoZMk+Z5MPSkk176fiw0zvVmehlhmnWKkwmaucvQaX+qdNXKOaL3aLu7Z
	FWLbruOMbMAmGEBOTxmWGiM1sEufqyJsLmSj53qeJJokZfgDL2zwODY5SLVRDr1jTlqJNwPZhXu
	GL9BStgiDW3sbvzkiWV3f95Q3xrX8kY/C3aj0BZWiR77/PbdInLaccWwXrhof6tLJiXVtHODV0I
	v54Hsq29aicKu35wk86/gjYUZjprsxNYLwrp4XUBkAqMunNlziKUWlEVGnAC0BsHivXrrtB41KI
	xyVEg1e0SUzkri6PEbzh3QezTBoDbzV2r1HGB3TofT0uDE7Bx/Yt1y4cPumVjTDhY7CAkJ7Fup3
	RO
X-Google-Smtp-Source: AGHT+IF5J76Mn/Iuw5AN9Qa9rBXd5CSe2MP0hzSFyYz71tjXDdnMQUZGfNJj6gYmFqLOm5lywdmL9g==
X-Received: by 2002:a05:6000:250d:b0:3b2:fe46:9812 with SMTP id ffacd0b85a97d-3b768eed971mr1349950f8f.19.1753258557501;
        Wed, 23 Jul 2025 01:15:57 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:15:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v7 3/8] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aICaPATExhCt-Osf@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-4-Jiqian.Chen@amd.com>
 <aH5hUC1JBYLyF0h6@macbook.local>
 <BL1PR12MB584951B8BE1340D0ED4C8DC5E75FA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584951B8BE1340D0ED4C8DC5E75FA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Jul 23, 2025 at 07:33:04AM +0000, Chen, Jiqian wrote:
> On 2025/7/21 23:48, Roger Pau Monné wrote:
> > On Fri, Jul 04, 2025 at 03:07:58PM +0800, Jiqian Chen wrote:
> >> +                   pdev->domain, &pdev->sbdf, type, cap, rc);
> >> +
> >> +            if ( capability->cleanup )
> >> +            {
> >> +                rc = capability->cleanup(pdev);
> >> +                if ( rc )
> >> +                {
> >> +                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
> >> +                           pdev->domain, &pdev->sbdf, type, cap, rc);
> > 
> > I think it would be fine to not return error here for the hardware
> > domain, and try to mask the capability even if cleanup() has failed?
> > 
> > For the hardware domain it's likely better to not fail and attempt to
> > mask, rather than fail and then end up exposing the device without any
> > kind of vPCI mediation.  For domU the proposed behavior is fine.
> Got it.
> So here should be?
>                 if ( rc && !is_hardware_domain(pdev->domain) )
>                 {
>                     printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
>                            pdev->domain, &pdev->sbdf, type, cap, rc);
>                     return rc;
>                 }
> or
>                 if ( rc )
>                 {
>                     printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
>                            pdev->domain, &pdev->sbdf, type, cap, rc);
>                     if ( !is_hardware_domain(pdev->domain) )
>                         return rc;
>                 }

The last one will be my preference, we want to log the error, just
not forward it to the caller.

Thanks, Roger.

