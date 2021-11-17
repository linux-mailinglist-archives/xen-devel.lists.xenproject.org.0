Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15716454585
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226767.391993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ0V-0005I0-Kb; Wed, 17 Nov 2021 11:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226767.391993; Wed, 17 Nov 2021 11:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ0V-0005F6-Gx; Wed, 17 Nov 2021 11:21:39 +0000
Received: by outflank-mailman (input) for mailman id 226767;
 Wed, 17 Nov 2021 11:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mnJ0T-0005Ew-JE
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:21:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c142ac-4798-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:21:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 057971FD29;
 Wed, 17 Nov 2021 11:21:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 980AC13C93;
 Wed, 17 Nov 2021 11:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZcC/I7/llGHyKAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 17 Nov 2021 11:21:35 +0000
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
X-Inumbo-ID: 86c142ac-4798-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637148096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PJDqaQ3WWXXy1R785BNHte76FXIaO7+JlbYv+mee9to=;
	b=r/cVJ5RvjYaRB3kl3OX/a1WYz50gf0FtAbR27T/1pM2zbyplErBt1XN4y2cRcu9aUA3WBS
	SQS+4SJUFQ3QcyvKG7Nih5DEDkQ59DaaC6XJjSSlTNZHAEcuKKQq7UJpWWCCw5xMS0skcE
	qE67wvbRPjw4f7vrRcO2CfF1sv98WG8=
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9cf3d606-9284-1439-3a26-18c4a931da48@suse.com>
Date: Wed, 17 Nov 2021 12:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qiJhUBFDyXbRsBqWc3cEYQFNLnNxtl64T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qiJhUBFDyXbRsBqWc3cEYQFNLnNxtl64T
Content-Type: multipart/mixed; boundary="xoyhLEf0Pagh2BtDxkJ13Y6yGXTV5985V";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9cf3d606-9284-1439-3a26-18c4a931da48@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
In-Reply-To: <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>

--xoyhLEf0Pagh2BtDxkJ13Y6yGXTV5985V
Content-Type: multipart/mixed;
 boundary="------------BF362D578D2C8E54B806BE2A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BF362D578D2C8E54B806BE2A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.21 12:16, Bertrand Marquis wrote:
> Hi Julien,
>=20
>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>> Currently Xen creates a default cpupool0 that contains all the cpu br=
ought up
>>> during boot and it assumes that the platform has only one kind of CPU=
=2E
>>> This assumption does not hold on big.LITTLE platform, but putting dif=
ferent
>>> type of CPU in the same cpupool can result in instability and securit=
y issues
>>> for the domains running on the pool.
>>
>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
>>
>>> For this reason this serie introduces an architecture specific way to=
 create
>>> different cpupool at boot time, this is particularly useful on ARM bi=
g.LITTLE
>>> platform where there might be the need to have different cpupools for=
 each type
>>> of core, but also systems using NUMA can have different cpu pool for =
each node.
>>
>> ... from my understanding, all the vCPUs of a domain have to be in the=
 same cpupool. So with this approach it is not possible:
>>    1) to have a mix of LITTLE and big vCPUs in the domain
>>    2) to create a domain spanning across two NUMA nodes
>>
>> So I think we need to make sure that any solutions we go through will =
not prevent us to implement those setups.
>=20
> The point of this patch is to make all cores available without breaking=
 the current behaviour of existing system.

May I suggest to add a boot parameter for being able to control this
behavior by other means than compile time configuration?

>=20
> Someone not using cpupool will keep running on the same cores as before=
=2E
> Someone wanting to use the other cores could assign a guest to the othe=
r(s) cpupool (big.LITTLE is just an example with 2 but there are now core=
s with 3 types of cores).
> Someone wanting to build something different can now create new cpupool=
s in Dom0 and assign the cores they want to is to build a guest having ac=
cess to different types of cores.
>=20
> The point here is just to make the =E2=80=9Cother=E2=80=9D cores access=
ible and park them in cpupools so that current behaviour is not changed.
>=20
>>
>> I can see two options here:
>>   1) Allowing a domain vCPUs to be on a different cpupool
>>   2) Introducing CPU class (see [1])
>>
>> I can't remember why Dario suggested 2) rather than 1) in the past. @D=
ario, do you remember it?
>=20
> I think 1) is definitely interesting and something that could be looked=
 at in the future.

 From scheduler point of view this is IMO a nightmare.


Juergen

--------------BF362D578D2C8E54B806BE2A
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

--------------BF362D578D2C8E54B806BE2A--

--xoyhLEf0Pagh2BtDxkJ13Y6yGXTV5985V--

--qiJhUBFDyXbRsBqWc3cEYQFNLnNxtl64T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGU5b8FAwAAAAAACgkQsN6d1ii/Ey9h
xAgAhsa9PYCu9MmsNLy0i0oIvEinDgCDbxOB1XSEkZ+3kCHh3nB04usXhindeQso6vDUvLiygFMU
7ca2GqG4h2dkn2bPfYUkDPjgd7bHZQdkeYuc50oS0MF7onVW1iE06kIL7Y/qHOt2UIYqRp6XDhaW
HLeGK293XEALRtNfrmi/SarAUu0BoaHD6SAenSdKC3gNdS05yfR8o0SRQYz6FIb8lA5uOPkNb3qv
X8uDN/mD4qnQrpKYvKpxmEV5tCuN/HhJODhdpqrnKaER6yxRv2I756VMFLc7nAXC1WbX8zi3H44N
weNO79MXanEvIYIihJ4QndMg6NWERew7ePsWDeKZKQ==
=kYpe
-----END PGP SIGNATURE-----

--qiJhUBFDyXbRsBqWc3cEYQFNLnNxtl64T--

