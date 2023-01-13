Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAD6699F1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 15:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477375.740073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKvC-0003yP-EC; Fri, 13 Jan 2023 14:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477375.740073; Fri, 13 Jan 2023 14:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKvC-0003vk-AK; Fri, 13 Jan 2023 14:20:42 +0000
Received: by outflank-mailman (input) for mailman id 477375;
 Fri, 13 Jan 2023 14:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pGKvA-0003vc-Dc
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 14:20:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7421f966-934d-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 15:20:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE4B16B5B2;
 Fri, 13 Jan 2023 14:20:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEFEA1358A;
 Fri, 13 Jan 2023 14:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CvoaKbVowWM7FQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Jan 2023 14:20:37 +0000
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
X-Inumbo-ID: 7421f966-934d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673619637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M55lXHF5YsSdUG/Me3dcSgrQaqLgE3puKEayCSDhibc=;
	b=KvvrhBhBCxHA+uo+pnzMYt6lyxfpHUn58mvV21jqWKoKcZqS1vDCEjig02RMrXWDwtgD2S
	v9QBA/inqJt46/e2EXnj3//KuLirBLkxSyWzq3LUra6yOolqYJJp1hz/w/SPSfngXGHCD+
	NYSLY0hmlIQZbf4rBlTeh37LRv+yjrA=
Message-ID: <47ae3bbb-6468-4282-1789-72eedaa54814@suse.com>
Date: Fri, 13 Jan 2023 15:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
References: <Y8DIodWQGm99RA+E@mail-itl>
 <bdea54df-59dc-3d4d-dd0c-8c45403dea24@suse.com> <Y8FgQyVvpUXqumvS@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Y8FgQyVvpUXqumvS@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6kkXqBrUY0FyOXKni8Ph3nMz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6kkXqBrUY0FyOXKni8Ph3nMz
Content-Type: multipart/mixed; boundary="------------0ddX8tnnEtC6EZA20X32Cia6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
Message-ID: <47ae3bbb-6468-4282-1789-72eedaa54814@suse.com>
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3
References: <Y8DIodWQGm99RA+E@mail-itl>
 <bdea54df-59dc-3d4d-dd0c-8c45403dea24@suse.com> <Y8FgQyVvpUXqumvS@mail-itl>
In-Reply-To: <Y8FgQyVvpUXqumvS@mail-itl>

--------------0ddX8tnnEtC6EZA20X32Cia6
Content-Type: multipart/mixed; boundary="------------BtFof0gK3r9ZHyWf2ElM4AQq"

--------------BtFof0gK3r9ZHyWf2ElM4AQq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDEuMjMgMTQ6NDQsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gQnV0LCB1bnJlbGF0ZWQgdG8gdGhpcyBidWcsIGl0IGRpZCBnZXQgbWVzc2FnZSBsaWtl
IGluIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnL21zZzEwNzYwOS5odG1sDQo+IChXQVJOSU5HOiBDUFU6IDEgUElEOiAwIGF0
IGFyY2gveDg2L21tL3RsYi5jOjUyMyBzd2l0Y2hfbW1faXJxc19vZmYrMHgyMzAvMHg0YTAp
DQo+IA0KDQpIbW0sIGlzIGFwcGx5aW5nIHRoZSBhdHRhY2hlZCBwYXRjaCBtYWtpbmcgYW55
IGRpZmZlcmVuY2UgaGVyZT8NCg0KDQpKdWVyZ2VuDQo=
--------------BtFof0gK3r9ZHyWf2ElM4AQq
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-x86-xen-don-t-let-xen_pv_play_dead-return.patch"
Content-Disposition: attachment;
 filename="0001-x86-xen-don-t-let-xen_pv_play_dead-return.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNGNiMDQyOWUxZDZkNGNhNDI3MDVkOTcyMTY4MjQyMGFlMDUzODUxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
ClRvOiB4ODZAa2VybmVsLm9yZwpUbzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNj
OiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KQ2M6IERhdmUgSGFuc2VuIDxkYXZl
LmhhbnNlbkBsaW51eC5pbnRlbC5jb20+CkNjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0
b3IuY29tPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkRhdGU6IFRodSwg
MjQgTm92IDIwMjIgMDg6MDk6NDUgKzAxMDAKU3ViamVjdDogW1BBVENIIDEvMl0geDg2L3hl
bjogZG9uJ3QgbGV0IHhlbl9wdl9wbGF5X2RlYWQoKSByZXR1cm4KCkEgZnVuY3Rpb24gY2Fs
bGVkIHZpYSB0aGUgcGFyYXZpcnQgcGxheV9kZWFkKCkgaG9vayBzaG91bGQgbm90IHJldHVy
bgp0byB0aGUgY2FsbGVyLgoKeGVuX3B2X3BsYXlfZGVhZCgpIGhhcyBhIHByb2JsZW0gaW4g
dGhpcyByZWdhcmQsIGFzIGl0IGN1cnJlbnRseSB3aWxsCnJldHVybiBpbiBjYXNlIGFuIG9m
ZmxpbmVkIGNwdSBpcyBicm91Z2h0IHRvIGxpZmUgYWdhaW4uIFRoaXMgY2FuIGJlCmNoYW5n
ZWQgb25seSBieSBkb2luZyBiYXNpY2FsbHkgYSBsb25nam1wKCkgdG8gY3B1X2JyaW5ndXBf
YW5kX2lkbGUoKSwKYXMgdGhlIGh5cGVyY2FsbCBmb3IgYnJpbmdpbmcgZG93biB0aGUgY3B1
IHdpbGwganVzdCByZXR1cm4gd2hlbiB0aGUKY3B1IGlzIGNvbWluZyB1cCBhZ2Fpbi4gSnVz
dCByZS1pbml0aWFsaXppbmcgdGhlIGNwdSBpc24ndCBwb3NzaWJsZSwKYXMgdGhlIFhlbiBo
eXBlcnZpc29yIHdpbGwgZGVueSB0aGF0IG9wZXJhdGlvbi4KClNvIGludHJvZHVjZSB4ZW5f
Y3B1X2JyaW5ndXBfYWdhaW4oKSByZXNldHRpbmcgdGhlIHN0YWNrIGFuZCBjYWxsaW5nCmNw
dV9icmluZ3VwX2FuZF9pZGxlKCksIHdoaWNoIGNhbiBiZSBjYWxsZWQgYWZ0ZXIgSFlQRVJW
SVNPUl92Y3B1X29wKCkKaW4geGVuX3B2X3BsYXlfZGVhZCgpLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGFyY2gveDg2L3hlbi9zbXAu
aCAgICAgIHwgIDIgKysKIGFyY2gveDg2L3hlbi9zbXBfcHYuYyAgIHwgMTMgKystLS0tLS0t
LS0tLQogYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCAgNyArKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi9zbXAuaCBiL2FyY2gveDg2L3hlbi9zbXAuaAppbmRleCBiZDAyZjlk
NTAxMDcuLjZlOTBhMzEyMDY3YiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3NtcC5oCisr
KyBiL2FyY2gveDg2L3hlbi9zbXAuaApAQCAtMjEsNiArMjEsOCBAQCB2b2lkIHhlbl9zbXBf
c2VuZF9yZXNjaGVkdWxlKGludCBjcHUpOwogdm9pZCB4ZW5fc21wX3NlbmRfY2FsbF9mdW5j
dGlvbl9pcGkoY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2spOwogdm9pZCB4ZW5fc21wX3Nl
bmRfY2FsbF9mdW5jdGlvbl9zaW5nbGVfaXBpKGludCBjcHUpOwogCit2b2lkIHhlbl9jcHVf
YnJpbmd1cF9hZ2Fpbih1bnNpZ25lZCBsb25nIHN0YWNrKTsKKwogc3RydWN0IHhlbl9jb21t
b25faXJxIHsKIAlpbnQgaXJxOwogCWNoYXIgKm5hbWU7CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4vc21wX3B2LmMgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKaW5kZXggNDgwYmU4MmU5
YjdiLi5iNDBiMjQzODJmZTMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9zbXBfcHYuYwor
KysgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKQEAgLTM4NSwxNyArMzg1LDggQEAgc3RhdGlj
IHZvaWQgeGVuX3B2X3BsYXlfZGVhZCh2b2lkKSAvKiB1c2VkIG9ubHkgd2l0aCBIT1RQTFVH
X0NQVSAqLwogewogCXBsYXlfZGVhZF9jb21tb24oKTsKIAlIWVBFUlZJU09SX3ZjcHVfb3Ao
VkNQVU9QX2Rvd24sIHhlbl92Y3B1X25yKHNtcF9wcm9jZXNzb3JfaWQoKSksIE5VTEwpOwot
CWNwdV9icmluZ3VwKCk7Ci0JLyoKLQkgKiBjb21taXQgNGIwYzBmMjk0ICh0aWNrOiBDbGVh
bnVwIE5PSFogcGVyIGNwdSBkYXRhIG9uIGNwdSBkb3duKQotCSAqIGNsZWFycyBjZXJ0YWlu
IGRhdGEgdGhhdCB0aGUgY3B1X2lkbGUgbG9vcCAod2hpY2ggY2FsbGVkIHVzCi0JICogYW5k
IHRoYXQgd2UgcmV0dXJuIGZyb20pIGV4cGVjdHMuIFRoZSBvbmx5IHdheSB0byBnZXQgdGhh
dAotCSAqIGRhdGEgYmFjayBpcyB0byBjYWxsOgotCSAqLwotCXRpY2tfbm9oel9pZGxlX2Vu
dGVyKCk7Ci0JdGlja19ub2h6X2lkbGVfc3RvcF90aWNrX3Byb3RlY3RlZCgpOwotCi0JY3B1
aHBfb25saW5lX2lkbGUoQ1BVSFBfQVBfT05MSU5FX0lETEUpOworCXhlbl9jcHVfYnJpbmd1
cF9hZ2FpbigodW5zaWduZWQgbG9uZyl0YXNrX3B0X3JlZ3MoY3VycmVudCkpOworCUJVRygp
OwogfQogCiAjZWxzZSAvKiAhQ09ORklHX0hPVFBMVUdfQ1BVICovCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4veGVuLWhlYWQuUyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TCmluZGV4
IGZmYWE2MjE2N2Y2ZS4uZTM2ZWE0MjY4YmQyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4v
eGVuLWhlYWQuUworKysgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwpAQCAtNzYsNiArNzYs
MTMgQEAgU1lNX0NPREVfU1RBUlQoYXNtX2NwdV9icmluZ3VwX2FuZF9pZGxlKQogCiAJY2Fs
bCBjcHVfYnJpbmd1cF9hbmRfaWRsZQogU1lNX0NPREVfRU5EKGFzbV9jcHVfYnJpbmd1cF9h
bmRfaWRsZSkKKworU1lNX0NPREVfU1RBUlQoeGVuX2NwdV9icmluZ3VwX2FnYWluKQorCVVO
V0lORF9ISU5UX0ZVTkMKKwltb3YJJXJkaSwgJXJzcAorCVVOV0lORF9ISU5UX1JFR1MKKwlj
YWxsCWNwdV9icmluZ3VwX2FuZF9pZGxlCitTWU1fQ09ERV9FTkQoeGVuX2NwdV9icmluZ3Vw
X2FnYWluKQogLnBvcHNlY3Rpb24KICNlbmRpZgogI2VuZGlmCi0tIAoyLjM1LjMKCg==
--------------BtFof0gK3r9ZHyWf2ElM4AQq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BtFof0gK3r9ZHyWf2ElM4AQq--

--------------0ddX8tnnEtC6EZA20X32Cia6--

--------------6kkXqBrUY0FyOXKni8Ph3nMz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPBaLUFAwAAAAAACgkQsN6d1ii/Ey+k
fwf+OdNpyCt6DMLy99a9gW+UhF27kdatyu7MnA5mGXxbNBnr0ZfUsg1M0VFJkeM2e0C0STU7DBJG
vDdQKFZ572UQguil51eXR+oQjarRxzuIqsrhEguyZEiwEa1vnDTXS2aUBxYXBjyKIUzUyGNS9DZu
hMZF+eGGRIvy+515Y4KmZL1t+IuMBogSDzxDHTeh6f2ee2N+2BxTbzTCiPdODnkoneKAuJrlyEPV
OSaP23Qo26JOWaOXj3cMMVpraSgMdy7xwjHx2qUDUyLJIVoBD6h0C9BNDILvFfGsikfSmOVrzNIh
u408UF4+M3aAzZacLkdCP8SAn4nmdYb+yYl0YpMCGQ==
=fJb/
-----END PGP SIGNATURE-----

--------------6kkXqBrUY0FyOXKni8Ph3nMz--

