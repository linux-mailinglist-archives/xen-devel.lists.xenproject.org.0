Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VzTrI6bpL2rFIwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:01:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6006685EF6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=CzeRt1K1;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=MW2kSM3f;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1338188.1599199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ60O-0006wc-CN; Mon, 15 Jun 2026 12:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338188.1599199; Mon, 15 Jun 2026 12:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ60O-0006uW-9j; Mon, 15 Jun 2026 12:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1338188;
 Mon, 15 Jun 2026 12:01:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ60L-0006sx-RG
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 12:01:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ60K-00HLjO-MC
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:01:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2fe993-bab6-0a2a0a5309dd-0a2a450b8620-4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:01:24 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a2fe993-212f-0a2a450b0019-67a8ac97864b-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:01:23 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id BDF20EC012C;
 Mon, 15 Jun 2026 08:01:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 15 Jun 2026 08:01:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 08:01:20 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781524882;
	 x=1781611282; bh=ejZeF8rDhkqE68Ou/lL2YpGjTHYc4eayzk4elYwJWp8=; b=
	CzeRt1K1sN5eC3n1jerE/S+o1mO/QHisot7hBJK68zDm5s1u+D1XQ3a6aUnDUP9e
	NJS8N1MkE16SD1Y5IObUDz+XDPxFcYYF7LkjKnE67mIruvPb6CA39PkXHI2RozvX
	eaUE4RtANZEpsFD+ZZXoBOycTv6M0QpatsXqVnMHWvUVqyTIHgx8fosejWsDORTk
	qwwPDHTAo25f1gRY3AlEE48I8Nhfi1yHHy+OHRpJoczuFzt1YGATWv2MlwCt+KtA
	XlbPb18IXqNsA89n/xbYF3iW9Cpl6eT7ej63/LNZ7kIH53nZLDXhvlVL+j2puvsC
	xxsRbEaH1UGMxS0AnQNTnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781524882; x=1781611282; bh=ejZeF8rDhkqE68Ou/lL2YpGjTHYc4eayzk4
	elYwJWp8=; b=MW2kSM3f/+LhelJZKR7D4RVH9jXw/o6EdwTqto8uDRDrJcKAwhQ
	oOgFDdkWrOeXhp5m/PEA5G1kKsDRxGgrmXfdfDN3m4DspK1J0BgaVNxblCrXyd3V
	dEhkv26QHk3VpZrYI1P7RejloEAFnaH++ttW9RNnlmiv9BPu9E2DYb/bCn5EUlzL
	Pq41gzjfzyi5lENQttSynBp6AeCySc5XxII/VPph7dKj2Ls9siQuZJy2iyKZNMJU
	xckGGCavl7LbR2KpfRyPAiYYeglg9Z/JuJUQDfmvKbpuFmPz7IkVXZ8/f4+dWkpW
	lR9H0IlGrIjimVGm4CYQZNe/NM+t1PhLhKg==
X-ME-Sender: <xms:kukvar-MpmWi-FdZtCauyvYfICiKgrDpFN2KzBm0JdwRLohMR0iLOQ>
    <xme:kukvamyC2tpJBpsBtVSI3__fkZbZkoJaeVJ_kmDeD9rk4m9XKFUo9fKCP26Y2QDST
    s4divDNj1cisKvuFXUlvqzRYx9OoEKTEjnGR2wX2IB1gBh6>
X-ME-Received: <xmr:kukvavNNU_f9l8t9VBlxSQVGu5OlL-O8lLi0ERF70ApPvRypikBqzarzTG4E-32CLogIRbwSef1zFAXTDCywSu5LaoT8kNke4Tc>
X-ME-Proxy-Cause: dmFkZTFQ/5CqoInJNis6rOzs6Ar24bRvqg4j7TFjkUigBg+ltkXR9mfmajUldkqQAekjtS
    9u8vnIftc0fgiIdmiWOswadejd1aFM2cNmGzcYcN6+uTB6tez5KUqJWTixOvslM3Wn0lMg
    XwwH/JkIrWRc0wzqkeaUXTiBqmweH9mDwNAyq1z4ZMZvbilxr3y4EXkh9eBwDwsWnhncvw
    5IzyCS9hMihImXbCJ4tPNAQsR1w5chYby2JM2NX76UawhbIVrSbZmGlUV1sqnYrnAPu097
    FRO2QdAS3zf/PxCoULC4OUlK08RkQLbJSXWFTs+2Cl1AQV+Hpfpnq5RqoZUdAElL9GcaJz
    CrJ9RxDcYHReD7EzULU9uloZIHw7F4Q+VrfQm7Sa/pVP0wR05KPCRd6Zv/77QHkYtrCX1G
    OtWvukdaMqbO4Vob3pKjKokpX6WwotxOkyiGzT+6+fKNGtdA01+h+AChmOfJPHwdVqW8UX
    uS7DmiMPWZSdd8mZQBOHM+QzBXpjkHBGtj8LtkW9Om9X1W3TBi1+yHdPYaydky+85EOiT5
    ppQ6QIzsH9c8kaU2uwzAWr0TDZC/IoRR4h1cHE1+hE/iRNkdfisdqO9CNgSnlf1Vvv5OIy
    RNFYPNMAAvLCYmD4rhFR7EPNLyFpntiBq1+2HwkL5PGDZ7KZ9Jx5K+ZxbOcA
X-ME-Proxy: <xmx:kukvaj-gbTEu3Wp44ZSopONyCCmCBUmh78hIY-TpOSpC2adUuZyoAA>
    <xmx:kukvak5j-A0VkSnWGgzMKi8MuPf8sfyPlDQ13y6ihEXDmzC0GTLzgA>
    <xmx:kukvah5amixIyCFieDvDs6u8KyHtzEIhmFXjKmUWst1L6ZdlVE2NHA>
    <xmx:kukvalqjGkULeuvGd9SWL6nuKPHJjuTjlgLak8KNz5CI_63VEE6Kaw>
    <xmx:kukvaoVNE5iDMBitVcfn7C-QRSLiRnCTc2y5tDD_klQayrenZds5-FhU>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 15 Jun 2026 14:01:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/7] CI: Introduce new qubes-hw-runner.dockerfile
Message-ID: <ai_pjsa2mpTGJzJj@mail-itl>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
 <20260612230924.3181154-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7brszrSjXqGDxlsS"
Content-Disposition: inline
In-Reply-To: <20260612230924.3181154-4-andrew.cooper3@citrix.com>
X-purgate-ID: tlsNG-42698a/1781524884-1B979F3B-95A5777C/10/63158204843
X-purgate-type: spam
X-purgate-size: 4102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xenproject.org:email,cardoe.com:email,invisiblethingslab.com:dkim,invisiblethingslab.com:email,invisiblethingslab.com:from_mime,vates.tech:email,messagingengine.com:dkim,mail-itl:mid];
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
X-Rspamd-Queue-Id: D6006685EF6


--7brszrSjXqGDxlsS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 14:01:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/7] CI: Introduce new qubes-hw-runner.dockerfile

On Sat, Jun 13, 2026 at 12:09:20AM +0100, Andrew Cooper wrote:
> This container is tied to gitlab-runner environment in the RPis driving t=
he
> test systems, not a specific version of Alpine.  Intentionally give it a
> generic name so it need not change in the future.
>=20
> Switch to Alpine 3.24 right away, as it doesn't interact with the 3.18 bu=
ilds
> under test.
>=20
> The container needs to remain a root container.  By no longer using the
> arm64v8 build container for dual-purpose, we can finally make the build
> containers be non-root.
>=20
> No practical change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Posted previously, part of the prior CI series.
> ---
>  .../build/alpine/qubes-hw-runner.dockerfile   | 21 +++++++++++++++++++
>  automation/gitlab-ci/test.yaml                |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
>=20
> diff --git a/automation/build/alpine/qubes-hw-runner.dockerfile b/automat=
ion/build/alpine/qubes-hw-runner.dockerfile
> new file mode 100644
> index 000000000000..8b111648721d
> --- /dev/null
> +++ b/automation/build/alpine/qubes-hw-runner.dockerfile
> @@ -0,0 +1,21 @@
> +# syntax=3Ddocker/dockerfile:1
> +FROM --platform=3Dlinux/arm64/v8 alpine:3.24
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

--7brszrSjXqGDxlsS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmov6Y4ACgkQ24/THMrX
1yx60gf9F+gphaQ0/cdIAqVkq70uDpw/75tjO6iq4X6WOajHkeyA5DerzeZkmPH/
tpeHIxjWDwXgHHRAcuftGbfCc6w/eB1NEVK/qCJfrSri1oUMtOunNYfcvE7WgszP
yS8BucZqQUg3AlodAoVqeD/9d/VWfTQNbpJNWEgWUd3EKwJ4dvU4UWzY8yp/2x0/
omP9LthrLuHSaIa9dT+f9cfN2qxXM6FwAXujueB0BP4pyzK/G84HIDQMK9y029N2
Yifw4cJoO7U+sjh5JldeqZih2B3YfhSEHS2Pa3REOGS4pdzZGlEs8cPCjZl+LFSD
dIoUi4tMF6Uq7LU8AkVsmn6sqAy4Ug==
=AlBn
-----END PGP SIGNATURE-----

--7brszrSjXqGDxlsS--

