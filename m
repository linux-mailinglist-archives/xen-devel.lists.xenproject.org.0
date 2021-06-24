Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328313B2962
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 09:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146421.269411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJt3-0007uQ-QI; Thu, 24 Jun 2021 07:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146421.269411; Thu, 24 Jun 2021 07:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJt3-0007sU-N9; Thu, 24 Jun 2021 07:34:57 +0000
Received: by outflank-mailman (input) for mailman id 146421;
 Thu, 24 Jun 2021 07:34:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwJt3-0007sO-0N
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:34:57 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17c0c82c-e658-49b6-9670-536984581418;
 Thu, 24 Jun 2021 07:34:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 718DB21973;
 Thu, 24 Jun 2021 07:34:55 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 45A4E11A97;
 Thu, 24 Jun 2021 07:34:55 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dNLdD5811GD5AgAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 07:34:55 +0000
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
X-Inumbo-ID: 17c0c82c-e658-49b6-9670-536984581418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MF+fRfPfu7cXOssURgQtzRVhV2H+QCioeeDGHNbBZi4=;
	b=L/wJdovz3Ruvo4YQv71kLqf4uw725ORa+4lI2VRAYIrf9DFGYQ0gP8cmjyScKULa56MSqF
	JC634Wrp8HyurSPQPTJfKCQnYJl+Pin4xovSTOWCnRH/7EJ5nzVlhU51dJ1LCYa6/EpKYk
	1W4FpoCho6+zXs7FxGf2FI645acpQbA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MF+fRfPfu7cXOssURgQtzRVhV2H+QCioeeDGHNbBZi4=;
	b=L/wJdovz3Ruvo4YQv71kLqf4uw725ORa+4lI2VRAYIrf9DFGYQ0gP8cmjyScKULa56MSqF
	JC634Wrp8HyurSPQPTJfKCQnYJl+Pin4xovSTOWCnRH/7EJ5nzVlhU51dJ1LCYa6/EpKYk
	1W4FpoCho6+zXs7FxGf2FI645acpQbA=
Subject: Re: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the
 LU request
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-4-julien@xen.org>
 <fa249348-e4a0-13d0-03d7-d3536a8b759c@suse.com>
Message-ID: <2e28c385-a8ba-1dc3-c41e-8b39f624947c@suse.com>
Date: Thu, 24 Jun 2021 09:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <fa249348-e4a0-13d0-03d7-d3536a8b759c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="epcqypj5nb8HsgLoqadsZdaziLUHxe3O2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--epcqypj5nb8HsgLoqadsZdaziLUHxe3O2
Content-Type: multipart/mixed; boundary="x4fjtpPDxtWS6C6vTTX4edF0L1fk5lMtr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <2e28c385-a8ba-1dc3-c41e-8b39f624947c@suse.com>
Subject: Re: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the
 LU request
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-4-julien@xen.org>
 <fa249348-e4a0-13d0-03d7-d3536a8b759c@suse.com>
In-Reply-To: <fa249348-e4a0-13d0-03d7-d3536a8b759c@suse.com>

--x4fjtpPDxtWS6C6vTTX4edF0L1fk5lMtr
Content-Type: multipart/mixed;
 boundary="------------5C72CD0924C683B93477CB13"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5C72CD0924C683B93477CB13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.06.21 09:32, Juergen Gross wrote:
> On 16.06.21 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> call_delayed() is currently assuming that conn->in is NULL when
>> handling delayed request. However, the connection is not paused.
>> Therefore new request can be processed and conn->in may be non-NULL
>> if we have only received a partial request.
>>
>> Furthermore, as we overwrite conn->in, the current partial request
>> will not be transferred. This will result to corrupt the connection.
>>
>> Rather than updating conn->in, stash the LU request in lu_status and
>> let each callback for delayed request to update conn->in when
>> necessary.
>>
>> To keep a sane interface, the code to write the "OK" response the
>> LU request is moved in xenstored_core.c.
>>
>> Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution=20

>> of a xenstore request")
>> Fixes: ed6eebf17d ("tools/xenstore: dump the xenstore state for live=20
>> update")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> With dropping the conn parameter from call_delayed as already
> mentioned by Luca you can add my:

Oh, please drop my request to delete the conn parameter, as it is being
used in patch 4 again.

>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>

This stands, of course.


Juergen

--------------5C72CD0924C683B93477CB13
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

--------------5C72CD0924C683B93477CB13--

--x4fjtpPDxtWS6C6vTTX4edF0L1fk5lMtr--

--epcqypj5nb8HsgLoqadsZdaziLUHxe3O2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUNZ4FAwAAAAAACgkQsN6d1ii/Ey+R
RQgAh5Qy4Wa+anvob+RYc2xFF6Kk4P6ZPecNPul5PUjwIs9OpQm1rQc8TT97WEqNDpB6H1LMX8Oz
pzCYYysyjwUZL8rG17U5WJS/aPGazQqklQ9hnEQkGZQFBDz3tFgWpGb43jw2O6XekJ66++G81eBy
j/uoPomN0iY5/qVQjNlgtywWknHq50tMda56V6laxcZ/YaW0xgqkI+PCnA8OKzpPAvTQPkJ05Q4Y
bALbLxOtvAKAeb1nz+5N+VJoCt+vrWj2cLHQcHCK2+Wv4MA7FKT6uAWrCKsNC49HN8n2tMUOLTn1
xTHqXZHpFIxRaVrE21U/qrHPwNHR0NuXldaBIYDe4A==
=pJdl
-----END PGP SIGNATURE-----

--epcqypj5nb8HsgLoqadsZdaziLUHxe3O2--

