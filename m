Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28164517209
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318948.538965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXSg-0005uL-Rq; Mon, 02 May 2022 14:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318948.538965; Mon, 02 May 2022 14:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXSg-0005sW-Og; Mon, 02 May 2022 14:55:42 +0000
Received: by outflank-mailman (input) for mailman id 318948;
 Mon, 02 May 2022 14:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+C6=VK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlXSf-0005sN-0K
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:55:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea45596-ca27-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 16:55:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 843D01F388;
 Mon,  2 May 2022 14:55:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57664133E5;
 Mon,  2 May 2022 14:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KLfnE+vwb2KSQAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 02 May 2022 14:55:39 +0000
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
X-Inumbo-ID: eea45596-ca27-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651503339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwYutGKynN3uRVRz3lGzfR/Kh8A8Lg74zXPOFz9sMDs=;
	b=tLqRzFlQ2sJxx0+d6Iun5TbiPE6QvDGrR7Qs/pLQojRZvcIviM4s2auAMZvPjCrS3/xvgo
	NwztIb5r2WAViDktcQ9ruFG7hS5qlLeYWcO/YXQGVg/fo2acLKCmAcUnPvgU72jx64V2O8
	DWS6Z20MVtWnkW4/3qg1o8jR/afOw0s=
Message-ID: <3e4bf63d-9bc0-2345-b8d5-8d48c4ef82dc@suse.com>
Date: Mon, 2 May 2022 16:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
 <YmvDjI4hmmhZ90fi@Air-de-Roger>
 <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
 <9e2e5bf7-860f-5777-ea18-2025a9bcf2e9@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <9e2e5bf7-860f-5777-ea18-2025a9bcf2e9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MwY1h32D3xg1r0ibYNllPnEq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MwY1h32D3xg1r0ibYNllPnEq
Content-Type: multipart/mixed; boundary="------------lokia30VNmLdzsUMViYFA0fU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <3e4bf63d-9bc0-2345-b8d5-8d48c4ef82dc@suse.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
 <YmvDjI4hmmhZ90fi@Air-de-Roger>
 <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
 <9e2e5bf7-860f-5777-ea18-2025a9bcf2e9@suse.com>
In-Reply-To: <9e2e5bf7-860f-5777-ea18-2025a9bcf2e9@suse.com>

--------------lokia30VNmLdzsUMViYFA0fU
Content-Type: multipart/mixed; boundary="------------ufmg6udNOxmohvyHMqBUV0hp"

--------------ufmg6udNOxmohvyHMqBUV0hp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjIgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wNS4yMDIy
IDE2OjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gUEFUIE1TUiB3cml0ZXMgY2FuIGJl
IGhhbmRsZWQgYnkgc3BlY2lhbCBjYXNpbmcgaW4geGVuX3dyaXRlX21zcl9zYWZlKCkuDQo+
IA0KPiBZb3UgY2FuIHNxdWFzaCB0aGUgd3JpdGUgYXR0ZW1wdCB0aGVyZSwgYnV0IHRoYXQn
bGwgc3RpbGwgY29uZnVzZSB0aGUgY2FsbGVyDQo+IGFzc3VtaW5nIHRoZSB3cml0ZSBhY3R1
YWxseSB0b29rIGVmZmVjdC4NCg0KV2l0aCB0aGUgbGlzdCBvZiBjcHVzIHN1cHBvcnRlZCBi
eSBYZW4gSSBkb24ndCBzZWUgYSBiaWcgY2hhbGxlbmdlIGhlcmUuDQpQQVQgdmlydHVhbGl6
YXRpb24gaGFuZGxlcyBldmVyeXRoaW5nIHdlIG5lZWQuDQoNCg0KSnVlcmdlbg0K
--------------ufmg6udNOxmohvyHMqBUV0hp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ufmg6udNOxmohvyHMqBUV0hp--

--------------lokia30VNmLdzsUMViYFA0fU--

--------------MwY1h32D3xg1r0ibYNllPnEq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJv8OoFAwAAAAAACgkQsN6d1ii/Ey84
SQf8DWt9B3HNs5UR/30oTrbK4BXGPpXKcqWyjSFspRjNcOB97jRN1v+wQ3oA5VxEPRIhq+qKRfU1
aSdwKjOn3eBfZG3T7ZXURZlt0o+vbOJnNnq5TSWle1su+uuOyEKdcPWlo7CkatAjQy5lqte8YZof
tc3rqT70Tm6BWl1YGpJU7lzHIEiZ1r78GJom9RO085iZwB4Yym/yMoh8TWRrXYmsQeRjiTQOTV39
ocb4Xcyaj3Rzph0Xd+WyND2F1xWDG50tUyV9czc/QwsKPM4OcEhCPcE4n8U1M3cqBqKW1wC9hOpc
wv0gORg3Gk4+eO78RQtFK7L+Atr/mEJhqvz6+7+/5A==
=mITB
-----END PGP SIGNATURE-----

--------------MwY1h32D3xg1r0ibYNllPnEq--

