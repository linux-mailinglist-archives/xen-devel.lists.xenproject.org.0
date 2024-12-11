Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774B9EC785
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854125.1267405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIJF-0006dd-EP; Wed, 11 Dec 2024 08:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854125.1267405; Wed, 11 Dec 2024 08:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLIJF-0006bC-Bj; Wed, 11 Dec 2024 08:43:05 +0000
Received: by outflank-mailman (input) for mailman id 854125;
 Wed, 11 Dec 2024 08:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLIJD-0006b2-V3
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:43:03 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed35da1-b79b-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 09:43:03 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6f6cf69so5954803a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:43:03 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa686bb8cb2sm431282366b.153.2024.12.11.00.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:43:01 -0800 (PST)
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
X-Inumbo-ID: eed35da1-b79b-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733906582; x=1734511382; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aa5Vrcx5q+gTRsOkd2CZPk0FNP9WuAT4SSQqgaB83Bw=;
        b=i6qe9cZ5//C/yCCdm38UbzOoN9G1c2uB1WQph3SOuwZuIbegKQb+GcELm0E8Ik2roR
         G925joqEhGrCQEKANzkh2z+Jooa2iSYbv3ObDwFOhUBjj3bTlf2Vx1QTJ5r3MG7Qxv+q
         GFq3H0z9JrTqCtbx+Wc8jLZcfnYABUFM2SEto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733906582; x=1734511382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5Vrcx5q+gTRsOkd2CZPk0FNP9WuAT4SSQqgaB83Bw=;
        b=vcQHb35fAdi0PxcuWwzZOe+PENazEJxy8KgLMSffLX0UCg2nysuvMbYLFsCCtCWsdO
         GvJWI+AeNaovFQsqzKfAg7VkriW0zXqamY+iN5K9+D1EyIlRGEQ/BweR547JJ23F63zS
         UmRRSnAC0n5Sv68kn0U8g8AlWILaS0ynKziK2tUkwhKSqSZVHnw/sZDbqOTwQ3nhCSDr
         Gx34SdUtXtZIWlg6iAPSJ25qVi6LI5RR1bKpTho6rvXrCu1X+3d+TDYd6N9ZyFnuUO+H
         zztmjD0tmqv+DBCBSGcFfw7fsQflbpsivEO/7Xs8y8t+XGQLD84ICMndv4jRfABLEsRi
         c0tg==
X-Forwarded-Encrypted: i=1; AJvYcCV0NXtJAsYlAjBgEshdA0hn5mxBuBn5+VkrMgAFhZRnCBEGYG6IFr0hQ2NUxIasZF+ZHlKQUfSj3YM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjxYRshOmvwrKtnNQ2vem6KrOOHjTcbEhFFKSplH6gYxvq1CeP
	eEhx0IwHb8V2rK4TrKTI5G/o81rv3itUI3vfLNJRo5P4WA+fm9rv/sYLpp+9I/Q=
X-Gm-Gg: ASbGncteM9d/BSL1TRPbcniD2DHGOmmWSUDZmDQ/9Bp4jxLDIp1Djdqdc88JRH4ELkM
	cjwu4kfcnX/fnEjTOulcusNR/R9U2/k1RY79Pu29eZ+HG4tS1G7aOA7W7HOaFeT/bYwdczdSoEc
	HYIcLE+o2pQdhKSjIYJeYC7ZejjfEWG0mG70crshnbhStVodk7BZNKr2lEAd9jtYaIxiInba5l0
	x25ATRqpqOpwkQYNexzt9z6DrmItGKs5BcXH6aUnwkSRkhJqvjHr3XSPPI8XVw=
X-Google-Smtp-Source: AGHT+IEgTeSO/dr5GlQL6Ty94FwJHTJKnzcaeb48LkRYats9DGf5NTZt1ug21u+MT9B3npbo6gdrHA==
X-Received: by 2002:a05:6402:3806:b0:5d2:7199:ad4 with SMTP id 4fb4d7f45d1cf-5d433066180mr1639622a12.6.1733906582265;
        Wed, 11 Dec 2024 00:43:02 -0800 (PST)
Date: Wed, 11 Dec 2024 09:43:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1lQlVx_p_nvdLHG@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <328c3bb6-1adf-4c64-81d4-40704ea1f19e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <328c3bb6-1adf-4c64-81d4-40704ea1f19e@suse.com>

On Wed, Dec 11, 2024 at 09:25:16AM +0100, Jan Beulich wrote:
> On 11.12.2024 08:57, Chen, Jiqian wrote:
> > On 2024/12/10 19:25, Roger Pau Monné wrote:
> >> So you suggest that the capability should be hidden in that case?  We
> >> have logic to hide capabilities, just not used for the hardware
> >> domain.  It would need some extra wiring to be capable of hiding
> >> failed capabilities.
> > Can you give me a guidance on how to hide a failed capability?
> > What codes are current logic to hide capabilities?
> > Then maybe I can add a patch to implement it.
> 
> It's really the other way around right now for "normal" capabilities:
> We whitelist what we expose. See init_header()'s logic after checking
> the PCI_STATUS_CAP_LIST bit. Actually past that block there's
> 
>         /* Extended capabilities read as zero, write ignore */
>         rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
>                                (void *)0);
> 
> I.e. no extended capabilities are exposed at all right now to DomU-s.
> For Dom0 I guess we shouldn't use whitelisting, but the (extended)
> capability list(s) would need similarly virtualizing to be able to
> hide some.

Given this capability is only to be exposed to the hw domain (at least
for now), I'm not sure it's fair to ask to add all this
infrastructure as part of adding the new capability.  It would be great
to have it, but doesn't seem fair when there's already MSI and MSI-X
implemented without such support.

Thanks, Roger.

