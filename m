Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FE66ED122
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525486.816720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxwm-0003Fc-NI; Mon, 24 Apr 2023 15:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525486.816720; Mon, 24 Apr 2023 15:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxwm-0003CF-KS; Mon, 24 Apr 2023 15:17:44 +0000
Received: by outflank-mailman (input) for mailman id 525486;
 Mon, 24 Apr 2023 15:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ydgZ=AP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pqxwk-000370-GQ
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:17:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 276bb53a-e2b3-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 17:17:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B35F1FD8E;
 Mon, 24 Apr 2023 15:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0919513780;
 Mon, 24 Apr 2023 15:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 54fXAJSdRmQQXwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Apr 2023 15:17:40 +0000
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
X-Inumbo-ID: 276bb53a-e2b3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682349460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oeDhGnn1kXclI1wIeQrChU8SI8SHAgK2tPz5hDl4WdY=;
	b=IcqpwTVZgaW7kCvppuwQvL2yCmXNH+orT7OArRmCRFfl3RPBiAC/RaqGnFpQJarFvMMTKV
	TjZYpBeW8B2u+jcfKo07MUQgNLKKk2Lz4kwf6KmRv0qgt2mz62OUdgqknHB1eFRwRvJbVe
	mTek+PP733C10QVg/qRcsinK7ipn7Kg=
Message-ID: <f1d30ad1-4612-0838-3064-611c5092c686@suse.com>
Date: Mon, 24 Apr 2023 17:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230424143057.27469-1-jgross@suse.com>
 <626da7fb-9934-2a85-0022-90ae32f1a748@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen: add support for crash dump analysis with xen.efi
In-Reply-To: <626da7fb-9934-2a85-0022-90ae32f1a748@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3iLpi9RKgeqAtiKTguyw7X1V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3iLpi9RKgeqAtiKTguyw7X1V
Content-Type: multipart/mixed; boundary="------------840oFkfKRNlKZ8g7au2UWUvU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <f1d30ad1-4612-0838-3064-611c5092c686@suse.com>
Subject: Re: [PATCH v2] xen: add support for crash dump analysis with xen.efi
References: <20230424143057.27469-1-jgross@suse.com>
 <626da7fb-9934-2a85-0022-90ae32f1a748@suse.com>
In-Reply-To: <626da7fb-9934-2a85-0022-90ae32f1a748@suse.com>

--------------840oFkfKRNlKZ8g7au2UWUvU
Content-Type: multipart/mixed; boundary="------------oOcaZk8f080hL8ZMWvrCZF0M"

--------------oOcaZk8f080hL8ZMWvrCZF0M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjMgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wNC4yMDIz
IDE2OjMwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L01h
a2VmaWxlDQo+PiArKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUNCj4+IEBAIC0yMjYsNiAr
MjI2LDkgQEAgZW5kaWYNCj4+ICAgCSAgICAgICQoQEQpLy4kKEBGKS4xci5vICQoQEQpLy4k
KEBGKS4xcy5vICQob3JwaGFuLWhhbmRsaW5nLXkpICQobm90ZV9maWxlX29wdGlvbikgLW8g
JEANCj4+ICAgCSQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQpLyQoQEYpIFwNCj4+ICAg
CQl8ICQob2JqdHJlZSkvdG9vbHMvc3ltYm9scyAtLWFsbC1zeW1ib2xzIC0teGVuc3ltcyAt
LXN5c3YgLS1zb3J0ID4kKEBEKS8kKEBGKS5tYXANCj4+ICtpZmVxICgkKENPTkZJR19ERUJV
R19JTkZPKSx5KQ0KPj4gKwkkKGlmICQoZmlsdGVyIC0tc3RyaXAtZGVidWcsJChFRklfTERG
TEFHUykpLDosJChPQkpDT1BZKSAtTyBlbGY2NC14ODYtNjQgJEAgJEAuZWxmKQ0KPiANCj4g
VGhpcyBvbmx5IGFkZHJlc3NlcyBvbmUgb2YgdGhlIHR3byBlYXJsaWVyIHJhaXNlZCBhc3Bl
Y3RzLCBhcyB5b3UgZGlkbid0DQo+IHVzZSB3aGF0IEkgcHJvcG9zZWQ6DQo+IA0KPiAJJChp
ZiAkKGZpbHRlciAtLXN0cmlwLWRlYnVnLCQoRUZJX0xERkxBR1MpKSw6KSQoT0JKQ09QWSkg
LU8gZWxmNjQteDg2LTY0ICRAICRALmVsZg0KPiANCj4gUXVpdGUgcG9zc2libHkgYmVjYXVz
ZSB0aGVyZSB3YXMgYSBibGFuayBtaXNzaW5nIGluIHRoZXJlLCB0byBzZXBhcmF0ZQ0KPiB0
aGUgY29sb24gZnJvbSAkKE9CSkNPUFkpLiBQcmVmZXJhYmx5IHdpdGggdGhlIGFkanVzdG1l
bnQgKHdoaWNoIEknZA0KPiBiZSBmaW5lIGRvaW5nIHdoaWxlIGNvbW1pdHRpbmcsIGFzIGxv
bmcgYXMgeW91J3JlIG9rYXkpDQoNClRvb2sgc29tZSB0aW1lIHRvIHVuZGVyc3RhbmQgeW91
ciBjb25jZXJuIGhlcmUsIGJ1dCBmaW5hbGx5IEkndmUgZ290IGl0LiA6LSkNCg0KWWVzLCBJ
J20gZmluZSB3aXRoIHRoaXMgY2hhbmdlLg0KDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcy4NCg0KPiBUbyBhbHNvIG1lbnRpb24g
d2hhdCB3ZSBoYXZlIGp1c3QgZGlzY3Vzc2VkOiBTaW5jZSB3ZSdyZSB0YWxraW5nIGFib3V0
DQo+IGR1cGxpY2F0aW5nIG92ZXIgMzBNYiBvZiBkYXRhIChhdCBsZWFzdCBhY2NvcmRpbmcg
dG8gbXkgYnVpbGQpLCBhbg0KPiBvcHRpb24gaXMgZ29pbmcgdG8gYmUgdG8gdGhlbiBzdHJp
cCBkZWJ1ZyBpbmZvIG9mZiBvZiB4ZW4uZWZpIGl0c2VsZiwNCj4gZ2V0dGluZyBpdHMgc2l6
ZSBpbnRvIHJlYXNvbmFibGUgcmFuZ2UgYWdhaW4uDQoNClllcywgdGhpcyB3b3VsZCBzaHJp
bmsgaXQgdG8gYSBsaXR0bGUgYml0IGFib3ZlIDNNQi4NCg0KDQpKdWVyZ2VuDQo=
--------------oOcaZk8f080hL8ZMWvrCZF0M
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------oOcaZk8f080hL8ZMWvrCZF0M--

--------------840oFkfKRNlKZ8g7au2UWUvU--

--------------3iLpi9RKgeqAtiKTguyw7X1V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRGnZMFAwAAAAAACgkQsN6d1ii/Ey8p
Fwf/fO+jm+xZG/5qhWiNzbpasll43J/+C4XAEYgUVSdlGOfW15T/sJXKVgSKcEKfWNuALQWsGeuP
qxF0UXKJEfuJWgaW+6HXEQTTuvdwp0SeVfRjS3inim63m8V2ErC1RwbbXBvGNN/ZFydqZocvTmoA
axr96vtB7YVXxwl4SJWkgaP60QWgYFMIplup7BWJacxafd8yTcJ7KVoTP8AF1ik3eYV07IKInfOM
Ug5f4v19YPCIVq/9S6NoEuB7s3QitBdTSTsQ1UKVmONp8rJ+FYKB6QoPxADu250BN45vbNMTHn+N
cagbvLV7wFk+B4xWerCg6X4ZGGEGVfvthdBdxsfWEA==
=XP59
-----END PGP SIGNATURE-----

--------------3iLpi9RKgeqAtiKTguyw7X1V--

