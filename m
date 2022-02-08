Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A124AD841
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 13:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268276.462075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPVb-00058L-5r; Tue, 08 Feb 2022 12:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268276.462075; Tue, 08 Feb 2022 12:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPVb-00056q-2S; Tue, 08 Feb 2022 12:22:11 +0000
Received: by outflank-mailman (input) for mailman id 268276;
 Tue, 08 Feb 2022 12:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=co3W=SX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nHPVZ-00056k-JE
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 12:22:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb83b2ef-88d9-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 13:22:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BB651F383;
 Tue,  8 Feb 2022 12:22:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2803B13C08;
 Tue,  8 Feb 2022 12:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1bPrB29gAmJOPAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Feb 2022 12:22:07 +0000
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
X-Inumbo-ID: bb83b2ef-88d9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644322927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRt/HHpoFOuupmwUM/HXKHhNCsyMWM/lPwuNhPA+yWo=;
	b=pTi2NYkVy+vCh/pdF4QiHA59+W/hv4MlEARHxOB2o1xITFjl4XOypHmIzFNCH3qK6Pq6j4
	tMIi5hh2ccqmzlElFn/PP2uF9PdioDtcnUCZzAuukN19dPo0bWuY3JLUAfRTPMJyMG/TrW
	wSVinkpHp3BECwSmwr4LePZnoetO2eY=
Message-ID: <bcdb29f3-164c-03ea-1b48-4328f75778b1@suse.com>
Date: Tue, 8 Feb 2022 13:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220208074230.7901-1-jgross@suse.com>
 <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen/public: add comment to struct
 xen_mem_acquire_resource
In-Reply-To: <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0O4yOt4kQ0Fc8crcGqmKcdPL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0O4yOt4kQ0Fc8crcGqmKcdPL
Content-Type: multipart/mixed; boundary="------------8FJKmqnbE9x0OqNhCXkN8vuN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <bcdb29f3-164c-03ea-1b48-4328f75778b1@suse.com>
Subject: Re: [PATCH v2] xen/public: add comment to struct
 xen_mem_acquire_resource
References: <20220208074230.7901-1-jgross@suse.com>
 <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>
In-Reply-To: <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>

--------------8FJKmqnbE9x0OqNhCXkN8vuN
Content-Type: multipart/mixed; boundary="------------UNl0KKgRcE4lztDKeyCMHbwW"

--------------UNl0KKgRcE4lztDKeyCMHbwW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDIuMjIgMTI6NTUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA4LzAyLzIw
MjIgMDc6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBDb21taXQgN2M3ZjdlOGZiYTAx
IGNoYW5nZWQgeGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oIGluIGFuIGluY29tcGF0aWJs
ZQ0KPj4gd2F5LiBVbmZvcnR1bmF0ZWx5IHRoZSBjaGFuZ2VkIHBhcnRzIHdlcmUgYWxyZWFk
eSBpbiB1c2UgaW4gdGhlIExpbnV4DQo+PiBrZXJuZWwsIHNvIGFuIHVwZGF0ZSBvZiB0aGUg
aGVhZGVyIGluIHRoZSBrZXJuZWwgd291bGQgcmVzdWx0IGluIGEgYnVpbGQNCj4+IGJyZWFr
YWdlLg0KPj4NCj4+IEFzIHRoZSBjaGFuZ2Ugb2YgYWJvdmUgY29tbWl0IHdhcyBpbiBhIHNl
Y3Rpb24gb3JpZ2luYWxseSBtZWFudCB0byBiZSBub3QNCj4+IHN0YWJsZSwgaXQgd2FzIHRo
ZSB1c2FnZSBpbiB0aGUga2VybmVsIHdoaWNoIHdhcyB3cm9uZy4NCj4gDQo+IFdoaWxlIEkg
aGF0ZSB0byBkcmFnIHRoZSBhcmd1bWVudCBvbiwgdGhpcyBpcyB3cm9uZy4NCj4gDQo+IElu
c3RlYWQgb2Ygc3BlY3VsYXRpbmcsIHdoeSBkb24ndCB3ZSBhY3R1YWxseSBsb29rIGF0IHRo
ZSBjb2RlLsKgIEZyb20gTGludXg6DQo+IA0KPiB1bnNpZ25lZCBpbnQgZG9taWQgPQ0KPiAg
wqDCoMKgwqDCoMKgwqAgKHhkYXRhLmZsYWdzICYgWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9v
d25lZCkgPw0KPiAgwqDCoMKgwqDCoMKgwqAgRE9NSURfU0VMRiA6IGtkYXRhLmRvbTsNCj4g
Li4uDQo+IG51bSA9IHhlbl9yZW1hcF9kb21haW5fbWZuX2FycmF5KHZtYSwNCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAga2RhdGEuYWRkciAmIFBBR0VfTUFTSywNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGZucywga2Rh
dGEubnVtLCBlcnJzLA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2bWEtPnZtX3BhZ2VfcHJvdCwNCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZG9taWQpOw0KPiANCj4gVW5kZXIgdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0
aW9uLCBpdCB3YXMgbGl0ZXJhbGx5IG5vdCBwb3NzaWJsZSBmb3IgYQ0KPiBrZXJuZWwgdG8g
YXZvaWQgdXNpbmcgWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCwgYmVjYXVzZSBpdA0K
PiBkZXRlcm1pbmVkIHdoaWNoIGRvbWlkIG5lZWRlZCBmZWVkaW5nIGludG8gYSBzdWJzZXF1
ZW50IGZvcmVpZ24gbWFwIGNvbW1hbmQuDQoNCldoaWxlIG5hc3R5IEkgdGhpbmsgaXQgd291
bGQgaGF2ZSBiZWVuIHBvc3NpYmxlIHRvIHNwbGl0IHRoZSBvcGVyYXRpb24NCmRvbmUgaW4g
dGhlIGtlcm5lbCdzIHByaXZjbWRfaW9jdGxfbW1hcF9yZXNvdXJjZSgpIGludG8gc2V2ZXJh
bCBwaWVjZXMNCmFuZCBsZXQgdGhlIFhlbiB0b29scyBkZWNpZGUgd2hpY2ggZG9taWQgdG8g
dXNlLg0KDQpUaGUgb3JpZ2luYWwgaW50ZXJmYWNlIGRlZmluaXRpb24gZGlkIG5vdCBtYW5k
YXRlIHRvIGJlIHVzYWJsZSBpbiB0aGUNCmtlcm5lbCBvbmx5LCBpdCB3YXMganVzdCBkb25l
IHRoaXMgd2F5LCBiZWNhdXNlIGl0IHdhcyBlYXNpZXIuDQoNCj4gVGhlIGNvbnN0YW50IHdh
cyB0aGVyZWZvcmUgYWx3YXlzIHBhcnQgb2YgdGhlIGZ1bGx5IHB1YmxpYyBBQkksIGhvd2V2
ZXINCj4gaXQgbWF5IGhhdmUgYmVlbiBpbnRlbmRlZCwgYW5kIHN1YnNlcXVlbnQgY2xhaW1z
IHRvIHRoZSBjb250cmFyeQ0KPiAobm90YWJseSwgdGhvc2UgdXNlZCB0byBqdXN0aWZ5IGl0
cyBkZWxldGlvbikgYXJlIGZhbHNlLg0KPiANCj4gVGhlIHNlY3VyaXR5IGZpeCBmb3IgWGVu
IHdhcyB0byBwcm9oaWJpdCBjcmVhdGluZyBzaXR1YXRpb25zIHdoZXJlIHdlDQo+IGZlZCBj
YWxsZXJfb3duZWQgYmFjayB0byB0aGUga2VybmVsLsKgIFRoaXMgaXMgQUJJIGNvbXBhdGli
bGUsIG1lcmVseQ0KPiBjcmVhdGluZyBhIGRlYWQgbG9naWMgcGF0aCBpbiB0aGUga2VybmVs
Lg0KPiANCj4+IEFkZCBhIGNvbW1lbnQgdG8gdGhlIG1vZGlmaWVkIHN0cnVjdCBmb3Igbm90
IHJldXNpbmcgdGhlIG5vdyByZW1vdmVkIGJpdCwNCj4+IGluIG9yZGVyIHRvIGF2b2lkIGtl
cm5lbHMgdXNpbmcgaXQgc3R1bWJsaW5nIG92ZXIgYSBwb3NzaWJsZSBuZXcgbWVhbmluZw0K
Pj4gb2YgdGhlIGJpdC4NCj4+DQo+PiBJbiBjYXNlIHRoZSBrZXJuZWwgaXMgdXBkYXRpbmcg
dG8gYSBuZXcgdmVyc2lvbiBvZiB0aGUgaGVhZGVyLCB0aGUgd3JvbmcNCj4+IHVzZSBjYXNl
IG11c3QgYmUgcmVtb3ZlZCBmaXJzdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSBvbmx5IGFk
ZCBjb21tZW50IGluc3RlYWQgb2YgcmV2ZXJ0aW5nIGNvbW1pdCA3YzdmN2U4ZmJhMDEgKEph
biBCZXVsaWNoKQ0KPj4gLS0tDQo+PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCB8
IDUgKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvbWVtb3J5LmgNCj4+IGluZGV4IDM4M2E5NDY4YzMuLjg2NTEzMDU3ZjcgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4+ICsrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPj4gQEAgLTY2Miw2ICs2NjIsMTEgQEAgc3Ry
dWN0IHhlbl9tZW1fYWNxdWlyZV9yZXNvdXJjZSB7DQo+PiAgICAgICAgKiB0d28gY2FsbHMu
DQo+PiAgICAgICAgKi8NCj4+ICAgICAgIHVpbnQzMl90IG5yX2ZyYW1lczsNCj4+ICsgICAg
LyoNCj4+ICsgICAgICogUGFkZGluZyBmaWVsZCwgbXVzdCBiZSB6ZXJvIG9uIGlucHV0Lg0K
Pj4gKyAgICAgKiBUaGUgbG93ZXN0IGJpdCB3YXMgbmFtZWQgWEVOTUVNX3JzcmNfYWNxX2Nh
bGxlcl9vd25lZCBpbiBhIHByZXZpb3VzDQo+PiArICAgICAqIHZlcnNpb24gYW5kIHNob3Vs
ZCBub3QgYmUgcmV1c2VkIGluIGZ1dHVyZS4NCj4gDQo+IHMvc2hvdWxkL3dpbGwvLsKgIFRo
aXMgaXMgYSBzdGF0ZW1lbnQgb2YgaG93IFhlbiBzaGFsbCBiZWhhdmUuDQoNCk9rYXkuDQoN
Cj4gSSB0aGluayBpdCdzIGFsc28gd29ydGggc29tZWhvdyBmaXR0aW5nIGluIHRoYXQgaXQn
cyBhbiBvdXRwdXQgb25seQ0KPiBiaXQuwqAgSXQgd2lsbCBiZSBpbXBvcnRhbnQgd2hlbiBp
bmV2aXRhYmx5IHdlIGVuZCB1cCBjaGFuZ2luZyB0aGlzIGJhY2sNCj4gdG8gYmVpbmcgYSBm
bGFncyBmaWVsZCB3aGVuIHdlIG5lZWQgdG8gZXh0ZW5kIHRoZSBoeXBlcmNhbGwuDQoNCk9r
YXkuDQoNCkluIHRoZSBlbmQgdGhlIGJpdCBvbmx5IG5lZWRzIHRvIGJlIHJlc2VydmVkLCBp
ZiBwYWQgX2lzXyB6ZXJvIG9uIGlucHV0Lg0KU28gdGhlIGNvcnJlY3Qgd2F5IHRvIHBocmFz
ZSBpdCB3b3VsZCBiZToNCg0KLyoNCiAgKiBQYWRkaW5nIGZpZWxkLCBtdXN0IGJlIHplcm8g
b24gaW5wdXQuDQogICogSW4gYSBwcmV2aW91cyB2ZXJzaW9uIHRoaXMgd2FzIGFuIG91dHB1
dCBmaWVsZCB3aXRoIHRoZSBsb3dlc3QNCiAgKiBiaXQgbmFtZWQgWEVOTUVNX3JzcmNfYWNx
X2NhbGxlcl9vd25lZC4gRnV0dXJlIHZlcnNpb25zIG9mIHRoaXMNCiAgKiBpbnRlcmZhY2Ug
d2lsbCBub3QgcmV1c2UgdGhpcyBiaXQgd2l0aCB0aGUgZmllbGQgYmVpbmcgemVybyBvbg0K
ICAqIGlucHV0Lg0KICAqLw0KDQpJcyB0aGlzIGZpbmUgd2l0aCB5b3U/DQoNCg0KSnVlcmdl
bg0K
--------------UNl0KKgRcE4lztDKeyCMHbwW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------UNl0KKgRcE4lztDKeyCMHbwW--

--------------8FJKmqnbE9x0OqNhCXkN8vuN--

--------------0O4yOt4kQ0Fc8crcGqmKcdPL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmICYG4FAwAAAAAACgkQsN6d1ii/Ey/3
yQf/cs1fjDasJ8fpzC+flhwhhTgxu1NP9S0Im+CgxG779z8rLilsoqU7aNCfaAfvF0CxrG6FR7li
tUwp3805c6kBkitXrjyD2F248OV3n1xxr35QAaRVaiTwrsOwOu/4gbuiUZToSs4yKmxhgJMd2EpI
g/wQtXO+xnzrYvyUSRMfO2ZV0eehENTmehy3Qs40kWUnf1evcxI1JSb70AciZtcTsbVwgkabbW4m
KBnmWpyLCVDMM6sboKDntJgx9oDag/ubzqLk/WkRSQk5qNGitzbfVWiS8Q2rPLsSPXDmAg5klik8
bwYBZLM2jr8wT0H8ktbOquQm/W0Um0bfm8jVSZ8Oag==
=htee
-----END PGP SIGNATURE-----

--------------0O4yOt4kQ0Fc8crcGqmKcdPL--

