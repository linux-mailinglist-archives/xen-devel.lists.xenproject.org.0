Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6B4DCBC4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291694.495292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtMM-0007bB-19; Thu, 17 Mar 2022 16:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291694.495292; Thu, 17 Mar 2022 16:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtML-0007ZM-UM; Thu, 17 Mar 2022 16:52:21 +0000
Received: by outflank-mailman (input) for mailman id 291694;
 Thu, 17 Mar 2022 16:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUtMK-0007ZG-3i
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:52:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b5a9ca6-a612-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:52:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8073C1F38D;
 Thu, 17 Mar 2022 16:52:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2751213BB5;
 Thu, 17 Mar 2022 16:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dWdBCEJnM2JeewAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Mar 2022 16:52:18 +0000
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
X-Inumbo-ID: 9b5a9ca6-a612-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647535938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKopnU37oDUPCOBGRikD4uUwW2GCdv1gdB6bHNmINMY=;
	b=E5Gu1K5F9Qj9fDeZsg0vP444UA/P2DwLh+krmxHh3LHtOJKyR7QUgsHuIXWdlx6n6zOMxF
	yQKw5BLpDXAN1rquP0dhe+w7r2aNgVa4lh92vm9Y6k5DzQjvZp55R9w1Zo6nX4e8KewS3P
	wp30Bj3vmpoKOFN3GwYgNnBknlm+SVs=
Message-ID: <cf1c241d-22f3-e48d-890a-aae9523bf8da@suse.com>
Date: Thu, 17 Mar 2022 17:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-12-jgross@suse.com>
 <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ubCt117g6SMmlqOz0rxu4iUS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ubCt117g6SMmlqOz0rxu4iUS
Content-Type: multipart/mixed; boundary="------------Hnx1EM4gWezudUp5fpSf0Yc0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <cf1c241d-22f3-e48d-890a-aae9523bf8da@suse.com>
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-12-jgross@suse.com>
 <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
In-Reply-To: <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>

--------------Hnx1EM4gWezudUp5fpSf0Yc0
Content-Type: multipart/mixed; boundary="------------0eULWayHeadiX7sWTzIC4SyA"

--------------0eULWayHeadiX7sWTzIC4SyA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjIgMTc6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wMy4yMDIy
IDA4OjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gTm93IHRoYXQgdGhlIGh5cGVyY2Fs
bCBoYW5kbGVycyBhcmUgYWxsIGJlaW5nIGNhbGxlZCBkaXJlY3RseSBpbnN0ZWFkDQo+PiB0
aHJvdWdoIGEgZnVuY3Rpb24gdmVjdG9yLCB0aGUgImNmX2NoZWNrIiBhdHRyaWJ1dGUgY2Fu
IGJlIHJlbW92ZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWNDoNCj4+IC0gbmV3IHBhdGNoDQo+PiAtLS0N
Cj4+ICAgeGVuL2FyY2gveDg2L2NvbXBhdC5jICAgICAgICAgICAgICAgfCAgNiArKystLS0N
Cj4+ICAgeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgICAgICAgfCAgMiArLQ0KPj4g
ICB4ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYyAgICAgICAgICAgICB8ICAyICstDQo+PiAgIHhl
bi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgIHwgIDMgKy0tDQo+PiAgIHhlbi9h
cmNoL3g4Ni9odm0vZG0uYyAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgeGVuL2FyY2gv
eDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jICAgICAgICB8ICA2ICsrKy0tLQ0KPj4gICB4ZW4vYXJjaC94ODYv
bW0uYyAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKy0tLS0tLQ0KPj4gICB4ZW4vYXJj
aC94ODYvbW0vcGFnaW5nLmMgICAgICAgICAgICB8ICAyICstDQo+PiAgIHhlbi9hcmNoL3g4
Ni9waHlzZGV2LmMgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgeGVuL2FyY2gveDg2L3Bs
YXRmb3JtX2h5cGVyY2FsbC5jICAgfCAgMiArLQ0KPj4gICB4ZW4vYXJjaC94ODYvcHYvY2Fs
bGJhY2suYyAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4+ICAgeGVuL2FyY2gv
eDg2L3B2L2Rlc2NyaXB0b3ItdGFibGVzLmMgfCAgOCArKysrLS0tLQ0KPj4gICB4ZW4vYXJj
aC94ODYvcHYvaXJldC5jICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4+ICAgeGVuL2FyY2gv
eDg2L3B2L21pc2MtaHlwZXJjYWxscy5jICAgfCAxMCArKysrKy0tLS0tDQo+PiAgIHhlbi9h
cmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgICAgIHwgIDQgKystLQ0KPj4gICB4ZW4vYXJj
aC94ODYveDg2XzY0L2NvbXBhdC9tbS5jICAgICB8ICAyICstDQo+PiAgIHhlbi9jb21tb24v
YXJnby5jICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPj4gICB4ZW4vY29tbW9uL2Nv
bXBhdC9ncmFudF90YWJsZS5jICAgICB8ICAyICstDQo+PiAgIHhlbi9jb21tb24vY29tcGF0
L2tlcm5lbC5jICAgICAgICAgIHwgIDIgKy0NCj4+ICAgeGVuL2NvbW1vbi9jb21wYXQvbWVt
b3J5LmMgICAgICAgICAgfCAgMyArLS0NCj4+ICAgeGVuL2NvbW1vbi9kbS5jICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAg
ICAgICAgICB8ICAyICstDQo+PiAgIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4+ICAgeGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMgICAgICAgICAg
fCAgMiArLQ0KPj4gICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgICB8ICAz
ICstLQ0KPj4gICB4ZW4vY29tbW9uL2h5cGZzLmMgICAgICAgICAgICAgICAgICB8ICAyICst
DQo+PiAgIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+
ICAgeGVuL2NvbW1vbi9rZXhlYy5jICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+PiAg
IHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgeGVu
L2NvbW1vbi9tdWx0aWNhbGwuYyAgICAgICAgICAgICAgfCAgMyArLS0NCj4+ICAgeGVuL2Nv
bW1vbi9zY2hlZC9jb21wYXQuYyAgICAgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYyAgICAgICAgICAgICB8ICA0ICsrLS0NCj4+ICAgeGVuL2NvbW1vbi9z
eXNjdGwuYyAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4vY29tbW9uL3hlbm9w
cm9mLmMgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIHhlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jICAgICAgICAgIHwgIDIgKy0NCj4+ICAgeGVuL3NjcmlwdHMvZ2VuX2h5cGVyY2Fs
bC5hd2sgICAgICAgfCAgMiArLQ0KPj4gICB4ZW4veHNtL3hzbV9jb3JlLmMgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0NCj4+ICAgMzggZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9u
cygrKSwgNzEgZGVsZXRpb25zKC0pDQo+IA0KPiBCdXQgdGhhdCdzIG9ubHkgdGhlIGRlZmlu
aXRpb25zOyBmb3IgYSByZWFzb24gSSBmb3JnZXQgdGhlIGFubm90YXRpb25zDQo+IGFyZSBw
cmVzZW50IGFsc28gb24gdGhlIGRlY2xhcmF0aW9ucyAocmVhbGx5IHRoZSAiYWxzbyIgYXBw
bGllcyB0aGUNCj4gb3RoZXIgd2F5IGFyb3VuZDsgcGVyaGFwcyBpdCB3YXMgdGhhdCBhIGZ1
dHVyZSBnY2Mgd2lsbCB3YW50IHRvIHdhcm4NCj4gYWJvdXQgZGVjbGFyYXRpb24gYW5kIGRl
ZmluaXRpb24gaGF2aW5nIGdvbmUgb3V0IG9mIHN5bmMpLg0KDQpTZWUgdGhlIGNoYW5nZSBv
ZiB4ZW4vc2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3ayB3aGljaCBpcyB0YWtpbmcgY2FyZSBv
ZiB0aGF0Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------0eULWayHeadiX7sWTzIC4SyA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0eULWayHeadiX7sWTzIC4SyA--

--------------Hnx1EM4gWezudUp5fpSf0Yc0--

--------------ubCt117g6SMmlqOz0rxu4iUS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIzZ0EFAwAAAAAACgkQsN6d1ii/Ey83
NQf+PcxLe5ENix9ugBGgYuwYAQm2TTSH5lCDCiY3WihS/GkzCK0xaueNnNPwDraz53knmRIGA9uR
LJvKWtVYJO82GwsZ/tX72mhn8JJgotKRHNQ0zRRK9KbosApVhmQ30UKmElI7LixWwi6GhgxsIJrQ
QEn1erYgJkwtD61aWvEn/N9YciveC2xqpokHrPTF/lsiAAw74MgvYN9qnWYHvdduK3UjEqSxyLsQ
t4tkOc3U7xeOofrBUbn5//goxznSPYNDb9c76ROVVj9ax0JCUpcXShfYZmKCDhxS77v+GrEwD/Fl
f4cMdsbFMb1gw4Zc+JwAIVCXQ/fc18FWBudVdJUYCQ==
=m8iM
-----END PGP SIGNATURE-----

--------------ubCt117g6SMmlqOz0rxu4iUS--

