Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F67340A733
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 09:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186169.334890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2eR-00043A-RG; Tue, 14 Sep 2021 07:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186169.334890; Tue, 14 Sep 2021 07:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ2eR-0003zx-O4; Tue, 14 Sep 2021 07:14:43 +0000
Received: by outflank-mailman (input) for mailman id 186169;
 Tue, 14 Sep 2021 07:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ2eP-0003zr-UL
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 07:14:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19734cd8-8010-43e7-882a-049f542c931f;
 Tue, 14 Sep 2021 07:14:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81228200CD;
 Tue, 14 Sep 2021 07:14:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4514413E4A;
 Tue, 14 Sep 2021 07:14:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FaZqD99LQGHjeQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 07:14:39 +0000
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
X-Inumbo-ID: 19734cd8-8010-43e7-882a-049f542c931f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631603679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJa19hTde/qOBR3+nSTkyFQnZuNkLZ/gxm3JnyWLTd4=;
	b=gtvxpid3ZJ95Elfw4sDXBjJL9nuVLbcX2SEv2PyQlsp/qCTiUQQK70VBUsCilwMcYLol8o
	hWOTxyXRXH9bmA/3oNXZ81Mq7xzTFbYukzC5RpnJF25eqtLq8hdPZVCMI6qalYGbZAP3Jp
	Ffph88dzBGjGmkz/ba4E4mhTk3fYHjA=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Mike Rapoport <rppt@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
References: <YT9I+Xs9wOPVCIVd@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)
Message-ID: <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
Date: Tue, 14 Sep 2021 09:14:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YT9I+Xs9wOPVCIVd@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="l4jfD4hpX9iAQ8lDxD2znK3npbtEVhEGs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l4jfD4hpX9iAQ8lDxD2znK3npbtEVhEGs
Content-Type: multipart/mixed; boundary="JTBVfVXW6uAbagWOQ54K6n3VW5XYFcVGN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Mike Rapoport <rppt@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)
References: <YT9I+Xs9wOPVCIVd@mail-itl>
In-Reply-To: <YT9I+Xs9wOPVCIVd@mail-itl>

--JTBVfVXW6uAbagWOQ54K6n3VW5XYFcVGN
Content-Type: multipart/mixed;
 boundary="------------8E27746F541E8C0209A0A9BF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8E27746F541E8C0209A0A9BF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.09.21 14:50, Marek Marczykowski-G=C3=B3recki wrote:
> Hi,
>=20
> Since 5.13, the Xen (PV) dom0 crashes on boot, before even printing the=

> kernel version.
> Test environment:
>   - Xen 4.14.2
>   - AMD Ryzen 5 4500U (reported also on AMD Ryzen 7 4750U)
>   - Linux 5.13.13, confirmed also on 5.14
>=20
> The crash happens only if the initramfs has earlycpio with microcode.
> I don't have a serial console, but I've got a photo with crash message
> (from Xen, Linux doesn't managed to print anything):
> https://user-images.githubusercontent.com/726704/133084966-5038f37e-001=
b-4688-9f90-83d09be3dc2d.jpg
>=20
> Transcription of some of it:
>=20
>      mapping kernel into physical memory
>      about to get started
>      (XEN) Pagetable walk from ffffffff82810888:
>      (XEN)  L4[0x1ff] =3D 0000000332815067 0000000000002815
>      (XEN)  L3[0x1fe] =3D 0000000332816067 0000000000002816
>      (XEN)  L2[0x014] =3D 0000000334018067 0000000000004018
>      (XEN)  L1[0x010] =3D 0000000332810067 0000000000002810
>      (XEN) domain_crash_sync called from entry.S: fault at ffff82d04033=
e790 x86_64/entry.S#domain_crash_page_fault
>      (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
>      (XEN) ----[ Xen-4.14.2  x86_64  debug=3Dn  Not tainted ]----
>      (XEN) CPU:    0
>      (XEN) RIP:    e033:[<0000000000000000>]

The domain's run state seems to be completely clobbered.

Did you try to boot the kernel with "earlyprintk=3Dxen" to get some idea
how far it progressed?

I could imagine that doing the early reservations after the call of
e820__memory_setup() is problematic, as Xen PV guests have a hook in
this function performing some rather extended actions.

I'm not sure the call of early_reserve_memory() can be moved just before
the e820__memory_setup() call. If this is possibel it should be done
IMO, if not then the reservations which have been at the start of
setup_arch() might need to go there again.


Juergen

>=20
> I've bisected it down to the commit a799c2bd29d19c565f37fa038b31a0a1d44=
d0e4d
>=20
>      x86/setup: Consolidate early memory reservations
>=20
>      The early reservations of memory areas used by the firmware, bootl=
oader,
>      kernel text and data are spread over setup_arch(). Moreover, some =
of them
>      happen *after* memblock allocations, e.g trim_platform_memory_rang=
es() and
>      trim_low_memory_range() are called after reserve_real_mode() that =
allocates
>      memory.
>=20
>      There was no corruption of these memory regions because memblock a=
lways
>      allocates memory either from the end of memory (in top-down mode) =
or above
>      the kernel image (in bottom-up mode). However, the bottom up mode =
is going
>      to be updated to span the entire memory [1] to avoid limitations c=
aused by
>      KASLR.
>=20
>      Consolidate early memory reservations in a dedicated function to i=
mprove
>      robustness against future changes. Having the early reservations i=
n one
>      place also makes it clearer what memory must be reserved before me=
mblock
>      allocations are allowed.
>=20
>      Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>      Signed-off-by: Borislav Petkov <bp@suse.de>
>      Reviewed-by: Baoquan He <bhe@redhat.com>
>      Acked-by: Borislav Petkov <bp@suse.de>
>      Acked-by: David Hildenbrand <david@redhat.com>
>      Link: [1] https://lore.kernel.org/lkml/20201217201214.3414100-2-gu=
ro@fb.com
>      Link: https://lkml.kernel.org/r/20210302100406.22059-2-rppt@kernel=
=2Eorg
>=20
> Since this seems to affect Xen boot only, I'm copying xen-devel too.
>=20
> Any ideas?
>=20


--------------8E27746F541E8C0209A0A9BF
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

--------------8E27746F541E8C0209A0A9BF--

--JTBVfVXW6uAbagWOQ54K6n3VW5XYFcVGN--

--l4jfD4hpX9iAQ8lDxD2znK3npbtEVhEGs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFAS94FAwAAAAAACgkQsN6d1ii/Ey+T
Owf+MNxstSzsfIUq7cY1rZlbOnJ4MVHw8NBm78S+Yk8qV3nHUSQanDnRK++r7clui0jkFr498TyU
8hX5c1BU1161R4z5blwxRelx8Wc5QnYd8682n57UA+zgZhYq3lGxo5jYF19Vf9clmkHwP2ppab51
R41dZpf/xVXhNunPGMXWgviaWUeFRTwSKWm09OJcoL76zdTn64dO12qW9ppnqyBHAQPNGss5HSLP
93t+rQ4RxFkg7Zo6I1HZUUyEC+sr2RCZyfUue4W0Ea8MavhugdqVjZ1rKpbMFJj8eyMXR996Yxrg
OM/PqGn/Q1JqJWLPcsvCUn30eItOck7z0I5YfIM9AQ==
=UJPY
-----END PGP SIGNATURE-----

--l4jfD4hpX9iAQ8lDxD2znK3npbtEVhEGs--

