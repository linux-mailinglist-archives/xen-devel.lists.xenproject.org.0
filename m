Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A83F96F9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173526.316613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYAf-0005Ei-GU; Fri, 27 Aug 2021 09:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173526.316613; Fri, 27 Aug 2021 09:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYAf-0005Bu-DP; Fri, 27 Aug 2021 09:29:09 +0000
Received: by outflank-mailman (input) for mailman id 173526;
 Fri, 27 Aug 2021 09:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hYM7=NS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mJYAd-0005Bl-Q6
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:29:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 570f2c8a-9e1b-4ae5-b2e0-130dc151ffb9;
 Fri, 27 Aug 2021 09:29:06 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 991101FED8;
 Fri, 27 Aug 2021 09:29:05 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 72601137C0;
 Fri, 27 Aug 2021 09:29:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id FuD0GWGwKGF3KQAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 27 Aug 2021 09:29:05 +0000
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
X-Inumbo-ID: 570f2c8a-9e1b-4ae5-b2e0-130dc151ffb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630056545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/EXzJfGZD/uNu+Y9v9VU+F57kf4IyLzhzk16F8kAvY=;
	b=OKHeKbq3cCCHttBvKxlp6D9FbCkbE2BKWB7pSo0rmmJEQwBXN7avyjCgvwcrOPqDQEG3fZ
	othxcwXCcaSCeY37CuC8L7QPQl8egfia411iQnHK03XAV0hmXpRjZfj7cqxWEz9Nf8MeTe
	6eEf45V/VuwsviFJlVly+YATjSwnu9o=
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux: balloon_process() causing workqueue lockups?
Message-ID: <744feab4-44a8-bb57-a03a-4cc2b8a78f88@suse.com>
Date: Fri, 27 Aug 2021 11:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ASPP1Rn4sdZ9i3IgFygjgpuM3doc3zWJM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ASPP1Rn4sdZ9i3IgFygjgpuM3doc3zWJM
Content-Type: multipart/mixed; boundary="XjuGZgQUY7UfsuT1InQ8lzH63EhbkAqtZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <744feab4-44a8-bb57-a03a-4cc2b8a78f88@suse.com>
Subject: Re: Linux: balloon_process() causing workqueue lockups?
References: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>
In-Reply-To: <2bfd9396-0967-df51-298b-22a91f570c48@suse.com>

--XjuGZgQUY7UfsuT1InQ8lzH63EhbkAqtZ
Content-Type: multipart/mixed;
 boundary="------------51B98A6D97C44F33D658744F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------51B98A6D97C44F33D658744F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.08.21 11:01, Jan Beulich wrote:
> Hello,
>=20
> ballooning down Dom0 by about 16G in one go once in a while causes:
>=20
> BUG: workqueue lockup - pool cpus=3D6 node=3D0 flags=3D0x0 nice=3D0 stu=
ck for 64s!
> Showing busy workqueues and worker pools:
> workqueue events: flags=3D0x0
>    pwq 12: cpus=3D6 node=3D0 flags=3D0x0 nice=3D0 active=3D2/256 refcnt=
=3D3
>      in-flight: 229:balloon_process
>      pending: cache_reap
> workqueue events_freezable_power_: flags=3D0x84
>    pwq 12: cpus=3D6 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=
=3D2
>      pending: disk_events_workfn
> workqueue mm_percpu_wq: flags=3D0x8
>    pwq 12: cpus=3D6 node=3D0 flags=3D0x0 nice=3D0 active=3D1/256 refcnt=
=3D2
>      pending: vmstat_update
> pool 12: cpus=3D6 node=3D0 flags=3D0x0 nice=3D0 hung=3D64s workers=3D3 =
idle: 2222 43
>=20
> I've tried to double check that this isn't related to my IOMMU work
> in the hypervisor, and I'm pretty sure it isn't. Looking at the
> function I see it has a cond_resched(), but aiui this won't help
> with further items in the same workqueue.
>=20
> Thoughts?

I'm seeing two possible solutions here:

1. After some time (1 second?) in balloon_process() setup a new
    workqueue activity and return (similar to EAGAIN, but without
    increasing the delay).

2. Don't use a workqueue for the ballooning activity, use a kernel
    thread instead.

I have a slight preference for 2, even if the resulting patch will
be larger. 1 is only working around the issue and it is hard to
find a really good timeout value.

I'd be fine to write a patch, but would prefer some feedback which
way to go.


Juergen

--------------51B98A6D97C44F33D658744F
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

--------------51B98A6D97C44F33D658744F--

--XjuGZgQUY7UfsuT1InQ8lzH63EhbkAqtZ--

--ASPP1Rn4sdZ9i3IgFygjgpuM3doc3zWJM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEosGAFAwAAAAAACgkQsN6d1ii/Ey8m
bwgAiCFwcQRXmJnPDxBUrbzWPUd7Hlb0tPaIigNm7bI3kv+dJDr76cV8E0Fcxtfn1N9ETPfk9Gnm
olDIgGG39ARaLgrHkXDt3QDWG59OSQ4sCCIU3zWrykK2VgPyHXNSOnpL8rhJg4RJpfPKf/mR0JuL
smi5ubRxa7f3hhgL/rPFDFDJJib95YqzWNbgJfz83nJ4xqOaXLofaiqtHHAk8AwQQqF9lJwmav7/
KI4QFQTsclOM3G8xIrpcHcrb3A93cK9O9O3q+QmcOb85bOwwk6O3b/dfL4e4tHiCi2UqJ4J6pG/u
lrWxep+ZXKXfDyCcgDa9H3raf+vNlc6GCFn3Vul8Nw==
=M9TS
-----END PGP SIGNATURE-----

--ASPP1Rn4sdZ9i3IgFygjgpuM3doc3zWJM--

