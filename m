Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08C2C2B20
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 16:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36546.68491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khaA0-0003mX-B5; Tue, 24 Nov 2020 15:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36546.68491; Tue, 24 Nov 2020 15:23:16 +0000
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
	id 1khaA0-0003m0-7f; Tue, 24 Nov 2020 15:23:16 +0000
Received: by outflank-mailman (input) for mailman id 36546;
 Tue, 24 Nov 2020 15:23:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kha9x-0003lO-W0
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:23:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6f2bae5-09b7-4a9c-915d-2c10e60d4ba4;
 Tue, 24 Nov 2020 15:23:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AB7CAC2D
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 15:23:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kha9x-0003lO-W0
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:23:14 +0000
X-Inumbo-ID: d6f2bae5-09b7-4a9c-915d-2c10e60d4ba4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6f2bae5-09b7-4a9c-915d-2c10e60d4ba4;
	Tue, 24 Nov 2020 15:23:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606231392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xOn7bhmsHAh3nbeX1jA5Pz+A8azHmtctaSU5thLi85w=;
	b=H5pMvDonqaAn5/7SWPxGd3hNew0zvm5I55fsDf3DMYH9POhueNGt0+S2mR8KhnkQqGkutc
	2x/gCRNk5Xsd/R3zk5JOq8qspcMVhJyZWU+clST7neNyIr/t9Ck5nSDPXs7nc828EYzZ3L
	f8x3I4Xjxbn+/4Z8kvl74/sh9Tv0jVg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2AB7CAC2D
	for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 15:23:12 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
 <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <ca994a9d-92c2-9cc6-1315-cb71cd3ffeed@suse.com>
Date: Tue, 24 Nov 2020 16:23:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CHFSPsKpbHOpBA7AY793o9AaF3msjbQyG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CHFSPsKpbHOpBA7AY793o9AaF3msjbQyG
Content-Type: multipart/mixed; boundary="13prHdkrRQ56cFfNKGw6OMaTt6fySie4V";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Message-ID: <ca994a9d-92c2-9cc6-1315-cb71cd3ffeed@suse.com>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
References: <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
 <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
In-Reply-To: <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>

--13prHdkrRQ56cFfNKGw6OMaTt6fySie4V
Content-Type: multipart/mixed;
 boundary="------------7E7EF1C34DD9F071E8552867"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7E7EF1C34DD9F071E8552867
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 15:59, Roger Pau Monn=C3=A9 wrote:
> On Tue, Nov 24, 2020 at 03:42:28PM +0100, Jan Beulich wrote:
>> On 24.11.2020 11:05, Jan Beulich wrote:
>>> On 23.11.2020 18:39, Manuel Bouyer wrote:
>>>> On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monn=C3=A9 wrote=
:
>>>>> OK, I'm afraid this is likely too verbose and messes with the timin=
gs.
>>>>>
>>>>> I've been looking (again) into the code, and I found something weir=
d
>>>>> that I think could be related to the issue you are seeing, but have=
n't
>>>>> managed to try to boot the NetBSD kernel provided in order to asser=
t
>>>>> whether it solves the issue or not (or even whether I'm able to
>>>>> repro it). Would you mind giving the patch below a try?
>>>>
>>>> With this, I get the same hang but XEN outputs don't wake up the int=
errupt
>>>> any more. The NetBSD counter shows only one interrupt for ioapic2 pi=
n 2,
>>>> while I would have about 8 at the time of the hang.
>>>>
>>>> So, now it looks like interrupts are blocked forever.
>>>
>>> Which may be a good thing for debugging purposes, because now we have=

>>> a way to investigate what is actually blocking the interrupt's
>>> delivery without having to worry about more output screwing the
>>> overall picture.
>>>
>>>> At
>>>> http://www-soc.lip6.fr/~bouyer/xen-log5.txt
>>>> you'll find the output of the 'i' key.
>>>
>>> (XEN)    IRQ:  34 vec:59 IO-APIC-level   status=3D010 aff:{0}/{0-7} i=
n-flight=3D1 d0: 34(-MM)
>>>
>>> (XEN)     IRQ 34 Vec 89:
>>> (XEN)       Apic 0x02, Pin  2: vec=3D59 delivery=3DLoPri dest=3DL sta=
tus=3D1 polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000001
>>
>> Since it repeats in Manuel's latest dump, perhaps the odd combination
>> of status=3D1 and irr=3D1 is to tell us something? It is my understand=
ing
>> that irr ought to become set only when delivery-status clears. Yet I
>> don't know what to take from this...
>=20
> My reading of this is that one interrupt was accepted by the lapic
> (irr=3D1) and that there's a further interrupt pending that hasn't yet
> been accepted by the lapic (status=3D1) because it's still serving the
> previous one. But that's all weird because there's no matching
> vector in ISR, and hence the IRR bit on the IO-APIC has somehow become
> stale or out of sync with the lapic state?
>=20
> I'm also unsure about how Xen has managed to reach this state, it
> shouldn't be possible in the first place.
>=20
> I don't think I can instrument the paths further with printfs because
> it's likely to result in the behavior itself changing and console
> spamming. I could however create a static buffer to trace relevant
> actions and then dump all them together with the 'i' debug key output.

debugtrace is your friend here. It already has a debug key for printing
the buffer contents to console ('T').

As the buffer is wrap-around you can even add debug prints in the
related interrupt paths for finding out which paths have been called in
which order and on which cpu. Depending on the findings you might want
to use percpu buffers.


Juergen

--------------7E7EF1C34DD9F071E8552867
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

--------------7E7EF1C34DD9F071E8552867--

--13prHdkrRQ56cFfNKGw6OMaTt6fySie4V--

--CHFSPsKpbHOpBA7AY793o9AaF3msjbQyG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+9JV8FAwAAAAAACgkQsN6d1ii/Ey/z
vgf9EqBNBC5Bd0PHn2dGMAsXLPfIlLRuzuJAOggqLZ8ff91iIPjFLsAlmZ1iFUCEm/b7+6sr3EFg
3gbJBvnCBfSMWDOmlMAA1CPpf1JRqKRcSlaCLd8jkTYSQCPLjYWgjj/fywyi7fDaPzj2x6AMPlCj
5dvGxW7Y88Ns9AVlE12g5acX0PE4hZ/4tndCNi1JktbDcsQYd8rXcSa/I7VyAu1hfDHl2CxvOJiz
17im+YEZP9Wbk4ixtG5BpCb9hC4/DGicflMqfPMoN20GrwEDbukdfYuc1CjAALkFnnYsYTgyi5OQ
TowFNbtGZIGvr9WqN3xuPiv1xJprIbseQy13lGpbQA==
=XcfH
-----END PGP SIGNATURE-----

--CHFSPsKpbHOpBA7AY793o9AaF3msjbQyG--

