Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEDD4017C5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179457.325726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9uw-0001f9-44; Mon, 06 Sep 2021 08:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179457.325726; Mon, 06 Sep 2021 08:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9uw-0001dG-0Q; Mon, 06 Sep 2021 08:23:50 +0000
Received: by outflank-mailman (input) for mailman id 179457;
 Mon, 06 Sep 2021 08:23:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mN9uu-0001dA-OW
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:23:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 360c8a42-d7be-4d2a-8c97-c6ef0df8db6d;
 Mon, 06 Sep 2021 08:23:47 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CEC6720097;
 Mon,  6 Sep 2021 08:23:46 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 99F4C1363C;
 Mon,  6 Sep 2021 08:23:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id bk/6IxLQNWEvbAAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 06 Sep 2021 08:23:46 +0000
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
X-Inumbo-ID: 360c8a42-d7be-4d2a-8c97-c6ef0df8db6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630916626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57S1nNH9F/vO+SKTjE94uCVaSzV8n1fOeTrRwN+v1Wc=;
	b=WgmWKT7pJqmwfIHmJW8QEWohpMCBKo/+GOgmLwAIScLW0Ch5fwHOlR4y19nTTHLslkfbiZ
	QZi1om9eBKiZ4kMWIAjumO40fHfIY7+bmqJKscIaIXeB1Lhl+RE7Idt0A6NtAKm8Y8kSS5
	HikzdsPX62R4jKI5vO2SB4i4kbMMx44=
Subject: Re: Crash when using cpupools
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>
References: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
Date: Mon, 6 Sep 2021 10:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wY65b36q0bSXFLeiVc8vg5hcmacMuivLC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wY65b36q0bSXFLeiVc8vg5hcmacMuivLC
Content-Type: multipart/mixed; boundary="enopubJSFoztANg8vadMnHvwG2acC1EI6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
Subject: Re: Crash when using cpupools
References: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
In-Reply-To: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>

--enopubJSFoztANg8vadMnHvwG2acC1EI6
Content-Type: multipart/mixed;
 boundary="------------415838FAAE7F29D92DDEEB04"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------415838FAAE7F29D92DDEEB04
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.09.21 17:41, Bertrand Marquis wrote:
> Hi,
>=20
> While doing some investigation with cpupools I encountered a crash when=
 trying to isolate a guest to its own physical cpu.
>=20
> I am using current staging status.
>=20
> I did the following (on FVP with 8 cores):
> - start dom0 with dom0_max_vcpus=3D1
> - remove core 1 from dom0 cpupool: xl cpupool-cpu-remove Pool-0 1
> - create a new pool: xl cpupool-create name=3D\"NetPool\=E2=80=9D
> - add core 1 to the pool: xl cpupool-cpu-add NetPool 1
> - create a guest in NetPool using the following in the guest config: po=
ol=3D=E2=80=9CNetPool"
>=20
> I end with a crash with the following call trace during guest creation:=

> (XEN) Xen call trace:
> (XEN)    [<0000000000234cb0>] credit2.c#csched2_alloc_udata+0x58/0xfc (=
PC)
> (XEN)    [<0000000000234c80>] credit2.c#csched2_alloc_udata+0x28/0xfc (=
LR)
> (XEN)    [<0000000000242d38>] sched_move_domain+0x144/0x6c0
> (XEN)    [<000000000022dd18>] cpupool.c#cpupool_move_domain_locked+0x38=
/0x70
> (XEN)    [<000000000022fadc>] cpupool_do_sysctl+0x73c/0x780
> (XEN)    [<000000000022d8e0>] do_sysctl+0x788/0xa58
> (XEN)    [<0000000000273b68>] traps.c#do_trap_hypercall+0x78/0x170
> (XEN)    [<0000000000274f70>] do_trap_guest_sync+0x138/0x618
> (XEN)    [<0000000000260458>] entry.o#guest_sync_slowpath+0xa4/0xd4
>=20
> After some debugging I found out that unit->vcpu_list is NULL after uni=
t->vcpu_list =3D d->vcpu[unit->unit_id]; with unit_id 0 in common/sched/c=
ore.c:688
> This makes the call to is_idle_unit(unit) in csched2_alloc_udata trigge=
r the crash.

So there is no vcpu 0 in that domain? How is this possible?


Juergen

--------------415838FAAE7F29D92DDEEB04
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

--------------415838FAAE7F29D92DDEEB04--

--enopubJSFoztANg8vadMnHvwG2acC1EI6--

--wY65b36q0bSXFLeiVc8vg5hcmacMuivLC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE10BIFAwAAAAAACgkQsN6d1ii/Ey9w
dgf/SCez1XZCmBzFoS8n1p7BJfT4ftHXsGBrvPYx12GK2n9lXm2wd8tV3piFR1LLhotDQV7eP0Aj
6g/9oZoi/WiqgVYWivxLTGwAmFJNmUGkErZYywVRUg/AfS/vvSPEyMVwFd0ZWDoXXQZLqN6KBWzF
wjULi95YK/P1EhTGFGpLcrDk7Gra2cyOYoHrYfrQ5TK779Sbqr4v2M0B4alTRx8cxNkKIDbL/Lhv
K5OfhCvNB3QE+S9Pku6wXklbAevL/iHq8jCS6K9UUN+jpMwITyNhBHXdHgzJRBHmtVRCG7YeuS/X
t7BiATwoYkKNj/q3tr0eE8cIP7tl1+mx6iP28vfN7g==
=ftUM
-----END PGP SIGNATURE-----

--wY65b36q0bSXFLeiVc8vg5hcmacMuivLC--

