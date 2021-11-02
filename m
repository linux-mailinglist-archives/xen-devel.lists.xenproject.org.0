Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3E442849
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 08:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219727.380684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoA1-0005Sa-5R; Tue, 02 Nov 2021 07:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219727.380684; Tue, 02 Nov 2021 07:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhoA1-0005Qm-2P; Tue, 02 Nov 2021 07:24:45 +0000
Received: by outflank-mailman (input) for mailman id 219727;
 Tue, 02 Nov 2021 07:24:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hRh8=PV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mho9z-0005Qe-0e
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 07:24:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1a9b474-3bad-11ec-8552-12813bfff9fa;
 Tue, 02 Nov 2021 07:24:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8D6C1FD75;
 Tue,  2 Nov 2021 07:24:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A006A13B73;
 Tue,  2 Nov 2021 07:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BLCxJbjngGHKSwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Nov 2021 07:24:40 +0000
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
X-Inumbo-ID: f1a9b474-3bad-11ec-8552-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635837880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nfd9l8MOWGKmx9B3YQFK9b+nq7acUYVVksS8gM6SVE=;
	b=NqkChFjCGvfFWXuMqvxAd2ovY+nbYvqGPY3iJ+vbKYbkqjcu7LpWdTfjlTWaAn5KvUSSzR
	f0WKNtWO8apOc65aeK2GE5JADfZCCSA0zQJrsF2uioE+oZMe050FjZKeWiNWj9PlKT3+Kl
	Ct5DcpZjnK00ZzI8dCfwT+yJHk6hf64=
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-8-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 07/15] xen: generate hypercall interface related code
Message-ID: <8c3869ea-c1dd-76fc-58d6-90cad2f9343c@suse.com>
Date: Tue, 2 Nov 2021 08:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211101152015.28488-8-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LQw8KKZjaOpLi5bqu1P6YblIXvW3ANaBz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LQw8KKZjaOpLi5bqu1P6YblIXvW3ANaBz
Content-Type: multipart/mixed; boundary="UMuxOu4mYBOSsTabZpFLO3rDt7rbh0c1S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <8c3869ea-c1dd-76fc-58d6-90cad2f9343c@suse.com>
Subject: Re: [PATCH v2 07/15] xen: generate hypercall interface related code
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-8-jgross@suse.com>
In-Reply-To: <20211101152015.28488-8-jgross@suse.com>

--UMuxOu4mYBOSsTabZpFLO3rDt7rbh0c1S
Content-Type: multipart/mixed;
 boundary="------------EEEA9A09CC5E205C3F33E7CF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EEEA9A09CC5E205C3F33E7CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.11.21 16:20, Juergen Gross wrote:
> Instead of repeating similar data multiple times use a single source
> file and a generator script for producing prototypes and call sequences=

> of the hypercalls.
>=20
> As the script already knows the number of parameters used add generatin=
g
> a macro for populating an array with the number of parameters per
> hypercall.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - split platform_op for doe and compat prefixes (Jan Beulich)
> - add "addline:" directive
> - add priorities to handlers (Jan Beulich)
> ---
>   .gitignore                    |   1 +
>   xen/Makefile                  |  10 ++
>   xen/include/hypercall-defs.c  | 285 +++++++++++++++++++++++++++++++
>   xen/scripts/gen_hypercall.awk | 306 +++++++++++++++++++++++++++++++++=
+
>   4 files changed, 602 insertions(+)
>   create mode 100644 xen/include/hypercall-defs.c
>   create mode 100644 xen/scripts/gen_hypercall.awk
>=20

=2E..

> diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.=
awk
> new file mode 100644
> index 0000000000..26017c0900
> --- /dev/null
> +++ b/xen/scripts/gen_hypercall.awk

=2E..

> +    # Generate call sequences and args array contents
> +    for (ca in caller) {
> +        if (caller[ca] !=3D 1)
> +            continue;
> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++)
> +            p_list[pl] =3D prio_list[ca, pl];
> +        asort(p_list, p_list, "@val_num_asc");
> +        need_mask =3D 0;
> +        # If any prio but the default one has more than 1 entry we nee=
d "mask"
> +        for (pl =3D 1; pl < n_prios[ca]; pl++) {
> +            if (prios[ca, p_list[pl]] > 1)
> +                need_mask =3D 1;
> +        }
> +        printf("\n");
> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5)=
 \\\n", ca);
> +        printf("{ \\\n");
> +        if (need_mask)
> +            printf("    uint64_t mask =3D 1ULL << num; \\\n");
> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++) {
> +            if (prios[ca, p_list[pl]] > 1) {
> +                if (pl < n_prios[ca]) {
> +                    printf("if ( likely(mask & (%s)) ) \\\n", prio_mas=
k[ca, p_list[pl]]);
> +                    printf("    { \\\n");
> +                }
> +                do_switch(ca, p_list[pl]);
> +                if (pl < n_prios[ca])
> +                    printf("    } \\\n");

I've found another optimization for the case of 2 hypercalls with the
same priority: in this case "if ( ) ... else ..." is the better choice.

> +            } else {
> +                for (i =3D 1; i <=3D nc; i++)
> +                    if (call[i] =3D=3D ca && call_prio[i] =3D=3D p_lis=
t[pl]) {
> +                        printf("if ( likely(num =3D=3D __HYPERVISOR_%s=
) ) \\\n", fn[call_fn[i]]);
> +                        printf("    { \\\n");
> +                        do_call(call_fn[i], call_p[i]);
> +                        printf("    } \\\n");
> +                    }
> +            }
> +            if (pl < n_prios[ca] || prios[ca, pl] =3D=3D 1)
> +                printf("    else ");
> +        }
> +        if (prios[ca, p_list[n_prios[ca]]] =3D=3D 1) {
> +            printf("\\\n");
> +            printf("        ret =3D -ENOSYS; \\\n");
> +        }
> +        printf("}\n");

Here a "delete p_list;" is missing in order to avoid stale array
elements in the next round.

I'll send an update of this patch.


Juergen

--------------EEEA9A09CC5E205C3F33E7CF
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

--------------EEEA9A09CC5E205C3F33E7CF--

--UMuxOu4mYBOSsTabZpFLO3rDt7rbh0c1S--

--LQw8KKZjaOpLi5bqu1P6YblIXvW3ANaBz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGA57cFAwAAAAAACgkQsN6d1ii/Ey+W
Fgf/bwhYWeGPlzH2IVf3s8y9uusUPc8W2wSvozs2T0mCSPjAeqUcXPeTD4ziS7493utlV+miXO3u
GMv+m6Ayth0VyyMVc6WEoNMjQwI/YHmYfhtUUp3eaQGKioV74x3QJnhkfcyKc/h6oAF31JBZB7Nr
GGGjbzfCP5qeG5Azh9VlWIFyRgLjZNT1ljn65vLc/6HjeezSHXws3apBhABY9w8wMmgBuK78QYqc
YiWobasmB2yXh3pcUyCu6uBIZRIbXnIaSPuZyMP+6PDtCoFMmejhcIHwLk9qYbJn/5T5xwf3vX6K
4W85/tSLXoH4bhFFYMatwNPZHYLl/b4GWGa/ETHVoA==
=8SSk
-----END PGP SIGNATURE-----

--LQw8KKZjaOpLi5bqu1P6YblIXvW3ANaBz--

