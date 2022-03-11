Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5D4D5F43
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288892.490028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScLV-0000Jz-Ar; Fri, 11 Mar 2022 10:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288892.490028; Fri, 11 Mar 2022 10:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScLV-0000HT-7q; Fri, 11 Mar 2022 10:18:05 +0000
Received: by outflank-mailman (input) for mailman id 288892;
 Fri, 11 Mar 2022 10:18:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nScLT-0000HM-D2
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:18:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887a2049-a124-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 11:18:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC9851F381;
 Fri, 11 Mar 2022 10:18:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9641113A85;
 Fri, 11 Mar 2022 10:18:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1u83I9khK2J2bgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 10:18:01 +0000
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
X-Inumbo-ID: 887a2049-a124-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646993881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7u/Is2UVOTX2rGvOKQ7rmncsGAw6e42zAkYb7StfEtc=;
	b=uFq27mJhT5U5ggt7EJDgioAucBJqDZ4A4R+ZxquTJCKRLrMmLgNkc6h4ivqzQW+GlHiExG
	kLCH5IW+Ly0HKmL6DmeQpvhEwFyktGGlOoP4H7sPTMNhvTA3IaS4JYVbhR/5fNnsKIIOTT
	IIy4aH5N+fLuTVCqz14jGgIuwsnSpUQ=
Message-ID: <918fd4d8-99d6-3acf-0637-7feda1e08f71@suse.com>
Date: Fri, 11 Mar 2022 11:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <378565ed-80d4-e760-2e25-f5d2e4cb9ce2@suse.com>
 <0D3FFA8E-A904-4375-BDBB-2C974C224D14@arm.com>
 <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
 <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0pqQkUBWGNXKVW8srhnUDx1e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0pqQkUBWGNXKVW8srhnUDx1e
Content-Type: multipart/mixed; boundary="------------Zq025EPAKVJYfvpf0uuZQBG5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <918fd4d8-99d6-3acf-0637-7feda1e08f71@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <378565ed-80d4-e760-2e25-f5d2e4cb9ce2@suse.com>
 <0D3FFA8E-A904-4375-BDBB-2C974C224D14@arm.com>
 <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
 <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
In-Reply-To: <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>

--------------Zq025EPAKVJYfvpf0uuZQBG5
Content-Type: multipart/mixed; boundary="------------TrY2l8hce2QOx8n0b0EoY7zm"

--------------TrY2l8hce2QOx8n0b0EoY7zm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjIgMTA6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wMy4yMDIy
IDEwOjI5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTEuMDMuMjIgMDk6NTYsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IE9uIDExIE1hciAyMDIyLCBhdCAwODowOSwgSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4gT24gMTAuMDMuMjIg
MTg6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+
PiArKysgYi94ZW4vY29tbW9uL2Jvb3RfY3B1cG9vbHMuYw0KPj4+Pj4gQEAgLTAsMCArMSwy
MTIgQEANCj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0K
Pj4+Pj4gKy8qDQo+Pj4+PiArICogeGVuL2NvbW1vbi9ib290X2NwdXBvb2xzLmMNCj4+Pj4+
ICsgKg0KPj4+Pj4gKyAqIENvZGUgdG8gY3JlYXRlIGNwdXBvb2xzIGF0IGJvb3QgdGltZSBm
b3IgYXJtIGFyY2hpdGVjdHVyZS4NCj4+Pj4NCj4+Pj4gUGxlYXNlIGRyb3AgdGhlIGFybSBy
ZWZlcmVuY2UgaGVyZS4NCj4+Pj4NCj4+Pj4+ICsgKg0KPj4+Pj4gKyAqIENvcHlyaWdodCAo
QykgMjAyMiBBcm0gTHRkLg0KPj4+Pj4gKyAqLw0KPj4+Pj4gKw0KPj4+Pj4gKyNpbmNsdWRl
IDx4ZW4vc2NoZWQuaD4NCj4+Pj4+ICsNCj4+Pj4+ICsjZGVmaW5lIEJUQ1BVUE9PTFNfRFRf
Tk9ERV9OT19SRUcgICAgICgtMSkNCj4+Pj4+ICsjZGVmaW5lIEJUQ1BVUE9PTFNfRFRfTk9E
RV9OT19MT0dfQ1BVICgtMikNCj4+Pj4NCj4+Pj4gTW92ZSB0aG9zZSBpbnNpZGUgdGhlICNp
ZmRlZiBiZWxvdywgcGxlYXNlDQo+Pj4+DQo+Pj4+PiArDQo+Pj4+PiArc3RydWN0IHBvb2xf
bWFwIHsNCj4+Pj4+ICsgICAgaW50IHBvb2xfaWQ7DQo+Pj4+PiArICAgIGludCBzY2hlZF9p
ZDsNCj4+Pj4+ICsgICAgc3RydWN0IGNwdXBvb2wgKnBvb2w7DQo+Pj4+PiArfTsNCj4+Pj4+
ICsNCj4+Pj4+ICtzdGF0aWMgc3RydWN0IHBvb2xfbWFwIF9faW5pdGRhdGEgcG9vbF9jcHVf
bWFwW05SX0NQVVNdID0NCj4+Pj4+ICsgICAgeyBbMCAuLi4gTlJfQ1BVUy0xXSA9IHsucG9v
bF9pZCA9IC0xLCAuc2NoZWRfaWQgPSAtMSwgLnBvb2wgPSBOVUxMfSB9Ow0KPj4+Pj4gK3N0
YXRpYyB1bnNpZ25lZCBpbnQgX19pbml0ZGF0YSBuZXh0X3Bvb2xfaWQ7DQo+Pj4+PiArDQo+
Pj4+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pj4NCj4+Pj4gU2hvdWxkbid0IHRoaXMgYmUg
Q09ORklHX0hBU19ERVZJQ0VfVFJFRT8NCj4+Pg0KPj4+IFllcywgdGhlIG9ubHkgcHJvYmxl
bSBpcyB0aGF0IGluIGdldF9sb2dpY2FsX2NwdV9mcm9tX2h3X2lkIEkgdXNlIHRoZSBhcm0g
c3BlY2lmaWMNCj4+PiBjcHVfbG9naWNhbF9tYXAo4oCmKSwgc28gd2hhdCBkbyB5b3UgdGhp
bmsgaXTigJlzIHRoZSBiZXR0ZXIgd2F5IGhlcmU/DQo+Pj4gRG8geW91IHRoaW5rIEkgc2hv
dWxkIGhhdmUgZXZlcnl0aGluZyB1bmRlciBDT05GSUdfSEFTX0RFVklDRV9UUkVFDQo+Pj4g
YW5kIGdldF9sb2dpY2FsX2NwdV9mcm9tX2h3X2lkIHVuZGVyIENPTkZJR19BUk0gbGlrZSBp
biB0aGlzIHdheSBiZWxvdz8NCj4+DQo+PiBIbW0sIHdoYXQgaXMgdGhlIGh3aWQgdXNlZCBm
b3Igb24gQXJtPyBJIGd1ZXNzIHRoaXMgY291bGQgYmUgc2ltaWxhcg0KPj4gdG8gdGhlIHg4
NiBhY3BpLWlkPw0KPiANCj4gU2luY2UgdGhlcmUncyBnb2luZyB0byBiZSBvbmx5IG9uZSBv
ZiBEVCBvciBBQ1BJLCBpZiBhbnl0aGluZyB0aGlzIGNvdWxkDQo+IGJlIHRoZSBBUElDIElE
IGFuZCB0aGVuIC4uLg0KPiANCj4+IFNvIEknZCByYXRoZXIgcHV0IGdldF9sb2dpY2FsX2Nw
dV9mcm9tX2h3X2lkKCkgaW50byBBcm0gc3BlY2lmaWMgY29kZQ0KPj4gYW5kIGFkZCBhIHJl
bGF0ZWQgeDg2IGZ1bmN0aW9uIHRvIHg4NiBjb2RlLiBEZXBlbmRpbmcgb24gdGhlIGFuc3dl
ciB0bw0KPj4gYWJvdmUgcXVlc3Rpb24gdGhpcyBjb3VsZCBlaXRoZXIgYmUgZ2V0X2NwdV9p
ZCgpLCBvciBtYXliZSBhbiBpZGVudGl0eQ0KPj4gZnVuY3Rpb24uDQo+IA0KPiAuLi4gYSBs
b29rdXAgbG9vcCBvdmVyIHg4Nl9jcHVfdG9fYXBpY2lkW10gKEkgdGhvdWdodCB3ZSBoYWQg
YSBmdW5jdGlvbg0KPiBkb2luZyBzbywgYnV0IHJpZ2h0IG5vdyBJIGNhbid0IGZpbmQgb25l
KS4NCg0KSXQgaXMgdGhlIHNlY29uZCBoYWxmIG9mIGdldF9jcHVfaWQoKS4NCg0KDQpKdWVy
Z2VuDQo=
--------------TrY2l8hce2QOx8n0b0EoY7zm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TrY2l8hce2QOx8n0b0EoY7zm--

--------------Zq025EPAKVJYfvpf0uuZQBG5--

--------------0pqQkUBWGNXKVW8srhnUDx1e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIrIdgFAwAAAAAACgkQsN6d1ii/Ey9/
IQf/SdTB6IT1Nk6gQzQVGwn99abXvbaBRn9lVE2Lvb5bL/hzrPl0RhkaA3NzkaSIpKvOR7rSRPzi
HLx35JcHH1M8q8zdvhfT/fqK3uEvKHbkPZfn4kOUOG9Ma3bTnU22lg8GueRH2L6usg4AgHweneo2
N+AGPM8sw+nV7YZ4QwHKPTKeBRUJZBxS5k+jf8bXHP7l8eJ1dkwU/QtoKDwq/Ky8ZEcNDOuwAN1U
WPCdwbE7S2HNUvEnOccD0hMPTR/3Wkp5X2808QVu6IqOm/GJf/hXoJWrsnosn0H0keFDX/IdZMUh
8sDc8bKyNWx33GevvOX/NEpkTPv1y53tFTuWSIn4+Q==
=+2HM
-----END PGP SIGNATURE-----

--------------0pqQkUBWGNXKVW8srhnUDx1e--

