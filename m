Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B157600CD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 22:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569245.889600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO2df-0007mG-MN; Mon, 24 Jul 2023 20:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569245.889600; Mon, 24 Jul 2023 20:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO2df-0007jM-JP; Mon, 24 Jul 2023 20:58:43 +0000
Received: by outflank-mailman (input) for mailman id 569245;
 Mon, 24 Jul 2023 20:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO2dd-0007jG-C8
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 20:58:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb45c29-2a64-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 22:58:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEDF361312;
 Mon, 24 Jul 2023 20:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BDFC433C8;
 Mon, 24 Jul 2023 20:58:35 +0000 (UTC)
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
X-Inumbo-ID: dcb45c29-2a64-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690232317;
	bh=vicWDrcK2udb1mEquP0na6Li+ktfQpcLEkEHmBSAk7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mUQQ+/zbERJzatG06vwbmYisF0FTy2SkeQh+C1zeqg8nqKRkF6WWSDID4W6MsTmkb
	 so4eptLKiVbJfCW2osAuDkrGGPJ6/oAdh0i3AuHF+HGrQ+2Ra06eo0EbWXua0gF+eo
	 0zfJK+71TpvpfG04K3s2kL/XjMKxhRbXdkevRkMl1HmFO9mpUJFe0ruZhRq6g1hOle
	 EW4/zAJInL06ldh+DE6TmiT92UsH7e3twI3Qe0UMQrJpvEhALCQaNixqMl/e1RjtTo
	 CTI4RB1G+e18nEnMKmoJ8OmHTfp6Rch4lg2jy58fVUYB7f2+jA28XtCZJnpXpSHGZs
	 MmR/jEmgwui6A==
Date: Mon, 24 Jul 2023 13:58:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii <oleksii.kurochko@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
In-Reply-To: <ccfad0f751df1e498d1c5cea3eb373e263f91d00.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307241357570.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>  <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>  <ZLVLaPeyOwDYYUXL@mail-itl>  <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>  <ZLsd3tdSvTLwIyt3@mail-itl> 
 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>  <ZLshtl8KKgyR1wlY@mail-itl>  <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop>  <ZLsqSWXvwxBQK3NG@mail-itl>  <alpine.DEB.2.22.394.2307211811020.3118466@ubuntu-linux-20-04-desktop>
 <ccfad0f751df1e498d1c5cea3eb373e263f91d00.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Oleksii wrote:
> Hi Stefano,
> 
> On Fri, 2023-07-21 at 18:18 -0700, Stefano Stabellini wrote:
> > Hi Andrew, Oleksii,
> > 
> > Please see below.
> > 
> > It looks like you have configured your personal repositories to
> > mirror
> > upstream Xen:
> > 
> > https://gitlab.com/xen-project/people/olkur/xen
> > https://gitlab.com/xen-project/people/andyhhp/xen
> > 
> > Make sure that the option "Trigger pipelines for mirror updates" is
> > unselected.
> > 
> > If you setup the mirror a long time ago, you might want to stop the
> > mirror and start it again.
> > 
> > I have just done the same for fusa/xen-integration: I had to go to
> > settings->repository, stop the existing mirror, and create a new one
> > making sure "Trigger pipelines for mirror updates" is off.
> I checked the option is unselected.
> 
> But I have selected "Mirror all branches" in "Mirror branches".
> I can use "Mirror specific branches" to avoid 'staging' mirroring.
> 
> Will it be enough?

My understanding is that if you already have "Trigger pipelines for
mirror updates" unselected, then you shouldn't need anything else.

