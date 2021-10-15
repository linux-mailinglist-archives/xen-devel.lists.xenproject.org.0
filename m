Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F220242EA6F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 09:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209827.366388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHpu-0003mT-Kd; Fri, 15 Oct 2021 07:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209827.366388; Fri, 15 Oct 2021 07:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbHpu-0003kI-HH; Fri, 15 Oct 2021 07:41:02 +0000
Received: by outflank-mailman (input) for mailman id 209827;
 Fri, 15 Oct 2021 07:41:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbHps-0003kC-Ty
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 07:41:00 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d1c6522-2d8b-11ec-8227-12813bfff9fa;
 Fri, 15 Oct 2021 07:40:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3B7021A61;
 Fri, 15 Oct 2021 07:40:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73B3A13B53;
 Fri, 15 Oct 2021 07:40:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gjU9GoowaWF1cQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 07:40:58 +0000
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
X-Inumbo-ID: 3d1c6522-2d8b-11ec-8227-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634283658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AT4i5Ejsr8QbrMkBnB9rNrtIqMDH0QDXSpdxLwxBZmM=;
	b=k8Dknr5Mi/Z3yUrBI/k1iw37+xpjLcCn+5rbV5zVATLOWDbah/85lLa5ZSrkvXE/JG7Z3J
	ZycQyv9MCiDsPn6HnFYNhveJ2FSsEeWv/VMx9AP8gWpo7+/u+JlI7ZW6UDTnsAcwuat647
	FBx7GXyi+pxroITqlRy8IhHoidCHIZA=
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per
 default
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Community Manager <community.manager@xenproject.org>
References: <20210910055518.562-1-jgross@suse.com>
 <24891.31480.165445.521062@mariner.uk.xensource.com>
 <d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
 <24913.55427.402592.660538@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2037c30a-5ac4-caf6-b47b-f2574422151f@suse.com>
Date: Fri, 15 Oct 2021 09:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24913.55427.402592.660538@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vHVEXBkxDczzS8VPTCAyiUr5Es6C56WLj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vHVEXBkxDczzS8VPTCAyiUr5Es6C56WLj
Content-Type: multipart/mixed; boundary="3ea7AzP9CrZeVth7fnpS9BtP3QRTpLb2e";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Community Manager <community.manager@xenproject.org>
Message-ID: <2037c30a-5ac4-caf6-b47b-f2574422151f@suse.com>
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per
 default
References: <20210910055518.562-1-jgross@suse.com>
 <24891.31480.165445.521062@mariner.uk.xensource.com>
 <d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
 <24913.55427.402592.660538@mariner.uk.xensource.com>
In-Reply-To: <24913.55427.402592.660538@mariner.uk.xensource.com>

--3ea7AzP9CrZeVth7fnpS9BtP3QRTpLb2e
Content-Type: multipart/mixed;
 boundary="------------3C497BEA82F202F663087340"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3C497BEA82F202F663087340
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.09.21 16:43, Ian Jackson wrote:
> Juergen Gross writes ("Re: [PATCH v3 0/3] disable building of pv-grub a=
nd qemu-trad per default"):
>> On 10.09.21 17:34, Ian Jackson wrote:
>>> Juergen Gross writes ("[PATCH v3 0/3] disable building of pv-grub and=
 qemu-trad per default"):
>>>> This is a first step of deprecating pv-grub and qemu-trad including
>>>> ioemu-stubdom. Switch the default to not building it.
>>>
>>> This is now fully acked.  But can we wait with committing it until we=

>>> have a decision about whether to (a) have osstest explicitly enable
>>> the pv-grub and qemu-trad builds (b) have osstest stop testing these
>>> configurations ?
>>
>> Any decisions made?
>=20
> No-one seems to have had any opinions.   I'll take ...
>=20
>> FWIW I'd be fine dropping pv-grub builds and tests in OSStets, but I'd=

>> rather keep testing qemu-trad stubdom tests.
>=20
> ... that as a proposal :-).  think that is probably the right tradeoff.=

>=20
> I think that means that means we need osstest patches to edit
> make-flight and ts-xen-build which
>=20
>   * Explictly enables stubdom qemu build
>   * Drops the pv-grub tests
>=20
> and those need to go in first.

I believe patch 1 of my series could go in at any time, as it is just
fixing a bug.


Juergen


--------------3C497BEA82F202F663087340
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

--------------3C497BEA82F202F663087340--

--3ea7AzP9CrZeVth7fnpS9BtP3QRTpLb2e--

--vHVEXBkxDczzS8VPTCAyiUr5Es6C56WLj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFpMIkFAwAAAAAACgkQsN6d1ii/Ey/3
qgf+MBUgWAGr29R4Z+vzACsyU1nq7S+yqX6roAcwghmdzWu+kGbFM1k6hG/b4/igeUadNgcwnTan
B9kzXUfRtoWNLKOQgf8XdoZPPt/66yIqN5HQKl/MbyDUShTBdKeLafT/XfDCy0Ds2VFh5r2g1kbU
RES1kWpT2RK58IjBdj389bY1yddxdh2DQN/kvNQsFC0O+qxO2L2Xx2Y8QZwIKL+xjEwLHisQR4dB
ErleTzWnG8ZHTY0yp4ey/F6g0xo2q4fN983DVEnReARowiTH/Cm49FG4xMBWVI5csssKkLsPUEHu
4LtvHiD8/HBTUUhoSnU9/d4RMATk98sEKXwjkBB9+A==
=CCsG
-----END PGP SIGNATURE-----

--vHVEXBkxDczzS8VPTCAyiUr5Es6C56WLj--

