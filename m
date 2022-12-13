Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6764B00D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 07:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460197.718065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zAX-0000Y3-UH; Tue, 13 Dec 2022 06:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460197.718065; Tue, 13 Dec 2022 06:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zAX-0000Vz-RH; Tue, 13 Dec 2022 06:53:37 +0000
Received: by outflank-mailman (input) for mailman id 460197;
 Tue, 13 Dec 2022 06:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4zAV-0000Vt-T7
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 06:53:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dce63a9f-7ab2-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 07:53:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76FFA1FD94;
 Tue, 13 Dec 2022 06:53:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5116A138EE;
 Tue, 13 Dec 2022 06:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 959eEm4hmGNjcQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 06:53:34 +0000
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
X-Inumbo-ID: dce63a9f-7ab2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670914414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ggzbBigaNqlhTWhYmOvix+BPDdQRNG8jaJkGixuGa+Q=;
	b=MCEeuymX7nOV4ywcKu2a2HYQ00nykY1vp1R/cBjFz26WzYSmVEctoJWgO5SnXq+1lal2YQ
	+NyH9U+IoiZSs0zi2kz2JSR5JIIe5ZDm4SveHH/273Czq6EvASbEL/MNOPuErbLy7SiPVc
	qGd8kwqVzG9ARyAM8S/sxWOXQyKz9Ko=
Message-ID: <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
Date: Tue, 13 Dec 2022 07:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Yk19tQwwqAx7VNywqHh2cxDV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Yk19tQwwqAx7VNywqHh2cxDV
Content-Type: multipart/mixed; boundary="------------K5aF7uti3x0XOx0OeX7XEkLF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
In-Reply-To: <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>

--------------K5aF7uti3x0XOx0OeX7XEkLF
Content-Type: multipart/mixed; boundary="------------qVwHpCUPONDr0Wye3q2lKyoP"

--------------qVwHpCUPONDr0Wye3q2lKyoP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMjI6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiDC
oCBzdGF0aWMgYm9vbCBjaGVja19pbmRleGVzKFhFTlNUT1JFX1JJTkdfSURYIGNvbnMsIFhF
TlNUT1JFX1JJTkdfSURYIHByb2QpDQo+PiBAQCAtNDkyLDggKzUwNCwxMiBAQCBzdGF0aWMg
c3RydWN0IGRvbWFpbiANCj4+ICpmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbih1bnNp
Z25lZCBpbnQgZG9taWQpDQo+PiDCoMKgwqDCoMKgIHhjX2RvbWluZm9fdCBkb21pbmZvOw0K
Pj4gwqDCoMKgwqDCoCBkb21haW4gPSBmaW5kX2RvbWFpbl9zdHJ1Y3QoZG9taWQpOw0KPj4g
LcKgwqDCoCBpZiAoIWRvbWFpbiAmJiBnZXRfZG9tYWluX2luZm8oZG9taWQsICZkb21pbmZv
KSkNCj4+IC3CoMKgwqDCoMKgwqDCoCBkb21haW4gPSBhbGxvY19kb21haW4oTlVMTCwgZG9t
aWQpOw0KPj4gK8KgwqDCoCBpZiAoIWRvbWFpbikgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghZ2V0X2RvbWFpbl9pbmZvKGRvbWlkLCAmZG9taW5mbykpDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlcnJubyA9IEVOT0VOVDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW4gPSBhbGxvY19kb21haW4oTlVMTCwg
ZG9taWQpOw0KPj4gK8KgwqDCoCB9DQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRo
aXMgY2hhbmdlIGlzIHJlbGF0ZWQgdG8gdGhpcyBjb21taXQuDQoNCkl0IGlzIGRpcmVjdGx5
IHJlbGF0ZWQgdG8gdGhlIGh1bmsgYmVsb3cuIFJldHVybmluZyBlcnJubyBpbg0KYWNjX2Fk
ZF9kb21fbmJlbnRyeSgpIHJlcXVpcmVzIGl0IHRvIGJlIHNldCBjb3JyZWN0bHkgaW4NCmZp
bmRfb3JfYWxsb2NfZXhpc3RpbmdfZG9tYWluKCkuDQoNCkknbGwgYWRkIGEgcmVtYXJrIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiANCj4gWy4uLl0NCj4gDQo+PiAraW50IGFjY19h
ZGRfZG9tX25iZW50cnkoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFk
LCBpbnQgdmFsLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGRv
bWlkKQ0KPj4gK3sNCj4+ICvCoMKgwqAgc3RydWN0IGNoYW5nZWRfZG9tYWluICpjZDsNCj4+
ICsNCj4+ICvCoMKgwqAgY2QgPSBhY2NfZ2V0X2NoYW5nZWRfZG9tYWluKGN0eCwgaGVhZCwg
ZG9taWQpOw0KPj4gK8KgwqDCoCBpZiAoIWNkKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBlcnJubzsNCj4+ICsNCj4+ICvCoMKgwqAgY2QtPm5iZW50cnkgKz0gdmFsOw0KPiANCj4g
QXMgYSBmdXR1cmUgaW1wcm92ZW1lbnQsIGl0IHdvdWxkIGJlIHdvcnRoIGNvbnNpZGVyaW5n
IHRvIGNoZWNrIGZvciANCj4gdW5kZXJmbG93L292ZXJmbG93Lg0KDQpEbyB5b3UgcmVhbGx5
IHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJlIG5vdCB0byBhZGQvcmVtb3ZlIG1vcmUgdGhh
bg0KMiBiaWxsaW9uIG5vZGVzIG93bmVkIGJ5IGEgc2luZ2xlIGRvbWFpbj8NCg0KDQpKdWVy
Z2VuDQo=
--------------qVwHpCUPONDr0Wye3q2lKyoP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qVwHpCUPONDr0Wye3q2lKyoP--

--------------K5aF7uti3x0XOx0OeX7XEkLF--

--------------Yk19tQwwqAx7VNywqHh2cxDV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYIW0FAwAAAAAACgkQsN6d1ii/Ey9q
jAf+JK9Fsw+jnKLctfOe00ReOWJSgZA/HZB24cQmRPrEh9xXXNx1/zeJbwSO0rMxPkFXBkCFHmSr
p3xxS5YFG6YQdsb0LLo91Q0vUIyTTMI7Tee4FReWSCN0RHOCqjQlFQ9iiKQLcG3pfdF10S7dkcAF
FRpcLpYCyZoPcwNbVWXCU4rpupY0/8PnadjSGXd+zqBLqD+bEeI6IY9Vd08UNR0dg3JjJND+WmmU
R73pro5YSHhDRPNW3rBsBLf12t0WkmboH89CJ1sHsDkbdU7FxI7R10kASf61rgyXjOij/qmchgnt
NvNT0dbkoczHeENak9ti2Vj8EKD+wj5lsF5EZPWvEg==
=Wkzl
-----END PGP SIGNATURE-----

--------------Yk19tQwwqAx7VNywqHh2cxDV--

