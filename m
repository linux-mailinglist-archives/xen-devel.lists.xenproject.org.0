Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421846E92F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243048.420336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJXN-0007nD-VK; Thu, 09 Dec 2021 13:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243048.420336; Thu, 09 Dec 2021 13:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJXN-0007kS-SJ; Thu, 09 Dec 2021 13:32:41 +0000
Received: by outflank-mailman (input) for mailman id 243048;
 Thu, 09 Dec 2021 13:32:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvJXM-0007kE-6H
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:32:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a51fbcb-58f4-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 14:32:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7DC5210FD;
 Thu,  9 Dec 2021 13:32:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B6B713343;
 Thu,  9 Dec 2021 13:32:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S/WoHHYFsmFjBgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Dec 2021 13:32:38 +0000
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
X-Inumbo-ID: 7a51fbcb-58f4-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639056758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/PCx5clS83OumSRjV1iCy770FqT+zzftFolon9W6aPg=;
	b=gUVlEEAcByoMornVJfqypqFb5dFjkG7nqqcVV7gN/DBGsJ9LcpxldzyRnKHGFvGPuFr25E
	LZp4/LY3JGdJ4juZI3jpQNHjlgllzJIBrslNmVTJHTCo66k/YeVyEOiwbqowg+Ld9Davsu
	yOLRWNHbDffpERndomd0jRIVp4C0qoc=
Subject: Re: [PATCH] tools/libs/ctrl: Save errno only once in *PRINTF() and
 *ERROR()
To: Jan Beulich <jbeulich@suse.com>
Cc: anthony.perard@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209120939.513-1-jgross@suse.com>
 <0129a25b-4563-1f54-5419-f1dde8680245@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2e3ca440-200c-69e4-d74b-63e5a865f719@suse.com>
Date: Thu, 9 Dec 2021 14:32:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0129a25b-4563-1f54-5419-f1dde8680245@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nSCjXOA1L5Iy9rl3YG1z0D3jQIErsNwgg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nSCjXOA1L5Iy9rl3YG1z0D3jQIErsNwgg
Content-Type: multipart/mixed; boundary="mZrHutFNvJ29tZYzhAVAeaa32rzXwGNY1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: anthony.perard@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <2e3ca440-200c-69e4-d74b-63e5a865f719@suse.com>
Subject: Re: [PATCH] tools/libs/ctrl: Save errno only once in *PRINTF() and
 *ERROR()
References: <20211209120939.513-1-jgross@suse.com>
 <0129a25b-4563-1f54-5419-f1dde8680245@suse.com>
In-Reply-To: <0129a25b-4563-1f54-5419-f1dde8680245@suse.com>

--mZrHutFNvJ29tZYzhAVAeaa32rzXwGNY1
Content-Type: multipart/mixed;
 boundary="------------96BD223ADCC756DA92601777"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------96BD223ADCC756DA92601777
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.12.21 14:31, Jan Beulich wrote:
> On 09.12.2021 13:09, Juergen Gross wrote:
>> All *PRINTF() and *ERROR() macros are based on xc_reportv() which is
>> saving and restoring errno in order to not modify it. There is no need=

>> to save and restore in those macros, too.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Albeit ...
>=20
>> --- a/tools/libs/ctrl/xc_private.h
>> +++ b/tools/libs/ctrl/xc_private.h
>> @@ -122,28 +122,18 @@ void xc_report_progress_step(xc_interface *xch,
>>  =20
>>   /* anamorphic macros:  struct xc_interface *xch  must be in scope */=

>>  =20
>> -#define IPRINTF(_f, _a...)  do { int IPRINTF_errno =3D errno; \
>> -        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a); \=

>> -        errno =3D IPRINTF_errno; \
>> -        } while (0)
>> -#define DPRINTF(_f, _a...) do { int DPRINTF_errno =3D errno; \
>> -        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a);=
 \
>> -        errno =3D DPRINTF_errno; \
>> -        } while (0)
>> -#define DBGPRINTF(_f, _a...)  do { int DBGPRINTF_errno =3D errno; \
>> -        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a); =
\
>> -        errno =3D DBGPRINTF_errno; \
>> -        } while (0)
>> -
>> -#define ERROR(_m, _a...)  do { int ERROR_errno =3D errno; \
>> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a ); \
>> -        errno =3D ERROR_errno; \
>> -        } while (0)
>> -#define PERROR(_m, _a...) do { int PERROR_errno =3D errno; \
>> +#define IPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a)
>> +#define DPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a)
>> +#define DBGPRINTF(_f, _a...) \
>> +        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a)
>> +
>> +#define ERROR(_m, _a...) \
>> +        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a )
>> +#define PERROR(_m, _a...) \
>>           xc_report_error(xch,XC_INTERNAL_ERROR,_m " (%d =3D %s)", \
>> -        ## _a , errno, xc_strerror(xch, errno)); \
>> -        errno =3D PERROR_errno; \
>> -        } while (0)
>> +                        ## _a , errno, xc_strerror(xch, errno))
>=20
> ... while I realize you only stripped only semicolons and line
> continuations, but I would find it quite desirable to also get the
> use of blanks straightened at this occasion: In a number of cases
> commas aren't followed by blanks and (instead?) sometimes are
> preceded by ones. It doesn't seem very likely to me that this
> would be intentional.

Let me resend it with proper style corrections.


Juergen

--------------96BD223ADCC756DA92601777
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

--------------96BD223ADCC756DA92601777--

--mZrHutFNvJ29tZYzhAVAeaa32rzXwGNY1--

--nSCjXOA1L5Iy9rl3YG1z0D3jQIErsNwgg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGyBXUFAwAAAAAACgkQsN6d1ii/Ey/J
Zgf/aBQjocylAbk18PybAQfZ1OpTFPPqxAMkUC9Cfzw7+0jSuTO2WbA4k1qWBGQByOiClDpB/Bqg
z2K8iFkzNSiD8mmTQvsRNHyg41r3QIL9Nep9Dwv8kERjTp021bniZ+Ptf/HHCDdb4y8ybfvjGvtC
pLyk3l6Eps5fpRPZki9IbwcSjYU5tEcCmpciNzQhdEdbjLRA2XhgFoszAfLF7piURGpEXWxcrsl0
UQru1WDDneq2Ze5G8rpl23vgRv6K1Tnozk3PSoOhoH5tfyWTsoftxtwinylkVxQDmImVs46TqzCG
aTHvqZYsTfV0Q/jl5VYytFjtpFTUHS4VVpUyyTeMaA==
=Gctz
-----END PGP SIGNATURE-----

--nSCjXOA1L5Iy9rl3YG1z0D3jQIErsNwgg--

