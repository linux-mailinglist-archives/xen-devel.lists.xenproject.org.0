Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B005F46D58E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 15:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242295.419098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxpj-00027M-LK; Wed, 08 Dec 2021 14:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242295.419098; Wed, 08 Dec 2021 14:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxpj-00024R-Hw; Wed, 08 Dec 2021 14:22:11 +0000
Received: by outflank-mailman (input) for mailman id 242295;
 Wed, 08 Dec 2021 14:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muxpi-00022o-4P
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 14:22:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e5a7f7-5832-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 15:22:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B2641FD26;
 Wed,  8 Dec 2021 14:22:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFDF013C8B;
 Wed,  8 Dec 2021 14:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKAJNI6/sGFHLwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 14:22:06 +0000
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
X-Inumbo-ID: 39e5a7f7-5832-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638973328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hMFaj9gEgE407z9I/veihwtXoy45Iq8g3KZeKUBDa1E=;
	b=BJaEvp8Yo2Sk1vPuKoOkw+hQQR/M43H3VdavBX+eXXem3mLgML6iZf2SVlULabqkaGwrFx
	NpmIqF/8v4IOIWzSGtXEPaA/97EfS+YhQKxo3UP51UjFgSu2GxbUjwiaWG9+5MvaI3JVla
	ltrtxNCRLi95C+8pp/hxUUtXrCY07hI=
Subject: Re: [PATCH v3 2/2] tools: set event channel HVM parameters in
 libxenguest
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211208084745.31082-1-jgross@suse.com>
 <20211208084745.31082-3-jgross@suse.com>
 <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ad570954-98f6-f345-d965-f664f28a6e7d@suse.com>
Date: Wed, 8 Dec 2021 15:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y3gcQyFZkZRmTfug07j39X2g7sN6yp3bb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y3gcQyFZkZRmTfug07j39X2g7sN6yp3bb
Content-Type: multipart/mixed; boundary="QlszJzzRGYOVGEdOfYxcnWSDjKfQX2u2S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ad570954-98f6-f345-d965-f664f28a6e7d@suse.com>
Subject: Re: [PATCH v3 2/2] tools: set event channel HVM parameters in
 libxenguest
References: <20211208084745.31082-1-jgross@suse.com>
 <20211208084745.31082-3-jgross@suse.com>
 <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
In-Reply-To: <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>

--QlszJzzRGYOVGEdOfYxcnWSDjKfQX2u2S
Content-Type: multipart/mixed;
 boundary="------------524EBCADA84413BF09202C23"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------524EBCADA84413BF09202C23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.12.21 14:43, Andrew Cooper wrote:
> On 08/12/2021 08:47, Juergen Gross wrote:
>> The HVM parameters for pre-allocated event channels should be set in
>> libxenguest, like it is done for PV guests and for the pre-allocated
>> ring pages.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> I'm not sure that we have the concept of pre-allocated ring pages.
>=20
> For PV, we have:
>=20
>  =C2=A0=C2=A0=C2=A0 dom->console_pfn =3D xc_dom_alloc_page(dom, "consol=
e");
>  =C2=A0=C2=A0=C2=A0 if ( dom->console_pfn =3D=3D INVALID_PFN )
>  =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 return -1;
>  =C2=A0=C2=A0=C2=A0 xc_clear_domain_page(dom->xch, dom->guest_domid,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
xc_dom_p2m(dom, dom->console_pfn));
>=20
> and for HVM, we have:
>=20
>  =C2=A0=C2=A0=C2=A0 dom->console_pfn =3D special_pfn(SPECIALPAGE_CONSOL=
E);
>  =C2=A0=C2=A0=C2=A0 xc_clear_domain_page(dom->xch, dom->guest_domid, do=
m->console_pfn);

Isn't that a pre-allocation? The PFNs are fixed at boot time of the
guest.

>=20
> With a suitable tweak to the commit message (probably just deleting the=

> final clause), Reivewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> That said...
>=20
>> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom=
=2Ec
>> index fe9f760f71..c9c24666cd 100644
>> --- a/tools/libs/light/libxl_dom.c
>> +++ b/tools/libs/light/libxl_dom.c
>> @@ -723,9 +723,8 @@ out:
>>  =20
>>   static int hvm_build_set_params(xc_interface *handle, uint32_t domid=
,
>>                                   libxl_domain_build_info *info,
>> -                                int store_evtchn, unsigned long *stor=
e_mfn,
>> -                                int console_evtchn, unsigned long *co=
nsole_mfn,
>> -                                domid_t store_domid, domid_t console_=
domid)
>> +                                unsigned long *store_mfn,
>> +                                unsigned long *console_mfn)
>>   {
>>       struct hvm_info_table *va_hvm;
>>       uint8_t *va_map, sum;
>> @@ -752,8 +751,6 @@ static int hvm_build_set_params(xc_interface *hand=
le, uint32_t domid,
>>  =20
>>       xc_hvm_param_get(handle, domid, HVM_PARAM_STORE_PFN, &str_mfn);
>>       xc_hvm_param_get(handle, domid, HVM_PARAM_CONSOLE_PFN, &cons_mfn=
);
>=20
> ... these are junk too.=C2=A0 I'm dismayed at how much of the toolstack=
 tries
> passing function parameters via HVM_PARAMS.
>=20
> libxl's HVM path ought to mirror the PV path and, after
> libxl__build_dom() is called, just read the values back out:
>=20
> state->console_mfn =3D dom->console_pfn;
> state->store_mfn =3D dom->xenstore_pfn;
>=20
>=20
> That then leaves hvm_build_set_params() doing nothing but adjusting the=

> HVM info table for real HVM guests.=C2=A0 dom->max_vcpus is already pre=
sent
> which covers 2 of the 3 fields, leaving only the ACPI boolean left to p=
ass.
>=20
> So by passing the ACPI boolean down, we get rid of
> hvm_build_set_params() entirely, which seems like a very good move.

Yes, this should be in another patch, though.


Juergen

--------------524EBCADA84413BF09202C23
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

--------------524EBCADA84413BF09202C23--

--QlszJzzRGYOVGEdOfYxcnWSDjKfQX2u2S--

--Y3gcQyFZkZRmTfug07j39X2g7sN6yp3bb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGwv44FAwAAAAAACgkQsN6d1ii/Ey/e
3Qf7Bxog6SFxnITh0NHIL1QtJoAYWIeVwPLyFK/wJ7I17YMhQA6MSnJEe5BAnl34zfrrueIsY4ff
0sE84hR9SCqQUOK2o/Q4M6N9oFT6KXQW95/F+18UU1FMSiSaVw7zEzRi2q8xxTGiBa/B+tScBsKi
nAw6RL4HbDhEOUaCSrRheNnbiBioCw2By5PqxgQltfePVYiGJ3HbiUOgiy6bDDMlxq4NEK/o1WCA
AdTAkHTTOtbGu/3Si239zDD5IzU/1wqMGWswwGRRbfy+GkTmBwJtBixxjhhwKfKh5LA5huvYZ/S2
6hNi3iT6x0ZUEF89vBYMk8m+Jv0h4oV04/qkZR9bkQ==
=s8Gi
-----END PGP SIGNATURE-----

--Y3gcQyFZkZRmTfug07j39X2g7sN6yp3bb--

