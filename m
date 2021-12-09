Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411F46E5E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 10:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242854.419981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvG1t-0003eN-6I; Thu, 09 Dec 2021 09:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242854.419981; Thu, 09 Dec 2021 09:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvG1t-0003bX-2P; Thu, 09 Dec 2021 09:47:57 +0000
Received: by outflank-mailman (input) for mailman id 242854;
 Thu, 09 Dec 2021 09:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvG1s-0003bQ-7Y
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 09:47:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14163591-58d5-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 10:47:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7ECD4210DD;
 Thu,  9 Dec 2021 09:47:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3D3C13B2D;
 Thu,  9 Dec 2021 09:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Va6vOMjQsWHDFQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Dec 2021 09:47:52 +0000
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
X-Inumbo-ID: 14163591-58d5-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639043273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1C6zQgjAJeJ96QAqmxMd8NKHmCILXgzUPeajuHhyDyU=;
	b=V9lSMSmLuMTT0snivlo40XUp0WvVbMHpsEOwRKudwnjlGlC1rQct8PhyvL2VVgXlFZwQnQ
	R6QWDaY8l2XAQHr4gdlViMY24qOje3LdZ2t88UslMZ8dfQ/ZdxtpteGWRTztY+Aws+W4x3
	cZVWlD9fNRWZRopa0rtMXJ6lCFShba8=
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209070942.14469-1-jgross@suse.com>
 <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Message-ID: <22ac60e7-7e6c-aa96-f51f-8cfe08b8f62d@suse.com>
Date: Thu, 9 Dec 2021 10:47:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F1WmOZA2hs68Fkzz9PIwHNjQwxQ4bsWnB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F1WmOZA2hs68Fkzz9PIwHNjQwxQ4bsWnB
Content-Type: multipart/mixed; boundary="1FAWMMNHPr9NSI4GtzLxv0XwZpX7nR2qt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <22ac60e7-7e6c-aa96-f51f-8cfe08b8f62d@suse.com>
Subject: Re: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
References: <20211209070942.14469-1-jgross@suse.com>
 <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>
In-Reply-To: <5ce9cdf6-228e-b4e3-f0bd-f64fb89c03dc@suse.com>

--1FAWMMNHPr9NSI4GtzLxv0XwZpX7nR2qt
Content-Type: multipart/mixed;
 boundary="------------FBB0B7555BDE60662B584C43"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FBB0B7555BDE60662B584C43
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.12.21 09:48, Jan Beulich wrote:
> On 09.12.2021 08:09, Juergen Gross wrote:
>> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
>> unconsumed requests or responses instead of a boolean as the name of
>> the macros would imply.
>>
>> As this "feature" is already being used, rename the macros to
>> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
>> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
>> future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
>> boolean (can be activated by defining RING_HAS_UNCONSUMED_IS_BOOL).
>>
>> Note that the known misuses need to be switched to the new
>> RING_NR_UNCONSUMED_*() macros when using this version of ring.h.
>=20
> Is this last statement stale with the introduction of
> RING_HAS_UNCONSUMED_IS_BOOL?

It should rather be modified like:

   Note that the known misuses need to be switched to the new
   RING_NR_UNCONSUMED_*() macros when using the RING_HAS_UNCONSUMED_*()
   variants returning a boolean value.

>=20
>> --- a/xen/include/public/io/ring.h
>> +++ b/xen/include/public/io/ring.h
>> @@ -208,11 +208,11 @@ typedef struct __name##_back_ring __name##_back_=
ring_t
>>       (RING_FREE_REQUESTS(_r) =3D=3D 0)
>>  =20
>>   /* Test if there are outstanding messages to be processed on a ring.=
 */
>> -#define RING_HAS_UNCONSUMED_RESPONSES(_r)                            =
   \
>> +#define RING_NR_UNCONSUMED_RESPONSES(_r)                             =
   \
>>       ((_r)->sring->rsp_prod - (_r)->rsp_cons)
>>  =20
>>   #ifdef __GNUC__
>> -#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                          =
   \
>> +#define RING_NR_UNCONSUMED_REQUESTS(_r) ({                           =
   \
>>       unsigned int req =3D (_r)->sring->req_prod - (_r)->req_cons;    =
      \
>>       unsigned int rsp =3D RING_SIZE(_r) -                            =
      \
>>           ((_r)->req_cons - (_r)->rsp_prod_pvt);                      =
    \
>=20
> To answer the "whether" question this was likely good enough. I wonder
> though whether the use of (_r)->sring->{rsp,req}_prod doesn't require
> further sanitizing of the result as it's now intended to be used as a
> count - afaict the returned values could easily be beyond the number of=

> ring elements when the other end is misbehaving. Or if not bounding
> the values here, I would say the comment in context would need
> updating / extending, to tell consumers that they may not blindly use
> the returned values.

I'll modify the comment:

/*
  * Test if there are outstanding messages to be processed on a ring.
  * The answer is based on values writable by the other side, so further
  * processing should fail gracefully in case the return value was wrong.=

  */

> Also imo all new identifiers would better have a XEN_ prefix to avoid
> further growing the risk of name space clashes. But I can see how this
> would result in inconsistencies with existing names.

Yes, I do see the problem.

Would you support switching all the names to the XEN name space and
adding a section like:

#ifndef XEN_RING_NAMESPACE
/* Following for all macros etc. not in the XEN name space today */
#define x XEN_x
#endif


Juergen

--------------FBB0B7555BDE60662B584C43
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

--------------FBB0B7555BDE60662B584C43--

--1FAWMMNHPr9NSI4GtzLxv0XwZpX7nR2qt--

--F1WmOZA2hs68Fkzz9PIwHNjQwxQ4bsWnB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGx0MgFAwAAAAAACgkQsN6d1ii/Ey9d
5wf/Z5mTEFsMO31BJsObip4ExigAhR+NYakGKWVAno6XaKF2nuW6ypeKz+vnmrYATkDGTR2T9Mvm
65rBoEe/ea3zwne2zOgYvmPw+rUEWC3IxW9QdEmksC3bXXHiDVztXpgAsrn5VjDbD65gwzG66c+p
unUNo6x+2Es+cLhKs+x2XqnJjvSTXHjL5iONbw3AE2aSz9mkwSIhW3G1crZN4upGe4KIIoLcLuLr
p4lDwNSzmWqL0SC47t4OVecUc6yzVExYHx3F/i+8D1ZH6N7qStfd5Hp4I8InrKRmK5YAiVUwbjO8
IqCtp/tGSWgUdBMessMe4C1OJtiOmF1mp1UR8y4eUQ==
=cV0v
-----END PGP SIGNATURE-----

--F1WmOZA2hs68Fkzz9PIwHNjQwxQ4bsWnB--

