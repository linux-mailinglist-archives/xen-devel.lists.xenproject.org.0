Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1ED475385
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 08:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247210.426243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxOSJ-00026R-Vq; Wed, 15 Dec 2021 07:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247210.426243; Wed, 15 Dec 2021 07:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxOSJ-00024O-SU; Wed, 15 Dec 2021 07:12:03 +0000
Received: by outflank-mailman (input) for mailman id 247210;
 Wed, 15 Dec 2021 07:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mxOSI-00024I-HU
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 07:12:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c92cb22-5d76-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 08:12:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3463221129;
 Wed, 15 Dec 2021 07:12:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E247213A9F;
 Wed, 15 Dec 2021 07:12:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iXrKNUCVuWG3FwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Dec 2021 07:12:00 +0000
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
X-Inumbo-ID: 4c92cb22-5d76-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639552321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15My+PJ6ro/29XJ7JPxPnTvWs3MugXPrknbtyof5fn4=;
	b=dry/vHdEj3t68n8iZ68fSXnK9DsHmPiVSmekUGEyxwq6py1dAfd7kdyhxXFmfA3LtwVq/H
	MhAYC89nQw7Ht03U1s1FLULkeeBs8LuBBLa5ZGJLOKW6LLcsS3n5DQ9jTspaF2V3vpqEpV
	j4T2RCH66gcEW4S7WhoH8k7uE5XTUvY=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-2-jgross@suse.com>
 <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 01/13] xen: move do_vcpu_op() to arch specific code
Message-ID: <3af8127b-36b6-b810-3060-313736ce1735@suse.com>
Date: Wed, 15 Dec 2021 08:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x7SYBZboS7A9pr6GNVHuw3RrSTI1pXgp7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x7SYBZboS7A9pr6GNVHuw3RrSTI1pXgp7
Content-Type: multipart/mixed; boundary="uXBEoWnl3ybfSedL27BmyzCDvnqce1jZC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <3af8127b-36b6-b810-3060-313736ce1735@suse.com>
Subject: Re: [PATCH v3 01/13] xen: move do_vcpu_op() to arch specific code
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-2-jgross@suse.com>
 <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>
In-Reply-To: <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>

--uXBEoWnl3ybfSedL27BmyzCDvnqce1jZC
Content-Type: multipart/mixed;
 boundary="------------69BD973EF22395FF7CC7512D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------69BD973EF22395FF7CC7512D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.21 18:21, Julien Grall wrote:
> Hi Juergen,
>=20
> On 08/12/2021 15:55, Juergen Gross wrote:
>> Today Arm is using another entry point for the vcpu_op hypercall as
>=20
> NIT: The 'as' doesn't sound right here. Did you mean 'compare to'?

Hmm, it should even be "different" instead of "another". And then it
should be:

   The entry point used for the vcpu_op hypercall on Arm is different
   from the one on x86 today.

>=20
>> x86, as some of the common sub-ops are not supported on Arm. The Arm
>> specific handler filetrs out the not supported sub-ops and then calls
>=20
> Typo: s/filetrs/filters/

Yes.

>=20
>> the common handler. This leads to the weird call hierarchy:
>>
>> =C2=A0=C2=A0 do_arm_vcpu_op()
>> =C2=A0=C2=A0=C2=A0=C2=A0 do_vcpu_op()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch_do_vcpu_op()
>>
>> Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
>> arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
>> of above calls can be avoided without restricting any potential
>> future use of common sub-ops for Arm.
>>
>> Additionally the single user of HYPERCALL_ARM() can be modified and
>> HYPERCALL_ARM() can be removed.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks,


Juergen


--------------69BD973EF22395FF7CC7512D
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

--------------69BD973EF22395FF7CC7512D--

--uXBEoWnl3ybfSedL27BmyzCDvnqce1jZC--

--x7SYBZboS7A9pr6GNVHuw3RrSTI1pXgp7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG5lUAFAwAAAAAACgkQsN6d1ii/Ey9V
+QgAhiJ94tekZvvRqy6hOczHq+mECr6FJQwlBC6dsLWy4OeklwkCRpO3R3/tuuCMdNxjIhrvF3yU
MGT0dk2S09pMIRvq+cP/Vxi2b8lcypZLpVTPYPhfJX62/2anmAuuf828xGqz3n/fpb++hY66lpKv
Up058u7K+/FAs+PzhNScVcKuCwALJS7aQuOi6easQSe/Y6z909m5DEG4DEyMjWKWWdOs6BwZXEsJ
5BBK3HAZ0kqAgUjDeXolEI6EJky1jtw2KnuyVUll9VepCbTxPjqwCdu3TkuTVUFwsmT81G4NXYOM
KBetwy2jmhHelw8Zyh91nkEbFp9P6/nzKt0uX6loGg==
=S6Ms
-----END PGP SIGNATURE-----

--x7SYBZboS7A9pr6GNVHuw3RrSTI1pXgp7--

