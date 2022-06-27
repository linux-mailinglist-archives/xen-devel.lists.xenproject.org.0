Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283D455B936
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356451.584687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mAe-0007Cq-NI; Mon, 27 Jun 2022 10:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356451.584687; Mon, 27 Jun 2022 10:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mAe-0007B4-KU; Mon, 27 Jun 2022 10:40:44 +0000
Received: by outflank-mailman (input) for mailman id 356451;
 Mon, 27 Jun 2022 10:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5mAd-0007Ay-HD
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:40:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97bbad31-f605-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 12:40:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07BD01FD86;
 Mon, 27 Jun 2022 10:40:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB4DE13AB2;
 Mon, 27 Jun 2022 10:40:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EzVUKCmJuWItTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 10:40:41 +0000
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
X-Inumbo-ID: 97bbad31-f605-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656326442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8MassX0m7CsOVuBuiF1VcGlLshhuv0mVzAeXp8jA6iI=;
	b=hCIptcD/dj6y+Ld2jpc1HXbqw3n5bbw/z8CasbNHOQUx7P11C6t8DsTW7MjFbD30fae+yU
	IH5VRbNWAUNfxAL62/a414JEFUFXwlM/fJOIh/3KBIXQd9OqhQyDeZJuAmndCRncmQ6isr
	I8hnsqWZsa0lFjx2D681DmVsY/a7ar4=
Message-ID: <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
Date: Mon, 27 Jun 2022 12:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com> <YrmGQj/W7KTzJ1vo@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YrmGQj/W7KTzJ1vo@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EuhcmWRLt50hY3I2ZO4IFZsx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EuhcmWRLt50hY3I2ZO4IFZsx
Content-Type: multipart/mixed; boundary="------------8IeYO9RI9Ugt00Cokb3WO5Hh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
Message-ID: <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com> <YrmGQj/W7KTzJ1vo@Air-de-Roger>
In-Reply-To: <YrmGQj/W7KTzJ1vo@Air-de-Roger>

--------------8IeYO9RI9Ugt00Cokb3WO5Hh
Content-Type: multipart/mixed; boundary="------------16tBs4D94Yj7Q1NDYlibgcCH"

--------------16tBs4D94Yj7Q1NDYlibgcCH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTI6MjgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFRodSwg
TWFyIDI0LCAyMDIyIGF0IDAzOjAxOjMxUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+PiBUaGUgZW50cnkgcG9pbnQgdXNlZCBmb3IgdGhlIHZjcHVfb3AgaHlwZXJjYWxsIG9u
IEFybSBpcyBkaWZmZXJlbnQNCj4+IGZyb20gdGhlIG9uZSBvbiB4ODYgdG9kYXksIGFzIHNv
bWUgb2YgdGhlIGNvbW1vbiBzdWItb3BzIGFyZSBub3QNCj4+IHN1cHBvcnRlZCBvbiBBcm0u
IFRoZSBBcm0gc3BlY2lmaWMgaGFuZGxlciBmaWx0ZXJzIG91dCB0aGUgbm90DQo+PiBzdXBw
b3J0ZWQgc3ViLW9wcyBhbmQgdGhlbiBjYWxscyB0aGUgY29tbW9uIGhhbmRsZXIuIFRoaXMg
bGVhZHMgdG8gdGhlDQo+PiB3ZWlyZCBjYWxsIGhpZXJhcmNoeToNCj4+DQo+PiAgICBkb19h
cm1fdmNwdV9vcCgpDQo+PiAgICAgIGRvX3ZjcHVfb3AoKQ0KPj4gICAgICAgIGFyY2hfZG9f
dmNwdV9vcCgpDQo+Pg0KPj4gQ2xlYW4gdGhpcyB1cCBieSByZW5hbWluZyBkb192Y3B1X29w
KCkgdG8gY29tbW9uX3ZjcHVfb3AoKSBhbmQNCj4+IGFyY2hfZG9fdmNwdV9vcCgpIGluIGVh
Y2ggYXJjaGl0ZWN0dXJlIHRvIGRvX3ZjcHVfb3AoKS4gVGhpcyB3YXkgb25lDQo+PiBvZiBh
Ym92ZSBjYWxscyBjYW4gYmUgYXZvaWRlZCB3aXRob3V0IHJlc3RyaWN0aW5nIGFueSBwb3Rl
bnRpYWwNCj4+IGZ1dHVyZSB1c2Ugb2YgY29tbW9uIHN1Yi1vcHMgZm9yIEFybS4NCj4gDQo+
IFdvdWxkbid0IGl0IGJlIG1vcmUgbmF0dXJhbCB0byBoYXZlIGRvX3ZjcHVfb3AoKSBjb250
YWluIHRoZSBjb21tb24NCj4gY29kZSAoQUZBSUNUIGhhbmRsZXJzIGZvcg0KPiBWQ1BVT1Bf
cmVnaXN0ZXJfe3ZjcHVfaW5mbyxydW5zdGF0ZV9tZW1vcnlfYXJlYX0pIGFuZCB0aGVuIGV2
ZXJ5dGhpbmcNCj4gZWxzZSBoYW5kbGVkIGJ5IHRoZSB4ODYgYXJjaF9kb192Y3B1X29wKCkg
aGFuZGxlcj8NCj4gDQo+IEkgZmluZCB0aGUgY29tbW9uIHByZWZpeCBtaXNsZWFkaW5nLCBh
cyBub3QgYWxsIHRoZSBWQ1BVT1AgaHlwZXJjYWxscw0KPiBhcmUgYXZhaWxhYmxlIHRvIGFs
bCB0aGUgYXJjaGl0ZWN0dXJlcy4NCg0KVGhpcyB3b3VsZCBlbmQgdXAgaW4gQXJtIHN1ZGRl
bmx5IHN1cHBvcnRpbmcgdGhlIHN1Yi1vcHMgaXQgZG9lc24ndA0KKHdhbnQgdG8pIHN1cHBv
cnQgdG9kYXkuIE90aGVyd2lzZSBpdCB3b3VsZCBtYWtlIG5vIHNlbnNlIHRoYXQgQXJtIGhh
cw0KYSBkZWRpY2F0ZWQgZW50cnkgZm9yIHRoaXMgaHlwZXJjYWxsLg0KDQpUaGUgImNvbW1v
biIganVzdCB3YW50cyB0byBleHByZXNzIHRoYXQgdGhlIGNvZGUgaXMgY29tbW9uLiBJJ20g
b3Blbg0KZm9yIGEgYmV0dGVyIHN1Z2dlc3Rpb24sIHRob3VnaC4gOi0pDQoNCg0KSnVlcmdl
bg0K
--------------16tBs4D94Yj7Q1NDYlibgcCH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------16tBs4D94Yj7Q1NDYlibgcCH--

--------------8IeYO9RI9Ugt00Cokb3WO5Hh--

--------------EuhcmWRLt50hY3I2ZO4IFZsx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5iSkFAwAAAAAACgkQsN6d1ii/Ey8f
zAf8Chm6si0OG68QQsYyLisso804agOB3dnlW9kT/3ahToFvv967fRJH8otYCx6DOTqd33z9jugA
TlWxs4JQrwYvJQfU8eCBV85mNii26mvAdW0PlR6+BFz0VWPKsxb1oEKrSNsrSDDiz1yuNOx06MEy
IiiWDVvt+x9fVxwq7FSRmPD81nySzuV1lN9ZjBMUTjHOkuK5YJ5+sSocU9I98cYub/D/sBfNiq01
ob/SDKJrpV2MCVB4DKrb8IywB4rb8suvckUy+Ar9J82rMF9o3BOdJl6SsQWbmB7bM1zh/ygdeWjI
l0JaX5/SHdKFPU0hevVXUhcUSW8gB5yumN63PxP8ag==
=USkM
-----END PGP SIGNATURE-----

--------------EuhcmWRLt50hY3I2ZO4IFZsx--

