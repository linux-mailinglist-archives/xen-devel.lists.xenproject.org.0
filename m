Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CC606325
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 16:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426850.675575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWbY-0008BS-Mx; Thu, 20 Oct 2022 14:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426850.675575; Thu, 20 Oct 2022 14:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWbY-00088W-Ix; Thu, 20 Oct 2022 14:33:04 +0000
Received: by outflank-mailman (input) for mailman id 426850;
 Thu, 20 Oct 2022 14:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olWbX-00088Q-DS
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 14:33:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 197e39cd-5084-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 16:33:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B2DC01FB15;
 Thu, 20 Oct 2022 14:33:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60DC813494;
 Thu, 20 Oct 2022 14:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DenjFR1cUWPAZwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 14:33:01 +0000
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
X-Inumbo-ID: 197e39cd-5084-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666276381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVJfmgnGQuxRuEnHw66oXT6YXcIqyTpdZDa7LzHLN5w=;
	b=kgxlmMZcwUcsuGEZrkDxM4t+oB3F1WwaoBTAn13ODCiBzKcnFMxsXNPPIXU4ngCtCLhQ6j
	iJEAow2rSoR/1zSt9RcXlv1BvMTMqMMf5ILBYcWc8Jds5Z+/yk1hp6kelGxTpiCx1WZQMu
	6gwzfhJ8A1E6xp+rngTyS/qDENLzqnQ=
Message-ID: <69f4f7dd-e630-709d-5aa9-334e349109d9@suse.com>
Date: Thu, 20 Oct 2022 16:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] x86/xen: silence smatch warning in pmu_msr_chk_emulated()
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20221020113759.17402-1-jgross@suse.com>
 <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>
 <26bae6db-0e17-2b54-4046-0e85b26f6401@suse.com>
 <7fad3782-daf5-654c-f89d-e4dfb92bbf8f@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <7fad3782-daf5-654c-f89d-e4dfb92bbf8f@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zcyfHE0S2ceMK3XoHgwlW6GL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zcyfHE0S2ceMK3XoHgwlW6GL
Content-Type: multipart/mixed; boundary="------------vR7EN6oD0YjsOeoyfv6823Cr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Message-ID: <69f4f7dd-e630-709d-5aa9-334e349109d9@suse.com>
Subject: Re: [PATCH] x86/xen: silence smatch warning in pmu_msr_chk_emulated()
References: <20221020113759.17402-1-jgross@suse.com>
 <47668d94-6b55-2894-fa6d-82b1f17312bf@suse.com>
 <26bae6db-0e17-2b54-4046-0e85b26f6401@suse.com>
 <7fad3782-daf5-654c-f89d-e4dfb92bbf8f@oracle.com>
In-Reply-To: <7fad3782-daf5-654c-f89d-e4dfb92bbf8f@oracle.com>

--------------vR7EN6oD0YjsOeoyfv6823Cr
Content-Type: multipart/mixed; boundary="------------TNcG0JL7CRY7VAUwTgdr1NZC"

--------------TNcG0JL7CRY7VAUwTgdr1NZC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTAuMjIgMTY6MjIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IE9uIDEw
LzIwLzIyIDk6MzQgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAyMC4xMC4yMiAx
NToxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjAuMTAuMjAyMiAxMzozNywgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gQ29tbWl0IDg3MTRmN2JjZDNjMiAoInhlbi9wdjog
YWRkIGZhdWx0IHJlY292ZXJ5IGNvbnRyb2wgdG8gcG11IG1zcg0KPj4+PiBhY2Nlc3NlcyIp
IGludHJvZHVjZWQgY29kZSByZXN1bHRpbmcgaW4gYSB3YXJuaW5nIGlzc3VlZCBieSB0aGUg
c21hdGNoDQo+Pj4+IHN0YXRpYyBjaGVja2VyLCBjbGFpbWluZyB0byB1c2UgYW4gdW5pbml0
aWFsaXplZCB2YXJpYWJsZS4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZl
LCBidXQgd29yayBhcm91bmQgdGhlIHdhcm5pbmcgbmV2ZXJ0aGVsZXNzLg0KPj4+DQo+Pj4g
VGhlIHJpc2sgb2YgaW50cm9kdWNpbmcgYSBwcm9ibGVtIG1pZ2h0IGJlIHF1aXRlIGxvdyBo
ZXJlLCBidXQgaW4gZ2VuZXJhbA0KPj4+IGl0IGV4aXN0czogV2l0aCB0aGUgYWRqdXN0bWVu
dCB5b3UgcmVtb3ZlIGFueSBjaGFuY2Ugb2YgdGhlIGNvbXBpbGVyDQo+Pj4gc3BvdHRpbmcg
YSBtaXNzaW5nIGluaXRpYWxpemF0aW9uIGJlZm9yZSB1c2UuIEFuZCBJJ20gbm90IGNvbnZp
bmNlZCB1c2luZw0KPj4+IDAgaW4gc3VjaCBhIGNhc2Ugd291bGQgYWN0dWFsbHkgYmUgZW5k
aW5nIHVwIHN1ZmZpY2llbnRseSBiZW5pZ24uDQo+Pg0KPj4gSG1tLCBhbiBhbHRlcm5hdGl2
ZSB3b3VsZCBiZSB0byBpbml0aWFsaXplIGl0IHRvIC0xIGFuZCBhZGQgYSB0ZXN0IGZvciB0
aGUNCj4+IGluZGV4IHRvIGJlID49IDAgYmVmb3JlIHVzaW5nIGl0Lg0KPj4NCj4+IE9yIHRv
IGxpdmUgd2l0aCB0aGUgc21hc2ggd2FybmluZyB3aXRoIHRoZSBjaGFuY2UsIHRoYXQgYSBj
b21waWxlciBtaWdodCBiZQ0KPj4gd2FybmluZyBmb3IgdGhlIHNhbWUgcmVhc29uIGluIHRo
ZSBmdXR1cmUuDQo+IA0KPiANCj4gSXMgc21hdGNoIGNvbXBsYWluaW5nIGFib3V0IGJvdGgg
dmFyaWFibGVzIG9yIGp1c3QgaW5kZXg/IFRoZXJlIGFyZSB0d28gY2FzZXMgaW4gDQo+IGlz
X2ludGVsX3BtdV9tc3IoKSB3aGVyZSBpdCByZXR1cm5zIHRydWUgYnV0IGluZGV4IGlzIG5v
dCBzZXQgc28gcGVyaGFwcyB0aGF0J3MgDQo+IHdoYXQgYm90aGVycyBzbWF0Y2g/IEl0IHNo
b2xkIG5vdCBjb21wbGFpbiBpZiBpc19pbnRlbF9wbXVfbXNyKCkgcmV0dXJucyBmYWxzZS4N
Cg0KSSBkaWRuJ3QgdGVzdCBpdCBteXNlbGYsIHNvIEkgY2FuIG9ubHkgc3BlY3VsYXRlLg0K
DQpJIGd1ZXNzIHRoZSBwcm9ibGVtIGlzIHdoZW4gaXNfaW50ZWxfcG11X21zcigpIHJldHVy
bnMgdHJ1ZS4NCg0KSW4gdGhlIGVuZCBJIGRvbid0IHRoaW5rIHdlIGV4cGVjdCBtdWNoIGNv
ZGUgY2h1cm4gaW4gdGhpcyBhcmVhIGluIHRoZSBmdXR1cmUuDQpJdHMgbm90IGFzIGlmIHRo
ZSBwbXUgaGFuZGxpbmcgZm9yIFBWIGd1ZXN0cyBpcyBleHBlY3RlZCB0byBiZSBleHRlbmRl
ZC4NCg0KDQpKdWVyZ2VuDQo=
--------------TNcG0JL7CRY7VAUwTgdr1NZC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TNcG0JL7CRY7VAUwTgdr1NZC--

--------------vR7EN6oD0YjsOeoyfv6823Cr--

--------------zcyfHE0S2ceMK3XoHgwlW6GL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNRXBwFAwAAAAAACgkQsN6d1ii/Ey94
2Af9FTsQmeKB0W9tHVkHTh2hlh8WkHYaXHtUZtzC6+PfP1bbQ6A+0zEMFnb34/49RqtBRbOxysPw
EeHMstV6Iki/418N6leZY6ed0MW649g/IxXZMO2W2zL7qk0D6J5j61c8DW5VqtYwXbBbvJUCZ9oF
4bRtoarCqNnL3hWHoaTZpN6Hat6MG9f9K5Gs53sTc/1kjFEhVZF28K6kiubmq/iOxQGLsOEJFiyj
tKa4Xe/AkVVfIRT6vYtUGWV6NIsXShndmYPzH1RAV+2YHxi5uLaVEpqUd+Ph8fLVztLFYBoybGmR
19fBzhNre321KgmIsApMnHEaF0gYkE1amNmbF0qprw==
=/pVF
-----END PGP SIGNATURE-----

--------------zcyfHE0S2ceMK3XoHgwlW6GL--

