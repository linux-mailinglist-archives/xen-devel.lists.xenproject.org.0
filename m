Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7776702E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 17:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571495.895490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPP5P-0002oO-MO; Fri, 28 Jul 2023 15:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571495.895490; Fri, 28 Jul 2023 15:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPP5P-0002mF-Jm; Fri, 28 Jul 2023 15:08:59 +0000
Received: by outflank-mailman (input) for mailman id 571495;
 Fri, 28 Jul 2023 15:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPP5O-0002m9-Gp
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 15:08:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb89e12-2d58-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 17:08:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BF7E1F37E;
 Fri, 28 Jul 2023 15:08:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04ABF133F7;
 Fri, 28 Jul 2023 15:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6GqtOgbaw2TnOwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 15:08:54 +0000
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
X-Inumbo-ID: abb89e12-2d58-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690556935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQXJ+7H3ztBkOTtnMqrfgRGhZ3yOeJPKac4KId6bPNU=;
	b=YbgsXVyTxDZr8TrGzW5QFjHSHk0Ewd5x28XMPuf+4LGFjRIOevK/7UU442oc/xaS8hTbrc
	CaNPXoQPh6Fh+CLzTqB4FqwlCxFXrmM8MaLsZ3+sRX3U9hclsaPO33ruLbUGKPyaoG4nX8
	ZFEnw7+m0xLCy9O6qDgkgOy4sZCM/44=
Message-ID: <f10e82f3-5dc4-bdac-90a1-219f11b47253@suse.com>
Date: Fri, 28 Jul 2023 17:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
 <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
 <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
 <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
 <fa5cdab9-1bfe-7859-0629-3b23dcd6f16b@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <fa5cdab9-1bfe-7859-0629-3b23dcd6f16b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gurAbZKiIMd0IvGrwxDt0025"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gurAbZKiIMd0IvGrwxDt0025
Content-Type: multipart/mixed; boundary="------------9ARcbEqpTvwRa53GXXnoJ083";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f10e82f3-5dc4-bdac-90a1-219f11b47253@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
 <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
 <ebc61b04-bfc4-592a-df09-7226e32d355b@xen.org>
 <daaf9af4-639e-c6fb-890b-852c0781271c@suse.com>
 <fa5cdab9-1bfe-7859-0629-3b23dcd6f16b@xen.org>
In-Reply-To: <fa5cdab9-1bfe-7859-0629-3b23dcd6f16b@xen.org>

--------------9ARcbEqpTvwRa53GXXnoJ083
Content-Type: multipart/mixed; boundary="------------kKVMigLl5vBM0aWScZYmmjaM"

--------------kKVMigLl5vBM0aWScZYmmjaM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTY6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI4LzA3LzIwMjMgMTU6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyOC4wNy4yMyAxNjowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOiA+Pj4+IFVzaW5nIG11bHRp
cGxlIGNvbW1hbmRzIGhhcyBhbHNvIA0KPj4gaXRzIGRvd25zaWRlLiBUaGUgZmlyc3QgdGhh
dCBjb21lcw0KPj4+Pj4gdG8gbXkgbWluZCBpZiB0aGF0IHlvdSBuZWVkIHRvIGtlZXAgYXJv
dW5kIHRoZSBkYXRhLiBCdXQsIHdpdGggeW91ciANCj4+Pj4+IHByb3Bvc2FsLCB5b3Ugd2Ug
d291bGRuJ3QgYmUgYWJsZSB0byBzdG9yZSBpdCBpbiB0aGUgZGF0YWJhc2UgKGxpa2UgZm9y
IA0KPj4+Pj4gdHJhbnNhY3Rpb24gdXBkYXRlKSBhcyBkYXRhbGVuIGNhbiBvbmx5IGJlIDY1
S0IuDQo+Pj4+DQo+Pj4+IEkgd2Fzbid0IGF3YXJlIHRoYXQgYSBjb21wbGV0ZSB0cmFuc2Fj
dGlvbiBuZWVkcyB0byBiZSBrZXB0IGluIGEgc2luZ2xlIGRhdGENCj4+Pj4gYmFzZSByZWNv
cmQuIDotKQ0KPj4+DQo+Pj4gSUlVQywgeW91IGFyZSB0aGlua2luZyB0aGF0IHRoZSBjbGll
bnQgd2lsbCByZXN0b3JlIGFsbCB0aGUgc3RhdGUgYml0cyBieSANCj4+PiBiaXRzLiBCdXQg
aWYgeW91IGxvb2sgYXQgdGhlIGRlc2lnbiBpbiBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWln
cmF0aW9uLm1kLCANCj4+PiB0aGlzIGlzIGEgYmxvYi4NCj4+DQo+PiBPZiBjb3Vyc2UgaXQg
aXMuDQo+Pg0KPj4gSSB3YXMgbmV2ZXIgYXNzdW1pbmcgdGhhdCB0aGUgc3RhdGUgd291bGQg
YmUgYXBwbGllZCBwaWVjZW1lYWwsIHRoaXMgaGFzIHRvDQo+PiBoYXBwZW4gYXRvbWljYWxs
eS4NCj4gDQo+IEkgYW0gY29uZnVzZWQgYmVjYXVzZSBJIGRvbid0IHNlZSBob3cgdGhpcyBy
ZWxhdGVkIHRvIHRoZSBkaXNjdXNzaW9uLiBBYm92ZSwgeW91IA0KPiBtZW50aW9uIGEgdHJh
bnNhY3Rpb24sIHdoaWNoIEkgaW50ZXJwcmV0ZWQgYXMgdGhlIGNsaWVudCB3b3VsZCBvcGVu
IGEgDQo+IHRyYW5zYWN0aW9uIGFuZCBkbyBhIGJ1bmNoIG9mICJ3cml0ZSBub3RlIiwgInNl
dCBwZXJtaXNzaW9ucyIuLi4gQW5kIHRoZW4gY29tbWl0IA0KPiB0aGUgdHJhbnNhY3Rpb24u
DQo+IA0KPiBJIHRob3VnaHQgdGhpcyBpcyB3aGF0IHlvdSB0YWxrZWQgYWJvdXQgYW5kIHRo
aXMgd291bGQgc3RpbGwgYmUgYXRvbWljYWxseS4gTXkgDQo+IHBvaW50IHdpdGggdGhlIGJs
b2IgaXMgdGhhdCB0aGUgcGFyc2luZyBvZiB0aGUgc3RhdGUgaXMgZG9uZSBieSBYZW5zdG9y
ZWQsIG5vdCANCj4gdGhlIGNsaWVudC4NCg0KTXkgaWRlYSB3YXMgdGhhdCB0aGUgdHJhbnNh
Y3Rpb24gd291bGQgYmUgdXNlZCB0byBtYXJrIHRoZSByZWxhdGVkIHN1Yi1jb21tYW5kcw0K
dG8gYmVsb25nIHRvIGEgc2luZ2xlIG1pZ3JhdGlvbi4gVGhpcyB3b3VsZCBtYWtlIGNsZWFu
aW5nIHVwIGluIGNhc2Ugb2YgY2xpZW50DQpkZWF0aCBtdWNoIHNpbXBsZXIuDQoNCk5vdCB1
c2luZyB0cmFuc2FjdGlvbnMgd291bGQgYmUgcG9zc2libGUsIHRvbywgb2YgY291cnNlLg0K
DQo+IA0KPj4NCj4+Pj4gSXQgd291bGQgd29yayBwZXJmZWN0bHkgZmluZSB0byBhbGxvY2F0
ZSB0aGUgbmVlZGVkIG1lbW9yeSB2aWEgdGFsbG9jKCkgYW5kIHRvDQo+Pj4+IHJlZmVyZW5j
ZSBpdCBmcm9tIGEgc3BlY2lhbCBub2RlIGJlaW5nIHBhcnQgb2YgdGhlIHRyYW5zYWN0aW9u
LCBvciB0byBub3QgdXNlDQo+Pj4+IGEgbm9kZSBhdCBhbGwgKHNlZSBhZ2FpbiB0aGUgWFNf
Q09OVFJPTCBleGFtcGxlKS4NCj4+Pg0KPj4+IEkgYW0gbm90IGNvbnZpbmNlZCB0aGUgY29t
cGxleGl0eSBpcyB3b3J0aCBpdCBoZXJlLiBUbyBiZSBob25lc3QsIEkgdGhpbmsgdGhlIA0K
Pj4+IHBheWxvYWQgbGltaXQgc2hvdWxkIGhhdmUgYmVlbiByZWxheGVkIGZvciBMaXZlLVVw
ZGF0ZSBhcyB3ZWxsIGFzIHlvdSBkb24ndCANCj4+PiBnYWluIG11Y2ggdG8gc3BsaXQuIFRo
YXQgc2FpZCwgdGhpcyBpcyBsZXNzIGEgY29uY2VybiBiZWNhdXNlIHlvdSBhcmUgbm90IA0K
Pj4+IHRpbWUgY29uc3RyYWluZWQuDQo+Pj4NCj4+PiBbLi4uXQ0KPj4+DQo+Pj4+IEJ1dCBt
YXliZSB0aGF0IGNvbW1lbnQgd2FzIGJhc2VkIG9uIHdyb25nIGFzc3VtcHRpb25zLCBsaWtl
IHRoZSBtZW50aW9uZWQNCj4+Pj4gY2hhbmdlIG5vdCB2aW9sYXRpbmcgdGhlIHByb3RvY29s
LiA+DQo+Pj4+PiBJIGFtIGhhcHB5IHRvIHJld3JpdGUgdGhlIGNvbW1lbnQgc28gaXQgZG9l
c24ndCBsZWFkIHRvIHRoaW5rIHRoYXQgeW91IChhcyANCj4+Pj4+IHRoZSBtYWludGFpbmVy
KSBhcmUgb3BlbiB0byBoYXZlIGEgbW9yZSByZWxheCBsZW5ndGggY2hlY2suDQo+Pj4+DQo+
Pj4+IFllcywgcGxlYXNlIG1ha2UgYSBzdWdnZXN0aW9uIGZvciBhIHByb3BlciBjb21tZW50
IG5vdCBzdWdnZXN0aW5nIHdlIGFyZSBmaW5lDQo+Pj4+IHRvIHZpb2xhdGUgdGhlIHdpcmUg
cHJvdG9jb2wuDQo+Pj4NCj4+PiBIZXJlIHdlIGdvOg0KPj4+DQo+Pj4gIlRoZSBwYXlsb2Fk
IHNpemUgaXMgbm90IG9ubHkgY3VycmVudGx5IHJlc3RyaWN0ZWQgYnkgdGhlIHByb3RvY29s
IGJ1dCBhbHNvIA0KPj4+IHRoZSBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiAoc2VlIHZhcmlv
dXMgQlVJTERfQlVHX09OKCkpLiINCj4+DQo+PiBIbW0sIEknbSBzdGlsbCBmZWVsaW5nIHVu
ZWFzeSB0byBpbXBseSB0aGF0IHRoZSBwYXlsb2FkIHNpemUgbWlnaHQgYmUgY2hhbmdlZC4N
Cj4+IFNlZSBhYm92ZSByZWFzb25pbmcuDQo+Pg0KPj4gVGhlIG9ubHkgd2F5IEkgY291bGQg
aW1hZ2luZSB0aGlzIGJlaW5nIHBvc3NpYmxlIHdvdWxkIGJlIGEgcGVyLXJpbmctcGFnZQ0K
Pj4gYXR0cmlidXRlIHdpdGggYm90aCBzaWRlcyBhZ3JlZWluZyB0byB0aGUgbWF4IGFsbG93
ZWQgc2l6ZSAodGhlIG1pbmltdW0gYmVpbmcNCj4+IHRvZGF5J3MgdmFsdWUpLg0KPj4NCj4+
IFdpdGggdGhhdCBpbiBtaW5kIEkgY2FuIGhlc2l0YW50bHkgYWRkIHRoZSBjb21tZW50LCBt
YXliZSB3aXRoIHRoZSBhZGRpdGlvbjoNCj4+ICJBbnkgcG90ZW50aWFsIGNoYW5nZSBvZiB0
aGUgbWF4aW11bSBwYXlsb2FkIHNpemUgbmVlZHMgdG8gYmUgbmVnb3RpYXRlZCBiZXR3ZWVu
DQo+PiB0aGUgaW52b2x2ZWQgcGFydGllcy4iDQo+IA0KPiBJIGFtIG9rIHdpdGggdGhhdC4N
Cg0KT2theS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------kKVMigLl5vBM0aWScZYmmjaM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------kKVMigLl5vBM0aWScZYmmjaM--

--------------9ARcbEqpTvwRa53GXXnoJ083--

--------------gurAbZKiIMd0IvGrwxDt0025
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTD2gYFAwAAAAAACgkQsN6d1ii/Ey+7
rgf+N/zHdjk/XQ5TYjAp9Y/k8KEPl0ieA4LtctfLxgH05Xae0oOZ3GCf875n9qEoaL5OchjBzaAL
cnIkoX6SH7o74wcEyYbTjYdqwYLFVvTI3z1h4QeYBSMwsXzZs58TZ4A5z7+UraRKdVLLiaP/LGBN
GN4KwLO4fEOTDrUFe0Fux9SJNVRNgtVR1VmMbBOsyVKJ70tIbj/eAsyrRwGIITol/Y3FbdE5AHlm
xTHgmkv/dmixJI67Yyx9ZmXXi508tgP3cZnDuUtK03+5RHIssZnTaHc9+i8svkGK/7NMRvTHmlR8
dM9S7JOA9GyaNUxV9osAYUmvkf4v5xEzY8hBfdcq+w==
=VLfP
-----END PGP SIGNATURE-----

--------------gurAbZKiIMd0IvGrwxDt0025--

