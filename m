Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9543697CE5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 14:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495976.766455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHa5-0000ze-Pl; Wed, 15 Feb 2023 13:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495976.766455; Wed, 15 Feb 2023 13:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSHa5-0000xH-MN; Wed, 15 Feb 2023 13:12:17 +0000
Received: by outflank-mailman (input) for mailman id 495976;
 Wed, 15 Feb 2023 13:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pSHa4-0000xB-U7
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 13:12:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d8bc685-ad32-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 14:12:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 954683374C;
 Wed, 15 Feb 2023 13:12:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DF77134BA;
 Wed, 15 Feb 2023 13:12:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yx+PFS7a7GNfYAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Feb 2023 13:12:14 +0000
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
X-Inumbo-ID: 5d8bc685-ad32-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676466734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WW3CkzIoCelqAvWGFEBSJwPtQA1X78KrOWrnQKdSl1w=;
	b=HQ9zfgh+LELNczxjQa1+NVz2u27oK/X8SCV+u66FjDR6N9u/q6YacaiI5B2jOhdGUnfvp3
	JV2W7rpDIK8pqDNuIimNEfmaubEoSJEQeyzYngKhVJ5cb1QUvOFtyxZMOw2uxrVTbtFoTV
	seiesls3446mFQx7SBWzWD+EmpSc7S0=
Message-ID: <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
Date: Wed, 15 Feb 2023 14:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
 <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
In-Reply-To: <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vh3ERJFV18yn0IIe9AePDRc0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vh3ERJFV18yn0IIe9AePDRc0
Content-Type: multipart/mixed; boundary="------------uoqHR8xCxFteZmfr1QonQzwL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6abdc32d-5a18-20dc-a300-754f2b164fb7@suse.com>
Subject: Re: [PATCH] x86/Xen: tidy xen-head.S
References: <afb02f3e-3d69-07ca-c3ec-5bbeeceb5e55@suse.com>
 <28bd8aec-cd41-7b5c-0f32-12c79595134d@suse.com>
 <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>
In-Reply-To: <7b0ddd99-4093-b72d-ba5c-ea145c0bf2f4@suse.com>

--------------uoqHR8xCxFteZmfr1QonQzwL
Content-Type: multipart/mixed; boundary="------------eXg10UHi9wcLx5whCDmcesZG"

--------------eXg10UHi9wcLx5whCDmcesZG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjMgMTM6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wMi4yMDIz
IDEzOjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTUuMDIuMjMgMTI6MzMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEZpcnN0IG9mIGFsbCBkcm9wIDMyLWJpdCBsZWZ0b3Zl
cnMsIGluY2x1ZGluZyB0aGUgaW5jbHVzaW9uIG9mIHRoZSBmaWxlDQo+Pj4gZnJvbSBoZWFk
XzMyLlMuDQo+Pg0KPj4gSSBkb24ndCBzZWUgd2h5IHdlIHdvdWxkIHdhbnQgdG8gZHJvcCAz
Mi1iaXQgSFZNIGFuZCBQVkggc3VwcG9ydC4NCj4gDQo+IEhWTSBkb2Vzbid0IHVzZSB0aGlz
LCBkb2VzIGl0PyBCdXQgeWVzLCB0aGUgUFZIIGFzcGVjdCBhcyB3ZWxsIGFzIC4uLg0KDQpo
eXBlcmNhbGxfcGFnZSBpcyBsb2NhdGVkIGluIHhlbi1oZWFkLlMuDQoNCj4gDQo+Pj4gLS0t
IGEvYXJjaC94ODYva2VybmVsL2hlYWRfMzIuUw0KPj4+ICsrKyBiL2FyY2gveDg2L2tlcm5l
bC9oZWFkXzMyLlMNCj4+PiBAQCAtNTI0LDggKzUyNCw2IEBAIF9fSU5JVFJPREFUQQ0KPj4+
ICAgIGludF9tc2c6DQo+Pj4gICAgCS5hc2NpeiAiVW5rbm93biBpbnRlcnJ1cHQgb3IgZmF1
bHQgYXQ6ICVwICVwICVwXG4iDQo+Pj4gICAgDQo+Pj4gLSNpbmNsdWRlICIuLi8uLi94ODYv
eGVuL3hlbi1oZWFkLlMiDQo+Pj4gLQ0KPj4NCj4+IFRoaXMgaXMgd3JvbmcgZm9yIG5vbi1Q
ViBjYXNlcy4NCj4gDQo+IC4uLiB0aGlzIGFuZCAuLi4NCj4gDQo+Pj4gLS0tIGEvYXJjaC94
ODYveGVuL3hlbi1oZWFkLlMNCj4+PiArKysgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUw0K
Pj4+IEBAIC04MywyNyArODMsMzMgQEAgU1lNX0NPREVfRU5EKGFzbV9jcHVfYnJpbmd1cF9h
bmRfaWRsZSkNCj4+PiAgICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0dVRVNUX09TLCAg
ICAgICAuYXNjaXogImxpbnV4IikNCj4+PiAgICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RF
X0dVRVNUX1ZFUlNJT04sICAuYXNjaXogIjIuNiIpDQo+Pj4gICAgCUVMRk5PVEUoWGVuLCBY
RU5fRUxGTk9URV9YRU5fVkVSU0lPTiwgICAgLmFzY2l6ICJ4ZW4tMy4wIikNCj4+PiAtI2lm
ZGVmIENPTkZJR19YODZfMzINCj4+PiAtCUVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9WSVJU
X0JBU0UsICAgICAgX0FTTV9QVFIgX19QQUdFX09GRlNFVCkNCj4+PiAtI2Vsc2UNCj4+PiAg
ICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1ZJUlRfQkFTRSwgICAgICBfQVNNX1BUUiBf
X1NUQVJUX0tFUk5FTF9tYXApDQo+Pg0KPj4gVGhpcyB3aWxsIGJlIHdyb25nIGZvciAzMi1i
aXQgZ3Vlc3RzIG5vdy4gSSdtIG5vdCBzdXJlIHRoZSB2YWx1ZSBpcyByZWFsbHkNCj4+IHVz
ZWQgaW4gWGVuIGZvciBub24tUFYgZ3Vlc3RzLCB0aG91Z2guDQo+Pg0KPj4+ICAgIAkvKiBN
YXAgdGhlIHAybSB0YWJsZSB0byBhIDUxMkdCLWFsaWduZWQgdXNlciBhZGRyZXNzLiAqLw0K
Pj4+ICAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfSU5JVF9QMk0sICAgICAgIC5xdWFk
IChQVURfU0laRSAqIFBUUlNfUEVSX1BVRCkpDQo+Pg0KPj4gTW92ZSB0aGlzIHVuZGVyIHRo
ZSBDT05GSUdfUFYgdW1icmVsbGE/DQo+IA0KPiAuLi4gdGhlc2Ugb2NjdXJyZWQgdG8gbWUg
b3ZlciBsdW5jaCAoYW5kIEkgd2FzIGhvcGluZyB0byBiZSBhYmxlIHRvIHBvaW50DQo+IG91
dCBteSBtaXN0YWtlIGJlZm9yZSBnZXR0aW5nIGZlZWRiYWNrKS4gSSdsbCBjaGVjayB3aGV0
aGVyIFZJUlRfQkFTRSBjYW4NCj4gYWxzbyBiZSBtb3ZlZCBpbnRvIHRoZSBQVi1vbmx5IHNl
Y3Rpb24uDQoNClRoYW5rcy4NCg0KPiANCj4+PiAtI2VuZGlmDQo+Pj4gICAgI2lmZGVmIENP
TkZJR19YRU5fUFYNCj4+PiAgICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX0VOVFJZLCAg
ICAgICAgICBfQVNNX1BUUiBzdGFydHVwX3hlbikNCj4+PiArCUVMRk5PVEUoWGVuLCBYRU5f
RUxGTk9URV9GRUFUVVJFUywgICAgICAgLmFzY2lpICIhd3JpdGFibGVfcGFnZV90YWJsZXMi
KQ0KPj4+ICsJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1BBRV9NT0RFLCAgICAgICAuYXNj
aXogInllcyIpDQo+Pj4gKwlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfTDFfTUZOX1ZBTElE
LA0KPj4+ICsJCS5xdWFkIF9QQUdFX1BSRVNFTlQ7IC5xdWFkIF9QQUdFX1BSRVNFTlQpDQo+
Pj4gKyMgZGVmaW5lIEZFQVRVUkVTX1BWICgxIDw8IFhFTkZFQVRfd3JpdGFibGVfcGFnZV90
YWJsZXMpDQo+Pj4gKyNlbHNlDQo+Pj4gKyMgZGVmaW5lIEZFQVRVUkVTX1BWIDANCj4+PiAr
I2VuZGlmDQo+Pj4gKyNpZmRlZiBDT05GSUdfWEVOX1BWSA0KPj4+ICsjIGRlZmluZSBGRUFU
VVJFU19QVkggKDEgPDwgWEVORkVBVF9saW51eF9yc2RwX3VucmVzdHJpY3RlZCkNCj4+PiAr
I2Vsc2UNCj4+PiArIyBkZWZpbmUgRkVBVFVSRVNfUFZIIDANCj4+PiArI2VuZGlmDQo+Pj4g
KyNpZmRlZiBDT05GSUdfWEVOX0RPTTANCj4+PiArIyBkZWZpbmUgRkVBVFVSRVNfRE9NMCAo
MSA8PCBYRU5GRUFUX2RvbTApDQo+Pj4gKyNlbHNlDQo+Pj4gKyMgZGVmaW5lIEZFQVRVUkVT
X0RPTTAgMA0KPj4+ICAgICNlbmRpZg0KPj4+ICAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5P
VEVfSFlQRVJDQUxMX1BBR0UsIF9BU01fUFRSIGh5cGVyY2FsbF9wYWdlKQ0KPj4+IC0JRUxG
Tk9URShYZW4sIFhFTl9FTEZOT1RFX0ZFQVRVUkVTLA0KPj4+IC0JCS5hc2NpaSAiIXdyaXRh
YmxlX3BhZ2VfdGFibGVzfHBhZV9wZ2Rpcl9hYm92ZV80Z2IiKQ0KPj4+ICAgIAlFTEZOT1RF
KFhlbiwgWEVOX0VMRk5PVEVfU1VQUE9SVEVEX0ZFQVRVUkVTLA0KPj4+IC0JCS5sb25nICgx
IDw8IFhFTkZFQVRfd3JpdGFibGVfcGFnZV90YWJsZXMpIHwgICAgICAgXA0KPj4+IC0JCSAg
ICAgICgxIDw8IFhFTkZFQVRfZG9tMCkgfCAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+
IC0JCSAgICAgICgxIDw8IFhFTkZFQVRfbGludXhfcnNkcF91bnJlc3RyaWN0ZWQpKQ0KPj4+
IC0JRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX1BBRV9NT0RFLCAgICAgICAuYXNjaXogInll
cyIpDQo+Pj4gKwkJLmxvbmcgRkVBVFVSRVNfUFYgfCBGRUFUVVJFU19QVkggfCBGRUFUVVJF
U19ET00wKQ0KPj4+ICAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfTE9BREVSLCAgICAg
ICAgIC5hc2NpeiAiZ2VuZXJpYyIpDQo+Pj4gLQlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVf
TDFfTUZOX1ZBTElELA0KPj4+IC0JCS5xdWFkIF9QQUdFX1BSRVNFTlQ7IC5xdWFkIF9QQUdF
X1BSRVNFTlQpDQo+Pj4gICAgCUVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9TVVNQRU5EX0NB
TkNFTCwgLmxvbmcgMSkNCj4+PiAgICAJRUxGTk9URShYZW4sIFhFTl9FTEZOT1RFX01PRF9T
VEFSVF9QRk4sICAubG9uZyAxKQ0KPj4+ICAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVf
SFZfU1RBUlRfTE9XLCAgIF9BU01fUFRSIF9fSFlQRVJWSVNPUl9WSVJUX1NUQVJUKQ0KPj4N
Cj4+IEFyZSBYRU5fRUxGTk9URV9NT0RfU1RBUlRfUEZOIGFuZCBYRU5fRUxGTk9URV9IVl9T
VEFSVF9MT1cgcmVhbGx5IHJlbGV2YW50DQo+PiBmb3IgdGhlIG5vbi1QViBjYXNlPyBJIGRv
bid0IHRoaW5rIHNvIChpbiB0aGVvcnkgWEVOX0VMRk5PVEVfTU9EX1NUQVJUX1BGTg0KPj4g
Y291bGQgYmUgdXNlZCwgYnV0IHRoZSBtYWluIHJlYXNvbiBmb3IgaXRzIGludHJvZHVjdGlv
biB3YXMgUFYgZ3Vlc3RzIElJUkMpLg0KPiANCj4gSSB3YXNuJ3Qgc3VmZmljaWVudGx5IGNl
cnRhaW4gZm9yIE1PRF9TVEFSVF9QRk4sIHNvIEknZCBwcmVmZXIgdG8gbGVhdmUgaXQNCj4g
dW50b3VjaGVkIGZvciBub3cuIEhWX1NUQVJUX0xPVyBtaWdodCBiZSAzMi1iaXQgUFYgb25s
eSByZWFsbHk7IEknbGwgY2hlY2sNCj4gYW5kIHRoZW4gbWF5YmUgZHJvcCAob3IgbW92ZSku
DQoNCkZpbmUgd2l0aCBtZS4NCg0KDQpKdWVyZ2VuDQo=
--------------eXg10UHi9wcLx5whCDmcesZG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------eXg10UHi9wcLx5whCDmcesZG--

--------------uoqHR8xCxFteZmfr1QonQzwL--

--------------vh3ERJFV18yn0IIe9AePDRc0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPs2i0FAwAAAAAACgkQsN6d1ii/Ey89
HQf9FQtyCodybGNB/9pp/4ERNSQYa76jFrGFwbh3R7NNHrpLYF5HxQatDCQB06l+mM1SBB13XIXu
F+G9NvE1hnf/3Um2AjzQtPUdjkf9dbh8TY2JvKKycdlPgtHKGAfEjWek7KewDUw0QR4xpLkllHN0
f8FPy5taI58tjoOqUsCde0WG0vhEFusNnlSa9J6c8ZBvIXROLKh2LACC7ED/EfOrIL0v5GztF3OD
MkbAa3FIYBBY2Her6GtYJomYlxZYBOc+lvCoQYz5Ax7PSgnDL2CDPZ2xbUzQpHx92h1i9dgVs3IK
ZEKr7aoW6dBUdPm3gNuuR7j+c473OCSNKEfV0Qy58w==
=nzYt
-----END PGP SIGNATURE-----

--------------vh3ERJFV18yn0IIe9AePDRc0--

