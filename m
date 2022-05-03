Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847875188D1
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 17:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319738.540096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlucH-00051b-Og; Tue, 03 May 2022 15:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319738.540096; Tue, 03 May 2022 15:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlucH-0004y0-IS; Tue, 03 May 2022 15:39:09 +0000
Received: by outflank-mailman (input) for mailman id 319738;
 Tue, 03 May 2022 15:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlucF-0004xu-MI
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 15:39:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a78e9d1-caf7-11ec-a406-831a346695d4;
 Tue, 03 May 2022 17:39:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD1C4210E0;
 Tue,  3 May 2022 15:39:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8535A13ABE;
 Tue,  3 May 2022 15:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xRmRHplMcWI5CgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 15:39:05 +0000
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
X-Inumbo-ID: 2a78e9d1-caf7-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651592345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrpEMB1W7TnL5SQymLWsAPOL6/iFhNULQO1y1FsULXc=;
	b=hGwb9ZZ9ghIo53lFXEIKH9OOYFOaoQZRjDIyZmkR4V6BZFXZqDe0ra6C67FABMb41iM7tD
	aySUo9/xF1YfmSh3rwEljtz1eYqQ2UTDqPVGWFexKMaCrO3V2apRX3EUUa2fv0VsKBs6Uy
	FuQOLcwgMu6S5v9ai/T3TxVfnWX0mfQ=
Message-ID: <acecd35f-0cfd-e472-8d77-cf1c199abd66@suse.com>
Date: Tue, 3 May 2022 17:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: x86/PV: (lack of) MTRR exposure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ltgwuO16jt05xd18LUOM1IlN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ltgwuO16jt05xd18LUOM1IlN
Content-Type: multipart/mixed; boundary="------------BELGfTD8P7ZLtSJQtZPTd09M";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <acecd35f-0cfd-e472-8d77-cf1c199abd66@suse.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
In-Reply-To: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>

--------------BELGfTD8P7ZLtSJQtZPTd09M
Content-Type: multipart/mixed; boundary="------------1x28XZSRFm0KjFy5Ax3404Vq"

--------------1x28XZSRFm0KjFy5Ax3404Vq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjIgMTc6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBIZWxsbywNCj4gDQo+
IGluIHRoZSBjb3Vyc2Ugb2YgYW5hbHl6aW5nIHRoZSBpOTE1IGRyaXZlciBjYXVzaW5nIGJv
b3QgdG8gZmFpbCBpbg0KPiBMaW51eCA1LjE4IEkgZm91bmQgdGhhdCBMaW51eCwgZm9yIGFs
bCB0aGUgeWVhcnMsIGhhcyBiZWVuIHJ1bm5pbmcNCj4gaW4gUFYgbW9kZSBhcyBpZiBQQVQg
d2FzIChtb3N0bHkpIGRpc2FibGVkLiBUaGlzIGlzIGEgcmVzdWx0IG9mDQo+IHRoZW0gdHlp
bmcgUEFUIGluaXRpYWxpemF0aW9uIHRvIE1UUlIgaW5pdGlhbGl6YXRpb24sIHdoaWxlIHdl
DQo+IG9mZmVyIFBBVCBidXQgbm90IE1UUlIgaW4gQ1BVSUQgb3V0cHV0LiBUaGlzIHdhcyBk
aWZmZXJlbnQgYmVmb3JlDQo+IG91ciBtb3ZpbmcgdG8gQ1BVIGZlYXR1cmVzZXRzLCBhbmQg
YXMgc3VjaCBvbmUgY291bGQgdmlldyB0aGlzDQo+IGJlaGF2aW9yIGFzIGEgcmVncmVzc2lv
biBmcm9tIHRoYXQgY2hhbmdlLg0KPiANCj4gVGhlIGZpcnN0IHF1ZXN0aW9uIGhlcmUgaXMg
d2hldGhlciBub3QgZXhwb3NpbmcgTVRSUiBhcyBhIGZlYXR1cmUNCj4gd2FzIHJlYWxseSBp
bnRlbmRlZCwgaW4gcGFydGljdWxhciBhbHNvIGZvciBQViBEb20wLiBUaGUgWGVub0xpbnV4
DQo+IGtlcm5lbCBhbmQgaXRzIGZvcndhcmQgcG9ydHMgZGlkIG1ha2UgdXNlIG9mIFhFTlBG
XypfbWVtdHlwZSB0bw0KPiBkZWFsIHdpdGggTVRSUnMuIFRoYXQncyBmdW5jdGlvbmFsaXR5
IHdoaWNoIChtYXliZSBmb3IgYSBnb29kDQo+IHJlYXNvbikgbmV2ZXIgbWFkZSBpdCBpbnRv
IHRoZSBwdm9wcyBrZXJuZWwuIE5vdGUgdGhhdCBQVkggRG9tMA0KPiBkb2VzIGhhdmUgYWNj
ZXNzIHRvIHRoZSBvcmlnaW5hbCBzZXR0aW5ncywgYXMgdGhlIGhvc3QgdmFsdWVzIGFyZQ0K
PiB1c2VkIGFzIGluaXRpYWwgc3RhdGUgdGhlcmUuDQo+IA0KPiBUaGUgbmV4dCBxdWVzdGlv
biB3b3VsZCBiZSBob3cgd2UgY291bGQgZ28gYWJvdXQgaW1wcm92aW5nIHRoZQ0KPiBzaXR1
YXRpb24uIEZvciB0aGUgcGFydGljdWxhciBpc3N1ZSBpbiA1LjE4IEkndmUgZm91bmQgYSBy
ZWxhdGl2ZWx5DQo+IHNpbXBsZSBzb2x1dGlvbiBbMV0gKHdoaWNoIGFsc28gbG9va3MgdG8g
aGVscCBncmFwaGljcyBwZXJmb3JtYW5jZQ0KPiBvbiBvdGhlciBzeXN0ZW1zLCBhY2NvcmRp
bmcgdG8gbXkgaW5pdGlhbCBvYnNlcnZhdGlvbnMgd2l0aCB1c2luZw0KPiB0aGUgY2hhbmdl
KSwgYWxiZWl0IGl0cyBzaW1wbGljaXR5IGxpa2VseSBtZWFucyBpdCBlaXRoZXIgaXMgd3Jv
bmcNCj4gaW4gc29tZSB3YXksIG9yIG1pZ2h0IG5vdCBiZSBsaWtlZCBmb3IgbG9va2luZyBo
YWNreSBhbmQvb3IgYWJ1c2l2ZS4NCj4gV2UgY2FuJ3QsIGZvciBleGFtcGxlLCBzaW1wbHkg
dHVybiBvbiB0aGUgTVRSUiBiaXQgaW4gQ1BVSUQsIGFzIHRoYXQNCj4gd291bGQgaW1wbGlj
aXRseSBsZWFkIHRvIHRoZSBrZXJuZWwgdHJ5aW5nIHRvIHdyaXRlIHRoZSBQQVQgTVNSIChp
ZiwNCj4gc2VlIGJlbG93LCBpdCBkaWRuJ3QgaXRzZWxmIHphcCB0aGUgYml0KS4gV2UgYWxz
byBjYW4ndCBzaW1wbHkNCj4gaWdub3JlIFBBVCBNU1Igd3JpdGVzLCBhcyB0aGUga2VybmVs
IHdvbid0IGNoZWNrIHdoZXRoZXIgd3JpdGVzDQo+IGFjdHVhbGx5IHRvb2sgZWZmZWN0LiAo
QWxsIG9mIHRoYXQgZGlkIHdvcmsgb24gdG9wIG9mIG9sZCBYZW4NCj4gYXBwYXJlbnRseSBv
bmx5IGJlY2F1c2UgeGVuX2luaXRfY2FwYWJpbGl0aWVzKCkgaXRzZWxmIGFsc28gZm9yY2Vz
DQo+IHRoZSBNVFJSIGZlYXR1cmUgdG8gb2ZmLikNCg0KSSd2ZSBzZW50IGFuIGFsdGVybmF0
aXZlIHBhdGNoIGFkZHJlc3NpbmcgdGhpcyBwcm9ibGVtOg0KDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjIwNTAzMTMyMjA3LjE3MjM0LTMtamdyb3NzQHN1c2UuY29tL1Qv
I3UNCg0KTGV0cyBzZWUgd2hldGhlciBpdCBpcyBhY2NlcHRlZC4NCg0KDQpKdWVyZ2VuDQo=

--------------1x28XZSRFm0KjFy5Ax3404Vq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1x28XZSRFm0KjFy5Ax3404Vq--

--------------BELGfTD8P7ZLtSJQtZPTd09M--

--------------ltgwuO16jt05xd18LUOM1IlN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJxTJkFAwAAAAAACgkQsN6d1ii/Ey9R
/ggAjMENfXS2o/d5iKFeZ8vryHlFCYfToR+Ohy4iGIHBYlbb3CKhEDG7aiopbbF/mkWVaxNqf1Qw
olvAvHL2XGbjYKyxlh/HsXBE74Bd6xFEBMcX5vQNfG1CqFNIb1OcuWjObKX/IXSrY+Fkbsjao+EC
+X2FNkwxG8BbB9elr4ZzI8hsBIMSvgDEwLiFj4GzEM/jn48zmIytg8kU7cXp0VXBq8P+W0/6668U
U0oVJo170gy3Jy+6e+1xAu0rGHZebQOMFw3jU0MSo221HlBSSzprHEBLLy4cABTcFrtQdAPhA6Fj
ajMFpsZWdl3+jTBIuLEw9An4j1kPJ4cx9VyQB+O8IQ==
=/9IA
-----END PGP SIGNATURE-----

--------------ltgwuO16jt05xd18LUOM1IlN--

