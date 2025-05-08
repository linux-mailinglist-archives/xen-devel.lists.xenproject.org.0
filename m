Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE9AAF5BF
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 10:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979057.1365776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCwgf-0004h5-VV; Thu, 08 May 2025 08:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979057.1365776; Thu, 08 May 2025 08:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCwgf-0004fc-Sc; Thu, 08 May 2025 08:33:01 +0000
Received: by outflank-mailman (input) for mailman id 979057;
 Thu, 08 May 2025 08:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCwge-0004fW-9l
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 08:33:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b2c620f-2be7-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 10:32:58 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so4606555e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 01:32:57 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441d15e211asm67356785e9.1.2025.05.08.01.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 01:32:56 -0700 (PDT)
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
X-Inumbo-ID: 0b2c620f-2be7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746693177; x=1747297977; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NH6Wu4VjYQjNA6A0nR0ihgWpbNXXm1I3htBfJJdz8M=;
        b=frfC8oDwMZFt98JcxcNoK0Yh+DbzN/mK1ZEOxaIy9v0wKypLFlDSGdgCEsn/qfR55S
         lTOsUKXAJMNKiXoxudXekWsj6YqpBlnqOnBD8bf81O2w5L0KDhhzuUwUpVPquIZhe3lE
         GDsHSPp3vBFoZfqZl8jMCTU7rI2T9xzkYed0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693177; x=1747297977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NH6Wu4VjYQjNA6A0nR0ihgWpbNXXm1I3htBfJJdz8M=;
        b=JnmO+7+XYK1Wk+gNjzUNYtq6DvYMM99QzTVyNaBgqf0RbA7Gr7pir4eMDKL8QAGiPQ
         oXfhRirar6lxFRavQHpBlTkaQjk46zPNhBBF6o4DAfFd5nLRjQM+bjsOWyAXT3x1e35z
         ZIZbaqqY2gwM1Je1b21Wue3lGPyfQRXN7qspamgAuiBoMzHSz/OIYpjx/pGdmuJ6nsBy
         tuH6MXDnxlOdCkOVs9/ycOAAtKgdNgTh0RqDo2uQcvPlrGLWo/Yt/uyGGWbQXXneFg/l
         5RPEm28EDbFmm7roW5hGlrIP96UasehYClsPWiEzDXOnLj/Tk0TdZQG423ePItyLYQll
         59YA==
X-Forwarded-Encrypted: i=1; AJvYcCX8e5V9rS2mjdCiJm0t7jBvcwOTcSda84V628Z9lJbTbLpPwwaleBxJTpVjgp5PqdIwkFRdu7hayBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMVcWI5v1RswIgmPbii2b6kWLcCq8EzBGj2CXUnvoPrZBXGAYF
	2xEq1YrNQwkMhm24xlQZRMFWMnJ97oSFye4sasuBg3VZi3jSDBgbDo6CVfnDjtw=
X-Gm-Gg: ASbGncvaFeCR40CGWh0C0o3EgluYnJZ64dTXg2ANf7gMra57/WIbbhYgJZqwmUMoHCO
	+yHBXAGGeqAzVXBZJZCaXv3ABPlVhlUXeRqRiHWP2JRtAfjkFGtVuVDy7zixv+zD+OkZev6+k82
	R2wcrePNd56il/f0xSSGjniaJ4dQND77EY4oG9i5mcdVaO1e2C5SCFNrjGrgZFO0hvDnO606ule
	yGEprlIhW6avP/jYXPCpQnsJXoNMi23zdKGo8rBs+1L+jLTdP76N54Zd6/pUVMl2IZ03Zlukb8C
	/K9p6QGxP8SnZI1b7JF4GIBR78KRFcjq8S9s05KfKjHRxQ==
X-Google-Smtp-Source: AGHT+IEBVwcrEcZ+cvB6BdsrjTxGYf9IEerIrEjRWj3BP2GJl5HFjQx1chAbZ19ZttRXmKI4bqie7A==
X-Received: by 2002:a05:600c:c0d0:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-442d046e76emr21956505e9.4.1746693176804;
        Thu, 08 May 2025 01:32:56 -0700 (PDT)
Date: Thu, 8 May 2025 10:32:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
Message-ID: <aBxsNypPugcu2wZ0@macbook.lan>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan>
 <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
 <aBsPbyqL0XpjEdeo@macbook.lan>
 <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>
 <aBucENdwFYacsQAX@macbook.lan>
 <47ee8b59-7b6a-4248-a4bd-f5be9f00f562@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47ee8b59-7b6a-4248-a4bd-f5be9f00f562@amd.com>

On Wed, May 07, 2025 at 05:17:58PM -0400, Stewart Hildebrand wrote:
> On 5/7/25 13:44, Roger Pau Monné wrote:
> > On Wed, May 07, 2025 at 09:38:51AM -0400, Stewart Hildebrand wrote:
> >> On 5/7/25 03:44, Roger Pau Monné wrote:
> >>> On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
> >>>> On 5/6/25 07:16, Roger Pau Monné wrote:
> >>>>> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
> >>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>>>>>  static int vpci_register_cmp(const struct vpci_register *r1,
> >>>>>>                               const struct vpci_register *r2)
> >>>>>>  {
> >>>>>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>>>>>      const struct pci_dev *pdev;
> >>>>>>      const struct vpci_register *r;
> >>>>>>      unsigned int data_offset = 0;
> >>>>>> -    uint32_t data = ~(uint32_t)0;
> >>>>>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
> >>>>>
> >>>>> This seems kind of unrelated to the rest of the code in the patch,
> >>>>> why is this needed?  Isn't it always fine to return all ones, and let
> >>>>> the caller truncate to the required size?
> >>>>>
> >>>>> Otherwise the code in vpci_read_hw() also needs to be adjusted.
> >>>>
> >>>> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
> >>>> assert that the read handlers don't set any bits above the access size.
> >>>
> >>> I see.  That kind of diverges from x86 behavior, that AFAICT (see
> >>> memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
> >>> the size of the access.
> >>>
> >>> Maybe it would be better to instead of asserting just truncate the
> >>> returned value to the given size, as that would allow to just return
> >>> ~0 from handlers without having to care about the specific access
> >>> size.
> >>
> >> The impression I get from [0] is that that on Arm, there's no benefit to
> >> performing truncation in xen/arch/arm/io.c. Doing so would needlessly
> >> affect other Arm internal read handlers (e.g. vGIC).
> > 
> > But isn't this truncation desirable in order to avoid possibly setting
> > bits outside of the access size?
> 
> On Arm we expect the read handlers to have the bits above the access
> size zeroed. If a read handler sets bits above the access size, it could
> indicate a bug in the read handler. As a reminder, this was already
> discussed at [0] and a patch was already committed 9a5e22b64266
> ("xen/arm: check read handler behavior"). Perhaps we could both keep the
> ASSERT (for debug builds) and perform truncation (for release builds) in
> xen/arch/arm/io.c:handle_read(), but that's patch for another day.
> 
> [0] https://lore.kernel.org/xen-devel/20240522225927.77398-1-stewart.hildebrand@amd.com/T/#t

Oh, I see.  I already expressed concerns on that thread about forcing
the truncation to be done by handler implementations vs truncating in
a generic place ahead of propagating to the registers.

My main concern is when returning ~0, as it seems cumbersome to have
to truncate that, and I think we do blindly return ~0 on more than one
x86 IO handler.

> >> For vPCI
> >> specifically, however, we could potentially perform truncation in
> >> xen/arch/arm/vpci.c. So I guess it's a question of whether we want to
> >> give special treatment to vPCI compared to all other read handlers on
> >> Arm?
> > 
> > I would think doing the truncation uniformly for all reads would be
> > better, as we then ensure the value propagated to the registers always
> > matches the access size?
> > 
> > I'm not expert on ARM, but it seems cumbersome to force this to all
> > internal handlers, instead of just truncating the value in a single
> > place.
> 
> To move this forward, I suggest performing this truncation in
> xen/arch/arm/vpci.c:vpci_mmio_read(). This will be a single place to
> perform truncation for Arm vPCI, and will not affect other Arm internal
> mmio handlers.

You already have the mask there, so it should be easy to do:

*r = data & invalid;

To truncate the value.  Could you send that as a separate patch with a
Fixes tag?

Thanks, I'm sorry for not realizing about this before.

Roger.

