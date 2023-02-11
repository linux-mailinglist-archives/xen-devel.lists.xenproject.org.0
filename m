Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317F692E9A
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 07:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493786.763816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQjIq-00037k-VB; Sat, 11 Feb 2023 06:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493786.763816; Sat, 11 Feb 2023 06:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQjIq-00035O-RL; Sat, 11 Feb 2023 06:24:04 +0000
Received: by outflank-mailman (input) for mailman id 493786;
 Sat, 11 Feb 2023 06:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c50C=6H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQjIo-00035D-TU
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 06:24:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa859200-a9d4-11ed-93b5-47a8fe42b414;
 Sat, 11 Feb 2023 07:23:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 630743393C;
 Sat, 11 Feb 2023 06:23:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3958D13A1F;
 Sat, 11 Feb 2023 06:23:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R6MCDH0052P2WQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 11 Feb 2023 06:23:57 +0000
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
X-Inumbo-ID: aa859200-a9d4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676096637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ehoRu52+j8qFCI7ZreeVaH5N+q71cuyzpByv070ySv0=;
	b=Enygx9O/MBsKiHnsvacdeEpoog/KNaGx0fXa2FhFjHslH5LbXvC02zy5z8JYMAUiLiAa8X
	OAZXoui9OcCi/yB5H4Np6Ut0mpnGelm6R4oRwpzzf5apx3MG/nWKzukp8yMTTRg98taTTW
	2Ft5qJNsQMFlJpckS1LgrP86qejFpcw=
Message-ID: <7309a521-7c8c-41c7-eae7-fa3d4c08f4f7@suse.com>
Date: Sat, 11 Feb 2023 07:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-7-jgross@suse.com>
 <20230210185328.2zqo5xvklpke3ie2@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230210185328.2zqo5xvklpke3ie2@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c1aQ0FFzOSLQ01YXxZ3gM7P8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c1aQ0FFzOSLQ01YXxZ3gM7P8
Content-Type: multipart/mixed; boundary="------------K2w4L4SAQl3Vl94ujbCyYKK7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <7309a521-7c8c-41c7-eae7-fa3d4c08f4f7@suse.com>
Subject: Re: [PATCH v2 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-7-jgross@suse.com>
 <20230210185328.2zqo5xvklpke3ie2@begin>
In-Reply-To: <20230210185328.2zqo5xvklpke3ie2@begin>

--------------K2w4L4SAQl3Vl94ujbCyYKK7
Content-Type: multipart/mixed; boundary="------------X2SoR0QsTVz1xze8Z5c00D8n"

--------------X2SoR0QsTVz1xze8Z5c00D8n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDIuMjMgMTk6NTMsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgdmVuLiAxMCBmw6l2ci4gMjAyMyAxMTo0NjoyNyArMDEwMCwgYSBlY3JpdDoN
Cj4+ICtzdGF0aWMgYm9vbCBwYXRoX2Nhbm9uaWNhbChjb25zdCBjaGFyICpwYXRobmFtZSkN
Cj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBsZW4gPSBzdHJsZW4ocGF0aG5hbWUpOw0K
Pj4gKyAgICBjb25zdCBjaGFyICpjOw0KPj4gKw0KPj4gKyAgICAvKiBFbXB0eSBwYXRoIGlz
IGFsbG93ZWQuICovDQo+PiArICAgIGlmICggIWxlbiApDQo+PiArICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4+ICsNCj4+ICsgICAgLyogTm8gdHJhaWxpbmcgJy8nLiAqLw0KPj4gKyAgICBp
ZiAoIHBhdGhuYW1lW2xlbiAtIDFdID09ICcvJyApDQo+PiArICAgICAgICByZXR1cm4gZmFs
c2U7DQo+PiArDQo+PiArICAgIC8qIE5vIHNlbGYgb3IgcGFyZW50IHJlZmVyZW5jZXMuICov
DQo+PiArICAgIGMgPSBwYXRobmFtZTsNCj4+ICsgICAgd2hpbGUgKCAoYyA9IHN0cnN0cihj
LCAiLy4iKSkgIT0gTlVMTCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggY1syXSA9
PSAnLicgKQ0KPj4gKyAgICAgICAgICAgIGMrKzsNCj4+ICsgICAgICAgIGlmICggY1syXSA9
PSAwIHx8IGNbMl0gPT0gJy8nICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+
PiArICAgICAgICBjICs9IDI7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIHRy
dWU7DQo+PiArfQ0KPiANCj4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUgY2F0Y2hpbmcgIi8v
Ij8NCg0KT2gsIHNpbGx5IG1lIQ0KDQoNCkp1ZXJnZW4NCg0K
--------------X2SoR0QsTVz1xze8Z5c00D8n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------X2SoR0QsTVz1xze8Z5c00D8n--

--------------K2w4L4SAQl3Vl94ujbCyYKK7--

--------------c1aQ0FFzOSLQ01YXxZ3gM7P8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPnNHwFAwAAAAAACgkQsN6d1ii/Ey8q
hAf+LEyNJVeHchISPO3V/7N8ggVBC9SnwgHu/8vcF3mSNd2Xy7tUOKg94zjm3AhOc1/Vv9KeoxcY
9/1WqNx/Lyd11Y1e8W0swsBXEZOEdjHpgOBvh3CENgAC63+KB8otWtaxqrnGCTRd2c/L2c1Gc/j5
laMnYVrRG5hwbWg10CSOcjQ4oQIcikM7jPfL2LMvzLVNQtqRJwF1DZiTbWbpvUtyK1v5nTbGHVlv
Gg6ki22g6NlbweyP7zDl+PQCxD0gfoM1QnwxQj5Ug3IdzKwz7+fWhWxM+uuCp6vL5tL/AgIFAKPy
hFcYbEbwx0A1rtu4WVYWBV/i5cJCge2xKqWQC5Gctg==
=v4pe
-----END PGP SIGNATURE-----

--------------c1aQ0FFzOSLQ01YXxZ3gM7P8--

