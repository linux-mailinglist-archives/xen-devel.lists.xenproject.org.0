Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B63448202
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223395.386086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5rN-0001mb-8u; Mon, 08 Nov 2021 14:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223395.386086; Mon, 08 Nov 2021 14:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5rN-0001ki-5v; Mon, 08 Nov 2021 14:42:57 +0000
Received: by outflank-mailman (input) for mailman id 223395;
 Mon, 08 Nov 2021 14:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6W=P3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mk5rL-0001kc-Th
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:42:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2825c06d-40a2-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 15:42:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A2581FDBB;
 Mon,  8 Nov 2021 14:42:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F163613BA0;
 Mon,  8 Nov 2021 14:42:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dImkOW03iWFwLgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Nov 2021 14:42:53 +0000
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
X-Inumbo-ID: 2825c06d-40a2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636382574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcEmR69RYiKNTQK4p0BOaaLKED4EZ82QxHW1dCHXPTM=;
	b=G2RD/OFygLQ3a0Hkj7DNcRUdZKxdR3fqzBXxO4usiRfQBWhfjPPdBv8vrUPjTYYg1JbfgT
	dxHgIRAX96gFxkXYBac+SuY1AIiV608pV0WFOm0uV/gGidlrQs1eCXFFFmeuMb+FRcYyN8
	Ld1XsMER0agQ8RMn/w6MD1kYZKsstFc=
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211103102059.19621-1-jgross@suse.com>
 <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d4fd17ef-1f33-8e7e-7aab-dff326062fd9@suse.com>
Date: Mon, 8 Nov 2021 15:42:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vZLzA7Sl0FlaL4i0FMgvRFe3FEB5B3dan"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vZLzA7Sl0FlaL4i0FMgvRFe3FEB5B3dan
Content-Type: multipart/mixed; boundary="DxzpoZY4dMC4Yf0mASqJnRevYWQw1n0Oy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <d4fd17ef-1f33-8e7e-7aab-dff326062fd9@suse.com>
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
References: <20211103102059.19621-1-jgross@suse.com>
 <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>
In-Reply-To: <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>

--DxzpoZY4dMC4Yf0mASqJnRevYWQw1n0Oy
Content-Type: multipart/mixed;
 boundary="------------7E0BF4E9D171F6EE4DC427F9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7E0BF4E9D171F6EE4DC427F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.11.21 16:42, Jan Beulich wrote:
> On 03.11.2021 11:20, Juergen Gross wrote:
>> Instead of repeating similar data multiple times use a single source
>> file and a generator script for producing prototypes and call sequence=
s
>> of the hypercalls.
>>
>> As the script already knows the number of parameters used add generati=
ng
>> a macro for populating an array with the number of parameters per
>> hypercall.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> What's missing here now that you have introduced priorities is how you
> did arrive at the chosen values. That's a pretty important aspect,
> especially if someone would later want to adjust these.

Will include the measured data in next version's commit message.

> Just one further remark from looking at the output of the script (thank=
s
> for making that available):
>=20
>> +# Generate the output
>> +END {
>> +    # Verbatim generated lines
>> +    for (i =3D 1; i <=3D e; i++)
>> +        printf("%s\n", emit[i]);
>> +    printf("\n");
>> +    # Generate prototypes
>> +    for (i =3D 1; i <=3D n; i++) {
>> +        for (p =3D 1; p <=3D n_pre[i]; p++) {
>> +            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i])=
;
>> +            if (n_args[i] =3D=3D 0)
>> +                printf("void");
>> +            else
>> +                for (j =3D 1; j <=3D n_args[i]; j++) {
>> +                    if (j > 1)
>> +                        printf(", ");
>> +                    if (ptr[i, j])
>> +                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j=
]);
>> +                    else
>> +                        printf("%s", typ[i, j]);
>> +                    printf(" %s", arg[i, j]);
>> +                }
>> +            printf(");\n");
>> +        }
>> +    }
>> +    # Generate call sequences and args array contents
>> +    for (ca in caller) {
>> +        if (caller[ca] !=3D 1)
>> +            continue;
>> +        need_mask =3D 0;
>> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++) {
>> +            for (pll =3D pl; pll > 1; pll--) {
>> +                if (prio_list[ca, pl] > p_list[pll - 1])
>> +                    break;
>> +                else
>> +                    p_list[pll] =3D p_list[pll - 1];
>> +            }
>> +            p_list[pll] =3D prio_list[ca, pl];
>> +            # If any prio but the default one has more than 1 entry w=
e need "mask"
>> +            if (p_list[pll] !=3D 100 && prios[ca, p_list[pll]] > 1)
>> +                need_mask =3D 1;
>> +        }
>> +        printf("\n");
>> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5=
) \\\n", ca);
>> +        printf("{ \\\n");
>> +        if (need_mask)
>> +            printf("    uint64_t mask =3D 1ULL << num; \\\n");
>> +        printf("    ");
>> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++) {
>> +            if (prios[ca, p_list[pl]] > 1) {
>> +                if (pl < n_prios[ca]) {
>> +                    printf("if ( likely(mask & (%s)) ) \\\n", prio_ma=
sk[ca, p_list[pl]]);
>> +                    printf("    { \\\n");
>> +                }
>> +                if (prios[ca, p_list[pl]] =3D=3D 2) {
>> +                    fnd =3D 0;
>> +                    for (i =3D 1; i <=3D nc; i++)
>> +                        if (call[i] =3D=3D ca && call_prio[i] =3D=3D =
p_list[pl]) {
>> +                            fnd++;
>> +                            if (fnd =3D=3D 1)
>> +                                printf("        if ( num =3D=3D __HYP=
ERVISOR_%s ) \\\n", fn[call_fn[i]]);
>> +                            else
>> +                                printf("        else \\\n");
>> +                            do_call(call_fn[i], call_p[i]);
>> +                        }
>> +                } else {
>> +                    do_switch(ca, p_list[pl]);
>> +                }
>> +                if (pl < n_prios[ca])
>> +                    printf("    } \\\n");
>> +            } else {
>> +                for (i =3D 1; i <=3D nc; i++)
>> +                    if (call[i] =3D=3D ca && call_prio[i] =3D=3D p_li=
st[pl]) {
>> +                        printf("if ( likely(num =3D=3D __HYPERVISOR_%=
s) ) \\\n", fn[call_fn[i]]);
>> +                        do_call(call_fn[i], call_p[i]);
>> +                    }
>> +            }
>> +            if (pl < n_prios[ca] || prios[ca, p_list[pl]] <=3D 2)
>> +                printf("    else ");
>=20
> I think there's a line continuation escape + newline missing here.

Yes and no.

This can either continue with another "if" clause not wanting a new
line or with a final ending statement (either a "switch" or a
"ret =3D -ENOSYS"), which probably would want the new line. Adding
code for handling both cases is possible, but I'm not sure it is
worth it. In case you are preferring an unconditional new line,
this would be easy to arrange, of course.


Juergen

--------------7E0BF4E9D171F6EE4DC427F9
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

--------------7E0BF4E9D171F6EE4DC427F9--

--DxzpoZY4dMC4Yf0mASqJnRevYWQw1n0Oy--

--vZLzA7Sl0FlaL4i0FMgvRFe3FEB5B3dan
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGJN20FAwAAAAAACgkQsN6d1ii/Ey+M
KwgAlqJ+6/7k1iCmMogFMPYQDlZypYUyzMOcH7PG8EHn/c8u2dqvy3SU+KHzWJZh1n6cTIyzrjBz
7r3uADhwF73lxSjn9JxaKlmOvwPi8kF35RTM1iV1KUldQ7sS0417Jw6UBHbqAa4AlBF6cnb/W6Vj
3XNRwX41TU0WDBhQbCiZ+f+xg8q3uo3zmAR4THOiE8DOvstS7Wjf07ToqxwnJxvmwJPKRGugiiPN
Nf9Rv8q4rEl/SeOuXkGfADPNT5BXuQx48+hxCWu7rdyFvi0lFMYqucyEvYirZpDJ9BDxYvjXD0Xk
8cn+/VPU1K5dD8LWx/ELBlHF4kwO5x+d4t+aV0p2XQ==
=oxDi
-----END PGP SIGNATURE-----

--vZLzA7Sl0FlaL4i0FMgvRFe3FEB5B3dan--

