Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520F4AB935
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 12:00:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266721.460427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1l7-0003Ju-Uj; Mon, 07 Feb 2022 11:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266721.460427; Mon, 07 Feb 2022 11:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1l7-0003HC-RI; Mon, 07 Feb 2022 11:00:37 +0000
Received: by outflank-mailman (input) for mailman id 266721;
 Mon, 07 Feb 2022 11:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nH1l6-0003H6-TL
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 11:00:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d65cf19-8805-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 12:00:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C3F51F37F;
 Mon,  7 Feb 2022 11:00:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5495A13B95;
 Mon,  7 Feb 2022 11:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JcwYE9P7AGJbTwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 11:00:35 +0000
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
X-Inumbo-ID: 2d65cf19-8805-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644231635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Skg+/3yiCn3aEwOF3aD7Xz6Cd0t9r2OO6orxKa1AUks=;
	b=QYNUypcub+itCu6TwFmFvd9BzuPnAm+XZ8TWeUbkr6kSsxDJOBHfaPvt8fMbckO7d1GM11
	JKdbfI8ZODDsv7nEAqruAHmSQm2pneYE45+d4TrGKY7SkN06LC0UZBpyD1ffAgd92NSpGh
	YeBlDr1B9yaIfpsQxYLBJyc/jfScm1c=
Message-ID: <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
Date: Mon, 7 Feb 2022 12:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220207103613.32260-1-jgross@suse.com>
 <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
In-Reply-To: <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kRvLf9500P84AtVUv0H2oPC4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kRvLf9500P84AtVUv0H2oPC4
Content-Type: multipart/mixed; boundary="------------tZCqQVhm4NKIkrAjEnfuBba0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
References: <20220207103613.32260-1-jgross@suse.com>
 <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
In-Reply-To: <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>

--------------tZCqQVhm4NKIkrAjEnfuBba0
Content-Type: multipart/mixed; boundary="------------vQGj0YOBxQIpqJBzwjn3IzG3"

--------------vQGj0YOBxQIpqJBzwjn3IzG3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDIuMjIgMTE6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMi4yMDIy
IDExOjM2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQ29tbWl0IDdjN2Y3ZThmYmEwMSBj
aGFuZ2VkIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCBpbiBhbiBpbmNvbXBhdGlibGUN
Cj4+IHdheS4gVW5mb3J0dW5hdGVseSB0aGUgY2hhbmdlZCBwYXJ0cyB3ZXJlIGFscmVhZHkg
aW4gdXNlIGluIHRoZSBMaW51eA0KPj4ga2VybmVsLCBzbyBhbiB1cGRhdGUgb2YgdGhlIGhl
YWRlciBpbiB0aGUga2VybmVsIHdvdWxkIHJlc3VsdCBpbiBhIGJ1aWxkDQo+PiBicmVha2Fn
ZS4NCj4+DQo+PiBFdmVuIHdoZW4gcmVtb3ZpbmcgaXRzIHVzYWdlIGZyb20gdGhlIGtlcm5l
bCB0aGUgdXNlZCBmbGFnIGJpdCBzaG91bGQgYmUNCj4+IG1hcmtlZCBhcyByZXNlcnZlZCBp
biBvcmRlciB0byBhdm9pZCB0byBnaXZlIGl0IGEgZGlmZmVyZW50IHNlbWFudGljIGluDQo+
PiB0aGUgZnV0dXJlLg0KPj4NCj4+IERvIGEgcGFydGlhbCByZXZlcnQgb2Ygc2FpZCBjb21t
aXQgaW4gb3JkZXIgdG8gZW5hYmxlIHRoZSBrZXJuZWwgdG8gdGFrZQ0KPj4gYW4gdXBkYXRl
ZCB2ZXJzaW9uIG9mIG1lbW9yeS5oLg0KPiANCj4gSSBkb24ndCB0aGluayBpdCBzaG91bGQg
YmUgYSBwYXJ0aWFsIHJldmVydCwgYW5kIGFzIHNhaWQgb24gaXJjIEknbSBvZg0KPiB0aGUg
b3BpbmlvbiB0aGF0IC4uLg0KPiANCj4+IEZpeGVzOiA3YzdmN2U4ZmJhMDEgKCJpbmNsdWRl
L3B1YmxpYy9tZW1vcnkuaDogcmVtb3ZlIHRoZSBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293
bmVkIGZsYWciKQ0KPiANCj4gLi4uIGl0J3MgMGUyZTU0OTY2YWY1IHdoaWNoIHNob3VsZCBo
YXZlIHRha2VuIG1lYXN1cmVzIHRvIHByb3RlY3QNCj4gYWdhaW5zdCByZS11c2Ugb2YgdGhl
IGZsYWcgYXMgYW4gb3V0cHV0Lg0KDQpUaGUgZGVzaWduIG9mIHRoYXQgZmVhdHVyZSB3YXMg
Zmxhd2VkIGZyb20gdGhlIGJlZ2lubmluZywgYXMgaXQgd2FzIHVzZWQNCmluIHRoZSBrZXJu
ZWwgcmlnaHQgYXdheS4gU28gSSB0aGluayB0aGUgaW5pdGlhbCByZXZlcnQgd2FzIHRoZQ0K
ZWZmZWN0aXZlIHN0YXJ0IG9mIHRoZSBwcm9ibGVtLg0KDQo+IA0KPj4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL21lbW9yeS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVt
b3J5LmgNCj4+IEBAIC02NjIsNyArNjYyLDE3IEBAIHN0cnVjdCB4ZW5fbWVtX2FjcXVpcmVf
cmVzb3VyY2Ugew0KPj4gICAgICAgICogdHdvIGNhbGxzLg0KPj4gICAgICAgICovDQo+PiAg
ICAgICB1aW50MzJfdCBucl9mcmFtZXM7DQo+PiAtICAgIHVpbnQzMl90IHBhZDsNCj4+ICsN
Cj4+ICsgICAgLyoNCj4+ICsgICAgICogT1VUIC0gTXVzdCBiZSB6ZXJvIG9uIGVudHJ5LiBP
biByZXR1cm4gdGhpcyBtYXkgY29udGFpbiBhIGJpdHdpc2UNCj4+ICsgICAgICogICAgICAg
T1Igb2YgdGhlIGZvbGxvd2luZyB2YWx1ZXMuDQo+PiArICAgICAqLw0KPj4gKyAgICB1aW50
MzJfdCBmbGFnczsNCj4+ICsNCj4+ICsgICAgLyogTm8gbG9uZ2VyIHN1cHBvcnRlZCAtIHdp
bGwgYmUgbmV2ZXIgc2V0ICovDQo+PiArI2RlZmluZSBfWEVOTUVNX3JzcmNfYWNxX2NhbGxl
cl9vd25lZCAwDQo+PiArI2RlZmluZSBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkICgx
dSA8PCBfWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCkNCj4gDQo+IEkgdGhpbmsgdGhp
cyBnb2VzIHRvbyBmYXI6IE5laXRoZXIgZG8gd2Ugd2FudCB0byByZS1pbnRyb2R1Y2UgdGhl
DQo+ICNkZWZpbmUtcywgbm9yIHNob3VsZCB3ZSByZS1maXggdGhlIHB1cnBvc2Ugb2YgdGhl
IHBhZGRpbmcgZmllbGQNCj4gdG8gYmUgT1VUIChvbmx5KS4gQWxsIHdlIG5lZWQgdG8gbWFr
ZSBzdXJlIGlzIHRoYXQgdGhlIGZpZWxkDQo+IGNvbWluZyBpbiBhcyB6ZXJvIHdvbid0IGdl
dCByZXNwb25kZWQgdG8gYnkgc2V0dGluZyBiaXQgMCBvZiBpdC4NCj4gSW1vIHRoaXMgY2Fu
IG9ubHkgcmVhc29uYWJseSBiZSBkb25lIGJ5IHdheSBvZiBhZGRpbmcgYSBjb21tZW50Lg0K
PiBUaGlzIGNvbW1lbnQgbWF5LCBpbiB0dXJuLCBtZW50aW9uIFhFTk1FTV9yc3JjX2FjcV9j
YWxsZXJfb3duZWQNCj4gb2YgY291cnNlLg0KDQpUaGUga2VybmVsIGNvdWxkIGJlIGNoYW5n
ZWQgdG8gbm8gbG9uZ2VyIHVzZSB0aGF0ICNkZWZpbmUgYmVmb3JlDQp1cGRhdGluZyB0aGUg
aGVhZGVyIGZyb20gWGVuLCBidXQgYXJlIHdlIHJlYWxseSBzdXJlIHRoZXJlIGFyZSBubw0K
b3RoZXIgdXNlcnMsIHRvbz8NCg0KSSdtIGZpbmUgZG9pbmcgaXQgdGhhdCB3YXksIGJ1dCBJ
IHRoaW5rIEkgc2hvdWxkIHNwZWxsIG91dCB0aGUNCmNvbnNlcXVlbmNlcyBvZiB0aGF0IGRl
Y2lzaW9uLg0KDQo+IEJ0dy4sIGlmIHRoZSBmaWVsZCB3YXMgdG8gYmVjb21lIE9VVC1vbmx5
IGFnYWluLCBJIHRoaW5rIHlvdSdkDQo+IGFsc28gbmVlZCB0byByZXZlcnQgdGhlIGNoYW5n
ZSB0byB4ZW4vY29tbW9uL2NvbXBhdC9tZW1vcnkuYy4gQXQNCj4gbGVhc3QgdG8gbm90IGxl
YXZlIGEgdHJhcCBmb3Igc29tZW9uZSB0byBsYXRlciBmYWxsIGludG8uDQoNCk9rYXksIGlm
IHlvdSBsaWtlIHRoYXQgYmV0dGVyLg0KDQoNCkp1ZXJnZW4NCg==
--------------vQGj0YOBxQIpqJBzwjn3IzG3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vQGj0YOBxQIpqJBzwjn3IzG3--

--------------tZCqQVhm4NKIkrAjEnfuBba0--

--------------kRvLf9500P84AtVUv0H2oPC4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIA+9IFAwAAAAAACgkQsN6d1ii/Ey/+
KAf/cejz/uXT10FFCnIp7Z81h8RfqRT8L2yktt5cQOSo1Hh07q0gQDrFRfESu6Pi1Zwofj54i0BU
a/AHcFwjjulBa6l9lMncLM4dLGfNcIsCsbKD1EHAZngCk/R0AGUzWYA+jX3MLfpzYUQAJioWzd/e
YNlx45lE44nYZmNT5fVH/W+RqaEAIR4z0Z1I9Kdk9fGt8QzN0ib5gkvTYRnJoVud7U1bUzHhWWyc
bPuyOgJUR68zoAvwP5O4ajg5sdxT3KHf7JE9M52NR/j5K0FB5Aox2BokKeo2EwBhKWXGaF46+jyH
mdujhnoEh5/n5zarUqQM01zU3tSJozvoIW4ZJ5GtCA==
=BZ0j
-----END PGP SIGNATURE-----

--------------kRvLf9500P84AtVUv0H2oPC4--

