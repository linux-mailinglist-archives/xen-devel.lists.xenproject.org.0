Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03D46E6D5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242923.420101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGrn-0008La-Qs; Thu, 09 Dec 2021 10:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242923.420101; Thu, 09 Dec 2021 10:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGrn-0008J2-MQ; Thu, 09 Dec 2021 10:41:35 +0000
Received: by outflank-mailman (input) for mailman id 242923;
 Thu, 09 Dec 2021 10:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvGrm-0008Iv-9w
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:41:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9376d987-58dc-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 11:41:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF2AE1F37D;
 Thu,  9 Dec 2021 10:41:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C971C13B2D;
 Thu,  9 Dec 2021 10:41:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gCT9LlzdsWGVMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Dec 2021 10:41:32 +0000
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
X-Inumbo-ID: 9376d987-58dc-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639046492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x8J8pxNxNS3q2xeYoZQ/d6RlkkS5ENguXg6/ooUFECw=;
	b=hYHEwxwRd4VtAdRqf9WzYWhe2F5nANxomQuhjRFTo2IDfrXliHlbDmuIaKDN0kEUejljVa
	m7KkhBrRk1w9R6Hky/wQVPOyCPTupj13Z7AYYcIqTfNNw4dd0jRq3PFKvJqki+2mMjB51L
	nUeE9oqTixXe0QNRwPsTYgJIN6SkhZw=
Subject: Re: [PATCH] libxc: avoid clobbering errno in xc_domain_pod_target()
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <912e2574-2adf-25cf-498f-86a86f31c30d@suse.com>
 <2d608da3-af66-e836-c720-aa0fa31375cd@suse.com>
Message-ID: <d0c46d33-f51d-e9bc-0f4f-8f7d297fd8fc@suse.com>
Date: Thu, 9 Dec 2021 11:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2d608da3-af66-e836-c720-aa0fa31375cd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ILKAE6IAlXuDEScMalNLy23iWFhX4Oe5T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ILKAE6IAlXuDEScMalNLy23iWFhX4Oe5T
Content-Type: multipart/mixed; boundary="Z9XHsk2EFBEpFywuqUjHskKE63n8mOg99";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Message-ID: <d0c46d33-f51d-e9bc-0f4f-8f7d297fd8fc@suse.com>
Subject: Re: [PATCH] libxc: avoid clobbering errno in xc_domain_pod_target()
References: <912e2574-2adf-25cf-498f-86a86f31c30d@suse.com>
 <2d608da3-af66-e836-c720-aa0fa31375cd@suse.com>
In-Reply-To: <2d608da3-af66-e836-c720-aa0fa31375cd@suse.com>

--Z9XHsk2EFBEpFywuqUjHskKE63n8mOg99
Content-Type: multipart/mixed;
 boundary="------------6045785A24A750DDF2C502E7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6045785A24A750DDF2C502E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.12.21 11:36, Juergen Gross wrote:
> On 09.12.21 11:26, Jan Beulich wrote:
>> do_memory_op() supplies return value and has errno set the usual way.
>> Don't overwrite errno with 1 (aka EPERM on at least Linux).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> An alternative would be to let go of the DPRINTK() and leave errno and=

>> err alone altogether. While the hypervisor side of the hypercall gives=

>> the impression of being able to return positive values as of
>> 637a283f17eb ("PoD: Allow pod_set_cache_target hypercall to be
>> preempted"), due to the use of "rc >=3D 0" there, afaict that's not
>> actually the case. IOW "err" can really only be 0 or -1 here.
>>
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -1231,10 +1231,11 @@ static int xc_domain_pod_target(xc_inter
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( err < 0 )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D errno;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DPRINTF("Failed=
 %s_pod_target dom %d\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (op=3D=3DXENMEM_set_pod_target)?"set":"get=
",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domid);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D -err;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D err;
>=20
> DPRINTF() won't change errno, so I think you should just drop the line
> overwriting errno.

In fact you added the 3rd layer of errno saving here. :-)

DPRINTF() and friends will save errno, and the underlying
xc_report*() functions will do so, too.

Writing a patch to remove the saving at the macro layer...


Juergen

--------------6045785A24A750DDF2C502E7
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

--------------6045785A24A750DDF2C502E7--

--Z9XHsk2EFBEpFywuqUjHskKE63n8mOg99--

--ILKAE6IAlXuDEScMalNLy23iWFhX4Oe5T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGx3VwFAwAAAAAACgkQsN6d1ii/Ey/G
PQf/Qdo6DqKJx+GJ1xiA9vo6ktDJIkBqvNuxxKDBFuDcCSwuQMv/xCkQ7fX34N9k40EJsK1FBH40
XRAz1USaPC+pCxdKiDNDlTiEsv3uVoqfrfDIzqMCx63PLY3NAd5QPKq/GL+zSpVjTHgAeLOlI5Y0
G0d29F957khm7cwZRGa+ZKkFhsRJ9KQG+QQ2xDLdrbYsNzXD7srgQG/RovqjCJCCt2b/awsdDqJn
NT30ANZDXlNEXuimWaBWHp6UpoxICOE30yj0S1MsNRDrElR1QjY51KykNHpz+/LgCi3UhkAZCB/n
57shIZZTm2B6iW4INxmJkU2mcPryc2IZCVLXe8x98A==
=Z/Am
-----END PGP SIGNATURE-----

--ILKAE6IAlXuDEScMalNLy23iWFhX4Oe5T--

