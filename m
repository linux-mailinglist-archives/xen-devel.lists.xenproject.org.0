Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E71B1F584
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 19:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076101.1437824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmzJ-0005VQ-CX; Sat, 09 Aug 2025 17:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076101.1437824; Sat, 09 Aug 2025 17:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmzJ-0005SE-96; Sat, 09 Aug 2025 17:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1076101;
 Sat, 09 Aug 2025 17:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukmzI-0005It-1q
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 17:04:08 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbc1a8c5-7542-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 19:04:06 +0200 (CEST)
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
X-Inumbo-ID: dbc1a8c5-7542-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754759045; x=1755018245;
	bh=CeN47zJMWBPURCftni0LFkpjN7se1ih1MjMEkeLXVD8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QoNk6Y0+0ySeSNyKf67YpTwGmf5F7AFkg+p4QBMkqNnIpGENDCY3D+A6mmvMku6sM
	 W7Or97VARyGLNtLtp8dNxWK0g9gwyTorvBhFZP4B216Dx/scZ6ouqqc5dfWg9B7qj3
	 HVdOjiDJGqan/bTId54lRkI6twpoaFx6V9MwoiWWLJBJQ2fHaOoKu5Jg/Px3Zoxuyx
	 S8maelWcyjWv05EnMkHFig+jKfm7sYQ2haz71sHhpZsfEuBv4Ym1AvJGBCUNe2UqbT
	 bYBYQdJTkG88XxxkQNAnRp2DrPbEq/ZLelts2ygARH/+l5vL1KAbtrwDdc5stndb2F
	 T4e3L6ywXvITQ==
Date: Sat, 09 Aug 2025 17:04:02 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v14 3/4] tools/tests: introduce unit tests for domain ID allocator
Message-ID: <aJd/fUPtOJNkpZsS@kraken>
In-Reply-To: <44b43350-8c0a-497d-b0b0-034a548afac0@xen.org>
References: <20250808021938.669855-1-dmukhin@ford.com> <20250808021938.669855-4-dmukhin@ford.com> <230593d5-f3a2-4be8-973a-530c2debcb08@xen.org> <44b43350-8c0a-497d-b0b0-034a548afac0@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b5eb2d535fa435f7938c3c275b26d557ce4ffd1a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 06:57:07PM +0100, Julien Grall wrote:
>=20
>=20
> On 08/08/2025 18:56, Julien Grall wrote:
> > Hi Denis,
> >
> > On 08/08/2025 03:20, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Introduce some basic infrastructure for doing domain ID allocation
> >> unit tests,
> >> and add a few tests that ensure correctness of the domain ID allocator=
.
> >
> > I am quite happy to see more unit tests for Xen :).
> >
> >>
> >> Use <xen-tools/bitops.h> and xen/lib/find-next-bit.c in test hardness
> >> code.
> >>
> >> Adjust find-next-bit.c to be compiled with __XEN_TOOLS__.
> >>
> >> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >
> > With a couple of remarks below:
> >
> > Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> Actually, this should have been a Reviewed-by tag. Sorry.

Thanks for review!

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20


