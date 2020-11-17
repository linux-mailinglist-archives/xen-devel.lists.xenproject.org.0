Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40F2B6B0E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 18:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29179.58427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf4Qb-0000mE-1n; Tue, 17 Nov 2020 17:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29179.58427; Tue, 17 Nov 2020 17:06:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf4Qa-0000ln-UZ; Tue, 17 Nov 2020 17:06:00 +0000
Received: by outflank-mailman (input) for mailman id 29179;
 Tue, 17 Nov 2020 17:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kf4QZ-0000ld-E4
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 17:05:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22aafae3-e6ba-4c30-85d9-32e07ccf0ced;
 Tue, 17 Nov 2020 17:05:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DC05AC23;
 Tue, 17 Nov 2020 17:05:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kf4QZ-0000ld-E4
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 17:05:59 +0000
X-Inumbo-ID: 22aafae3-e6ba-4c30-85d9-32e07ccf0ced
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 22aafae3-e6ba-4c30-85d9-32e07ccf0ced;
	Tue, 17 Nov 2020 17:05:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605632752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jU9zgjzkKm5TUxHW9+jxf6dwu+x5eJjIvscgzJqljts=;
	b=CQHuwSV9yrBce7wTbYFvHE8U+rYq4jrtQ2Sl8jJAfnPLnzVTBL2rdNg4ObVNjtgx3SIC81
	oNVXgDwotdZmaUY0OC/9mcWHM3UwuCpwq7Zp4F3J9QBqyVx6qrfKGPIuujmP02YsM6KlmF
	Y4eeh3jCn4zt8dBB53ob2A7tSxYCf9I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0DC05AC23;
	Tue, 17 Nov 2020 17:05:52 +0000 (UTC)
Subject: Re: [PATCH 11/12] xen/hypfs: add scheduling granularity entry to
 cpupool entries
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-12-jgross@suse.com>
 <1c3a991b-f7c4-6aeb-6b3d-f7a8865e821a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <553484e9-a73e-8469-f6cf-ae834cc7edc1@suse.com>
Date: Tue, 17 Nov 2020 18:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1c3a991b-f7c4-6aeb-6b3d-f7a8865e821a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5vFfxkmIiPxfeUjAtCWGbHdyj5LCZI1pz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5vFfxkmIiPxfeUjAtCWGbHdyj5LCZI1pz
Content-Type: multipart/mixed; boundary="lmilOCPDHuVXtkyy3V4tTabNVbZjItU5U";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Message-ID: <553484e9-a73e-8469-f6cf-ae834cc7edc1@suse.com>
Subject: Re: [PATCH 11/12] xen/hypfs: add scheduling granularity entry to
 cpupool entries
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-12-jgross@suse.com>
 <1c3a991b-f7c4-6aeb-6b3d-f7a8865e821a@suse.com>
In-Reply-To: <1c3a991b-f7c4-6aeb-6b3d-f7a8865e821a@suse.com>

--lmilOCPDHuVXtkyy3V4tTabNVbZjItU5U
Content-Type: multipart/mixed;
 boundary="------------721BE416B4F46C379A1AF4F9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------721BE416B4F46C379A1AF4F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.20 17:49, Jan Beulich wrote:
> On 26.10.2020 10:13, Juergen Gross wrote:
>> @@ -1057,6 +1063,43 @@ static struct hypfs_entry *cpupool_dir_findentr=
y(struct hypfs_entry_dir *dir,
>>       return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
>>   }
>>  =20
>> +static int cpupool_gran_read(const struct hypfs_entry *entry,
>> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    const struct hypfs_dyndir_id *data;
>> +    struct cpupool *cpupool;
>=20
> const?

Yes.

>=20
>> +    const char *name =3D "";
>> +
>> +    data =3D hypfs_get_dyndata();
>> +    if ( !data )
>> +        return -ENOENT;
>> +
>> +    spin_lock(&cpupool_lock);
>> +
>> +    cpupool =3D __cpupool_find_by_id(data->id, true);
>> +    if ( cpupool )
>> +        name =3D sched_gran_get_name(cpupool->gran);
>> +
>> +    spin_unlock(&cpupool_lock);
>> +
>> +    if ( !cpupool )
>=20
> May I suggest to check !*name here, to avoid giving the impression
> of ...
>=20
>> +        return -ENOENT;
>> +
>> +    return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0=
;
>=20
> ... success (but an empty name) in this admittedly unlikely event?

Fine with me.


Juergen

--------------721BE416B4F46C379A1AF4F9
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------721BE416B4F46C379A1AF4F9--

--lmilOCPDHuVXtkyy3V4tTabNVbZjItU5U--

--5vFfxkmIiPxfeUjAtCWGbHdyj5LCZI1pz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+0Au8FAwAAAAAACgkQsN6d1ii/Ey/2
tAf/fAgoU1D7poVoAEBE74aSBKZlRQNNePTdW8f37nM/qQCtOSSFa4qGGhlcyvKXf3Vx+LA4634d
p6wEOUFCriBzkylewEoVw0nwGZ2YZnBbXNFhx5XMkpob00ut+uegkV8Sm9yMXbJsrkFgUclndBkL
eXXZGWSoanraR6mXYDAqRjAE1g9NjyvU0q66gLuAf6OiHANgwVUWuPgvpI+DFoZ/uKx0Tv5ggXPh
yT2m5YjdztfoKvtIrt/dm3KbOBatnkKwTDu+V/G0SM0VmfCqRWRW0tcl0l0II1KiQBKxklQohwnm
wBSZUApiTzPV0QVo4YKRtjJIRtJoEsINe7xryOrf0A==
=TDBS
-----END PGP SIGNATURE-----

--5vFfxkmIiPxfeUjAtCWGbHdyj5LCZI1pz--

