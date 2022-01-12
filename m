Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90348C4B6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 14:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256627.440559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7dZC-0002c4-D0; Wed, 12 Jan 2022 13:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256627.440559; Wed, 12 Jan 2022 13:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7dZC-0002aC-9u; Wed, 12 Jan 2022 13:21:30 +0000
Received: by outflank-mailman (input) for mailman id 256627;
 Wed, 12 Jan 2022 13:21:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7dZA-0002a6-MW
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 13:21:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0c81d2-73aa-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 14:21:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1B101F3C2;
 Wed, 12 Jan 2022 13:21:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3A0D13B64;
 Wed, 12 Jan 2022 13:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B6dTKtbV3mGHVQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 13:21:26 +0000
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
X-Inumbo-ID: 8c0c81d2-73aa-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641993686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mHAZ8qm5OrpRzWCW4YIqbzRNW+DTcH4TrZFdh9mFnl4=;
	b=V22N936/aBiAJ0gPJVObi52cVp2h1VuXN4WnPrCV7U7YI5jTQ8JPxXLNO70fMrDA0p93GL
	vbWVAIlkNV/gn6MY3s+SYvl1FDlLdl048juRq6V40c9/ffjB02Ozawf+br6IjHiC6MKmIe
	RYPEB4vICCIFz+riCQqm67C+ZSFFfJQ=
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-2-jgross@suse.com>
 <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
 <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>
Subject: Re: [PATCH v2 1/3] tools/libs/evtchn: decouple more from mini-os
Message-ID: <5c790a9c-14d0-f353-d5de-d0d70487f181@suse.com>
Date: Wed, 12 Jan 2022 14:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i4193qLPPsCaNFLTrhY4uzxbAHbJIGLey"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i4193qLPPsCaNFLTrhY4uzxbAHbJIGLey
Content-Type: multipart/mixed; boundary="TUVpNIJDQZM4VYecScC3huJfrvMryf4Bf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <5c790a9c-14d0-f353-d5de-d0d70487f181@suse.com>
Subject: Re: [PATCH v2 1/3] tools/libs/evtchn: decouple more from mini-os
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-2-jgross@suse.com>
 <a73bd0c2-44ee-c984-9c72-15d36afc8aa5@srcf.net>
 <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>
In-Reply-To: <152c1627-e8e1-4f98-abe6-ee45a2fdebe0@suse.com>

--TUVpNIJDQZM4VYecScC3huJfrvMryf4Bf
Content-Type: multipart/mixed;
 boundary="------------4F612B4FCF0A1EE5BEFDD73D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4F612B4FCF0A1EE5BEFDD73D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.22 08:22, Juergen Gross wrote:
> On 11.01.22 20:56, Andrew Cooper wrote:
>> On 11/01/2022 15:03, Juergen Gross wrote:
>>> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
>>> index e5dfdc5ef5..c3a5ce3b98 100644
>>> --- a/tools/libs/evtchn/minios.c
>>> +++ b/tools/libs/evtchn/minios.c
>>> =C2=A0 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flag=
s)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 int fd =3D alloc_fd(FTYPE_EVTCHN);
>>> +=C2=A0=C2=A0=C2=A0 int fd;
>>> +=C2=A0=C2=A0=C2=A0 struct file *file;
>>> +=C2=A0=C2=A0=C2=A0 struct port_list *list;
>>> +=C2=A0=C2=A0=C2=A0 static unsigned int ftype_evtchn;
>>> -=C2=A0=C2=A0=C2=A0 if ( fd =3D=3D -1 )
>>> +=C2=A0=C2=A0=C2=A0 if ( !ftype_evtchn )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ftype_evtchn =3D alloc_fi=
le_type(&evtchn_ops);
>>
>> Hmm.=C2=A0 MiniOS doesn't appear to support __attribute__((constructor=
)) but
>> this would be an ideal candidate.
>>
>> It would remove a non-threadsafe singleton from a (largely unrelated)
>> codepath.
>>
>> Should be very simple to add to MiniOS.=C2=A0 See Xen's init_construct=
ors(),
>> and add CONSTRUCTORS to the linker file.
>=20
> I'll look into this.

Turns out that I can't use __attribute__((constructor)), as this is
supported through newlib already (the linker script contains everything
needed, but the activation is outside of Mini-OS).

I'll use something like initcall() instead.


Juergen

--------------4F612B4FCF0A1EE5BEFDD73D
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

--------------4F612B4FCF0A1EE5BEFDD73D--

--TUVpNIJDQZM4VYecScC3huJfrvMryf4Bf--

--i4193qLPPsCaNFLTrhY4uzxbAHbJIGLey
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHe1dYFAwAAAAAACgkQsN6d1ii/Ey9V
DAf8C8QMBO0WmcRXQCWGMze4R5u1wa1/hvC09OOC8PG9gn763+eqh0kkkqBYb1RcSJdfYjWKD2So
6w3RBiRz3zISaIENzKPdUx+mvNauan0S+SDbTerkBZgx43ZAc2FZksndVem2zYU1TT4a9X+D8hfF
K+ApJQoNmI1CAzDCyapVIuhfcz4ObK51WZ1DcaAss+Elr7WXN+Vb1Q6BXXDSCCAp2i7fhrw1cWoe
yPQQ1WGtHx4VETGlASz8NHO/g8dTiwWV9tDhY/AOj0EW1woYJ2mRuaMPt0ROE7hN7HuYktF/1ZBO
BRKgjQo+v2dc83yOek5O7s9Iql7Vn2g2tslAiS0Z0A==
=AvXy
-----END PGP SIGNATURE-----

--i4193qLPPsCaNFLTrhY4uzxbAHbJIGLey--

