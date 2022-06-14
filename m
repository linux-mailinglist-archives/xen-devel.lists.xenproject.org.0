Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570754B438
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 17:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349132.575314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18B6-0005Hv-6B; Tue, 14 Jun 2022 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349132.575314; Tue, 14 Jun 2022 15:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o18B6-0005Fm-28; Tue, 14 Jun 2022 15:10:00 +0000
Received: by outflank-mailman (input) for mailman id 349132;
 Tue, 14 Jun 2022 15:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qNKJ=WV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o18B4-0005Fg-IE
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 15:09:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d529e29-ebf4-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 17:09:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6C4E21B69;
 Tue, 14 Jun 2022 15:09:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E0A01361C;
 Tue, 14 Jun 2022 15:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n/z8EMSkqGJGVwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Jun 2022 15:09:56 +0000
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
X-Inumbo-ID: 0d529e29-ebf4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655219396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TBuTSA8mQ0jvxTP5qnDkR0bwrd8FxfdNziVlcfJYYno=;
	b=O1UBCoRPk4dvMZPflj5RmgChdsLFUHirjfqT7qIfr/YxFKzsZpYH4JaoGpv5LJ5mOZM1Ti
	I5vSvZ1F4ZcEZc4FfE8HVPbaB9G5b2ytQIbMXelR34pxj1mB6jbSTZ7TdwDPM4rGMxQk1l
	SHKq3LZprlSAA9UF0cqWaDNc7cIfrZs=
Message-ID: <fb0eadee-1d45-f414-eda4-a87f01eeb57a@suse.com>
Date: Tue, 14 Jun 2022 17:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
Content-Language: en-US
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: jbeulich@suse.com, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-2-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220503132207.17234-2-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eun63RK740ZvvNDN34swS1W9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eun63RK740ZvvNDN34swS1W9
Content-Type: multipart/mixed; boundary="------------yoJ6DkuojrwCMWyBgW7a1PaZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: jbeulich@suse.com, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <fb0eadee-1d45-f414-eda4-a87f01eeb57a@suse.com>
Subject: Re: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-2-jgross@suse.com>
In-Reply-To: <20220503132207.17234-2-jgross@suse.com>

--------------yoJ6DkuojrwCMWyBgW7a1PaZ
Content-Type: multipart/mixed; boundary="------------fRcA0gQMkBVZfOGxtlWXbzS3"

--------------fRcA0gQMkBVZfOGxtlWXbzS3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjIgMTU6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IHg4Nl9oYXNfcGF0
X3dwKCkgaXMgdXNpbmcgYSB3cm9uZyB0ZXN0LCBhcyBpdCByZWxpZXMgb24gdGhlIG5vcm1h
bA0KPiBQQVQgY29uZmlndXJhdGlvbiB1c2VkIGJ5IHRoZSBrZXJuZWwuIEluIGNhc2UgdGhl
IFBBVCBNU1IgaGFzIGJlZW4NCj4gc2V0dXAgYnkgYW5vdGhlciBlbnRpdHkgKGUuZy4gQklP
UyBvciBYZW4gaHlwZXJ2aXNvcikgaXQgbWlnaHQgcmV0dXJuDQo+IGZhbHNlIGV2ZW4gaWYg
dGhlIFBBVCBjb25maWd1cmF0aW9uIGlzIGFsbG93aW5nIFdQIG1hcHBpbmdzLg0KPiANCj4g
Rml4ZXM6IDFmNmY2NTVlMDFhZCAoIng4Ni9tbTogQWRkIGEgeDg2X2hhc19wYXRfd3AoKSBo
ZWxwZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+IC0tLQ0KPiAgIGFyY2gveDg2L21tL2luaXQuYyB8IDMgKystDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L21tL2luaXQuYyBiL2FyY2gveDg2L21tL2luaXQuYw0KPiBpbmRl
eCBkOGNmY2UyMjEyNzUuLjcxZTE4MmViY2VkMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYv
bW0vaW5pdC5jDQo+ICsrKyBiL2FyY2gveDg2L21tL2luaXQuYw0KPiBAQCAtODAsNyArODAs
OCBAQCBzdGF0aWMgdWludDhfdCBfX3B0ZTJjYWNoZW1vZGVfdGJsWzhdID0gew0KPiAgIC8q
IENoZWNrIHRoYXQgdGhlIHdyaXRlLXByb3RlY3QgUEFUIGVudHJ5IGlzIHNldCBmb3Igd3Jp
dGUtcHJvdGVjdCAqLw0KPiAgIGJvb2wgeDg2X2hhc19wYXRfd3Aodm9pZCkNCj4gICB7DQo+
IC0JcmV0dXJuIF9fcHRlMmNhY2hlbW9kZV90YmxbX1BBR0VfQ0FDSEVfTU9ERV9XUF0gPT0g
X1BBR0VfQ0FDSEVfTU9ERV9XUDsNCj4gKwlyZXR1cm4gX19wdGUyY2FjaGVtb2RlX3RibFtf
X2NhY2hlbW9kZTJwdGVfdGJsW19QQUdFX0NBQ0hFX01PREVfV1BdXSA9PQ0KPiArCSAgICAg
ICBfUEFHRV9DQUNIRV9NT0RFX1dQOw0KPiAgIH0NCj4gICANCj4gICBlbnVtIHBhZ2VfY2Fj
aGVfbW9kZSBwZ3Byb3QyY2FjaGVtb2RlKHBncHJvdF90IHBncHJvdCkNCg0KeDg2IG1haW50
YWluZXJzLCBwbGVhc2UgY29uc2lkZXIgdGFraW5nIHRoaXMgcGF0Y2gsIGFzIGl0IGlzIGZp
eGluZw0KYSByZWFsIGJ1Zy4gUGF0Y2ggMiBvZiB0aGlzIHNlcmllcyBjYW4gYmUgZHJvcHBl
ZCBJTU8uDQoNCg0KSnVlcmdlbg0K
--------------fRcA0gQMkBVZfOGxtlWXbzS3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------fRcA0gQMkBVZfOGxtlWXbzS3--

--------------yoJ6DkuojrwCMWyBgW7a1PaZ--

--------------eun63RK740ZvvNDN34swS1W9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKopMMFAwAAAAAACgkQsN6d1ii/Ey/V
awf/awBnKJ5Bfc9Aiile6ImR6gl2yoG9pBgK3XGsRukjf+iVwjGGMEKxsWINeQ1SJctM+m8+BtQ6
XgipkOTUXLmGpFJztKUr+RyFj47wxb27YZGIAg2hxE+WK2IGNaGFDY0ksb351HHaTTDt6+SrvemO
YsEQ84/QsrzqWeC3+YgF3/rQZ/FdI3uZ3CzZOxC+xBGnFydhrPFMWRIjO3BqW5TTupTEgjFq0Irb
HvMi+RmoKrODIIzeeBYO379U11HQ+aEq5Dv9RqgVFrSINnPobAZCaB3n6tZl2LedsD4+dx27oD37
A9uzcajGcLtIMSxdvfd+9veNCh3ABcjWuUHWnyIwUQ==
=jzA7
-----END PGP SIGNATURE-----

--------------eun63RK740ZvvNDN34swS1W9--

