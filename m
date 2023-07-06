Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE737496DF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559709.874968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJrR-0003Rb-AX; Thu, 06 Jul 2023 07:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559709.874968; Thu, 06 Jul 2023 07:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJrR-0003Pv-6y; Thu, 06 Jul 2023 07:57:09 +0000
Received: by outflank-mailman (input) for mailman id 559709;
 Thu, 06 Jul 2023 07:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pJ4M=CY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qHJrP-0003Pp-QP
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:57:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e9c5c0-1bd2-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:57:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B99C22889;
 Thu,  6 Jul 2023 07:57:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6C8C138FC;
 Thu,  6 Jul 2023 07:57:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJP9KtBzpmTPKAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jul 2023 07:57:04 +0000
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
X-Inumbo-ID: b2e9c5c0-1bd2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688630225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3iWmgcANU5eTWuh1LhgWH3O4PQam1Ynr8e8VXomF76U=;
	b=eNI2cmERW9+oS7dXzKxXkMuIV8UddaPQ7NFu96eDk2ySU4GVumCbcP/tD7sdPQy4qtXXSB
	TMNU5AJJuYc1/75CQk3j74dkGV3xc1kVWdRddTIPED9ZD3nM8V5S26SAk5wvBcvEsZi7NA
	ruPQj82JJ61CpCSYB5+ZwQ3KwRSmmJE=
Message-ID: <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
Date: Thu, 6 Jul 2023 09:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
 <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
 <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VR7kfxUSuiDvpvnhyzHRtvlu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VR7kfxUSuiDvpvnhyzHRtvlu
Content-Type: multipart/mixed; boundary="------------nZ0qt6U0ix5GIiR1n875uEmt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
Message-ID: <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
 <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
 <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
In-Reply-To: <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>

--------------nZ0qt6U0ix5GIiR1n875uEmt
Content-Type: multipart/mixed; boundary="------------WcA11sfEmO8gE3DoBgueRF3g"

--------------WcA11sfEmO8gE3DoBgueRF3g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDcuMjMgMDk6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wNy4yMDIz
IDE3OjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDUuMDcuMjMgMTc6MjYsIFNp
bW9uZSBCYWxsYXJpbiB3cm90ZToNCj4+PiBGcm9tOiBHaWFubHVjYSBMdXBhcmluaSA8Z2lh
bmx1Y2EubHVwYXJpbmlAYnVnc2VuZy5jb20+DQo+Pj4NCj4+PiBUaGUgeGVuIHNvdXJjZXMg
Y29udGFpbnMgdmlvbGF0aW9ucyBvZiBNSVNSQSBDOjIwMTIgUnVsZSA3LjIgd2hvc2UNCj4+
PiBoZWFkbGluZSBzdGF0ZXM6DQo+Pj4gIkEgJ3UnIG9yICdVJyBzdWZmaXggc2hhbGwgYmUg
YXBwbGllZCB0byBhbGwgaW50ZWdlciBjb25zdGFudHMNCj4+PiB0aGF0IGFyZSByZXByZXNl
bnRlZCBpbiBhbiB1bnNpZ25lZCB0eXBlIi4NCj4+Pg0KPj4+IEFkZCB0aGUgJ1UnIHN1ZmZp
eCB0byBpbnRlZ2VycyBsaXRlcmFscyB3aXRoIHVuc2lnbmVkIHR5cGUgYW5kIGFsc28gdG8g
b3RoZXINCj4+PiBsaXRlcmFscyB1c2VkIGluIHRoZSBzYW1lIGNvbnRleHRzIG9yIG5lYXIg
dmlvbGF0aW9ucywgd2hlbiB0aGVpciBwb3NpdGl2ZQ0KPj4+IG5hdHVyZSBpcyBpbW1lZGlh
dGVseSBjbGVhci4gVGhlIGxhdHRlciBjaGFuZ2VzIGFyZSBkb25lIGZvciB0aGUgc2FrZSBv
Zg0KPj4+IHVuaWZvcm1pdHkuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbmUgQmFs
bGFyaW4gPHNpbW9uZS5iYWxsYXJpbkBidWdzZW5nLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBHaWFubHVjYSBMdXBhcmluaSA8Z2lhbmx1Y2EubHVwYXJpbmlAYnVnc2VuZy5jb20+DQo+
Pj4gLS0tDQo+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+PiAtIG1pbm9yIGNoYW5nZSB0byBjb21t
aXQgdGl0bGUNCj4+PiAtIGNoYW5nZSBjb21taXQgbWVzc2FnZQ0KPj4+IC0gY29ycmVjdCBt
YWNyb3MgY29kZSBzdHlsZQ0KPj4+IC0tLQ0KPj4+ICAgIHhlbi9pbmNsdWRlL3B1YmxpYy9p
by9yaW5nLmggfCAxMCArKysrKy0tLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3Jpbmcu
aA0KPj4+IGluZGV4IDAyNTkzOTI3OGIuLjBjYWU0MzY3YmUgMTAwNjQ0DQo+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaA0KPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9pby9yaW5nLmgNCj4+PiBAQCAtMzYsMTEgKzM2LDExIEBADQo+Pj4gICAgdHlwZWRl
ZiB1bnNpZ25lZCBpbnQgUklOR19JRFg7DQo+Pj4gICAgDQo+Pj4gICAgLyogUm91bmQgYSAz
Mi1iaXQgdW5zaWduZWQgY29uc3RhbnQgZG93biB0byB0aGUgbmVhcmVzdCBwb3dlciBvZiB0
d28uICovDQo+Pj4gLSNkZWZpbmUgX19SRDIoX3gpICAoKChfeCkgJiAweDAwMDAwMDAyKSA/
IDB4MiAgICAgICAgICAgICAgICAgIDogKChfeCkgJiAweDEpKQ0KPj4+IC0jZGVmaW5lIF9f
UkQ0KF94KSAgKCgoX3gpICYgMHgwMDAwMDAwYykgPyBfX1JEMigoX3gpPj4yKTw8MiAgICA6
IF9fUkQyKF94KSkNCj4+PiAtI2RlZmluZSBfX1JEOChfeCkgICgoKF94KSAmIDB4MDAwMDAw
ZjApID8gX19SRDQoKF94KT4+NCk8PDQgICAgOiBfX1JENChfeCkpDQo+Pj4gLSNkZWZpbmUg
X19SRDE2KF94KSAoKChfeCkgJiAweDAwMDBmZjAwKSA/IF9fUkQ4KChfeCk+PjgpPDw4ICAg
IDogX19SRDgoX3gpKQ0KPj4+IC0jZGVmaW5lIF9fUkQzMihfeCkgKCgoX3gpICYgMHhmZmZm
MDAwMCkgPyBfX1JEMTYoKF94KT4+MTYpPDwxNiA6IF9fUkQxNihfeCkpDQo+Pj4gKyNkZWZp
bmUgX19SRDIoeCkgICgoKHgpICYgMHgwMDAwMDAwMlUpID8gMHgyICAgICAgICAgICAgICAg
ICAgICAgOiAoKHgpICYgMHgxKSkNCj4+DQo+PiBTaG91bGRuJ3QgdGhpcyBiZSByYXRoZXI6
DQo+Pg0KPj4gKyNkZWZpbmUgX19SRDIoeCkgICgoKHgpICYgMHgwMDAwMDAwMlUpID8gMHgy
VSAgICAgICAgICAgICAgICAgICA6ICgoeCkgJiAweDFVKSkNCj4gDQo+IEkgZG9uJ3QgdGhp
bmsgaXQgbWF0dGVycyBtdWNoIChhcyB0aGUgY29tbWVudCBzYXlzLCB0aGUgaW5wdXQgaXMg
ZXhwZWN0ZWQNCj4gdG8gYmUgdW5zaWduZWQgYW55d2F5KSwgYW5kIEkgZXhwZWN0IGV2ZW4g
dGhlIG9uZSBVIHRoYXQgd2FzIGFkZGVkIGhlcmUNCj4gd2FzIG9ubHkgYWRkZWQgZm9yIGNv
bnNpc3RlbmN5LiBUaGUgc29sZSBvbmUgdGhhdCByZWFsbHkgbWF0dGVyIGlzIGltbyAuLi4N
Cj4gDQo+Pj4gKyNkZWZpbmUgX19SRDQoeCkgICgoKHgpICYgMHgwMDAwMDAwY1UpID8gX19S
RDIoKHgpID4+IDIpIDw8IDIgICAgOiBfX1JEMih4KSkNCj4+PiArI2RlZmluZSBfX1JEOCh4
KSAgKCgoeCkgJiAweDAwMDAwMGYwVSkgPyBfX1JENCgoeCkgPj4gNCkgPDwgNCAgICA6IF9f
UkQ0KHgpKQ0KPj4+ICsjZGVmaW5lIF9fUkQxNih4KSAoKCh4KSAmIDB4MDAwMGZmMDBVKSA/
IF9fUkQ4KCh4KSA+PiA4KSA8PCA4ICAgIDogX19SRDgoeCkpDQo+Pj4gKyNkZWZpbmUgX19S
RDMyKHgpICgoKHgpICYgMHhmZmZmMDAwMFUpID8gX19SRDE2KCh4KSA+PiAxNikgPDwgMTYg
OiBfX1JEMTYoeCkpDQo+IA0KPiAuLi4gdGhpcyBzaW5nbGUgb25lLg0KDQpJIGFncmVlIHRo
YXQgb25seSB0aGUgbGFzdCBvbmUgaXMgcmVhbGx5IG5lZWRlZC4NCg0KQnV0IGZvciBjb25z
aXN0ZW5jeSByZWFzb25zIEknZCBleHBlY3QgYWxsIG9wdGlvbmFsICJVInMgdG8gYmUgZWl0
aGVyIGRyb3BwZWQgb3INCnNwZWNpZmllZCwgaW5zdGVhZCBvZiBhIG1peHR1cmUuDQoNCg0K
SnVlcmdlbg0K
--------------WcA11sfEmO8gE3DoBgueRF3g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WcA11sfEmO8gE3DoBgueRF3g--

--------------nZ0qt6U0ix5GIiR1n875uEmt--

--------------VR7kfxUSuiDvpvnhyzHRtvlu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSmc9AFAwAAAAAACgkQsN6d1ii/Ey/q
wQf7Bk6SjgPDCElP1TwjK/jJx133UT4w5NRM+Kq9FfNYIXosocW+I4Uf142d2v13fSomgHcEMmql
1ZcEPQokT4luPUHqCR5LHGB32v0RkPFWtRbPLKs2v9eIBAF5MlwCCuaKMrVbINQqpMZ/9H+5i2uc
52Z0Wc82/0OgvaUT0g1qKFHIpC547nezp2b3Y5AzBc/9riOkMaaUr5C8HOI13Vvns3K+piBKWpWF
Euxzm7z9263zgGU1hy0d/KFE+q3xvHmN71xsvwmBM1CKyvb0EhTJirqkSsN/o47xLrCRwfKovD4h
DU+kU0Rpl44a8GQ9zmRI6N3J7P+0zKB8/GGCntbJDQ==
=cfGr
-----END PGP SIGNATURE-----

--------------VR7kfxUSuiDvpvnhyzHRtvlu--

