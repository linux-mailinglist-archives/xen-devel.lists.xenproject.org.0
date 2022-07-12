Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC63572296
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 20:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365992.596527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKbj-0006Cg-49; Tue, 12 Jul 2022 18:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365992.596527; Tue, 12 Jul 2022 18:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBKbj-0006AA-1U; Tue, 12 Jul 2022 18:27:39 +0000
Received: by outflank-mailman (input) for mailman id 365992;
 Tue, 12 Jul 2022 18:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AePn=XR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oBKbg-0006A4-IB
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 18:27:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c82b155-0210-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 20:27:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 324913376B;
 Tue, 12 Jul 2022 18:27:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FE1B13A94;
 Tue, 12 Jul 2022 18:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qDa5IRW9zWJgNwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Jul 2022 18:27:33 +0000
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
X-Inumbo-ID: 4c82b155-0210-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657650454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5C+zhs67eGnswPkmR6QS9MECAPZ3zsyGdrODr+C721s=;
	b=MGlzmUDUgLB0WsB1rDV8evCwxWZkhdoPehiJVuhPNsfLXMuHdi06fWoBXdMOyvhswDSG7/
	ofZFNlbySW4Wqt2un2NOFRhLzvPCTatTjDpbxiXS9s83XoKuM+3Q7zluaD2cclF7dC6XXT
	PnYU2FTXRXSAWZuL0QwAnjVoNt3wcaQ=
Message-ID: <388a3838-1681-dba4-dabd-a7f27817bf34@suse.com>
Date: Tue, 12 Jul 2022 20:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/PAT: Report PAT on CPUs that support PAT without MTRR
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh
 <brijesh.singh@amd.com>, Jane Chu <jane.chu@oracle.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Randy Dunlap <rdunlap@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, stable@vger.kernel.org
References: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz.ref@aol.com>
 <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------04Oo5TMKjVTiQc4OF90eNV23"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------04Oo5TMKjVTiQc4OF90eNV23
Content-Type: multipart/mixed; boundary="------------bxhhG9y434fe6T0S1sMDm3IO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Chuck Zmudzinski <brchuckz@aol.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh
 <brijesh.singh@amd.com>, Jane Chu <jane.chu@oracle.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Randy Dunlap <rdunlap@infradead.org>,
 Sean Christopherson <seanjc@google.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, stable@vger.kernel.org
Message-ID: <388a3838-1681-dba4-dabd-a7f27817bf34@suse.com>
Subject: Re: [PATCH] x86/PAT: Report PAT on CPUs that support PAT without MTRR
References: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz.ref@aol.com>
 <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>
In-Reply-To: <2885cdcaccffd287ef69c7509056ddf183a38a0e.1657647656.git.brchuckz@aol.com>

--------------bxhhG9y434fe6T0S1sMDm3IO
Content-Type: multipart/mixed; boundary="------------5ccNWA1r061yaQTfvzb4hlaA"

--------------5ccNWA1r061yaQTfvzb4hlaA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDcuMjIgMjA6MjAsIENodWNrIFptdWR6aW5za2kgd3JvdGU6DQo+IFRoZSBjb21t
aXQgOTljMTNiOGM4ODk2ZDdiY2I5Mjc1M2JmDQo+ICgieDg2L21tL3BhdDogRG9uJ3QgcmVw
b3J0IFBBVCBvbiBDUFVzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBpdCIpDQo+IGluY29ycmVjdGx5
IGZhaWxlZCB0byBhY2NvdW50IGZvciB0aGUgY2FzZSBpbiBpbml0X2NhY2hlX21vZGVzKCkg
d2hlbg0KPiBDUFVzIGRvIHN1cHBvcnQgUEFUIGFuZCBmYWxzZWx5IHJlcG9ydGVkIFBBVCB0
byBiZSBkaXNhYmxlZCB3aGVuIGluDQo+IGZhY3QgUEFUIGlzIGVuYWJsZWQuIEluIHNvbWUg
ZW52aXJvbm1lbnRzLCBub3RhYmx5IGluIFhlbiBQViBkb21haW5zLA0KPiBNVFJSIGlzIGRp
c2FibGVkIGJ1dCBQQVQgaXMgc3RpbGwgZW5hYmxlZCwgYW5kIHRoYXQgaXMgdGhlIGNhc2UN
Cj4gdGhhdCB0aGUgYWZvcmVtZW50aW9uZWQgY29tbWl0IGZhaWxlZCB0byBhY2NvdW50IGZv
ci4NCj4gDQo+IEFzIGFuIHVuZm9ydHVuYXRlIGNvbnNlcXVuY2UsIHRoZSBwYXRfZW5hYmxl
ZCgpIGZ1bmN0aW9uIGN1cnJlbnRseSBkb2VzDQo+IG5vdCBjb3JyZWN0bHkgcmVwb3J0IHRo
YXQgUEFUIGlzIGVuYWJsZWQgaW4gc3VjaCBlbnZpcm9ubWVudHMuIFRoZSBmaXgNCj4gaXMg
aW1wbGVtZW50ZWQgaW4gaW5pdF9jYWNoZV9tb2RlcygpIGJ5IHNldHRpbmcgcGF0X2JwX2Vu
YWJsZWQgdG8gdHJ1ZQ0KPiBpbiBpbml0X2NhY2hlX21vZGVzKCkgZm9yIHRoZSBjYXNlIHRo
YXQgY29tbWl0IDk5YzEzYjhjODg5NmQ3YmNiOTI3NTNiZg0KPiAoIng4Ni9tbS9wYXQ6IERv
bid0IHJlcG9ydCBQQVQgb24gQ1BVcyB0aGF0IGRvbid0IHN1cHBvcnQgaXQiKSBmYWlsZWQN
Cj4gdG8gYWNjb3VudCBmb3IuDQo+IA0KPiBUaGlzIHBhdGNoIGZpeGVzIGEgcmVncmVzc2lv
biB0aGF0IHNvbWUgdXNlcnMgYXJlIGV4cGVyaWVuY2luZyB3aXRoDQo+IExpbnV4IGFzIGEg
WGVuIERvbTAgZHJpdmluZyBwYXJ0aWN1bGFyIEludGVsIGdyYXBoaWNzIGRldmljZXMgYnkN
Cj4gY29ycmVjdGx5IHJlcG9ydGluZyB0byB0aGUgSW50ZWwgaTkxNSBkcml2ZXIgdGhhdCBQ
QVQgaXMgZW5hYmxlZCB3aGVyZQ0KPiBwcmV2aW91c2x5IGl0IHdhcyBmYWxzZWx5IHJlcG9y
dGluZyB0aGF0IFBBVCBpcyBkaXNhYmxlZC4NCj4gDQo+IEZpeGVzOiA5OWMxM2I4Yzg4OTZk
N2JjYjkyNzUzYmYgKCJ4ODYvbW0vcGF0OiBEb24ndCByZXBvcnQgUEFUIG9uIENQVXMgdGhh
dCBkb24ndCBzdXBwb3J0IGl0IikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4g
U2lnbmVkLW9mZi1ieTogQ2h1Y2sgWm11ZHppbnNraSA8YnJjaHVja3pAYW9sLmNvbT4NCj4g
LS0tDQo+IFJlbWluZGVyOiBUaGlzIHBhdGNoIGlzIGEgcmVncmVzc2lvbiBmaXggdGhhdCBp
cyBuZWVkZWQgb24gc3RhYmxlDQo+IHZlcnNpb25zIDUuMTcgYW5kIGxhdGVyLg0KPiANCj4g
ICBhcmNoL3g4Ni9tbS9wYXQvbWVtdHlwZS5jIHwgMTIgKysrKysrKysrKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3g4Ni9tbS9wYXQvbWVtdHlwZS5jIGIvYXJjaC94ODYvbW0vcGF0L21lbXR5cGUuYw0KPiBp
bmRleCBkNWVmNjRkZGQzNWUuLjBmMjQxN2JkMWI0MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC94
ODYvbW0vcGF0L21lbXR5cGUuYw0KPiArKysgYi9hcmNoL3g4Ni9tbS9wYXQvbWVtdHlwZS5j
DQo+IEBAIC0zMTUsNiArMzE1LDE4IEBAIHZvaWQgaW5pdF9jYWNoZV9tb2Rlcyh2b2lkKQ0K
PiAgIAkJICAgICAgUEFUKDQsIFdCKSB8IFBBVCg1LCBXVCkgfCBQQVQoNiwgVUNfTUlOVVMp
IHwgUEFUKDcsIFVDKTsNCj4gICAJfQ0KPiAgIA0KPiArCWVsc2UgaWYgKCFwYXRfYnBfZW5h
YmxlZCkgew0KDQpQbGVhc2UgcHV0IHRoZSAiZWxzZSBpZiB7IiBpbnRvIHRoZSBzYW1lIGxp
bmUgYXMgdGhlICJ9IiBhYm92ZS4NCg0KPiArCS8qDQo+ICsJICogSW4gc29tZSBlbnZpcm9u
bWVudHMsIHNwZWNpZmljYWxseSBYZW4gUFYsIFBBVA0KPiArCSAqIGluaXRpYWxpemF0aW9u
IGlzIHNraXBwZWQgYmVjYXVzZSBNVFJScyBhcmUgZGlzYWJsZWQgZXZlbg0KPiArCSAqIHRo
b3VnaCBQQVQgaXMgYXZhaWxhYmxlLiBJbiBzdWNoIGVudmlyb25tZW50cywgc2V0IFBBVCB0
bw0KPiArCSAqIGVuYWJsZWQgdG8gY29ycmVjdGx5IGluZGljYXRlIHRvIGNhbGxlcnMgb2Yg
cGF0X2VuYWJsZWQoKQ0KPiArCSAqIHRoYXQgQ1BVIHN1cHBvcnQgZm9yIFBBVCBpcyBhdmFp
bGFibGUuDQo+ICsJICovDQo+ICsJcGF0X2JwX2VuYWJsZWQgPSB0cnVlOw0KPiArCXByX2lu
Zm8oIng4Ni9QQVQ6IFBBVCBlbmFibGVkIGJ5IGluaXRfY2FjaGVfbW9kZXNcbiIpOw0KDQpX
cm9uZyBpbmRlbnRhdGlvbi4NCg0KPiArCX0NCj4gKw0KPiAgIAlfX2luaXRfY2FjaGVfbW9k
ZXMocGF0KTsNCj4gICB9DQo+ICAgDQoNCkFueSByZWFzb24geW91IGRpZG4ndCBmaXggdGhl
ICJub3BhdCIgaXNzdWUgSmFuIG1lbnRpb25lZD8NCg0KSSBhc2tlZCB5b3UgdHdpY2UgdG8g
YWRkIHRoaXMgZml4Lg0KDQoNCkp1ZXJnZW4NCg==
--------------5ccNWA1r061yaQTfvzb4hlaA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5ccNWA1r061yaQTfvzb4hlaA--

--------------bxhhG9y434fe6T0S1sMDm3IO--

--------------04Oo5TMKjVTiQc4OF90eNV23
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLNvRUFAwAAAAAACgkQsN6d1ii/Ey+V
1Qf/Zx2aBQJ9I7nw2PrZ3zt1A1l9KdzIGgiptzSiicbDBd3GxgVCoqWd+aq28UWu2SKmpDl/f3YQ
t6ulweXG1CltXL3rFWCyvUyYyGvlt4vmb9EhNst4a2rUrB4FV0/yP5tviQOD3WfjIysbKEm92qqk
z4u6WYyvD5jWdG9ud4QfN04bbpXNUFeK+/iME3E9Z1rA6xYxBwoEA71LIuNb1iNrBWRkkiUqO7aK
wh6M0gxTQrlA8PEKl6Ha5Xm0keXSL+ijrCCZlCyu+VEgXpSS5CJhwD0XiJpKYUpACY8zbIWAxzAP
yNffZig+IE2kH4I1n99evY3qKOaRLcLMfFvq2Ptwyw==
=lpyI
-----END PGP SIGNATURE-----

--------------04Oo5TMKjVTiQc4OF90eNV23--

