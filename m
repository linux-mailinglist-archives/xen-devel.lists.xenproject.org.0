Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E74159ED
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193492.344643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJsy-0004pi-5Q; Thu, 23 Sep 2021 08:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193492.344643; Thu, 23 Sep 2021 08:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTJsy-0004nS-2N; Thu, 23 Sep 2021 08:15:16 +0000
Received: by outflank-mailman (input) for mailman id 193492;
 Thu, 23 Sep 2021 08:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTJsw-0004nK-Ky
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:15:14 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c05c6f91-2c5d-43da-bd78-76684ac40473;
 Thu, 23 Sep 2021 08:15:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A60422027D;
 Thu, 23 Sep 2021 08:15:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13F2613DC7;
 Thu, 23 Sep 2021 08:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ojiaA5A3TGF2FQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 08:15:12 +0000
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
X-Inumbo-ID: c05c6f91-2c5d-43da-bd78-76684ac40473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632384912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QSLhmvEk1Pq1iiswl5snzLhelQGabqOAvRi47xucKUc=;
	b=dQkZNFnVmjFTdqDDt9GU9DTIEjBGZRbIA2ofbDcmiIB8bDqVrDggJ8ZwgPcJOAAnibhKSk
	wohDp1nG/Y0sL0SW/01jfOSBK8tJNu5AzCDV/dTnleWkyjK5RMbnhh0I5Wt/IQmwJHm3zx
	ZvfeJvE8TpXAAdEAgm6wdTBm9F+eeO8=
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mike Rapoport <rppt@linux.ibm.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <60c0d0f9-e4c6-ef66-b85b-0d091f8cba15@suse.com>
Date: Thu, 23 Sep 2021 10:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210923074335.12583-4-rppt@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zppOVwffTjZ5Oe49Vq0wbEbRvLUF4dOID"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zppOVwffTjZ5Oe49Vq0wbEbRvLUF4dOID
Content-Type: multipart/mixed; boundary="AxmgW1XtM0JJFTzWHwG0o4gfWFl7DFvoM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Mike Rapoport <rppt@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mike Rapoport <rppt@linux.ibm.com>
Message-ID: <60c0d0f9-e4c6-ef66-b85b-0d091f8cba15@suse.com>
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
In-Reply-To: <20210923074335.12583-4-rppt@kernel.org>

--AxmgW1XtM0JJFTzWHwG0o4gfWFl7DFvoM
Content-Type: multipart/mixed;
 boundary="------------CFB99E0866EE66F8CFC01FC3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CFB99E0866EE66F8CFC01FC3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.09.21 09:43, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>=20
> For ages memblock_free() interface dealt with physical addresses even
> despite the existence of memblock_alloc_xx() functions that return a
> virtual pointer.
>=20
> Introduce memblock_phys_free() for freeing physical ranges and repurpos=
e
> memblock_free() to free virtual pointers to make the following pairing
> abundantly clear:
>=20
> 	int memblock_phys_free(phys_addr_t base, phys_addr_t size);
> 	phys_addr_t memblock_phys_alloc(phys_addr_t base, phys_addr_t size);
>=20
> 	void *memblock_alloc(phys_addr_t size, phys_addr_t align);
> 	void memblock_free(void *ptr, size_t size);
>=20
> Replace intermediate memblock_free_ptr() with memblock_free() and drop
> unnecessary aliases memblock_free_early() and memblock_free_early_nid()=
=2E
>=20
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

arch/x86/xen/ parts: Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------CFB99E0866EE66F8CFC01FC3
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

--------------CFB99E0866EE66F8CFC01FC3--

--AxmgW1XtM0JJFTzWHwG0o4gfWFl7DFvoM--

--zppOVwffTjZ5Oe49Vq0wbEbRvLUF4dOID
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMN48FAwAAAAAACgkQsN6d1ii/Ey8D
fwf/WV3EUVWvjXkc64q0a0it6LMGy2AtQrh8KdDecuLV8iH5bKTnqNAZOUoV6sYTeiLsSSnRTLOt
yKKjkWsC9/gUsyuO0B8Zw/VX/zoXJqp7T57FfmW+37qcslFuLzImqvDxdU65n/jEbme+VExmw6UF
yy1ATxxxhQIxeTDXB3SfE0f6rX4Fw1DUqQc25bFNpD1wzdp1xG6qhH31/CWUI/V/frEfuzZrrN5F
Uimkqk3+xjrqqpYh2fb/Pwpd77LFOdIrV4gH0oyl0NA3x3QMNi+67FrbMtuRHZij1jnpwoY1RiUc
uVxzINJ+LJh0g8836hHAkPh5tQNBjV7C6V7LXddn6g==
=Fnkp
-----END PGP SIGNATURE-----

--zppOVwffTjZ5Oe49Vq0wbEbRvLUF4dOID--

