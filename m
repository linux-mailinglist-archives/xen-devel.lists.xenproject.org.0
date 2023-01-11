Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD76656E8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 10:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475137.736681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFX4f-0003Fw-HA; Wed, 11 Jan 2023 09:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475137.736681; Wed, 11 Jan 2023 09:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFX4f-0003Dw-EG; Wed, 11 Jan 2023 09:07:09 +0000
Received: by outflank-mailman (input) for mailman id 475137;
 Wed, 11 Jan 2023 09:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFX4e-0003Dq-B8
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 09:07:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a5e5d5-918f-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 10:07:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93BED170A7;
 Wed, 11 Jan 2023 09:07:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C5FE13591;
 Wed, 11 Jan 2023 09:07:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iiIDGTp8vmOAWQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 11 Jan 2023 09:07:06 +0000
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
X-Inumbo-ID: 52a5e5d5-918f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673428026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hINL1kw5QQtqka4RW0Ff+qlJJ1FTTaLsBoXy+6fy0SY=;
	b=u8cqqGl5iJLQW4NvZB0OfdcA0OX/HsXxnqegqv2rKBxRg+7JvkgWzpjKxjSDeqpd7/X7ex
	oMOP7iWvchwSpghbnB5xtAO4vdLw4kuGFmF9Y6wlEI9CMMGtC6R7w4edrIJTWZauKnKr8H
	Nqq1xNhhVrvFbfu5lFzzCN1kUS7TQ0Y=
Message-ID: <2c0b38d3-b254-6968-1492-35d7b8b475ad@suse.com>
Date: Wed, 11 Jan 2023 10:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/19] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-12-jgross@suse.com>
 <04658e96-ec81-1dba-6829-3a52c69a27bb@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <04658e96-ec81-1dba-6829-3a52c69a27bb@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6zV1cawd1gKaGdLLS6m0S5vW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6zV1cawd1gKaGdLLS6m0S5vW
Content-Type: multipart/mixed; boundary="------------4fNEaKrbQaeyNiC3QP8pEqpn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2c0b38d3-b254-6968-1492-35d7b8b475ad@suse.com>
Subject: Re: [PATCH v2 11/19] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-12-jgross@suse.com>
 <04658e96-ec81-1dba-6829-3a52c69a27bb@xen.org>
In-Reply-To: <04658e96-ec81-1dba-6829-3a52c69a27bb@xen.org>

--------------4fNEaKrbQaeyNiC3QP8pEqpn
Content-Type: multipart/mixed; boundary="------------95dPM5R07imH7r3tCk1Hjnk9"

--------------95dPM5R07imH7r3tCk1Hjnk9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTIuMjIgMjE6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMy8xMi8yMDIyIDE2OjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGFjY291
bnRpbmcgZm9yIHRoZSBudW1iZXIgb2Ygbm9kZXMgb2YgYSBkb21haW4gaW4gYW4gYWN0aXZl
DQo+PiB0cmFuc2FjdGlvbiBpcyBub3Qgd29ya2luZyBjb3JyZWN0bHksIGFzIGl0IGFsbG93
cyB0byBjcmVhdGUgYXJiaXRyYXJ5DQo+PiBudW1iZXIgb2Ygbm9kZXMuIFRoZSB0cmFuc2Fj
dGlvbiB3aWxsIGZpbmFsbHkgZmFpbCBkdWUgdG8gZXhjZWVkaW5nDQo+PiB0aGUgbnVtYmVy
IG9mIG5vZGVzIHF1b3RhLCBidXQgYmVmb3JlIGNsb3NpbmcgdGhlIHRyYW5zYWN0aW9uIGFu
DQo+PiB1bnByaXZpbGVnZWQgZ3Vlc3QgY291bGQgY2F1c2UgWGVuc3RvcmUgdG8gdXNlIGEg
bG90IG9mIG1lbW9yeS4NCj4gDQo+IEFzIHBlciB0aGUgZGlzY3Vzc2lvbiBpbiB2MSwgdGhl
IGNvbW1pdCBtZXNzYWdlIG5lZWRzIHRvIGJlIHJld29yZGVkLg0KPiANCj4gSSB3aWxsIGxv
b2sgYXQgdGhpcyBwYXRjaCBpbiBtb3JlIGRldGFpbHMgb25jZSBJIGhhdmUgcmVhY2hlZCB0
aGUgMm5kIHNlcmllcy4NCg0KSSdsbCB3YWl0IHdpdGggdGhlIHJld29yZGluZyB1bnRpbCB0
aGVuLg0KDQoNCkp1ZXJnZW4NCg==
--------------95dPM5R07imH7r3tCk1Hjnk9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------95dPM5R07imH7r3tCk1Hjnk9--

--------------4fNEaKrbQaeyNiC3QP8pEqpn--

--------------6zV1cawd1gKaGdLLS6m0S5vW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO+fDoFAwAAAAAACgkQsN6d1ii/Ey85
WQf7BFomOGWEfBpKGyU353SMG/DW8NJcbDP8CgVk3bkGErZApUc6V76Tl0mw1Azl3pi67kWNOno/
gWlCVvok1XNvRkGkKvji4A53P2nZqR8LLK2zUAJgnBITjx36afBr06fpvrCFSMV90JQB3dIkkstj
7QoQhGD5sC2vh3+H/5kc3lEyNwpwU7yBNkLau3WL4kcYJ9wQ3KAsCbWNjeQ1pvTfpKwfrF9sJIMu
TIt5zgo0cqidEMoFR0tU+g0rY84QxcJseQjmhJHu32Xf0CpGSGBIFFgiDVW5vP9GKTsQyEkGKYVz
tbgxUU5nHojxlMGZPqe/ANc6KpnL1aSQ+5ZC8RCNRw==
=HGFe
-----END PGP SIGNATURE-----

--------------6zV1cawd1gKaGdLLS6m0S5vW--

