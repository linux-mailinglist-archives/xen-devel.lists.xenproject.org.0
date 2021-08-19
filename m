Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AA3F16A1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168483.307616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeh8-0003u5-14; Thu, 19 Aug 2021 09:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168483.307616; Thu, 19 Aug 2021 09:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeh7-0003rd-UF; Thu, 19 Aug 2021 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 168483;
 Thu, 19 Aug 2021 09:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGeh6-0003rX-Ms
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 09:50:40 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e83a13f6-00d2-11ec-a5d7-12813bfff9fa;
 Thu, 19 Aug 2021 09:50:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 69972200B6;
 Thu, 19 Aug 2021 09:50:38 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 21D2F1389C;
 Thu, 19 Aug 2021 09:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nBDHBm4pHmEdMwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 09:50:38 +0000
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
X-Inumbo-ID: e83a13f6-00d2-11ec-a5d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629366638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3ati4Jrqq+22WvIoL1FvEQHvqhQQNovnRVVoJXJ7YA=;
	b=iGl2ablvdwGfWhM/vl8QxgzGE7tKhr21HHV6wAngAMyqP/OfrI0NspEK2qwmVP2YDQ1pDN
	dcciPC+CDJSWUUL9j2aMhrsGvvHS2YYaD3bYCgnK3Y10fb/otMGAqjJElnQ7MGF8dG2qi+
	JZrZ63zld5f8M8iYZ5FtGeda6xtgt/k=
Subject: Re: [PATCH v2 02/13] libxc: split xc_logdirty_control() from
 xc_shadow_control()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <4b68233b-259c-3308-3292-82e991e1e108@suse.com>
 <7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>
 <eba44638-699e-36e4-afd5-5b78270baafa@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <cb3b7a87-d480-d431-58a9-b47dab20d2ca@suse.com>
Date: Thu, 19 Aug 2021 11:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eba44638-699e-36e4-afd5-5b78270baafa@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p3sFXMvy9XnIDRU3S40123CfECepCGylj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--p3sFXMvy9XnIDRU3S40123CfECepCGylj
Content-Type: multipart/mixed; boundary="rvXqUQHvIvwywINQdLDo2MCHGRRqZV9VE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <cb3b7a87-d480-d431-58a9-b47dab20d2ca@suse.com>
Subject: Re: [PATCH v2 02/13] libxc: split xc_logdirty_control() from
 xc_shadow_control()
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <4b68233b-259c-3308-3292-82e991e1e108@suse.com>
 <7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>
 <eba44638-699e-36e4-afd5-5b78270baafa@suse.com>
In-Reply-To: <eba44638-699e-36e4-afd5-5b78270baafa@suse.com>

--rvXqUQHvIvwywINQdLDo2MCHGRRqZV9VE
Content-Type: multipart/mixed;
 boundary="------------2975644E5234310E10EA4E22"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2975644E5234310E10EA4E22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.08.21 11:24, Jan Beulich wrote:
> On 19.08.2021 11:11, Juergen Gross wrote:
>> On 05.07.21 17:12, Jan Beulich wrote:
>>> For log-dirty operations a 64-bit field is being truncated to become =
an
>>> "int" return value. Seeing the large number of arguments the present
>>> function takes, reduce its set of parameters to that needed for all
>>> operations not involving the log-dirty bitmap, while introducing a ne=
w
>>> wrapper for the log-dirty bitmap operations. This new function in tur=
n
>>> doesn't need an "mb" parameter, but has a 64-bit return type. (Using =
the
>>> return value in favor of a pointer-type parameter is left as is, to
>>> disturb callers as little as possible.)
>>>
>>> While altering xc_shadow_control() anyway, also adjust the types of t=
he
>>> last two of the remaining parameters.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>>> ---
>>> v2: Avoid new use of DECLARE_DOMCTL. Re-base over error handling fix =
to
>>>       libxl__arch_domain_create().
>>> ---
>>> I wonder whether we shouldn't take the opportunity and also rename
>>> xc_shadow_control() to, say, xc_paging_control(), matching the layer
>>> above the HAP/shadow distinction in the hypervisor.
>>>
>>> --- a/tools/include/xenctrl.h
>>> +++ b/tools/include/xenctrl.h
>>> @@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
>>>    int xc_shadow_control(xc_interface *xch,
>>>                          uint32_t domid,
>>>                          unsigned int sop,
>>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>>> -                      unsigned long pages,
>>> -                      unsigned long *mb,
>>> -                      uint32_t mode,
>>> -                      xc_shadow_op_stats_t *stats);
>>> +                      unsigned int *mb,
>>> +                      unsigned int mode);
>>> +long long xc_logdirty_control(xc_interface *xch,
>>> +                              uint32_t domid,
>>> +                              unsigned int sop,
>>> +                              xc_hypercall_buffer_t *dirty_bitmap,
>>> +                              unsigned long pages,
>>> +                              unsigned int mode,
>>> +                              xc_shadow_op_stats_t *stats);
>>>   =20
>>>    int xc_sched_credit_domain_set(xc_interface *xch,
>>>                                   uint32_t domid,
>>> --- a/tools/libs/ctrl/xc_domain.c
>>> +++ b/tools/libs/ctrl/xc_domain.c
>>> @@ -650,25 +650,49 @@ int xc_watchdog(xc_interface *xch,
>>>    int xc_shadow_control(xc_interface *xch,
>>>                          uint32_t domid,
>>>                          unsigned int sop,
>>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>>> -                      unsigned long pages,
>>> -                      unsigned long *mb,
>>> -                      uint32_t mode,
>>> -                      xc_shadow_op_stats_t *stats)
>>> +                      unsigned int *mb,
>>> +                      unsigned int mode)
>>>    {
>>>        int rc;
>>>        DECLARE_DOMCTL;
>>> -    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
>>>   =20
>>>        memset(&domctl, 0, sizeof(domctl));
>>>   =20
>>>        domctl.cmd =3D XEN_DOMCTL_shadow_op;
>>>        domctl.domain =3D domid;
>>>        domctl.u.shadow_op.op     =3D sop;
>>
>> Shouldn't you verify that sop is not one of the operations now
>> handled by xc_logdirty_control()?
>=20
> While I was considering to do this, I couldn't think of a forward
> compatible way, and what I'd like to avoid is having the need to
> update these functions when new ops get added, just to suitably
> also exclude them then. Plus I thought that if someone elected
> the (apparently) wrong function as suiting their need in a
> particular case, why would we put policy in place making this
> impossible?
>=20
>>> -    domctl.u.shadow_op.pages  =3D pages;
>>>        domctl.u.shadow_op.mb     =3D mb ? *mb : 0;
>>>        domctl.u.shadow_op.mode   =3D mode;
>>> -    if (dirty_bitmap !=3D NULL)
>>> +
>>> +    rc =3D do_domctl(xch, &domctl);
>>> +
>>> +    if ( mb )
>>> +        *mb =3D domctl.u.shadow_op.mb;
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +long long xc_logdirty_control(xc_interface *xch,
>>> +                              uint32_t domid,
>>> +                              unsigned int sop,
>>> +                              xc_hypercall_buffer_t *dirty_bitmap,
>>> +                              unsigned long pages,
>>> +                              unsigned int mode,
>>> +                              xc_shadow_op_stats_t *stats)
>>> +{
>>> +    int rc;
>>> +    struct xen_domctl domctl =3D {
>>> +        .cmd         =3D XEN_DOMCTL_shadow_op,
>>> +        .domain      =3D domid,
>>> +        .u.shadow_op =3D {
>>> +            .op    =3D sop,
>>
>> And same here the other way round: sop should really only be one of
>> XEN_DOMCTL_SHADOW_OP_CLEAN or XEN_DOMCTL_SHADOW_OP_PEEK.
>>
>> With that fixed you can add my:
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> Thanks, but I won't take this just yet, awaiting your (and maybe
> others') view(s) on my reply above.

I'm not feeling really strong in this regard. Either way is fine for
me.


Juergen

--------------2975644E5234310E10EA4E22
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

--------------2975644E5234310E10EA4E22--

--rvXqUQHvIvwywINQdLDo2MCHGRRqZV9VE--

--p3sFXMvy9XnIDRU3S40123CfECepCGylj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEeKW0FAwAAAAAACgkQsN6d1ii/Ey8P
GQf/aCLIYtBpIt4dtjnp+KsdbVstatuLbppHFn+vo98TjGKDmqofYfqrzHSY4yWgdWOW+qGPxDMs
wagL5ZChaeJm66JoXRS71vybLe+tQHPV2ak99SQ/OKZ855AVBZ7YhEyDujxn2e/CxKCMNdP4+DfU
z2sKf4upAhEWNyYCAQ6kzvOFUvICi8HDfplE16p+MDJRQSZNz+BQNB203Sfp4uaT/jdZxax72Ueu
9lL/MtjVB0b+jqEIxqMvhE8V/Ljrubtq5jDDMogVBuU3phLcLFr+2Sk6sSN21hUTHSXexjnyRLAL
fxIQ4nBpeJD/ZT3c9JNTv+yW01mY0p31LxOH2/QqLg==
=BduV
-----END PGP SIGNATURE-----

--p3sFXMvy9XnIDRU3S40123CfECepCGylj--

