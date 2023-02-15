Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B86D697B6C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495915.766356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGXw-0004Hl-M8; Wed, 15 Feb 2023 12:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495915.766356; Wed, 15 Feb 2023 12:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGXw-0004Ej-In; Wed, 15 Feb 2023 12:06:00 +0000
Received: by outflank-mailman (input) for mailman id 495915;
 Wed, 15 Feb 2023 12:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pSGXu-0004EW-IH
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:05:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a25c237-ad29-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 13:05:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF0B8207CB;
 Wed, 15 Feb 2023 12:05:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A362513483;
 Wed, 15 Feb 2023 12:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WsZ1JqPK7GMzQAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Feb 2023 12:05:55 +0000
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
X-Inumbo-ID: 1a25c237-ad29-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676462755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+PkheF8hQEAxpcHBI1ZjXUyvfAs5BV4HCkW3WFbchw=;
	b=fROjidXyVIz3tNvMQrJJtfPssV0ZyIcC8JlY4BoGSpiHtqTI6C+jXxFJJaH7pgEwvXkcgE
	YMrY4pL2tTHy4z3zvq7rwTOmmIhuSyxabFfvs123GIL7HeOdFIxoTto1X4TvSNCpJeyLPv
	m6H1Cob9fC4Zt9p13CpLMxgC7AnDzFE=
Message-ID: <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
Date: Wed, 15 Feb 2023 13:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
In-Reply-To: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A6ze7oXFmJ8UvlBIzAo2fkuT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A6ze7oXFmJ8UvlBIzAo2fkuT
Content-Type: multipart/mixed; boundary="------------UNETlYYd9cw7AK9x3o0HrBD0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Message-ID: <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
In-Reply-To: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>

--------------UNETlYYd9cw7AK9x3o0HrBD0
Content-Type: multipart/mixed; boundary="------------0Ad47DS10VbCi1CsS7DNCHik"

--------------0Ad47DS10VbCi1CsS7DNCHik
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjMgMTI6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBGaXJzdCBvZiBhbGwg
ZHJvcCAzMi1iaXQgbGVmdG92ZXJzLCBpbmNsdWRpbmcgdGhlIGluY2x1c2lvbiBvZiB0aGUg
ZmlsZQ0KPiBmcm9tIGhlYWRfMzIuUy4NCg0KSSBkb24ndCBzZWUgd2h5IHdlIHdvdWxkIHdh
bnQgdG8gZHJvcCAzMi1iaXQgSFZNIGFuZCBQVkggc3VwcG9ydC4NCg0KPiBUaGVuIGZ1cnRo
ZXIgbW92ZSBQVi1vbmx5IEVMRiBub3RlcyBpbnNpZGUgdGhlIFhFTl9QVg0KPiBjb25kaXRp
b25hbC4gRmluYWxseSBoYXZlIHRoZSAic3VwcG9ydGVkIGZlYXR1cmVzIiBub3RlIGFjdHVh
bGx5IHJlcG9ydA0KPiByZWFsaXR5OiBBbGwgdGhyZWUgb2YgdGhlIGZlYXR1cmVzIGFyZSBz
dXBwb3J0ZWQgYW5kL29yIGFwcGxpY2FibGUgb25seQ0KPiBpbiBjZXJ0YWluIGNhc2VzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiANCj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2hlYWRfMzIuUw0KPiArKysgYi9hcmNoL3g4
Ni9rZXJuZWwvaGVhZF8zMi5TDQo+IEBAIC01MjQsOCArNTI0LDYgQEAgX19JTklUUk9EQVRB
DQo+ICAgaW50X21zZzoNCj4gICAJLmFzY2l6ICJVbmtub3duIGludGVycnVwdCBvciBmYXVs
dCBhdDogJXAgJXAgJXBcbiINCj4gICANCj4gLSNpbmNsdWRlICIuLi8uLi94ODYveGVuL3hl
bi1oZWFkLlMiDQo+IC0NCg0KVGhpcyBpcyB3cm9uZyBmb3Igbm9uLVBWIGNhc2VzLg0KDQo+
ICAgLyoNCj4gICAgKiBUaGUgSURUIGFuZCBHRFQgJ2Rlc2NyaXB0b3JzJyBhcmUgYSBzdHJh
bmdlIDQ4LWJpdCBvYmplY3QNCj4gICAgKiBvbmx5IHVzZWQgYnkgdGhlIGxpZHQgYW5kIGxn
ZHQgaW5zdHJ1Y3Rpb25zLiBUaGV5IGFyZSBub3QNCj4gLS0tIGEvYXJjaC94ODYveGVuL3hl
bi1oZWFkLlMNCj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMNCj4gQEAgLTgzLDI3
ICs4MywzMyBAQCBTWU1fQ09ERV9FTkQoYXNtX2NwdV9icmluZ3VwX2FuZF9pZGxlKQ0KPiAg
IAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfR1VFU1RfT1MsICAgICAgIC5hc2NpeiAibGlu
dXgiKQ0KPiAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfR1VFU1RfVkVSU0lPTiwgIC5h
c2NpeiAiMi42IikNCj4gICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1hFTl9WRVJTSU9O
LCAgICAuYXNjaXogInhlbi0zLjAiKQ0KPiAtI2lmZGVmIENPTkZJR19YODZfMzINCj4gLQlF
TEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfVklSVF9CQVNFLCAgICAgIF9BU01fUFRSIF9fUEFH
RV9PRkZTRVQpDQo+IC0jZWxzZQ0KPiAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfVklS
VF9CQVNFLCAgICAgIF9BU01fUFRSIF9fU1RBUlRfS0VSTkVMX21hcCkNCg0KVGhpcyB3aWxs
IGJlIHdyb25nIGZvciAzMi1iaXQgZ3Vlc3RzIG5vdy4gSSdtIG5vdCBzdXJlIHRoZSB2YWx1
ZSBpcyByZWFsbHkNCnVzZWQgaW4gWGVuIGZvciBub24tUFYgZ3Vlc3RzLCB0aG91Z2guDQoN
Cj4gICAJLyogTWFwIHRoZSBwMm0gdGFibGUgdG8gYSA1MTJHQi1hbGlnbmVkIHVzZXIgYWRk
cmVzcy4gKi8NCj4gICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0lOSVRfUDJNLCAgICAg
ICAucXVhZCAoUFVEX1NJWkUgKiBQVFJTX1BFUl9QVUQpKQ0KDQpNb3ZlIHRoaXMgdW5kZXIg
dGhlIENPTkZJR19QViB1bWJyZWxsYT8NCg0KPiAtI2VuZGlmDQo+ICAgI2lmZGVmIENPTkZJ
R19YRU5fUFYNCj4gICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0VOVFJZLCAgICAgICAg
ICBfQVNNX1BUUiBzdGFydHVwX3hlbikNCj4gKwlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVf
RkVBVFVSRVMsICAgICAgIC5hc2NpaSAiIXdyaXRhYmxlX3BhZ2VfdGFibGVzIikNCj4gKwlF
TEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfUEFFX01PREUsICAgICAgIC5hc2NpeiAieWVzIikN
Cj4gKwlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfTDFfTUZOX1ZBTElELA0KPiArCQkucXVh
ZCBfUEFHRV9QUkVTRU5UOyAucXVhZCBfUEFHRV9QUkVTRU5UKQ0KPiArIyBkZWZpbmUgRkVB
VFVSRVNfUFYgKDEgPDwgWEVORkVBVF93cml0YWJsZV9wYWdlX3RhYmxlcykNCj4gKyNlbHNl
DQo+ICsjIGRlZmluZSBGRUFUVVJFU19QViAwDQo+ICsjZW5kaWYNCj4gKyNpZmRlZiBDT05G
SUdfWEVOX1BWSA0KPiArIyBkZWZpbmUgRkVBVFVSRVNfUFZIICgxIDw8IFhFTkZFQVRfbGlu
dXhfcnNkcF91bnJlc3RyaWN0ZWQpDQo+ICsjZWxzZQ0KPiArIyBkZWZpbmUgRkVBVFVSRVNf
UFZIIDANCj4gKyNlbmRpZg0KPiArI2lmZGVmIENPTkZJR19YRU5fRE9NMA0KPiArIyBkZWZp
bmUgRkVBVFVSRVNfRE9NMCAoMSA8PCBYRU5GRUFUX2RvbTApDQo+ICsjZWxzZQ0KPiArIyBk
ZWZpbmUgRkVBVFVSRVNfRE9NMCAwDQo+ICAgI2VuZGlmDQo+ICAgCUVMRk5PVEUoWGVuLCBY
RU5fRUxGTk9URV9IWVBFUkNBTExfUEFHRSwgX0FTTV9QVFIgaHlwZXJjYWxsX3BhZ2UpDQo+
IC0JRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0ZFQVRVUkVTLA0KPiAtCQkuYXNjaWkgIiF3
cml0YWJsZV9wYWdlX3RhYmxlc3xwYWVfcGdkaXJfYWJvdmVfNGdiIikNCj4gICAJRUxGTk9U
RShYZW4sIFhFTl9FTEZOT1RFX1NVUFBPUlRFRF9GRUFUVVJFUywNCj4gLQkJLmxvbmcgKDEg
PDwgWEVORkVBVF93cml0YWJsZV9wYWdlX3RhYmxlcykgfCAgICAgICBcDQo+IC0JCSAgICAg
ICgxIDw8IFhFTkZFQVRfZG9tMCkgfCAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtCQkg
ICAgICAoMSA8PCBYRU5GRUFUX2xpbnV4X3JzZHBfdW5yZXN0cmljdGVkKSkNCj4gLQlFTEZO
T1RFKFhlbiwgWEVOX0VMRk5PVEVfUEFFX01PREUsICAgICAgIC5hc2NpeiAieWVzIikNCj4g
KwkJLmxvbmcgRkVBVFVSRVNfUFYgfCBGRUFUVVJFU19QVkggfCBGRUFUVVJFU19ET00wKQ0K
PiAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfTE9BREVSLCAgICAgICAgIC5hc2NpeiAi
Z2VuZXJpYyIpDQo+IC0JRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0wxX01GTl9WQUxJRCwN
Cj4gLQkJLnF1YWQgX1BBR0VfUFJFU0VOVDsgLnF1YWQgX1BBR0VfUFJFU0VOVCkNCj4gICAJ
RUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1NVU1BFTkRfQ0FOQ0VMLCAubG9uZyAxKQ0KPiAg
IAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfTU9EX1NUQVJUX1BGTiwgIC5sb25nIDEpDQo+
ICAgCUVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9IVl9TVEFSVF9MT1csICAgX0FTTV9QVFIg
X19IWVBFUlZJU09SX1ZJUlRfU1RBUlQpDQoNCkFyZSBYRU5fRUxGTk9URV9NT0RfU1RBUlRf
UEZOIGFuZCBYRU5fRUxGTk9URV9IVl9TVEFSVF9MT1cgcmVhbGx5IHJlbGV2YW50DQpmb3Ig
dGhlIG5vbi1QViBjYXNlPyBJIGRvbid0IHRoaW5rIHNvIChpbiB0aGVvcnkgWEVOX0VMRk5P
VEVfTU9EX1NUQVJUX1BGTg0KY291bGQgYmUgdXNlZCwgYnV0IHRoZSBtYWluIHJlYXNvbiBm
b3IgaXRzIGludHJvZHVjdGlvbiB3YXMgUFYgZ3Vlc3RzIElJUkMpLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------0Ad47DS10VbCi1CsS7DNCHik
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0Ad47DS10VbCi1CsS7DNCHik--

--------------UNETlYYd9cw7AK9x3o0HrBD0--

--------------A6ze7oXFmJ8UvlBIzAo2fkuT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPsyqMFAwAAAAAACgkQsN6d1ii/Ey/U
9ggAhYhEYbe1ICb1vnHfSL7mmdxhra/LZk1kUGcu8FCX7pf2SI6G4jUASsrG8GeoMfkaV2D/aLEs
cU3vCC8L2tLN8ousZANidrjBah1sCwRdTe9AG8zv/bvSKZAnSaPIjnDb3nJAsfYxtHO1Kpc7K7HL
5S79TnvSCsaNaEb33W7SpVl4ikvEkA2r4jrxAzD1+C1eFE7vK4PwEYgl27Fb3lg21nP8jI2R9TXP
Of6mCITbZmthRd7Rz8nUDyLqZF5UdlqQnf/JISDPzVYJp9CTm9Ctxu26PTvA4sDXoPmmmvkqR69m
d+1ercmAOxP8ldACX3qseEFIp+QOfc7lUtYWciqZEQ==
=/EaQ
-----END PGP SIGNATURE-----

--------------A6ze7oXFmJ8UvlBIzAo2fkuT--

