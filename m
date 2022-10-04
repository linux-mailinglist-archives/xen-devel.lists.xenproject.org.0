Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BE5F46C6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 17:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415633.660248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjvn-0007BI-7n; Tue, 04 Oct 2022 15:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415633.660248; Tue, 04 Oct 2022 15:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofjvn-00079E-4k; Tue, 04 Oct 2022 15:34:03 +0000
Received: by outflank-mailman (input) for mailman id 415633;
 Tue, 04 Oct 2022 15:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l35h=2F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ofjvl-000798-HS
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 15:34:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f784325d-43f9-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 17:34:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71314219D0;
 Tue,  4 Oct 2022 15:33:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 287E4139D2;
 Tue,  4 Oct 2022 15:33:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nQ6BCGdSPGOcFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 04 Oct 2022 15:33:59 +0000
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
X-Inumbo-ID: f784325d-43f9-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664897639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KeymIVaGafrJIHZyo5++21QSxp0G9zyZeB6JP1kkd+o=;
	b=nAR7+6qiqh57XwuW/8vSCHb92+p9IqULp7uw66/oQc/ofwVCOjtLcR083OjsJmd3WTzIwh
	AQlmbO+fUZAWA/f/v9uwff83fg+BoofayGVwHzYXLtjT8CWito06xWDbBGxt3h7oAIxcDb
	od5MFgIolI8UlQkumbQLn0NxIyd5gS4=
Message-ID: <ee01b8d6-ee0c-b17d-1969-4aed41fa8666@suse.com>
Date: Tue, 4 Oct 2022 17:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/3] xen/pv: refactor msr access functions to support
 safe and unsafe accesses
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20221004084335.2838-1-jgross@suse.com>
 <20221004084335.2838-3-jgross@suse.com>
 <623a323c-943b-8c69-f877-a0669b9672dc@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <623a323c-943b-8c69-f877-a0669b9672dc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8VLduLm00hOTbdgspvNT7QtY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8VLduLm00hOTbdgspvNT7QtY
Content-Type: multipart/mixed; boundary="------------5W5T68iAuXvtxEbEyzgWaqVc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <ee01b8d6-ee0c-b17d-1969-4aed41fa8666@suse.com>
Subject: Re: [PATCH v2 2/3] xen/pv: refactor msr access functions to support
 safe and unsafe accesses
References: <20221004084335.2838-1-jgross@suse.com>
 <20221004084335.2838-3-jgross@suse.com>
 <623a323c-943b-8c69-f877-a0669b9672dc@suse.com>
In-Reply-To: <623a323c-943b-8c69-f877-a0669b9672dc@suse.com>

--------------5W5T68iAuXvtxEbEyzgWaqVc
Content-Type: multipart/mixed; boundary="------------L5DKmkRAuf0Cox0zaXser4Az"

--------------L5DKmkRAuf0Cox0zaXser4Az
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTAuMjIgMTM6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4xMC4yMDIy
IDEwOjQzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gUmVmYWN0b3IgYW5kIHJlbmFtZSB4
ZW5fcmVhZF9tc3Jfc2FmZSgpIGFuZCB4ZW5fd3JpdGVfbXNyX3NhZmUoKSB0bw0KPj4gc3Vw
cG9ydCBib3RoIGNhc2VzIG9mIE1TUiBhY2Nlc3Nlcywgc2FmZSBvbmVzIGFuZCBwb3RlbnRp
YWxseSBHUC1mYXVsdA0KPj4gZ2VuZXJhdGluZyBvbmVzLg0KPj4NCj4+IFRoaXMgd2lsbCBw
cmVwYXJlIHRvIG5vIGxvbmdlciBzd2FsbG93IEdQcyBzaWxlbnRseSBpbiB4ZW5fcmVhZF9t
c3IoKQ0KPj4gYW5kIHhlbl93cml0ZV9tc3IoKS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gQWxiZWl0IC4uLg0KPiANCj4+
IEBAIC05MzMsMjMgKzkzNywzOSBAQCBzdGF0aWMgdTY0IHhlbl9yZWFkX21zcl9zYWZlKHVu
c2lnbmVkIGludCBtc3IsIGludCAqZXJyKQ0KPj4gICAJcmV0dXJuIHZhbDsNCj4+ICAgfQ0K
Pj4gICANCj4+IC1zdGF0aWMgaW50IHhlbl93cml0ZV9tc3Jfc2FmZSh1bnNpZ25lZCBpbnQg
bXNyLCB1bnNpZ25lZCBsb3csIHVuc2lnbmVkIGhpZ2gpDQo+PiArc3RhdGljIHZvaWQgc2V0
X3NlZyh1bnNpZ25lZCBpbnQgd2hpY2gsIHVuc2lnbmVkIGludCBsb3csIHVuc2lnbmVkIGlu
dCBoaWdoLA0KPj4gKwkJICAgIGludCAqZXJyKQ0KPj4gICB7DQo+PiAtCWludCByZXQ7DQo+
PiAtCXVuc2lnbmVkIGludCB3aGljaDsNCj4+IC0JdTY0IGJhc2U7DQo+PiArCXU2NCBiYXNl
ID0gKCh1NjQpaGlnaCA8PCAzMikgfCBsb3c7DQo+PiArDQo+PiArCWlmIChIWVBFUlZJU09S
X3NldF9zZWdtZW50X2Jhc2Uod2hpY2gsIGJhc2UpID09IDApDQo+PiArCQlyZXR1cm47DQo+
PiAgIA0KPj4gLQlyZXQgPSAwOw0KPj4gKwlpZiAoZXJyKQ0KPj4gKwkJKmVyciA9IC1FSU87
DQo+IA0KPiAuLi4gSSBkb24ndCBzZWUgYSBnb29kIHJlYXNvbiB0byBvdmVycmlkZSB0aGUg
ZXJyb3IgY29kZSBoYW5kZWQgdG8gdXMNCj4gYnkgdGhlIGh5cGVydmlzb3IgaGVyZTsgSSBk
byByZWFsaXplIHRob3VnaCB0aGF0IHRoaXMgLi4uDQo+IA0KPj4gKwllbHNlDQo+PiArCQlX
QVJOKDEsICJYZW4gc2V0X3NlZ21lbnRfYmFzZSgldSwgJWxseCkgZmFpbGVkXG4iLCB3aGlj
aCwgYmFzZSk7DQo+PiArfQ0KPj4gICANCj4+ICsvKg0KPj4gKyAqIFN1cHBvcnQgd3JpdGVf
bXNyX3NhZmUoKSBhbmQgd3JpdGVfbXNyKCkgc2VtYW50aWNzLg0KPj4gKyAqIFdpdGggZXJy
ID09IE5VTEwgd3JpdGVfbXNyKCkgc2VtYW50aWNzIGFyZSBzZWxlY3RlZC4NCj4+ICsgKiBT
dXBwbHlpbmcgYW4gZXJyIHBvaW50ZXIgcmVxdWlyZXMgZXJyIHRvIGJlIHByZS1pbml0aWFs
aXplZCB3aXRoIDAuDQo+PiArICovDQo+PiArc3RhdGljIHZvaWQgeGVuX2RvX3dyaXRlX21z
cih1bnNpZ25lZCBpbnQgbXNyLCB1bnNpZ25lZCBpbnQgbG93LA0KPj4gKwkJCSAgICAgdW5z
aWduZWQgaW50IGhpZ2gsIGludCAqZXJyKQ0KPj4gK3sNCj4+ICAgCXN3aXRjaCAobXNyKSB7
DQo+PiAtCWNhc2UgTVNSX0ZTX0JBU0U6CQl3aGljaCA9IFNFR0JBU0VfRlM7IGdvdG8gc2V0
Ow0KPj4gLQljYXNlIE1TUl9LRVJORUxfR1NfQkFTRToJd2hpY2ggPSBTRUdCQVNFX0dTX1VT
RVI7IGdvdG8gc2V0Ow0KPj4gLQljYXNlIE1TUl9HU19CQVNFOgkJd2hpY2ggPSBTRUdCQVNF
X0dTX0tFUk5FTDsgZ290byBzZXQ7DQo+PiAtDQo+PiAtCXNldDoNCj4+IC0JCWJhc2UgPSAo
KHU2NCloaWdoIDw8IDMyKSB8IGxvdzsNCj4+IC0JCWlmIChIWVBFUlZJU09SX3NldF9zZWdt
ZW50X2Jhc2Uod2hpY2gsIGJhc2UpICE9IDApDQo+PiAtCQkJcmV0ID0gLUVJTzsNCj4gDQo+
IC4uLiB3YXMgdGhpcyB3YXkgYmVmb3JlLg0KDQpBbmQgb24gYmFyZSBtZXRhbCB3cml0ZV9t
c3Jfc2FmZSgpIHdpbGwgcmV0dXJuIC1FSU8sIHRvby4NCg0KDQpKdWVyZ2VuDQo=
--------------L5DKmkRAuf0Cox0zaXser4Az
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------L5DKmkRAuf0Cox0zaXser4Az--

--------------5W5T68iAuXvtxEbEyzgWaqVc--

--------------8VLduLm00hOTbdgspvNT7QtY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM8UmYFAwAAAAAACgkQsN6d1ii/Ey/M
sAf9Gcrj/DfNrlLk96AprHuUi7ZmLAl179OybZUv2dezchHykmmDFVw67IoYuYZznQfhr7zMSWjT
VMYnVJa0HVnLT8gvnwdHJNq1pQHUE9v8UfIgECyvBhLoF8iy1vb3zkz8zpaVuSEL8rrPdA7QHffa
1aAxJ/PwuJQH1Lkk+a5sSVjiF9EukKycOyQ3y0b8oJeGtL1ZIU/OWRY02MvgYtOwvxPe+y6XGfW6
d6SlCQ+8ShZRCVaCoR50OZENp9yAHpRbu8DHRdPCfyD6vgRc70pTbvfoG4jWVm+fqMO9aOS8K/Jg
6Dc+aaMsldr+wsncr13gsovzk1NlU95foqHlh+zlOg==
=m+RX
-----END PGP SIGNATURE-----

--------------8VLduLm00hOTbdgspvNT7QtY--

