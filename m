Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B990E2B6869
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 16:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29090.58332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2hc-0005kz-KS; Tue, 17 Nov 2020 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29090.58332; Tue, 17 Nov 2020 15:15:28 +0000
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
	id 1kf2hc-0005ka-H4; Tue, 17 Nov 2020 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 29090;
 Tue, 17 Nov 2020 15:15:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kf2ha-0005kV-SW
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:15:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9abedb6a-64e2-4b5b-9905-b4b448d632d5;
 Tue, 17 Nov 2020 15:15:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2665FAC23;
 Tue, 17 Nov 2020 15:15:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kf2ha-0005kV-SW
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:15:26 +0000
X-Inumbo-ID: 9abedb6a-64e2-4b5b-9905-b4b448d632d5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9abedb6a-64e2-4b5b-9905-b4b448d632d5;
	Tue, 17 Nov 2020 15:15:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605626125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NIMh+kDn8sv7QigDFeMSUidn3Gdqdrk8+0MbayEVtE4=;
	b=NuFy0+ceA+njIr7i79ghUoRniWt0RWugotfl2AbLWX0y2kr2epuWF4BgtL0c6FHikGLnnF
	dMBRZN61WrxozY4dkNmUg14JJcX/41AhZJK6AMOVBoXHmkt8ON5cxMOXl2/WRGBEdWq4LG
	ez1uBOqgy41lpyJj3xgXr5j8XryF/p4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2665FAC23;
	Tue, 17 Nov 2020 15:15:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
 <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
 <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
 <0b8ae7db-b1f6-a23c-e608-27650db702ae@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
Message-ID: <a5d40e13-1585-1093-8d04-ab49874d63f4@suse.com>
Date: Tue, 17 Nov 2020 16:15:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0b8ae7db-b1f6-a23c-e608-27650db702ae@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z8tazrwpXzoFTBMLIbNsA3eK8YaO0egYm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z8tazrwpXzoFTBMLIbNsA3eK8YaO0egYm
Content-Type: multipart/mixed; boundary="t3GALMtWCUxtR9JAA9JMpXVdWHZVMftqI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <a5d40e13-1585-1093-8d04-ab49874d63f4@suse.com>
Subject: Re: [PATCH 09/12] xen/hypfs: add support for id-based dynamic
 directories
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-10-jgross@suse.com>
 <6f8c0d3d-73f6-d10f-182a-8bf76856bf09@suse.com>
 <95f673e5-90a8-0fe9-3842-bdb9de5c4aa4@suse.com>
 <0b8ae7db-b1f6-a23c-e608-27650db702ae@suse.com>
In-Reply-To: <0b8ae7db-b1f6-a23c-e608-27650db702ae@suse.com>

--t3GALMtWCUxtR9JAA9JMpXVdWHZVMftqI
Content-Type: multipart/mixed;
 boundary="------------94DDC25416F4E4CDBF94B304"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------94DDC25416F4E4CDBF94B304
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.20 15:50, Jan Beulich wrote:
> On 17.11.2020 15:38, J=C3=BCrgen Gro=C3=9F wrote:
>> On 17.11.20 14:33, Jan Beulich wrote:
>>> On 26.10.2020 10:13, Juergen Gross wrote:
>>>> +static struct hypfs_entry *hypfs_dyndir_findentry(struct hypfs_entr=
y_dir *dir,
>>>> +                                                  const char *name,=

>>>> +                                                  unsigned int name=
_len)
>>>> +{
>>>> +    struct hypfs_dyndir_id *data;
>>>> +
>>>> +    data =3D hypfs_get_dyndata();
>>>> +    if ( !data )
>>>> +        return ERR_PTR(-ENOENT);
>>>> +
>>>> +    /* Use template with original findentry function. */
>>>> +    return data->template->e.funcs->findentry(data->template, name,=
 name_len);
>>>
>>> Why does this pass the address of the template? If it truly is
>>> (just) a template, then its dirlist ought to be empty at all
>>> times? If otoh the "template" indeed gets used as a node in the
>>> tree then perhaps it wants naming differently? "Stem" would come
>>> to mind, but likely there are better alternatives. I've also
>>> considered the German "Statthalter", but its English translations
>>> don't seem reasonable to me here. And "placeholder" has kind of a
>>> negative touch. (Also in this case some of my "const?" remarks
>>> may be irrelevant.)
>>
>> It is basically a template tree.
>>
>> In the current use case (cpupool/<id>/sched-gran) the template is
>> <id> with the leaf "sched-gran" which is the template for the per
>> cpupool incarnation.
>=20
> I can see sched-gran being a template, albeit even that will get
> dirtied as soon as a second leaf appears, as then these entries
> again need linking together. I think anything called template
> should be strictly r/o.

After boot the template will be constant, just like the hypfs tree
created at boot time.

In theory it could be setup completely static, but this would be
a rather awful mess of macros.

> It's also not clear to me how adding a 2nd level in the hierarchy
> would end up working: <component>/<id1>/<id2>/<leaf>. How would
> <leaf> know all the higher level IDs it's associated with? While
> I don't think this needs making work right away, the underlying
> model at least shouldn't prohibit it.

This is the purpose of hypfs_alloc_dyndata(). You'd need something
like struct hypfs_dyndir_id, but with two ids in it.


Juergen

--------------94DDC25416F4E4CDBF94B304
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

--------------94DDC25416F4E4CDBF94B304--

--t3GALMtWCUxtR9JAA9JMpXVdWHZVMftqI--

--z8tazrwpXzoFTBMLIbNsA3eK8YaO0egYm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+z6QwFAwAAAAAACgkQsN6d1ii/Ey/9
igf/Ypyrkdzn80nw8mMiozvdXUZphXfHWleEFJSmVNPJ0f9NMHSQr2HUYewItKAvlBGqwkV6qEQF
17KmsNToZXjF/hP86I0kQT34ONwmYVmF2o3luu6ZXIDuPS8pSibjsCg+XeXsOJtpPakZMndq7Iuf
5YLZ7+IfZhugSp+pJUN9+OXeWpw67xEC916oT5waHIGTaR6qFjzHlYyOxlCT3PzTOVr29yrV5Qey
M+5hCwGkE57djKDL9vPFeJhi2F0KKFIIELB9QVNR4ilBPDSZsld3D0SzwAJDgL6d4f38hhQJxHbl
cYxHxt/G2O6Rs+yr8GTuQDM+iELMrQwBriMemgjDWA==
=gFyO
-----END PGP SIGNATURE-----

--z8tazrwpXzoFTBMLIbNsA3eK8YaO0egYm--

