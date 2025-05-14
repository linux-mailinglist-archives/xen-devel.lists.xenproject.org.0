Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C5AB6A00
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 13:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984212.1370391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAJd-0000Fj-08; Wed, 14 May 2025 11:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984212.1370391; Wed, 14 May 2025 11:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFAJc-0000DS-TB; Wed, 14 May 2025 11:30:24 +0000
Received: by outflank-mailman (input) for mailman id 984212;
 Wed, 14 May 2025 11:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFAJb-0000DM-4V
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 11:30:23 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d105a49f-30b6-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 13:30:20 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-23198fcdeb0so7458635ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 04:30:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc680515esm97298155ad.0.2025.05.14.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 04:30:18 -0700 (PDT)
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
X-Inumbo-ID: d105a49f-30b6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747222219; x=1747827019; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHSq0f3BjhfKhNt4nQQupbzpr4wf+pehGJ7jwaLBkzg=;
        b=dz9bxLEICPMQfWtX0S2ZxVprnn9HhD6bLTtsKUrRTSrBQrM2lxVj0P5bXtvmW6dDPd
         hpJmEtQWXeevBCyh2/YeIM+Rx7u3lXOLCMZMrMq4XsGhORFHN/TEcWc1B07tmvZ6p9tL
         LpExI5kJqKYEKXmVuCncWa5BzpNEAlXg2aVzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222219; x=1747827019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHSq0f3BjhfKhNt4nQQupbzpr4wf+pehGJ7jwaLBkzg=;
        b=VnljqaGP4ligZDlEcC3Mm+/Xckf+matZAf4k/E6H3NIpKgewdLdQEYfMUMwU2mZvPl
         4zDzfyx4+/Fh9XaQzfUeKbaw9PPdTARt8RrgGdAU5AMFvXF0qn9/7LYAWXvcO/uCIzZR
         XLEjV1Pvfc7rJQBi/3JtaEOu/a54WGWlvbv50Gr+NWtcRiNDeiu3QrtcC8jg2SYIC+E5
         k+yelRNzUQeP+xYavpZZ+Yn9sdsfNiMzE50J26a7vCG0j9xQeUMYowIx3hPoNeJJ0ZTx
         iOyO83IKFQTklU93MeT8l3sZEuMcAOhmTvFQoy+mJdPTOij9C294CWGwxWTaMcE2DGzW
         SbWg==
X-Gm-Message-State: AOJu0Yww/P8EznjUnc0bVvvGhO5H7Z6oyWNxVjixvLz7nLbHwy2LRfJP
	9ubjhtX81owCmKifh+7fu6mewdhhUKdYgoR2zA8xtg4uCJC0BlWpkNswkbnUUBg=
X-Gm-Gg: ASbGncsz8sLA0/FQ13uC8uUvia9CL+0D8uasEXHOaPLs8/WMLwMY5D/j+EzZ2y0o8iB
	6mGc7v0O29gO+Dn+5PduK5OutLAoXJ/BEqR8h7hQsTbzqHx1iQ+yOxUXzTD4fRirA6HGmvSvQy/
	cC9cRJ2+m8L9e0F/eKR2ILmP7VLTPMItJlV5aCAkBsnZP7f6P694A1iu7TIM7EVcSUw7aknR5F8
	M1Gle8RgkLySxPBGE41IVGWYgvGIAz0Ox/y6I7NsPVt1od0kzmOgCAgoV3PDDumTRo0ZPCZ7LIK
	ognDjaykTv/ZBGY9CvZg59EXUps0oGVcxw0PqMIvOttw+9dyo92SwNFh
X-Google-Smtp-Source: AGHT+IF1V9hP0WGJ4eQhJSnXj108XtX4n2i+3aRlISq9h0hE6SDaQoLkfCex5MNS+ikZ5pgtZWOIlQ==
X-Received: by 2002:a17:902:c952:b0:223:5e54:c521 with SMTP id d9443c01a7336-23198013ceamr49369695ad.0.1747222219268;
        Wed, 14 May 2025 04:30:19 -0700 (PDT)
Date: Wed, 14 May 2025 13:30:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
Message-ID: <aCR-xQlo9LQfeLmb@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <aCNMEadsYoIKLbSp@macbook.lan>
 <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>

On Tue, May 13, 2025 at 03:54:56PM +0200, Jan Beulich wrote:
> On 13.05.2025 15:41, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 11:45:22AM +0200, Jan Beulich wrote:
> >> We allow its use for writeback purposes only anyway, so let's also carry
> >> these out that way on capable hardware.
> > 
> > "for writeback purposes only" > is such the case because we cannot
> > guarantee the guest in which state the cache will be when resuming
> > from a wbinvd operation, and hence won't be "clean"?
> 
> Not really, no (see below). This is inferred from us limiting flushing
> operations to domains with physical hardware assigned plus the fact
> that we avoid the overhead in vmx_do_resume() when the IOMMU is snoop-
> capable. (Plus I did all this work over 2 years ago, and hence I now
> don't recall what other commentary I may have come across saying
> things along these lines.)
> 
> Which, thinking about it while writing this reply (and also taking
> into consideration Andrew's earlier reply), may be all wrong.

As part of my series I was introducing a new option to allow guests
cache control even when no devices are assigned.  My intention was
that whether a guest needs cache control or not is known at creation
time and stays immutable, and to also allow easier testing of the
cache control code without a physical device assigned.

> > It's my understanding that the same is possible on native, as the CPU
> > might speculatively pull lines into the cache.  So there's no reason
> > for an OS to use wbinvd if wbnoinvd is available?
> 
> Speculatively pulling data into the cache is possible only when page
> table entries permit caching. Hence after changing all mappings of a
> certain page to UC, an OS may have a need to ensure that no data of
> this page is left in any cache (and it can't be pulled back in
> speculatively then).

Is this realistic taking into account the OS is running virtualized?

At least with Xen there's the direct map, so once context is switched
back to Xen (for example to execute the wbinvd itself) there's no
guarantee the CPU won't speculatively populate the cache with entries
from the direct map.

Thanks, Roger.

