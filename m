Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C4039DB14
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137856.255345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDJH-0005mC-5w; Mon, 07 Jun 2021 11:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137856.255345; Mon, 07 Jun 2021 11:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqDJH-0005iB-1i; Mon, 07 Jun 2021 11:20:47 +0000
Received: by outflank-mailman (input) for mailman id 137856;
 Mon, 07 Jun 2021 11:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqDJF-0005aa-I5
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:20:45 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04639098-c405-4c5e-a4e6-49718097229f;
 Mon, 07 Jun 2021 11:20:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C52801FDA1;
 Mon,  7 Jun 2021 11:20:37 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9BDF0118DD;
 Mon,  7 Jun 2021 11:20:37 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ulviJAUBvmAcVAAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 11:20:37 +0000
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
X-Inumbo-ID: 04639098-c405-4c5e-a4e6-49718097229f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623064837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9GCv56hn2ceBq+ibp+voDCt2yOAP9i23fZo/5cnTdE=;
	b=gmbL+CAAcYWZXnHSroyO+d83cSqBOsNgFhy6xhvqyCeZSULvMKJr8ENTdmxRePytgqc6xi
	tyi8UewcuqH+3HckLR24vWaj2kLo6FI2X00GGxw9E+VyGTN0pU5j9vr1HghFmbTappkITP
	EO3GU4NL/l2I1x8qVN+8MKRP4SRVpEE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623064837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9GCv56hn2ceBq+ibp+voDCt2yOAP9i23fZo/5cnTdE=;
	b=gmbL+CAAcYWZXnHSroyO+d83cSqBOsNgFhy6xhvqyCeZSULvMKJr8ENTdmxRePytgqc6xi
	tyi8UewcuqH+3HckLR24vWaj2kLo6FI2X00GGxw9E+VyGTN0pU5j9vr1HghFmbTappkITP
	EO3GU4NL/l2I1x8qVN+8MKRP4SRVpEE=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210607090425.18277-1-jgross@suse.com>
 <cd954aa7-ee43-1126-f97a-21c213ef053b@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
Message-ID: <747ef58e-3b39-89b5-c48d-37313e33c260@suse.com>
Date: Mon, 7 Jun 2021 13:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cd954aa7-ee43-1126-f97a-21c213ef053b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ry2uOR4k0zJd6JcJaWXfMLqEPBVgzEgMI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ry2uOR4k0zJd6JcJaWXfMLqEPBVgzEgMI
Content-Type: multipart/mixed; boundary="pIACGx8hhqOjynFkcG9HXxkDgr0NjzDMU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <747ef58e-3b39-89b5-c48d-37313e33c260@suse.com>
Subject: Re: [PATCH] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
References: <20210607090425.18277-1-jgross@suse.com>
 <cd954aa7-ee43-1126-f97a-21c213ef053b@citrix.com>
In-Reply-To: <cd954aa7-ee43-1126-f97a-21c213ef053b@citrix.com>

--pIACGx8hhqOjynFkcG9HXxkDgr0NjzDMU
Content-Type: multipart/mixed;
 boundary="------------6ACA3C7A8FB1812A69F8E498"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6ACA3C7A8FB1812A69F8E498
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.06.21 13:01, Andrew Cooper wrote:
> On 07/06/2021 10:04, Juergen Gross wrote:
>> After 32-bit PV-guests have been security de-supported when not runnin=
g
>> under PV-shim, the hypervisor will no longer be configured to support
>> those domains per default when not being built as PV-shim.
>>
>> Unfortunately libxenguest will fail saving or restoring a PV domain
>> due to this restriction, as it is trying to get the compat MFN list
>> even for 64 bit guests.
>>
>> Fix that by obtaining the compat MFN list only for 32-bit PV guests.
>>
>> Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests =
are no longer supported")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/guest/xg_sr_common_x86_pv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/guest=
/xg_sr_common_x86_pv.c
>> index cd33406aab..ad20461e2e 100644
>> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
>> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
>> @@ -154,6 +154,7 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>>       ctx->x86.pv.compat_m2p_mfn0 =3D entries[0].mfn;
>>   #else
>>       /* 64 bit toolstacks need to ask Xen specially for it */
>> +    if ( ctx->x86.pv.levels =3D=3D 3 )
>>       {
>>           struct xen_machphys_mfn_list xmml =3D {
>>               .max_extents =3D 1,
>=20
> This wants to encompass the whole ifdef block, to avoid having differin=
g
> behaviour between compile widths.
>=20
> Also the comment next to compat_m2p_mfn0 wants adjusting to say "only
> set for 32bit PV guests".

Okay, together with Jan's suggestion this makes sense.


Juergen

--------------6ACA3C7A8FB1812A69F8E498
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

--------------6ACA3C7A8FB1812A69F8E498--

--pIACGx8hhqOjynFkcG9HXxkDgr0NjzDMU--

--ry2uOR4k0zJd6JcJaWXfMLqEPBVgzEgMI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC+AQUFAwAAAAAACgkQsN6d1ii/Ey9K
eAf/SsrdRuYjPVO0O+lO8rM6vdmekTAAsUfJPEc9urgnr3im3liNJcxFddU23rDBwuVJtKXmaop3
aPnJUI6Dfz3ZsFd+gIwK/fHXI5QePMLlTl2n5XZOn9YjPjquq9ypYhWBVL6mwnPMwpnmGpdLGNwZ
cxyMwDFOKP7VEcvrEZ010aZTnH8EzKFW47dVr5+Gb2xJTKZVyvONIAnE3x0pbomiDGj5SGSxQV5v
huxsuvDPin2fk6DOgPMqen/e7a/2SDzFh+XLT5XwL/IiMbGIsvtmMaZsz/wBfennUdAxl6BI/Yy+
2wQM0cr6ePByd5Rfr6vh6kEE0L/LXS/1SjXnX7BYvA==
=jpkX
-----END PGP SIGNATURE-----

--ry2uOR4k0zJd6JcJaWXfMLqEPBVgzEgMI--

