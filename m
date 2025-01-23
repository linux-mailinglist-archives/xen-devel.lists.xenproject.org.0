Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D4A1ABB9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 22:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876377.1286727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb4UH-0006s1-H4; Thu, 23 Jan 2025 21:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876377.1286727; Thu, 23 Jan 2025 21:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb4UH-0006pX-E8; Thu, 23 Jan 2025 21:11:41 +0000
Received: by outflank-mailman (input) for mailman id 876377;
 Thu, 23 Jan 2025 21:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7sXU=UP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tb4UF-0006pJ-9t
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 21:11:40 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02e704c-d9ce-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 22:11:34 +0100 (CET)
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
X-Inumbo-ID: a02e704c-d9ce-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1737666692; x=1737925892;
	bh=YO8OSyrNHGNT7NRkbRI6g+/A3sBKeBEhmQqYM0FnKZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iNOHHijTOfTLCrq69Z29qNA9h4hhqZqbiau9zvpCzYPC9yl83qj8XZBqxXsImkdr8
	 L/tHVwmLIUKFonT2SGjTtir/Nvw1UmkYYNQNaNXtvM59r1pg7XqaKPP4647rhHmZRR
	 YcQOHIjVLuddM6ANsm9NVYCnNR7JYorLXG2C6lfSJ+bgQ5E8RK7KN1LfgXqREwdXRL
	 tkPfY1J+/SQEjLx00QXj6LGFZwBCNcSIRwbyijHuobL8HMaAV/qnjhCj+DZT7vUIpr
	 lotMs0RIHaCvrbtYS1PP9IchaOjqjwAHsylEKzE7BrQJoQFw6D+SvyPtv5/Uq2XG2H
	 mWUZ1p123XSCw==
Date: Thu, 23 Jan 2025 21:11:26 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/24] xen/ctype: introduce is_console_printable()
Message-ID: <qUr2zHXrlh8KYYpH00v4yhSvka5v2rcdUHmW6ajV3qp91yOaid-3V72YxE_hfeB0P64gJkjchYvqfHZWlp7WzcMg3GDUk8APnTPVxP_NDuQ=@proton.me>
In-Reply-To: <c490d01a-fe97-414d-8093-b0bff6a12eec@suse.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com> <c490d01a-fe97-414d-8093-b0bff6a12eec@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3ca0b26640700fb1c8c3b3ef90897f5ebc7a38bb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 21st, 2025 at 11:19 PM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>=20
>=20
> On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
>=20
> > --- a/xen/include/xen/ctype.h
> > +++ b/xen/include/xen/ctype.h
> > @@ -4,6 +4,8 @@
> > /*
> > * NOTE! This ctype does not handle EOF like the standard C
> > * library is required to.
> > + *
> > + * See Rule 21.13 in docs/misra/rules.rst.
> > */
>=20
>=20
> As previously indicated, I object to such comments. I think I said so bef=
ore:
> All Misra rules are relevant everywhere anyway.

Correct, I received that feedback in v2 comments, but after I posted v3
on the mailing list.

That will be addressed in the next iteration.

>=20
> > @@ -51,4 +53,9 @@ static inline unsigned char __toupper(unsigned char c=
)
> > #define tolower(c) ((char)__tolower(c))
> > #define toupper(c) ((char)__toupper(c))
> >=20
> > +static inline unsigned is_console_printable(unsigned char c)
> > +{
> > + return isprint(c) || c =3D=3D '\n' || c =3D=3D '\t';
> > +}
>=20
>=20
> Why a return type of unsigned (and then not even "unsigned int")? I can't
> spot anything in the file which would serve as a reference for this, and
> by its nature the function clearly wants to return bool.
>=20
> I further question the placement of this function in ctype.h: Only consol=
e
> related code cares about this function, so exposure is far too wide this
> way.

I will move that to console.h in v4.
Thanks.

>=20
> Jan

