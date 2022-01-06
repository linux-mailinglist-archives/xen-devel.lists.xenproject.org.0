Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CB486620
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254073.435575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Tpx-0002Jm-96; Thu, 06 Jan 2022 14:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254073.435575; Thu, 06 Jan 2022 14:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Tpx-0002Gz-5a; Thu, 06 Jan 2022 14:33:53 +0000
Received: by outflank-mailman (input) for mailman id 254073;
 Thu, 06 Jan 2022 14:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5Tpw-0002Gt-Cl
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:33:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa975d83-6efd-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 15:33:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B73891F37F;
 Thu,  6 Jan 2022 14:33:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81A4A13C56;
 Thu,  6 Jan 2022 14:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ALJfHs791mGZYQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 14:33:50 +0000
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
X-Inumbo-ID: aa975d83-6efd-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641479630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Xxys0UCoLrRXFPG+3jG/KrKNHVgAypxjyTeEgSC5H2M=;
	b=E29tJZwXxvXo/ab3cjrEKTrM5T/uRVeTYnnSxNJqcjTUxoAKD8JHSBHVUoMwFpqxRb34iA
	F6/dpL29PEBh6ClJTPbeoaBo2v02oIVYP9+nSng3zLT38QVnilxM1jCW0OCri2DW4hTUOy
	c0C6PVqVLSVW9jquXCHH0WcNnyQK244=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Live update of Xenstore-stubdom
Message-ID: <a6ba7e89-f70b-3c51-5a65-06c62f5cd512@suse.com>
Date: Thu, 6 Jan 2022 15:33:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hEsOIy1zpuGkzMOIl20R2tBBHyTYAipVy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hEsOIy1zpuGkzMOIl20R2tBBHyTYAipVy
Content-Type: multipart/mixed; boundary="tkKrEgi2FH26q2pkQ1FbuQS4vGYBGRBLv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <a6ba7e89-f70b-3c51-5a65-06c62f5cd512@suse.com>
Subject: Live update of Xenstore-stubdom

--tkKrEgi2FH26q2pkQ1FbuQS4vGYBGRBLv
Content-Type: multipart/mixed;
 boundary="------------222FB934320FFE052AC5442F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------222FB934320FFE052AC5442F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I'm currently thinking how to implement live update of Xenstore-stubdom.

I should note that my plan is to support live update for a Xenstore PVH
stubdom only, as kexec functionality is much easier to implement for
that case.

The main problem is to transfer the Xenstore state to the new instance.

Originally my idea was to keep the state in memory and hand it over to
the new kernel as a module. This would probably work, but there is one
basic problem with that approach: the Xenstore domain might need quite
some additional memory to hold the module (roughly up to twice the
memory it has in use when starting the live update).

As a result the live update sequence would need to:

1. increase the maximum allowed memory of the Xenstore domain
2. allocate additional memory for the module
3. create the module
4. kexec to the new kernel
5. build the Xenstore from the module
6. free the module memory
7. decrease the max memory of the domain again

The first and last step would need to be done by xenstore-control in
dom0, while all the other steps would be done in the Xenstore-stubdom.

As an alternative I was thinking to add some basic file operations to
Xenstore-stubdom. This would have the additional benefit of having an
easy way to add Xenstore logging support to the stubdom without the risk
to lose logging data when using the console for that purpose.

A nice way to do that would be to use a 9pfs PV device, but this is
problematic across the kexec in the domain, as there is no Xenstore
available for any additional frontend-backend communication at that
time.

The 9pfs PV protocol as defined today needs at least 3 pages granted by
the frontend to the backend (the main parameter page, and at least 1
ring page for each direction of communication). For better performance
even more pages might be desirable (the 9pfs PV protocol allows for up
to 256 pages for each direction of communication, all file data is going
through those ring pages).

For using 9pfs I'd need to either extend the current PV protocol in
order to support reconfiguration of the PV device without needing
Xenstore (so no change of the frontend state required), or the 9pfs
configuration would need to be kept across kexec, including the PFNs of
the granted pages (this could be achieved e.g. via a fixed PFN range
like it is done for the PV console ring page today).

Another possibility would be to extend the current pvcalls interface
to support file operations. This would require "only" some additional
commands (read, write, stat, ...) and could work easily with a single
ring page (reads and writes would use grants, of course). OTOH this
would add basically a similar functionality as the 9pfs PV device.

This whole file access scheme could even be extended to other use
cases, like driver domains and other stubdoms, in order to have the
possibility to produce logs of all infrastructure domains at a central
place.

Per default I'd extend the console daemon to act as a backend (either
9pfs or pvcalls), but that should be configurable in order to allow e.g.
for a logging stubdom, too.

So what are the thoughts for the way to go with Xenstore-stubdom live
update? Should I use stubdom memory for the state, or should I go with a
file based approach (and if yes, 9pfs or pvcalls based)?


Juergen

--------------222FB934320FFE052AC5442F
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

--------------222FB934320FFE052AC5442F--

--tkKrEgi2FH26q2pkQ1FbuQS4vGYBGRBLv--

--hEsOIy1zpuGkzMOIl20R2tBBHyTYAipVy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHW/c0FAwAAAAAACgkQsN6d1ii/Ey8K
4wgAgydgcAdRRCllV3HDXZTPk5bDysXX3i6hPhB8IRrBpIBkW97SLTGdZvFHU6cPIMoYzSZu3UBR
ri6S35jr6RlOggoN6wqI/8hWQ2oIEDwDh+VIPL8Tdzr2rSigPulSqPzjzWV7IguzDzJhp3WHpS5X
N7Fg+kMAlZ+iRrWEvMcQdg/8TDdlGIC3OG6WFhyKg2gDfFaDyipSYolrK9wXtS20Ffa5FlajgLeC
phdYMx7VCWKd1/TPzunraQmm8dMgtAFeu/uQ9Ptb+TQuBk7s6j+1QEHaVVKlI0wyHOwb2PE42QaZ
WXnu9JQUAD1UD/HJx7AgCRhRe7nd4NHPrR3409qs0w==
=55z+
-----END PGP SIGNATURE-----

--hEsOIy1zpuGkzMOIl20R2tBBHyTYAipVy--

