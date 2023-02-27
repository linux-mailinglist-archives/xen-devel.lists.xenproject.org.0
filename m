Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35126A3B91
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502213.773901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWXgL-0003xB-2s; Mon, 27 Feb 2023 07:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502213.773901; Mon, 27 Feb 2023 07:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWXgL-0003ux-01; Mon, 27 Feb 2023 07:12:21 +0000
Received: by outflank-mailman (input) for mailman id 502213;
 Mon, 27 Feb 2023 07:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQU0=6X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pWXgI-0003up-Os
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:12:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113c92ec-b66e-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 08:12:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B423E1F8D9;
 Mon, 27 Feb 2023 07:12:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72C4713912;
 Mon, 27 Feb 2023 07:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q82PGtBX/GMvEwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Feb 2023 07:12:16 +0000
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
X-Inumbo-ID: 113c92ec-b66e-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677481936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HrnKxVaut6r2CDXXVOLh3BVxvIQd87Rgz8HeOc9Ihog=;
	b=XarnUwPi8XWpYFfE6Gv/laLV6++lwZ1otC8r0d3wg87x3jFJjPXGvkHNOEHXAULCQY5QX8
	4bFVFwrdpin9/bp0oe7+KCEGal9rsFcRsRa9P2EMDQNQaCfk3Z1RCvhB/YB1rN7ej2bc01
	j9xdD1PECarFVXxCbdeIcR0JtRHc+7Q=
Message-ID: <58248946-f0ad-ae3b-57a6-f7c15fd35198@suse.com>
Date: Mon, 27 Feb 2023 08:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 05/12] x86/xen: set MTRR state when running as Xen PV
 initial domain
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20230223093243.1180-1-jgross@suse.com>
 <20230223093243.1180-6-jgross@suse.com>
 <a7897030-d420-a741-074a-6e21e7c1629b@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a7897030-d420-a741-074a-6e21e7c1629b@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FFhz6EPCdS2w65o3ZOx2Fueq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FFhz6EPCdS2w65o3ZOx2Fueq
Content-Type: multipart/mixed; boundary="------------3AbvFZgihGkaTRnWYQWVXIY1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <58248946-f0ad-ae3b-57a6-f7c15fd35198@suse.com>
Subject: Re: [PATCH v3 05/12] x86/xen: set MTRR state when running as Xen PV
 initial domain
References: <20230223093243.1180-1-jgross@suse.com>
 <20230223093243.1180-6-jgross@suse.com>
 <a7897030-d420-a741-074a-6e21e7c1629b@oracle.com>
In-Reply-To: <a7897030-d420-a741-074a-6e21e7c1629b@oracle.com>

--------------3AbvFZgihGkaTRnWYQWVXIY1
Content-Type: multipart/mixed; boundary="------------is035BEUsBjXegdxGlJ800sJ"

--------------is035BEUsBjXegdxGlJ800sJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjMgMjI6MDAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IE9uIDIv
MjMvMjMgNDozMiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+ICsNCj4+ICsJZm9yIChy
ZWcgPSAwOyByZWcgPCBNVFJSX01BWF9WQVJfUkFOR0VTOyByZWcrKykgew0KPj4gKwkJb3Au
dS5yZWFkX21lbXR5cGUucmVnID0gcmVnOw0KPj4gKwkJaWYgKEhZUEVSVklTT1JfcGxhdGZv
cm1fb3AoJm9wKSkNCj4+ICsJCQlicmVhazsNCj4gDQo+IA0KPiBJZiB3ZSBmYWlsIG9uIHRo
ZSBmaXJzdCBpdGVyYXRpb24sIGRvIHdlIHN0aWxsIHdhbnQgdG8gbWFyayBNVFJScyBhcmUg
DQo+IGVuYWJsZWQvc2V0IGluIG10cnJfb3ZlcndyaXRlX3N0YXRlKCk/DQoNCkhtbSwgZ29v
ZCBpZGVhLg0KDQpJIHRoaW5rIHdlIHNob3VsZCBqdXN0IGRyb3AgdGhlIGNhbGwgb2YgbXRy
cl9vdmVyd3JpdGVfc3RhdGUoKSBpbiB0aGlzDQpjYXNlLg0KDQoNCkp1ZXJnZW4NCg0K
--------------is035BEUsBjXegdxGlJ800sJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------is035BEUsBjXegdxGlJ800sJ--

--------------3AbvFZgihGkaTRnWYQWVXIY1--

--------------FFhz6EPCdS2w65o3ZOx2Fueq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP8V9AFAwAAAAAACgkQsN6d1ii/Ey+G
Mgf9H5XiC1lDgClmPf2qn1uk/Tyz0nK83qR4lCovObg3Rros66mM9e0pM3ybs/Qn03T1sHbpQyCp
9lo20ytE6JStlCP/tZ1/L4cYXXvxSo4tImy7Q4Tg2Pr7+czIrBCUKv/KeqL2XIrLRKcSj2T4fVlO
z4wrEZEgFFZhJDKt33QKJ9GaniukeTOrJ8/iM2VtA2QV2BIKVZYFHCxd2lGR9pFQ98i9SghpoVW6
c95mhqVdAuqYSVXBqLtqqg8gE1AdTVxRMQkqmXMoYZS2gCVA4MwZTAGOysv6Nh/i08PVb2Oakqrv
A9r3kpaUStEP7GxVYAm3Z5xW+9sGjCEy1H/YyUQ8eg==
=m39Q
-----END PGP SIGNATURE-----

--------------FFhz6EPCdS2w65o3ZOx2Fueq--

