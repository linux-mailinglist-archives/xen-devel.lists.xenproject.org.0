Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD766B86B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478386.741547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKEu-0007xQ-GM; Mon, 16 Jan 2023 07:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478386.741547; Mon, 16 Jan 2023 07:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKEu-0007vH-Dg; Mon, 16 Jan 2023 07:49:08 +0000
Received: by outflank-mailman (input) for mailman id 478386;
 Mon, 16 Jan 2023 07:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OEfv=5N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHKEt-0007vB-DP
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:49:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ffbc088-9572-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 08:49:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D36E2214D;
 Mon, 16 Jan 2023 07:49:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E5B3139C2;
 Mon, 16 Jan 2023 07:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b3W6EXABxWPleQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Jan 2023 07:49:04 +0000
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
X-Inumbo-ID: 3ffbc088-9572-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673855344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kI/9n/LxQnfTez/eAqP/SHUYnXorN1nObJCwWRHa0cI=;
	b=UwqZlIz0oE8CKcGIpoIosgmA+QOss5ViBnHe8aj7ZqSY5FqW0u4WIx3nQXNSyMxwlh9/SE
	lTawv06K0fmHq0YU8vLNKBoo7YLrnEDgvWrgle78CeJLrKKfhguHWQLbvQltZ70Ur9bCmy
	Sav9IiyylmGEcoisYLMA9d8PE31DQbU=
Message-ID: <d0c6363f-d5c9-a53b-5275-e5134b54f09a@suse.com>
Date: Mon, 16 Jan 2023 08:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/2] x86/xen: don't return from xen_pv_play_dead()
Content-Language: en-US
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20221125063248.30256-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221125063248.30256-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0nAghWXiYBvAaH6RQMQFfUSx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0nAghWXiYBvAaH6RQMQFfUSx
Content-Type: multipart/mixed; boundary="------------LWRXFRU1UdBEuI0eEO6d0jPz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Message-ID: <d0c6363f-d5c9-a53b-5275-e5134b54f09a@suse.com>
Subject: Re: [PATCH 0/2] x86/xen: don't return from xen_pv_play_dead()
References: <20221125063248.30256-1-jgross@suse.com>
In-Reply-To: <20221125063248.30256-1-jgross@suse.com>

--------------LWRXFRU1UdBEuI0eEO6d0jPz
Content-Type: multipart/mixed; boundary="------------yvHPhWTTfK48d68wOsnr01OZ"

--------------yvHPhWTTfK48d68wOsnr01OZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMTEuMjIgMDc6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEFsbCBwbGF5X2Rl
YWQoKSBmdW5jdGlvbnMgYnV0IHhlbl9wdl9wbGF5X2RlYWQoKSBkb24ndCByZXR1cm4gdG8g
dGhlDQo+IGNhbGxlci4NCj4gDQo+IEFkYXB0IHhlbl9wdl9wbGF5X2RlYWQoKSB0byBiZWhh
dmUgbGlrZSB0aGUgb3RoZXIgcGxheV9kZWFkKCkgdmFyaWFudHMuDQo+IA0KPiBKdWVyZ2Vu
IEdyb3NzICgyKToNCj4gICAgeDg2L3hlbjogZG9uJ3QgbGV0IHhlbl9wdl9wbGF5X2RlYWQo
KSByZXR1cm4NCj4gICAgeDg2L3hlbjogbWFyayB4ZW5fcHZfcGxheV9kZWFkKCkgYXMgX19u
b3JldHVybg0KPiANCj4gICBhcmNoL3g4Ni94ZW4vc21wLmggICAgICB8ICAyICsrDQo+ICAg
YXJjaC94ODYveGVuL3NtcF9wdi5jICAgfCAxNyArKysrLS0tLS0tLS0tLS0tLQ0KPiAgIGFy
Y2gveDg2L3hlbi94ZW4taGVhZC5TIHwgIDcgKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wv
Y2hlY2suYyAgIHwgIDEgKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KDQpQaW5nPw0KDQoNCkp1ZXJnZW4NCg==
--------------yvHPhWTTfK48d68wOsnr01OZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yvHPhWTTfK48d68wOsnr01OZ--

--------------LWRXFRU1UdBEuI0eEO6d0jPz--

--------------0nAghWXiYBvAaH6RQMQFfUSx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPFAW8FAwAAAAAACgkQsN6d1ii/Ey9S
yQf8DQlfdCE+6vBQ7htRNbdOs0J9iISKLSUh8pakjmjrbRR8z0IA6FDkLcdS+yIbX/wj+jjMJIdq
0PZsQTswsxJvfWcdd6/gHtWR89kNTc6qNBG2GCRO1PQPeOjOS72woauloN9IIYL6oPJUySyf2P4T
0WA+pQhjNqdqBaDRY33QZnTJQ836tO/JPyxG80DEqaLAsWnrR2kUtRR3I67L/K0LPECtTzM5vW1Q
e1pV0s5cLVHZ5/GJagN8WMmBGAChm5hIfgoVLMzrze00WnaVs12aCEpAkPhTEzw3QcPzdq/lNn6t
Fz0mUwqiKoCy/C/m+PvySYkF54OPw5Ux71IcdYgMMQ==
=d9PH
-----END PGP SIGNATURE-----

--------------0nAghWXiYBvAaH6RQMQFfUSx--

