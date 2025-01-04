Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49A3A011EF
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864936.1276202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtxD-00052j-2o; Sat, 04 Jan 2025 02:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864936.1276202; Sat, 04 Jan 2025 02:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtxC-00050T-Ve; Sat, 04 Jan 2025 02:31:54 +0000
Received: by outflank-mailman (input) for mailman id 864936;
 Sat, 04 Jan 2025 02:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTtxA-00050L-Ok
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:31:52 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc8ab74-ca44-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:31:51 +0100 (CET)
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
X-Inumbo-ID: 0dc8ab74-ca44-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735957909; x=1736217109;
	bh=1tqwHz25lWDpgaQ6da/femUGwrWz4CR6GLbAiMYv97o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Qe0ZwYvbGGUEoey10uIryXU9KBiUhS1z0l3R9RJARuYC6tIcra9NoK6iih9bsG/nY
	 01RSJKqFVNJGQFaX/WKJ2ClncrqI2696Lujga624gbFla8tdnR6flaHZCf9c3KVEzy
	 IY1C/4u9X1uAV+jV4pgYtbdZ7dstNDQAIlX2tU6piZYpWQq+AXVsuRCt6qYBtlND/r
	 k1JDiTjFqohKecF4FPQh+ga+9dZiwPOBSb8gWywKcVMHLtQ3DE6HtDzLf9AEir/nAS
	 ntSr51gnn6QPoKTLVOYcfRCcQ7unR1T3LH2p1H1LAnqjIZm8795cPQ0ZVFBYa8jD9E
	 hKBtCcahuClmQ==
Date: Sat, 04 Jan 2025 02:31:43 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 03/35] xen/ctype: introduce isconsole()
Message-ID: <UxuSYzSmEVywRqZ_UFKaoIq1qJIu3HJsDIFnih7hfMmjZ7m935H9ODPtxpe4NxWRFKBsiQL_j42X6U_1LdeSoI2Eflge05xsI5YUClj0HFc=@proton.me>
In-Reply-To: <b3afb61f-0a82-4a66-ae9c-42c1106a5399@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-3-e9aa923127eb@ford.com> <b3afb61f-0a82-4a66-ae9c-42c1106a5399@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b92b037ffb07bb54b6dcc59890d075344aa4e3d8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 5:22 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > There are several console drivers which have same checks w.r.t. printab=
le
> > characters. The check is moved to new isconsole() macro and re-used in
> > the console drivers.
>
>
> Something named isconsole() imo can't be expected to do what is checked f=
or

I tried to follow the "short" naming notation in ctype.h.
I agree; changed the name to is_console_printable() as per below suggestion=
.

> ...
>
> > --- a/xen/arch/arm/vuart.c
> > +++ b/xen/arch/arm/vuart.c
> > @@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
> > struct domain *d =3D v->domain;
> > struct vuart *uart =3D &d->arch.vuart;
> >
> > - /* Accept only printable characters, newline, and horizontal tab. */
> > - if ( !isprint(c) && (c !=3D '\n') && (c !=3D '\t') )
> > + if ( !isconsole(c) )
> > return ;
>
>
> ... e.g. here. If we really want such a further abstraction (of which I'm
> unconvinced), then maybe isprintable() or (getting ling-ish)
> is_console_printable().

Reworked to is_console_printable()

>
> > --- a/xen/include/xen/ctype.h
> > +++ b/xen/include/xen/ctype.h
> > @@ -4,6 +4,8 @@
> > /*
> > * NOTE! This ctype does not handle EOF like the standard C
> > * library is required to.
> > + *
> > + * See Rule 21.13 in docs/misra/rules.rst.
> > */
>
>
> How's this change related to the purpose of the patch?

Only because the very first version of the macro was failing
an ECLAIR job for me because of Rule 21.13 violation.

Updated the commit message (v3).

>
> > @@ -30,6 +32,7 @@ extern const unsigned char _ctype[];
> > #define isspace(c) ((__ismask(c)&(_S)) !=3D 0)
> > #define isupper(c) ((__ismask(c)&(_U)) !=3D 0)
> > #define isxdigit(c) ((__ismask(c)&(_D|_X)) !=3D 0)
> > +#define isconsole(c) (isprint(c) || (c) =3D=3D '\n' || (c) =3D=3D '\t'=
)
>
>
> In a pretty general purpose macro like this one I'm afraid I view it as
> risky to evaluate the parameter more than once.

Fixed.

>
> Jan



