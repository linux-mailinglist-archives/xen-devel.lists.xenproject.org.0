Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7ED4928D9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258582.445487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ps0-0002ON-Ds; Tue, 18 Jan 2022 14:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258582.445487; Tue, 18 Jan 2022 14:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ps0-0002LZ-9x; Tue, 18 Jan 2022 14:54:00 +0000
Received: by outflank-mailman (input) for mailman id 258582;
 Tue, 18 Jan 2022 14:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdM9=SC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9pry-0002LL-57
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:53:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762b625f-786e-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:53:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B877212BB;
 Tue, 18 Jan 2022 14:53:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F49E13AC3;
 Tue, 18 Jan 2022 14:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vS0BCoTU5mEwTgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Jan 2022 14:53:56 +0000
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
X-Inumbo-ID: 762b625f-786e-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642517636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CAhh4ZMU+oM8Y33MkhKncq4h5rdl6IAEpDySUqphsbM=;
	b=uInbOgJvHLdXCiMBsirG6n27Xzng9VGSdER6OocI+49rqWaiD4mpbLidNhsnBSPCK05lwu
	/rFW4dvTkb5zMhX8EGtD6DTAhWdRsVZR9vnj0zzWAyCepK412KCa6C/wloSSmYaMUFnIR9
	Gs0a7OYI2Cxsf3XHkzuOEiLpEwvr4YI=
Message-ID: <919fd8ba-40f5-11e4-e0f2-cb48fe29136c@suse.com>
Date: Tue, 18 Jan 2022 15:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [MINIOS PATCH v3 03/12] use alloc_file_type() and
 get_file_from_fd() in xs
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-4-jgross@suse.com>
 <44a8d75f-718c-ce72-4b5e-cd67df6087be@srcf.net>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <44a8d75f-718c-ce72-4b5e-cd67df6087be@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yqXgzFfgQBlIPCz66Gny16Le"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yqXgzFfgQBlIPCz66Gny16Le
Content-Type: multipart/mixed; boundary="------------QbVBSHwhpK0DNosr701TSjzS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <919fd8ba-40f5-11e4-e0f2-cb48fe29136c@suse.com>
Subject: Re: [MINIOS PATCH v3 03/12] use alloc_file_type() and
 get_file_from_fd() in xs
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-4-jgross@suse.com>
 <44a8d75f-718c-ce72-4b5e-cd67df6087be@srcf.net>
In-Reply-To: <44a8d75f-718c-ce72-4b5e-cd67df6087be@srcf.net>

--------------QbVBSHwhpK0DNosr701TSjzS
Content-Type: multipart/mixed; boundary="------------fZRF4F45JwJoJR7GGdKXfzaA"

--------------fZRF4F45JwJoJR7GGdKXfzaA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjIgMTU6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE2LzAxLzIw
MjIgMDg6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvbGliL3hz
LmMgYi9saWIveHMuYw0KPj4gaW5kZXggNGFmMGY5NjAuLmMxMjM0MWFhIDEwMDY0NA0KPj4g
LS0tIGEvbGliL3hzLmMNCj4+ICsrKyBiL2xpYi94cy5jDQo+PiBAQCAtMTgsMjMgKzE4LDU2
IEBAIHN0YXRpYyBpbmxpbmUgaW50IF94c19maWxlbm8oc3RydWN0IHhzX2hhbmRsZSAqaCkg
ew0KPj4gICAgICAgcmV0dXJuIChpbnRwdHJfdCkgaDsNCj4+ICAgfQ0KPj4gICANCj4+ICtz
dGF0aWMgaW50IHhzX2Nsb3NlX2ZkKHN0cnVjdCBmaWxlICpmaWxlKQ0KPj4gK3sNCj4+ICsg
ICAgc3RydWN0IHhlbmJ1c19ldmVudCAqZXZlbnQsICpuZXh0Ow0KPj4gKw0KPj4gKyAgICBm
b3IgKGV2ZW50ID0gZmlsZS0+ZGV2OyBldmVudDsgZXZlbnQgPSBuZXh0KQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBuZXh0ID0gZXZlbnQtPm5leHQ7DQo+PiArICAgICAgICBmcmVlKGV2
ZW50KTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGJvb2wgeHNfY2FuX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUpDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gZmlsZSAmJiBmaWxlLT5kZXY7DQo+IA0KPiBKdXN0ICdyZXR1
cm4gZmlsZS0+ZGV2OycgPw0KDQpZZXMuDQoNCj4gDQo+PiBAQCAtMTY5LDE4ICsyMDIsMjAg
QEAgY2hhciAqKnhzX2RpcmVjdG9yeShzdHJ1Y3QgeHNfaGFuZGxlICpoLCB4c190cmFuc2Fj
dGlvbl90IHQsDQo+PiAgIA0KPj4gICBib29sIHhzX3dhdGNoKHN0cnVjdCB4c19oYW5kbGUg
KmgsIGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnRva2VuKQ0KPj4gICB7DQo+PiAt
ICAgIGludCBmZCA9IF94c19maWxlbm8oaCk7DQo+PiArICAgIHN0cnVjdCBmaWxlICpmaWxl
ID0gZ2V0X2ZpbGVfZnJvbV9mZChfeHNfZmlsZW5vKGgpKTsNCj4+ICsNCj4+ICAgICAgIHBy
aW50aygieHNfd2F0Y2goJXMsICVzKVxuIiwgcGF0aCwgdG9rZW4pOw0KPj4gICAgICAgcmV0
dXJuIHhzX2Jvb2woeGVuYnVzX3dhdGNoX3BhdGhfdG9rZW4oWEJUX05VTEwsIHBhdGgsIHRv
a2VuLA0KPj4gLSAgICAgICAgICAgICAgICAgICAoeGVuYnVzX2V2ZW50X3F1ZXVlICopJmZp
bGVzW2ZkXS5kZXYpKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgKHhlbmJ1c19ldmVudF9x
dWV1ZSAqKSZmaWxlLT5kZXYpKTsNCj4gDQo+IFRoaXMgaXMgdXR0ZXJseSBtYWQuwqAgSW4g
cGFydGljdWxhciwgY2xvc2UoKSBsb29rcyB0byBiZSB2ZXJ5IHJhY3kgd2l0aA0KPiBuZXcg
d2F0Y2hlcyBhcnJpdmluZy4NCg0KSW4gcHJhY3RpY2UgaXQgc2hvdWxkIGJlIG5vIHByb2Js
ZW0sIHRob3VnaCAoY2xvc2luZyB0aGUgZmlsZSBpbiBvbmUNCnRocmVhZCB3aGlsZSB0aGUg
b3RoZXIgb25lIGlzIGFkZGluZyBhIHdhdGNoIHdvdWxkIGJlIHJhdGhlciBzdHJhbmdlKS4N
Cg0KQWRkaXRpb25hbGx5IGNsb3NlKCkgZm9yIHhlbmJ1cyBpbiBNaW5pLU9TIGlzIGNhbGxl
ZCBvbmx5IHdoZW4gc3RvcHBpbmcNCnRoZSBkb21haW4gdG9kYXkuDQoNCj4gSG93ZXZlciwg
Y2FuIHRoZSBpbmRlbnRhdGlvbiBhdCBsZWFzdCBiZSBmaXhlZCBoZXJlIGFzIHRoZSBsaW5l
IGlzDQo+IGNoYW5naW5nLsKgIFRoYXQncyBhIHBhcmFtZXRlciB0byB4ZW5idXNfd2F0Y2hf
cGF0aF90b2tlbigpLCBub3QgeHNfYm9vbCgpLg0KDQpZZXMsIHRoYXQgc2hvdWxkIGJlIGRv
bmUuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuYnVzL3hlbmJ1cy5jIGIveGVuYnVzL3hl
bmJ1cy5jDQo+PiBpbmRleCBiNjg3Njc4Zi4uNzg1Mzg5ZmIgMTAwNjQ0DQo+PiAtLS0gYS94
ZW5idXMveGVuYnVzLmMNCj4+ICsrKyBiL3hlbmJ1cy94ZW5idXMuYw0KPj4gQEAgLTM5Myw2
ICszOTMsNyBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX3hlbmJ1c19pZCh2b2lkKQ0KPj4gICB2
b2lkIGluaXRfeGVuYnVzKHZvaWQpDQo+PiAgIHsNCj4+ICAgICAgIGludCBlcnI7DQo+PiAr
DQo+IA0KPiBTcHVyaW91cyBodW5rPw0KDQpZZXMuDQoNCg0KSnVlcmdlbg0K
--------------fZRF4F45JwJoJR7GGdKXfzaA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------fZRF4F45JwJoJR7GGdKXfzaA--

--------------QbVBSHwhpK0DNosr701TSjzS--

--------------yqXgzFfgQBlIPCz66Gny16Le
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHm1IMFAwAAAAAACgkQsN6d1ii/Ey8k
CQf9FsCXFo47IY8bBPFR9XlpCHae3WH6DWTTzvZ9E4ZNWXtu5LHMze0TRGF5DYpcGirkGlwia00E
VkBICoWb02RIg4QkBYqblST5ij3Ity8/0eVcpwyFal55IkOXG3pk6LFtrHaXXLK4gWYPXvPiuZBy
lTZw6PqEZASvy7FoacM+Kn7tYDv4wGlfTeWWIqCALqrKzW1NKwInAU0M4h+EwxVnbkCdN03JCvWf
4OdntoEktgFPJzzCXAcXULmp9VYQS4HW6pmj65y5ZBFJTFHwhNokTM35JSgBeBZzHB5caQaOHJ6C
V5TsIpxj1oepHPq1WTxu82l1IyC6uBC7AT+HONam6A==
=ONXC
-----END PGP SIGNATURE-----

--------------yqXgzFfgQBlIPCz66Gny16Le--

