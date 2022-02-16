Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D894B8146
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 08:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273726.468990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKEbg-0001LX-6x; Wed, 16 Feb 2022 07:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273726.468990; Wed, 16 Feb 2022 07:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKEbg-0001JM-3p; Wed, 16 Feb 2022 07:20:08 +0000
Received: by outflank-mailman (input) for mailman id 273726;
 Wed, 16 Feb 2022 07:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKEbf-00016r-3l
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 07:20:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc42f55c-8ef8-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 08:20:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3445D21AAA;
 Wed, 16 Feb 2022 07:20:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E202E13A3E;
 Wed, 16 Feb 2022 07:20:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oGbKNaOlDGLbMgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 07:20:03 +0000
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
X-Inumbo-ID: dc42f55c-8ef8-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644996004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nt7cWVPdUojteZJh+gHuHKAmBNIpZtgkn1nMxbEFJhM=;
	b=MRAQsyxenNevOlHq2f+Dsv/lpc/LO69zxo1g2ABFZb0Ymf7l0p4rQq5J3V8u9j2ZYNlU9C
	GBFHwE9C45Dj3I/RAcYVQWeY+fNFj3wwu4u/NWIBBFL+4IaHaqnkVrRFG0KD4V/OMsLp0F
	gxslfjUjY7/fTjmBMfi33Eoxf3xgVJ8=
Message-ID: <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
Date: Wed, 16 Feb 2022 08:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
In-Reply-To: <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------na0xiobBbkUvB16Pdkzxbvn4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------na0xiobBbkUvB16Pdkzxbvn4
Content-Type: multipart/mixed; boundary="------------fsTSIEG3ELjRbYEaQCEaLa8L";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
In-Reply-To: <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>

--------------fsTSIEG3ELjRbYEaQCEaLa8L
Content-Type: multipart/mixed; boundary="------------p7ZB42jg10JtIExq60qthzus"

--------------p7ZB42jg10JtIExq60qthzus
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMjI6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAzLzAyLzIwMjIgMTM6MTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgYSBjb21tZW50IHRvIGluY2x1ZGUvcHVibGljL2dyYW50X3RhYmxlLmggdGhhdCBHTlRU
QUJPUF90cmFuc2Zlcg0KPj4gaXMgZGVwcmVjYXRlZCwgaW4gb3JkZXIgdG8gZGlzY291cmFn
ZSBuZXcgdXNlIGNhc2VzLg0KPiANCj4gIEZyb20gdGhlIGNvbW1pdCBtZXNzYWdlLCBpdCBp
cyB1bmNsZWFyIHRvIG1lIHdoeSB3ZSBhcmUgZGlzY291cmFnaW5nIA0KPiBuZXcgdXNlIGNh
c2VzIGFuZCBpbmRpcmVjdGx5IGVuY291cmFnaW5nIGN1cnJlbnQgdXNlcnMgdG8gbW92ZSBh
d2F5IGZyb20gDQo+IHRoZSBmZWF0dXJlLg0KPiANCj4gUGF0Y2ggIzEgc2VlbXMgdG8gaW1w
bHkgdGhpcyBpcyBiZWNhdXNlIHRoZSBmZWF0dXJlIGlzIG5vdCBwcmVzZW50IGluIA0KPiBM
aW51eCB1cHN0cmVhbS4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHN1ZmZpY2llbnQg
cmVhc29uIHRvIA0KPiBkZXByZWNhdGUgYSBmZWF0dXJlLg0KPiANCj4gQSBtb3JlIGNvbXBl
bGxpbmcgcmVhc29uIHdvdWxkIGJlIHRoYXQgdGhlIGZlYXR1cmUgaXMgYnJva2VuIGFuZCB0
b28gDQo+IGNvbXBsZXggdG8gZml4IGl0Lg0KPiANCj4gU28gY2FuIHlvdSBwcm92aWRlIG1v
cmUgZGV0YWlscz8NCg0KSXQgaXMgYSBmZWF0dXJlIGF2YWlsYWJsZSBmb3IgUFYgZG9tYWlu
cyBvbmx5LCBhbmQgaXQgaXMgdmVyeSBjb21wbGV4DQphbmQgaGFzbid0IGJlZW4gdGVzdGVk
IGZvciBhZ2VzLg0KDQo+IEFzIGEgc2lkZSBub3RlLCBzaG91bGQgd2UgYWxzbyB1cGRhdGUg
U1VQUE9SVC5tZD8NCg0KR29vZCBxdWVzdGlvbi4NCg0KDQpKdWVyZ2VuDQo=
--------------p7ZB42jg10JtIExq60qthzus
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------p7ZB42jg10JtIExq60qthzus--

--------------fsTSIEG3ELjRbYEaQCEaLa8L--

--------------na0xiobBbkUvB16Pdkzxbvn4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIMpaMFAwAAAAAACgkQsN6d1ii/Ey+7
Zwf/XN7Jf9PcOHkQ6+ZQGNwecat3Ud+TAf4D4wehDpsSdOuuE5lmvjVPpHTiGBL9W0SK/sUnt94e
w/Y+WbEaWd8iT19S6Z1Dc2RNa9RUYiqNrNptHzJrFyvHNHJuj4QdxAweFNhEplH+w4dpjgMg5XS4
HAO2F7EmB8p55COTNTw83tX+f1wzc5zmCiE1hseIwRu8yQy27DwrLN7/hcFfuRILwuFfAcUEQ8l8
+MS0Mm4YS0NoR/Kz0iIJ84Or7cOZvE7gKtvpIlBn+zMkhZR2eaYjhczififp1Zl9ttwlrD8aZzIN
99JuigUoLL3ilDZG22E8z5oHW4SsfWC0aeZUBJtivA==
=HBT1
-----END PGP SIGNATURE-----

--------------na0xiobBbkUvB16Pdkzxbvn4--

