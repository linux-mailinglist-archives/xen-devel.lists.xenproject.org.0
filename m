Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02241BEBB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 07:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198588.352140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSBu-0004fP-Jl; Wed, 29 Sep 2021 05:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198588.352140; Wed, 29 Sep 2021 05:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSBu-0004cW-Fw; Wed, 29 Sep 2021 05:31:38 +0000
Received: by outflank-mailman (input) for mailman id 198588;
 Wed, 29 Sep 2021 05:31:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVSBs-0004cQ-K0
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 05:31:36 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82b83dd8-20e6-11ec-bcdd-12813bfff9fa;
 Wed, 29 Sep 2021 05:31:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABF30223A5;
 Wed, 29 Sep 2021 05:31:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89CA013A81;
 Wed, 29 Sep 2021 05:31:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 583FHzb6U2EzOgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Sep 2021 05:31:34 +0000
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
X-Inumbo-ID: 82b83dd8-20e6-11ec-bcdd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632893494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8KMw82i0GYCOWtgXPFwQhIxcONcrhtasQJPp0u+f2k=;
	b=NprFYsf18Kx3SZ8QMxhLxlHCKeJ2xMqM8+zryHM1fG0DRk53vNJ2H4EgUQ2Uk89jZdz+oX
	cvtgbr20k39UC47qfWHDslT80UW/zMXuHz/4OSDVwHHw8kpnIroZy7WqjSht4R6YoikP9e
	5v1bnNbyAXhiGvWZ3iSFarVm5+21/6g=
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210928091517.9761-1-jgross@suse.com>
 <20210928091517.9761-3-jgross@suse.com>
 <24915.1121.8356.288414@mariner.uk.xensource.com>
 <0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
 <24915.13356.139165.259646@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <3c9bfe5d-c471-c771-d6a7-a15cca466cb6@suse.com>
Date: Wed, 29 Sep 2021 07:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24915.13356.139165.259646@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DPu5AieWRRI95BwA4gKHhHllglUSOqoFZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DPu5AieWRRI95BwA4gKHhHllglUSOqoFZ
Content-Type: multipart/mixed; boundary="Vtw6uKjlyWkuHLsvHUAu7H25qYt1qZmNh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <3c9bfe5d-c471-c771-d6a7-a15cca466cb6@suse.com>
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210928091517.9761-1-jgross@suse.com>
 <20210928091517.9761-3-jgross@suse.com>
 <24915.1121.8356.288414@mariner.uk.xensource.com>
 <0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
 <24915.13356.139165.259646@mariner.uk.xensource.com>
In-Reply-To: <24915.13356.139165.259646@mariner.uk.xensource.com>

--Vtw6uKjlyWkuHLsvHUAu7H25qYt1qZmNh
Content-Type: multipart/mixed;
 boundary="------------56B2A43F42BBA97E1EC2F8AA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------56B2A43F42BBA97E1EC2F8AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.09.21 17:26, Ian Jackson wrote:
> Juergen Gross writes ("Re: [PATCH v5 2/2] tools/xenstore: set open file=
 descriptor limit for xenstored"):
>> Hmm, maybe I should just use:
>>
>> prlimit --nofile=3D$XENSTORED_MAX_OPEN_FDS \
>>      $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS=

>=20
> I guess that would probably work (although it involves another
> exec) but I don't understand what's wrong with ulimit, which is a
> shell builtin.

My main concern with ulimit is that this would set the open file limit
for _all_ children of the script. I don't think right now this is a real
problem, but it feels wrong to me (systemd-notify ought to be fine, but
you never know ...).


Juergen

--------------56B2A43F42BBA97E1EC2F8AA
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

--------------56B2A43F42BBA97E1EC2F8AA--

--Vtw6uKjlyWkuHLsvHUAu7H25qYt1qZmNh--

--DPu5AieWRRI95BwA4gKHhHllglUSOqoFZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFT+jUFAwAAAAAACgkQsN6d1ii/Ey98
rAf+P5JhunS71brNgN/5BH1Jxx1PVoAsg0ZAFMIzbGLgsXmf7V9l6Q4fcL0aQ2m+LvpYSP6Frd6i
58+xlm5cktdr+h2a9u6Sq5zoilyE4lFLbwCn0exVk3Ta72isG35jt2nXidL1/vlcI4u9dV4kjkyy
l0Z+I2gBrjJ37YZOYGoXW9sN5EHn4L4DXB0gh5KB5wgu/jJ+y6vm7h79U4mnC1ug/YGL8s5+rSXU
J0TqvHUfI7KcQprXdshR4THIE02HMtIy1RVZd+NxYrzPci2KA3XqazLb9gwSCxmUIIAKI3mhQne/
Mm0vYN6soCV3gIFrgUno+ZML6CpOK0WCHWVouPqXsA==
=NPA2
-----END PGP SIGNATURE-----

--DPu5AieWRRI95BwA4gKHhHllglUSOqoFZ--

