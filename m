Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8A429FB9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206891.362568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maD5K-0003Sr-BX; Tue, 12 Oct 2021 08:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206891.362568; Tue, 12 Oct 2021 08:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maD5K-0003QP-8M; Tue, 12 Oct 2021 08:24:30 +0000
Received: by outflank-mailman (input) for mailman id 206891;
 Tue, 12 Oct 2021 08:24:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maD5I-0003QJ-Ii
 for xen-devel@lists.xen.org; Tue, 12 Oct 2021 08:24:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0366dc4-2b35-11ec-811a-12813bfff9fa;
 Tue, 12 Oct 2021 08:24:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72A0821F2D;
 Tue, 12 Oct 2021 08:24:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51B0113AD5;
 Tue, 12 Oct 2021 08:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XtnBEjpGZWHkRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Oct 2021 08:24:26 +0000
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
X-Inumbo-ID: d0366dc4-2b35-11ec-811a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634027066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eZjHPAwxkS2O7gpf6XWworSpUX0ovTDgAwSOnKL33oQ=;
	b=ks/mBVT0A949O5nI8fL8yYYwM4BW7FZBmhNA4+WiL/zYBuWBZu+iH26YEZEcb1qshPIs9a
	vnbBkR0S/aTHhjAWguK6N3RiLidqAf0Yb2m1f2RnSb795hjMgEMi7UpWL4cy6RFJTQEeW4
	0C4fMCGmSJyK1XUyAmFr05WTMw5XFDM=
To: Ryan Cai <ryancaicse@gmail.com>, xen-devel@lists.xen.org,
 ian.jackson@eu.citrix.com
References: <747C0632-F341-4716-8B4A-10428A39A07D@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [BUG] improper locking due to the unreleased lock
Message-ID: <20dccfa2-ec94-f2b0-b357-d6205f55abb4@suse.com>
Date: Tue, 12 Oct 2021 10:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <747C0632-F341-4716-8B4A-10428A39A07D@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="czGOlA9TKUk6esJh50Xy9liR95WCObflV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--czGOlA9TKUk6esJh50Xy9liR95WCObflV
Content-Type: multipart/mixed; boundary="HQx2NjqtF387DvUNPuFJbSNP4wvW5AgM2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ryan Cai <ryancaicse@gmail.com>, xen-devel@lists.xen.org,
 ian.jackson@eu.citrix.com
Message-ID: <20dccfa2-ec94-f2b0-b357-d6205f55abb4@suse.com>
Subject: Re: [BUG] improper locking due to the unreleased lock
References: <747C0632-F341-4716-8B4A-10428A39A07D@gmail.com>
In-Reply-To: <747C0632-F341-4716-8B4A-10428A39A07D@gmail.com>

--HQx2NjqtF387DvUNPuFJbSNP4wvW5AgM2
Content-Type: multipart/mixed;
 boundary="------------3288E81149A77D9985814311"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3288E81149A77D9985814311
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.10.21 08:54, Ryan Cai wrote:
> Dear maintainers for Xen Project,
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 I am writing you to report a bug due to the unreleased=20
> lock. The impact could be deadlock or memory consumption. In the=20
> function of /read_watch_internal/, the mutex lock /h->watch_mutex/=20
> (*Line901*) is not released correctly when=20
> /read_message(h,nonblocking)=3D=3D -1/(*Line 923*). Looking forward to =
your=20
> feedback. Thank for checking.
>=20
> Locations,=20
> https://github.com/xen-project/xen/blob/master/tools/libs/store/xs.c#L9=
02-L924

Thanks for the report.

 From looking at read_watch_internal() this seems to be right, but this
is no issue in reality.

The missing mutex_unlock() is inside a !USE_PTHREAD section. This
implies muex_lock() and mutex_unlock() being defined as ((void)0),
so there is no risk of anything going wrong.

Even with no risk something going wrong here, the code should be
corrected nevertheless in order to avoid others to stumble over that.


Juergen

--------------3288E81149A77D9985814311
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

--------------3288E81149A77D9985814311--

--HQx2NjqtF387DvUNPuFJbSNP4wvW5AgM2--

--czGOlA9TKUk6esJh50Xy9liR95WCObflV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFlRjkFAwAAAAAACgkQsN6d1ii/Ey/0
xQf8CP3spAyQPWOBAezk9NtS2Cp7Ers1AwOK8gn5MdrMfgHnJIJuJ7WAOl2f4Itslh47P/xMszLN
w0AoDZFvLCKWjX7qeDA0JjI5i1FJClkg9vKP4tjRDymE19rKFXis+CwL9UG3rJRFSJfAwoonuF4h
HFhjJ54yiY4cq0t/u9oWCjPyRiI1ELQEY2jW8a8ZokIYkKR0PwNJg/s48sQoLuR/0C0D0s06IdJL
FQyX9C5nGZb5rrSXD66ckweG4zrv7yo+F7a65xJd/sAgDqRX/TqSoPdkQOxHf4TGS4qo9zY3OZSk
p2ul5OEHHSDW2i6MNYXXPjESfcaAnA7BFWGniMkpVw==
=k8lN
-----END PGP SIGNATURE-----

--czGOlA9TKUk6esJh50Xy9liR95WCObflV--

