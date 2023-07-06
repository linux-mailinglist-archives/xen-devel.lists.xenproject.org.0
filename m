Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1A749801
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 11:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559810.875148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHL0v-0005Pq-R0; Thu, 06 Jul 2023 09:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559810.875148; Thu, 06 Jul 2023 09:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHL0v-0005Ng-OF; Thu, 06 Jul 2023 09:11:01 +0000
Received: by outflank-mailman (input) for mailman id 559810;
 Thu, 06 Jul 2023 09:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pJ4M=CY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qHL0t-0005Na-Vv
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 09:10:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052aa002-1bdd-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 11:10:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22198204D8;
 Thu,  6 Jul 2023 09:10:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3627138EE;
 Thu,  6 Jul 2023 09:10:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t1UTLiGFpmQdTgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jul 2023 09:10:57 +0000
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
X-Inumbo-ID: 052aa002-1bdd-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688634658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s1QrIZhNYZZ8gmVYX7ogc12++MCXKbi/IylLaKA4CAI=;
	b=PyOZgwHruYftmZd6RSYQTzipuGPGIqamb4T0B+kChpRqMSGIEM5TCm7fchOAgD9w3RLoqg
	r9Y3mm1u8n0AEXYT+voD/HOrYNTEpOJ1x/X/S3zcgjnjTyvcSUWMemh24PM1/EtJhnqa4h
	JuUKJoEM2KA248vyFB72DQw9XnPbsnU=
Message-ID: <75cb1f1c-cfff-8976-6ab6-d226577829c3@suse.com>
Date: Thu, 6 Jul 2023 11:10:57 +0200
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
 <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
 <763fdbb2-d63b-906a-7432-f3b1e14cbb3e@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <763fdbb2-d63b-906a-7432-f3b1e14cbb3e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iWlzB0JQYRtJgCaS7Upw4zGw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iWlzB0JQYRtJgCaS7Upw4zGw
Content-Type: multipart/mixed; boundary="------------gP2k8k3jXK7DAqGsDZe0wnse";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
Message-ID: <75cb1f1c-cfff-8976-6ab6-d226577829c3@suse.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
 <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
 <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
 <006e528d-8955-8324-ed58-bb0bc0e72acc@suse.com>
 <763fdbb2-d63b-906a-7432-f3b1e14cbb3e@suse.com>
In-Reply-To: <763fdbb2-d63b-906a-7432-f3b1e14cbb3e@suse.com>

--------------gP2k8k3jXK7DAqGsDZe0wnse
Content-Type: multipart/mixed; boundary="------------etbgSaCZ7o6tfSfBKn65tHLo"

--------------etbgSaCZ7o6tfSfBKn65tHLo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDcuMjMgMTA6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wNy4yMDIz
IDA5OjU3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDYuMDcuMjMgMDk6NDMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjA3LjIwMjMgMTc6MzMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA1LjA3LjIzIDE3OjI2LCBTaW1vbmUgQmFsbGFyaW4gd3Jv
dGU6DQo+Pj4+PiBGcm9tOiBHaWFubHVjYSBMdXBhcmluaSA8Z2lhbmx1Y2EubHVwYXJpbmlA
YnVnc2VuZy5jb20+DQo+Pj4+Pg0KPj4+Pj4gVGhlIHhlbiBzb3VyY2VzIGNvbnRhaW5zIHZp
b2xhdGlvbnMgb2YgTUlTUkEgQzoyMDEyIFJ1bGUgNy4yIHdob3NlDQo+Pj4+PiBoZWFkbGlu
ZSBzdGF0ZXM6DQo+Pj4+PiAiQSAndScgb3IgJ1UnIHN1ZmZpeCBzaGFsbCBiZSBhcHBsaWVk
IHRvIGFsbCBpbnRlZ2VyIGNvbnN0YW50cw0KPj4+Pj4gdGhhdCBhcmUgcmVwcmVzZW50ZWQg
aW4gYW4gdW5zaWduZWQgdHlwZSIuDQo+Pj4+Pg0KPj4+Pj4gQWRkIHRoZSAnVScgc3VmZml4
IHRvIGludGVnZXJzIGxpdGVyYWxzIHdpdGggdW5zaWduZWQgdHlwZSBhbmQgYWxzbyB0byBv
dGhlcg0KPj4+Pj4gbGl0ZXJhbHMgdXNlZCBpbiB0aGUgc2FtZSBjb250ZXh0cyBvciBuZWFy
IHZpb2xhdGlvbnMsIHdoZW4gdGhlaXIgcG9zaXRpdmUNCj4+Pj4+IG5hdHVyZSBpcyBpbW1l
ZGlhdGVseSBjbGVhci4gVGhlIGxhdHRlciBjaGFuZ2VzIGFyZSBkb25lIGZvciB0aGUgc2Fr
ZSBvZg0KPj4+Pj4gdW5pZm9ybWl0eS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBT
aW1vbmUgQmFsbGFyaW4gPHNpbW9uZS5iYWxsYXJpbkBidWdzZW5nLmNvbT4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEdpYW5sdWNhIEx1cGFyaW5pIDxnaWFubHVjYS5sdXBhcmluaUBidWdz
ZW5nLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+Pj4+IC0gbWlu
b3IgY2hhbmdlIHRvIGNvbW1pdCB0aXRsZQ0KPj4+Pj4gLSBjaGFuZ2UgY29tbWl0IG1lc3Nh
Z2UNCj4+Pj4+IC0gY29ycmVjdCBtYWNyb3MgY29kZSBzdHlsZQ0KPj4+Pj4gLS0tDQo+Pj4+
PiAgICAgeGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaCB8IDEwICsrKysrLS0tLS0NCj4+
Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmlu
Zy5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3JpbmcuaA0KPj4+Pj4gaW5kZXggMDI1OTM5
Mjc4Yi4uMGNhZTQzNjdiZSAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9pby9yaW5nLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9yaW5nLmgN
Cj4+Pj4+IEBAIC0zNiwxMSArMzYsMTEgQEANCj4+Pj4+ICAgICB0eXBlZGVmIHVuc2lnbmVk
IGludCBSSU5HX0lEWDsNCj4+Pj4+ICAgICANCj4+Pj4+ICAgICAvKiBSb3VuZCBhIDMyLWJp
dCB1bnNpZ25lZCBjb25zdGFudCBkb3duIHRvIHRoZSBuZWFyZXN0IHBvd2VyIG9mIHR3by4g
Ki8NCj4+Pj4+IC0jZGVmaW5lIF9fUkQyKF94KSAgKCgoX3gpICYgMHgwMDAwMDAwMikgPyAw
eDIgICAgICAgICAgICAgICAgICA6ICgoX3gpICYgMHgxKSkNCj4+Pj4+IC0jZGVmaW5lIF9f
UkQ0KF94KSAgKCgoX3gpICYgMHgwMDAwMDAwYykgPyBfX1JEMigoX3gpPj4yKTw8MiAgICA6
IF9fUkQyKF94KSkNCj4+Pj4+IC0jZGVmaW5lIF9fUkQ4KF94KSAgKCgoX3gpICYgMHgwMDAw
MDBmMCkgPyBfX1JENCgoX3gpPj40KTw8NCAgICA6IF9fUkQ0KF94KSkNCj4+Pj4+IC0jZGVm
aW5lIF9fUkQxNihfeCkgKCgoX3gpICYgMHgwMDAwZmYwMCkgPyBfX1JEOCgoX3gpPj44KTw8
OCAgICA6IF9fUkQ4KF94KSkNCj4+Pj4+IC0jZGVmaW5lIF9fUkQzMihfeCkgKCgoX3gpICYg
MHhmZmZmMDAwMCkgPyBfX1JEMTYoKF94KT4+MTYpPDwxNiA6IF9fUkQxNihfeCkpDQo+Pj4+
PiArI2RlZmluZSBfX1JEMih4KSAgKCgoeCkgJiAweDAwMDAwMDAyVSkgPyAweDIgICAgICAg
ICAgICAgICAgICAgICA6ICgoeCkgJiAweDEpKQ0KPj4+Pg0KPj4+PiBTaG91bGRuJ3QgdGhp
cyBiZSByYXRoZXI6DQo+Pj4+DQo+Pj4+ICsjZGVmaW5lIF9fUkQyKHgpICAoKCh4KSAmIDB4
MDAwMDAwMDJVKSA/IDB4MlUgICAgICAgICAgICAgICAgICAgOiAoKHgpICYgMHgxVSkpDQo+
Pj4NCj4+PiBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMgbXVjaCAoYXMgdGhlIGNvbW1lbnQg
c2F5cywgdGhlIGlucHV0IGlzIGV4cGVjdGVkDQo+Pj4gdG8gYmUgdW5zaWduZWQgYW55d2F5
KSwgYW5kIEkgZXhwZWN0IGV2ZW4gdGhlIG9uZSBVIHRoYXQgd2FzIGFkZGVkIGhlcmUNCj4+
PiB3YXMgb25seSBhZGRlZCBmb3IgY29uc2lzdGVuY3kuIFRoZSBzb2xlIG9uZSB0aGF0IHJl
YWxseSBtYXR0ZXIgaXMgaW1vIC4uLg0KPj4+DQo+Pj4+PiArI2RlZmluZSBfX1JENCh4KSAg
KCgoeCkgJiAweDAwMDAwMDBjVSkgPyBfX1JEMigoeCkgPj4gMikgPDwgMiAgICA6IF9fUkQy
KHgpKQ0KPj4+Pj4gKyNkZWZpbmUgX19SRDgoeCkgICgoKHgpICYgMHgwMDAwMDBmMFUpID8g
X19SRDQoKHgpID4+IDQpIDw8IDQgICAgOiBfX1JENCh4KSkNCj4+Pj4+ICsjZGVmaW5lIF9f
UkQxNih4KSAoKCh4KSAmIDB4MDAwMGZmMDBVKSA/IF9fUkQ4KCh4KSA+PiA4KSA8PCA4ICAg
IDogX19SRDgoeCkpDQo+Pj4+PiArI2RlZmluZSBfX1JEMzIoeCkgKCgoeCkgJiAweGZmZmYw
MDAwVSkgPyBfX1JEMTYoKHgpID4+IDE2KSA8PCAxNiA6IF9fUkQxNih4KSkNCj4+Pg0KPj4+
IC4uLiB0aGlzIHNpbmdsZSBvbmUuDQo+Pg0KPj4gSSBhZ3JlZSB0aGF0IG9ubHkgdGhlIGxh
c3Qgb25lIGlzIHJlYWxseSBuZWVkZWQuDQo+Pg0KPj4gQnV0IGZvciBjb25zaXN0ZW5jeSBy
ZWFzb25zIEknZCBleHBlY3QgYWxsIG9wdGlvbmFsICJVInMgdG8gYmUgZWl0aGVyIGRyb3Bw
ZWQgb3INCj4+IHNwZWNpZmllZCwgaW5zdGVhZCBvZiBhIG1peHR1cmUuDQo+IA0KPiBGdW5u
eSB5b3Ugc2hvdWxkIHNheSB0aGlzLiBTaGlmdCBjb3VudHMgYWxzbyBhcmVuJ3QgYWxsb3dl
ZCB0byBiZSBuZWdhdGl2ZQ0KPiAuLi4gRm9yIHRoaXMgcmVhc29uLCB0aGUgcGF0dGVybiBJ
IHNlZSBoZXJlIGlzIHRvIGhhdmUgVSB1bmlmb3JtbHkgb24gdGhlDQo+IGxocyBvZiB0aGUg
Pzogb3BlcmF0b3IsIGFuZCBub3doZXJlIGVsc2UuDQoNClllcywgdGhpcyBpcyBvbmUgd2F5
IHRvIGxvb2sgYXQgaXQuDQoNCk15IHZpZXcgd291bGQgYmUgdGhhdCAoYXQgbGVhc3QpIHRo
ZSBjb25zdGFudHMgdXNlZCBmb3IgQU5EaW5nIHNob3VsZCBoYXZlIGENCnVuaWZvcm0gVSBh
dHRyaWJ1dGlvbi4NCg0KSW4gdGhlIGVuZCBJJ20gZmluZSB3aXRoIGVpdGhlciB3YXkuIEkg
anVzdCB3YW50ZWQgdG8gcG9pbnQgb3V0IGEgc2xpZ2h0DQppbmNvbnNpc3RlbmN5IHdpdGgg
dGhlIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------etbgSaCZ7o6tfSfBKn65tHLo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------etbgSaCZ7o6tfSfBKn65tHLo--

--------------gP2k8k3jXK7DAqGsDZe0wnse--

--------------iWlzB0JQYRtJgCaS7Upw4zGw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSmhSEFAwAAAAAACgkQsN6d1ii/Ey/D
gAf6A8bAsOA96ptHUcpH9ntk0i91tEg/EaB5hlusZ0hhzM2O82L8p/uIy57kGusUmmQjmTR0ASfv
SUB9nYLB2QEHMTokbwqJ4nZwiyuwFA/Ga/Ej/WsZoP8+nf86gHrjxykdvaJT7t6rJnNjOysJTKtv
4J4nqFSActzJ4UDwu5rsaO+ZSP4+TrElX3IVPdyU0ZlfnspaFVsLKwBcczrBi+wI4yRVqnFS77oJ
xDeiMV5dcVoQInQ+W2S0Lu9paJ8VhF+qvvdtAu8JqHA+n4DgvEC8wwcDYYhLSP6ONLfY1EakXGka
p3bmLRUtyGX5XkIV6Xq9+1EiKRi6DNzUwLvb6GJl1g==
=jQiX
-----END PGP SIGNATURE-----

--------------iWlzB0JQYRtJgCaS7Upw4zGw--

