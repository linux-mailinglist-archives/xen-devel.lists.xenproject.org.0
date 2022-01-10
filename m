Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FAD4894B4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 10:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255240.437350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qbs-0004iC-4K; Mon, 10 Jan 2022 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255240.437350; Mon, 10 Jan 2022 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qbs-0004f5-1F; Mon, 10 Jan 2022 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 255240;
 Mon, 10 Jan 2022 09:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MsG/=R2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n6qbr-0004ez-34
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 09:04:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 621dbac4-71f4-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 10:04:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 085541F3AB;
 Mon, 10 Jan 2022 09:04:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C61E713A98;
 Mon, 10 Jan 2022 09:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0/YMLrj222GoIQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jan 2022 09:04:56 +0000
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
X-Inumbo-ID: 621dbac4-71f4-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641805497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nTcgjcMgSCYkGwBL+YZd1sKtKPFda2Eb08eVSIdzfU=;
	b=mSiVI/0DS0WoK/oFzej3FUMTBgEuaH6w0HGZxUHpwEg2NhnowwAFfG7UI/ldCHLpdxaGX5
	u0nM7c9KTUej7r9OYYMdNMyPxc0W+7oq4mi2qD/RFqxA/GC+UnlWPq50DYfFqmgrvyamEW
	YDRov/9df44zdbw/kAxF5QxS3Y0FIR4=
To: Jan Beulich <jbeulich@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220109100133.19731-1-jgross@suse.com>
 <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] build: fix make distclean
Message-ID: <c445ec6f-a484-fa03-acf6-21687833ed2c@suse.com>
Date: Mon, 10 Jan 2022 10:04:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PNicul23iYnHE6j96mHOd8qKxP3Nq2LUy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PNicul23iYnHE6j96mHOd8qKxP3Nq2LUy
Content-Type: multipart/mixed; boundary="VR5z5Ew72madZQZZpo6b5eg6jtViP3riC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <c445ec6f-a484-fa03-acf6-21687833ed2c@suse.com>
Subject: Re: [PATCH] build: fix make distclean
References: <20220109100133.19731-1-jgross@suse.com>
 <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>
In-Reply-To: <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>

--VR5z5Ew72madZQZZpo6b5eg6jtViP3riC
Content-Type: multipart/mixed;
 boundary="------------BD31594763EA478F4459526B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BD31594763EA478F4459526B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.01.22 09:42, Jan Beulich wrote:
> On 09.01.2022 11:01, Juergen Gross wrote:
>> "make distclean" will complain that "-c" is no supported flag for make=
=2E
>>
>> Fix that by using "-C".
>>
>> The error has been present for a long time, but it was uncovered only
>> recently.
>=20
> And that's because the rule simply was unreachable before? Or it was
> reachable, but only via special (non-default) $(MAKE) invocations?

I just hit the bug during a top level "make distclean" and looked which
commit introduced it. As it was really old, I looked for a more recent
commit which could trigger the bug and found the rather recent one,
making me believe that the wrong rule was never reached (other than by
a "make" in the local directory of that rule).

I didn't spend more time on digging out whether the problem could have
happened in other cases, too.

>> Fixes: 2400a9a365c5619 ("tools/debugger: Allow make to recurse into de=
bugger/")
>> Fixes: f9c9b127753e9ed ("tools: fix make distclean")
>=20
> To distinguish from this commit's title and to also identify the affect=
ed
> component, how about having "gdbsx" somewhere in the subject? (To be
> honest, with this title I wouldn't even have expected the issue is in t=
he
> tool stack part of the tree.)

Hmm, yes, the prefix could be changed to "tools/debugger".

>=20
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Preferably with the above taken care of (which could be done while
> committing, provided suitable adjustment suggestions),
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

Juergen

--------------BD31594763EA478F4459526B
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

--------------BD31594763EA478F4459526B--

--VR5z5Ew72madZQZZpo6b5eg6jtViP3riC--

--PNicul23iYnHE6j96mHOd8qKxP3Nq2LUy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHb9rgFAwAAAAAACgkQsN6d1ii/Ey+N
UAf/XpY/6/1rVaeybkcd/NpjUcODMLk1X9Il/slnMK5u6X7Na6j48HEd+w4o10Dn0J13PTlDGyRO
DfQNrVqMB9b0aAVhZ3tiV+gVKk6VgtGl31DGCj2Pi0B/Rp0hXXwUOYD4OGDUePi+bCVTu/71TFhF
qUPd0DW/a+rJjPTNC4AqbY9RGnO0fz7XG+4RyW/1pv1g+37jXn2hS+CkMI/ajW/73KBHl6CV3s5x
Wx+CJ1P0bB6wmrkNhXxiclczBJ/dmEiSskYwtyKNaPueLBSOIfjeSciX4WPLMMDkdhc8DN8l+45n
7V8mh8vsIdNvlRKBryqAP0ttM2DngbIE3RNIhQYlbA==
=fvJJ
-----END PGP SIGNATURE-----

--PNicul23iYnHE6j96mHOd8qKxP3Nq2LUy--

