Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2AA2146D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 23:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878796.1288987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcu8z-0008RI-D8; Tue, 28 Jan 2025 22:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878796.1288987; Tue, 28 Jan 2025 22:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcu8z-0008Pq-AU; Tue, 28 Jan 2025 22:33:17 +0000
Received: by outflank-mailman (input) for mailman id 878796;
 Tue, 28 Jan 2025 22:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JyBM=UU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tcu8w-0008Pk-5K
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 22:33:15 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab53a59-ddc7-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 23:33:11 +0100 (CET)
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
X-Inumbo-ID: dab53a59-ddc7-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738103589; x=1738362789;
	bh=zLx8nL/IwzbdH+g2HkXwZc+1rt/lRU8lkTfIUq74OLM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=c5lIao5knnCpDG5ponZJb7ClM9blXnu6bClGfqrNVIjDfaou1ygMIstzaWGZdk59t
	 uNOjHhxxZvgdvbqDrYOvU+p5PIeiGIAns1M4kfdKCdo1YqegozTTqJmc1u+tCsQSSG
	 fJO3aZiaZ4ByAEOfHilCEB6Ds0m0uF2sY3aDPAuNxL70aEcy8KohEUxdq4QT2XRPjf
	 b9G6eNUaybUzL1GeJioUJdv/7rnHGXU4tC1wJOj2b6GdMF6UP6lmkU96Tlj+9iuLFy
	 iG6L6PzJP43mw1cICSquKVXSUPAhzlMyjuZ8mrDFtG+eQULC1ChTj3C3aPGljNGve+
	 7dXxHrRuvnwRQ==
Date: Tue, 28 Jan 2025 22:33:06 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 03/24] arm/vuart: add hwdom prefix to UART emulator
Message-ID: <3AuUpd0Cc-g1yFVxMbkH8S4BQcUVr5VIbP3vRXZfXrrfLNDPxpOkRyP4PzMOrLxcY7vcKQ0xuWDuYU_A4XReYUA5VH6VOBBhdPZSOksawVU=@proton.me>
In-Reply-To: <228a7d42-682d-4898-be1b-03fdd257ad70@amd.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-3-c5d36b31d66c@ford.com> <228a7d42-682d-4898-be1b-03fdd257ad70@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 262bd474f9d324a960dfc11d1678f76fea0a773e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, January 27th, 2025 at 2:58 PM, Jason Andryuk <jason.andryuk@amd.=
com> wrote:

>=20
>=20
> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Using "vuart" in UART emulator designed for hardware domain debugging
> > is confusing in generic Arm code (e.g. vpl011 is also "vuart").
> > Fix that by adding hwdom prefix to all symbols in arm/vuart.c.
> >=20
> > Also, remove domain_has_vuart() from arm/vuart.c since it is not needed=
.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
> > diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
> > index 98a65b99385a2a119725bab8634ed7cf9d926d68..23e05dba3a5617863f6c08f=
085c358f2cf32a292 100644
> > --- a/xen/arch/arm/vuart.c
> > +++ b/xen/arch/arm/vuart.c
>=20
> > @@ -66,15 +64,12 @@ int domain_vuart_init(struct domain *d)
> > return 0;
> > }
> >=20
> > -void domain_vuart_free(struct domain *d)
> > +void hwdom_vuart_free(struct domain *d)
> > {
> > - if ( !domain_has_vuart(d) )
> > - return;
> > -
> > - xfree(d->arch.vuart.buf);
> > + XFREE(d->arch.vuart.buf);
>=20
>=20
> I guess the code before and now both relied on struct domain being
> zero-initialized. You've made the free depend on the actual buffer
> instead of info as a proxy.
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com

Thank you.

>=20
>=20
> Regards,
> Jason

