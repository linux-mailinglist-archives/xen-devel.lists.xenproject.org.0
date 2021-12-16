Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9260476961
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 06:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247715.427155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxj54-0001Nt-GV; Thu, 16 Dec 2021 05:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247715.427155; Thu, 16 Dec 2021 05:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxj54-0001LA-DL; Thu, 16 Dec 2021 05:13:26 +0000
Received: by outflank-mailman (input) for mailman id 247715;
 Thu, 16 Dec 2021 05:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=edRR=RB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mxj53-0001L4-2P
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 05:13:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4018ebb-5e2e-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 06:13:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9889A210FE;
 Thu, 16 Dec 2021 05:13:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E84013BFD;
 Thu, 16 Dec 2021 05:13:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EGZxEfLKumFnBQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Dec 2021 05:13:22 +0000
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
X-Inumbo-ID: e4018ebb-5e2e-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639631602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uC9tykHxC/e+1nOG+UXY3mFjCKhJSQXn/qf/DOQkm84=;
	b=sN+Un354ZMuVTQDZlY/hct1kBzFyCuV16BIdIVpJ54RpFrfmW7go7T4Op0LenXlhUBdfyR
	UHTj5ryJqe35p3ypqFpx8i/oP9GHHhyWUFEGZfMZKC+RH1RSOXsNuKIMcWFeKjFk05mttD
	fPIjSvfbI6aTkXfkFqEUlYnjx2Uk48g=
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
Date: Thu, 16 Dec 2021 06:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cKdxQx09uPLSFfOLXGbKAmf7yAtYXSOq2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cKdxQx09uPLSFfOLXGbKAmf7yAtYXSOq2
Content-Type: multipart/mixed; boundary="2DvwhwW2UhiVQIMt3PjVrtUWdJeJNWa5a";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Message-ID: <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>

--2DvwhwW2UhiVQIMt3PjVrtUWdJeJNWa5a
Content-Type: multipart/mixed;
 boundary="------------39CD9263BFF5C97F1954ED0A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------39CD9263BFF5C97F1954ED0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.12.21 03:10, Stefano Stabellini wrote:
> On Wed, 15 Dec 2021, Juergen Gross wrote:
>> On 14.12.21 18:36, Julien Grall wrote:
>>> Hi,
>>>
>>> On 08/12/2021 15:55, Juergen Gross wrote:
>>>> Today most hypercall handlers have a return type of long, while the
>>>> compat ones return an int. There are a few exceptions from that rule=
,
>>>> however.
>>>
>>> So on Arm64, I don't think you can make use of the full 64-bit becaus=
e a
>>> 32-bit domain would not be able to see the top 32-bit.
>>>
>>> In fact, this could potentially cause us some trouble (see [1]) in Xe=
n.
>>> So it feels like the hypercalls should always return a 32-bit signed =
value
>>> on Arm.
>>
>> This would break hypercalls like XENMEM_maximum_ram_page which are abl=
e
>> to return larger values, right?
>>
>>> The other advantage is it would be clear that the top 32-bit are not
>>> usuable. Stefano, what do you think?
>>
>> Wouldn't it make more sense to check the return value to be a sign
>> extended 32-bit value for 32-bit guests in do_trap_hypercall() instead=
?
>>
>> The question is what to return if this is not the case. -EDOM?
>=20
>=20
> I can see where Julien is coming from: we have been trying to keep the
> arm32 and arm64 ABIs identical since the beginning of the project. So,
> like Julien, my preference would be to always return 32-bit on ARM, bot=
h
> aarch32 and aarch64. It would make things simple.
>=20
> The case of XENMEM_maximum_ram_page is interesting but it is not a
> problem in reality because the max physical address size is only 40-bit=

> for aarch32 guests, so 32-bit are always enough to return the highest
> page in memory for 32-bit guests.

You are aware that this isn't the guest's max page, but the host's?

And all of this is about a 32-bit guest on a 64-bit host.


Juergen

--------------39CD9263BFF5C97F1954ED0A
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

--------------39CD9263BFF5C97F1954ED0A--

--2DvwhwW2UhiVQIMt3PjVrtUWdJeJNWa5a--

--cKdxQx09uPLSFfOLXGbKAmf7yAtYXSOq2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG6yvEFAwAAAAAACgkQsN6d1ii/Ey8q
UAf/ekXR4hXzhPNRYZ31HpSluABmRIe2Tgiq+Kfp2bDE+1c0uQdWsZMYB1ozWEWtuEGueUo0nvnz
f3QYeJQcE0Wkmj6ProBQr85roChdvA/+H0saPDacen0FIA4aSvvCDteEUEtxaRvxNhVL2RU3qgWD
JxgOmMX3MRCjHI0nYNiwof+kAC9c3Yx/UHU5GS7Nr9RLE8UQ7ySSsUsFlhCJZn8MqSipF5AJNlaV
D3f+jy1aEA3bXrL7GUzv7rv+3lQ0/394bTYhTeJC4BlC89editPIcT6J2RkK26c1ug/DHz7oaBvr
31KI/2BN9vArcRqXGjDB1XZVX0w2zwoe/XyBAZinDA==
=dUQM
-----END PGP SIGNATURE-----

--cKdxQx09uPLSFfOLXGbKAmf7yAtYXSOq2--

