Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121E95EB9D5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 07:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412252.655486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od3Mi-0006KF-0K; Tue, 27 Sep 2022 05:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412252.655486; Tue, 27 Sep 2022 05:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od3Mh-0006Gz-TA; Tue, 27 Sep 2022 05:42:43 +0000
Received: by outflank-mailman (input) for mailman id 412252;
 Tue, 27 Sep 2022 05:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1od3Mg-0006Gq-7f
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 05:42:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31626c7a-3e27-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 07:42:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C05B721E15;
 Tue, 27 Sep 2022 05:42:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 771A613486;
 Tue, 27 Sep 2022 05:42:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 80J4G0yNMmMBTwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Sep 2022 05:42:36 +0000
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
X-Inumbo-ID: 31626c7a-3e27-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664257356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PoGypo9wabagz5Ez5shORs5Ik4cT/A/oGecV3TXkpDY=;
	b=i0ZtE1nhM6kQ+65pq0bYIZGDaHGCzqg9o50wkaLMz+4JgeJnutZclydSChYW8cRB41l4KV
	XUuB7yLFmJQOwOuvZKaXZAzqIgefxC9IN3oECiJxZNTBmcyZvmaB6CWufml16IML/OFOnf
	W1TBPrGDAs/x/EGhnbY3MSVf8RPO+N0=
Message-ID: <3dba20a4-20d0-6cff-68be-25e9ca365764@suse.com>
Date: Tue, 27 Sep 2022 07:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] xen/pv: allow pmu msr accesses to cause GP
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-2-jgross@suse.com>
 <b9c7a953-dbfa-164f-7a18-1e230c70e124@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b9c7a953-dbfa-164f-7a18-1e230c70e124@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EwXwm3Tkt105kt7C7sMEZbTc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EwXwm3Tkt105kt7C7sMEZbTc
Content-Type: multipart/mixed; boundary="------------vKayfY0gx8rXGtDotio2W0Vl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <3dba20a4-20d0-6cff-68be-25e9ca365764@suse.com>
Subject: Re: [PATCH 1/3] xen/pv: allow pmu msr accesses to cause GP
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-2-jgross@suse.com>
 <b9c7a953-dbfa-164f-7a18-1e230c70e124@oracle.com>
In-Reply-To: <b9c7a953-dbfa-164f-7a18-1e230c70e124@oracle.com>

--------------vKayfY0gx8rXGtDotio2W0Vl
Content-Type: multipart/mixed; boundary="------------C4t0bHUmD704yIDltWCwzrMq"

--------------C4t0bHUmD704yIDltWCwzrMq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMjI6MDksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToNCj4gDQo+IE9uIDkv
MjYvMjIgMTA6MTggQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiDCoCBib29sIHBtdV9t
c3JfcmVhZCh1bnNpZ25lZCBpbnQgbXNyLCB1aW50NjRfdCAqdmFsLCBpbnQgKmVycikNCj4+
IMKgIHsNCj4+IMKgwqDCoMKgwqAgaWYgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBY
ODZfVkVORE9SX0lOVEVMKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGlzX2FtZF9wbXVf
bXNyKG1zcikpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgheGVuX2FtZF9w
bXVfZW11bGF0ZShtc3IsIHZhbCwgMSkpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICp2YWwgPSBuYXRpdmVfcmVhZF9tc3Jfc2FmZShtc3IsIGVycik7DQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIWlzX2FtZF9wbXVfbXNyKG1zcikpDQo+IA0KPiANCj4gWW91IHNob3VsZCBiZSBhYmxl
IHRvIG1vdmUgdmVuZG9yIGNoZWNrIGluc2lkZSBpc188dmVuZG9yPl9wbXVfbXNyKCkuDQoN
CkkgbGlrZSB0aGF0LiBUb2dldGhlciB3aXRoIEphbidzIHN1Z2dlc3Rpb24gdGhpcyBtYWtl
cyB0aGUgY29kZSBtdWNoDQptb3JlIHJlYWRhYmxlIQ0KDQoNCkp1ZXJnZW4NCg0K
--------------C4t0bHUmD704yIDltWCwzrMq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------C4t0bHUmD704yIDltWCwzrMq--

--------------vKayfY0gx8rXGtDotio2W0Vl--

--------------EwXwm3Tkt105kt7C7sMEZbTc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMyjUwFAwAAAAAACgkQsN6d1ii/Ey/V
Jgf/VHdlpbEEF9O3+AACXavw9TkrLv1+EcWudH/OH55CttV6npJ66vC4uNQEeq0DGmhBJqsRYdmZ
kNhnYbvRYxPbMWo/4KvWIGeGYhElxEXkN9QGF3hPxFvWIX8Jy6UDOiaQcUmHDcyfAyeKLA2W+XPF
zwzqgJCWtgf8cfXjTJHL7Lw83UpeYyTATThzdmA1esrXLVy7N5Sjg766uw27BRbe+FRV53LAxU4D
w87avl+FQF1TjHJRD9iA/Z6KLFytWyfjlQG52e3mD0C8SIYSa+Jv9X7tBBaXUkSyaHHmWEWPC+ap
+OJzh0fMZ5ErdYjCVbGa4GhhtpwcD0Pu8Idj/ChOSA==
=K9Zs
-----END PGP SIGNATURE-----

--------------EwXwm3Tkt105kt7C7sMEZbTc--

