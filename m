Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1B484732
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 18:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253378.434528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4nvw-0000GX-Fn; Tue, 04 Jan 2022 17:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253378.434528; Tue, 04 Jan 2022 17:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4nvw-0000DB-BN; Tue, 04 Jan 2022 17:49:16 +0000
Received: by outflank-mailman (input) for mailman id 253378;
 Tue, 04 Jan 2022 17:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9eR=RU=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n4nvv-0000D5-KH
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 17:49:15 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0cb8aa9-6d86-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 18:49:14 +0100 (CET)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id 6301B18000B3
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 12:49:12 -0500 (EST)
Received: from mail-yb1-f172.google.com (unknown [10.20.151.178])
 by mta-09.privateemail.com (Postfix) with ESMTPA id 3F68518000AD
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 12:49:12 -0500 (EST)
Received: by mail-yb1-f172.google.com with SMTP id w184so90420284ybg.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 09:49:12 -0800 (PST)
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
X-Inumbo-ID: a0cb8aa9-6d86-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641318552;
	bh=8d5er3GnDxh58zzZS/5J62jxJpLw/y3t71mCWV1FLNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SpKAl0/3vuPh4LoZAxzHcfCJHPxFe9uKnzt6UFQRDYuUsiOF5GlOufp2wvxNlxjYb
	 8UEWLCEooJ08I4szhS8l/I0zjAJvS2teLGPr6NhTSapes19NoXGDqdxOOV9OqmsgrE
	 Hs8cu1EcYowgq6sz9tdBiuN5Mc1EQGScCvaK4hiF0FvXYR2mBKS/+EgszQ06jdj0c3
	 Ddxvw8ySLrGHVq1GoCKwaXvz9vC3ItU+wf/U9HZxxtTevnehl9ngyklvfyXC9t4I+u
	 tDAQOhpCGUQVApkZnDKR9+GETOsKCIChdJuEszmXtSuryS0J6EqGjrax/ZGx4gcdSe
	 JftVyLrgnhQ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641318552;
	bh=8d5er3GnDxh58zzZS/5J62jxJpLw/y3t71mCWV1FLNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SpKAl0/3vuPh4LoZAxzHcfCJHPxFe9uKnzt6UFQRDYuUsiOF5GlOufp2wvxNlxjYb
	 8UEWLCEooJ08I4szhS8l/I0zjAJvS2teLGPr6NhTSapes19NoXGDqdxOOV9OqmsgrE
	 Hs8cu1EcYowgq6sz9tdBiuN5Mc1EQGScCvaK4hiF0FvXYR2mBKS/+EgszQ06jdj0c3
	 Ddxvw8ySLrGHVq1GoCKwaXvz9vC3ItU+wf/U9HZxxtTevnehl9ngyklvfyXC9t4I+u
	 tDAQOhpCGUQVApkZnDKR9+GETOsKCIChdJuEszmXtSuryS0J6EqGjrax/ZGx4gcdSe
	 JftVyLrgnhQ2g==
X-Gm-Message-State: AOAM533jX5127UYR3rbofgY5MufgXTo6tVGmzHojUrpqjsoO7TcYDgBT
	nzN/cchgnhf9HLukQP9tE4jv+7dkLrJdebzBo/Q=
X-Google-Smtp-Source: ABdhPJzhm0ZtrInwx8+H2cgSW4bWoBw6laB9IJ8H/hHHNllwtn/7JRCtWj+Gn7RkkHAyFFK1S+CDUdv1+LZY0LHdIfk=
X-Received: by 2002:a5b:94b:: with SMTP id x11mr43831717ybq.344.1641318551532;
 Tue, 04 Jan 2022 09:49:11 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com> <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com>
In-Reply-To: <d1b6aede-2c0a-df7a-7815-73ad4d795899@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 4 Jan 2022 12:48:35 -0500
X-Gmail-Original-Message-ID: <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
Message-ID: <CABfawhmGxHBEC1M2=zo11K11Yr_TdWFkkVpDpVimy_uvD4nxyQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] x86/altp2m: p2m_altp2m_propagate_change()
 should honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

> I may be entirely wrong and hence that part of the change may also be
> wrong, but I'm having trouble seeing why the original
> "!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
> goal there to pre-fill entries that were previously invalid, instead of
> undoing prior intentional divergence from the host P2M? (I have
> intentionally not reflected this aspect in the description yet; I can't
> really write a description of this without understanding what's going on
> in case the original code was correct.)

This function only gets called from p2m-ept when the hostp2m gets an
update. In that case this check goes through all altp2m's to see if
any of them has an entry for what just got changed in the host, and
overwrites the altp2m with that from the host. If there is no entry in
the altp2m it doesn't pre-populate. That should only happen if the
altp2m actually needs it and runs into a pagefault. So it is correct
as-is, albeit being a subtle (and undocumented) behavior of the
hostp2m and its effect on the altp2m's. But that's why we never
actually make any changes on the hostp2m, we always create an altp2m
and apply changes (mem_access/remapping) there.

Tamas

