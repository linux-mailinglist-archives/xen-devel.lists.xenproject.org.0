Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313EAC5E1A
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998853.1379565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Uu-0003ex-PK; Wed, 28 May 2025 00:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998853.1379565; Wed, 28 May 2025 00:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4Uu-0003cn-Lq; Wed, 28 May 2025 00:18:20 +0000
Received: by outflank-mailman (input) for mailman id 998853;
 Wed, 28 May 2025 00:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4Us-0003cD-TX
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:18:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408d946c-3b59-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:18:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 660D7A4F62C;
 Wed, 28 May 2025 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70BBC4CEE9;
 Wed, 28 May 2025 00:18:14 +0000 (UTC)
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
X-Inumbo-ID: 408d946c-3b59-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748391495;
	bh=YVFMd9a9fxgrp8rH+OMWzKbAEDFwZu4TisRwD3RK+Xs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AlC9319JkTgvqHF7DKjYbDPKNH27f7MU4sLFTEmP3AWqElU2uSakdzftj6VAuxyjG
	 AbFpABZuABgATVZpFTiT6Di+n6IBN9ph1e+KIuxmBjjhOiNuRfDj/C/WMdwt+KYTfz
	 zc1JkuK2vc+tfIAN/0GhlvpdGJIO31L4NaCMfphcDBYNH126Qn8FqrtT/ukWhvgamu
	 /T8C0wx0A5oEJAKQ/f9ycSO5Y9l35B5trz7X2ExQd0smt04Gd/j0wa/Pkv4tEncFG5
	 IbS78UTcRQvu3TGtMwh048sNLpO/PkGU3oCOXHaCxv7k4o77lwJ+lfor/8DEK/JVeW
	 AK+23qElvBMAA==
Date: Tue, 27 May 2025 17:18:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony@xenproject.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] CI/qubes: Deduplicate the handling of
 ${dom0_check}
In-Reply-To: <aDXBJ6ASFOl2Ndhp@l14>
Message-ID: <alpine.DEB.2.22.394.2505271718030.135336@ubuntu-linux-20-04-desktop>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com> <20250522173640.575452-2-andrew.cooper3@citrix.com> <aDXBJ6ASFOl2Ndhp@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 May 2025, Anthony PERARD wrote:
> On Thu, May 22, 2025 at 06:36:38PM +0100, Andrew Cooper wrote:
> > Make it clear that ${dom0_check} is unconditional.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

