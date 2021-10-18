Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB2431AB5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212254.370061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcScl-0003Ix-SD; Mon, 18 Oct 2021 13:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212254.370061; Mon, 18 Oct 2021 13:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcScl-0003GP-Of; Mon, 18 Oct 2021 13:24:19 +0000
Received: by outflank-mailman (input) for mailman id 212254;
 Mon, 18 Oct 2021 13:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcScj-0003GJ-Uj
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:24:17 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b59636e-902b-4d43-a740-f8ae1742a6c3;
 Mon, 18 Oct 2021 13:24:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C1D7C1FD6D;
 Mon, 18 Oct 2021 13:24:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6975C14059;
 Mon, 18 Oct 2021 13:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YsiCGH91bWEiWwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 13:24:15 +0000
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
X-Inumbo-ID: 4b59636e-902b-4d43-a740-f8ae1742a6c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634563455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLwgFz0ouk70aMvqE/oxcKXjMKpaMZaJazTtxliKYDc=;
	b=j6TT/MWL6A7RpktjwPNPwhEdZKNkEYdB37foTRuM382dxj15lNMXvqe3Myp9jdzn49GPET
	5T3YzN9hujhtE9LF9/oAOJIDzStxwhg/rxwjbwFBp5QR8jt0IR2aeDDgQ8g8QkWmV0DdXY
	i9auQkF7dtdG6ZRtW9B6FJEpS72aqFY=
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
 <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
Message-ID: <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
Date: Mon, 18 Oct 2021 15:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IEjcj4KKxUWqGed8LunLYFPQPQ0wxaXYl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IEjcj4KKxUWqGed8LunLYFPQPQ0wxaXYl
Content-Type: multipart/mixed; boundary="xsHi2Sg6c3bEE1kNlMkoAyGeiJaA2RIB4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
 <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
In-Reply-To: <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>

--xsHi2Sg6c3bEE1kNlMkoAyGeiJaA2RIB4
Content-Type: multipart/mixed;
 boundary="------------CFA04F7C4334BD41A928A5F6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CFA04F7C4334BD41A928A5F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 13:55, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> Today most hypercall handlers have a return type of long, while the
>> compat ones return an int. There are a few exceptions from that rule,
>> however.
>>
>> Get rid of the exceptions by letting compat handlers always return int=

>> and others always return long.
>>
>> For the compat hvm case use eax instead of rax for the stored result a=
s
>> it should have been from the beginning.
>>
>> Additionally move some prototypes to include/asm-x86/hypercall.h
>> as they are x86 specific. Move the do_physdev_op() prototype from both=

>> architecture dependant headers to the common one. Move the
>> compat_platform_op() prototype to the common header.
>>
>> Switch some non style compliant types (u32, s32, s64) to style complia=
nt
>> ones.
>>
>> Rename paging_domctl_continuation() to do_paging_domctl_cont() and add=

>> a matching define for the associated hypercall.
>>
>> Make do_callback_op() and compat_callback_op() more similar by adding
>> the const attribute to compat_callback_op()'s 2nd parameter.
>>
>> The do_platform_op() prototype needs to be modified in order to better=

>> match its compat variant.
>=20
> "Better" in what direction? So far both have been using typed handles,
> which I consider better than void ones. You also don't seem to have
> had a reason to switch e.g. multicall or dm_op, where (different)
> typed handles are also in use. So I wonder what the reason for this
> change is.

I had some problems making this build. Before my patches
platform_hypercall.c didn't include the header with the prototype,
so there was no mismatch detected.

Thanks for the pointers above. dm_op is no good example, as the
compat variant is explicitly a different implementation compared
to the normal one. But with the multicall example I can have
another try converting platform_op to a type safe variant using
non-void handles.

>=20
>> Change the type of the cmd parameter for [do|compat]_kexec_op() to
>> unsigned int, as this is more appropriate for the compat case.
>=20
> The change for the compat case is fine, but for native you change
> behavior for callers passing values equaling valid KEXEC_CMD_*
> modulo 2=C2=B3=C2=B2.

TBH, I don't think this is really a problem. Or do you think there
really is a user of this interface relying on a -ENOSYS in this
case?

>=20
>> --- a/xen/arch/x86/pv/misc-hypercalls.c
>> +++ b/xen/arch/x86/pv/misc-hypercalls.c
>> @@ -28,12 +28,16 @@ long do_set_debugreg(int reg, unsigned long value)=

>>       return set_debugreg(current, reg, value);
>>   }
>>  =20
>> -unsigned long do_get_debugreg(int reg)
>> +long do_get_debugreg(int reg)
>>   {
>> -    unsigned long val;
>> -    int res =3D x86emul_read_dr(reg, &val, NULL);
>> -
>> -    return res =3D=3D X86EMUL_OKAY ? val : -ENODEV;
>> +    /* Avoid undefined behavior due to casting an unsigned long to lo=
ng. */
>=20
> Nit: unsigned -> signed conversion is implementation-defined, not
> undefined.

Okay, will change the comment.

>=20
>> --- a/xen/common/argo.c
>> +++ b/xen/common/argo.c
>> @@ -2207,13 +2207,13 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_=
PARAM(void) arg1,
>>   }
>>  =20
>>   #ifdef CONFIG_COMPAT
>> -long
>> -compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
>> -               XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,=

>> -               unsigned long arg4)
>> +int compat_argo_op(unsigned int cmd,
>> +                   XEN_GUEST_HANDLE_PARAM(void) arg1,
>> +                   XEN_GUEST_HANDLE_PARAM(void) arg2,
>> +                   unsigned long arg3, unsigned long arg4)
>=20
> Strictly speaking arg3 and arg4 also ought to be unsigned int here.
> But that's perhaps for a separate patch at another time.

I'd rather leave it as is, as this way I can use the same definition for
both cases in patch 6. And I don't see how anything could go wrong this
way, as expanding a 32-bit unsigned value to 64 bits is in no way
ambiguous.


Juergen

--------------CFA04F7C4334BD41A928A5F6
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

--------------CFA04F7C4334BD41A928A5F6--

--xsHi2Sg6c3bEE1kNlMkoAyGeiJaA2RIB4--

--IEjcj4KKxUWqGed8LunLYFPQPQ0wxaXYl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtdX4FAwAAAAAACgkQsN6d1ii/Ey9Y
6ggAkJwRRhpHZpePa42IEeFcuZJKVgK4c380HETnYrHSsYDikdyuf/qYC41UlsfWkZQSsn4zfrxR
12RjOIGvh6WkI50CE+uMLPfbJKK0D0kIlifAChTwJVOBL09UOnzFjZxaOOszfVas4nW90vuElHw6
P9rOM3Vvr3+kLdnfyxTN/rabRxVf6GcmB1F49468hVW5hH6q+o1b4E2FLhzhH1+QcUruQ3wmvCiI
WNOv3dNH/oRPTqVajYrelVl2Oi4hsQeFEMfWr40qwHuXNXUGe6lxl4G2/FC+jpKJXxB8jgvgZfcL
FxwjRe23mM5fwDef2jgYZvXc1+9xqg/qWCXr0wusWg==
=+5A/
-----END PGP SIGNATURE-----

--IEjcj4KKxUWqGed8LunLYFPQPQ0wxaXYl--

