Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2245AE5B79
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023045.1398936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTv8m-0003c3-7i; Tue, 24 Jun 2025 04:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023045.1398936; Tue, 24 Jun 2025 04:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTv8m-0003Zk-52; Tue, 24 Jun 2025 04:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1023045;
 Tue, 24 Jun 2025 04:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTv8j-0003ZO-Is
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 04:20:10 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ea44f8c-50b2-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 06:20:01 +0200 (CEST)
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
X-Inumbo-ID: 7ea44f8c-50b2-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=w3tumghdxnddrnv33t4pl64rly.protonmail; t=1750738800; x=1750998000;
	bh=EYYkmXjOENemakgw0TcCwSLXJu0cRjU9Ir4rUnc6dxk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hx042SHsEY3U2rOCY4IWok2QD8yGuTvim4rdq4SWeKYsT30N0laZZlbjWiUXH0Bef
	 K1q/8uU5Q6s0meCnUTJpiaXjxuUCCn0o+iXncfDUV2bxRejFtM6gUYzf4uYhEXqI8E
	 Duv2+pJs6yla/0mPMz+eGOPFcLEkQl1lcP8PZUY4bb7fmYKGUbyegTadHsMo0vfe/F
	 SB4qJCCaIeFgu6qGZaSjJMODwISf6/xsjDjTC95yabJGdlwcofL2S4gBgb3DbgNADS
	 c+lOsQpJ8XC9P60dME+89xk7z+WQmBLOl57ud6Pr0qw1x3o3VfSpNXnMRZ+5d2dRNe
	 uxuOqw/QgXchg==
Date: Tue, 24 Jun 2025 04:19:56 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/domain: fix memory leak in domain_create()
Message-ID: <aFonaL0FNAHZoBYf@kraken>
In-Reply-To: <f4b2c2b1-c7af-44d8-878b-ef5a0facbebd@suse.com>
References: <20250623011514.173367-1-dmukhin@ford.com> <f4b2c2b1-c7af-44d8-878b-ef5a0facbebd@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 59c3443fc97bb0de9a88ccac0d1063c1a91a810a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:09:54AM +0200, Jan Beulich wrote:
> On 23.06.2025 03:16, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Fix potential memory leak in domain_create() in late hardware domain ca=
se.
> >
> > Fixes: b959f3b820f5 ("xen: introduce hardware domain create flag")
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

Just in case, I've seen the patch is committed as
  3491e85a1505  ("xen/domain: fix memory leak in domain_create()")
but there's no R-b tag.

>=20
> It may be relevant to mention that we still can't very well use "goto fai=
l"
> on this error path, as insufficient struct initialization was done just y=
et.
>=20
> What we may want to consider is to move down the get_unique_id() invocati=
on.
> It's not the end of the world to lose one, but that may better be avoided
> when we easily can.
>=20
> > ---
> > I think that no memory allocation is required before performing late hw=
dom
> > checks (ID range and hwdom existance).
> >
> > Looks like sanitise_domain_config() could better fit for performing suc=
h
> > configuration checks.
> >
> > Alternatively, hardware_domid range could be checked via custom parser
> > instead of code in domain_create() and then hwdom existance can be move=
d
> > before alloc_domain_struct().
> >
> > Thoughts?
>=20
> Keeping related things together is the other desire we commonly have.

Yeah, I see this is to avoid duplicated checks, but verifying hardware_domi=
d
range definitely can be moved outside of domain_create()=20

This superfluous memory allocation will need a test case in cert world sinc=
e
this is arch-common code :-/
So, IMO, it is better to avoid it.

>=20
> Jan


