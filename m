Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E339455F
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 17:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134015.249567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmefN-0005RU-EP; Fri, 28 May 2021 15:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134015.249567; Fri, 28 May 2021 15:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmefN-0005PR-B0; Fri, 28 May 2021 15:44:53 +0000
Received: by outflank-mailman (input) for mailman id 134015;
 Fri, 28 May 2021 15:44:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhPb=KX=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lmefM-0005PL-0V
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 15:44:52 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2761a70-10d4-4bab-aca1-1b49010752fc;
 Fri, 28 May 2021 15:44:50 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lmefH-000AHT-8X; Fri, 28 May 2021 15:44:47 +0000
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
X-Inumbo-ID: f2761a70-10d4-4bab-aca1-1b49010752fc
Date: Fri, 28 May 2021 16:44:47 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>,
	xen-devel@lists.xenproject.org
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
Message-ID: <YLEP73On6EBjv3Ks@deinos.phlegethon.org>
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
 <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 10:58 +0200 on 25 May (1621940330), Jan Beulich wrote:
> On 24.05.2021 06:29, Roberto Bagnara wrote:
> > I stumbled upon parsing errors due to invalid uses of
> > _Static_assert expanded from HASH_CALLBACKS_CHECK where
> > the tested expression is not constant, as mandated by
> > the C standard.
> > 
> > Judging from the following comment, there is partial awareness
> > of the fact this is an issue:
> > 
> > #ifndef __clang__ /* At least some versions dislike some of the uses. */
> > #define HASH_CALLBACKS_CHECK(mask) \
> >      BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
> > 
> > Indeed, this is not a fault of Clang: the point is that some
> > of the expansions of this macro are not C.  Moreover,
> > the fact that GCC sometimes accepts them is not
> > something we can rely upon:

Well, that is unfortunate - especially since the older ad-hoc
compile-time assertion macros handled this kind of thing pretty well.
Why when I were a lad &c &c. :)

> > Finally, I think this can be easily avoided: instead
> > of initializing a static const with a constant expression
> > and then static-asserting the static const, just static-assert
> > the constant initializer.
> 
> Well, yes, but the whole point of constructs like
> 
>     HASH_CALLBACKS_CHECK(callback_mask);
>     hash_domain_foreach(d, callback_mask, callbacks, gmfn);
> 
> is to make very obvious that the checked mask and the used mask
> match. Hence if anything I'd see us eliminate the static const
> callback_mask variables altogether.

That seems like a good approach.

Cheers,

Tim.

