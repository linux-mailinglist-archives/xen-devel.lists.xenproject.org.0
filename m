Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EAB0E07F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 17:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052874.1421644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEx2-0004VB-Bm; Tue, 22 Jul 2025 15:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052874.1421644; Tue, 22 Jul 2025 15:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEx2-0004Sb-8n; Tue, 22 Jul 2025 15:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1052874;
 Tue, 22 Jul 2025 15:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D4NL=2D=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueEx1-0004SV-3A
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 15:30:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3be6176-6710-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 17:30:42 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso59259665e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 08:30:41 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b75e9e9sm134818545e9.34.2025.07.22.08.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 08:30:40 -0700 (PDT)
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
X-Inumbo-ID: d3be6176-6710-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753198241; x=1753803041; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+m2Brmoz31U4ntdMblBB8Jnl8m0MeDUoj/KlSMVkxE=;
        b=EdnwO/geUe2FOV7tSh67pQeqZGmByTl9ngB7e0D5xM0wb5RSLzuAySzcRL5ZrJPkPe
         5hlXyznQexMJmf87BaeszAxAPRP4SJaC/gLXEDlzyR2ugp0xe2ZngmnrnXrmKiZ7Q0gU
         hNBaMnlyudx1jNNZZ37x03s3ycrjMpljdczDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198241; x=1753803041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+m2Brmoz31U4ntdMblBB8Jnl8m0MeDUoj/KlSMVkxE=;
        b=k1FQTNBWb9zyI98GzDQiIH9FLST4TyqFri1X9RYhxiUhFx1ACgNei59Spim0O+Blek
         yEuCtQijqnvBd4nO3ARowEdIVgbhTog3J2rr4av9ZbeEaRaQJEFrGh3xuWEy/zhLFoep
         PGacX53LwEXqO5B69nF0CMgLZ68EMj/2a3GgTKxxOjx74DdnoB8ktETaMGuD2RscrZN1
         7oO58pVex1oGpcfafE2f+s/fYA8Ac1sscHG/wepq+CN67VgLyFNDaG0OwoUfgQZC571V
         kCTORKLCC8nRe9eE5a2roLZfp7Mhryawz3d2e52mzVPN1EpnN3pcT4iquW2wyPxSnuIV
         XlAg==
X-Gm-Message-State: AOJu0Yzd/zEFKSZlNnteaoNwyIhSnft/RW5OyHxdo4okUcH9VpxjEu0y
	nHxvHCOEpqLemAI/wn0RH5HMhdXy+3PzQH5twiX9+98LQwDr7MnCQg/ZyXD8wCSJwJo=
X-Gm-Gg: ASbGncsJX0P6b/OyC0KMo2l0enBeVs9Z1OJkq3hEQexfyCYDBycI8EI+OXrwrxkp9Cm
	7e19RQiffBTWbu2KAnwuba7+zqmCwMHxroro1X6jl25C6b7thu5iaZSgMzFzWGhjFGhMO/YSFv3
	jBY+xjzgkKCS2rQeuDH/L9yrjmwmWu2aTyKwgjuC/VMD2LzdlNShYzANhyjpaNAvep6se26lPF5
	UM5BJWOp+WEmMovLIecChtxQ53WaxHvYskPsLCa/5muAuABuUAapYsgW4UNGG+GJSApN8vtXEuu
	dljNtuBH0uyVo5b/LIdOwzdxU8M/5RCHh2v6v9Ud1f7B3Ka0zh5vZmUuebbM3XaZblY4j+7oC8E
	0d3wAoVUBZHM1taJtsK1hTrB6LxwZ6ejvOyg80y8VMmFza4vx86eFKT1OqEC46GCO5Q==
X-Google-Smtp-Source: AGHT+IE89uGE07Zo81r2vlfJOYVtH+hKxjUKqK+/Tzk4dzgfDn8kiXCh0Y+kSbHA/4ynRS0PoOd4Lg==
X-Received: by 2002:a05:600c:858c:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-4562eb80e1amr188851175e9.18.1753198241121;
        Tue, 22 Jul 2025 08:30:41 -0700 (PDT)
Date: Tue, 22 Jul 2025 17:30:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/livepatch: fixup relocations to replaced symbols
Message-ID: <aH-un8ZZ4M4bdY7J@macbook.local>
References: <20250716160007.92461-1-roger.pau@citrix.com>
 <CAG7k0Epu6XomC=b7eG8xgcVvXpmoTOUQdC7yD9LsmEHOKTv-gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Epu6XomC=b7eG8xgcVvXpmoTOUQdC7yD9LsmEHOKTv-gg@mail.gmail.com>

On Mon, Jul 21, 2025 at 04:51:33PM +0100, Ross Lagerwall wrote:
> On Wed, Jul 16, 2025 at 5:00 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > In a livepatch payload relocations will refer to included functions.  If
> > that function happens to be a replacement for an existing Xen function, the
> > relocations on the livepatch payload will use the newly introduced symbol,
> > rather than the old one.  This is usually fine, but if the result of the
> > relocation is stored for later use (for example in the domain struct),
> > usages of this address will lead to a page-fault once the livepatch is
> > reverted.
> >
> > Implement a second pass over relocations once the list of replaced
> > functions has been loaded, and fixup any references to replaced functions
> > to use the old symbol address instead of the new one.  There are some
> > sections that must be special cased to continue using the new symbol
> > address, as those instances must reference the newly added livepatch
> > content (for example the alternative patch sites).
> >
> 
> Would it be possible to fix this at build time instead by generating the
> payload such that relocations to changed functions always point at the
> Xen function rather than the included function?

Hm, it's kind of complicated (I'm not saying it's impossible).  I
think it will require renaming the replaced function symbols, and then
introducing new unresolved symbols that reference the existing
functions, and adjusting the relocations to point to those new
symbols.

Then Xen would resolve those symbols and the relocations would be
calculated using the old addresses.

You can not unconditionally replace all the relocations that point to
replacement symbols, as some of the relocations will need to point to
new vs old instances (just as this patch does, where not all
relocations are adjusted to point to the old addresses).

I can give it a try, but looks more complicated than the approach
here, as it requires crafting extra symbols to add to the payload, and
adjust relocations.

> This seems preferable to me rather than making the runtime code more
> complicated.
> 
> Of course, neither approach would fix all cases - if the function is
> completely new calling it would still page-fault after reverting the
> live patch - so the usual care needs to be taken when creating live
> patches.

Indeed, storing pointers to newly introduced functions won't work,
that needs care, but it should be easier to spot by code review of the
livepatch.  Would be nice to get an automated way to prevent such
pointers from getting stored, but I can't think of a way to do it.

Thanks, Roger.

