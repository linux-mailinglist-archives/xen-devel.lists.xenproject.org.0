Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CC459038
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228916.396161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAKH-0005HK-5i; Mon, 22 Nov 2021 14:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228916.396161; Mon, 22 Nov 2021 14:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpAKH-0005FU-1F; Mon, 22 Nov 2021 14:29:45 +0000
Received: by outflank-mailman (input) for mailman id 228916;
 Mon, 22 Nov 2021 14:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fXQY=QJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpAKF-0005FO-O1
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:29:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c90e3d-4ba0-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 15:29:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2204A1FD5A;
 Mon, 22 Nov 2021 14:29:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3C6613B44;
 Mon, 22 Nov 2021 14:29:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id brHLMVWpm2FYdQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 Nov 2021 14:29:41 +0000
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
X-Inumbo-ID: a1c90e3d-4ba0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637591382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVZNkfzdxBWj6/7kz5jwFuIe/dsNZU0DLlRmpWjFnPc=;
	b=XF8aqrnqwLRKK1Uz5AzpFuILa6xiPUgqLmfxq4oV2qOGnfKNeSfIjKxLgNvsJtGr/SaBJZ
	zOxCCRiy25Lv1n0ugQBuM7rCtDsxlBpi0tJlTZAHbHXW0DKCP4xrypvRPH76msV++R98E+
	e86h8e9upyqlG7mQsvvQcDdfpPJp+2E=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-2-jgross@suse.com>
 <8fe9a5bd-030c-66b7-ccf3-4545cfb80f66@xen.org>
 <fa778d46-0a4b-254c-0cde-d3df4e53ec4a@suse.com>
 <407a8f05-f16c-26bb-9ba1-044f62e3c0a0@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 1/4] xen: add a domain unique id to each domain
Message-ID: <523bb99f-a37d-f3c4-c0a4-c2caa20485cd@suse.com>
Date: Mon, 22 Nov 2021 15:29:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <407a8f05-f16c-26bb-9ba1-044f62e3c0a0@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NPRWPxxnywTBP3NLrjzf5VN76CSPLUgFw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NPRWPxxnywTBP3NLrjzf5VN76CSPLUgFw
Content-Type: multipart/mixed; boundary="9KUFrzRAEt390QGsHDjtiSmYcMEY5qO2J";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <523bb99f-a37d-f3c4-c0a4-c2caa20485cd@suse.com>
Subject: Re: [PATCH RFC 1/4] xen: add a domain unique id to each domain
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-2-jgross@suse.com>
 <8fe9a5bd-030c-66b7-ccf3-4545cfb80f66@xen.org>
 <fa778d46-0a4b-254c-0cde-d3df4e53ec4a@suse.com>
 <407a8f05-f16c-26bb-9ba1-044f62e3c0a0@xen.org>
In-Reply-To: <407a8f05-f16c-26bb-9ba1-044f62e3c0a0@xen.org>

--9KUFrzRAEt390QGsHDjtiSmYcMEY5qO2J
Content-Type: multipart/mixed;
 boundary="------------9C758D455A2C8E537E462A50"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9C758D455A2C8E537E462A50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.11.21 15:10, Julien Grall wrote:
> Hi,
>=20
> On 22/11/2021 12:48, Juergen Gross wrote:
>> On 22.11.21 12:42, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 14/09/2021 13:35, Juergen Gross wrote:
>>>> Xenstore is referencing domains by their domid, but reuse of a domid=

>>>> can lead to the situation that Xenstore can't tell whether a domain
>>>> with that domid has been deleted and created again without Xenstore
>>>> noticing the domain is a new one now.
>>>>
>>>> Add a global domain creation unique id which is updated when creatin=
g
>>>> a new domain, and store that value in struct domain of the new domai=
n.
>>>> The global unique id is initialized with the system time and updates=

>>>> are done via the xorshift algorithm which is used for pseudo random
>>>> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).=

>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> =C2=A0 xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++++=
++++
>>>> =C2=A0 xen/include/xen/sched.h |=C2=A0 3 +++
>>>> =C2=A0 2 files changed, 19 insertions(+)
>>>>
>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>> index 6ee5d033b0..755349b93f 100644
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -84,6 +84,9 @@ vcpu_info_t dummy_vcpu_info;
>>>> =C2=A0 bool __read_mostly vmtrace_available;
>>>> +/* Unique domain identifier, protected by domctl lock. */
>>>> +static uint64_t unique_id;
>>>> +
>>>> =C2=A0 static void __domain_finalise_shutdown(struct domain *d)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu *v;
>>>> @@ -473,6 +476,18 @@ static void _domain_destroy(struct domain *d)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_domain_struct(d);
>>>> =C2=A0 }
>>>> +static uint64_t get_unique_id(void)
>>>
>>> The implementation is assuming that domain cannot be created=20
>>> concurrently. The rest of domain_create() seems to be able to cope=20
>>> with concurrent call (even if domctl prevents this situation today).
>>>
>>> So I think we would want to make this call safe as well. One=20
>>> possibility would be to (ab)use the domlist_update_lock (I think the =

>>> uniq ID is only necessary for real domains).
>>
>> In case this is thought to be needed, I'd rather use a cmpxchg operati=
on
>> for updating unique_id.
> I would be OK with cmpxchg(). But I would like to avoid cmpxchg() loop =

> if possible.

The chances for that loop to be needed are zero today, as the domctl
lock is prohibiting concurrent use.

Another possibility would be to use an:

ASSERT(spin_is_locked(&domctl_lock));

which would need domctl_lock to be globally visible, though.

>=20
> Reading the commit message (and cover letter) again, I understand that =

> you want a unique ID but it is not clear to me why this needs to be=20
> pseudo-randomly generated. IOW, given the expected use, can you clarify=
=20
> what would be the concern to use an atomic_inc_return() instead of=20
> xorshift?

Jan had a concern regarding potential misuse of the unique id in case it
were kind of predictable.


Juergen

--------------9C758D455A2C8E537E462A50
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

--------------9C758D455A2C8E537E462A50--

--9KUFrzRAEt390QGsHDjtiSmYcMEY5qO2J--

--NPRWPxxnywTBP3NLrjzf5VN76CSPLUgFw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGbqVUFAwAAAAAACgkQsN6d1ii/Ey/x
CAf/Sgu2JO8YCJfJJ9PG3EIjbDmbeosA4shyxuuVoWbYqWyCSmVHzxUZB2KzhySfQSphF1OzDjxx
YHPbMk3YPZ19qOGHtoSBYh0T2oOKNol3pqjq4Pe2Hz4X8J39fCLqXeNKdeZqhnvJjDaNJZQqyepc
Q9v1inrqyTAKZhG0OFp1hVPzCrBrGlC/y4fdGwkoCQ55c0GKNQUw9VHXLKa1vCpoolvB9qeSyRy5
XpCODr7Caraf1B0CyjDAHS7G30nRWUzrHWkFjY/zvTMMK/RtbFe2xem2e3U/Pqv34cqSDCoGTK2O
agSA1L07G6wOBduQFjPTz1s34mC/HOelsdvDaBj/EQ==
=d5aV
-----END PGP SIGNATURE-----

--NPRWPxxnywTBP3NLrjzf5VN76CSPLUgFw--

