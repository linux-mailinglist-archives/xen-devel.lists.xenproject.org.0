Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18212525B74
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 08:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328237.551215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npOiN-0004ZY-2P; Fri, 13 May 2022 06:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328237.551215; Fri, 13 May 2022 06:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npOiM-0004We-Ve; Fri, 13 May 2022 06:23:50 +0000
Received: by outflank-mailman (input) for mailman id 328237;
 Fri, 13 May 2022 06:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1npOiM-0004WY-9K
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 06:23:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fddd86f-d285-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 08:23:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AFFD21AA8;
 Fri, 13 May 2022 06:23:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0476813446;
 Fri, 13 May 2022 06:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7FUtO3P5fWLPKAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 May 2022 06:23:47 +0000
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
X-Inumbo-ID: 3fddd86f-d285-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652423028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0cX0RgYtPBbtgtZRvjM6Se6dAAVliSC/A8Id0nvnX4=;
	b=FszHNnXn3w3nU5XF2bJt+yIsEtXqU9ym33+Qc2QAdqH0B9e1ej+6YmQeFfuidSLZO/OOnE
	VO4JxeOuABhkzCXl78s2OB19jkeT0Bh0CV+1WCWUagitmdi+iiGFZ6IS2HQRzp5cuSNh2S
	LRcV/UuyWJRyawHUqQv78RhxnwnN8i0=
Message-ID: <49d77746-1aaf-5fdc-517f-6ffa761474ef@suse.com>
Date: Fri, 13 May 2022 08:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 anthony.perard@citrix.com, wl@xen.org
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-5-sstabellini@kernel.org>
 <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org>
 <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jmwXDXAk90Ef0izgXojzNLDT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jmwXDXAk90Ef0izgXojzNLDT
Content-Type: multipart/mixed; boundary="------------UlvSfHvv2PHLFzr2XOTTIgp8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 anthony.perard@citrix.com, wl@xen.org
Message-ID: <49d77746-1aaf-5fdc-517f-6ffa761474ef@suse.com>
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-5-sstabellini@kernel.org>
 <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org>
 <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2205121812160.3842@ubuntu-linux-20-04-desktop>

--------------UlvSfHvv2PHLFzr2XOTTIgp8
Content-Type: multipart/mixed; boundary="------------MULkMvT1GdHDFZngw0QPrfY1"

--------------MULkMvT1GdHDFZngw0QPrfY1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDUuMjIgMDM6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCAxMSBNYXkgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gMDUvMDUvMjAyMiAw
MToxNiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IEZyb206IEx1Y2EgTWljY2lv
IDxsdWNtaWNjaW9AZ21haWwuY29tPg0KPj4+DQo+Pj4gV2hlbiB4c19pbnRyb2R1Y2VfZG9t
YWluIGlzIGNhbGxlZCwgc2VuZCBvdXQgYSBub3RpZmljYXRpb24gb24gdGhlDQo+Pj4geGVu
c3RvcmUgZXZlbnQgY2hhbm5lbCBzbyB0aGF0IGFueSAoZG9tMGxlc3MpIGRvbWFpbiB3YWl0
aW5nIGZvciB0aGUNCj4+PiB4ZW5zdG9yZSBpbnRlcmZhY2UgdG8gYmUgcmVhZHkgY2FuIGNv
bnRpbnVlIHdpdGggdGhlIGluaXRpYWxpemF0aW9uLg0KPj4+IEJlZm9yZSBzZW5kaW5nIHRo
ZSBub3RpZmljYXRpb24sIGNsZWFyIFhFTlNUT1JFX1JFQ09OTkVDVElORy4NCj4+Pg0KPj4+
IFRoZSBleHRyYSBub3RpZmljYXRpb24gaXMgaGFybWxlc3MgZm9yIGRvbWFpbnMgdGhhdCBk
b24ndCByZXF1aXJlIGl0Lg0KPj4+DQo+Pj4gSW4geHNfd2lyZS5oIHVwZGF0ZSB0aGUgY29t
bW1lbnQgb24gdG9wIG9mIFhFTlNUT1JFX1JFQ09OTkVDVElORyB0bw0KPj4+IGdlbmVyYWxp
emUgaXRzIG1lYW5pbmcgdG8gc3VpdCB0aGUgZG9tMGxlc3MgdXNlLWNhc2UgYmV0dGVyLg0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBNaWNjaW8gPGx1Y21pY2Npb0BnbWFpbC5j
b20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0
YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4+PiBDQzogamdyb3NzQHN1c2UuY29tDQo+Pj4gQ0M6
IGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20NCj4+PiBDQzogd2xAeGVuLm9yZw0KPj4+IC0t
LQ0KPj4+IElmIHlvdSBoYXZlIGJldHRlciBzdWdnZXN0aW9ucyBmb3IgdGhlIHdvcmRpbmcg
aW4geHNfd2lyZS5oIHBsZWFzZQ0KPj4+IHN1Z2dlc3QhDQo+Pj4NCj4+Pg0KPj4+IENoYW5n
ZXMgaW4gdjY6DQo+Pj4gLSB1c2UgWEVOU1RPUkVfQ09OTkVDVEVEIGluc3RlYWQgb2YgMHgw
DQo+Pj4gLSB1cGRhdGUgeHNfd2lyZS5oDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHY1Og0KPj4+
IC0gcmVzZXQgWFNfQ09OTkVDVElPTl9TVEFURV9SRUNPTk5FQ1RJTkcgYmVmb3JlIG5vdGlm
eWluZyB0aGUgZG9tVQ0KPj4+DQo+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+PiAtIGRyb3AgdGhl
IG5ldyBsYXRlX2luaXQgcGFyYW1ldGVyDQo+Pj4gLS0tDQo+Pj4gICAgdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2RvbWFpbi5jIHwgNCArKysrDQo+Pj4gICAgeGVuL2luY2x1ZGUvcHVi
bGljL2lvL3hzX3dpcmUuaCAgIHwgMiArLQ0KPj4NCj4+IEkgYW0gbm90IGVudGlyZWx5IHN1
cmUgdGhpcyBpcyB0aGUgcmlnaHQgcGxhY2UgdG8gbWVudGlvbiBpdC4gQnV0IEkgY291bGRu
J3QNCj4+IGZpbmQgYSBiZXR0ZXIgb25lLg0KPj4NCj4+IFRoZSBkb2N1bWVudGF0aW9uIChk
b2NzL21pc2MveGVuc3RvcmUtbWlzYy50eHQpIHN0YXRlcyB0aGF0IHRoZSBmaWVsZCBpcyB2
YWxpZA0KPj4gd2hlbiB0aGUgc2VydmVyIGFkdmVydGlzZWQgYGBDb25uZWN0aW9uIFN0YXRl
YGAuDQo+Pg0KPj4gSXMgdGhlcmUgYW55IGd1YXJhbnRlZSB0aGUgZmllbGQgd2lsbCBiZSAw
IGZvciBhbnkgcHJldmlvdXMge0MsIE99eGVuc3RvcmVkDQo+PiBpbXBsZW1lbnRhdGlvbj8g
SWYgbm90LCB0aGVuIEkgdGhpbmsgd2UgbmVlZCB0byBzZXQgdGhlIGZlYXR1cmUgZmxhZyBz
byBMaW51eA0KPj4ga25vd3MgdGhlIGZpZWxkIGNhbiBiZSB1c2VkLg0KPj4NCj4+IElmIHll
cywgdGhlbiB0aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgcmVsYXhlZCBzbyBhbiBPUyBr
bm93cyBpdCBjYW4gc2FmZWx5DQo+PiB1c2UgdGhlIGZpZWxkIHdpdGhvdXQgY2hlY2tpbmcg
dGhlIGZlYXR1cmUgZmxhZy4NCj4gDQo+IFRoZSB4ZW5zdG9yZSBwYWdlIGlzIGFsbG9jYXRl
ZCBieSB0aGUgdG9vbHN0YWNrIHdoaWNoIHplcm9zIHRoZSBwYWdlLA0KPiAqeGVuc3RvcmVk
IHdvdWxkbid0IHNldCBpdCwgc28gSSB0aGluayB3ZSBjYW4gYXNzdW1lIHRoZSBmaWVsZCBo
YXMNCj4gYWx3YXlzIGJlZW4gemVyby4NCj4gDQo+IA0KPj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oDQo+Pj4gYi94ZW4vaW5jbHVkZS9wdWJsaWMv
aW8veHNfd2lyZS5oDQo+Pj4gaW5kZXggOTUzYTAwNTBhMy4uYzFlYzdjNzNlMyAxMDA2NDQN
Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oDQo+Pj4gKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL2lvL3hzX3dpcmUuaA0KPj4+IEBAIC0xNDEsNyArMTQxLDcg
QEAgc3RydWN0IHhlbnN0b3JlX2RvbWFpbl9pbnRlcmZhY2Ugew0KPj4+ICAgICAgLyogVmFs
aWQgdmFsdWVzIGZvciB0aGUgY29ubmVjdGlvbiBmaWVsZCAqLw0KPj4+ICAgICNkZWZpbmUg
WEVOU1RPUkVfQ09OTkVDVEVEIDAgLyogdGhlIHN0ZWFkeS1zdGF0ZSAqLw0KPj4+IC0jZGVm
aW5lIFhFTlNUT1JFX1JFQ09OTkVDVCAxIC8qIGd1ZXN0IGhhcyBpbml0aWF0ZWQgYSByZWNv
bm5lY3QgKi8NCj4+PiArI2RlZmluZSBYRU5TVE9SRV9SRUNPTk5FQ1QgMSAvKiByZWNvbm5l
Y3QgaW4gcHJvZ3Jlc3MgKi8NCj4+DQo+PiBUaGUgZGVmaW5pdGlvbiBpbiB0aGUgZG9jcyBu
ZWVkcyB0byBiZSB1cGRhdGVkLg0KPiANCj4gSSB3YW50ZWQgdG8gZG8gdGhhdCBidXQgSSBh
bSB2ZXJ5IHVuZmFtaWxpYXIgd2l0aCB0aGUgeGVuc3RvcmUgZG9jcy4NCj4gQ2FuIHlvdSBw
b2ludCBtZSB0byB0aGUgcGxhY2Ugd2hlcmUgSSBuZWVkIHRvIGNoYW5nZSB0aGUgZGVmaW5p
dGlvbj8gSQ0KPiBjYW5ub3QgZmluZCB3aGVyZSBYRU5TVE9SRV9SRUNPTk5FQ1QgaXMgZGVm
aW5lZC4uLg0KPiANCg0KU2VlIGRvY3MvbWlzYy94ZW5zdG9yZS1yaW5nLnR4dA0KDQoNCkp1
ZXJnZW4NCg==
--------------MULkMvT1GdHDFZngw0QPrfY1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MULkMvT1GdHDFZngw0QPrfY1--

--------------UlvSfHvv2PHLFzr2XOTTIgp8--

--------------jmwXDXAk90Ef0izgXojzNLDT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJ9+XMFAwAAAAAACgkQsN6d1ii/Ey/G
vwf/c6O+aMn6dRCWjkd+mlgz9uap45W4g873jhbiDH2t97W0MDPQVuMSwmz9DDyJaEAL7HyvFFsu
UBwHHktNzzCPVPHPuEiZX7PrhkLpzP4WjKLZtCX3UqsSdK/dNXP0CsXAwSMmutpZ9KipGZe3JzVz
JbjC8ItPsL3cPNmh/6r272A4EEbdOunAOw1gu9EzKUEsFcPkL8vXufq7XDJyO7W/9MCYMp7P02Tb
gamV9yzaq5Pgb2VCYJYBFisPabyA+NIO0dZJ3B7H6TgfGNYBwZrEEKTk538BtemYkK+Vp0khDXjg
HhwAfLhryQvIwLLDgV2Sk3CWi35MbZ7nQk4WhlNmQg==
=dyZy
-----END PGP SIGNATURE-----

--------------jmwXDXAk90Ef0izgXojzNLDT--

