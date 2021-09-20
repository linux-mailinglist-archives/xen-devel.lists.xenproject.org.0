Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367641134A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 13:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190770.340567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSH4a-0007C4-Cq; Mon, 20 Sep 2021 11:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190770.340567; Mon, 20 Sep 2021 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSH4a-00078u-9A; Mon, 20 Sep 2021 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 190770;
 Mon, 20 Sep 2021 11:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSH4Y-00078E-JJ
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 11:02:54 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d5a4e8c-1a02-11ec-b86e-12813bfff9fa;
 Mon, 20 Sep 2021 11:02:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB99521B6C;
 Mon, 20 Sep 2021 11:02:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5F5413A81;
 Mon, 20 Sep 2021 11:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id R0xOJ1xqSGGWegAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 11:02:52 +0000
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
X-Inumbo-ID: 4d5a4e8c-1a02-11ec-b86e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632135772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TVS2SqHFrmFSbMMppf0wvv3pK+xtBrNM0FRyOccvbE=;
	b=mXjaX6ZuwfyMitE6fZanTm6/xjs6/l86y+ja93vy8RQ0RJmD8z0OIpeyBLopECRT00zzIC
	9CD3GdFcY9IUNVhQpo36DOXYDMTj6cUSi5qbMzj21ghzJrsGLXDlcGhkGL6eV9F6C/Ln/3
	91lOZVoQ8PcARJ8RGtjBZ7/P6ZckL5s=
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
To: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-5-roger.pau@citrix.com>
 <90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
 <YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
 <24904.26906.715083.732081@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <25710b42-b2e9-54a2-a510-d8e09dbb1c25@suse.com>
Date: Mon, 20 Sep 2021 13:02:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24904.26906.715083.732081@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NByWTPrdaKC00GvXJ0H6WWw1BBxPhQA99"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NByWTPrdaKC00GvXJ0H6WWw1BBxPhQA99
Content-Type: multipart/mixed; boundary="jyB29GWEhZhoI8seEmpN67tbzqdkNOsDl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
Message-ID: <25710b42-b2e9-54a2-a510-d8e09dbb1c25@suse.com>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-5-roger.pau@citrix.com>
 <90f64a21-d5fc-fab3-2f3c-73de00421cb3@suse.com>
 <YUhoLnpv+Dq/dFBR@MacBook-Air-de-Roger.local>
 <24904.26906.715083.732081@mariner.uk.xensource.com>
In-Reply-To: <24904.26906.715083.732081@mariner.uk.xensource.com>

--jyB29GWEhZhoI8seEmpN67tbzqdkNOsDl
Content-Type: multipart/mixed;
 boundary="------------79ED079A120A1A2A6D87821C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------79ED079A120A1A2A6D87821C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.09.21 12:57, Ian Jackson wrote:
> Roger Pau Monn=C3=A9 writes ("Re: [PATCH 4/6] tools/xenstored: use atex=
it to close interfaces"):
>> On Mon, Sep 20, 2021 at 11:22:15AM +0200, Juergen Gross wrote:
>>> Could you please add closing of xce_handle(), too?
>>
>> Sure, I somehow assumed there was a reason for not closing it related
>> to live update, but I see that's not the case as you use exec to
>> launch the new image and atexit handlers are not called in that case.
>=20
> Are these fds marked CLOEXEC ?  I don't think they are BICBW.

They are. I checked when implementing LU and just rechecked.

The event-channel fd is opened explicitly without CLOEXEC in order
to support LU (the new xenstored won't open it again, but gets its
fd via the migration stream).


Juergen

--------------79ED079A120A1A2A6D87821C
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

--------------79ED079A120A1A2A6D87821C--

--jyB29GWEhZhoI8seEmpN67tbzqdkNOsDl--

--NByWTPrdaKC00GvXJ0H6WWw1BBxPhQA99
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFIalwFAwAAAAAACgkQsN6d1ii/Ey/b
BQf+Ptu0E3SDZzKJ+yYurEIAUMzaa8B0rSvVisHdgliHCT1FTcUY6KwQVc5DuJlMN686fB2vDrKH
YFmInn0Z3Gasi2xt/UulzvOp0BUM4QwYtgMfdEcgVdQ3ubgvb5VQFBnSgPPIzmtqjRzqwt642hvo
iGhe9t7tzjatEwq9AtXaA8PtPwjsWDPhbJ0EhheZ2NSShq0TyapesgYcIO4mF8wzU8imAojVaCja
bHVTMiLp6D7jwNsqpuUTGnT85B6EpfPUbitBkIFaU3fCyRVZV63OPFLm24SfDdwjt15SpIAHcYu9
FY+4G/qt5SguvVnAfKEN/kCHk9/i0daggTXPQ93VmQ==
=l/5l
-----END PGP SIGNATURE-----

--NByWTPrdaKC00GvXJ0H6WWw1BBxPhQA99--

