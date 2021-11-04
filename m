Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AD445778
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221775.383654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifsA-0001Ed-C9; Thu, 04 Nov 2021 16:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221775.383654; Thu, 04 Nov 2021 16:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifsA-0001CY-8g; Thu, 04 Nov 2021 16:45:54 +0000
Received: by outflank-mailman (input) for mailman id 221775;
 Thu, 04 Nov 2021 16:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mifs8-0001CM-J1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:45:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab8a7ec3-3d8e-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 17:45:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CBC81FD3F;
 Thu,  4 Nov 2021 16:45:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23C1113E70;
 Thu,  4 Nov 2021 16:45:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Au5iBz8OhGHZFwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 Nov 2021 16:45:51 +0000
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
X-Inumbo-ID: ab8a7ec3-3d8e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636044351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N4RA94Pu9lXJHCoAnW2hrDsvs6zvPxl9XCI4Xkvzqz8=;
	b=KM3+gA0VtzXKmxPcuOkV9WIa+vX4IcGxZ5tt36xPvyHxseTMDB+mCSakflu3GAv+VtZGGm
	gokSvkgKxn73GZSBXITt0dvAN4CEWPlnv0nFqRvnO6fyyi/+q+ltyv63ncrq3uQvS4vG88
	QB8uqNgpeB9Z4qk5CgJJWV8p/1sc/eg=
Subject: Re: [PATCH-for-4.16] tools/helpers: fix broken xenstore stubdom init
To: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211104144242.14351-1-jgross@suse.com>
 <54900dfb-c6fa-a2ad-471c-227a4888c687@citrix.com>
 <CAKf6xptNXd=eB0KNb=40CjqvzOT9xR8vMM-tV6e7DWez6AWKMg@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b20ebd19-0886-c92d-6819-394124c20c95@suse.com>
Date: Thu, 4 Nov 2021 17:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xptNXd=eB0KNb=40CjqvzOT9xR8vMM-tV6e7DWez6AWKMg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZrBxIdh40nYEDKlT1qnDW2W0A0NuptDxG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZrBxIdh40nYEDKlT1qnDW2W0A0NuptDxG
Content-Type: multipart/mixed; boundary="KauNgDpX7q0H4sQ8uSdkvtO1enPf02OSR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <b20ebd19-0886-c92d-6819-394124c20c95@suse.com>
Subject: Re: [PATCH-for-4.16] tools/helpers: fix broken xenstore stubdom init
References: <20211104144242.14351-1-jgross@suse.com>
 <54900dfb-c6fa-a2ad-471c-227a4888c687@citrix.com>
 <CAKf6xptNXd=eB0KNb=40CjqvzOT9xR8vMM-tV6e7DWez6AWKMg@mail.gmail.com>
In-Reply-To: <CAKf6xptNXd=eB0KNb=40CjqvzOT9xR8vMM-tV6e7DWez6AWKMg@mail.gmail.com>

--KauNgDpX7q0H4sQ8uSdkvtO1enPf02OSR
Content-Type: multipart/mixed;
 boundary="------------41A4CEA736293263C46A0AB0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------41A4CEA736293263C46A0AB0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.11.21 17:33, Jason Andryuk wrote:
> On Thu, Nov 4, 2021 at 11:00 AM Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
>>
>> On 04/11/2021 14:42, Juergen Gross wrote:
>>> Commit 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier=

>>> into xc_dom_parse_image()") broke starting the xenstore stubdom. This=

>>> is due to a rather special way the xenstore stubdom domain config is
>>> being initialized: in order to support both, PV and PVH stubdom,
>>> init-xenstore-domain is using xc_dom_parse_image() to find the correc=
t
>>> domain type. Unfortunately above commit requires xc_dom_boot_xen_init=
()
>>> to have been called before using xc_dom_parse_image(). This requires
>>> the domid, which is known only after xc_domain_create(), which requir=
es
>>> the domain type.
>>>
>>> In order to break this circular dependency, call xc_dom_boot_xen_init=
()
>>> with an arbitrary domid first, and then set dom->guest_domid later.
>>>
>>> Fixes: 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier=
 into xc_dom_parse_image()")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Release-acked-by: Ian Jackson <iwj@xenproject.org>
>>
>> This is all rather nasty, and really highlights problems with the
>> libxenguest abi, because you really ought to be able to ask "what ELF
>> properties do I have on my hand" without an implicit "and try to start=

>> building a VM using it" on the side.
>>
>> I agree this is probably the best thing to do right now.
>=20
> Yes, this is probably the best change before release.
>=20
> If xc_dom_allocate() filled in dom->xen_version & dom->xen_caps - i.e.
> move that from xc_dom_boot_xen_init() - then I think this patch
> wouldn't be necessary.  But there could be side effects of such a
> change.

This is a nice idea for a cleanup patch after 4.16 has been branched.


Juergen

--------------41A4CEA736293263C46A0AB0
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

--------------41A4CEA736293263C46A0AB0--

--KauNgDpX7q0H4sQ8uSdkvtO1enPf02OSR--

--ZrBxIdh40nYEDKlT1qnDW2W0A0NuptDxG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGEDj4FAwAAAAAACgkQsN6d1ii/Ey/T
2wf9FdNJyXfEQ6IN2KDIsoVD+cpMIbNVG7I2VlevTsIsREyvvjIMQvQU5jfHzNufZT4+7O1WygUo
PYCCsp6zR5sP4sPQLbgcllNTLLsW54Vp5ns2QX73+wH0jwK3EDwHwKPrIUXOeqm+XvpmtJCp5JQR
QPFi9AwYXJVIGdG/40UPyIUffYAITWHtiCNBk3sLdYAALv9p6vFgRFCYnTtYVTeyOy4BLpJHR/qd
uZkoBApU1bIQ6FdlZ4o+pO38cEI3v78oElxIYCAMzfiH7zTvavASJIoG4D1pH1EbeQ5oJWYd6Kdh
+fzJziIhIFtjifmxxLYPVYyvHC87zfFQLOHEmQkRhg==
=7/X+
-----END PGP SIGNATURE-----

--ZrBxIdh40nYEDKlT1qnDW2W0A0NuptDxG--

