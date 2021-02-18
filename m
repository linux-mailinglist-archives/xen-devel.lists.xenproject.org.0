Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A231E912
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86546.162648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChm0-0000Hd-BQ; Thu, 18 Feb 2021 11:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86546.162648; Thu, 18 Feb 2021 11:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChm0-0000H3-87; Thu, 18 Feb 2021 11:47:08 +0000
Received: by outflank-mailman (input) for mailman id 86546;
 Thu, 18 Feb 2021 11:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UbXw=HU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lChly-0000Gy-W2
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:47:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 239e4b99-9bc6-4847-8fc0-a589a73e4141;
 Thu, 18 Feb 2021 11:47:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C8E9AD78;
 Thu, 18 Feb 2021 11:47:05 +0000 (UTC)
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
X-Inumbo-ID: 239e4b99-9bc6-4847-8fc0-a589a73e4141
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613648825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vP1S07ca3sqxgRiRY6So84F1f0cq3n+/55ZYZDA6jwQ=;
	b=bbqMqQPt/mCi0FQMo/l8RuuHzWubuWl+3oL3+ISKNpzdVgWomKjvgyFU4aLwfBrO5r6YSB
	bBsbYGkktn/vBHy77BiKC4W4Wa5m57T8d12DH4zahL7+jS6c92GYd9iAcQZQ1j0dYFgVu2
	SmPIKAaqojOJEWKS/EnIXqK8M2Zhyv0=
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
 <6cc74d6b-d537-0e9f-9da8-45456f6b703e@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <63e42922-204d-9d0e-6a02-49f64e7e8885@suse.com>
Date: Thu, 18 Feb 2021 12:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6cc74d6b-d537-0e9f-9da8-45456f6b703e@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nyMyUXtbBYfCQJffcUfegBSEpdoFj1b9E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nyMyUXtbBYfCQJffcUfegBSEpdoFj1b9E
Content-Type: multipart/mixed; boundary="aIEYVeglYW0935UFABA3RFn6vG3A7vknV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Message-ID: <63e42922-204d-9d0e-6a02-49f64e7e8885@suse.com>
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
 <6cc74d6b-d537-0e9f-9da8-45456f6b703e@oracle.com>
In-Reply-To: <6cc74d6b-d537-0e9f-9da8-45456f6b703e@oracle.com>

--aIEYVeglYW0935UFABA3RFn6vG3A7vknV
Content-Type: multipart/mixed;
 boundary="------------456ECA628170F25D28062DF7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------456ECA628170F25D28062DF7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.02.21 22:35, Boris Ostrovsky wrote:
>=20
> On 2/11/21 5:16 AM, Juergen Gross wrote:
>=20
>> @@ -622,6 +623,7 @@ static void xen_irq_lateeoi_locked(struct irq_info=
 *info, bool spurious)
>>   	}
>>  =20
>>   	info->eoi_time =3D 0;
>> +	smp_store_release(&info->is_active, 0);
>=20
>=20
> Can this be done in lateeoi_ack_dynirq()/lateeoi_mask_ack_dynirq(), aft=
er we've masked the channel? Then it will be consistent with how how othe=
r chips do it, especially with the new helper.

Yes, I think this should work.


Juergen

--------------456ECA628170F25D28062DF7
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

--------------456ECA628170F25D28062DF7--

--aIEYVeglYW0935UFABA3RFn6vG3A7vknV--

--nyMyUXtbBYfCQJffcUfegBSEpdoFj1b9E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAuU7gFAwAAAAAACgkQsN6d1ii/Ey98
ogf+OYHpzRVAg+cjmXBOIZ/G9w3jDjtACYbBCL6aLdsTm5mBymNr96GdNITM2eHwIKj2RjY/A9NO
ZbJFT8kzKZLnKDI7Pz1s/qENqqe2aINBtEeXzln/8IBuZB2dOg236Q+BOtfTuNNK/MljOUm1qRkg
XwlZbaBB5CGe8xZ4uS9tPWvmrQCWYshArgfg8UEoeZGbBeLzQ7Hdyh8Qj9Kh+oaUnKWjmi3xJ9Xc
Y0KJ3N0kohBYNneknpMdWf6YmPXXmjud2QGBY85EO1gvjCw0ozxxqjiTzDQg7HUBEMqvHQvp4lT3
8EzJBjCDsZUk6jbkMzqFJQHYwS9xCPo4EoCFBut7/Q==
=19YR
-----END PGP SIGNATURE-----

--nyMyUXtbBYfCQJffcUfegBSEpdoFj1b9E--

