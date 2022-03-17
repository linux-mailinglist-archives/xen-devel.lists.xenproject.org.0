Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE064DC4A2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291521.494830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo9u-00039h-4N; Thu, 17 Mar 2022 11:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291521.494830; Thu, 17 Mar 2022 11:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUo9u-00037s-0J; Thu, 17 Mar 2022 11:19:10 +0000
Received: by outflank-mailman (input) for mailman id 291521;
 Thu, 17 Mar 2022 11:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUo9t-00037m-93
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:19:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fa759dd-a5e4-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 12:19:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 489F01F37F;
 Thu, 17 Mar 2022 11:19:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 116AC13B64;
 Thu, 17 Mar 2022 11:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KujoAisZM2IIVAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Mar 2022 11:19:07 +0000
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
X-Inumbo-ID: 0fa759dd-a5e4-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647515947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hf3YvDsM8y4rJIHtjqabUoNn1TDOsD0P6XbiXly5l0=;
	b=HdaXrAmJ3YBjAozdnT9LcaMfZuHDZ/LsSieeJrA0qP9hTh8ih0xLXZPjth/Ce/KtGhXwwI
	ekhOKPgyje/f7O7iCh69ATDKJ3MF4oi1qYaF473rRfqJ6VnRdKdmiUsz9yQTb10WiqnmcR
	qRX2xDpQgoRf0e4y4GmotIvtUacFZww=
Message-ID: <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
Date: Thu, 17 Mar 2022 12:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
 <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
In-Reply-To: <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FBTpDqvqHHZ62Oa0jXHMahzp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FBTpDqvqHHZ62Oa0jXHMahzp
Content-Type: multipart/mixed; boundary="------------JTXY1MT0IBpDThzH7LRO8Zur";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
 <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
In-Reply-To: <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>

--------------JTXY1MT0IBpDThzH7LRO8Zur
Content-Type: multipart/mixed; boundary="------------WWXY5iwiwynehFLHOAXBUCCL"

--------------WWXY5iwiwynehFLHOAXBUCCL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjIgMTI6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE2LzAzLzIwMjIgMTY6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgZG9jdW1lbnRhdGlvbiBmb3IgdHdvIG5ldyBYZW5zdG9yZSB3aXJlIGNvbW1hbmRzIFNF
VF9GRUFUVVJFIGFuZA0KPj4gR0VUX0ZFQVRVUkUgdXNlZCB0byBzZXQgb3IgcXVlcnkgdGhl
IFhlbnN0b3JlIGZlYXR1cmVzIHZpc2libGUgaW4gdGhlDQo+PiByaW5nIHBhZ2Ugb2YgYSBn
aXZlbiBkb21haW4uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiDCoCBkb2NzL21pc2MveGVuc3RvcmUtcmluZy50
eHQgfMKgIDEgKw0KPj4gwqAgZG9jcy9taXNjL3hlbnN0b3JlLnR4dMKgwqDCoMKgwqAgfCAx
MiArKysrKysrKysrKysNCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuc3RvcmUtcmluZy50eHQgYi9k
b2NzL21pc2MveGVuc3RvcmUtcmluZy50eHQNCj4+IGluZGV4IGY5MWFjY2I1YjAuLmJkMDAw
ZjY5NGUgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21pc2MveGVuc3RvcmUtcmluZy50eHQNCj4+
ICsrKyBiL2RvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dA0KPj4gQEAgLTY4LDYgKzY4LDcg
QEAgTWFza8KgwqDCoCBEZXNjcmlwdGlvbg0KPiANCj4gSSBmaW5kIGEgYml0IG9kZCB3ZSBk
ZXNjcmliZSB0aGUgZmVhdHVyZSBpbiB0ZXJtIG9mIG1hc2sgcmF0aGVyIGJpdC4gVGhpcyB3
aWxsIA0KPiBnZXQgbW9yZSBkaWZmaWN1bHQgdG8gcmVhZCBhcyB3ZSBhZGQgbW9yZSBiaXRz
Lg0KDQpNYXliZSB0aGlzIGlzIGluIG9yZGVyIHRvIGF2b2lkIGJpZy9saXR0bGUgZW5kaWFu
IGlzc3VlcyAod2hpY2ggYml0IGlzDQpiaXQgMD8pDQoNCj4gDQo+IFRoaXMgaXMgbm90IG5l
dywgc28gbm90IGNoYW5nZSBleHBlY3RlZCBpbiB0aGlzIHNlcmllcy4NCj4gDQo+PiDCoCAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4gwqAgMcKgwqDCoMKgwqDCoCBSaW5nIHJlY29ubmVjdGlvbiAoc2Vl
IHRoZSByaW5nIHJlY29ubmVjdGlvbiBmZWF0dXJlIGJlbG93KQ0KPj4gwqAgMsKgwqDCoMKg
wqDCoCBDb25uZWN0aW9uIGVycm9yIGluZGljYXRvciAoc2VlIGNvbm5lY3Rpb24gZXJyb3Ig
ZmVhdHVyZSBiZWxvdykNCj4+ICs0wqDCoMKgwqDCoMKgIEdFVF9GRUFUVVJFIGFuZCBTRVRf
RkVBVFVSRSBYZW5zdG9yZSB3aXJlIGNvbW1hbmRzIGFyZSBhdmFpbGFibGUNCj4gDQo+IEJl
bG93LCB5b3Ugd3JvdGUgdGhlIHR3byBjb21tYW5kcyBhcmUgZG9tMCBvbmx5LiBGdXJ0aGVy
bW9yZSwgSSB3b3VsZCBleHBlY3QgDQo+IHN1Y2ggY29tbWVudCByZXR1cm4gc29tZXRoaW5n
IGxpa2UgRU5PU1lTIGlmIHRoZXkgYXJlIG5vdCBwcmVzZW50Lg0KPiANCj4gU28gZG8gd2Ug
cmVhbGx5IG5lZWQgdG8gYWRkIGEgZmVhdHVyZSBiaXQgZm9yIEdFVF9GRUFUVVJFL1NFVF9G
RUFUVVJFPw0KDQpHb29kIHF1ZXN0aW9uLiBJJ2QgYmUgZmluZSB0byBkcm9wIGl0Lg0KDQo+
IA0KPj4gwqAgVGhlICJDb25uZWN0aW9uIHN0YXRlIiBmaWVsZCBpcyB1c2VkIHRvIHJlcXVl
c3QgYSByaW5nIGNsb3NlIGFuZCByZWNvbm5lY3QuDQo+PiDCoCBUaGUgIkNvbm5lY3Rpb24g
c3RhdGUiIGZpZWxkIG9ubHkgY29udGFpbnMgdmFsaWQgZGF0YSBpZiB0aGUgc2VydmVyIGhh
cw0KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2Mv
eGVuc3RvcmUudHh0DQo+PiBpbmRleCBlYTNkOGJlMTc3Li4zMWUzZDUzYzUyIDEwMDY0NA0K
Pj4gLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4gKysrIGIvZG9jcy9taXNjL3hl
bnN0b3JlLnR4dA0KPj4gQEAgLTMzMiw2ICszMzIsMTggQEAgU0VUX1RBUkdFVMKgwqDCoMKg
wqDCoMKgIDxkb21pZD58PHRkb21pZD58DQo+PiDCoMKgwqDCoMKgIHhlbnN0b3JlZCBwcmV2
ZW50cyB0aGUgdXNlIG9mIFNFVF9UQVJHRVQgb3RoZXIgdGhhbiBieSBkb20wLg0KPj4gK0dF
VF9GRUFUVVJFwqDCoMKgwqDCoMKgwqAgPGRvbWlkPnzCoMKgwqDCoMKgwqDCoCA8dmFsdWU+
fA0KPiANCj4gRGlkIHlvdSBpbmRlbnRlZCB0byBhZGQgbWFueSBzcGFjZXMgYmVmb3JlIDx2
YWx1ZT4/DQo+IA0KPj4gK1NFVF9GRUFUVVJFwqDCoMKgwqDCoMKgwqAgPGRvbWlkPnw8dmFs
dWU+fA0KPj4gK8KgwqDCoCBSZXR1cm5zIG9yIHNldHMgdGhlIGNvbnRlbnRzIG9mIHRoZSAi
ZmVhdHVyZSIgZmllbGQgbG9jYXRlZCBhdA0KPj4gK8KgwqDCoCBvZmZzZXQgMjA2NCBvZiB0
aGUgWGVuc3RvcmUgcmluZyBwYWdlIG9mIHRoZSBkb21haW4gc3BlY2lmaWVkIGJ5DQo+PiAr
wqDCoMKgIDxkb21pZD4uIDx2YWx1ZT4gaXMgYSBkZWNpbWFsIG51bWJlciBiZWluZyBhIGxv
Z2ljYWwgb3Igb2YgdGhlDQo+PiArwqDCoMKgIGZlYXR1cmUgYml0cyBhcyBkZWZpbmVkIGlu
IGRvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dC4gVHJ5aW5nDQo+PiArwqDCoMKgIHRvIHNl
dCBhIGJpdCBmb3IgYSBmZWF0dXJlIG5vdCBiZWluZyBzdXBwb3J0ZWQgYnkgdGhlIHJ1bm5p
bmcNCj4+ICvCoMKgwqAgWGVuc3RvcmUgd2lsbCBiZSBkZW5pZWQuDQo+IEhvdyB3aWxsIHRo
ZSBjYWxsZXIga25vdyB3aGljaCBmZWF0dXJlIGlzIHN1cHBvcnRlZD8gQWxzbywgd2hhdCBo
YXBwZW4gaWYgYSANCj4gY2xpZW50IGRlY2lkZWQgdG8gb3ZlcndyaXRlICdmZWF0dXJlJz8g
Q291bGQgdGhlIHJlc3VsdCBwb3RlbnRpYWxseSBwcmV2ZW50IA0KPiBtaWdyYXRpb24vbGl2
ZXVwZGF0ZSBvciBlbHNlPw0KDQpUaGUgY2FsbGVyIGNvdWxkIHVzZSAiR0VUX0ZFQVRVUkUg
MCIgdG8gc2VlIHRoZSBhdmFpbGFibGUgZmVhdHVyZXMsIGFzc3VtaW5nDQp0aGF0IG5vYm9k
eSB3b3VsZCBoYXZlIGNoYW5nZWQgZG9tMCdzIGZlYXR1cmVzLg0KDQpJJ20gbm90IHN1cmUg
d2hldGhlciB3ZSBzaG91bGQgcHJldmVudCBkb20wJ3MgZmVhdHVyZXMgdG8gYmUgb3Zlcndy
aXR0ZW4uDQoNCg0KSnVlcmdlbg0K
--------------WWXY5iwiwynehFLHOAXBUCCL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WWXY5iwiwynehFLHOAXBUCCL--

--------------JTXY1MT0IBpDThzH7LRO8Zur--

--------------FBTpDqvqHHZ62Oa0jXHMahzp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIzGSoFAwAAAAAACgkQsN6d1ii/Ey8N
FAgAkI0uK0oGRoXiX9r/IKTjnQDensulfduTmASJHsBg1ivqkEBvo7pD8RUhKjPdfGZlpV2LH5Y2
fD1LwLwWRa0YTPbn7eEvmYfJHh31acYpWyBQPTMuc1EcJAP5dnaGTzHiKYIr7mrSwG+UEY3Vt2zI
GRGTIkr6Ti0Q1EZZUCPafxmQyqk/Nu9quM5Dqc3rD82ufxmKqMeO7htUrzovGs+0iUBYaE45yDku
0qbtD/+sfLJsrMke15Wt/WaoPXDGTEM35PMAOaR79x2ZlvbPw+VZzTSsXJnM9CIuN06zgXaK3hRW
yXPNMVjEPTGGoz/StDfwXBtwdXOZ9pF2o4YDVdZl1w==
=oSoF
-----END PGP SIGNATURE-----

--------------FBTpDqvqHHZ62Oa0jXHMahzp--

