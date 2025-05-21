Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E0ABF8EE
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 17:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992064.1375851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl6s-0001Gb-PW; Wed, 21 May 2025 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992064.1375851; Wed, 21 May 2025 15:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHl6s-0001DT-Me; Wed, 21 May 2025 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 992064;
 Wed, 21 May 2025 15:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHl6q-0000eI-SR
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 15:11:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef5d9f1f-3655-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 17:11:56 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so55826815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 08:11:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca8cfb8sm19260710f8f.85.2025.05.21.08.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 08:11:55 -0700 (PDT)
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
X-Inumbo-ID: ef5d9f1f-3655-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747840316; x=1748445116; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXnmpTrr3K1gmCCnuinpatIWCk0RMdlAKsuvR6yAbGg=;
        b=aSt1KmOderHVo0lxpPuKgs9kb5et7Jp+IBsrTC7iNXJoUYO8eZyQKofDf/4ATq52BZ
         GFlwRKjRnq3TtWgq1Z8C/g/V2nnYKdP6f2d/rnldnBpO+Jecpjp3Zi76NGdQhZuv3dl4
         k1OcCRBCStzjVIEMa3SdVoi1PITgVw3uyE7M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840316; x=1748445116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXnmpTrr3K1gmCCnuinpatIWCk0RMdlAKsuvR6yAbGg=;
        b=dJ/3f17AxAyTj6qQiyi4kANZeMt9vyTcRoD+gGr+LMatZKd20mEQ/1PyARHWbaISMW
         Zd0PGpEP9NGiRzF7CWqcWdBsq4CMP/lPxzKq3cG/PCRRH/AgdMKTdkgIzcspTmSzIuZg
         go6yTtQ4K54tAbuBwGiLb3zNs7V3vdPFgq8UJYhxMoRI39rnnuT+MPRzljNhesjeuybY
         pMVDhkoJVzb2D5KL8HuAJSNKeuA1oN2HRShbAhIMHYGJE72b2w6WVLUeN0eNMmqkPJvk
         BReKPL/Q39GdVA0tYDCtVzCY4O2CbUJyvmHzQCqw++VNpGjd3iZwWJnWj3smcwx05V99
         NjEw==
X-Forwarded-Encrypted: i=1; AJvYcCVJExgJlRmCnjKyr9JLR28h3upIVC7tj+eW4hQHBAQEm38nIh2rU5bmXQxrjfCVr+/C+jPas0Q5alk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvdC420YA7PL6dqPSEYoyulm9ktKW335TyydFF/MpeBb0RRQCp
	nWTUXHlM/QTzqEOHyp3Jwt2Tx25/F97EU2jEeVq3sebVK+WvjX1wUtMuPcztQD1Cpzo=
X-Gm-Gg: ASbGncuCOxm+OUmCkoOGhgxZUGWZ1H8JTNwpI6+0ykBDhC8wMwFOq2aukGF/XLKGXVZ
	pfwj/CUUMqyOk3TUJ9zdPPYscphul2qTYG0tkNatBh8pEgh5itqB9DL9WPPyZn60/J5OnlP1Cli
	Iod2SKLY2c2Pn8aGr9OMfKTBBgE6XIKF7ZXL/U6lRfIKZgeKRr8C+//GtztUNzAnq+c3H31dhUI
	SYTyzx158Yh4DmTpFBAq8FQSmLYu+weHl8jGcC/EwN/t8egezjcH44WAFicJ/skpEYP/YcOl+6N
	15bsRbQiCHkw8SWWkXXhuETZsBtEHr5liniPy/mPer0ylcRE2athnvBEPfK4uBkPgiax4AGz1fy
	hMRfHqSj3NMb8+ChHR4Y=
X-Google-Smtp-Source: AGHT+IFOO3MVFe63bkQsbYDOCiHerigcjdv7iOVa4TwCOpUysZdyod9DGZPN5b52lcpPpmSL+pQDuA==
X-Received: by 2002:a05:6000:40cf:b0:3a3:581f:9af9 with SMTP id ffacd0b85a97d-3a35c822085mr20833344f8f.7.1747840315831;
        Wed, 21 May 2025 08:11:55 -0700 (PDT)
Date: Wed, 21 May 2025 17:11:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Victor M Lira <victorm.lira@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
Message-ID: <aC3tOtgBwYKaWMIL@macbook.local>
References: <20250516083159.61945-1-roger.pau@citrix.com>
 <7bbc1569-672e-42a7-a5b8-4187282fcb18@suse.com>
 <aC26W4Brxl-laNif@macbook.local>
 <4ea08d6d-c2e1-40ad-a31e-554e7bb5cc6c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ea08d6d-c2e1-40ad-a31e-554e7bb5cc6c@suse.com>

On Wed, May 21, 2025 at 04:31:33PM +0200, Jan Beulich wrote:
> On 21.05.2025 13:34, Roger Pau Monné wrote:
> > On Wed, May 21, 2025 at 10:29:26AM +0200, Jan Beulich wrote:
> >> On 16.05.2025 10:31, Roger Pau Monne wrote:
> >>> For once the message printed when a BAR overlaps with a non-hole regions is
> >>> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> >>> is quite likely overlapping with a reserved region in the memory map, and
> >>> already mapped as by default all reserved regions are identity mapped in
> >>> the p2m.  Fix the message so it just warns about the overlap, without
> >>> mentioning that the BAR won't be mapped, as this has caused confusion in
> >>> the past.
> >>
> >> I was trying to get back to this, but my attempt to use this "fixed
> >> message" as an anchor failed: You don't modify any existing message, and
> >> hence I was unable to determine which other message you refer to here.
> >> None of the ones I looked at appear to fit this description.
> > 
> > OK, it's a bit tricky.  Note how the new implementation of
> > pci_check_bar() unconditionally returns true, which means the message
> > in modify_bars() will never be printed on x86.  Instead a slightly
> > different warning message is printed in the x86 implementation of
> > pci_check_bar().
> > 
> > That's what the above paragraph attempts to explain.
> > 
> > Maybe I need to adjust the last sentence so it's:
> > 
> > "Avoiding printing the warning message in modify_bars(), and instead
> > print a more lax message in the x86 implementation of pci_check_bar()
> > to note the current BAR position overlaps with non-hole region(s)."
> > 
> > Does the above make it a bit clearer?
> 
> Yes, it definitely does. And with use of that I'm now also feeling reasonably
> confident to offer
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, sorry this was a bit dense.

Roger.

