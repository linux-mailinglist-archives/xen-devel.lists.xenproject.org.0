Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7B3A3C9A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 09:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140226.259140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbGL-0001F5-D5; Fri, 11 Jun 2021 07:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140226.259140; Fri, 11 Jun 2021 07:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrbGL-0001Cu-9h; Fri, 11 Jun 2021 07:07:29 +0000
Received: by outflank-mailman (input) for mailman id 140226;
 Fri, 11 Jun 2021 07:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=axIZ=LF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lrbGJ-0001Co-Jo
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 07:07:27 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 625e4031-a66f-413e-9de9-88b0edcc5f11;
 Fri, 11 Jun 2021 07:07:26 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 187FB21977;
 Fri, 11 Jun 2021 07:07:25 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DFCC6118DD;
 Fri, 11 Jun 2021 07:07:24 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id XnpvNawLw2DcBwAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 11 Jun 2021 07:07:24 +0000
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
X-Inumbo-ID: 625e4031-a66f-413e-9de9-88b0edcc5f11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623395245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QkWNiooVNQSs05V1bJZC4hCpcru2xf+saAlGuIFl1xA=;
	b=OhwgWzbw67aykne2WUrVUl6cpEksFKAew3hgh9l42M5jWh1pSEZ7avFKRMSLKKefRdviDb
	hSBy1J9VN3KtbocI7RBo9E+UWfh/x0mCSBphmNcbo1AOFVkZyKexkPlzXMv8Z5T5T6Yq3z
	1nnD0ZU20ZTrkH9Im/UY3DCPy+CuI8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623395245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QkWNiooVNQSs05V1bJZC4hCpcru2xf+saAlGuIFl1xA=;
	b=OhwgWzbw67aykne2WUrVUl6cpEksFKAew3hgh9l42M5jWh1pSEZ7avFKRMSLKKefRdviDb
	hSBy1J9VN3KtbocI7RBo9E+UWfh/x0mCSBphmNcbo1AOFVkZyKexkPlzXMv8Z5T5T6Yq3z
	1nnD0ZU20ZTrkH9Im/UY3DCPy+CuI8Y=
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-3-jgross@suse.com>
 <20210608183833.023551f4.olaf@aepfle.de>
 <eaf53d99-fee9-0c79-7f29-efd00aae4d16@suse.com>
 <20210611074616.2a4b96fb.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <fcb0a1d6-c392-e0a1-2ec6-d6cf6a40d6bf@suse.com>
Date: Fri, 11 Jun 2021 09:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611074616.2a4b96fb.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AP7e712yQkVLyO4fDGY3KEqV21vixnSku"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AP7e712yQkVLyO4fDGY3KEqV21vixnSku
Content-Type: multipart/mixed; boundary="CJEOEGrliY7zmAbG4AIy6KhUqkPeJf15M";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <fcb0a1d6-c392-e0a1-2ec6-d6cf6a40d6bf@suse.com>
Subject: Re: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210608055839.10313-1-jgross@suse.com>
 <20210608055839.10313-3-jgross@suse.com>
 <20210608183833.023551f4.olaf@aepfle.de>
 <eaf53d99-fee9-0c79-7f29-efd00aae4d16@suse.com>
 <20210611074616.2a4b96fb.olaf@aepfle.de>
In-Reply-To: <20210611074616.2a4b96fb.olaf@aepfle.de>

--CJEOEGrliY7zmAbG4AIy6KhUqkPeJf15M
Content-Type: multipart/mixed;
 boundary="------------25A267764D7B3BBA5256CE7F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------25A267764D7B3BBA5256CE7F
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.06.21 07:46, Olaf Hering wrote:
> Am Fri, 11 Jun 2021 07:01:31 +0200
> schrieb Juergen Gross <jgross@suse.com>:
>=20
>> Why? You realize that above is a comment just documenting the default?=

>=20
> That depends on the context. See https://bugzilla.opensuse.org/show_bug=
=2Ecgi?id=3D1185682 for a reason why it should become an empty variable. =
But yes, we can patch that one too.
Isn't that a bug in fillup or the related rpm-macro? A variable set in
the existing /etc/sysconfig/xencommons file only should be preserved.

In general I think we should be consistent in the file.

In case there is no downside for other distributions I'd recommend to
switch all variables to your suggested pattern.

If there are disadvantages for others we should keep the current
pattern as changing it now would break existing installations.

Any thoughts?


Juergen

--------------25A267764D7B3BBA5256CE7F
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

--------------25A267764D7B3BBA5256CE7F--

--CJEOEGrliY7zmAbG4AIy6KhUqkPeJf15M--

--AP7e712yQkVLyO4fDGY3KEqV21vixnSku
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDDC6wFAwAAAAAACgkQsN6d1ii/Ey9m
0wgAkIOlHVzqDVW0pGvsXcDniYzyKT5WqvgLEiE0Ld1sYZtw+uV1ctLcAFhqrW01s4uQ925VUnUR
0WRSwfSA90/ht37Bh9z8fnLq/qAOHioirl46iODLZ5eLxc6yWVYBd/Janz9/Pa9ygAO5FdFN835o
K6JK5CCfXWiUw744PP6egPJb3p39f7WvxFti0tOaeh69g6vw6dyMsKifgpPubRzqp7TX8hnTnqmV
AFhwhj8E+qKCDL9PjHBKNsLICJA6IYGM//8hYNzzGCV+2WAjXmLlimpYpDSdjVSVOrTsRADhjdFq
dOpyuZ0HK0X07dTskah0+YhDFYXNKSWDDv5pTlDihg==
=3HK1
-----END PGP SIGNATURE-----

--AP7e712yQkVLyO4fDGY3KEqV21vixnSku--

