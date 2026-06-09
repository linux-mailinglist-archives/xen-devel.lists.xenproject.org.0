Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UUVvGeBsKGrWEAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:43:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB8663DAD
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:43:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=WeFcjHh1;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=AeETHGip;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1333823.1596995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX2Lo-0000Y8-MB; Tue, 09 Jun 2026 19:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333823.1596995; Tue, 09 Jun 2026 19:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX2Lo-0000Vq-JF; Tue, 09 Jun 2026 19:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1333823;
 Tue, 09 Jun 2026 19:43:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wX2Lm-0000Vk-P5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:43:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX2Lm-00ECLN-24
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:43:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a286c93-e002-0a2a0a5209dd-0a2a450587f0-42
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:43:01 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a286cc4-aaa8-0a2a45050019-ca0c7c90cb5b-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:43:01 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 60AC41D00095;
 Tue,  9 Jun 2026 15:42:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 09 Jun 2026 15:42:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 15:42:57 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781034179;
	 x=1781120579; bh=BrSrTYsKv4Bx2UIPbYymU/rxe+wBDlosnxvZhnzesBE=; b=
	WeFcjHh1lbku3Ca0UtdAsBrVaOTUf8CzpeN4eojgOFz1rtVtzB+H4gdX6YeBiakV
	jffTYyFm7lkQIRkKxaDdDv/GcDiATpU3Qe3FQ0ThjX6V6EbigijR0mk50TtuuqeN
	oF872xfArQ08YwDbNwD/iSQx6IxPah2S5QJj1Xv4g+zvM0sz7uF+xazvyQCqgf/f
	e6CnVXJLmHB1hEMZ22p2+b+c95m0+EqgRK1xzdK0UXSPSGmmUGyPBYLR1LAIM9xE
	UGfiMEtlj5/LfsxDlbovFGcO10IJJpcUogtcYvue/ODYBtTB2sNhuUUd4L8aoaQ8
	iOJx5mS5M6q9N5Wy9e0/Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781034179; x=1781120579; bh=BrSrTYsKv4Bx2UIPbYymU/rxe+wBDlosnxv
	ZhnzesBE=; b=AeETHGipBhl5c837HhwuC2T9uT2xzLUFa/one7UrZZXlgBlheHQ
	8pJVuGqLqm8Km50IXf621VHwmDkFV45rVes7LXjfe/+vIxMyBmj8j+z5fGWug3qQ
	ALgTMuvbb4O5RbDFRNefGg/Fl6TwsSBWkfSI+W9vqnobS/t7mGpl/RPo5qoTnFjH
	8bTvV6CHCamJQjvMrPzRbUOBtOjfSySVVibI1vacNs3Jyj4h4D0kcDof7Dkd86wq
	fWpYSsesyrOfC+waMyA8T5JV6XPsMGzh+Fnu7VJZ0lOvbgusrSG1pNNclfnpBvvJ
	L2pAjINPTsOxKh2ZJlYFD6hK+Rtxgz9tQgQ==
X-ME-Sender: <xms:wmwoajhfTAg48UWTpbs8iZ7EQ29ZIkxfA05_axYjDxQqhnI1K0ztqg>
    <xme:wmwoavHVGQxFwovC_iiyKFvvQdzQqAHmMF6AvpxgSayM74E27dMQe3wPi6x0kvZNW
    s6S9mQzEGrNb65clpYjlNJAD3XUMBbb1pzkW71SHynOUGF5RQ>
X-ME-Received: <xmr:wmwoapRb7ygVQ6iNPiVVKWX5PZgKIXnscn4R6sqh4F2H70H5MGSYb6wg3axyKZR5IRo7Ab7kvn2g9AY0AYGdQKC6Ay0sELozgLo>
X-ME-Proxy-Cause: dmFkZTF69FxdvIpZqaZiRe7lGsWBI+6V5IbX6qHbSYQWpCCo74xgkY3R9JwUVnPGXttW8D
    v7NIl5pwBtx5jlN7JO3kiwVXvhHe/qLQkbsNA04Lj19IPuA+7qH3we1qcuxLTpv+ygpwYV
    /Xe9Ss45vJkjmdSoKhvtGtjN1ljhLlqlETahsvZp4atCJLDOqL+JzvypNSjg5curTg4qda
    t/DvT0HtzinbiK4BlwGRiVUZmENuSqrQPRAR7uF34F9osizd/wIbGs/oe1VhgRwDXlvpHC
    wWUevUBMEN3ceaTpHuaXDOrYR31vs3sasz9flM8e0bHadTYqf+/ZRNZt2KpIA2rBFdzGQ7
    S4y/fwApsWjoPl+zj8XUxAd8tHGBLEGTYUp82md6YX0zd1N6mU3fMFaKw+BQRbJzdrnzz/
    opAf2fIMgzWPrO9CpoLDq43vWRCzpo+p5ZdGeSSFsmn9FaXkd40eSb9qArYZ/3Z6UxZ/kh
    5mvpR0cEgdXw4ib+XnKeXt8LGak+iQWEUaq09oKPc6BMvK3eAyk831eV1G5hnVpGGNCb/Z
    VrLokorMCQBdRsOE/ndAk4mIScfOE7jrqXdvBobjaKkHXk/fKCcxNFhOnxFKLP7KgmAgQF
    YTV1lJFvWJhyFBIDPwpuQ6jk1J1lTRLOJVSozzPQ5y7aDRGKiRi8Shmp3DwQ
X-ME-Proxy: <xmx:wmwoaswTirPjmMVfJHc_W6LrAYMh9KMVJr19VhOb89Qnf_LfSfB5lw>
    <xmx:wmwoaldE4s-yBCcQmZFafYf1331eDbMJ6pNp5sDvdU2t11PzKKE7LQ>
    <xmx:wmwoavNAqR-oQgFT-9pooc_OzzpbcXZjKt6Dw6b5moX1OpvkRiniDA>
    <xmx:wmwoagtKMqh_rhz098H_0JyS1b5oj7lqOsa5TwJSrU9v8DlkQiUrxQ>
    <xmx:w2woav5hhZHODyqcN3z32Og0vksK0XHKmhtL4zKSJ8YYb3Izweait2-->
Feedback-ID: i1568416f:Fastmail
Date: Tue, 9 Jun 2026 21:42:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/4] CI: Introduce new qubes-hw-runner.dockerfile
Message-ID: <aihsv37_XNFFn3Mu@mail-itl>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TIgY1lK+WAGop7vE"
Content-Disposition: inline
In-Reply-To: <20260609173102.2908514-4-andrew.cooper3@citrix.com>
X-purgate-ID: tlsNG-c201ff/1781034181-D8D7F443-A5E31C76/10/63158204843
X-purgate-type: spam
X-purgate-size: 4511
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vates.tech,kernel.org,amd.com,cardoe.com,citrix.com,gmail.com];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cardoe.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADDB8663DAD


--TIgY1lK+WAGop7vE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 9 Jun 2026 21:42:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/4] CI: Introduce new qubes-hw-runner.dockerfile

On Tue, Jun 09, 2026 at 06:31:01PM +0100, Andrew Cooper wrote:
> We want to make the build containers be non-root, but the hardware runner
> needs to continue being root.  Split it out into a dedicated container.
> Intentionally give it a generic name so it need not change in the future.

I'd rather prefer to keep the alpine version in the container name, so
future container updates can be made without breaking stable branches. I
have a related patch for this at
https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-lin=
ux?ref_type=3Dheads,
but apparently not posted yet.

> No practical change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I need to backport this patch to all trees (4.18 and later) before
> alpine:3.18-arm64v8 can be converted to be be non-root.

Converted? Since 3.18 is EOL for quite some time already, simply phase
it out slowly.

> In all other cases we've been renaming the containers to bypass this prob=
lem,
> but alpine:3.18-arm64v8 is in the correct new form.
>=20
> Alternatively, I could see about combining it with the Alpine update (whi=
ch is
> long overdue and needs doing).

Yeah, this.

> ---
>  .../build/alpine/qubes-hw-runner.dockerfile   | 21 +++++++++++++++++++
>  automation/gitlab-ci/test.yaml                |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
>=20
> diff --git a/automation/build/alpine/qubes-hw-runner.dockerfile b/automat=
ion/build/alpine/qubes-hw-runner.dockerfile
> new file mode 100644
> index 000000000000..0af17c6aabc6
> --- /dev/null
> +++ b/automation/build/alpine/qubes-hw-runner.dockerfile
> @@ -0,0 +1,21 @@
> +# syntax=3Ddocker/dockerfile:1
> +FROM --platform=3Dlinux/arm64/v8 alpine:3.18
> +LABEL maintainer.name=3D"The Xen Project"
> +LABEL maintainer.email=3D"xen-devel@lists.xenproject.org"
> +
> +RUN apk --no-cache add bash
> +
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    DEPS=3D(
> +          expect
> +          openssh-client
> +    )
> +
> +    apk add --no-cache "${DEPS[@]}"
> +EOF
> +
> +USER root
> +WORKDIR /build
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 89760b24e63a..70bb4bbb3b45 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -145,7 +145,7 @@
>    extends: .test-jobs-common
>    variables:
>      # the test controller runs on RPi4
> -    CONTAINER: alpine:3.18-arm64v8
> +    CONTAINER: alpine:qubes-hw-runner
>      LOGFILE: smoke-test.log
>      PCIDEV: "03:00.0"
>      PCIDEV_INTR: "MSI-X"
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TIgY1lK+WAGop7vE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoobL8ACgkQ24/THMrX
1ywKLwf+Ittt9mln+pBvY93xB2DTLYK1tDpatiTHTNiAaBHIH7zfv/giaPOsyXhU
BlUQmBCVMXj7jlhVNQnMr9lClwJL0lW3TjRrdVwt8NA6pMROxXEl7CdEKjEZDnt4
1+CdHroeNA1IvmqK8+QDcWXakA3iM7bMrwUDcxQ66yyyL9E+4FhxrWhfTzo10IJf
mlp1OCvASenWGsg1BllyoeY9b/INkmBVqeI85mZ4SKaABhoT+uDSZFkeLWyKA/5W
Wm2yj58ACMi+tAHoGUE/q4+AW3Um4EdO7pQdDBiwOERtjQwxuInFKzWmQH4f6ZsV
T6skkZQLo3kVUjb1Cn0cb3LtNBkgCw==
=uMGp
-----END PGP SIGNATURE-----

--TIgY1lK+WAGop7vE--

