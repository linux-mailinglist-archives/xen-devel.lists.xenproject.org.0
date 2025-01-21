Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF086A17CB0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 12:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875382.1285834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taC8j-00013U-9S; Tue, 21 Jan 2025 11:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875382.1285834; Tue, 21 Jan 2025 11:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taC8j-00012H-4i; Tue, 21 Jan 2025 11:09:49 +0000
Received: by outflank-mailman (input) for mailman id 875382;
 Tue, 21 Jan 2025 11:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEc5=UN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taC8g-00012B-Qd
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 11:09:46 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 389371e6-d7e8-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 12:09:45 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401c52000fso5296971e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 03:09:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c5ad7bsm734421966b.36.2025.01.21.03.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 03:09:33 -0800 (PST)
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
X-Inumbo-ID: 389371e6-d7e8-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737457785; x=1738062585; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dWZiJEDc99jShgeu4oFpCmpOwPWEJ86pDTkm2NKdxw=;
        b=XvmViPbVm8GK/9xYq4T7jdaU/spY1N3Ev0oGEk5nZfZL06d4uMq6cuAoJx6RT9hubl
         KPR9lMMRGe2bacMqeVr2UIcIhdtsnQPAXXAk77bIl4tGGrEWxINPMEH9VqtyeEJmdV99
         SIaQHNd9lpZgpJ/ZvNDwVjXsnvElryM9+NCOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737457785; x=1738062585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dWZiJEDc99jShgeu4oFpCmpOwPWEJ86pDTkm2NKdxw=;
        b=lCwBCeOBGiSgh5E7avAr5CAZTsNirnUz1MidKLpnC3ygM/aSno47RVR9j8FGX5lXM2
         C2ovHaPi1MMlP3c/HpGEBZxdtos4TpKve6lY66Ohv8wUwRMNQJAOA7ZpeNzuqu5P1EVB
         xU7ZomkFrDBc5JQBipVkxheHDNtGIXCcVt60CLvW2Ad0cpnz58w0orv0hQpRcn52Y7fM
         6aYnxrtm9NHtDBgH2+eqpfUnVmfhE18SCyruu+VyxAiVdWbmqKWaDFuJuwB48hCK2jGF
         IL5GZQLzuv6NriAWjkZQoOYEcb50jCNfl7JIE9o3acq+gFqLs6EmIs/JC2UrPRS8fAs4
         CxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwgv22nm59owpwHDpE9SA7YYbO/rX3uHeYnjPdLZctDHT1mZeHKwnOjDI5I5QrfeWOLGWgpnyFjVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLYceGybL5Ns5sQWc1lXemaD5hjMuomJVz8qcX2mN3zKyuiUxG
	3biz7vYuku9Evn8zUNGT3rzuvmefisLHFaVAUPP42vW/CrAlI5spwODFCh9RzNNMJ/WGT+MPNL8
	U
X-Gm-Gg: ASbGnctEyAu738jDIEYdlmOh5pKBgPAAVM1K1BEFjYsttxCltwHQJxiHhekmFrr8lgW
	uikVtYLxxIJDbcGHLDfWzNIVGu9JMb/ZAmOP6DhefN8kGXfNC29vrqP2opti3Y7g7FVHsARzVR0
	qB5NM+01FslGaeMBQoPw12/oEteuS4U1J5IBPrJ6qpLNCbeAH9gT2XRc5AZSwRLiUw6jS6ZThCt
	ygTIVWeoNn6Kr1vPxVhTj2k9w6TErggjczavPB4EQDpgfdrneI0lIg4Oes/wnz6HOg7aMOO6wg=
X-Google-Smtp-Source: AGHT+IHpTcp9+GfPwPygMEIAY3gRkoVWDKq2w5F/HWcwMTvbck12Fmy/3YyLGuI3pADpbQxbGQp/oQ==
X-Received: by 2002:a05:6402:518a:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5db7d2f5ec0mr43385865a12.13.1737457773959;
        Tue, 21 Jan 2025 03:09:33 -0800 (PST)
Date: Tue, 21 Jan 2025 12:09:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v5 1/3] x86/iommu: Disable IOMMU if cx16 isn't
 supported
Message-ID: <Z4-AbI2oKWCR5bws@macbook.local>
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
 <8cab0372-8c40-4648-bdbe-ff56844f289d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8cab0372-8c40-4648-bdbe-ff56844f289d@suse.com>

On Wed, Apr 24, 2024 at 04:27:10PM +0200, Jan Beulich wrote:
> On 18.04.2024 13:57, Teddy Astie wrote:
> > All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
> > initialisation time, and remove the effectively-dead logic for the
> > non-cx16 case.
> 
> As before: What about Xen itself running virtualized, and the underlying
> hypervisor surfacing an IOMMU but not CX16? It may be okay to ignore the
> IOMMU in such an event, but by not mentioning the case you give the
> appearance of not having considered it at all.
> 
> > --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > @@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
> >      if ( !iommu_enable && !iommu_intremap )
> >          return 0;
> >  
> > +    if ( unlikely(!cpu_has_cx16) )
> > +    {
> > +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
> > +        return -ENODEV;
> > +    }
> > +
> >      if ( (init_done ? amd_iommu_init_late()
> >                      : amd_iommu_init(false)) != 0 )
> >      {
> 
> I did previously point out (and that's even visible in patch context here)
> that the per-vendor .setup() hooks aren't necessarily the first thing to
> run. Please can you make sure you address (verbally or by code) prior to
> submitting new versions?

I've re-visiting this as part of my other IOMMU IRTE atomic update
fix.

Would you prefer the check for CX16 be in the common x86
iommu_hardware_setup()?  That would be kind of layering violation, as
in principle a further IOMMU implementation on x86 might not require
CX16.  However I find it very unlikely, and hence I would be fine in
placing the check in iommu_hardware_setup() if you prefer it there.

Thanks, Roger.

