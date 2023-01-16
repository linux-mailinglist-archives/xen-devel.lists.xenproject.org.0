Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910166B924
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478430.741618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL0g-0000Nu-7Y; Mon, 16 Jan 2023 08:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478430.741618; Mon, 16 Jan 2023 08:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL0g-0000M6-3T; Mon, 16 Jan 2023 08:38:30 +0000
Received: by outflank-mailman (input) for mailman id 478430;
 Mon, 16 Jan 2023 08:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OEfv=5N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHL0e-0000Lw-Ks
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:38:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2596e474-9579-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 09:38:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E713367565;
 Mon, 16 Jan 2023 08:38:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4258C139C2;
 Mon, 16 Jan 2023 08:38:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jXTKDgINxWMOFAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Jan 2023 08:38:26 +0000
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
X-Inumbo-ID: 2596e474-9579-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673858306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCTz8nPUFHfGm5/NFTvj8mMlaS89IAg2JXiWnIchUYI=;
	b=b21kYzV7bIOMaYuzQfHskSyOZTKxY6IQXB61/wpa3u9Tg/5EoyBmM4UyU8gOAIxSLQITel
	P3PSkg9pK712N5HheccAJJvufNIUBtCw7YXRx/cBFx94phXx5y74Mg0gExDjOhA8Rxb7pk
	DQQQT5GtBi1fA4cuBQn0lgxqm5UyOGs=
Message-ID: <1375c16c-1a81-f845-f9e6-d698148c4ffc@suse.com>
Date: Mon, 16 Jan 2023 09:38:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
Content-Language: en-US
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, linux-kernel@vger.kernel.org
Cc: amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
 bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
 namit@vmware.com, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>,
 Lewis Caroll <lewis.carroll@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, x86@kernel.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230116060134.80259-1-srivatsa@csail.mit.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R20aP0MBAjebS9kz3CSWyaDC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R20aP0MBAjebS9kz3CSWyaDC
Content-Type: multipart/mixed; boundary="------------SKpCTbiCrL4RZ847sUVVOW7b";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, linux-kernel@vger.kernel.org
Cc: amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
 bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
 namit@vmware.com, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>,
 Lewis Caroll <lewis.carroll@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, x86@kernel.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <1375c16c-1a81-f845-f9e6-d698148c4ffc@suse.com>
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
In-Reply-To: <20230116060134.80259-1-srivatsa@csail.mit.edu>

--------------SKpCTbiCrL4RZ847sUVVOW7b
Content-Type: multipart/mixed; boundary="------------dh2EUrC8xJ648HWyt0Ov3f0j"

--------------dh2EUrC8xJ648HWyt0Ov3f0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDEuMjMgMDc6MDEsIFNyaXZhdHNhIFMuIEJoYXQgd3JvdGU6DQo+IEZyb206ICJT
cml2YXRzYSBTLiBCaGF0IChWTXdhcmUpIiA8c3JpdmF0c2FAY3NhaWwubWl0LmVkdT4NCj4g
DQo+IFVuZGVyIGh5cGVydmlzb3JzIHRoYXQgc3VwcG9ydCBtd2FpdCBwYXNzdGhyb3VnaCwg
YSB2Q1BVIGluIG13YWl0DQo+IENQVS1pZGxlIHN0YXRlIHJlbWFpbnMgaW4gZ3Vlc3QgY29u
dGV4dCAoaW5zdGVhZCBvZiB5aWVsZGluZyB0byB0aGUNCj4gaHlwZXJ2aXNvciB2aWEgVk1F
WElUKSwgd2hpY2ggaGVscHMgc3BlZWQgdXAgd2FrZXVwcyBmcm9tIGlkbGUuDQo+IA0KPiBI
b3dldmVyLCB0aGlzIHJ1bnMgaW50byBwcm9ibGVtcyB3aXRoIENQVSBob3RwbHVnLCBiZWNh
dXNlIHRoZSBMaW51eA0KPiBDUFUgb2ZmbGluZSBwYXRoIHByZWZlcnMgdG8gcHV0IHRoZSB2
Q1BVLXRvLWJlLW9mZmxpbmVkIGluIG13YWl0DQo+IHN0YXRlLCB3aGVuZXZlciBtd2FpdCBp
cyBhdmFpbGFibGUuIEFzIGEgcmVzdWx0LCBzaW5jZSBhIHZDUFUgaW4gbXdhaXQNCj4gcmVt
YWlucyBpbiBndWVzdCBjb250ZXh0IGFuZCBkb2VzIG5vdCB5aWVsZCB0byB0aGUgaHlwZXJ2
aXNvciwgYW4NCj4gb2ZmbGluZSB2Q1BVICphcHBlYXJzKiB0byBiZSAxMDAlIGJ1c3kgYXMg
dmlld2VkIGZyb20gdGhlIGhvc3QsIHdoaWNoDQo+IHByZXZlbnRzIHRoZSBoeXBlcnZpc29y
IGZyb20gcnVubmluZyBvdGhlciB2Q1BVcyBvciB3b3JrbG9hZHMgb24gdGhlDQo+IGNvcnJl
c3BvbmRpbmcgcENQVS4gWyBOb3RlIHRoYXQgc3VjaCBhIHZDUFUgaXMgbm90IGFjdHVhbGx5
IGJ1c3kNCj4gc3Bpbm5pbmcgdGhvdWdoOyBpdCByZW1haW5zIGluIG13YWl0IGlkbGUgc3Rh
dGUgaW4gdGhlIGd1ZXN0IF0uDQo+IA0KPiBGaXggdGhpcyBieSBwcmV2ZW50aW5nIHRoZSB1
c2Ugb2YgbXdhaXQgaWRsZSBzdGF0ZSBpbiB0aGUgdkNQVSBvZmZsaW5lDQo+IHBsYXlfZGVh
ZCgpIHBhdGggZm9yIGFueSBoeXBlcnZpc29yLCBldmVuIGlmIG13YWl0IHN1cHBvcnQgaXMN
Cj4gYXZhaWxhYmxlLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSAoSW50
ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogU3JpdmF0c2Eg
Uy4gQmhhdCAoVk13YXJlKSA8c3JpdmF0c2FAY3NhaWwubWl0LmVkdT4NCj4gQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiBDYzogUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPg0KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhh
dC5jb20+DQo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCj4gQ2M6IERh
dmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiAiSC4gUGV0
ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPg0KPiBDYzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8
cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+DQo+IENjOiAiUGF1bCBFLiBNY0tlbm5leSIg
PHBhdWxtY2tAa2VybmVsLm9yZz4NCj4gQ2M6IFd5ZXMgS2FybnkgPHd5ZXMua2FybnlAYW1k
LmNvbT4NCj4gQ2M6IExld2lzIENhcm9sbCA8bGV3aXMuY2Fycm9sbEBhbWQuY29tPg0KPiBD
YzogVG9tIExlbmRhY2t5IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT4NCj4gQ2M6IEFsZXhl
eSBNYWtoYWxvdiA8YW1ha2hhbG92QHZtd2FyZS5jb20+DQo+IENjOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+IENjOiB4ODZAa2VybmVsLm9yZw0KPiBDYzogVk13YXJl
IFBWLURyaXZlcnMgUmV2aWV3ZXJzIDxwdi1kcml2ZXJzQHZtd2FyZS5jb20+DQo+IENjOiB2
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZw0KPiBDYzoga3ZtQHZn
ZXIua2VybmVsLm9yZw0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQoN
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVl
cmdlbg0KDQo=
--------------dh2EUrC8xJ648HWyt0Ov3f0j
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------dh2EUrC8xJ648HWyt0Ov3f0j--

--------------SKpCTbiCrL4RZ847sUVVOW7b--

--------------R20aP0MBAjebS9kz3CSWyaDC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPFDQEFAwAAAAAACgkQsN6d1ii/Ey8W
xwf/X/GKsP0H+Iit0bG9QeFgb0ohp08/y4PiVKqFcswlEHIG/fwFJtvHYFxlnQ0zVWBjO/ksowgv
DKedL5giBFHXzjCu9xmCReFb/YlX2fqRQ9Nu/hfwO5Ckze6QcVgTtbzWxLhrb32MbydSpk/XXSBG
94UJZBOFutx9O/ObihZfY1wO55GZwh7b655J3uIzv3y1RPVxg9joxGPRh2uubt4GLsiD5uSH3N6K
qA0DSoPIgM/2cq3iNTb+TTx+YnFfV79+uP2nRbMkQ9XT2WqdC3WNSe/Wepv6RgcP+3jdaIxW8Xdo
oFevc1mDroKpfdbB9i5I+DvLXnTCjERGqV1JZ0PmYQ==
=L2a/
-----END PGP SIGNATURE-----

--------------R20aP0MBAjebS9kz3CSWyaDC--

