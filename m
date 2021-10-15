Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699842F52C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:24:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210711.367688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO7k-0001vt-MS; Fri, 15 Oct 2021 14:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210711.367688; Fri, 15 Oct 2021 14:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbO7k-0001u4-J1; Fri, 15 Oct 2021 14:23:52 +0000
Received: by outflank-mailman (input) for mailman id 210711;
 Fri, 15 Oct 2021 14:23:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbO7j-0001tL-2c
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:23:51 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 042695fc-66cb-4f53-ad70-0e2994bddac3;
 Fri, 15 Oct 2021 14:23:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6570B21A63;
 Fri, 15 Oct 2021 14:23:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C2DE13C29;
 Fri, 15 Oct 2021 14:23:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HLWqCfWOaWEsSgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 14:23:49 +0000
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
X-Inumbo-ID: 042695fc-66cb-4f53-ad70-0e2994bddac3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634307829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BtWnqO2+fgTq9PT/WsY2DMNetpY4LZOLwwE5wpQvswc=;
	b=t4hHeBQw+9aaLnZM1lNScSiCdTdiFEACcHFKc23QCCTOBc0Lez9+9CUY+9PYeMM1Atg3Ed
	g4+DE46K6YhClBPWTTjNscpkpC4BSzZviyuEMwp11AZWQ0NOGcRQ9ObOWyYdcfMWQAyzPn
	xc8nMjuTD+nW6WhZK1UoWOyA0qvyR74=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-9-jgross@suse.com>
 <460a149d-8d54-679a-1af8-694d7ee1ac01@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/12] x86/pv-shim: don't modify hypercall table
Message-ID: <4592bb70-3a91-8dc1-0921-0801a0ef18d3@suse.com>
Date: Fri, 15 Oct 2021 16:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <460a149d-8d54-679a-1af8-694d7ee1ac01@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oluKzkFK6OUFxTk4npzrqaljOnuQQNrXC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oluKzkFK6OUFxTk4npzrqaljOnuQQNrXC
Content-Type: multipart/mixed; boundary="qHjbyJwnGq8KfMTCHmCNJK7AwUHrkm4eT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <4592bb70-3a91-8dc1-0921-0801a0ef18d3@suse.com>
Subject: Re: [PATCH 08/12] x86/pv-shim: don't modify hypercall table
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-9-jgross@suse.com>
 <460a149d-8d54-679a-1af8-694d7ee1ac01@suse.com>
In-Reply-To: <460a149d-8d54-679a-1af8-694d7ee1ac01@suse.com>

--qHjbyJwnGq8KfMTCHmCNJK7AwUHrkm4eT
Content-Type: multipart/mixed;
 boundary="------------C4488559691535F53432299A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C4488559691535F53432299A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.10.21 15:57, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> When running as pv-shim the hypercall is modified today in order to
>> replace the functions for __HYPERVISOR_event_channel_op and
>> __HYPERVISOR_grant_table_op hypercalls.
>>
>> Change this to call the related functions from the normal handlers
>> instead when running as shim. The performance implications are not
>> really relevant, as a normal production hypervisor will not be
>> configured to support shim mode, so the related calls will be dropped
>> due to optimization of the compiler.
>>
>> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
>> wrapper do_grant_table_op() needed, as in this case grant_table.c
>> isn't being built.
>=20
> While you say CONFIG_PV_SHIM_EXCLUSIVE here, ...
>=20
>> @@ -845,6 +822,23 @@ static long pv_shim_grant_table_op(unsigned int c=
md,
>>       return rc;
>>   }
>>  =20
>> +#ifndef CONFIG_GRANT_TABLE
>=20
> ... you don't actually enforce this here. I also don't see why it would=

> be needed in the "exclusive" case only. A binary usable both ways would=

> still need these, wouldn't it?

The "exclusive" case is normally the one where CONFIG_GRANT_TABLE is not
set. I highlighted this as it is a common situation.

>=20
>> +/* Thin wrapper(s) needed. */
>> +long do_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void)=
 uop,
>> +                       unsigned int count)
>> +{
>> +    return pv_shim_grant_table_op(cmd, uop, count);
>> +}
>> +
>> +#ifdef CONFIG_PV32
>> +int compat_grant_table_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) uop,
>> +                          unsigned int count)
>> +{
>> +    return pv_shim_grant_table_op(cmd, uop, count);
>> +}
>> +#endif
>> +#endif
>=20
> Don't you also need to adjust the respective #ifdef in
> pv_hypercall_table[]? Otherwise I don't see how, at this point of the
> series, the functions would actually get hooked up.

Ah, right.

> In a bi-modal
> binary further guarding will then be needed inside the wrappers, I
> think. (While the table is going to go away, that guarding is going
> to be needed even at the end of this series, I believe.)

Oh, you mean for the weird case of !pv_shim? Yes, I need to return
-ENOSYS in this case.

> Talking of wrappers - do you need actual code to be emitted for this?
> Can't you simply put in place an alias each, which is permitted now
> that pv_shim_grant_table_op() isn't static anymore? (Albeit that's
> partly moot if guarding code gets added to the functions - in that
> case only compat_grant_table_op() could become an alias of
> do_grant_table_op().)

I didn't think of an alias. But I don't think I can make
compat_grant_table_op() an alias of do_grant_table_op(), as they have
different return types.


Juergen

--------------C4488559691535F53432299A
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

--------------C4488559691535F53432299A--

--qHjbyJwnGq8KfMTCHmCNJK7AwUHrkm4eT--

--oluKzkFK6OUFxTk4npzrqaljOnuQQNrXC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFpjvQFAwAAAAAACgkQsN6d1ii/Ey8O
kAf/RLaYtnkqPGwRtXUB70O1d5w6mww01Yx6cfTOOmdZsEqaGT0P0LosI5RVArZOrYBIBTYRsvQW
rS/qA/lXar9WTdKy+yQnJjYiX67g9CNi6doCtZZHnZlq5sF07Q93lOgjomH31LinkNiu4jewNiQH
IHBXRme7wd7/W6pvfBPOpDNo8QAkrY45wMtpW4CMyB7GV6p8j60N1d6DpQpRWELgoUqP3p9G127f
cTVXfBklMBI3qanvOgSTz/QP7fxOUrC/LY7penHBb43nqxpltP9rUEHwFTMZGhdkIEPmk1xztG7k
eJ4DwvTuI7FZ/Tazlwp4T5Fc0nbE9ZHJCqq9jdPVYg==
=FYbK
-----END PGP SIGNATURE-----

--oluKzkFK6OUFxTk4npzrqaljOnuQQNrXC--

