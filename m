Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E542A041
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206940.362634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDRK-0000Ve-Om; Tue, 12 Oct 2021 08:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206940.362634; Tue, 12 Oct 2021 08:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDRK-0000SO-LU; Tue, 12 Oct 2021 08:47:14 +0000
Received: by outflank-mailman (input) for mailman id 206940;
 Tue, 12 Oct 2021 08:47:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maDRI-0000SG-J7
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:47:12 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd59dd4c-2b38-11ec-811c-12813bfff9fa;
 Tue, 12 Oct 2021 08:47:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD49F2018C;
 Tue, 12 Oct 2021 08:47:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E1F4132D4;
 Tue, 12 Oct 2021 08:47:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6RzSEY5LZWFnUgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Oct 2021 08:47:10 +0000
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
X-Inumbo-ID: fd59dd4c-2b38-11ec-811c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634028430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JB2Z/ap3p/ozir+kNXemf/7ULjDPoEQIOSGuS/Q+J1g=;
	b=RueUjpu8xXwCeuaJV1kiIzfMB7u3j6pafWXmkTr4oVLLC5rOVmLAmdEE29LHiEDkr2EnUK
	ormQtxbLWA2aUgGJbh3V1F3XFeyoubbCFc/smjpCB/sVPLJdyOgmqMDWwI9yz1e7aPe0si
	JfUB8uLVtxiS3tWoglsSBY1dmCMv+h4=
Subject: Re: [PATCH 0/2] Fix the Xen HVM kdump/kexec boot panic issue
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <cb2e1a63-de79-5050-bf2b-bfb302997381@suse.com>
Date: Tue, 12 Oct 2021 10:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211012072428.2569-1-dongli.zhang@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uPRoEoKWHKHoHy3MLDlGvNADfKQ7szQES"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uPRoEoKWHKHoHy3MLDlGvNADfKQ7szQES
Content-Type: multipart/mixed; boundary="uicLRxaF8iOZHvIT8WoJMuxTg06qUTpt6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 iwj@xenproject.org, jbeulich@suse.com, julien@xen.org, wl@xen.org,
 joe.jin@oracle.com
Message-ID: <cb2e1a63-de79-5050-bf2b-bfb302997381@suse.com>
Subject: Re: [PATCH 0/2] Fix the Xen HVM kdump/kexec boot panic issue
References: <20211012072428.2569-1-dongli.zhang@oracle.com>
In-Reply-To: <20211012072428.2569-1-dongli.zhang@oracle.com>

--uicLRxaF8iOZHvIT8WoJMuxTg06qUTpt6
Content-Type: multipart/mixed;
 boundary="------------68E2B457EE3B2A0920C5CFF1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------68E2B457EE3B2A0920C5CFF1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.10.21 09:24, Dongli Zhang wrote:
> When the kdump/kexec is enabled at HVM VM side, to panic kernel will tr=
ap
> to xen side with reason=3Dsoft_reset. As a result, the xen will reboot =
the VM
> with the kdump kernel.
>=20
> Unfortunately, when the VM is panic with below command line ...
>=20
> "taskset -c 33 echo c > /proc/sysrq-trigger"
>=20
> ... the kdump kernel is panic at early stage ...
>=20
> PANIC: early exception 0x0e IP 10:ffffffffa8c66876 error 0 cr2 0x20
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc5xen #1=

> [    0.000000] Hardware name: Xen HVM domU
> [    0.000000] RIP: 0010:pvclock_clocksource_read+0x6/0xb0
> ... ...
> [    0.000000] RSP: 0000:ffffffffaa203e20 EFLAGS: 00010082 ORIG_RAX: 00=
00000000000000
> [    0.000000] RAX: 0000000000000003 RBX: 0000000000010000 RCX: 0000000=
0ffffdfff
> [    0.000000] RDX: 0000000000000003 RSI: 00000000ffffdfff RDI: 0000000=
000000020
> [    0.000000] RBP: 0000000000011000 R08: 0000000000000000 R09: 0000000=
000000001
> [    0.000000] R10: ffffffffaa203e00 R11: ffffffffaa203c70 R12: 0000000=
040000004
> [    0.000000] R13: ffffffffaa203e5c R14: ffffffffaa203e58 R15: 0000000=
000000000
> [    0.000000] FS:  0000000000000000(0000) GS:ffffffffaa95e000(0000) kn=
lGS:0000000000000000
> [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.000000] CR2: 0000000000000020 CR3: 00000000ec9e0000 CR4: 0000000=
0000406a0
> [    0.000000] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> [    0.000000] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> [    0.000000] Call Trace:
> [    0.000000]  ? xen_init_time_common+0x11/0x55
> [    0.000000]  ? xen_hvm_init_time_ops+0x23/0x45
> [    0.000000]  ? xen_hvm_guest_init+0x214/0x251
> [    0.000000]  ? 0xffffffffa8c00000
> [    0.000000]  ? setup_arch+0x440/0xbd6
> [    0.000000]  ? start_kernel+0x6a/0x689
> [    0.000000]  ? secondary_startup_64_no_verify+0xc2/0xcb
>=20
> This is because Xen HVM supports at most MAX_VIRT_CPUS=3D32 'vcpu_info'=

> embedded inside 'shared_info' during early stage until xen_vcpu_setup()=
 is
> used to allocate/relocate 'vcpu_info' for boot cpu at arbitrary address=
=2E
>=20
>=20
> The 1st patch is to fix the issue at VM kernel side. However, we may
> observe clock drift at VM side due to the issue at xen hypervisor side.=

> This is because the pv vcpu_time_info is not updated when
> VCPUOP_register_vcpu_info.
>=20
> The 2nd patch is to force_update_vcpu_system_time() at xen side when
> VCPUOP_register_vcpu_info, to avoid the VM clock drift during kdump ker=
nel
> boot.

Please don't mix patches for multiple projects in one series.

In cases like this it is fine to mention the other project's patch
verbally instead.


Juergen

--------------68E2B457EE3B2A0920C5CFF1
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

--------------68E2B457EE3B2A0920C5CFF1--

--uicLRxaF8iOZHvIT8WoJMuxTg06qUTpt6--

--uPRoEoKWHKHoHy3MLDlGvNADfKQ7szQES
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFlS40FAwAAAAAACgkQsN6d1ii/Ey86
aQf/Uv2hdFYAoRQS28mAvxu0GFBM7BcCLV7n9bNrkyI6o0QH8K1T6k2jnotRX89UcLs+m4kg7l+j
6lBCVV8Xc3pOehh9E7rwsdjBQ/haQJ54o98pdZFFdrhTYpmr9/UhvuJhO92TyAjqKnGhzRnGIjY3
rgN5odaJWWLy1Q6/uB4cHYGSfOfrjakTE4BRbmx+LvhXtm/db2puG5vNVK7BUEjOIypT6mQUPrYO
41RnpJv4wJpoX8XdX5F2rqOHQ6BN+gYEindMOlXvaNocgZEpCl4L2waRYN/VPoo8sDzLE1hUZ7X+
JTJ1YNiEwGm67N0JrmvmVaRYoSEWOaM3YcfIIghLjQ==
=Nmh3
-----END PGP SIGNATURE-----

--uPRoEoKWHKHoHy3MLDlGvNADfKQ7szQES--

