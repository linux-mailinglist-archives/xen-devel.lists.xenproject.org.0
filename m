Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F684888B5
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 11:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255119.437213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6VRg-0006v5-2a; Sun, 09 Jan 2022 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255119.437213; Sun, 09 Jan 2022 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6VRf-0006t8-VH; Sun, 09 Jan 2022 10:29:03 +0000
Received: by outflank-mailman (input) for mailman id 255119;
 Sun, 09 Jan 2022 10:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n6VRd-0006pb-Mt
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 10:29:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52cacd0-7136-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 11:29:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84FD421109;
 Sun,  9 Jan 2022 10:28:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C4ED1342A;
 Sun,  9 Jan 2022 10:28:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b3zIFOu42mHSPQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 09 Jan 2022 10:28:59 +0000
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
X-Inumbo-ID: f52cacd0-7136-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641724139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J3VgMteoioKXsiP19aWt+aBAbb1/ZOOWK4ny/y/hNBw=;
	b=ssKLJgQfs5YEZAznsI8L3IoaIC1DEV7XmOE82Gv9Zp/pcIvgWGK3IuZQPVFrjq6RzGT44r
	fqIc2y/77kCbGezcdvznh2Mihu5H7QhQRRFMgfmmVlqL01sKPgVNKguhr+ad3uWclIfbkG
	rJuFBhqRSZ64jFt86YUnEhvMfko5X7M=
Subject: Re: [PATCH 02/15] mini-os: makes file.read bool and move it ahead of
 device specific part
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-3-jgross@suse.com>
 <20220109011844.ztd7uwre6kb3dzwv@begin>
 <20220109012100.tpv42y3efylqgrhr@begin>
 <4b989643-9a9f-7bba-d729-d3248db49499@suse.com>
 <20220109102035.36bhefgq3y2xhdto@begin>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f5c0fb67-fefe-ac64-84a6-a8013ba0c041@suse.com>
Date: Sun, 9 Jan 2022 11:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220109102035.36bhefgq3y2xhdto@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZV1lwR9v6xLvym9tYPIr0pqWWHtUFNgIK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZV1lwR9v6xLvym9tYPIr0pqWWHtUFNgIK
Content-Type: multipart/mixed; boundary="NMlOVhwKyQwqbuhjGJGgwAA1xuayIQkDb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <f5c0fb67-fefe-ac64-84a6-a8013ba0c041@suse.com>
Subject: Re: [PATCH 02/15] mini-os: makes file.read bool and move it ahead of
 device specific part
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-3-jgross@suse.com>
 <20220109011844.ztd7uwre6kb3dzwv@begin>
 <20220109012100.tpv42y3efylqgrhr@begin>
 <4b989643-9a9f-7bba-d729-d3248db49499@suse.com>
 <20220109102035.36bhefgq3y2xhdto@begin>
In-Reply-To: <20220109102035.36bhefgq3y2xhdto@begin>

--NMlOVhwKyQwqbuhjGJGgwAA1xuayIQkDb
Content-Type: multipart/mixed;
 boundary="------------A3D3AC09BDEDFC19C696E33F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A3D3AC09BDEDFC19C696E33F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.01.22 11:20, Samuel Thibault wrote:
> Juergen Gross, le dim. 09 janv. 2022 07:12:32 +0100, a ecrit:
>> On 09.01.22 02:21, Samuel Thibault wrote:
>>> Samuel Thibault, le dim. 09 janv. 2022 02:18:44 +0100, a ecrit:
>>>> Juergen Gross, le jeu. 06 janv. 2022 12:57:28 +0100, a ecrit:
>>>>> The read member of struct file should be bool.
>>>>>
>>>>> In order to have the device specific part at the end of the structu=
re
>>>>> move "read" ahead of that.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>>>
>>> Mmm, but tools/libs/evtchn/minios.c needs updating, doesn't it?
>>
>> It will be, but assigning 1 to a bool is just fine.
>=20
> Yes but it's moved in the structure.

It needs recompiling, but no change. Its still file->read.


Juergen

--------------A3D3AC09BDEDFC19C696E33F
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

--------------A3D3AC09BDEDFC19C696E33F--

--NMlOVhwKyQwqbuhjGJGgwAA1xuayIQkDb--

--ZV1lwR9v6xLvym9tYPIr0pqWWHtUFNgIK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHauOoFAwAAAAAACgkQsN6d1ii/Ey/w
Ugf/Vzs55gFZiekuJN4uTx+SEB0SeBlCZrjZOp/7ub+gwjpDmP1ZbsYgSzpwnkZmCbXH0hlUm/rk
mKGHR+SQjpUbRyNkhca9+mTdNlkKHF8xK06ahruVDKeXeg7D7y8f0uwAdQ9DbphehxAbxcekLW2R
fIuX2UHhhCKEks7mmO8s9MwmZfCiUlwPdiOhCqgTI77irGlZISOiHdGuplNZKv/OuLLooDGHyT3Q
lhPmR5d4NvIIRwmWoVFCSX1ijtOG1QMbibTIh7PQE2ALa6HXWPsb4onjtzci73pMH+HfHKD4cczW
oAXTkJilHTjj0lJE8j/m0x4+OA8XDFL0PZ54d1XDew==
=BYwv
-----END PGP SIGNATURE-----

--ZV1lwR9v6xLvym9tYPIr0pqWWHtUFNgIK--

