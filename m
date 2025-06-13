Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D4EAD7FFB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 03:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013697.1391997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPsuB-0005Xg-W2; Fri, 13 Jun 2025 01:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013697.1391997; Fri, 13 Jun 2025 01:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPsuB-0005Uc-QW; Fri, 13 Jun 2025 01:08:27 +0000
Received: by outflank-mailman (input) for mailman id 1013697;
 Fri, 13 Jun 2025 01:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=le+p=Y4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uPsu9-0005UW-7Z
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 01:08:26 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e745d171-47f2-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 03:08:23 +0200 (CEST)
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
X-Inumbo-ID: e745d171-47f2-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ubjm4rozczgc5ku2bofcw4q4p4.protonmail; t=1749776901; x=1750036101;
	bh=LhYglOLXFVHP8caU1InXkSVSo2a16iuJKn5Qeo6hK8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RJ0VYmf9Z62976XWmj/lj8eZOOY2mHxs+5su88lKtEsKXv1/YkBWzEKV/uXDpUJvh
	 A2t55L0QW0/Z0XBwQF/aQ8atGL2Z7FZENJ339p8gU0vbDD9/3bPEE2mzjXsXlRX48q
	 uQoRVm0jM4LwJ6mWrNotPb8yyHGWVdfxxxIpQB+x5OkIPKSw/7iIa5WsKzoG683hHH
	 gD0E7T994FJnRPfYprr+e6Fkdy6Ocw3x89T5lrNM8LW9JYj6HihtOf3GoL521O+if5
	 b3LxdTbu/bIcJHKupsgGODeW4AMdjc0ICA4zGKxmOZx1jc62Q1+uEBIS0+UI+3b7PR
	 vSCYrxqdwItjQ==
Date: Fri, 13 Jun 2025 01:08:15 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/domain: fix late hwdom feature
Message-ID: <aEt5+3h9wwM7vRkt@kraken>
In-Reply-To: <6213c0dd-2145-48a2-9e8a-8a949da5e866@suse.com>
References: <20250610234105.1082890-1-dmukhin@ford.com> <6213c0dd-2145-48a2-9e8a-8a949da5e866@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 55a5a9122dbe5e5c2994db7423118f415a6121c1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:20:29AM +0200, Jan Beulich wrote:
> On 11.06.2025 01:42, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Fix get_initial_domain_id() which how returns hardware_domid and breaks=
 late
> > hwdom feature [1].
> >
> > [1] https://lore.kernel.org/xen-devel/a4c860d7-1fa0-43f4-8ae1-af59b7c65=
06f@xen.org/
> >
>=20
> Reported-by: Julien Grall <julien@xen.org>
>=20
> > Fixes: f147ccf2 ("xen/consoled: clean up console handling for PV shim")
>=20
> 12 hex digit please (see sending-patches.pandoc), i.e. f147ccf2b3c8 (larg=
ely for
> my own reference, to make respective adjustments while committing).

Thanks; my .gitcofig did not have core.abbrev configured.

>=20
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you

>=20


