Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7199115A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810674.1223425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpnM-0001zz-NJ; Fri, 04 Oct 2024 21:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810674.1223425; Fri, 04 Oct 2024 21:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpnM-0001xM-K8; Fri, 04 Oct 2024 21:25:04 +0000
Received: by outflank-mailman (input) for mailman id 810674;
 Fri, 04 Oct 2024 21:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swpnL-0001xG-Oa
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:25:03 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d0dabb3-8297-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 23:25:02 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 9CB1C13802B2;
 Fri,  4 Oct 2024 17:25:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Fri, 04 Oct 2024 17:25:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 17:24:59 -0400 (EDT)
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
X-Inumbo-ID: 1d0dabb3-8297-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728077100;
	 x=1728163500; bh=WvjiHiFyqnAhSwe+2cpYXG8hky0PnEyRjbgAF9Gqvy0=; b=
	AjT9z3nCB9aXMmZFYYaZaB7P1pWx2/65NaeyKnxVMf1d9QztbPg7xMs9cSswKkvc
	si+XbLNvvsQLFHqRyU4mcJ0UtLjxBIrFpw+yUGFc1mKeijPmNdngvU+dflsqtH1Z
	J92qbl9jIZWlAftsI9Oqv/wHluut1jbtc/XdQHJpPjdSFUwymPmuii4y7w8Vua5y
	DCKqR74Kk6GReDzBH8r6Q81K0W6iTAPbPhmGYEwLzlpUioouYGtVRemonnWaXWA0
	zT6BOymzSgi508Bm4fPh/EwmIIGpXMoYFmNtCby10v8gKAlFHuErNudczc1IRYlN
	iUh3t7o8rpP0mezU1hlVFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728077100; x=1728163500; bh=WvjiHiFyqnAhSwe+2cpYXG8hky0P
	nEyRjbgAF9Gqvy0=; b=QtNliXESyK4mqm9Rz+7x9+cMvrxSaF1XYpkPtr3uoxuT
	i6X37bkcOuf5mKK2lr/L+u0sJibTZ6rklORWdn1yUwdfPEDedH60D8FUZb1jWyWu
	pxGzH9Z9K7trHepWkmH1r9/TCtkJS9fvywYTkw7kSKRtnpWrT/iR+xXr+p6zKxhd
	O/56f88vWCLxjcnyDVw/cGGk5rruR/b8UMt2vCOhPuWH5B//P8mBhTFdZPSRTZg8
	jD6t1QE83FDBLbUa5m6nuCx9JXa2RF3Wt8BNO23VfCYwG7NiGH7Tuol5e8A7ipt6
	apOROfoGRvx6/axXXMGe281cqS9x4lDE5z0zwA5v+w==
X-ME-Sender: <xms:LF0AZ0UIWWtZ2r0lzNFV-BZs4etMKDj9xinp794bg6FZoDHSq64mSA>
    <xme:LF0AZ4mf6G-ZRqgWs1hNhiS8EgKlk1-JGkD1dMKwqKI9sPpI6NfWba5Y14Ic24g8Z
    6_KiqB3wH-Bew>
X-ME-Received: <xmr:LF0AZ4ZbDX0W3VdexOGwjAiVk4zFNK-hbopijp2anC0V7Yb4RBSlN4aSPSGqC06cw3Fi058TAKP7jmMe_xggEOhaslx7pLWWsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfvggu
    vghrihgtohdrshgvrhgrfhhinhhisegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    oheptghonhhsuhhlthhinhhgsegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtohepughpsh
    hmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:LF0AZzXIVRf2bvPk9zbgkE855aFFlmkgbMmmnKBZfHkIA7Cc54WP5g>
    <xmx:LF0AZ-mghcRQ6LY8LAd0zY8K9LPpaS1rgzhvJ4-u2AK7AjE03uCSyw>
    <xmx:LF0AZ4d1KaHGCBYVtjVXZeT2DHTFmkBv2jK9tv138Gp-8IAz61581Q>
    <xmx:LF0AZwHmT7vfMX7eh6yPQhYZwzjRon5gomlky7ko7EIYXC12jJ2cMA>
    <xmx:LF0AZ_DTPfc2V1ogeify66HLBtr8asB2XrhlDjD-Uu508ygJmcmCfSuu>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 4 Oct 2024 23:24:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 10/12] efi: address violation of MISRA C Rule 16.3
Message-ID: <ZwBdKewtEk2JgGcW@mail-itl>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <302110f2f41f6b7f74fcb90f8902137b0a619082.1725958417.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2sZKY1QYcUvBh3vr"
Content-Disposition: inline
In-Reply-To: <302110f2f41f6b7f74fcb90f8902137b0a619082.1725958417.git.federico.serafini@bugseng.com>


--2sZKY1QYcUvBh3vr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 4 Oct 2024 23:24:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 10/12] efi: address violation of MISRA C Rule 16.3

On Tue, Sep 10, 2024 at 12:09:02PM +0200, Federico Serafini wrote:
> Use agreed syntax for pseudo-keyword fallthrough to meet the
> requirements to deviate a violation of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
>=20
> No functional change.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/efi/runtime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index d03e5c90ce..376fcbd8e1 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -691,7 +691,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *o=
p)
> =20
>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>              return -EOPNOTSUPP;
> -        /* XXX fall through for now */
> +        fallthrough; /* XXX fall through for now */
>      default:
>          return -ENOSYS;
>      }
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2sZKY1QYcUvBh3vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcAXSkACgkQ24/THMrX
1yzwFwf/b+nLfw0TnlSKv6uwriKoyA+3D1Zp7BXzN5cnZhkW+MIMC1GjnG1YCfqh
WlwCMOTP2cn0A+NWOXUhD55n+989867uO9hdvkog7/YYcA1xKn3u/YtQe4REyc7l
WnRZfZYiG5cRQmFfG/xLMcYNhiVVjco6h961CJ+qHggB8SkdRIC1FpYrAlBO/rsh
eTEhqpCD59LmTS0SLpz6BVCpJ8rfE+6gJm02RfMuecMPQUZ6GnJN5pXM28h/vg2x
Hk1YXCahI9DX+beA7T/+12aceG+XftCvxAFclGzep0QcJj7N+jE2zk3bRCaxs+jA
CRSObVEBUOUWKxD5TWf6IQipT4hosg==
=d3Xv
-----END PGP SIGNATURE-----

--2sZKY1QYcUvBh3vr--

