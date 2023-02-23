Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA16A027F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 06:43:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499894.771241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4OQ-0005Pq-Lf; Thu, 23 Feb 2023 05:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499894.771241; Thu, 23 Feb 2023 05:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4OQ-0005Nq-HU; Thu, 23 Feb 2023 05:43:46 +0000
Received: by outflank-mailman (input) for mailman id 499894;
 Thu, 23 Feb 2023 05:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uapr=6T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pV4OP-0005Ng-A5
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 05:43:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08963795-b33d-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 06:43:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 659243768C;
 Thu, 23 Feb 2023 05:43:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2D4A13524;
 Thu, 23 Feb 2023 05:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HYwiNQ799mMlJAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Feb 2023 05:43:42 +0000
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
X-Inumbo-ID: 08963795-b33d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677131023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IHejay9Cos6UnBIHVby2h+E6MdwHaWOzzvaCEWnrVvY=;
	b=qRvWcxOJtWBACJ32nfR9kQdfXGU8GxwXREVdzbS1/skSX6gmr0kZGd3R7gxT8UsrC7w9aC
	vIK5COUmX/pmX8cMvObyQlm/mf0tL0Sw6+7NL74LgKAFiZmgTpfnkZVdShsfI6NfFV+E8H
	M7t5aRULTTI87Gs73jX5d/2Q7Ia51z4=
Message-ID: <98d0ac9a-66af-6fdd-ff19-d4805a57f8d9@suse.com>
Date: Thu, 23 Feb 2023 06:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 0/2] x86/xen TSC related cleanups
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Anthony Liguori
 <aliguori@amazon.com>, David Reaver <me@davidreaver.com>,
 Brendan Gregg <brendan@intel.com>
References: <cover.1677038165.git.kjlx@templeofstupid.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <cover.1677038165.git.kjlx@templeofstupid.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XPqT0GIeb0bfN0VKqzFykd2d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XPqT0GIeb0bfN0VKqzFykd2d
Content-Type: multipart/mixed; boundary="------------Y0rDYZBjuwBEPs36bRHEABMN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Krister Johansen <kjlx@templeofstupid.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Anthony Liguori
 <aliguori@amazon.com>, David Reaver <me@davidreaver.com>,
 Brendan Gregg <brendan@intel.com>
Message-ID: <98d0ac9a-66af-6fdd-ff19-d4805a57f8d9@suse.com>
Subject: Re: [PATCH linux-next v2 0/2] x86/xen TSC related cleanups
References: <cover.1677038165.git.kjlx@templeofstupid.com>
In-Reply-To: <cover.1677038165.git.kjlx@templeofstupid.com>

--------------Y0rDYZBjuwBEPs36bRHEABMN
Content-Type: multipart/mixed; boundary="------------FdNJxns2APFImyPwxgf1iouK"

--------------FdNJxns2APFImyPwxgf1iouK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjMgMTg6NTQsIEtyaXN0ZXIgSm9oYW5zZW4gd3JvdGU6DQo+IEhpLA0KPiBF
bmNsb3NlZCBwbGVhc2UgZmluZCBhIHBhaXIgb2YgcGF0Y2hlcyB0aGF0IHBlcmZvcm0gc29t
ZSBhZGRpdGlvbmFsIGNsZWFudXANCj4gdGhhdCB3YXMgc3VnZ2VzdGVkIGJ5IEJvcmlzLCBK
YW4gYW5kIFRob21hcy4NCj4gDQo+IFNwZWNpZmljYWxseTogdGhpcyByZXN5bmMncyBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vY3B1aWQuaCBmcm9tIGl0cw0KPiB1cHN0cmVhbSBzb3Vy
Y2UgaW4gdGhlIFhlbiB0cmVlLCBhbmQgdGhlbiB1c2VzIG9uZSBvZiB0aGUgbmV3ICNkZWZp
bmUtcyB0bw0KPiByZXBsYWNlIGEgY29uc3RhbnQgaW4geDg2L3hlbi90aW1lLmMgdGhhdCB3
YXMgcHJldmlvdXNseSBvbmx5IG51bWVyaWNhbGx5DQo+IGRlZmluZWQuICBQZWRhbnRpYyBj
b2RlIGZyb20gdjEgaXMgZHJvcHBlZCBpbiBmYXZvciBvZiBhIG1vcmUgYXBwcm9wcmlhdGUN
Cj4gcmV0dXJuIHN0YXRlbWVudC4NCj4gDQo+IENoYW5nZXMgZnJvbSB2MToNCj4gDQo+IC0g
Q29kaW5nIHN0eWxlIGZpeHVwIGluIGFyY2gveDg2L3hlbi90aW1lLmMgKEZlZWRiYWNrIGZy
b20gVGhvbWFzIEdsZWl4bmVyKQ0KPiANCj4gDQo+IEtyaXN0ZXIgSm9oYW5zZW4gKDIpOg0K
PiAgICB4ZW46IHVwZGF0ZSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vY3B1aWQuaA0KPiAg
ICB4ODYveGVuL3RpbWU6IGNsZWFudXAgeGVuX3RzY19zYWZlX2Nsb2Nrc291cmNlDQo+IA0K
PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9jcHVpZC5oIHwgMjIgKysrKysrKysrKysr
KysrKysrLS0tLQ0KPiAgIGFyY2gveDg2L3hlbi90aW1lLmMgICAgICAgICAgICAgIHwgIDcg
KystLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkNCj4gDQoNCkZvciBib3RoIHBhdGNoZXM6DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------FdNJxns2APFImyPwxgf1iouK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FdNJxns2APFImyPwxgf1iouK--

--------------Y0rDYZBjuwBEPs36bRHEABMN--

--------------XPqT0GIeb0bfN0VKqzFykd2d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP2/Q4FAwAAAAAACgkQsN6d1ii/Ey8C
wwgAhnL8X2zH5z7EA+RoNKpROeQo1zhcJRQo6ThHhQXu+1WiKD0CQtD7LdyFXSrwKpa6nEOh1Efq
EtfNrZD8D/QVCPRz5E+JkaFdG5P+wD0rIpZTv/R+zm6Rs9jpiyMG5SNKS+V8YtO8SzHp9cVJIL4W
gbRrYo4oxtkvWhq8y6RnrZ12/F52VPIrIycaW0pE6jj1ZEp1IgWYIyLyX5JBL+W0LVGRMXK25gQz
FfxCYYapsq9DOByLNCRs/csbdvo6NKSgXzDuJwbOr5MtIts1zJl7WSDde6LpCmC3XAewPzdTnyJE
a634XwoTPaowTktpbAoGLzkxqb3OJ9gLtDviZDO0wQ==
=KuN2
-----END PGP SIGNATURE-----

--------------XPqT0GIeb0bfN0VKqzFykd2d--

