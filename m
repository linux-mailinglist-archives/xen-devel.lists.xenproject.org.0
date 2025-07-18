Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D337B0A92E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 19:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049057.1419208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucodl-0006cM-1T; Fri, 18 Jul 2025 17:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049057.1419208; Fri, 18 Jul 2025 17:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucodk-0006Zh-Uk; Fri, 18 Jul 2025 17:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1049057;
 Fri, 18 Jul 2025 17:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v9Ag=Z7=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1ucodk-0006Zb-52
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 17:12:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c1130e-63fa-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 19:12:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B19AC45ED3;
 Fri, 18 Jul 2025 17:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498C0C4CEEB;
 Fri, 18 Jul 2025 17:12:52 +0000 (UTC)
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
X-Inumbo-ID: 70c1130e-63fa-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752858772;
	bh=6ykzAuGED9ez887LK7fcihZHQiZzSyWUYYkHvEM2+34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gxa0+WBnK60QELBbSqKq24UE/9/JflSsRp+648iD/+FzKC5q8xFi3AElixa3fuFn7
	 oC9fOvjaIRgdYSUely5SY2/FBTS753nxUMT3tV626o2z5YmAZQjhsKazENJnyc6jVS
	 pyhgZ4hZ4lTWzx5etpYsADLIALthb/1Jwd+fgWYkV2kZn0dd3551aK2c42LpdaHhsT
	 tYP53zJbbO0TajNop3A3AoLKJSDwDdVwb0w/DJjxA5JFHbwt991fN+7MonPJQDl8qU
	 eiHbsLAbq2eOX7CV7MmO1ww+2xk8yL2ElgVyaLntR7NwvAfaU84uZjAtXmjP12un8Y
	 orMgq8emxFC+g==
Date: Fri, 18 Jul 2025 10:12:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: [PATCH v2] xen/netfront: Fix TX response spurious interrupts
Message-ID: <20250718101251.0e67772a@kernel.org>
In-Reply-To: <4f54ed1a-e265-43db-b4f2-f3c0d3b3dd00@suse.com>
References: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
	<20250717072951.3bc2122c@kernel.org>
	<4f54ed1a-e265-43db-b4f2-f3c0d3b3dd00@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jul 2025 09:19:17 +0200 J=C3=BCrgen Gro=C3=9F wrote:
> On 17.07.25 16:29, Jakub Kicinski wrote:
> > On Tue, 15 Jul 2025 16:11:29 +0000 Anthoine Bourgeois wrote: =20
> >> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event chan=
nel storms") =20
> >=20
> > Not entirely sure who you expect to apply this patch, but if networking
> > then I wouldn't classify this is a fix. The "regression" happened 4
> > years ago. And this patch doesn't seem to be tuning the logic added by
> > the cited commit. I think this is an optimization, -next material, and
> > therefore there should be no Fixes tag here. You can refer to the commit
> > without the tag. =20
>=20
> I think in the end it is a fix of the initial xen-netfront.c contribution
> (commit 0d160211965b).
>=20
> I'm fine to change the Fixes: tag and apply the patch via the Xen tree.

SGTM, FWIW. But I'd like to reiterate my humble recommendation to treat
this as an optimization, and not add the Fixes tag.

