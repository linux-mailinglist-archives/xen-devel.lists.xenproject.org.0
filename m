Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC64BB126
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275077.470782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvZW-0003Yr-9h; Fri, 18 Feb 2022 05:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275077.470782; Fri, 18 Feb 2022 05:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvZW-0003Wi-6D; Fri, 18 Feb 2022 05:12:46 +0000
Received: by outflank-mailman (input) for mailman id 275077;
 Fri, 18 Feb 2022 05:12:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xRNf=TB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKvZU-0003Wc-AN
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:12:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6650e886-9079-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 06:12:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1EE3A2199B;
 Fri, 18 Feb 2022 05:12:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1AD213B7B;
 Fri, 18 Feb 2022 05:12:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nBSAMMkqD2I9CgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Feb 2022 05:12:41 +0000
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
X-Inumbo-ID: 6650e886-9079-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645161162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yv+VO1s/oQPkN+v0bIm76a0uAXqBiz6QaRFYTTbqzeY=;
	b=bwNLuGKvkw6p37X34mligOffFYkFvtUnuquhBC3NNWdwdda8xtNzeoGCTX3kRNh1R7Z6XE
	QeXM0KwJienMwvUW+oizx1LZ0PcXC+T6YFLIdaSbfgqEZMRfw+rGs7aaMpfJt/cb670TAy
	9b7hvMjCa0chFo810aNZx/hOBjP/I4w=
Message-ID: <5f5cabaf-ffd8-264e-ac40-d7c4a6db260f@suse.com>
Date: Fri, 18 Feb 2022 06:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <eea83d0a-a96d-f050-c6ac-7dad731a16f0@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <eea83d0a-a96d-f050-c6ac-7dad731a16f0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YiabZme1b6jFk57APfeLxDaU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YiabZme1b6jFk57APfeLxDaU
Content-Type: multipart/mixed; boundary="------------0Gpr3l5elaSUndAmNfNyshoM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <5f5cabaf-ffd8-264e-ac40-d7c4a6db260f@suse.com>
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <eea83d0a-a96d-f050-c6ac-7dad731a16f0@xen.org>
In-Reply-To: <eea83d0a-a96d-f050-c6ac-7dad731a16f0@xen.org>

--------------0Gpr3l5elaSUndAmNfNyshoM
Content-Type: multipart/mixed; boundary="------------5B0ezaljc0kP6Pjfvzd5OVkw"

--------------5B0ezaljc0kP6Pjfvzd5OVkw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjIgMjA6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxNi8wMi8yMDIyIDA3OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTUuMDIu
MjIgMjI6MTMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMDMvMDIvMjAyMiAxMzoxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gQWRk
IGEgY29tbWVudCB0byBpbmNsdWRlL3B1YmxpYy9ncmFudF90YWJsZS5oIHRoYXQgR05UVEFC
T1BfdHJhbnNmZXINCj4+Pj4gaXMgZGVwcmVjYXRlZCwgaW4gb3JkZXIgdG8gZGlzY291cmFn
ZSBuZXcgdXNlIGNhc2VzLg0KPj4+DQo+Pj4gwqBGcm9tIHRoZSBjb21taXQgbWVzc2FnZSwg
aXQgaXMgdW5jbGVhciB0byBtZSB3aHkgd2UgYXJlIGRpc2NvdXJhZ2luZyANCj4+PiBuZXcg
dXNlIGNhc2VzIGFuZCBpbmRpcmVjdGx5IGVuY291cmFnaW5nIGN1cnJlbnQgdXNlcnMgdG8g
bW92ZSBhd2F5IA0KPj4+IGZyb20gdGhlIGZlYXR1cmUuDQo+Pj4NCj4+PiBQYXRjaCAjMSBz
ZWVtcyB0byBpbXBseSB0aGlzIGlzIGJlY2F1c2UgdGhlIGZlYXR1cmUgaXMgbm90IHByZXNl
bnQgaW4gDQo+Pj4gTGludXggdXBzdHJlYW0uIEJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgaXMg
YSBzdWZmaWNpZW50IHJlYXNvbiB0byANCj4+PiBkZXByZWNhdGUgYSBmZWF0dXJlLg0KPj4+
DQo+Pj4gQSBtb3JlIGNvbXBlbGxpbmcgcmVhc29uIHdvdWxkIGJlIHRoYXQgdGhlIGZlYXR1
cmUgaXMgYnJva2VuIGFuZCB0b28gDQo+Pj4gY29tcGxleCB0byBmaXggaXQuDQo+Pj4NCj4+
PiBTbyBjYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KPj4NCj4+IEl0IGlzIGEgZmVh
dHVyZSBhdmFpbGFibGUgZm9yIFBWIGRvbWFpbnMgb25seSwgYW5kIGl0IGlzIHZlcnkgY29t
cGxleA0KPj4gYW5kIGhhc24ndCBiZWVuIHRlc3RlZCBmb3IgYWdlcy4NCj4gDQo+IFJpZ2h0
LiBUbyByZXBseSB0byBKYW4ncyBlLW1haWwgaGVyZSwgc2hvdWxkbid0IHdlIGFsc28gZGUt
c3VwcG9ydCANCj4gKGVpdGhlciBjb21wbGV0ZWx5IG9yIHNlY3VyaXR5KSBpbiB0aGlzIGNh
c2U/DQo+IA0KPiBNeSBjb25jZXJuIGhlcmUgaXMgeW91IHdyb3RlIHRoaXMgY29kZSBoYXMg
YmVlbiB1bnRlc3RlZCBmb3IgYWdlcyAobm90IA0KPiBjbGVhciBob3cgbG9uZykgYW5kIGNv
bXBsZXguIFNvIHBvdGVudGlhbGx5IHRoaXMgbWVhbnMgdGhlcmUgYXJlIA0KPiBzZWN1cml0
eSBpc3N1ZXMgaW4gaXQuDQoNCkluIGNhc2Ugd2UgYXJlIGRvaW5nIHRoaXMsIHdlIHNob3Vs
ZCBzZXQgdGhlIGRlZmF1bHQgdG8gZGlzYWJsZSB0aGUNCnRyYW5zZmVyIGZ1bmN0aW9uYWxp
dHkuDQoNCg0KSnVlcmdlbg0K
--------------5B0ezaljc0kP6Pjfvzd5OVkw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5B0ezaljc0kP6Pjfvzd5OVkw--

--------------0Gpr3l5elaSUndAmNfNyshoM--

--------------YiabZme1b6jFk57APfeLxDaU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIPKskFAwAAAAAACgkQsN6d1ii/Ey/w
ngf8Ca1Y2773QgQDCIyIhUtqF0Ouf3ZbhXHrF85JwRjxhtyv+tGtOF9tZHdPzRAwjVyVoUcmZt2O
1Gz/AqoO5+NrCBCG3hRrtjxtFcBxoQ5gOE1YCv7aG1Nu9JjxiWOmX/CixDW7AOZrB7md4gKfvfvg
tinGEmSylBWGrYMxt/1ax+e4HaCOzBp6rPNgYYQemzbKqtspq0WwbYnka9zBkXK2TdAAMaDaap/H
DRkRoin2ZyOjlXkmry8BJ/2cj5OkV5Vx2T6Pdd+sFioqhGbSeVLRpJ+hB8iao4x2PeUWQMNTO9lL
0i3ddiIBOXJAregLH80Pev1vapEz3t9ZV6KX4mtKcw==
=8c5+
-----END PGP SIGNATURE-----

--------------YiabZme1b6jFk57APfeLxDaU--

