Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40B401A84
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179658.326050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNChV-0004oM-6g; Mon, 06 Sep 2021 11:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179658.326050; Mon, 06 Sep 2021 11:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNChV-0004m6-2k; Mon, 06 Sep 2021 11:22:09 +0000
Received: by outflank-mailman (input) for mailman id 179658;
 Mon, 06 Sep 2021 11:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNChT-0004lB-2U
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:22:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6da9db43-d88a-499b-b0fd-cecfad644a93;
 Mon, 06 Sep 2021 11:22:05 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F59A1FEDA;
 Mon,  6 Sep 2021 11:22:05 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D706F1395F;
 Mon,  6 Sep 2021 11:22:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vfZkMtz5NWHMHgAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 06 Sep 2021 11:22:04 +0000
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
X-Inumbo-ID: 6da9db43-d88a-499b-b0fd-cecfad644a93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630927325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bZxp9VPY5c6s8wGWdcldGfjpDN2Ri4rZPWfB5DP4AhM=;
	b=bEaIQLE5MuOXofj7XevBMD0xy+9D6CkEGI6CYk3d3+8iq+g/iihWrHggeKk2q1oegYM5nh
	CURX71E2d7T1M4vuz5eax8R5OIoub50wNLYiv1z+l+wn5AYA2uuxlnskgfja76+bxCNWMb
	f0qRM0QDeXn+VI593KSgj6yLSr62CBY=
Subject: Re: [PATCH] xen/sched: fix sched_move_domain() for domain without
 vcpus
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20210906110057.15384-1-jgross@suse.com>
 <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <72a7728d-1b30-5cc7-981d-50471e77126b@suse.com>
Date: Mon, 6 Sep 2021 13:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DqXVcNp9qsxotgnM55gXR6Fc3Gf5QKbfg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DqXVcNp9qsxotgnM55gXR6Fc3Gf5QKbfg
Content-Type: multipart/mixed; boundary="VzyTPZaAbTyoAKrBL7tBm5kVgPMOxo8kl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <72a7728d-1b30-5cc7-981d-50471e77126b@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain() for domain without
 vcpus
References: <20210906110057.15384-1-jgross@suse.com>
 <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>
In-Reply-To: <0006eb7d-a9d5-16a3-1418-a1d28c4c9a92@citrix.com>

--VzyTPZaAbTyoAKrBL7tBm5kVgPMOxo8kl
Content-Type: multipart/mixed;
 boundary="------------DF3084C52409BDBB90E4E232"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DF3084C52409BDBB90E4E232
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.09.21 13:14, Andrew Cooper wrote:
> On 06/09/2021 12:00, Juergen Gross wrote:
>> In case a domain is created with a cpupool other than Pool-0 specified=

>> it will be moved to that cpupool before any vcpus are allocated.
>>
>> This will lead to a NULL pointer dereference in sched_move_domain().
>>
>> Fix that by tolerating vcpus not being allocated yet.
>>
>> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between cp=
upools with different granularity")
>> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/common/sched/core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 8d178baf3d..79c9100680 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -671,6 +671,10 @@ int sched_move_domain(struct domain *d, struct cp=
upool *c)
>>  =20
>>       for ( unit_idx =3D 0; unit_idx < n_units; unit_idx++ )
>>       {
>> +        /* Special case for move at domain creation time. */
>> +        if ( !d->vcpu[unit_idx * gran] )
>> +            break;
>> +
>>           unit =3D sched_alloc_unit_mem();
>>           if ( unit )
>>           {
>=20
> I think the logic would be clearer if you wrap the entire for loop in i=
f
> ( d->max_vcpus ).

No, d->max_vcpus is not 0 here, otherwise n_units would be 0.

> This loop is only allocating units in the new
> scheduler for existing vcpus, so there's no point entering the loop at
> all during domain creation.
>=20
> Also, this removes a non-speculatively-guarded d->vcpu[] deference.

I don't think this dereference is a real problem. In case you are
worried about it we should replace the one further below, too.


Juergen

--------------DF3084C52409BDBB90E4E232
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

--------------DF3084C52409BDBB90E4E232--

--VzyTPZaAbTyoAKrBL7tBm5kVgPMOxo8kl--

--DqXVcNp9qsxotgnM55gXR6Fc3Gf5QKbfg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE1+dwFAwAAAAAACgkQsN6d1ii/Ey8T
+gf/d689AFSV3hds3y/QXlpXUIPF3DagRR4HOLSSJeQ2q7/NgGTQ9fMDm0p2qMwCP4fIjNzHnsg9
Jb2W9kvV/y7PJ/LyhoXEwSyXc51zFqPgH7lJrCTP59lq2N7n6pxK8GxDOyX4maaIpQNmzDkwvCmz
3vIjbNbKzShLHV+0CZajwxoPEGaLOPcV10gI+VnfWU9Z+GtieDroDm028sqopjiz42yqCyE+eeHW
YcDHIPGrlwknjlZnQowcXfadMDvYKBX9Cp397jDP8z0q6a0oxQOeukAG7/tJ3hTv2EE70CUwGt9j
GUv6OK3UfK9ujo3fkbBN4kznB/dMJsLrx4g/rIkJWA==
=vY95
-----END PGP SIGNATURE-----

--DqXVcNp9qsxotgnM55gXR6Fc3Gf5QKbfg--

