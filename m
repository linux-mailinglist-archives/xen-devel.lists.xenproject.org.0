Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94211432F94
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212816.370838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjbH-00019P-IS; Tue, 19 Oct 2021 07:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212816.370838; Tue, 19 Oct 2021 07:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjbH-000171-Ec; Tue, 19 Oct 2021 07:31:55 +0000
Received: by outflank-mailman (input) for mailman id 212816;
 Tue, 19 Oct 2021 07:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcjbG-00016v-U5
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:31:54 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 204e53b8-c64a-4505-825c-fa849541d363;
 Tue, 19 Oct 2021 07:31:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 303702197E;
 Tue, 19 Oct 2021 07:31:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3C0E13CEE;
 Tue, 19 Oct 2021 07:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2+gnN2h0bmEccgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 07:31:52 +0000
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
X-Inumbo-ID: 204e53b8-c64a-4505-825c-fa849541d363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634628713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x8cUE7tOnsITujGfnLd+t6drEURh8EHS6ZYA83UMPPk=;
	b=tgqyNsBhmVaVWm+gASeoKrXHRdKu1fNKgVL/NR2pQH6nomxb2aWeZ+GZtYKPh407kSgY6b
	M4mZ0hMRAAdN3HhdGAQ6cVf+KsjQPaUGnp2UW8Lev6xLvx7/jb/MZQU5DhgAwwa9p4qweG
	qlBUrlm0zHGjZR1NyVI4z+7RL3iOjbM=
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211019044123.29648-1-jgross@suse.com>
 <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: fix oom setting of xenstored
Message-ID: <c486ebb9-7cda-da67-7122-bceb291805b3@suse.com>
Date: Tue, 19 Oct 2021 09:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GpF4t1dCyDbhmqfV84Jn6DMaCc4F9KeBK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GpF4t1dCyDbhmqfV84Jn6DMaCc4F9KeBK
Content-Type: multipart/mixed; boundary="ECDTjyHLIejfBfecnbmih8UWELNpftYrA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <c486ebb9-7cda-da67-7122-bceb291805b3@suse.com>
Subject: Re: [PATCH] tools: fix oom setting of xenstored
References: <20211019044123.29648-1-jgross@suse.com>
 <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>
In-Reply-To: <0c93abe3-3908-009f-efca-08000092cd4d@suse.com>

--ECDTjyHLIejfBfecnbmih8UWELNpftYrA
Content-Type: multipart/mixed;
 boundary="------------9FE7A23CD25ED1718AB5F75B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9FE7A23CD25ED1718AB5F75B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.10.21 08:54, Jan Beulich wrote:
> On 19.10.2021 06:41, Juergen Gross wrote:
>> --- a/tools/hotplug/Linux/launch-xenstore.in
>> +++ b/tools/hotplug/Linux/launch-xenstore.in
>> @@ -60,7 +60,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons &&=
 . @CONFIG_DIR@/@CONFIG_LEAF
>>   		echo "No xenstored found"
>>   		exit 1
>>   	}
>> -	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=
=3D50
>> +	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] && XENSTORED_OOM_MEM_THRESHOLD=
=3D50
>=20
> Is resilience against "set -e" being in effect of interest? If so I
> think this would want to be

I don't think set -e would have a negative effect on above line. The
bash man-page tells me that:

   The shell does not exit if the command that fails is part of the
   command list immediately following a while or until keyword, part of
   the test following the if, ...

And I believe that "[ ... ]" is treated like an "if". A short test
showed that bash indeed does not exit in this case:

   ( set -e; [ -z "" ] && xx=3Dokay; echo $xx; )

This will print "okay", so bash didn't exit.

>=20
> 	[ -n "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=3D=
50
>=20
>>   	XS_OOM_SCORE=3D-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
>=20
> Alternatively, how about dropping the line above and using
>=20
>   	XS_OOM_SCORE=3D-$((${XENSTORED_OOM_MEM_THRESHOLD:-50} * 10))
>=20
> here?

This would be an option, yes.

Unless a maintainer wants me to send another patch with this change I'll
keep it as it is now.


Juergen

--------------9FE7A23CD25ED1718AB5F75B
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

--------------9FE7A23CD25ED1718AB5F75B--

--ECDTjyHLIejfBfecnbmih8UWELNpftYrA--

--GpF4t1dCyDbhmqfV84Jn6DMaCc4F9KeBK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFudGgFAwAAAAAACgkQsN6d1ii/Ey9K
FQf/TqhSWZcGbsMBdkai3xGHJ0UmdDdqrlzz5C8mFDGk8ahGPxR8+HOM0lqgSljg8qEd3AUFIuFg
KcirtHqkGq5Zvs4WEMJuihVOpZVKIpcmMoql2zZFKSORCRWcY6xo+LTkZqAn8gluY3da7jyaOXo+
+x24XXUg3IfkWuqveHuE9u+kqW5kxLMcbYCPLdJtmZRQ8NppxDSoP2522z87JgH+zj2NtjLt1QpU
vGAjEPBgPZKXYxesFP+yelyo06wVnDIllw/3TVI0RIfjIn79MDclfZBjMlfXiUBhKKO8Y1Fsq+Wq
wm47tIOgXSOIjYKrNb9U75aHftIhLw2PzvZfXcXLJw==
=r76W
-----END PGP SIGNATURE-----

--GpF4t1dCyDbhmqfV84Jn6DMaCc4F9KeBK--

