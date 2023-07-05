Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F574881B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559396.874328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4W3-0001zr-Tl; Wed, 05 Jul 2023 15:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559396.874328; Wed, 05 Jul 2023 15:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4W3-0001ww-R3; Wed, 05 Jul 2023 15:34:03 +0000
Received: by outflank-mailman (input) for mailman id 559396;
 Wed, 05 Jul 2023 15:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jglA=CX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qH4W2-0001wm-DC
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:34:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1181f7-1b49-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:34:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 014331FE31;
 Wed,  5 Jul 2023 15:34:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B244213460;
 Wed,  5 Jul 2023 15:33:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nMyHKWeNpWRHLgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Jul 2023 15:33:59 +0000
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
X-Inumbo-ID: 5d1181f7-1b49-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688571240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VsB419Adq9NfBRaDhLDZrhEMVvbNumGt9zZMlDfcTE0=;
	b=YNXnkkw3jpKcGU/kxSN6BVyKBSslhIshiarmSBXi9299F9EMV69D3AZieEhrt5oPSYPmw/
	cafHXhpBdOoDXsp7O6cQrqRZ3/bnJqkP9zZgnSx4sehUVa7wPFNKeoin44wx9Gw73y5Xde
	Q3wL9I2KqR9oIpJI9WEDjKiLTy4c4M4=
Message-ID: <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
Date: Wed, 5 Jul 2023 17:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0pWndwupcTBDbpx56Mor2GJK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0pWndwupcTBDbpx56Mor2GJK
Content-Type: multipart/mixed; boundary="------------BYthgFz0vDFMvcBILi4y0aB5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Message-ID: <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
In-Reply-To: <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>

--------------BYthgFz0vDFMvcBILi4y0aB5
Content-Type: multipart/mixed; boundary="------------x6hgpCT9NRC0xcIGPSnjNU7x"

--------------x6hgpCT9NRC0xcIGPSnjNU7x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDcuMjMgMTc6MjYsIFNpbW9uZSBCYWxsYXJpbiB3cm90ZToNCj4gRnJvbTogR2lh
bmx1Y2EgTHVwYXJpbmkgPGdpYW5sdWNhLmx1cGFyaW5pQGJ1Z3NlbmcuY29tPg0KPiANCj4g
VGhlIHhlbiBzb3VyY2VzIGNvbnRhaW5zIHZpb2xhdGlvbnMgb2YgTUlTUkEgQzoyMDEyIFJ1
bGUgNy4yIHdob3NlDQo+IGhlYWRsaW5lIHN0YXRlczoNCj4gIkEgJ3UnIG9yICdVJyBzdWZm
aXggc2hhbGwgYmUgYXBwbGllZCB0byBhbGwgaW50ZWdlciBjb25zdGFudHMNCj4gdGhhdCBh
cmUgcmVwcmVzZW50ZWQgaW4gYW4gdW5zaWduZWQgdHlwZSIuDQo+IA0KPiBBZGQgdGhlICdV
JyBzdWZmaXggdG8gaW50ZWdlcnMgbGl0ZXJhbHMgd2l0aCB1bnNpZ25lZCB0eXBlIGFuZCBh
bHNvIHRvIG90aGVyDQo+IGxpdGVyYWxzIHVzZWQgaW4gdGhlIHNhbWUgY29udGV4dHMgb3Ig
bmVhciB2aW9sYXRpb25zLCB3aGVuIHRoZWlyIHBvc2l0aXZlDQo+IG5hdHVyZSBpcyBpbW1l
ZGlhdGVseSBjbGVhci4gVGhlIGxhdHRlciBjaGFuZ2VzIGFyZSBkb25lIGZvciB0aGUgc2Fr
ZSBvZg0KPiB1bmlmb3JtaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ltb25lIEJhbGxh
cmluIDxzaW1vbmUuYmFsbGFyaW5AYnVnc2VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEdp
YW5sdWNhIEx1cGFyaW5pIDxnaWFubHVjYS5sdXBhcmluaUBidWdzZW5nLmNvbT4NCj4gLS0t
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gbWlub3IgY2hhbmdlIHRvIGNvbW1pdCB0aXRsZQ0K
PiAtIGNoYW5nZSBjb21taXQgbWVzc2FnZQ0KPiAtIGNvcnJlY3QgbWFjcm9zIGNvZGUgc3R5
bGUNCj4gLS0tDQo+ICAgeGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaCB8IDEwICsrKysr
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9yaW5nLmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oDQo+IGluZGV4IDAyNTkzOTI3OGIuLjBj
YWU0MzY3YmUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9yaW5nLmgN
Cj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaA0KPiBAQCAtMzYsMTEgKzM2
LDExIEBADQo+ICAgdHlwZWRlZiB1bnNpZ25lZCBpbnQgUklOR19JRFg7DQo+ICAgDQo+ICAg
LyogUm91bmQgYSAzMi1iaXQgdW5zaWduZWQgY29uc3RhbnQgZG93biB0byB0aGUgbmVhcmVz
dCBwb3dlciBvZiB0d28uICovDQo+IC0jZGVmaW5lIF9fUkQyKF94KSAgKCgoX3gpICYgMHgw
MDAwMDAwMikgPyAweDIgICAgICAgICAgICAgICAgICA6ICgoX3gpICYgMHgxKSkNCj4gLSNk
ZWZpbmUgX19SRDQoX3gpICAoKChfeCkgJiAweDAwMDAwMDBjKSA/IF9fUkQyKChfeCk+PjIp
PDwyICAgIDogX19SRDIoX3gpKQ0KPiAtI2RlZmluZSBfX1JEOChfeCkgICgoKF94KSAmIDB4
MDAwMDAwZjApID8gX19SRDQoKF94KT4+NCk8PDQgICAgOiBfX1JENChfeCkpDQo+IC0jZGVm
aW5lIF9fUkQxNihfeCkgKCgoX3gpICYgMHgwMDAwZmYwMCkgPyBfX1JEOCgoX3gpPj44KTw8
OCAgICA6IF9fUkQ4KF94KSkNCj4gLSNkZWZpbmUgX19SRDMyKF94KSAoKChfeCkgJiAweGZm
ZmYwMDAwKSA/IF9fUkQxNigoX3gpPj4xNik8PDE2IDogX19SRDE2KF94KSkNCj4gKyNkZWZp
bmUgX19SRDIoeCkgICgoKHgpICYgMHgwMDAwMDAwMlUpID8gMHgyICAgICAgICAgICAgICAg
ICAgICAgOiAoKHgpICYgMHgxKSkNCg0KU2hvdWxkbid0IHRoaXMgYmUgcmF0aGVyOg0KDQor
I2RlZmluZSBfX1JEMih4KSAgKCgoeCkgJiAweDAwMDAwMDAyVSkgPyAweDJVICAgICAgICAg
ICAgICAgICAgIDogKCh4KSAmIDB4MVUpKQ0KDQo+ICsjZGVmaW5lIF9fUkQ0KHgpICAoKCh4
KSAmIDB4MDAwMDAwMGNVKSA/IF9fUkQyKCh4KSA+PiAyKSA8PCAyICAgIDogX19SRDIoeCkp
DQo+ICsjZGVmaW5lIF9fUkQ4KHgpICAoKCh4KSAmIDB4MDAwMDAwZjBVKSA/IF9fUkQ0KCh4
KSA+PiA0KSA8PCA0ICAgIDogX19SRDQoeCkpDQo+ICsjZGVmaW5lIF9fUkQxNih4KSAoKCh4
KSAmIDB4MDAwMGZmMDBVKSA/IF9fUkQ4KCh4KSA+PiA4KSA8PCA4ICAgIDogX19SRDgoeCkp
DQo+ICsjZGVmaW5lIF9fUkQzMih4KSAoKCh4KSAmIDB4ZmZmZjAwMDBVKSA/IF9fUkQxNigo
eCkgPj4gMTYpIDw8IDE2IDogX19SRDE2KHgpKQ0KPiAgIA0KPiAgIC8qDQo+ICAgICogQ2Fs
Y3VsYXRlIHNpemUgb2YgYSBzaGFyZWQgcmluZywgZ2l2ZW4gdGhlIHRvdGFsIGF2YWlsYWJs
ZSBzcGFjZSBmb3IgdGhlDQoNCk90aGVyIHRoYW4gdGhhdDoNCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------x6hgpCT9NRC0xcIGPSnjNU7x
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------x6hgpCT9NRC0xcIGPSnjNU7x--

--------------BYthgFz0vDFMvcBILi4y0aB5--

--------------0pWndwupcTBDbpx56Mor2GJK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSljWcFAwAAAAAACgkQsN6d1ii/Ey9R
Ygf/TJT4yysky8yain6t5wlNxWG39asnutij1H8xA6RWZW5H9G9x8mB1LPVvpoJPTEF4Hx7mOVf/
LP6PgtB9es40xMfteqtGInow0HQJJ8VphjrVqeYUgLW17utHOGp4tXcnY5yxTXw8muq5anbtk8Jf
SQ9OR+1AVQw+O9xco0ccS5iZHA2YS9Id2Q7ZxN7BbQI9ovuRyRoZg1wcp/UI1bsC9sVLtjMfwxWh
IiP2mLJy0uExclH5hbeEtoC+nve++cSuJynydKo7uliFFjX4uRtAEtKoToiRREVrpw+6I0Rz8Ivo
MSPBbIaCr4j57/4aSDgc0vMhpckj6iXZr38iMFUicg==
=cVIZ
-----END PGP SIGNATURE-----

--------------0pWndwupcTBDbpx56Mor2GJK--

