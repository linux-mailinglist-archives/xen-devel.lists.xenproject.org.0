Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63241617E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194366.346249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ7s-0004AI-05; Thu, 23 Sep 2021 14:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194366.346249; Thu, 23 Sep 2021 14:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ7r-000471-Sl; Thu, 23 Sep 2021 14:55:03 +0000
Received: by outflank-mailman (input) for mailman id 194366;
 Thu, 23 Sep 2021 14:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTQ7r-00046v-6J
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:55:03 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a5a4df4-1c7e-11ec-ba4d-12813bfff9fa;
 Thu, 23 Sep 2021 14:55:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC0512236C;
 Thu, 23 Sep 2021 14:55:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C73D913E76;
 Thu, 23 Sep 2021 14:55:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wSNSL0SVTGFnfQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 14:55:00 +0000
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
X-Inumbo-ID: 3a5a4df4-1c7e-11ec-ba4d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632408900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=my7VqY53A6e1Wd90ewQAn8Sl1sh3HuXoPlhSNUiEzmI=;
	b=EO78IeaGVeI9AbNU3/Oo2sIhF+U1+YlUVfZWAr10ZWTMqchVE+WF5xlgvH+WPmnxvW/29R
	5R0LpnckeK1fJMx5c621/D6rcNYqmo8VRF3RhEyfyJPaYtEUZaoYGmzGcPTjLxQlzNX86X
	ioKLPIS4JgZMHHq3J0YxGw+7hC85R28=
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <0b7afef6-1c46-ed74-ca83-f1e29f763f4a@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/9] xen/x86: generalize preferred console model from PV
 to PVH Dom0
Message-ID: <eac38453-a0d9-69ab-8fa2-35b3c55933de@suse.com>
Date: Thu, 23 Sep 2021 16:54:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0b7afef6-1c46-ed74-ca83-f1e29f763f4a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="91iDXi0U6EUiXy5e5GnMRq1VY3EqTjDTl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--91iDXi0U6EUiXy5e5GnMRq1VY3EqTjDTl
Content-Type: multipart/mixed; boundary="KJGvBtqHlnedeq33aAE3U0cqUhtZBlVt0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <eac38453-a0d9-69ab-8fa2-35b3c55933de@suse.com>
Subject: Re: [PATCH 6/9] xen/x86: generalize preferred console model from PV
 to PVH Dom0
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <0b7afef6-1c46-ed74-ca83-f1e29f763f4a@suse.com>
In-Reply-To: <0b7afef6-1c46-ed74-ca83-f1e29f763f4a@suse.com>

--KJGvBtqHlnedeq33aAE3U0cqUhtZBlVt0
Content-Type: multipart/mixed;
 boundary="------------B81120A55C794E6A11CAA6AE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B81120A55C794E6A11CAA6AE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.09.21 12:10, Jan Beulich wrote:
> Without announcing hvc0 as preferred it won't get used as long as tty0
> gets registered earlier. This is particularly problematic with there no=
t
> being any screen output for PVH Dom0 when the screen is in graphics
> mode, as the necessary information doesn't get conveyed yet from the
> hypervisor.
>=20
> Follow PV's model, but be conservative and do this for Dom0 only for
> now.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
> Prior to 418492ba40b2 ("x86/virt/xen: Use guest_late_init to detect Xen=

> PVH guest") x86_init.oem.arch_setup was already used by PVH, so I assum=
e
> the use of this hook is acceptable here.

Yes, I think so.

> Seeing that change, I wonder in how far setting xen_pvh to true only in=

> xen_hvm_guest_late_init() can really work: This hook, as its name says,=

> gets called pretty late; any decision taken earlier might have been
> wrong. One such wrong decision is what gets added here - preferred
> consoles won't be registered when taking that path. While adding a 2nd
> call there might work, aiui they would better be registered prior to
> parse_early_param(), i.e. before "earlyprintk=3D" gets evaluated.
>=20
> I also consider tying "detecting" PVH mode to the no-VGA and no-CMOS-RT=
C
> FADT flags as problematic looking forward: There may conceivably be
> "legacy free" HVM guests down the road, yet they shouldn't be mistaken
> for being PVH. Most of the XEN_X86_EMU_* controlled functionality would=

> seem unsuitable for the same reason; presence/absence of
> XENFEAT_hvm_pirqs (tied to XEN_X86_EMU_USE_PIRQ) might be sufficiently
> reliable an indicator. Question there is whether the separation
> introduced by Xen commit b96b50004804 ("x86: remove XENFEAT_hvm_pirqs
> for PVHv2 guests") came early enough in the process of enabling PVHv2.

Yes, it did. The boot path not using the PVH specific entry point was
enabled with Xen 4.11, while commit b96b50004804 was in 4.9.


Juergen

--------------B81120A55C794E6A11CAA6AE
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

--------------B81120A55C794E6A11CAA6AE--

--KJGvBtqHlnedeq33aAE3U0cqUhtZBlVt0--

--91iDXi0U6EUiXy5e5GnMRq1VY3EqTjDTl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMlUQFAwAAAAAACgkQsN6d1ii/Ey8x
iAf/fgB9XcFj3SYVqzq+hQfPHb/7f8TzC1lVTGPiQA7e9d4ro//aIspKnnpzSujRBBA1vbdcNgqS
2g2xF8pJkE2idoYXUcIJbGr+/r+3mOjfqjQSCDC6OcoR1qBC8kTWChjjHw8Wufb8nqF7j4ilW30p
kjVKta6xvUN7hSw6KIvjRrejw8SnjkgeESP8kLKEm71uWuCbR7URli2MI3G2lDORfIlwoRyBfETY
Ti6vQNgYPU7Ol2i+syUPxhDdnfF96niNSKFyNqzETQMnteuoO+yxBwlAoejaP2zjIXDt2sHRkKvK
0WcvpWYxl3qY51WgYc1ivB7G2Bk84fAO553ibr4OiA==
=Xbvv
-----END PGP SIGNATURE-----

--91iDXi0U6EUiXy5e5GnMRq1VY3EqTjDTl--

