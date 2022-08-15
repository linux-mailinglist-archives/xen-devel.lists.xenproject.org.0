Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B1592E8C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387343.623537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYhB-00049R-Hv; Mon, 15 Aug 2022 11:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387343.623537; Mon, 15 Aug 2022 11:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYhB-00046j-FG; Mon, 15 Aug 2022 11:55:49 +0000
Received: by outflank-mailman (input) for mailman id 387343;
 Mon, 15 Aug 2022 11:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNYh9-00046d-Ib
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:55:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328765ae-1c91-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:55:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E051835332;
 Mon, 15 Aug 2022 11:55:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B581813A93;
 Mon, 15 Aug 2022 11:55:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5a8cKkE0+mJVHQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 11:55:45 +0000
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
X-Inumbo-ID: 328765ae-1c91-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660564545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf7gx5Gib6EhxOOUMsx/oDMboLEQOrpNW9+B1A2Rnqs=;
	b=DXGpFZP/ksvx/u4YTQ4IWPVez6ntBvP/jjdYKnjhAnKkSJ/A003PRiyTSrIRE1yxHL0a9Q
	bnvfo0DcUfIfL18sIMG/VIfwB4YUNzLjfUPAzQenZpk+KYBpbKKcAtpF5w+dOERyCP4Zob
	MrAjgiQyIkrW20z95uchCgkbHT4aGy0=
Message-ID: <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
Date: Mon, 15 Aug 2022 13:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LiECz5IL402EVV0sZab1bEdL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LiECz5IL402EVV0sZab1bEdL
Content-Type: multipart/mixed; boundary="------------lkjkH00VmskvY0pf0RPgQZT8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <3366d1e0-84dd-15af-417d-dd3633a09f4b@suse.com>
Subject: Re: [PATCH v2 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-3-jgross@suse.com>
 <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>
In-Reply-To: <3c4fa2e0-1b68-6206-e2cb-b85b2cb790f9@suse.com>

--------------lkjkH00VmskvY0pf0RPgQZT8
Content-Type: multipart/mixed; boundary="------------EJGex0I7DteI6I07vmGUrU9N"

--------------EJGex0I7DteI6I07vmGUrU9N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTM6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDIy
IDEzOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtMzIz
Nyw2ICszMjM3LDY1IEBAIG91dDoNCj4+ICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH0NCj4+
ICAgDQo+PiArc3RhdGljIHN0cnVjdCBjcHVfcm1fZGF0YSAqc2NoZWR1bGVfY3B1X3JtX2Fs
bG9jKHVuc2lnbmVkIGludCBjcHUpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgY3B1X3JtX2Rh
dGEgKmRhdGE7DQo+PiArICAgIGNvbnN0IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc3I7DQo+
PiArICAgIHVuc2lnbmVkIGludCBpZHg7DQo+PiArDQo+PiArICAgIHJjdV9yZWFkX2xvY2so
JnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+ICsNCj4+ICsgICAgc3IgPSBnZXRfc2NoZWRfcmVz
KGNwdSk7DQo+PiArICAgIGRhdGEgPSB4bWFsbG9jX2ZsZXhfc3RydWN0KHN0cnVjdCBjcHVf
cm1fZGF0YSwgc3IsIHNyLT5ncmFudWxhcml0eSAtIDEpOw0KPj4gKyAgICBpZiAoICFkYXRh
ICkNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKw0KPj4gKyAgICBkYXRhLT5vbGRfb3Bz
ID0gc3ItPnNjaGVkdWxlcjsNCj4+ICsgICAgZGF0YS0+dnByaXZfb2xkID0gaWRsZV92Y3B1
W2NwdV0tPnNjaGVkX3VuaXQtPnByaXY7DQo+PiArICAgIGRhdGEtPnBwcml2X29sZCA9IHNy
LT5zY2hlZF9wcml2Ow0KPiANCj4gUmVwZWF0aW5nIGEgdjEgY29tbWVudDoNCj4gDQo+ICJB
dCBsZWFzdCBmcm9tIGFuIGFic3RyYWN0IHBlcnNwZWN0aXZlLCBkb2Vzbid0IHJlYWRpbmcg
ZmllbGRzIGZyb20NCj4gICBzciByZXF1aXJlIHRoZSBSQ1UgbG9jayB0byBiZSBoZWxkIGNv
bnRpbnVvdXNseSAoaS5lLiBub3QgZHJvcHBpbmcNCj4gICBpdCBhdCB0aGUgZW5kIG9mIHRo
aXMgZnVuY3Rpb24gYW5kIHJlLWFjcXVpcmluZyBpdCBpbiB0aGUgY2FsbGVyKT8iDQo+IA0K
PiBJbml0aWFsbHkgSSB0aG91Z2h0IHlvdSBkaWQgcmVzcG9uZCB0byB0aGlzIGluIHNvbWUg
d2F5LCBidXQgd2hlbg0KPiBsb29raW5nIGZvciBhIG1hdGNoaW5nIHJlcGx5IEkgY291bGRu
J3QgZmluZCBvbmUuDQoNCk9oLCBzb3JyeS4NCg0KVGhlIFJDVSBsb2NrIGlzIHByb3RlY3Rp
bmcgb25seSB0aGUgc3IsIG5vdCBhbnkgZGF0YSBwb2ludGVycyBpbiB0aGUgc3INCmFyZSBy
ZWZlcmVuY2luZy4gU28gaXQgaXMgZmluZSB0byBkcm9wIHRoZSBSQ1UgbG9jayBhZnRlciBy
ZWFkaW5nIHNvbWUNCm9mIHRoZSBmaWVsZHMgZnJvbSB0aGUgc3IgYW5kIHN0b3JpbmcgaXQg
aW4gdGhlIGNwdV9ybV9kYXRhIG1lbW9yeS4NCg0KDQpKdWVyZ2VuDQo=
--------------EJGex0I7DteI6I07vmGUrU9N
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------EJGex0I7DteI6I07vmGUrU9N--

--------------lkjkH00VmskvY0pf0RPgQZT8--

--------------LiECz5IL402EVV0sZab1bEdL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6NEEFAwAAAAAACgkQsN6d1ii/Ey+I
GAgAkiLoJAiJR/0oGuh4BB9ctop45FToqdXfBGxkjKwUS/35oFaz4q7z6wgCVBqEpzafNsH+AVjl
kNpRyFEmRUxI3TfsN+RryN6izuR7hlvpwNjjB5Q5Uk/BD0f7tfhtqKwFeKo7hrNjWxfnvt2xBo1V
pz8TAiyqA5HvUu6t7zF8JIehGj9oulD9jaPk1bkLNZDDCpHFIJZaOxGZeDWQOdcuazo2ZdetUP0O
Q/KzSG4worNHxnbxXl9XozD4pY/nXFDYB300GuBdDC9oXHN/GsJ+GT9FpA67eTTBNSmLhtSJyQq4
px51dqfHw6Z7TVZCGTvYOnnRuGO6kIEeiA3ICKh3xA==
=xrG/
-----END PGP SIGNATURE-----

--------------LiECz5IL402EVV0sZab1bEdL--

