Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB68ABD3B6
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990614.1374557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJVo-0004Y3-Om; Tue, 20 May 2025 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990614.1374557; Tue, 20 May 2025 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJVo-0004Vc-Ln; Tue, 20 May 2025 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 990614;
 Tue, 20 May 2025 09:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eI0=YE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHJVm-0004VU-RM
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:43:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed597e5-355e-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 11:43:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad5533c468cso416482966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:43:49 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d438279sm694963366b.112.2025.05.20.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 02:43:49 -0700 (PDT)
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
X-Inumbo-ID: eed597e5-355e-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747734229; x=1748339029; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nut/XAOkRnbpYt8eQOiWPhM34TBKF50Z6wETkr6wZ6I=;
        b=uMt1wSx8R0DejzhaavHyu4u++MEXu6lDeksqXFMzeEmXO528EVJP7qxKEZWddSzf97
         wqO5S79qHe/FTCSb3MKmHfBrB/5HVH6Vy4c0ynsD346OCM2tJYxGpzgU32/sA47CmjGv
         GZqGZx0uokRRQAmxPHgoukrwvEV9VZMN8pm1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734229; x=1748339029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nut/XAOkRnbpYt8eQOiWPhM34TBKF50Z6wETkr6wZ6I=;
        b=QHIvqDiSwTAGCbz4Vx7oHB1yTy03aZMx2+jB3/3wk15dMQbvPOeSoWs7tDFotLR0sa
         5g45b3naZzJ3y+Ieuar5jlHRDRsChze5F203WmDpUrOxwKkoQir2lvj5D44zTg37rJ0a
         /eigYSP3PeDcVorA3KmHHnIEat5oYHa8SY4lxn1LxIgwajfciUBVVEiWbVclQYOjFSpo
         /NGD9iwVuFfb0QoUvlwCa8++ACToTZ+PynrO7r9wd4IhoppRuckc9zfQy5kdtrUf66J3
         qW1CwVEZiMDZE2hI7HZqwBq/kuiO9wKe/o2Od/Q+a8KAGmKYX10xmr4wwOkqFK5iIvHN
         ya7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHNxoMiWwI+w4kpgknMWnMQ6GkDeouDkR5ooBOob9WBHO7wDB75yluAsnzLZK021oDf2GZ/i30SpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUFCFmuMJLhsfVP39WrfYZMIoxxqjaiKm4pyz8p/DHa/TI3vnf
	ycIpZl71MUs3KdeScq87sJoN0Zocl62TxD7k7/blTR9NflDChnA2aC7LFdDws/9aSMk=
X-Gm-Gg: ASbGncttPZSZ3clxm+4QyfpJ4ovGUD4by6hQKanPsnr6Ig5Tof7ue8P9GZgFXrUpdC0
	CRoVyBWiuLQEatXs0JcVPOYM26Gg0rDpaOsVXw5GKlT/lldrMRFtyWmJFekLW7//F9lGpt4ytUo
	352o9CXbNo3ZQAG4gD8mwQ95JUkTD3PaofTq5hKcf94602dOYIt6/D2FbgHJfidiIHJX8b3ClrE
	wfGR/PYMQl2Zq9Kw9+O7t2rv6sZ14V7mKyF3Hk6pdlKLdDHAXcU82vc6J+ejC5rbXOh/U87wsC7
	pQfypGe1cKFOyZBYMzw/fYpEFnVIS31LHuTaUwUZ51zg4+WeUQOaLGLuuaH/+RBX2usyoOCGyMT
	h1XkJQejVubmEABZGI33z3DDoKEO8rQ==
X-Google-Smtp-Source: AGHT+IG7sTx/TOMxTOjY5WNfUXjd+PWtSvkC72x+8yGuicaTFETKZbnD//YLNzA6zR+lbacm6FoWkw==
X-Received: by 2002:a17:906:c156:b0:ad2:51d8:7931 with SMTP id a640c23a62f3a-ad536bde70emr1274134366b.21.1747734229290;
        Tue, 20 May 2025 02:43:49 -0700 (PDT)
Date: Tue, 20 May 2025 11:43:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Message-ID: <aCxO1Gh_ehxpsznI@Mac.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>
 <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com>

On Tue, May 20, 2025 at 11:14:27AM +0200, Jan Beulich wrote:
> On 20.05.2025 11:09, Roger Pau Monné wrote:
> > On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
> >> On 09.05.2025 11:05, Jiqian Chen wrote:
> >>> When init_msi() fails, the previous new changes will hide MSI
> >>> capability, it can't rely on vpci_deassign_device() to remove
> >>> all MSI related resources anymore, those resources must be
> >>> removed in cleanup function of MSI.
> >>
> >> That's because vpci_deassign_device() simply isn't called anymore?
> >> Could do with wording along these lines then. But (also applicable
> >> to the previous patch) - doesn't this need to come earlier? And is
> >> it sufficient to simply remove the register intercepts? Don't you
> >> need to put in place ones dropping all writes and making all reads
> >> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
> >> this may already be the case by default behavior)?
> > 
> > For domUs this is already the default behavior.
> > 
> > For dom0 I think it should be enough to hide the capability from the
> > linked list, but not hide all the capability related
> > registers.  IMO a well behaved dom0 won't try to access capabilities
> > disconnected from the linked list,
> 
> Just that I've seen drivers knowing where their device has certain
> capabilities, thus not bothering to look up the respective
> capability.

OK, so let's make the control register read-only in case of failure.

If MSI(-X) is already enabled we should also make the entries
read-only, and while that's not very complicated for MSI, it does get
more convoluted for MSI-X.  I'm fine with just making the control
register read-only for the time being.

Thanks, Roger.

