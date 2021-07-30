Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BE3DB51D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 10:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162380.297804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9O47-00017M-Eo; Fri, 30 Jul 2021 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162380.297804; Fri, 30 Jul 2021 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9O47-00014m-Bk; Fri, 30 Jul 2021 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 162380;
 Fri, 30 Jul 2021 08:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9O46-00014g-IC
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 08:40:22 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c639ff88-f111-11eb-988b-12813bfff9fa;
 Fri, 30 Jul 2021 08:40:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78803221CE;
 Fri, 30 Jul 2021 08:40:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 452AA1332A;
 Fri, 30 Jul 2021 08:40:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 5sCkD/S6A2G1FgAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 08:40:20 +0000
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
X-Inumbo-ID: c639ff88-f111-11eb-988b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627634420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTa0w3u3ZB7ECoThBRcoiV3/r9FiwsvJUQuaLnc8fIA=;
	b=BNznAlp0zoTMhL5EBS4LaSdCtYYv43RYce2aQ2xRCfKxvfpXAZGVZkwhciMzMPkiBEfTNR
	0cSEmy6tB9fNxoScxWnyCRBihwf//k1ibT/impdOKOZmEsOtDwL0CHdboWQP9gBK4dbxD9
	fQtRW0FDd1Uq5YLumdSGp7CZ5sHEy20=
Subject: Re: [PATCH] tools/xenstored: Don't assume errno will not be
 overwritten in lu_arch()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210729110647.25500-1-julien@xen.org>
 <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3f3843c0-5766-b483-ce25-33fe2d4359ca@suse.com>
Date: Fri, 30 Jul 2021 10:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8ZGbNSLIUzkEDiWrsJoxSn7lMt0To4Iz5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8ZGbNSLIUzkEDiWrsJoxSn7lMt0To4Iz5
Content-Type: multipart/mixed; boundary="BAV7UqQtqvTgp2HBCq9xGIRR6o3N4HOK2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <3f3843c0-5766-b483-ce25-33fe2d4359ca@suse.com>
Subject: Re: [PATCH] tools/xenstored: Don't assume errno will not be
 overwritten in lu_arch()
References: <20210729110647.25500-1-julien@xen.org>
 <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>
In-Reply-To: <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>

--BAV7UqQtqvTgp2HBCq9xGIRR6o3N4HOK2
Content-Type: multipart/mixed;
 boundary="------------8B48492AA85A8C5872115182"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8B48492AA85A8C5872115182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.07.21 17:23, Julien Grall wrote:
>=20
>=20
> On 29/07/2021 12:06, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, do_control_lu() will set errno to 0 before calling
>> lu_arch() and then check errno. The expectation is nothing in lu_arch(=
)
>> will change the value unless there is an error.
>>
>> However, per errno(3), a function that succeeds is allowed to change
>> errno. In fact, syslog() will overwrite errno if the logs are rotated
>> at the time it is called.
>>
>> To prevent any further issue, errno is now always set before
>> returning NULL.
>>
>> Additionally, errno is only checked when returning NULL so the client
>> can see the error message if there is any.
>>
>> Reported-by: Michael Kurth <mku@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> =C2=A0 tools/xenstore/xenstored_control.c | 5 +++--
>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_control.c=20
>> b/tools/xenstore/xenstored_control.c
>> index 6b68b79faac7..6fcb42095b59 100644
>> --- a/tools/xenstore/xenstored_control.c
>> +++ b/tools/xenstore/xenstored_control.c
>> @@ -324,6 +324,7 @@ static const char *lu_binary_alloc(const void=20
>> *ctx, struct connection *conn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lu_status->kernel_size =3D size;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lu_status->kernel_off =3D 0;
>> +=C2=A0=C2=A0=C2=A0 errno =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> =C2=A0 }
>> @@ -339,6 +340,7 @@ static const char *lu_binary_save(const void *ctx,=
=20
>> struct connection *conn,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(lu_status->kernel + lu_status->k=
ernel_off, data, size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lu_status->kernel_off +=3D size;
>> +=C2=A0=C2=A0=C2=A0 errno =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> =C2=A0 }
>=20
> I forgot to update lu_binary(). I will respin the patch once I get some=
=20
> feedback.

With setting errno to 0 before returning NULL in lu_binary() you can add

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


--------------8B48492AA85A8C5872115182
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

--------------8B48492AA85A8C5872115182--

--BAV7UqQtqvTgp2HBCq9xGIRR6o3N4HOK2--

--8ZGbNSLIUzkEDiWrsJoxSn7lMt0To4Iz5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEDuvMFAwAAAAAACgkQsN6d1ii/Ey/a
dAgAlYrgeBUdVs+l1wRVHTzZW7xqKYyDS3/0+qPCZMf3zzPzikJXmzzFeVKR3H6pIYhjcJnGEwaZ
VaNq3YqIwOoFwvkT7izTqZ6mlrcrXEH77aN7wdcw2u5aRfaNxHoPAajgJB+uDQRdUwisrguauqiF
Rc7bpgGBpUaX5JoFEH6a9FyXRS7WoC0on04yqaKV63Yn9S5drQRD17SZQ8m4jnLLZGgQpmR4S0JW
m7ND4yBZ1MxxCU4YHV91GLfiV6f2/vo8soYzdEhvu2C/Y4yGBHlaYZumeTuQUJHxVvorBzuJmS7M
PNosBbEvdGuLVHNX91eg6QgXIJscqsH8xklJgHsktg==
=wFbV
-----END PGP SIGNATURE-----

--8ZGbNSLIUzkEDiWrsJoxSn7lMt0To4Iz5--

