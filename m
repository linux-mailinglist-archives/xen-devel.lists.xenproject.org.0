Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33368B892
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490137.758717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxjG-0005YI-Er; Mon, 06 Feb 2023 09:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490137.758717; Mon, 06 Feb 2023 09:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxjG-0005WU-Av; Mon, 06 Feb 2023 09:24:02 +0000
Received: by outflank-mailman (input) for mailman id 490137;
 Mon, 06 Feb 2023 09:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pOxjE-0005UA-G2
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:24:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fab14662-a5ff-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 10:23:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4FDC3F290;
 Mon,  6 Feb 2023 09:23:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D14713677;
 Mon,  6 Feb 2023 09:23:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q9stHSzH4GNwOAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 09:23:56 +0000
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
X-Inumbo-ID: fab14662-a5ff-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675675436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQXVc2EqJoXYjYOUh6r9cWLuCgbAbKl+BcBrC9LF9hA=;
	b=Hrbvogd19KA3WLtkkVFmxCZ/W7OlssyvXrsEDIFUPoI/WSjjltK2jzbEuLmwlrmKxKDMO4
	I6oyODWogV3r86p/6yP5RREanL57fMY/pdQZlrYhrt/5FbGT4OjBjv4pYdbIf71UZgoBBN
	DvscIA2peR7PSmnEi5WhDseEyz2Yjf4=
Message-ID: <75603739-a013-1da8-a30a-e0e549c5fcd6@suse.com>
Date: Mon, 6 Feb 2023 10:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/7] Mini-OS: xenbus: add support for reading node from
 directory
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-2-jgross@suse.com>
 <20230204140148.pmhv2vnsb7ejobji@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230204140148.pmhv2vnsb7ejobji@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WzMtLIAV9yaN7ruULp3feNIM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WzMtLIAV9yaN7ruULp3feNIM
Content-Type: multipart/mixed; boundary="------------0y4kSmhFGC6gfg7MtiRe0Iwo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <75603739-a013-1da8-a30a-e0e549c5fcd6@suse.com>
Subject: Re: [PATCH 1/7] Mini-OS: xenbus: add support for reading node from
 directory
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-2-jgross@suse.com>
 <20230204140148.pmhv2vnsb7ejobji@begin>
In-Reply-To: <20230204140148.pmhv2vnsb7ejobji@begin>

--------------0y4kSmhFGC6gfg7MtiRe0Iwo
Content-Type: multipart/mixed; boundary="------------GPQvSeXqb39WSySrtk6ebLJ7"

--------------GPQvSeXqb39WSySrtk6ebLJ7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjMgMTU6MDEsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBKdWVyZ2VuIEdyb3NzLCBsZSB2ZW4uIDAzIGbDqXZyLiAyMDIzIDEwOjE4OjAzICsw
MTAwLCBhIGVjcml0Og0KPj4gK2NoYXIgKnhlbmJ1c19yZWFkX3Vuc2lnbmVkKHhlbmJ1c190
cmFuc2FjdGlvbl90IHhidCwgY29uc3QgY2hhciAqZGlyLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5vZGUsIHVuc2lnbmVkIGludCAqdmFsdWUpDQo+
PiArew0KPj4gKyAgICBjaGFyIHBhdGhbQlVGRkVSX1NJWkVdOw0KPj4gKyAgICBjaGFyICpt
c2c7DQo+PiArICAgIGNoYXIgKnN0cjsNCj4+ICsNCj4+ICsgICAgeGVuYnVzX2J1aWxkX3Bh
dGgoZGlyLCBub2RlLCBwYXRoKTsNCj4+ICsgICAgbXNnID0geGVuYnVzX3JlYWQoeGJ0LCBw
YXRoLCAmc3RyKTsNCj4+ICsgICAgaWYgKCBtc2cgKQ0KPj4gKyAgICAgICAgcmV0dXJuIG1z
ZzsNCj4+ICsNCj4+ICsgICAgc3NjYW5mKHN0ciwgIiV1IiwgdmFsdWUpOw0KPiANCj4gSSdk
IHNheSBiZXR0ZXIgY2hlY2sgdGhhdCBzc2NhbmYgcmV0dXJuZWQgMSBhbmQgb3RoZXJ3aXNl
IHJldHVybiBhbg0KPiBlcnJvci4gT3RoZXJ3aXNlICp2YWx1ZSBtYXkgZW5kIHVwIHVuaW5p
dGlhbGl6ZWQuDQoNCk9rYXkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------GPQvSeXqb39WSySrtk6ebLJ7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GPQvSeXqb39WSySrtk6ebLJ7--

--------------0y4kSmhFGC6gfg7MtiRe0Iwo--

--------------WzMtLIAV9yaN7ruULp3feNIM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPgxywFAwAAAAAACgkQsN6d1ii/Ey+g
Twf/dDI8C+ha68MR6vyp6KvSH1hUT6k8f7xCYZgxPnPO36WzD28rB0Aa/SWWZKLsqWrIUoWweiT8
PudisnbyALNuqhbMF7cY0Z1QIcjYvu40od6bk+AX/bHb+EU4KSmZfpYOxtjuKbUYU5GWQK4jCQEj
GQ2dbcAf9RN9azYZuYwhxXALMj7+WMRTjRK5yjjFW26q3B9yXTGbKJuj0aTrXPp4ZzhyvtKh0mAh
Xh6qx1IykBXugFVs6m2TCnB3P8Z/9LibNvn5NCM0GZv8BiajuGecY9NNpHKy0dYXM4CZXLpDWJX5
Cf9nP3kItzRtzxJ7DlhX3Dx6zEDTkM/bqLfbJ/ijCA==
=yYpx
-----END PGP SIGNATURE-----

--------------WzMtLIAV9yaN7ruULp3feNIM--

