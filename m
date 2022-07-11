Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1C56D48A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364812.594738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmft-0003XH-7u; Mon, 11 Jul 2022 06:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364812.594738; Mon, 11 Jul 2022 06:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmft-0003UU-50; Mon, 11 Jul 2022 06:13:41 +0000
Received: by outflank-mailman (input) for mailman id 364812;
 Mon, 11 Jul 2022 06:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAmfr-0003UO-UH
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:13:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a667494-00e0-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 08:13:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E22562271C;
 Mon, 11 Jul 2022 06:13:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8C4813322;
 Mon, 11 Jul 2022 06:13:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tb/LJ5G/y2IUbgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 06:13:37 +0000
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
X-Inumbo-ID: 9a667494-00e0-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657520017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRux010CJbn92hHj/3FewkdNUmCFo5A2COG23gOjC+4=;
	b=RWbYB8yADxXJqO4bqj2C5lsm+an+68LmCd0x+R9EWm99QH6+tvFRiioynsogw2+WVF4r0U
	dIQSJNMTwFAC52duPI6etuX99dOjdZuRqIeCf0uPgQOAN5+NZ4S69rxJSMop/UBw0sFgpm
	7dMYfr2PzYzuMqcU2OJrYtHnHAi/f/0=
Message-ID: <13bad947-17da-f2cf-1fa3-a8db8c3b0778@suse.com>
Date: Mon, 11 Jul 2022 08:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] xen/cmdline: Extend parse_boolean() to signal a name
 match
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
 <20220708161934.10095-3-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220708161934.10095-3-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xV9hNAVrvseUBjAk2tk3gB8z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xV9hNAVrvseUBjAk2tk3gB8z
Content-Type: multipart/mixed; boundary="------------rQlnxSoOg1WQ0IMI4pvohMNm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Message-ID: <13bad947-17da-f2cf-1fa3-a8db8c3b0778@suse.com>
Subject: Re: [PATCH 2/3] xen/cmdline: Extend parse_boolean() to signal a name
 match
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
 <20220708161934.10095-3-andrew.cooper3@citrix.com>
In-Reply-To: <20220708161934.10095-3-andrew.cooper3@citrix.com>

--------------rQlnxSoOg1WQ0IMI4pvohMNm
Content-Type: multipart/mixed; boundary="------------786ARqgJnwJkiEFBcYHHn4pP"

--------------786ARqgJnwJkiEFBcYHHn4pP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDcuMjIgMTg6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFRoaXMgd2lsbCBo
ZWxwIHBhcnNpbmcgYSBzdWItb3B0aW9uIHdoaWNoIGhhcyBib29sZWFuIGFuZCBub24tYm9v
bGVhbiBvcHRpb25zDQo+IGF2YWlsYWJsZS4NCj4gDQo+IEZpcnN0LCByZXdvcmsgJ2ludCB2
YWwnIGludG8gJ2Jvb2wgaGFzX25lZ19wcmVmaXgnLiAgVGhpcyBpbnZlcnRzIGl0J3MgdmFs
dWUsDQo+IGJ1dCB0aGUgcmVzdWx0aW5nIGxvZ2ljIGlzIGZhciBlYXNpZXIgdG8gZm9sbG93
Lg0KPiANCj4gU2Vjb25kLCByZWplY3QgYW55dGhpbmcgb2YgdGhlIGZvcm0gJ25vLSRGT089
JyB3aGljaCBleGNsdWRlcyBhbWJpZ3VvdXMNCj4gY29uc3RydWN0cyBzdWNoIGFzICduby0k
Zm9vPXllcycgd2hpY2ggaGF2ZSBuZXZlciBiZWVuIHZhbGlkLg0KPiANCj4gVGhpcyBqdXN0
IGxlYXZlcyB0aGUgY2FzZSB3aGVyZSBldmVyeXRoaW5nIGlzIG90aGVyd2lzZSBmaW5lLCBi
dXQgcGFyc2VfYm9vbCgpDQo+IGNhbid0IGludGVycHJldCB0aGUgcHJvdmlkZWQgc3RyaW5n
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------786ARqgJnwJkiEFBcYHHn4pP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------786ARqgJnwJkiEFBcYHHn4pP--

--------------rQlnxSoOg1WQ0IMI4pvohMNm--

--------------xV9hNAVrvseUBjAk2tk3gB8z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLLv5EFAwAAAAAACgkQsN6d1ii/Ey9m
lQf/YmBptBcbt3J0jQ4t70sC14zeO/tI+zQk+OcxeQc7zTErNI5hVbJINQDu+ZKB5F6sxtm8fTCj
Ud3WeTSrYHRImuH4eM2PwWeRZWanTOSp7lxE9vQYiO0iZ6G7Xd0SnVFpi3cl4dYQLNKGXkamJDEg
/Qcpu93t6xBsb5iuxkVd6MzSNkt8zO7YRX3a4Qs+VciMmOQMLHBuDDVGN1D1PHcSmaWgagX5K591
q9dzrJs7RichVYnpetlATaAaJR8FCUKp2fc3k7Ey/BS7R+OlNqD7wYekv8+/t3iV4e1E3lhQAxgy
JjaMv+7urKAV96y+8vRU+9qs1zOMirpg8rzhMWvyWg==
=PwxM
-----END PGP SIGNATURE-----

--------------xV9hNAVrvseUBjAk2tk3gB8z--

