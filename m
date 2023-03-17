Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FD6BE989
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 13:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511057.789820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9Py-0000KE-16; Fri, 17 Mar 2023 12:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511057.789820; Fri, 17 Mar 2023 12:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd9Px-0000IK-UM; Fri, 17 Mar 2023 12:42:45 +0000
Received: by outflank-mailman (input) for mailman id 511057;
 Fri, 17 Mar 2023 12:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pd9Pw-0000IE-JH
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 12:42:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35e0fa62-c4c1-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 13:42:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC7DE1FDDC;
 Fri, 17 Mar 2023 12:42:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 320931346F;
 Fri, 17 Mar 2023 12:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hBinCkJgFGQjPQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 12:42:42 +0000
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
X-Inumbo-ID: 35e0fa62-c4c1-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679056962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Njm+U9Z10TpqIECiFfzVKOTTFwr1U3KjV2a1BvL/cA4=;
	b=PtT/cSCpmtDQMT8de39EoSidtKmaO5CmCqyRuc9tx2rU+8no0M8s+fzKFid+21FceONW9p
	QOwmv9J94SHsdHR3x//D7bdWabKAwn/77Y0HP53fp3C09Y/18w9Ylh33t79GKAjHrKPjou
	wy7jdvCG0W2Wvu8/NiDtGfxM3Lftx3Y=
Message-ID: <17ffe417-8ea0-df98-a8b7-8c370839134f@suse.com>
Date: Fri, 17 Mar 2023 13:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, josef@oderland.se,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 Alex Chiang <achiang@hp.com>, linux-acpi@vger.kernel.org
References: <20230316164257.42590-1-roger.pau@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230316164257.42590-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------omThfDjgIeq3LyTkS0HVR9nh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------omThfDjgIeq3LyTkS0HVR9nh
Content-Type: multipart/mixed; boundary="------------1UqSXqjj5KvqywtnoydqCsn3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, josef@oderland.se,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 Alex Chiang <achiang@hp.com>, linux-acpi@vger.kernel.org
Message-ID: <17ffe417-8ea0-df98-a8b7-8c370839134f@suse.com>
Subject: Re: [PATCH v4] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
References: <20230316164257.42590-1-roger.pau@citrix.com>
In-Reply-To: <20230316164257.42590-1-roger.pau@citrix.com>

--------------1UqSXqjj5KvqywtnoydqCsn3
Content-Type: multipart/mixed; boundary="------------BuHd0npQfCBUCFrCT2e85RGX"

--------------BuHd0npQfCBUCFrCT2e85RGX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjMgMTc6NDIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gSW4gQUNQSSBz
eXN0ZW1zLCB0aGUgT1MgY2FuIGRpcmVjdCBwb3dlciBtYW5hZ2VtZW50LCBhcyBvcHBvc2Vk
IHRvIHRoZQ0KPiBmaXJtd2FyZS4gIFRoaXMgT1MtZGlyZWN0ZWQgUG93ZXIgTWFuYWdlbWVu
dCBpcyBjYWxsZWQgT1NQTS4gIFBhcnQgb2YNCj4gdGVsbGluZyB0aGUgZmlybXdhcmUgdGhh
dCB0aGUgT1MgZ29pbmcgdG8gZGlyZWN0IHBvd2VyIG1hbmFnZW1lbnQgaXMNCj4gbWFraW5n
IEFDUEkgIl9QREMiIChQcm9jZXNzb3IgRHJpdmVyIENhcGFiaWxpdGllcykgY2FsbHMuICBU
aGVzZSBfUERDDQo+IG1ldGhvZHMgbXVzdCBiZSBldmFsdWF0ZWQgZm9yIGV2ZXJ5IHByb2Nl
c3NvciBvYmplY3QuICBJZiB0aGVzZSBfUERDDQo+IGNhbGxzIGFyZSBub3QgY29tcGxldGVk
IGZvciBldmVyeSBwcm9jZXNzb3IgaXQgY2FuIGxlYWQgdG8NCj4gaW5jb25zaXN0ZW5jeSBh
bmQgbGF0ZXIgZmFpbHVyZXMgaW4gdGhpbmdzIGxpa2UgdGhlIENQVSBmcmVxdWVuY3kNCj4g
ZHJpdmVyLg0KPiANCj4gSW4gYSBYZW4gc3lzdGVtLCB0aGUgZG9tMCBrZXJuZWwgaXMgcmVz
cG9uc2libGUgZm9yIHN5c3RlbS13aWRlIHBvd2VyDQo+IG1hbmFnZW1lbnQuICBUaGUgZG9t
MCBrZXJuZWwgaXMgaW4gY2hhcmdlIG9mIE9TUE0uICBIb3dldmVyLCB0aGUNCj4gbnVtYmVy
IG9mIENQVXMgYXZhaWxhYmxlIHRvIGRvbTAgY2FuIGJlIGRpZmZlcmVudCB0aGFuIHRoZSBu
dW1iZXIgb2YNCj4gQ1BVcyBwaHlzaWNhbGx5IHByZXNlbnQgb24gdGhlIHN5c3RlbS4NCj4g
DQo+IFRoaXMgbGVhZHMgdG8gYSBwcm9ibGVtOiB0aGUgZG9tMCBrZXJuZWwgbmVlZHMgdG8g
ZXZhbHVhdGUgX1BEQyBmb3INCj4gYWxsIHRoZSBwcm9jZXNzb3JzLCBidXQgaXQgY2FuJ3Qg
YWx3YXlzIHNlZSB0aGVtLg0KPiANCj4gSW4gZG9tMCBrZXJuZWxzLCBpZ25vcmUgdGhlIGV4
aXN0aW5nIEFDUEkgbWV0aG9kIGZvciBkZXRlcm1pbmluZyBpZiBhDQo+IHByb2Nlc3NvciBp
cyBwaHlzaWNhbGx5IHByZXNlbnQgYmVjYXVzZSBpdCBtaWdodCBub3QgYmUgYWNjdXJhdGUu
DQo+IEluc3RlYWQsIGFzayB0aGUgaHlwZXJ2aXNvciBmb3IgdGhpcyBpbmZvcm1hdGlvbi4N
Cj4gDQo+IEZpeCB0aGlzIGJ5IGludHJvZHVjaW5nIGEgY3VzdG9tIGZ1bmN0aW9uIHRvIHVz
ZSB3aGVuIHJ1bm5pbmcgYXMgWGVuDQo+IGRvbTAgaW4gb3JkZXIgdG8gY2hlY2sgd2hldGhl
ciBhIHByb2Nlc3NvciBvYmplY3QgbWF0Y2hlcyBhIENQVSB0aGF0J3MNCj4gb25saW5lLiAg
U3VjaCBjaGVja2luZyBpcyBkb25lIHVzaW5nIHRoZSBleGlzdGluZyBpbmZvcm1hdGlvbiBm
ZXRjaGVkDQo+IGJ5IHRoZSBYZW4gcENQVSBzdWJzeXN0ZW0sIGV4dGVuZGluZyBpdCB0byBh
bHNvIHN0b3JlIHRoZSBBQ1BJIElELg0KPiANCj4gVGhpcyBlbnN1cmVzIHRoYXQgX1BEQyBt
ZXRob2QgZ2V0cyBldmFsdWF0ZWQgZm9yIGFsbCBwaHlzaWNhbGx5IG9ubGluZQ0KPiBDUFVz
LCByZWdhcmRsZXNzIG9mIHRoZSBudW1iZXIgb2YgQ1BVcyBtYWRlIGF2YWlsYWJsZSB0byBk
b20wLg0KPiANCj4gRml4ZXM6IDVkNTU0YTdiYjA2NCAoJ0FDUEk6IHByb2Nlc3NvcjogYWRk
IGludGVybmFsIHByb2Nlc3Nvcl9waHlzaWNhbGx5X3ByZXNlbnQoKScpDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg0K
--------------BuHd0npQfCBUCFrCT2e85RGX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BuHd0npQfCBUCFrCT2e85RGX--

--------------1UqSXqjj5KvqywtnoydqCsn3--

--------------omThfDjgIeq3LyTkS0HVR9nh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQUYEEFAwAAAAAACgkQsN6d1ii/Ey8O
PggAhYz+qsT9bmr2RI1H1K3AgwqvREyB/CA4FU49+hvXYbHAePWoKtqpGnvOnfg+k191vhMKV8FZ
hwo67mBCjvO2gAR2jCG/temoC6/I00u45By6L1l/SNowovHcDW6SO2hlO6qFwRGi9toUKZjRJjBX
tTnoS50LsiPFmhnrbA3Lwb74pQlTwqfO7PfaxOgbzcEfMddk1K7K5V4rhLAC89q90E5o7UmzegLR
6sbu12XMvAh78LyaK89X1uPUrA3RhOJeImAT9Aw3QaPPYIzaQu1e4fBJKa1y2we+jcy0LWQ27i83
TtC/2QkzWhfTf6pXwQAn2BblXgKpb3G7RnPNrpn/8g==
=iFUi
-----END PGP SIGNATURE-----

--------------omThfDjgIeq3LyTkS0HVR9nh--

