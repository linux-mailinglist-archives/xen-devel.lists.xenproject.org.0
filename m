Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6598143A6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 09:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654915.1022404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3Ze-0001D1-6p; Fri, 15 Dec 2023 08:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654915.1022404; Fri, 15 Dec 2023 08:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3Ze-0001BM-49; Fri, 15 Dec 2023 08:29:34 +0000
Received: by outflank-mailman (input) for mailman id 654915;
 Fri, 15 Dec 2023 08:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE3Zd-0001A8-2Z
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 08:29:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11817cb5-9b24-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 09:29:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c4846847eso4463245e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 00:29:31 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b0040c34e763ecsm27316682wmb.44.2023.12.15.00.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 00:29:30 -0800 (PST)
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
X-Inumbo-ID: 11817cb5-9b24-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702628970; x=1703233770; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+5LrHZZmYuLl132bbVzeXmRrdb/c61zeghwOfXOCZw=;
        b=Jjmm+wv578ZCtzu8ZboVlbQAAWA+B7snVFTgCRif7JcOMlu3DHZFSYPHFH2gtKjLOW
         bUaci3kRHkGlsGH9xxnBvHYCn2gLgjiLdgjEzIHIGf62FKuFoPyLDZZFzVLre/azZPYk
         MnXdzBjSQPB9Y/FV/r3hoWZmwmPsYjCjfxusA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628970; x=1703233770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+5LrHZZmYuLl132bbVzeXmRrdb/c61zeghwOfXOCZw=;
        b=skG05/s5XSc43Uqg883PwfQ+3Trr6z3ISx2fwuNlD8bgmt4G/keZUlG6sZbTBO4JMG
         2dqzP7Vn+6Wudhn1TyPjCgdvnXfabzv3v6gyot1b+DBNtQQsaleRRRJuLCWIjs1Lpdwa
         fmbwsbjAXLbCy47xDSQ0u85pGUdWakl6RZm6iRGPguXW7tcewSVil+z24csFUu+uVVHv
         jkcaOSOnk/FKk3bBaYXt00IH60NK99wY/UzyvCgR8OZ6u4U1bSWHAqbLfMCmQ51slFQk
         KFw70/uzW0iJVjqjkvu/WDVdTySHaWrWtEBjFw0f2OJjbsbANZP9RAbOm/qZlzY9X7eD
         ObVg==
X-Gm-Message-State: AOJu0Yx1tq2WXmKjUqJMYVprH3JJbaTQwejThwoOSuiJah6DQQeW/t41
	by2TwcF4XP4UfZTz2H2b95SOBA==
X-Google-Smtp-Source: AGHT+IHwW18E6EFrYfNzAIMpw7kBXaNqZAXyeX1CiEcqYiIqDqEyvVKfbb1Rm8WUyUNIhrURzdvsUg==
X-Received: by 2002:a05:600c:84c9:b0:40b:5e21:e28b with SMTP id er9-20020a05600c84c900b0040b5e21e28bmr5376518wmb.120.1702628970605;
        Fri, 15 Dec 2023 00:29:30 -0800 (PST)
Date: Fri, 15 Dec 2023 09:29:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXwOabGbV_lFaSfO@macbook>
References: <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook>
 <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
 <PH7PR12MB58546C2F2208D57396C48764E793A@PH7PR12MB5854.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR12MB58546C2F2208D57396C48764E793A@PH7PR12MB5854.namprd12.prod.outlook.com>

On Fri, Dec 15, 2023 at 07:20:24AM +0000, Chen, Jiqian wrote:
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index d3507d13a029..f665d17afbf5 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        int gsi = irq;
>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>          if (r < 0) {
>              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> @@ -1494,7 +1495,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc = ERROR_FAIL;
>              goto out;
>          }
> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +        r = xc_domain_irq_permission(ctx->xch, domid, gsi, 1);
>          if (r < 0) {
>              LOGED(ERROR, domainid,
>                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f5a71ee5f78d..782c4a7a70a4 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -658,7 +658,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              ret = -EINVAL;
>              break;
>          }
> -        irq = pirq_access_permitted(current->domain, pirq);
> +
> +        if ( is_hvm_domain(current->domain) )
> +            irq = pirq;
> +        else
> +            irq = pirq_access_permitted(current->domain, pirq);

You are dropping an irq_access_permitted() check here for the HVM
case, as pirq_access_permitted() translates from pirq to irq and also
checks for permissions.

This would need to be something along the lines of:

irq = 0;
if ( is_hvm_domain(current->domain) &&
     irq_access_permitted(current->domain, pirq) )
    irq = pirq;
else
    irq = pirq_access_permitted(current->domain, pirq);

And then I wonder whether it wouldn't be best to uniformly use a GSI
for both PV and HVM.

Thanks, Roger.

