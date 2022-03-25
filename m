Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606064E71FF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 12:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294668.501136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhmc-0003Og-9K; Fri, 25 Mar 2022 11:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294668.501136; Fri, 25 Mar 2022 11:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhmc-0003Mn-6A; Fri, 25 Mar 2022 11:07:06 +0000
Received: by outflank-mailman (input) for mailman id 294668;
 Fri, 25 Mar 2022 11:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hlgX=UE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXhmb-0003Mh-DC
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 11:07:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b39d2c4f-ac2b-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 12:07:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C0F81F38D;
 Fri, 25 Mar 2022 11:07:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B6AE1332D;
 Fri, 25 Mar 2022 11:07:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hGq8DFeiPWIcMgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Mar 2022 11:07:03 +0000
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
X-Inumbo-ID: b39d2c4f-ac2b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648206423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6dlQyIm7e45K6hZyNwbiQdtlzsub6YFFyMnNbfLv4OY=;
	b=He/o7GejqjVLVUFZxtd1FdK0Dz0DmhC5Yw0P7b0sK1bMY3Y+Z9gBr2OCZWIn1gdDjDNDD0
	X9cPwBghRbBoFPQonhDHgsBAyWYZ5xCKI1c0EFAFE2KCTqO1MRlAi4QIVCv6bnOQy4R7YQ
	sW3fIF2UPy7ECMTUId+648F/Uh6HFq8=
Message-ID: <edb66fd3-cf2f-0780-145a-953936e59beb@suse.com>
Date: Fri, 25 Mar 2022 12:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] xen: don't hang when resuming PCI device
Content-Language: en-US
To: =?UTF-8?B?SmFrdWIgS8SFZHppb8WCa2E=?= <niedzejkob@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org
Cc: marmarek@invisiblethingslab.com
References: <20220323012103.2537-1-niedzejkob@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220323012103.2537-1-niedzejkob@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------volcTpjXkFt6gV3L8XUSIXdD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------volcTpjXkFt6gV3L8XUSIXdD
Content-Type: multipart/mixed; boundary="------------e6ya7KAFsFXbgUSIlzA2g2W7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?B?SmFrdWIgS8SFZHppb8WCa2E=?= <niedzejkob@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org
Cc: marmarek@invisiblethingslab.com
Message-ID: <edb66fd3-cf2f-0780-145a-953936e59beb@suse.com>
Subject: Re: [PATCH] xen: don't hang when resuming PCI device
References: <20220323012103.2537-1-niedzejkob@invisiblethingslab.com>
In-Reply-To: <20220323012103.2537-1-niedzejkob@invisiblethingslab.com>

--------------e6ya7KAFsFXbgUSIlzA2g2W7
Content-Type: multipart/mixed; boundary="------------cS18eG8fIhED6cPUakhnN6jb"

--------------cS18eG8fIhED6cPUakhnN6jb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjIgMDI6MjEsIEpha3ViIEvEhWR6aW/FgmthIHdyb3RlOg0KPiBJZiBhIHhl
biBkb21haW4gd2l0aCBhdCBsZWFzdCB0d28gVkNQVXMgaGFzIGEgUENJIGRldmljZSBhdHRh
Y2hlZCB3aGljaA0KPiBlbnRlcnMgdGhlIEQzaG90IHN0YXRlIGR1cmluZyBzdXNwZW5kLCB0
aGUga2VybmVsIG1heSBoYW5nIHdoaWxlDQo+IHJlc3VtaW5nLCBkZXBlbmRpbmcgb24gdGhl
IGNvcmUgb24gd2hpY2ggYW4gYXN5bmMgcmVzdW1lIHRhc2sgZ2V0cw0KPiBzY2hlZHVsZWQu
DQo+IA0KPiBUaGUgYnVnIG9jY3VycyBiZWNhdXNlIHhlbidzIGRvX3N1c3BlbmQgY2FsbHMg
ZHBtX3Jlc3VtZV9zdGFydCB3aGlsZQ0KPiBvbmx5IHRoZSB0aW1lciBvZiB0aGUgYm9vdCBD
UFUgaGFzIGJlZW4gcmVzdW1lZCAod2hlbiB4ZW5fc3VzcGVuZCBjYWxsZWQNCj4gc3lzY29y
ZV9yZXN1bWUpLCBiZWZvcmUgY2FsbGluZyB4ZW5fYXJjaF9zdXNwZW5kIHRvIHJlc3VtZSB0
aGUgdGltZXJzIG9mDQo+IHRoZSBvdGhlciBDUFVzLiBUaGlzIGJyZWFrcyBwY2lfZGV2X2Qz
X3NsZWVwLg0KPiANCj4gVGh1cyB0aGlzIHBhdGNoIG1vdmVzIHRoZSBjYWxsIHRvIHhlbl9h
cmNoX3Jlc3VtZSBiZWZvcmUgdGhlIGNhbGwgdG8NCj4gZHBtX3Jlc3VtZV9zdGFydCwgZWxp
bWluYXRpbmcgdGhlIGhhbmdzIGFuZCByZXN0b3JpbmcgdGhlIHN0YWNrLWxpa2UNCj4gc3Ry
dWN0dXJlIG9mIHRoZSBzdXNwZW5kL3Jlc3RvcmUgcHJvY2VkdXJlLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmFrdWIgS8SFZHppb8WCa2EgPG5pZWR6ZWprb2JAaW52aXNpYmxldGhpbmdz
bGFiLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------cS18eG8fIhED6cPUakhnN6jb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cS18eG8fIhED6cPUakhnN6jb--

--------------e6ya7KAFsFXbgUSIlzA2g2W7--

--------------volcTpjXkFt6gV3L8XUSIXdD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI9olYFAwAAAAAACgkQsN6d1ii/Ey82
MwgAgY498LKBIzA2iVodDE36CWaBs9UKjV8V2MLhRqduZrtbsh22DtJ6IxlYqPWwqv0oDvvB0OJZ
TBp8H9ePSOxwJsGqzKwsVoZD7G585xsnVFihwd4NBsircO9pyuifwKE0Cm66U/wU8A2AhMs3Oox/
SMtg37sLk8tCzIe2YL1f67QXHgw9GYOZq+uNTYAnh9FSCy9d+yXAEmxLaIj/pz6QQ9TM74p0aTTO
yQwVpknmaCDTEWpa+3orzu4sT+YFTE1bzTntxQ2gWjdjuMBoGiaDM5DuY1+r9B+NY4/uqfP97VQa
mYajPBurHjZXIXtwv5UcZl8ohzO+syb59eYIeOHQIw==
=fyGN
-----END PGP SIGNATURE-----

--------------volcTpjXkFt6gV3L8XUSIXdD--

