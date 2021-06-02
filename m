Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACB398E44
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136105.252564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdl-00064c-5j; Wed, 02 Jun 2021 15:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136105.252564; Wed, 02 Jun 2021 15:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdk-0005zG-Vz; Wed, 02 Jun 2021 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 136105;
 Wed, 02 Jun 2021 15:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loSdj-0004jb-CJ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:18:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f02616ee-02f2-49f9-ad3d-03b94e827c96;
 Wed, 02 Jun 2021 15:18:33 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0086F1FE65;
 Wed,  2 Jun 2021 15:18:33 +0000 (UTC)
Received: by imap.suse.de (Postfix, from userid 51)
 id EDF1F11CD4; Wed,  2 Jun 2021 15:50:55 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4EC4011DEE;
 Wed,  2 Jun 2021 11:49:00 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id EZ/wESxwt2BVAgAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 11:49:00 +0000
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
X-Inumbo-ID: f02616ee-02f2-49f9-ad3d-03b94e827c96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622647113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Eg7BQO9m2m5iOfOE050aZc6dSdn93AtDzPOkwqu/U=;
	b=O6ISxBoNwRYiqR6AOgZ4oehTBSth8xsbIEq3W9m2hb4TnvV3Pym8NWh2OSNWB3ZwhnYfMU
	p+nbSsuEt/gnA97hFvxYpLeKnbmZC2cCfKg219NaeEbTMCuOsvDVqr+gj8M5M2Welknb0g
	i5y8qMLrj4s7OuH4etkGmyvnzVgsDzU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622634540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7Eg7BQO9m2m5iOfOE050aZc6dSdn93AtDzPOkwqu/U=;
	b=Fnefv3ZVxM9zwkzlhwQuu4WUggqcuugKLrcloXMLrB1fWnSpWLxDt2xPAhRqmvyEeXhPXF
	I9D5yIuZxb5wLMMLvRBVrlI8bQCiE2A5qeD6YCWoubGZ4FDDdKFqbxnwCY4rVMOpkYGP5W
	QS9IXvl7dh8mGhWr6/IWgRZtCyjsGvE=
Subject: Re: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to
 libxenctrl
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-6-olaf@aepfle.de>
 <f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
 <20210602131021.094d40f1.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <cec20a4c-ab32-9b35-1c69-a6c4cda5d23a@suse.com>
Date: Wed, 2 Jun 2021 13:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602131021.094d40f1.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bI1Twa27AtiKtXCD2NFAKUlK7wsCFuZrp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bI1Twa27AtiKtXCD2NFAKUlK7wsCFuZrp
Content-Type: multipart/mixed; boundary="tu4D7Bw2DHl2vYtHYg9sDNjEXSg0YlqcT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <cec20a4c-ab32-9b35-1c69-a6c4cda5d23a@suse.com>
Subject: Re: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to
 libxenctrl
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-6-olaf@aepfle.de>
 <f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
 <20210602131021.094d40f1.olaf@aepfle.de>
In-Reply-To: <20210602131021.094d40f1.olaf@aepfle.de>

--tu4D7Bw2DHl2vYtHYg9sDNjEXSg0YlqcT
Content-Type: multipart/mixed;
 boundary="------------0F789B75290E8040C50288E8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0F789B75290E8040C50288E8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.06.21 13:10, Olaf Hering wrote:
> Am Wed, 2 Jun 2021 08:51:45 +0200
> schrieb Juergen Gross <jgross@suse.com>:
>=20
>> I think you should not imply the planned use case here. It would be
>> better to use "switch (type & XEN_DOMCTL_PFINFO_LTAB_MASK)".
>>
>> I'm on the edge regarding putting the new function into xc_private.h.
>> In the end your use case is _not_ to call the new function from
>> libxenctrl.
>=20
>=20
> I'm not sure what that means.

The name xc_private.h indicates that this header file is supposed to be
used only inside of libxenctrl. I know that this isn't true today, but
I don't think new misuses should be added to this file.

> One or the other has to be rebased to the new state.

You can add the same functions to some libxensaverestore prvate header
instead.


Juergen


--------------0F789B75290E8040C50288E8
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0F789B75290E8040C50288E8--

--tu4D7Bw2DHl2vYtHYg9sDNjEXSg0YlqcT--

--bI1Twa27AtiKtXCD2NFAKUlK7wsCFuZrp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3cCsFAwAAAAAACgkQsN6d1ii/Ey/1
kAf+ORfg4swYGP3cOSV3K0VNTUlmOEhSFE0/K8Lb3dDc2k7oWLIFbMvnqd44B2e8jQjMkuq9s4NS
5zjNm9eB93WRVeypJ1GMg6DuQHClRTdsC8uosHSezMwNTCZxHtDR7zAiZIpFeMK3xzn8UemiZ111
tjrZ7WqSVcauf9+NFgTtikMVJWkgAnbZSEBL57dYJsGScRotgFvQC7ARqDkve+vagxkyWbx7H4QV
q7oAGLUPT34c6FUO/5SLKPrPvs3xSo3WQP+LiAFYx3B1KIM8a1O6iw2R6pFVfbzsAEig5Ns6rkmU
i1umBGpl1SASZkm6dhDdUaEzXycjd3P8h38/iR6N9Q==
=5L6x
-----END PGP SIGNATURE-----

--bI1Twa27AtiKtXCD2NFAKUlK7wsCFuZrp--

