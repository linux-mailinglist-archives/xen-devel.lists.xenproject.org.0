Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B811557C7A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354991.582401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MYT-0000mO-Uh; Thu, 23 Jun 2022 13:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354991.582401; Thu, 23 Jun 2022 13:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MYT-0000kT-Ra; Thu, 23 Jun 2022 13:07:29 +0000
Received: by outflank-mailman (input) for mailman id 354991;
 Thu, 23 Jun 2022 13:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4MYR-0000kN-RD
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:07:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6df1ac75-f2f5-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 15:07:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8471E1F998;
 Thu, 23 Jun 2022 13:07:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F67C13461;
 Thu, 23 Jun 2022 13:07:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJEtBo5ltGLlHgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 13:07:26 +0000
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
X-Inumbo-ID: 6df1ac75-f2f5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655989646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJnpuwxN/FLeBtqA4SLXcqXAP5iBoZPO1+utrcEpndA=;
	b=HSB/H6Mp44vXYIMdrDPH1JIj3WR+EHHYSlcnSFQzUqMuCesy5BIXfxC+ncHlwchSbVgNcG
	eaNMurm86pGEJFRyrPljePnrR42Km8Jb3D57hx1fG19q90437jgo/7gs/HX126xTdjRzCl
	7R0Xy1BJz8q+VAjtA1mC25IjypVujgo=
Message-ID: <4abe4863-3e24-70bb-5a6d-619f1de30a14@suse.com>
Date: Thu, 23 Jun 2022 15:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
 <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
 <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
Content-Language: en-US
In-Reply-To: <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t0X2MtyaTQWCihLZQQ9pIgn0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t0X2MtyaTQWCihLZQQ9pIgn0
Content-Type: multipart/mixed; boundary="------------pqKygV3Bj0X4PXsIN9plUa8L";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <4abe4863-3e24-70bb-5a6d-619f1de30a14@suse.com>
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
 <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
 <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>
In-Reply-To: <db7f5c3e-894a-1700-e0a4-5893bd70c205@suse.com>

--------------pqKygV3Bj0X4PXsIN9plUa8L
Content-Type: multipart/mixed; boundary="------------VDZ5cCZUPPjk90TnYMTVITFu"

--------------VDZ5cCZUPPjk90TnYMTVITFu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDUuMjIgMTE6NDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDA0LjA1LjIy
IDA5OjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTkuMDQuMjIgMTA6MDEsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjQuMDMuMjIgMTU6MDEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEluIG9yZGVyIHRvIGF2b2lkIGluZGlyZWN0IGZ1bmN0aW9uIGNh
bGxzIG9uIHRoZSBoeXBlcmNhbGwgcGF0aCBhcw0KPj4+PiBtdWNoIGFzIHBvc3NpYmxlIHRo
aXMgc2VyaWVzIGlzIHJlbW92aW5nIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb24gdGFibGVzDQo+
Pj4+IGFuZCBpcyByZXBsYWNpbmcgdGhlIGh5cGVyY2FsbCBoYW5kbGVyIGNhbGxzIHZpYSB0
aGUgZnVuY3Rpb24gYXJyYXkNCj4+Pj4gYnkgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgY2Fs
bCBtYWNyb3MuDQo+Pj4+DQo+Pj4+IEFub3RoZXIgYnktcHJvZHVjdCBvZiBnZW5lcmF0aW5n
IHRoZSBjYWxsIG1hY3JvcyBpcyB0aGUgYXV0b21hdGljDQo+Pj4+IGdlbmVyYXRpbmcgb2Yg
dGhlIGh5cGVyY2FsbCBoYW5kbGVyIHByb3RvdHlwZXMgZnJvbSB0aGUgc2FtZSBkYXRhIGJh
c2UNCj4+Pj4gd2hpY2ggaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgbWFjcm9zLg0KPj4+Pg0K
Pj4+PiBUaGlzIGhhcyB0aGUgYWRkaXRpb25hbCBhZHZhbnRhZ2Ugb2YgdXNpbmcgdHlwZSBz
YWZlIGNhbGxzIG9mIHRoZQ0KPj4+PiBoYW5kbGVycyBhbmQgdG8gZW5zdXJlIHJlbGF0ZWQg
aGFuZGxlciAoZS5nLiBQViBhbmQgSFZNIG9uZXMpIHNoYXJlDQo+Pj4+IHRoZSBzYW1lIHBy
b3RvdHlwZXMuDQo+Pj4+DQo+Pj4+IEEgdmVyeSBicmllZiBwZXJmb3JtYW5jZSB0ZXN0IChw
YXJhbGxlbCBidWlsZCBvZiB0aGUgWGVuIGh5cGVydmlzb3INCj4+Pj4gaW4gYSA2IHZjcHUg
Z3Vlc3QpIHNob3dlZCBhIHZlcnkgc2xpbSBpbXByb3ZlbWVudCAobGVzcyB0aGFuIDElKSBv
Zg0KPj4+PiB0aGUgcGVyZm9ybWFuY2Ugd2l0aCB0aGUgcGF0Y2hlcyBhcHBsaWVkLiBUaGUg
dGVzdCB3YXMgcGVyZm9ybWVkIHVzaW5nDQo+Pj4+IGEgUFYgYW5kIGEgUFZIIGd1ZXN0Lg0K
Pj4+DQo+Pj4gQSBnZW50bGUgcGluZyByZWdhcmRpbmcgdGhpcyBzZXJpZXMuDQo+Pj4NCj4+
PiBJIHRoaW5rIHBhdGNoIDEgc3RpbGwgbGFja3MgYW4gQWNrIGZyb20geDg2IHNpZGUuIE90
aGVyIHRoYW4gdGhhdA0KPj4+IHBhdGNoZXMgMSwgMiBhbmQgNCBzaG91bGQgYmUgZmluZSB0
byBnbyBpbiwgYXMgdGhleSBhcmUgY2xlYW51cHMgd2hpY2gNCj4+PiBhcmUgZmluZSBvbiB0
aGVpciBvd24gSU1ITy4NCj4+Pg0KPj4+IEFuZHJldywgeW91IHdhbnRlZCB0byBnZXQgc29t
ZSBwZXJmb3JtYW5jZSBudW1iZXJzIG9mIHRoZSBzZXJpZXMgdXNpbmcNCj4+PiB0aGUgQ2l0
cml4IHRlc3QgZW52aXJvbm1lbnQuIEFueSBuZXdzIG9uIHRoZSBwcm9ncmVzcyBoZXJlPw0K
Pj4NCj4+IEFuZCBhbm90aGVyIHBpbmcuDQo+Pg0KPj4gQW5kcmV3LCBjb3VsZCB5b3UgcGxl
YXNlIGdpdmUgc29tZSBmZWVkYmFjayByZWdhcmRpbmcgcGVyZm9ybWFuY2UNCj4+IHRlc3Rp
bmcgcHJvZ3Jlc3M/DQo+IA0KPiBUaGlzIGlzIGJlY29taW5nIHJpZGljdWxvdXMuIEFuZHJl
dywgSSBrbm93IHlvdSBhcmUgYnVzeSwgYnV0IG5vdCByZWFjdGluZw0KPiBhdCBhbGwgdG8g
ZXhwbGljaXQgcXVlc3Rpb25zIGlzIGtpbmQgb2YgYW5ub3lpbmcuDQoNCiAgIF9fX18gX19f
IF8gICBfICBfX19fDQp8ICBfIFxfIF98IFwgfCB8LyBfX198DQp8IHxfKSB8IHx8ICBcfCB8
IHwgIF8NCnwgIF9fL3wgfHwgfFwgIHwgfF98IHwNCnxffCAgfF9fX3xffCBcX3xcX19fX3wN
Cg0KDQpKdWVyZ2VuDQo=
--------------VDZ5cCZUPPjk90TnYMTVITFu
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


--------------VDZ5cCZUPPjk90TnYMTVITFu--

--------------pqKygV3Bj0X4PXsIN9plUa8L--

--------------t0X2MtyaTQWCihLZQQ9pIgn0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0ZY0FAwAAAAAACgkQsN6d1ii/Ey/2
tgf/fZBN+4Q51WyHZXhWandvIXnbVQKzA0H0uFVv4BCHKjrA3qzykpjRq4mEZnUBsa/gksJagYDZ
rH0nekgXu/rxm8rridRiIRWxCMeUv37udtZxJWlELbWPBS+kbfOTD6VamYgfuRR/MY6RrBRa+6dz
kUQzoBEd+tXPNsl5WgRklOoJQuH54qhHymQg52DLyglD7+DZseyW/euL7cZO0nWRNyDzWq/nnonI
E7/Y7XusUwdaJID5TF2ESUsKEcM3KQFkCoTHP0NkujX7cTBoYDY9y5pdb0LE3gQL+dGIt/GBQRjv
PpAXbV9uPx6toUjLfZeF/FU5qHJ4lbyB9nr4qfjMuw==
=5uwC
-----END PGP SIGNATURE-----

--------------t0X2MtyaTQWCihLZQQ9pIgn0--

