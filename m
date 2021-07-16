Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF53CBA1A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 17:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157618.290287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Q6Q-0000WK-0k; Fri, 16 Jul 2021 15:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157618.290287; Fri, 16 Jul 2021 15:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Q6P-0000UD-Ty; Fri, 16 Jul 2021 15:50:13 +0000
Received: by outflank-mailman (input) for mailman id 157618;
 Fri, 16 Jul 2021 15:50:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CyKe=MI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m4Q6N-0000U6-L9
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 15:50:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aadc08a7-a276-44aa-8f31-666913e7e190;
 Fri, 16 Jul 2021 15:50:08 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5BBB51FEC3;
 Fri, 16 Jul 2021 15:50:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 04E8313AFC;
 Fri, 16 Jul 2021 15:50:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id AHS8Oq6q8WBOaAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 16 Jul 2021 15:50:06 +0000
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
X-Inumbo-ID: aadc08a7-a276-44aa-8f31-666913e7e190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1626450607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lXy48QuWUvGXK2y0/GrM/08MUhOFaXIssXSLAV6VtMU=;
	b=kncXsew4tVJrxD1lN7K8EqYT0qTl+xQSyx/bxO+88c2fLyHx2lKSyc87C2cbxen/3Z1EeO
	sfxXa0T5BWm0emBJNkOJxWvUah8honhTAiCN9AT1IFG2HSEWGPJsrCVleTAgw3yuzU7x1j
	XwC4XZI/+6vYnpszyJuu3WT8RA08biA=
To: George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <e072846b-5aa3-2403-5e0f-723577fe25e5@suse.com>
Date: Fri, 16 Jul 2021 17:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HYYijo62PUGMbkKdaB8ngw2gocOggvaMW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HYYijo62PUGMbkKdaB8ngw2gocOggvaMW
Content-Type: multipart/mixed; boundary="uww06YkSnHksOTqt7Z6y4Bj0CFxirMY2u";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <e072846b-5aa3-2403-5e0f-723577fe25e5@suse.com>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>
In-Reply-To: <40A28D22-91BC-438D-99C9-46DF6DA90A5E@citrix.com>

--uww06YkSnHksOTqt7Z6y4Bj0CFxirMY2u
Content-Type: multipart/mixed;
 boundary="------------CE816C7DA3D8074A6E0AB358"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CE816C7DA3D8074A6E0AB358
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.07.21 17:26, George Dunlap wrote:
>=20
>=20
>> On Jul 14, 2021, at 5:17 PM, Anthony PERARD <anthony.perard@citrix.com=
> wrote:
>>
>> This will help prevent the CI loop from having build failures when
>> `checkpolicy` isn't available, when doing "randconfig" jobs.
>=20
> Hang on, just to clarify what=E2=80=99s going on here.
>=20
> =E2=80=98randconfig=E2=80=99 is setting CONFIG_XSM_FLASK_POLICY in the =
=2Econfig file; and then when the build happens, we error out because one=
 of the required components isn=E2=80=99t there.
>=20
> What this patch does is to make it so that if someone explicitly sets C=
ONFIG_XSM_FLASK_POLICY=3Dy, but doesn=E2=80=99t have checkpolicy, the bui=
ld system will silently disable the policy behind their backs without tel=
ling them?
>=20
> Or does the randconfig test run kConfig one more time, at which point *=
then* the .config will be disabled?
>=20
> The former I think is broken; the latter I think is fine.

I still think that Kconfig should not disable explicit settings due to
tools not being available.

I'd be fine with trimodal settings for such parameters:

- Off
- On
- On if tools available

And the last one could even be the default.

But anyone wanting to test a specific option or to enable an option
should not be catched by surprise because some internal modification is
requesting another tool which happens not to be available.

BTW, the same applies to ./configure options for tools. I really don't
like that some components are silently not built because e.g. a header
file is not available. I'd rather have the possibility to tell
=2E/configure that I want everything built and let the build fail if that=

is not possible.


Juergen

--------------CE816C7DA3D8074A6E0AB358
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

--------------CE816C7DA3D8074A6E0AB358--

--uww06YkSnHksOTqt7Z6y4Bj0CFxirMY2u--

--HYYijo62PUGMbkKdaB8ngw2gocOggvaMW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDxqq4FAwAAAAAACgkQsN6d1ii/Ey+N
7wgAj9CUoYE4s4PgwFbRDhwj5XWydiQKJgKJhd6nxD5UvTASmhv3VBFTS7hpfzEq9xZdpYdy2KO6
wfK+9Z8zm4okwyPtBPd9YJ2ATh9uMrfxh70EWfg/3qhTJ4QrxfgGxLZ6AC/U4E6kEQ7Va60Dydj3
kmjNMCphg0ob1WoYHgB4vsOHDfq0T0cuXzlEhrgWkj0rnKqqqAfj2zgQ7ECUJi3ZfIudpYYASf6q
OYii1OzTofZEVLxOevVp7U2TP2zLXNgm3EwA3EhF2Vv2BOM6ed7vNl74tDhR+E/uherlzyCuv3PJ
GegUiaewUOy3DGA557J9DF+YUOt0pV71PsSXSsWqOA==
=aH3r
-----END PGP SIGNATURE-----

--HYYijo62PUGMbkKdaB8ngw2gocOggvaMW--

