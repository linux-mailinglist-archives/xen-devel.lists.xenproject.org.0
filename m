Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34445B3C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230040.397739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkZM-0001KX-T2; Wed, 24 Nov 2021 05:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230040.397739; Wed, 24 Nov 2021 05:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkZM-0001Hd-Po; Wed, 24 Nov 2021 05:11:44 +0000
Received: by outflank-mailman (input) for mailman id 230040;
 Wed, 24 Nov 2021 05:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQO5=QL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpkZL-0001HX-KC
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 05:11:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 028981f2-4ce5-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 06:11:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 640F41FD37;
 Wed, 24 Nov 2021 05:11:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C9CE13EC2;
 Wed, 24 Nov 2021 05:11:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hwtCCY3JnWF4ZQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Nov 2021 05:11:41 +0000
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
X-Inumbo-ID: 028981f2-4ce5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637730701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4bewt07Nn8devyRr1m4C78ZgxUFTlBUyZDqP1VULo3s=;
	b=RY8s+KIIzuLwSFlUORNHPsA/U6zRSyBTrYRRuFIavzy4nq/FyvYoOjtNEhmJ6N80xRS8R5
	BXAmHlrKnBVWSBDw68jHcVir91CrvWGSs83Pi3nWo557s+EVPbvYadr6gbJ8JP9UC5mGjb
	Jh6nVEF/G1lBXVsUSwnshrDqW+PP6OA=
Subject: Re: [PATCH v4] xen: detect uninitialized xenbus in xenbus_init
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, stable@vger.kernel.org
References: <20211123210748.1910236-1-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b7e7ea7f-f08a-61b4-8980-757470d50b55@suse.com>
Date: Wed, 24 Nov 2021 06:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211123210748.1910236-1-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aJA5RZ5toJwqVz2G9rOvSw0xcuhrcHCY1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aJA5RZ5toJwqVz2G9rOvSw0xcuhrcHCY1
Content-Type: multipart/mixed; boundary="Ns8snLW1kN0xBnRuYJOXOP7mLlTcLo22F";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, stable@vger.kernel.org
Message-ID: <b7e7ea7f-f08a-61b4-8980-757470d50b55@suse.com>
Subject: Re: [PATCH v4] xen: detect uninitialized xenbus in xenbus_init
References: <20211123210748.1910236-1-sstabellini@kernel.org>
In-Reply-To: <20211123210748.1910236-1-sstabellini@kernel.org>

--Ns8snLW1kN0xBnRuYJOXOP7mLlTcLo22F
Content-Type: multipart/mixed;
 boundary="------------061B0C4405AEAC3907F4670A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------061B0C4405AEAC3907F4670A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.11.21 22:07, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> If the xenstore page hasn't been allocated properly, reading the value
> of the related hvm_param (HVM_PARAM_STORE_PFN) won't actually return
> error. Instead, it will succeed and return zero. Instead of attempting
> to xen_remap a bad guest physical address, detect this condition and
> return early.
>=20
> Note that although a guest physical address of zero for
> HVM_PARAM_STORE_PFN is theoretically possible, it is not a good choice
> and zero has never been validly used in that capacity.
>=20
> Also recognize all bits set as an invalid value.
>=20
> For 32-bit Linux, any pfn above ULONG_MAX would get truncated. Pfns
> above ULONG_MAX should never be passed by the Xen tools to HVM guests
> anyway, so check for this condition and return early.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------061B0C4405AEAC3907F4670A
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

--------------061B0C4405AEAC3907F4670A--

--Ns8snLW1kN0xBnRuYJOXOP7mLlTcLo22F--

--aJA5RZ5toJwqVz2G9rOvSw0xcuhrcHCY1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGdyYwFAwAAAAAACgkQsN6d1ii/Ey9t
9Af7BryVncllwJue+nkoKn5NECVjU0Z44G781fGbdEHgIB7/eYJMt6NDHSb8XWunirVHpM/LV/+G
gkH10AtqDxFl8SCTiMNbMLMkhawOQ7StJyWestPcY8f5OD0wsdBHlfz6RwzeGMQIcpDtIcmhBxKu
bJ8CkZTqs5ufX54QRt5ft9CpDpwEyoZ5fvcsYkGE7XMkjpT80Dk5UN7OzWJ8XGA8nGsU6/NQHuOw
NA6A5GGHbx6A6dbOs0hHMA/b6FcO4PGL3CoxP5OYrfGvDJIDRrlxxBSd9J2R1V2JtaiP1CtFG+Mm
Md2QNnTzS6tbvVgwFhI0Iy04Ak6btVckua45ur/Y3w==
=sr4U
-----END PGP SIGNATURE-----

--aJA5RZ5toJwqVz2G9rOvSw0xcuhrcHCY1--

