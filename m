Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04704A8B295
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955233.1349073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xV3-0001pl-V9; Wed, 16 Apr 2025 07:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955233.1349073; Wed, 16 Apr 2025 07:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xV3-0001nk-ST; Wed, 16 Apr 2025 07:48:01 +0000
Received: by outflank-mailman (input) for mailman id 955233;
 Wed, 16 Apr 2025 07:47:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2d3P=XC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4xV1-0001nW-Ub
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:47:59 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dbf07fd-1a97-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:47:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso1110507266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 00:47:59 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f36ee54fb5sm8018225a12.13.2025.04.16.00.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 00:47:58 -0700 (PDT)
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
X-Inumbo-ID: 1dbf07fd-1a97-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744789679; x=1745394479; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8yWJPbLuXbINfNY5Sg/MO+QXp+wDj1s6HitWV92Riw=;
        b=oMsy51Tt7yTytT4epDBwZSrSdxUJx76wKskgkLNFmR7y9vfwUqV8KgkYWV3ghOOvIE
         xcz30tgNhlw4AvROzTeEPzHFunjntD46VMDrWC64wjmvtWtEUi6dFNnZCS4zQ8vohOcd
         3foXf3NOGSuobYUXVJMsAu+R/MKsbMdZIABI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789679; x=1745394479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8yWJPbLuXbINfNY5Sg/MO+QXp+wDj1s6HitWV92Riw=;
        b=HGrvCIWbzVS3NhmUo6dyG64bNaRd+E/D7LARfb5wATFOea2f0xow5M70rnMjKNrjgS
         Hmo7kAyqmFWNlSl1Lm5SgHhfwYKFeAgdyLpMnHpYH3kzUNFvWx97CknrMYsaX4m8+uEV
         pm1rZlP7ipy5o6drd+uRnVBA/j9K2tjmkJRZOgeg6J9xWSaz/E5Riw5Gc194u1J+e89M
         w05Fk14Dk+82+6b250grzyj+2Z4X2GpGITlhga0bsqp691fywhj2eeUuTiefmmoEB+5a
         7Qjs43/4SDGLTQbFuMV8n+YtCxTJAofJ/JuNZi2aE6F2ETcP7VU4fGv4E7PhOLlR269F
         nDmw==
X-Gm-Message-State: AOJu0Yy1EWGNQRd1/ucSzU3MLl97Zc5accNk8Lo9LAUfJTebp7kYxTFd
	+4ep5yMT8+6lA8e6yIJ/wAa9yjI+87mQmNjWKlsiatMnWoovnkS/7Ng89UvWysmBoN9IDxXbZEW
	z
X-Gm-Gg: ASbGncvvI5wwGg+MWojMe/OnKT36Y5WirXxeXXCaWEt5xeIhgPWEAQvlZmf8n2qMO45
	qc7HUffAEh99nLjGnVgQMp015Y4AQFBSQaJG5AejVwnZpdaTCLAXPGxb6dRv59Y+LDmveXpxE5m
	3SIaSBxqau+bALiUbcSy1qy8Z6wDr0CtoQaKh5toB3gqSyKCDObgLWjekcYQDCH88mXBDBvROsx
	ms3uyMNcDDb/2hvFY/d60Jt+NS58U/tA3s8phlAqDx+YddHpvxQWJLBMLthZbuKdRBejKn7KizP
	ux7V8wQcU3X4v/XhxV8GfA/yWX7NwtzwAst2mbgbDJGQ1KqftmyGKecK
X-Google-Smtp-Source: AGHT+IFZ8ZEZUizfrZrTCZda3vd9z3VGyt/uyF2544YyJ7NEmvLX8wm3UmE+q8NQ5/W4s33m4vVM+Q==
X-Received: by 2002:a17:906:ee87:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-acb428936c2mr76658766b.3.1744789678624;
        Wed, 16 Apr 2025 00:47:58 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:47:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v2 7/8] vpci/msi: Free MSI resources when init_msi() fails
Message-ID: <Z_9grfgh8uRhT5Nk@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-8-Jiqian.Chen@amd.com>
 <Z_5fLB1GoyoxpuOL@macbook.lan>
 <BL1PR12MB584983A5AB0A9D74877F8BA0E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584983A5AB0A9D74877F8BA0E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Apr 16, 2025 at 06:16:36AM +0000, Chen, Jiqian wrote:
> On 2025/4/15 21:29, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 02:45:27PM +0800, Jiqian Chen wrote:
> >> When init_msi() fails, the previous new changes will hide MSI
> >> capability, it can't rely on vpci_deassign_device() to remove
> >> all MSI related resources anymore, those resources must be
> >> cleaned up in failure path of init_msi.
> >>
> >> To do that, add a new function to free MSI resources.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v1->v2 changes:
> >> * Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.
> >> ---
> >>  xen/drivers/vpci/msi.c | 47 +++++++++++++++++++++++++++++++++---------
> >>  1 file changed, 37 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index ca89ae9b9c22..48a466dba0ef 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -193,6 +193,33 @@ static void cf_check mask_write(
> >>      msi->mask = val;
> >>  }
> >>  
> >> +/* 12 is size of MSI structure for 32-bit Message Address without PVM */
> >> +#define MSI_STRUCTURE_SIZE_32 12
> > 
> > I'm confused by this.  The minimum size of the capability is 4 bytes
> > for the capability pointer, plus 4 bytes for the message address,
> > plus 2 bytes for the message data.  So that's 10 bytes in total.
> The remain 2 bytes is Extended Message Data, PCIe spec has this register's definition even though it is optional.

I was looking at the PCI Local Bus Specification rev 3.0 (because that
has nicer figures IMO), and such field is not listed there.  It's
listed in the PCI Express 6.0.1 specification.  I have to admit I've
completely forgot about such optional feature.

We never expose this bit to the guest in the control register, and
consequently we never explicitly handle accesses to what would be the
extended message data register, neither allow guests to enable it.

If/when we add support for such field we will likely need to adjust
fini_msi() to also zap it if present.

Thanks, Roger.

