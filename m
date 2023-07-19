Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F099B75978B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 15:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565888.884480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7gd-0003Js-LE; Wed, 19 Jul 2023 13:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565888.884480; Wed, 19 Jul 2023 13:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM7gd-0003HG-HN; Wed, 19 Jul 2023 13:57:51 +0000
Received: by outflank-mailman (input) for mailman id 565888;
 Wed, 19 Jul 2023 13:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qM7gb-0003HA-O5
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 13:57:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d9e1caa-263c-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 15:57:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 786D91FF6F;
 Wed, 19 Jul 2023 13:57:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DBD51361C;
 Wed, 19 Jul 2023 13:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ej0jEdrrt2T9NgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jul 2023 13:57:46 +0000
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
X-Inumbo-ID: 3d9e1caa-263c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689775066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+dcoVh2Imd0JCt8381sL4NIu6dgAuqBXMhcvOaYOEko=;
	b=SHyC7f2qgnSHa9zAZ3ZEQernAoRsA61ckM49+rADC/sA6hbPFpxx0bDRtJnqwfBsgBRzVy
	zQP6GrcuB060x9vfL2YrETfPokeuOXrmzxQZbyDRjVGrUtiIplCppMuzoO2j1x8jhVqVdf
	Jf5E/MmypyYQkStjBXw8Eae/6k5Xzn4=
Message-ID: <75b8d969-7f95-7e87-9f9f-7d99c97365e7@suse.com>
Date: Wed, 19 Jul 2023 15:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
 <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
 <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
 <eca3cbf7-6747-6631-d0bc-26ec3faea233@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <eca3cbf7-6747-6631-d0bc-26ec3faea233@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JEdwe5XNr7mCIBK7su86n1Bd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JEdwe5XNr7mCIBK7su86n1Bd
Content-Type: multipart/mixed; boundary="------------lhT0Utq61VgYwFfKO0IMK9vm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <75b8d969-7f95-7e87-9f9f-7d99c97365e7@suse.com>
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
 <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
 <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
 <eca3cbf7-6747-6631-d0bc-26ec3faea233@xen.org>
In-Reply-To: <eca3cbf7-6747-6631-d0bc-26ec3faea233@xen.org>

--------------lhT0Utq61VgYwFfKO0IMK9vm
Content-Type: multipart/mixed; boundary="------------tyvmTuSjRYhcf0uBgPw0grbQ"

--------------tyvmTuSjRYhcf0uBgPw0grbQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDcuMjMgMTQ6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAx
OS8wNy8yMDIzIDA3OjQ5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTguMDcuMjMg
MjM6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+Pj4g
T24gMTAvMDcvMjAyMyAwNzo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVG9kYXkg
d2hlbiByZWFkaW5nIGEgbm9kZSBmcm9tIHRoZSBkYXRhIGJhc2UgdGhyb3VnaCByZWFkX25v
ZGUoKSwgdGhlDQo+Pj4+IG5vZGUgZGF0YSBpcyBjb3BpZWQgaW4gb3JkZXIgdG8gYXZvaWQg
bW9kaWZ5aW5nIHRoZSBkYXRhIGJhc2Ugd2hlbg0KPj4+PiBwcmVwYXJpbmcgYSBub2RlIHVw
ZGF0ZSwgYXMgb3RoZXJ3aXNlIGFuIGVycm9yIG1pZ2h0IHJlc3VsdCBpbiBhbg0KPj4+PiBp
bmNvbnNpc3RlbnQgc3RhdGUuDQo+Pj4+DQo+Pj4+IFRoZXJlIGFyZSwgaG93ZXZlciwgbWFu
eSBjYXNlcyB3aGVyZSBzdWNoIGEgY29weSBvcGVyYXRpb24gaXNuJ3QNCj4+Pj4gbmVlZGVk
LCBhcyB0aGUgbm9kZSBpc24ndCBtb2RpZmllZC4NCj4+Pj4NCj4+Pj4gQWRkIGEgIm5vY29w
eSIgZmxhZyB0byByZWFkX25vZGUoKSBhbmQgZ2V0X25vZGUqKCkgZnVuY3Rpb25zIGZvciBt
YWtpbmcNCj4+Pj4gdGhvc2UgY2FzZXMgbGVzcyBtZW1vcnkgY29uc3VtaW5nIGFuZCBtb3Jl
IHBlcmZvcm1hbnQuDQo+Pj4NCj4+PiBSZWR1Y2luZyBtZW1vcnkgY29uc3VtcHRpb24gYW5k
IGltcHJvdmluZyBwZXJmb3JtYW5jZSBpcyBnb29kLiBIb3dldmVyIHlvdSANCj4+PiBhcmUg
bm93IHJlbHlpbmcgb24gdGhlIGNhbGxlciB0byBkbyB0aGUgcmlnaHQgdGhpbmcgd2hlbiAn
bm9jb3B5JyBpcyB0cnVlLiBJIA0KPj4+IGJlbGlldmUgdGhpcyBpcyBhIGRpc2FzdGVyIHdh
aXRpbmcgdG8gaGFwcGVuLg0KPj4+DQo+Pj4gU28gYXMgaXQgc3RhbmRzLCBJIGRvbid0IHN1
cHBvcnQgdGhpcyBhcHByb2FjaC4gVGhlIHNvbHV0aW9uIEkgaGF2ZSBpbiBtaW5kIA0KPj4+
IHdvdWxkIHJlcXVpcmUgdGhhdCAnc3RydWN0IG5vZGUnIGlzIGNvbnN0IGZvciB0aGUgJ25v
Y29weScgY2FzZS4gSSBhZ3JlZSB0aGlzIA0KPj4+IG1lYW5zIG1vcmUgd29yaywgYnV0IHRo
YXQncyB0aGUgcHJpY2UgZm9yIHJlZHVjZSB0aGUgdGhlIHJpc2sgb2YgY29ycnVwdGlvbi4N
Cj4+DQo+PiBGYWlyIGVub3VnaC4NCj4+DQo+PiBJJ2xsIGxvb2sgaW50byBzcGxpdHRpbmcg
cmVhZF9ub2RlKCkgaW50byBhIGRpcmVjdCB2YXJpYW50IHJldHVybmluZyBhIGNvbnN0DQo+
PiBwb2ludGVyIGFuZCBhIHZhcmlhbnQgY29weWluZyB0aGUgZGF0YS4gU2FtZSB3aWxsIGJl
IG5lZWRlZCBmb3IgZ2V0X25vZGUqKCkuDQo+Pg0KPj4+DQo+Pj4+DQo+Pj4+IE5vdGUgdGhh
dCB0aGVyZSBpcyBvbmUgbW9kaWZpY2F0aW9uIG9mIHRoZSBub2RlIGRhdGEgbGVmdCwgd2hp
Y2ggaXMgbm90DQo+Pj4+IHByb2JsZW1hdGljOiBkb21haW5fYWRqdXN0X25vZGVfcGVybXMo
KSBtaWdodCBzZXQgdGhlICJpZ25vcmUiIGZsYWcgb2YNCj4+Pj4gYSBwZXJtaXNzaW9uLiBU
aGlzIGRvZXMgbm8gaGFybSwgYXMgc3VjaCBhbiB1cGRhdGUgb2YgdGhlIHBlcm1pc3Npb25z
DQo+Pj4+IGRvZXNuJ3QgbmVlZCB0byBiZSB1bmRvbmUgaW4gY2FzZSBvZiBhIGxhdGVyIHBy
b2Nlc3NpbmcgZXJyb3IuDQo+Pj4gRXZlbiBpZiB0aGlzIGlzIHRoZSAiaWdub3JlIiBmbGFn
LCB0aGlzIGlzIGRlZmluaXRlbHkgbm90IGFuIGlkZWFsIHNpdHVhdGlvbi4gDQo+Pj4gQW5k
LCBBRkFJQ1QsIHRoaXMgaXMgbm90IGV2ZW4gZG9jdW1lbnQuIEkgZG9uJ3QgdG8gYmUgdGhl
IHJlYWRlciB0cnlpbmcgdG8gDQo+Pj4gZmlndXJlIG91dCB3aHkgcmVhZF9ub2RlKCkgYW5k
IGRiX2ZldGNoKCkgcmV0dXJucyBhIHNsaWdodGx5IGRpZmZlcmVudCBub2RlIA0KPj4+IGNv
bnRlbnQgOikuDQo+Pg0KPj4gU28gd291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGUgYWRkaXRp
b24gb2YgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHNpdHVhdGlvbj8NCj4gDQo+IEkgZXhw
ZWN0IHRoYXQgbXkgcmVtYXJrIHdpbGwgYmVjb21lIG1vb3QgaWYgd2UgZ28gYWhlYWQgd2l0
aCBzcGxpdHRpbmcgcmVhZF9ub2RlKCkuDQoNCkkgaGF2ZSBmb3VuZCBhIHNhbmUgc29sdXRp
b24gbWVhbndoaWxlLg0KDQoNCkp1ZXJnZW4NCg0K
--------------tyvmTuSjRYhcf0uBgPw0grbQ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tyvmTuSjRYhcf0uBgPw0grbQ--

--------------lhT0Utq61VgYwFfKO0IMK9vm--

--------------JEdwe5XNr7mCIBK7su86n1Bd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS369kFAwAAAAAACgkQsN6d1ii/Ey9N
hAf7Bqi5zSZAU4Fpp1Jb39cjn8OyA9t0agOJteftJ2DVuK5a+9r1t30wBNIo4koQEkCJR9389gNK
AtJiENTWJ5KVq+v26O6RSEdoRmSrwOgPvzJhW8ZvD76gCRJ6senxNwgoTEnDhFXX8tLr9F5moZ/s
zU29nE1npPPvf9Oj/G65riIEmKI3xMvpRc0LP44PN19l9kyHvgOTEd2dp8xuOCXd1UgINPjuR2pT
9UVus8QHrA43BNXFj3QHmBDuloDxbKHljdQjWjjqrH/HAKb8H/bcSwb8wlJzwbLT6AEnG8k9Bi3A
yYybtf8CwnoT6pxLCZg4HKGkryKpaWp71GURfntUiw==
=ysEk
-----END PGP SIGNATURE-----

--------------JEdwe5XNr7mCIBK7su86n1Bd--

