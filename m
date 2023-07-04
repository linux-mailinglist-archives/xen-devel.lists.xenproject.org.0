Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528F74691E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 07:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558163.872017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGYoX-0001B9-8V; Tue, 04 Jul 2023 05:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558163.872017; Tue, 04 Jul 2023 05:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGYoX-00018r-5S; Tue, 04 Jul 2023 05:43:01 +0000
Received: by outflank-mailman (input) for mailman id 558163;
 Tue, 04 Jul 2023 05:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KXt5=CW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qGYoW-00018l-Bi
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 05:43:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a17b73e6-1a2d-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 07:42:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A50972033E;
 Tue,  4 Jul 2023 05:42:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5787D1377F;
 Tue,  4 Jul 2023 05:42:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cT3kE2Gxo2QyXgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 04 Jul 2023 05:42:57 +0000
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
X-Inumbo-ID: a17b73e6-1a2d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688449377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NwuPs6s1tLTrj/NTRQSBFohPKNsbBrgq7cDUM/Uak0=;
	b=m9Km9mZhS2F9ZjGxYlpibsKVONF/cnBP+sjkMfAJ1EF0wct5Cz22mHvDxsOAAF2EOQFTig
	VZOgVXGochqhf/kAbmgJTk8fMerLOt+bz17uGVN0a62wupZoIpWnwcxitnOn7QVay+atXM
	IJ3FAxa9mbd/8sl9PAq/eWAXnRkMOi0=
Message-ID: <58f3bf1b-c5dd-7ac1-e765-7fa7eb0ba51b@suse.com>
Date: Tue, 4 Jul 2023 07:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86/xen: fix secondary processor fpu initialization
Content-Language: en-US
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20230703130032.22916-1-jgross@suse.com>
 <573ce7fa-d64f-7351-b64d-01692fc87512@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <573ce7fa-d64f-7351-b64d-01692fc87512@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Gw70l1b7G08YSUIj0nFX09au"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Gw70l1b7G08YSUIj0nFX09au
Content-Type: multipart/mixed; boundary="------------vAlMdTjTE2SXGQIzESyPAfiN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <58f3bf1b-c5dd-7ac1-e765-7fa7eb0ba51b@suse.com>
Subject: Re: [PATCH] x86/xen: fix secondary processor fpu initialization
References: <20230703130032.22916-1-jgross@suse.com>
 <573ce7fa-d64f-7351-b64d-01692fc87512@oracle.com>
In-Reply-To: <573ce7fa-d64f-7351-b64d-01692fc87512@oracle.com>

--------------vAlMdTjTE2SXGQIzESyPAfiN
Content-Type: multipart/mixed; boundary="------------z39WHiKNaxFZC80ifpMOBC5K"

--------------z39WHiKNaxFZC80ifpMOBC5K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDcuMjMgMTk6NTEsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IA0KPiBP
biA3LzMvMjMgOTowMCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE1vdmluZyB0aGUg
Y2FsbCBvZiBmcHVfX2luaXRfY3B1KCkgZnJvbSBjcHVfaW5pdCgpIHRvIHN0YXJ0X3NlY29u
ZGFyeSgpDQo+PiBicm9rZSBYZW4gUFYgZ3Vlc3RzLCBhcyB0aG9zZSBkb24ndCBjYWxsIHN0
YXJ0X3NlY29uZGFyeSgpIGZvciBBUHMuDQo+Pg0KPj4gRml4IHRoYXQgYnkgYWRkaW5nIHRo
ZSBjYWxsIG9mIGZwdV9faW5pdF9jcHUoKSB0byBjcHVfYnJpbmd1cCgpLCB3aGljaA0KPj4g
aXMgdGhlIFhlbiBQViByZXBsYWNlbWVudCBvZiBzdGFydF9zZWNvbmRhcnkoKS4NCj4+DQo+
PiBGaXhlczogYjgxZmFjOTA2YThmICgieDg2L2ZwdTogTW92ZSBGUFUgaW5pdGlhbGl6YXRp
b24gaW50byANCj4+IGFyY2hfY3B1X2ZpbmFsaXplX2luaXQoKSIpDQo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiANCj4gUmV2aWV3
ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+DQo+
IA0KDQp4ODYgbWFpbnRhaW5lcnMsIGNvdWxkIHRoaXMgcGxlYXNlIGdvIHRocm91Z2ggdGhl
IHRpcCB0cmVlPyBUaGUgcGF0Y2ggaXMNCmRlcGVuZGluZyBvbiBvdGhlciA2LjUgcGF0Y2hl
cyB3aGljaCB3ZW50IGluIHZpYSB0aXAuDQoNCg0KSnVlcmdlbg0K
--------------z39WHiKNaxFZC80ifpMOBC5K
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------z39WHiKNaxFZC80ifpMOBC5K--

--------------vAlMdTjTE2SXGQIzESyPAfiN--

--------------Gw70l1b7G08YSUIj0nFX09au
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSjsWAFAwAAAAAACgkQsN6d1ii/Ey96
owf/X5ApjLsFhOrNfLewRK+1nkdEKFhRd1kjNymIMz3R4KAfY4jJehV269qXMFoND6JqxGjsCn1z
a85JSXBG7Hs4Z9bW00eNObpWeLrCJfUio/s5SSaASN0F6yoJ6RRBDIH0kg67VbuNR/5MEWCjJEy5
ed9aOJS7mrgRkPAUu/KdhgTAkrGvWpembXDm3DDSIgv8YnEtzBw8Js9x0hHUdgQNq3jr5uhO1fV+
Lf0O8M5khNujTiaw9yBP9JRRENzvWIIVx1JfqHo+fhfMEuXxOLB048ytLkQbZHjCBuZb9/9PdoU8
q5aB0zhlLT0b9KZbOESIJoTMWQRkLNE9RwHiJitWBw==
=4DAt
-----END PGP SIGNATURE-----

--------------Gw70l1b7G08YSUIj0nFX09au--

