Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A72A2B788
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883228.1293282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgCke-0004PT-Cj; Fri, 07 Feb 2025 01:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883228.1293282; Fri, 07 Feb 2025 01:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgCke-0004Mo-9i; Fri, 07 Feb 2025 01:01:48 +0000
Received: by outflank-mailman (input) for mailman id 883228;
 Fri, 07 Feb 2025 01:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgCkd-0004En-9v
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:01:47 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19bedf0c-e4ef-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:01:45 +0100 (CET)
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
X-Inumbo-ID: 19bedf0c-e4ef-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738890104; x=1739149304;
	bh=Rh+PfkMzbyN64FiqYi6OZZfCjfJOU4P/J+P5TQCzWNE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=CBzvr28W5w0UGGDzZGQAH2nzyu1UseG8QMzND1hvrG5+3kpkEhNGgfwHW9vLHaexb
	 x8GjUhDX7J/6BHXyFVVnVfRphWH5LYyMFeXr/RFMRj24cpj5W5C/PzWg5A7gMbweWf
	 CEvVJdpfCi6hzrX+LldAAbdOw1lY7eiRr1yD45ZxZPXiXqfdMpUD8fzx1l49bABKZS
	 jE11ES6DcOMiW0xzTD16EruwGKF46kryPGJrsZWMPHNdbPQHTVry9WWeE/M9T0Fcm7
	 PjZm0rz0OKYNFOt9ST6EDbqm5Q8e3b85L3b7psPR47bkj/ZLZNX0/7cW+YcWdxGFk7
	 bAljrbENwTckw==
Date: Fri, 07 Feb 2025 01:01:40 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/24] xen/ctype: introduce is_console_printable()
Message-ID: <Scn0jYSzgPId6VLVMh-Lx5B1gPaXJAzal53V0oeoI1ZcZuZl8Fy1b1LpOexf8SLtJVUKDlNqlbhu5BcRM0Gz5LOsH1d15e2Pi3TY4ZznKvI=@proton.me>
In-Reply-To: <qUr2zHXrlh8KYYpH00v4yhSvka5v2rcdUHmW6ajV3qp91yOaid-3V72YxE_hfeB0P64gJkjchYvqfHZWlp7WzcMg3GDUk8APnTPVxP_NDuQ=@proton.me>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com> <c490d01a-fe97-414d-8093-b0bff6a12eec@suse.com> <qUr2zHXrlh8KYYpH00v4yhSvka5v2rcdUHmW6ajV3qp91yOaid-3V72YxE_hfeB0P64gJkjchYvqfHZWlp7WzcMg3GDUk8APnTPVxP_NDuQ=@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cb9464d36c98b5bd9847b146c5b59f1f57851d82
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, January 23rd, 2025 at 1:11 PM, Denis Mukhin <dmkhn@proton.me> =
wrote:

>=20
>=20
> On Tuesday, January 21st, 2025 at 11:19 PM, Jan Beulich jbeulich@suse.com=
 wrote:
>=20
> > On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> >=20
> > > --- a/xen/include/xen/ctype.h
> > > +++ b/xen/include/xen/ctype.h
> > > @@ -4,6 +4,8 @@
> > > /*
> > > * NOTE! This ctype does not handle EOF like the standard C
> > > * library is required to.
> > > + *
> > > + * See Rule 21.13 in docs/misra/rules.rst.
> > > */
> >=20
> > As previously indicated, I object to such comments. I think I said so b=
efore:
> > All Misra rules are relevant everywhere anyway.
>=20
>=20
> Correct, I received that feedback in v2 comments, but after I posted v3
> on the mailing list.
>=20
> That will be addressed in the next iteration.

Moved to=20
  https://lore.kernel.org/xen-devel/20250207005532.345746-1-dmkhn@proton.me

>=20
> > > @@ -51,4 +53,9 @@ static inline unsigned char __toupper(unsigned char=
 c)
> > > #define tolower(c) ((char)__tolower(c))
> > > #define toupper(c) ((char)__toupper(c))
> > >=20
> > > +static inline unsigned is_console_printable(unsigned char c)
> > > +{
> > > + return isprint(c) || c =3D=3D '\n' || c =3D=3D '\t';
> > > +}
> >=20
> > Why a return type of unsigned (and then not even "unsigned int")? I can=
't
> > spot anything in the file which would serve as a reference for this, an=
d
> > by its nature the function clearly wants to return bool.
> >=20
> > I further question the placement of this function in ctype.h: Only cons=
ole
> > related code cares about this function, so exposure is far too wide thi=
s
> > way.
>=20
>=20
> I will move that to console.h in v4.
> Thanks.
>=20
> > Jan

