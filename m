Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A781B2C6804
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39513.72446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kietz-0000PO-8d; Fri, 27 Nov 2020 14:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39513.72446; Fri, 27 Nov 2020 14:39:11 +0000
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
	id 1kietz-0000Oz-5B; Fri, 27 Nov 2020 14:39:11 +0000
Received: by outflank-mailman (input) for mailman id 39513;
 Fri, 27 Nov 2020 14:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kietx-0000Ou-VB
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:39:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a8edfd9-97e5-4ed7-b3de-f88a634514bf;
 Fri, 27 Nov 2020 14:39:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF675AC55;
 Fri, 27 Nov 2020 14:39:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQCY=FB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kietx-0000Ou-VB
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:39:09 +0000
X-Inumbo-ID: 0a8edfd9-97e5-4ed7-b3de-f88a634514bf
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0a8edfd9-97e5-4ed7-b3de-f88a634514bf;
	Fri, 27 Nov 2020 14:39:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606487948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQEL1saZRtu8Ds50rj4d1r4gft1kfdAL7bU++DKRAsU=;
	b=rZcR5dYs1BNrBXablSRUo5sQhKUgbG/e2Iv/Qr/yzmU7+RVBqrkm7j9az0T6bWSS5fWXhr
	Ec1OZ/fwhYPW2YetM+4OFGGM9XVROOM/xj8JFAPrRf3BAFRjYpbXv62AAUx7Cgi+k24ZpG
	n9DXfkH5GjGxVIL6NhW4aWwOAspVf+8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DF675AC55;
	Fri, 27 Nov 2020 14:39:07 +0000 (UTC)
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
 <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a11fb0fc-9a2e-8f9a-5fd3-356c0e0a0f60@suse.com>
Date: Fri, 27 Nov 2020 15:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qFJVFUWfoJ3GRGmlv25OVTUGcA1OgIM2c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qFJVFUWfoJ3GRGmlv25OVTUGcA1OgIM2c
Content-Type: multipart/mixed; boundary="tu9tYuq12ieXBY65NuByCg9Pgwae9UW5K";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <a11fb0fc-9a2e-8f9a-5fd3-356c0e0a0f60@suse.com>
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
 <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
In-Reply-To: <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>

--tu9tYuq12ieXBY65NuByCg9Pgwae9UW5K
Content-Type: multipart/mixed;
 boundary="------------1EED04DB54FFE24301D417DA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1EED04DB54FFE24301D417DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.11.20 15:23, Julien Grall wrote:
>=20
>=20
> On 25/11/2020 10:51, Juergen Gross wrote:
>> evtchn_fifo_set_pending() can be simplified a little bit.
>=20
> The commit message is quite light... For posterity, it would be good to=
=20
> explain why the simplication can be done. In particular, there is a=20
> chance in behavior after this patch.
>=20
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V8:
>> - new patch
>> ---
>> =C2=A0 xen/common/event_fifo.c | 34 +++++++++++++++-------------------=

>> =C2=A0 1 file changed, 15 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
>> index 443593c3b3..77609539b1 100644
>> --- a/xen/common/event_fifo.c
>> +++ b/xen/common/event_fifo.c
>> @@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu=20
>> *v, struct evtchn *evtchn)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Control block not mapped.=C2=A0 The guest =
must not unmask an
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * event until the control block is initializ=
ed, so we can
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * just drop the event.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if ( unlikely(!v->evtchn_fifo->control_block) )
>=20
> Sort of unrelated, AFAICT, v->evtchn_fifo->control_block can be set=20
> concurrently to this access.
>=20
> Thankfully, once the control block is mapped, it can't be unmapped.=20
> However, there is still a possibility that you may see half of the upda=
te.
>=20
> Shouldn't the field access with ACCESS_ONCE()?

Shouldn't this be another patch? Especially as the writing side needs
the same treatment.


Juergen

--------------1EED04DB54FFE24301D417DA
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

--------------1EED04DB54FFE24301D417DA--

--tu9tYuq12ieXBY65NuByCg9Pgwae9UW5K--

--qFJVFUWfoJ3GRGmlv25OVTUGcA1OgIM2c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/BD4sFAwAAAAAACgkQsN6d1ii/Ey8r
DQf+IDpivk4Wp9bZNtf+YBYCdJI7fIp/G9OQ7a7qtIWc5Hqj38BSwpFrve78Uuzjaz59dxixM+QA
enLUSrl2RT0XgkDEjlNrOGGjtBJYODbRufAFoDUoqN7YP29WtYzQLMreBdsRyZlja5CzQqKyR56w
0IaFimrafWwNFhvcMbuUcKKVmOZ6V7d1VjKvlxvJ5o71zZjPhxCPhpM1/YePrIHKm4yPTUAE4A0q
YJ/Fge8FfQf2svgLmhZ0N3yX7ivZk4dIKwgFXSpW8S24Wyrm/qvXKxqadBU3h08vpa6al7i7u9LB
hq9GZ4A1pMt27SLvqTgQCTbgafY2rVdKsGnRTbQMuQ==
=yu8P
-----END PGP SIGNATURE-----

--qFJVFUWfoJ3GRGmlv25OVTUGcA1OgIM2c--

