Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1055B962
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 13:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356521.584761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nDc-0000En-80; Mon, 27 Jun 2022 11:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356521.584761; Mon, 27 Jun 2022 11:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nDc-0000CG-50; Mon, 27 Jun 2022 11:47:52 +0000
Received: by outflank-mailman (input) for mailman id 356521;
 Mon, 27 Jun 2022 11:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5nDZ-0000Br-Vp
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 11:47:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f788e1fd-f60e-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 13:47:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1988D1FAAD;
 Mon, 27 Jun 2022 11:47:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B505313456;
 Mon, 27 Jun 2022 11:47:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jRvbKeOYuWK1bAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 11:47:47 +0000
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
X-Inumbo-ID: f788e1fd-f60e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656330468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jyMJzqUXB10Iev/WE2Ko90Y6Sb+4305PiP8EJBltV1w=;
	b=keIDqK39Pp+8qE6v3vXzsdoPKGq1/oi9N+Lin+CQoN5n2YSjZlQmnqlRToOxJM6wlpnLWZ
	UqrIyPyKVnaPMpISzzK3BRRveWmpVOkPdbkinuwzG/rhUdqcpkfk7cJ27K6eIofPmmyBua
	YPUpkhnhc9oTv5Lm8nG9qse23qxlMXQ=
Message-ID: <7d15d5fe-809f-bd19-4170-68796dd53405@suse.com>
Date: Mon, 27 Jun 2022 13:47:47 +0200
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
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
 <YrmOQPQlbAMwULWc@Air-de-Roger>
 <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
 <YrmWHrqwJOnb0iPr@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YrmWHrqwJOnb0iPr@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CPNxsF0B0C5ouXrFtOX0GkNv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CPNxsF0B0C5ouXrFtOX0GkNv
Content-Type: multipart/mixed; boundary="------------kuC10A84i6WBSr7405wQgVlb";
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
Message-ID: <7d15d5fe-809f-bd19-4170-68796dd53405@suse.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com> <YrmGQj/W7KTzJ1vo@Air-de-Roger>
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
 <YrmOQPQlbAMwULWc@Air-de-Roger>
 <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
 <YrmWHrqwJOnb0iPr@Air-de-Roger>
In-Reply-To: <YrmWHrqwJOnb0iPr@Air-de-Roger>

--------------kuC10A84i6WBSr7405wQgVlb
Content-Type: multipart/mixed; boundary="------------Nt5OFbIeLT3OKxn0cOc8zqpa"

--------------Nt5OFbIeLT3OKxn0cOc8zqpa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTM6MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwg
SnVuIDI3LCAyMDIyIGF0IDAxOjA4OjExUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+PiBPbiAyNy4wNi4yMiAxMzowMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBNb24sIEp1biAyNywgMjAyMiBhdCAxMjo0MDo0MVBNICswMjAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPj4+PiBPbiAyNy4wNi4yMiAxMjoyOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+Pj4+IE9uIFRodSwgTWFyIDI0LCAyMDIyIGF0IDAzOjAxOjMxUE0gKzAxMDAsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gVGhlIGVudHJ5IHBvaW50IHVzZWQgZm9yIHRo
ZSB2Y3B1X29wIGh5cGVyY2FsbCBvbiBBcm0gaXMgZGlmZmVyZW50DQo+Pj4+Pj4gZnJvbSB0
aGUgb25lIG9uIHg4NiB0b2RheSwgYXMgc29tZSBvZiB0aGUgY29tbW9uIHN1Yi1vcHMgYXJl
IG5vdA0KPj4+Pj4+IHN1cHBvcnRlZCBvbiBBcm0uIFRoZSBBcm0gc3BlY2lmaWMgaGFuZGxl
ciBmaWx0ZXJzIG91dCB0aGUgbm90DQo+Pj4+Pj4gc3VwcG9ydGVkIHN1Yi1vcHMgYW5kIHRo
ZW4gY2FsbHMgdGhlIGNvbW1vbiBoYW5kbGVyLiBUaGlzIGxlYWRzIHRvIHRoZQ0KPj4+Pj4+
IHdlaXJkIGNhbGwgaGllcmFyY2h5Og0KPj4+Pj4+DQo+Pj4+Pj4gICAgICBkb19hcm1fdmNw
dV9vcCgpDQo+Pj4+Pj4gICAgICAgIGRvX3ZjcHVfb3AoKQ0KPj4+Pj4+ICAgICAgICAgIGFy
Y2hfZG9fdmNwdV9vcCgpDQo+Pj4+Pj4NCj4+Pj4+PiBDbGVhbiB0aGlzIHVwIGJ5IHJlbmFt
aW5nIGRvX3ZjcHVfb3AoKSB0byBjb21tb25fdmNwdV9vcCgpIGFuZA0KPj4+Pj4+IGFyY2hf
ZG9fdmNwdV9vcCgpIGluIGVhY2ggYXJjaGl0ZWN0dXJlIHRvIGRvX3ZjcHVfb3AoKS4gVGhp
cyB3YXkgb25lDQo+Pj4+Pj4gb2YgYWJvdmUgY2FsbHMgY2FuIGJlIGF2b2lkZWQgd2l0aG91
dCByZXN0cmljdGluZyBhbnkgcG90ZW50aWFsDQo+Pj4+Pj4gZnV0dXJlIHVzZSBvZiBjb21t
b24gc3ViLW9wcyBmb3IgQXJtLg0KPj4+Pj4NCj4+Pj4+IFdvdWxkbid0IGl0IGJlIG1vcmUg
bmF0dXJhbCB0byBoYXZlIGRvX3ZjcHVfb3AoKSBjb250YWluIHRoZSBjb21tb24NCj4+Pj4+
IGNvZGUgKEFGQUlDVCBoYW5kbGVycyBmb3INCj4+Pj4+IFZDUFVPUF9yZWdpc3Rlcl97dmNw
dV9pbmZvLHJ1bnN0YXRlX21lbW9yeV9hcmVhfSkgYW5kIHRoZW4gZXZlcnl0aGluZw0KPj4+
Pj4gZWxzZSBoYW5kbGVkIGJ5IHRoZSB4ODYgYXJjaF9kb192Y3B1X29wKCkgaGFuZGxlcj8N
Cj4+Pj4+DQo+Pj4+PiBJIGZpbmQgdGhlIGNvbW1vbiBwcmVmaXggbWlzbGVhZGluZywgYXMg
bm90IGFsbCB0aGUgVkNQVU9QIGh5cGVyY2FsbHMNCj4+Pj4+IGFyZSBhdmFpbGFibGUgdG8g
YWxsIHRoZSBhcmNoaXRlY3R1cmVzLg0KPj4+Pg0KPj4+PiBUaGlzIHdvdWxkIGVuZCB1cCBp
biBBcm0gc3VkZGVubHkgc3VwcG9ydGluZyB0aGUgc3ViLW9wcyBpdCBkb2Vzbid0DQo+Pj4+
ICh3YW50IHRvKSBzdXBwb3J0IHRvZGF5LiBPdGhlcndpc2UgaXQgd291bGQgbWFrZSBubyBz
ZW5zZSB0aGF0IEFybSBoYXMNCj4+Pj4gYSBkZWRpY2F0ZWQgZW50cnkgZm9yIHRoaXMgaHlw
ZXJjYWxsLg0KPj4+DQo+Pj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSBmb3IgYSBjb21tb24g
ZG9fdmNwdV9vcCgpIHRoYXQganVzdCBjb250YWlucw0KPj4+IGhhbmRsZXJzIGZvciBWQ1BV
T1BfcmVnaXN0ZXJfe3ZjcHVfaW5mbyxydW5zdGF0ZV9tZW1vcnlfYXJlYX0gYW5kIHRoZW4N
Cj4+PiBhbiBlbXB0eSBhcmNoXyBoYW5kbGVyIGZvciBBcm0sIGFuZCBldmVyeXRoaW5nIGVs
c2UgbW92ZWQgdG8gdGhlIHg4Ng0KPj4+IGFyY2hfIGhhbmRsZXIuICBUaGF0IG9idmlvdXNs
eSBpbXBsaWVzIHNvbWUgY29kZSBjaHVybiwgYnV0IHJlc3VsdHMgaW4NCj4+PiBhIGNsZWFu
ZXIgaW1wbGVtZW50YXRpb24gSU1PLg0KPj4NCj4+IEknZCBiZSBmaW5lIHdpdGggdGhhdC4N
Cj4+DQo+PiBJIGRpZCBpdCBpbiBWMiBvZiB0aGUgKHRoZW4gc2VjcmV0KSBzZXJpZXMsIGFu
ZCBKYW4gcmVwbGllZDoNCj4+DQo+PiAgICBJJ20gYWZyYWlkIEkgZG9uJ3QgYWdyZWUgd2l0
aCB0aGlzIG1vdmVtZW50LiBJIGNvdWxkIHNlZSB0aGluZ3MgZ2V0dGluZw0KPj4gICAgbW92
ZWQgdGhhdCBhcmUgcHVyZWx5IFBWIChvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IG5vIG5ldyBQ
ViBwb3J0cyB3aWxsDQo+PiAgICBhcHBlYXIpLCBidXQgYW55dGhpbmcgdGhhdCdzIGFsc28g
dXNhYmxlIGJ5IFBWSCAvIEhWTSBvdWdodCB0byBiZSB1c2FibGUNCj4+ICAgIGluIHByaW5j
aXBsZSBhbHNvIGJ5IEFybSBvciBvdGhlciBQVi1mcmVlIHBvcnRzLg0KPiANCj4gSSBzZWUu
IE15IG9waW5pb24gaXMgdGhhdCB3aGVuIG90aGVyIHBvcnRzIG5lZWQgdGhvc2UgZnVuY3Rp
b25zIHRoZXkNCj4gc2hvdWxkIGJlIHB1bGxlZCBvdXQgb2YgYXJjaCBjb2RlIGludG8gY29t
bW9uIGNvZGUsIHVudGlsIHRoZW4gaXQganVzdA0KPiBhZGRzIGNvbmZ1c2lvbiB0byBoYXZl
IHRoZW0gaW4gY29tbW9uIGNvZGUuDQo+IA0KPiBJIHdpbGwgdGFrZSBhIGxvb2sgYXQgdGhl
IGN1cnJlbnQgcGF0Y2gsIGFzIHdlIG5lZWQgdG8gbWFrZSBwcm9ncmVzcw0KPiBvbiB0aGlz
Lg0KDQpUaGFua3MgZm9yIHRoYXQuDQoNCg0KSnVlcmdlbg0KDQo=
--------------Nt5OFbIeLT3OKxn0cOc8zqpa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Nt5OFbIeLT3OKxn0cOc8zqpa--

--------------kuC10A84i6WBSr7405wQgVlb--

--------------CPNxsF0B0C5ouXrFtOX0GkNv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5mOMFAwAAAAAACgkQsN6d1ii/Ey9b
Wwf/d/eEW7qVGEy0zbxVEXDdgWku74xEhNFzf2kphz0gAtNb1qqFFH93ZH6kH2v0k3R1zE5t/Lzw
CBenQ2dwpW9pHoy0SrHcIgaGi7im3prTFCAMjMbvNZvsjRcjWCDICgnSpcb93woyQSAmQDpkFZ+i
FJM5O/oIVlxdeEeoaJXC7AqnZZyJLxvz8jrP6HCw1t6ZDiEiRYpwhkecAyqCPXjONhiJR8MALcWn
qySZZ4mj7TyF3vXcI+9trNh2IRMJLitIcZutMgvrtJ8PAb6RfzM58YbTeKc8eK+w8aeVTMz4Jhze
o5ubwSy6BXD+4LmkwrGPyOcJBm488MdlrdFyjCYe5g==
=YTKe
-----END PGP SIGNATURE-----

--------------CPNxsF0B0C5ouXrFtOX0GkNv--

