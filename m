Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE7A3E037
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 17:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893975.1302805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl9Dj-0006Ct-Ak; Thu, 20 Feb 2025 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893975.1302805; Thu, 20 Feb 2025 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl9Dj-0006Aq-8E; Thu, 20 Feb 2025 16:16:15 +0000
Received: by outflank-mailman (input) for mailman id 893975;
 Thu, 20 Feb 2025 16:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl9Di-0006Ak-5u
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 16:16:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb6cbcf5-efa5-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 17:16:04 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e04861e7a6so2111552a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 08:16:04 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d369esm12167676a12.37.2025.02.20.08.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:16:02 -0800 (PST)
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
X-Inumbo-ID: fb6cbcf5-efa5-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740068163; x=1740672963; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqc/TfbjD5EO2kYjNPBhZE2hA7HGv4wbNhEPu1ygKSo=;
        b=bU8ZTAWtBQNi3ndsUoguM+Aq7ol2aTXMrIgrHzJLENHDjvaZosasIcnVA7wbbdQywA
         EMttlGiTwYHM++wpjUtSpvKNESR95ZUuu9xpz+rPr9CQXn1dgbOaJi7EmdWWzwBv94EI
         Z0Db1Aql6moXYX3jG+DIwIDswmg6AfwxC0glc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068163; x=1740672963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqc/TfbjD5EO2kYjNPBhZE2hA7HGv4wbNhEPu1ygKSo=;
        b=eYPAeUYy/1udDw7LENyrHMRJH4lzMYmPniwKkJdb1XFYppNpVaXmpVcWRsQ7b2vLNQ
         KN9sod6kx7Aeohcbtt1bhzn8cDn1q94KkWUyGT4vy53VaBvEPDNn0kjxfNXYpmoBsBnt
         sR35i6/00XTJrdtN6B0lCTuKXLPbz6wbDYz8OxfUYDwd5x1+IQCZ4AdXSx5bueu6fCWS
         MWzxxoi6ZqkrlEt+jz9bXjZSazKkLHsQiEbQgurzdCc2qiJwi0LvgKVV7Ksp4/yvMy9O
         9o1ly9sMoxihZ4QQwRJoptCUNAIat3vXqZ4wew5gvWQVBHEBNKPcpHRQ4scLmqRKpiGe
         TSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVmpKwsXK+W9/YAMWCIBGg6wPENoXahon2dB8umhhHd+lNjI95DOdG5Nw+93Opl2BiC982iupm64CU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3KJa0gchffYZVIxU422HIoDix3LIBDf7dkH+mj0PkC9qqWH6o
	basrlOsZFByaKv/NDDLn9dKDYSS7U/D2R8Np6TvowtmPPS2v386fTnMplkDVu4w=
X-Gm-Gg: ASbGncvuyk9dPnFycfPsd5zNFo6J41hhz9jRtMbeaDaNT+QGcfuZ7W8PYcnDYhka6CP
	IlyMe6NOVvm1c6s325014S+FmUT9XetFrCOKPf1Yhg3wgHq/sx9o8S8wPDiPOEkW9RFxIL8bAx5
	xRE3m5/3zuMKXoOU9ZeUQ7MvFInSAChMB9yZrCUBYqZFE0dazYGRvamJVazHmOTgNFt5wMZ7iXe
	n/L2okGZ2eoyb0hqOi0uu7T7d+rLIEoYpK0cCMisvQKUlky3wSx8OnKwduG05RsIjZc1eHcY3Fj
	wKE2L9TDBVOEVjHXCLJc
X-Google-Smtp-Source: AGHT+IFRW7U+S3h0bJVV+UYvPvHntB0T8RgV7nWAWyLZgSHoP55MgmBOLEmuAEoA1pU68SNA8+rbbg==
X-Received: by 2002:a05:6402:4416:b0:5de:ecbe:5b9e with SMTP id 4fb4d7f45d1cf-5e036072b9bmr24229270a12.11.1740068163133;
        Thu, 20 Feb 2025 08:16:03 -0800 (PST)
Date: Thu, 20 Feb 2025 17:16:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
Message-ID: <Z7dVQb8MhVuozjSp@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
 <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
 <Z7buBc4yLtf-UpmB@macbook.local>
 <c8ce79c1-0d8a-45b3-868a-2b67b05d6aee@suse.com>
 <Z7dM5_X4OEHk5gn1@macbook.local>
 <7fe59f29-34b9-4404-9634-3604b78e1df5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fe59f29-34b9-4404-9634-3604b78e1df5@suse.com>

On Thu, Feb 20, 2025 at 05:05:44PM +0100, Jan Beulich wrote:
> On 20.02.2025 16:40, Roger Pau Monné wrote:
> > On Thu, Feb 20, 2025 at 02:30:38PM +0100, Jan Beulich wrote:
> >> On 20.02.2025 09:55, Roger Pau Monné wrote:
> >>> On Thu, Feb 20, 2025 at 09:33:46AM +0100, Jan Beulich wrote:
> >>>> On 19.02.2025 17:48, Roger Pau Monne wrote:
> >>>>> Note that the restriction to map the local APIC page is enforced
> >>>>> separately, and that continues to be present.  Additionally make sure the
> >>>>> emulated local APIC page is also not mapped, in case dom0 is using it.
> >>>>
> >>>> But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?
> >>>
> >>> It's required to avoid arch_iommu_hwdom_init() creating an identity
> >>> mapping for APIC_DEFAULT_PHYS_BASE, which would prevent the local APIC
> >>> emulation from being used.
> >>
> >> Hmm, yes, on one hand such a mapping would be created by default, as we
> >> default to "dom0-iommu=map-reserved". Otoh that mapping would be replaced
> >> before Dom0 is actually started, via the domain_creation_finished() hook.
> >> On (modern) VMX that is. So yes, on old VMX and on SVM the slot would need
> >> to remain unpopulated. Otoh, when the physical LAPICs are elsewhere and
> >> when the domain is in x2APIC mode, there would be no reason to disallow
> >> Dom0 access to that page.
> > 
> > Right, but that's now how dom0 is started ATM, as the local APIC is
> > unconditionally started in xAPIC mode and at APIC_DEFAULT_PHYS_BASE.
> > 
> > I could use vlapic_base_address() against vCPU#0 vlapic, but even in
> > guest_wrmsr_apic_base() we don't allow moving the local APIC MMIO
> > region, and hence I assumed it was fine to just use
> > APIC_DEFAULT_PHYS_BASE here.  Note in pvh_setup_acpi_madt() Xen also
> > hardcodes the local APIC address to APIC_DEFAULT_PHYS_BASE.
> > 
> > Would you be fine if I expand the comment so it's:
> > 
> >     /* If using an emulated local APIC make sure its MMIO is unpopulated. */
> >     if ( has_vlapic(d) )
> >     {
> >         /* Xen doesn't allow changing the local APIC MMIO window position. */
> >         mfn = paddr_to_pfn(APIC_DEFAULT_PHYS_BASE);
> >         rc |= iomem_deny_access(d, mfn, mfn);
> >     }
> 
> That will do, I think. Then:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> >> That would apparently mean fiddling with
> >> iomem_caps once all vCPU-s have entered x2APIC mode.
> > 
> > Urg, that seems ugly.  It would also need undoing if the APICs are
> > reverted to xAPIC mode?
> 
> Right.
> 
> >> With LAPICs not
> >> normally being elsewhere, question is whether this corner case actually
> >> needs dealing with. Yet even if not, commentary may want extending, just
> >> to make clear the case was considered?
> > 
> > As said above, for both HVM and PVH Xen doesn't allow moving the APIC
> > MMIO window to anything different than APIC_DEFAULT_PHYS_BASE.
> 
> I was talking about the real one Xen uses.

Oh, OK, I was confused by the context I think, sorry then.

Roger.

