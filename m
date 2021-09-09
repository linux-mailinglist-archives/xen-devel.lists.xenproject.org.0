Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C6405865
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 15:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183279.331370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKac-00019D-IA; Thu, 09 Sep 2021 13:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183279.331370; Thu, 09 Sep 2021 13:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKac-00017G-Ds; Thu, 09 Sep 2021 13:59:42 +0000
Received: by outflank-mailman (input) for mailman id 183279;
 Thu, 09 Sep 2021 13:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOKaa-00016Y-Oy
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:59:40 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c7854c8-1176-11ec-b1ba-12813bfff9fa;
 Thu, 09 Sep 2021 13:59:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC6A4222E3;
 Thu,  9 Sep 2021 13:59:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 873E313CB1;
 Thu,  9 Sep 2021 13:59:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKmDH0oTOmG4KAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 13:59:38 +0000
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
X-Inumbo-ID: 2c7854c8-1176-11ec-b1ba-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631195978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hCRggMsORaaG1sgrfpMDP9w+tbtLEOQD8pweB7qQrt8=;
	b=CBFbFlNw0Pn5SrBSSKqniu4tBQFFkPxhMwAkxto4eX9vt/ypofPDkWvm4yz0kzvVPMgkqu
	4iV1lRAGCIgaVQn7R4iHptcvSi30jOdPO5GjtIhZpFveqG996P3/ha/QC1XyVrwYk9q2pz
	xIjyo+G2Zx72cPq8TO/vFijPa2WjFag=
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210909124924.1698-1-jgross@suse.com>
 <20210909124924.1698-2-jgross@suse.com>
 <24890.2778.780247.724651@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
Date: Thu, 9 Sep 2021 15:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24890.2778.780247.724651@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J2fl8HZjBfp1CsJyPXdH9VfMC0EvM5HUA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J2fl8HZjBfp1CsJyPXdH9VfMC0EvM5HUA
Content-Type: multipart/mixed; boundary="L2kFOaVTdsvVHEo9Y8ITk2SDNzTDVbEl2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
References: <20210909124924.1698-1-jgross@suse.com>
 <20210909124924.1698-2-jgross@suse.com>
 <24890.2778.780247.724651@mariner.uk.xensource.com>
In-Reply-To: <24890.2778.780247.724651@mariner.uk.xensource.com>

--L2kFOaVTdsvVHEo9Y8ITk2SDNzTDVbEl2
Content-Type: multipart/mixed;
 boundary="------------076DFAAB71190CDFBB4DE472"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------076DFAAB71190CDFBB4DE472
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.09.21 15:23, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH v2 1/3] stubdom: fix build with disabled =
pv-grub"):
>> Today the build will fail if --disable-pv-grub as a parameter of
>> configure, as the main Makefile will unconditionally try to build a
>> 32-bit pv-grub stubdom.
>>
>> Fix that by introducing a pv-grub32 target in stubdom/Makefile taking
>> care of this situation.
>=20
> I approve of this whole series, with one resrvation:
>=20
> I think the name "pv-grub32" for this target is confusing.  It's not
> really specifically 32-bit.  The difference between the targets
> "pv-grub32" and "pv-grub" is that "pv-grub32" is unconditionally
> built but might mean nothing; it has a conditional dependency on
> "pv-grub" which is conditionally built but always implies the actual
> build.
>=20
> I don't think the suffix "32" really conveys this :-).
>=20
> How about "pv-grub-maybe" ?  Or something.

What about "pv-grub-if-enabled"?

And could that be done when committing, or should I send another round?

>=20
> You can put my ack on patches 2 and 3 right away.

Thanks,


Juergen

--------------076DFAAB71190CDFBB4DE472
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

--------------076DFAAB71190CDFBB4DE472--

--L2kFOaVTdsvVHEo9Y8ITk2SDNzTDVbEl2--

--J2fl8HZjBfp1CsJyPXdH9VfMC0EvM5HUA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE6E0kFAwAAAAAACgkQsN6d1ii/Ey+q
oQf/ZsqsngOPh3iSNQT0GhGU+fjWX6FdRh+zZLVMCg6Sb659TwjU2G3zwljYe9Lyra0As69CROyl
ttbVwxKs+S21n6rE3aDduFo8ili9dTSkdit+bgNtHaFhratl5D5NCgxNYEBgjoCjJXD67nHd+Xp2
Ikyp9RV8nvEVcBMIcdx71SgWyvxn/SCHuZ0JMSIJFa1o7a944PQPgUh5HC5SSIvwgbnuLZkuvrYH
sSkh38rX69EjsIbOd1KAQUZZRVQlCMJ6QBbRyv5PtU7vqGZUfj56GCgeDJwsOjELnStf0OAAe6x4
JwrGM8TXbNF6OHrWYvLNk4P4cRXEdSEPjCCv+ae+gw==
=4yYx
-----END PGP SIGNATURE-----

--J2fl8HZjBfp1CsJyPXdH9VfMC0EvM5HUA--

