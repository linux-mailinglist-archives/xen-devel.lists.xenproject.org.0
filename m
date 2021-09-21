Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7901412FA1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191474.341517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaQ0-0003nX-Bn; Tue, 21 Sep 2021 07:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191474.341517; Tue, 21 Sep 2021 07:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSaQ0-0003kj-8P; Tue, 21 Sep 2021 07:42:20 +0000
Received: by outflank-mailman (input) for mailman id 191474;
 Tue, 21 Sep 2021 07:42:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x95K=OL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSaPz-0003kc-8X
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:42:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71f36848-1aaf-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:42:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40CDB220B0;
 Tue, 21 Sep 2021 07:42:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A0F613B0A;
 Tue, 21 Sep 2021 07:42:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RvsZBdmMSWHtDQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Sep 2021 07:42:17 +0000
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
X-Inumbo-ID: 71f36848-1aaf-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632210137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QjwOK1fJKv8Kz5PIzKMEKPqIj+avUXaKWiL5dqbqgKU=;
	b=SpNV5yTad221k3xYW9W0ic7bJ9/7LeGvNHIV656W1XhvK5+F7i+OqHksnSP0EYlfb/J6LA
	Vdeh7dXylSfiP2voQJ1hycdNSi7d6ltoak+o7VPGAEqlSkUlAO12j/FiKeFjjN0v2Exquw
	MslBwGvKy+PuvizaMhC4sQ9nQrAAXbo=
Subject: Re: [PATCH v2] xen/x86: fix PV trap handling on secondary processors
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6083d6d0-63b7-e102-5596-3c4f35c2e5f5@suse.com>
Date: Tue, 21 Sep 2021 09:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YW2RRkX5pjUzzdWaa9A04Jt7G0232U525"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YW2RRkX5pjUzzdWaa9A04Jt7G0232U525
Content-Type: multipart/mixed; boundary="oWEil0H4OKCQInggIaw6NNL7Krho8WNW5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <6083d6d0-63b7-e102-5596-3c4f35c2e5f5@suse.com>
Subject: Re: [PATCH v2] xen/x86: fix PV trap handling on secondary processors
References: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>
In-Reply-To: <7a266932-092e-b68f-f2bb-1473b61adc6e@suse.com>

--oWEil0H4OKCQInggIaw6NNL7Krho8WNW5
Content-Type: multipart/mixed;
 boundary="------------A21806AE892E7707F12A4F6E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A21806AE892E7707F12A4F6E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.09.21 18:15, Jan Beulich wrote:
> The initial observation was that in PV mode under Xen 32-bit user space=

> didn't work anymore. Attempts of system calls ended in #GP(0x402). All
> of the sudden the vector 0x80 handler was not in place anymore. As it
> turns out up to 5.13 redundant initialization did occur: Once from
> cpu_initialize_context() (through its VCPUOP_initialise hypercall) and =
a
> 2nd time while each CPU was brought fully up. This 2nd initialization i=
s
> now gone, uncovering that the 1st one was flawed: Unlike for the
> set_trap_table hypercall, a full virtual IDT needs to be specified here=
;
> the "vector" fields of the individual entries are of no interest. With
> many (kernel) IDT entries still(?) (i.e. at that point at least) empty,=

> the syscall vector 0x80 ended up in slot 0x20 of the virtual IDT, thus
> becoming the domain's handler for vector 0x20.
>=20
> Make xen_convert_trap_info() fit for either purpose, leveraging the fac=
t
> that on the xen_copy_trap_info() path the table starts out zero-filled.=

> This includes moving out the writing of the sentinel, which would also
> have lead to a buffer overrun in the xen_copy_trap_info() case if all
> (kernel) IDT entries were populated. Convert the writing of the sentine=
l
> to clearing of the entire table entry rather than just the address
> field.
>=20
> (I didn't bother trying to identify the commit which uncovered the issu=
e
> in 5.14; the commit named below is the one which actually introduced th=
e
> bad code.)
>=20
> Fixes: f87e4cac4f4e ("xen: SMP guest support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Pushed to xen/tip.git for-linus-5.15b


Juergen

--------------A21806AE892E7707F12A4F6E
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

--------------A21806AE892E7707F12A4F6E--

--oWEil0H4OKCQInggIaw6NNL7Krho8WNW5--

--YW2RRkX5pjUzzdWaa9A04Jt7G0232U525
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFJjNgFAwAAAAAACgkQsN6d1ii/Ey9V
0Af/Z9EVcW4cZIkNhFP/98yqYfGvs3b/+JzdoHtbKybAeD98FLFha5gxbagwk5B6xr99JJXQIfM2
lQ2WvksHdxmj9/OEsePdh22rqEFmnYuNAOmZqxzyjR+AQH9u5PLnCgP2jPwjJUTDxJ2ji8XBPJu4
oUwyAqoQUW2Y0ftAdPVjpTZR+NhkJGBN77JnpOWCXu8aRlAqOB8ViOpKvehpJiPwXabtPuaIC4T1
hlo0Xk4fiUTGMaZK3xO1SEHB47aXDSEceIidI9myHPeFd84s2bscI/Ievwt3iGp0zyDtmHGupvzc
Y3xN41Xe9X4QAVAunk82c8AX8DjSMFiEK3SwnbabSg==
=c41r
-----END PGP SIGNATURE-----

--YW2RRkX5pjUzzdWaa9A04Jt7G0232U525--

