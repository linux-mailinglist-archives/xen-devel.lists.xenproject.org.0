Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566BABE4A4
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 22:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991116.1375018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTQi-0000oQ-Nc; Tue, 20 May 2025 20:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991116.1375018; Tue, 20 May 2025 20:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHTQi-0000mQ-Kg; Tue, 20 May 2025 20:19:16 +0000
Received: by outflank-mailman (input) for mailman id 991116;
 Tue, 20 May 2025 20:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQuu=YE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHTQh-0000mK-5G
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 20:19:16 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1f45692-35b7-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 22:19:13 +0200 (CEST)
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
X-Inumbo-ID: b1f45692-35b7-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747772352; x=1748031552;
	bh=clDefMXEPEmZIzclS1GpKOWlZqrN8tP4S0W+ZRs0nNM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fOBIp1YQZYjQdWEFL39AY4lKKHiHr2XxkTt0PWOlc3v/oWmC8iGO5Q1O9OieJk89x
	 eoOsdKLuLWlOJvZ5O1RAolm+5Adx1xAUbhAhPw7xfv68peYcPdGjYqX4ak664j9jGu
	 YMbS8VR+QVq9N6z1tLasipdMaGazyHJqocNXnWTRBiaDuCReE1CCI59AIP9dGYpKp/
	 zcs2aGypLGvnssENxlV+f76yzkY4tvIc+ypPjebdGvPtHb7q7HZF5xz2KDA/guGMSd
	 rJupNOGhxE9zR4XZWPimuh6b+bqkaK3vajHg7YqHEguM+HNJHlkJgQbFKLXNK7ySgz
	 QRFytgtZCpdtw==
Date: Tue, 20 May 2025 20:19:08 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/argo: Command line handling improvements
Message-ID: <aCzjek93ulhq2uHG@kraken>
In-Reply-To: <20250520141027.120958-1-andrew.cooper3@citrix.com>
References: <20250520141027.120958-1-andrew.cooper3@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d5074852dfa1a42e339fe44b1da18bcb3b21f600
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 03:10:27PM +0100, Andrew Cooper wrote:
> Treat "argo" on the command line as a positive boolean, rather than requi=
ring
> the user to pass "argo=3D1/on/enable/true".
>=20
> Move both opt_argo* variables into __ro_after_init.  They're set during
> command line parsing and never modified thereafter.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Denis Mukhin <dmkhn@proton.me>
>=20
> Found while
> ---
>  xen/common/argo.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index cbe8911a4364..027b37b18a6c 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);
>  DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
>  #endif
>=20
> -static bool __read_mostly opt_argo;
> -static bool __read_mostly opt_argo_mac_permissive;
> +static bool __ro_after_init opt_argo;
> +static bool __ro_after_init opt_argo_mac_permissive;
>=20
>  static int __init cf_check parse_argo(const char *s)
>  {
> @@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)
>          if ( !ss )
>              ss =3D strchr(s, '\0');
>=20
> -        if ( (val =3D parse_bool(s, ss)) >=3D 0 )
> +        /* Intepret "argo" as a positive boolean. */
> +        if ( *s =3D=3D '\0' )
> +            opt_argo =3D true;
> +        else if ( (val =3D parse_bool(s, ss)) >=3D 0 )
>              opt_argo =3D val;
>          else if ( (val =3D parse_boolean("mac-permissive", s, ss)) >=3D =
0 )
>              opt_argo_mac_permissive =3D val;
>=20
> base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19
> --
> 2.39.5
>=20


