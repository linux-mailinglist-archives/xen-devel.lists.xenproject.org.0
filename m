Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E73854519
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680294.1058342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBV4-0004UW-Ts; Wed, 14 Feb 2024 09:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680294.1058342; Wed, 14 Feb 2024 09:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBV4-0004Sm-Qs; Wed, 14 Feb 2024 09:24:18 +0000
Received: by outflank-mailman (input) for mailman id 680294;
 Wed, 14 Feb 2024 09:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raBV3-0004Se-LN
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:24:17 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d30e0114-cb1a-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:24:16 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d0e520362cso19236881fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:24:16 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 y20-20020a05620a44d400b00783f70bc497sm3629136qkp.115.2024.02.14.01.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:24:15 -0800 (PST)
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
X-Inumbo-ID: d30e0114-cb1a-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707902656; x=1708507456; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Y++7tDJal4EDST6cp56TTjHOaOCdTKOVIVgLKMXSuY=;
        b=EK6/FvGifrH4Z+/itAC/pLEvUbZPtQIjgBd8tircgeFHXQi9C3KG4sG8pB3DIEe++F
         5YN/WktGsC1cnF9LYZDn7EbZfPnU3M5J52hbVmNZILHn+Y4gAEpoZ/D+5Ix+EVZvB9Dp
         L4/I5P7gRg/a+h9OI/+4TRBF3lkShzILMmERc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902656; x=1708507456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y++7tDJal4EDST6cp56TTjHOaOCdTKOVIVgLKMXSuY=;
        b=rB2yXeLRtrWCeCWB3oh2Wk1Q/RcJb58GDfNvaH3x3azvFb77h0QQBXru7q1LnzkW/M
         R+0NSNTFuDyyYKXqSGrFP7i9Rp/vKwlzKqTDT4YEvlPgFxWRJuDlcYEWLrYjXuDfHZhd
         F2+3fXR7nmT1Pxp3nB6RURSc7Hzg7w/RgKfUhZblmZlWQkHsa0/4hcooKolVf/dzYViS
         htZG0V5KhMkBA6tKKKIHUP4zvKwF5vhGjovHcraIvDmjDlDq/RgBhbWfbxIyLCQ/W9kN
         km4UVhmUqqIrAfhvWZww/Fxw6lZx+tx4yIhede1Fd901oVqOArWrgn+b1Ru9pxmEV6mL
         H6AA==
X-Forwarded-Encrypted: i=1; AJvYcCV1/yd252cC+WMHXQWrbGReRem559Z8fShYCg3bKlXFzI4R0rz4XKg3kNEm7VCQnr1dQc2IuZbVI2GscQcZY1wdfJeBUy1pLhdyZIhx/Ok=
X-Gm-Message-State: AOJu0YxGz3JhcX38m1hwsDnQbNp48FXQ40BfyesRMGD6fUHskCbOSETz
	mJrg7sWvziWGAymP8KLMgmIhulHt3fSvw2C+ql9Ms7QUqM8AslVCsVtLkIm++O4=
X-Google-Smtp-Source: AGHT+IH4RukR/OWcByYv3+3UWDmNJd5sUZtyUEuQ04CvQHsT/0RVvywXmlkH89OguYCuRFdKuZpHSw==
X-Received: by 2002:a2e:9f02:0:b0:2d0:84b1:bd3e with SMTP id u2-20020a2e9f02000000b002d084b1bd3emr1375628ljk.12.1707902656122;
        Wed, 14 Feb 2024 01:24:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAu9ugG0QXE34tjUd9SThII5hnHJeI20JYgU9dZIwNuSXh+92YqBWleousBSKQW16cWJVtGxHK/gH7AxBATxmq82rgphCn/eALdiICSnz9BOM9Cq6U5pzZTOT52oJaJ5u3hpz4
Date: Wed, 14 Feb 2024 10:24:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common
 RMRR checker
Message-ID: <ZcyGvW-Q4MFvDTSu@macbook>
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com>
 <Zcx9w5eZkXiN9s66@macbook>
 <c84a640e-3332-4f2d-9c4a-c6806bb2da67@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c84a640e-3332-4f2d-9c4a-c6806bb2da67@citrix.com>

On Wed, Feb 14, 2024 at 09:00:25AM +0000, Andrew Cooper wrote:
> On 14/02/2024 8:45 am, Roger Pau Monné wrote:
> > On Wed, Feb 14, 2024 at 08:45:28AM +0100, Jan Beulich wrote:
> >> On 13.02.2024 23:37, Andrew Cooper wrote:
> >>> On 12/02/2024 2:38 pm, Jan Beulich wrote:
> >>>> On 07.02.2024 16:34, Roger Pau Monne wrote:
> >>>>> Use the newly introduced generic unity map checker.
> >>>>>
> >>>>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
> >>>>> ranges would end up being mapped anyway even if some of the checks above
> >>>>> failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
> >>>>> is not supported for PVH, and it's deprecated.
> >>>>>
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>> XenRT says no.
> >>>
> >>> It's not clear exactly what's going on here, but the latest resync with
> >>> staging (covering only today's pushed changes) suffered 4 failures to
> >>> boot, on a mix of Intel hardware (SNB, SKL, SKX and CLX).
> >>>
> >>> All 4 triple-fault-like things where following a log message about an RMRR:
> >>>
> >>> (XEN) RMRR: [0x0e8 ,0x0e8] is not (entirely) in reserved memory
> >>>
> >>> not being in reserved memory.
> >>>
> >>>
> >>> First of all - fix this printk() to print full addresses, not frame
> >>> numbers.  It's obnoxious to cross reference with the E820.
> >> Perhaps better indeed. The stray blank before the comma also wants dropping.
> >> And while looking over the patch again, "mfn_t addr;" also isn't very
> >> helpful - the variable would better be named mfn.
> > I can adjust those in the fix, see below.
> >
> >>> It's very likely something in this series, but the link to Intel might
> >>> just be chance of which hardware got selected, and I've got no clue why
> >>> there's a reset with no further logging out of Xen...
> >> I second this - even after looking closely at the patches again, I can't
> >> make a connection between them and the observed behavior. Didn't yet look
> >> at what, if anything, osstest may have to say. Do I understand correctly
> >> that the cited log messages are the last sign of life prior to the
> >> systems rebooting?
> > I've found it:
> >
> >     for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
> >
> > Should be:
> >
> >     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
> >
> > mfn_add() doesn't modify the parameter.  Will see about making those
> > helpers __must_check in order to avoid this happening in the future.
> 
> There's only a single thing in this function which wants an mfn_t. 
> Everything else is operating on raw paddr_t's.  I'd suggest converting
> types at the start and using plain numbers.

I don't have a strong opinion, can do (but then likely as a followup
patch).

> Also, while I hate to nitpick, iommu_unity_region_ok() really ought to
> be iommu_check_unity_region().  It is not a predicate (given the
> additional fixups), so the function name shouldn't read as one.

I'm afraid those two read the same to me.  I can change, but I don't
see how the additional fixups modify how the function should be
named.

> Also, the "not (entirely) in reserved memory" line ought to have an ";
> adjusting" on the end to make it clear that it's making an adjustment in
> light of finding the range not reserved.
> 
> Finally, the "can't be converted" error should render type, even if only
> in numeric form.

This was all inherited from the previous IVMD code.

> What do we do when there's a region that's marked as RAM?

We fail to initialize the IOMMU, which is what we did previously.  In
v1 of this series there was a further patch that would panic Xen if
such overlap was found.  That however raises the question if we need
to parse IVMD/RMRR regions even when the IOMMU is disabled, so that
the panic would also be triggered even when not using the IOMMU (as
the device will still be accessing the regions in the RMRR/IVMD
ranges).

Thanks, Roger.

