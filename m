Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FC40F298
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188960.338387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7eu-0007HW-Rp; Fri, 17 Sep 2021 06:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188960.338387; Fri, 17 Sep 2021 06:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7eu-0007Ep-Nz; Fri, 17 Sep 2021 06:47:40 +0000
Received: by outflank-mailman (input) for mailman id 188960;
 Fri, 17 Sep 2021 06:47:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+lGq=OH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mR7et-0007Ej-1X
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:47:39 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24da1c70-1783-11ec-b66e-12813bfff9fa;
 Fri, 17 Sep 2021 06:47:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 831D222308;
 Fri, 17 Sep 2021 06:47:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F7EB13A79;
 Fri, 17 Sep 2021 06:47:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9lIYFgg6RGFIAwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Sep 2021 06:47:36 +0000
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
X-Inumbo-ID: 24da1c70-1783-11ec-b66e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631861256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7qVzWrfbaR+Cg64eoCijjDHD1M0KvPoMaiopVbnFuU=;
	b=Vhqe6a8nWSD3IgvToxpXIU6pRO+rtloeF1LMWpZ60SJy45ZMhxdCVPiY/WRZbQ3ihEtvFt
	IB2UgDb8NGGq9bfqhDhoZ/WCLQ6d7b0J230Iz/AG+xD6OF18Pf5fNlnd0KKkuJnFN+nibV
	M6sPXFC4jtt/GV2Z9NgsDD70vUdmRXM=
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
 <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
 <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <62ccf5b7-b903-e604-d113-67c7633278cd@suse.com>
Date: Fri, 17 Sep 2021 08:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TfFI4OElXqzn9AyCgez8IR0kpl6ts1NgM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TfFI4OElXqzn9AyCgez8IR0kpl6ts1NgM
Content-Type: multipart/mixed; boundary="VyKTfuTUEuumpyk746zj4W8NilR2uKD3Y";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <62ccf5b7-b903-e604-d113-67c7633278cd@suse.com>
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
 <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
 <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
In-Reply-To: <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>

--VyKTfuTUEuumpyk746zj4W8NilR2uKD3Y
Content-Type: multipart/mixed;
 boundary="------------279F817B8478DF0B10F430EA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------279F817B8478DF0B10F430EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.09.21 08:40, Jan Beulich wrote:
> On 17.09.2021 03:34, Boris Ostrovsky wrote:
>>
>> On 9/16/21 11:04 AM, Jan Beulich wrote:
>>>   {
>>>   	const struct desc_ptr *desc =3D this_cpu_ptr(&idt_desc);
>>> +	unsigned i, count =3D (desc->size + 1) / sizeof(gate_desc);
>>>  =20
>>> -	xen_convert_trap_info(desc, traps);
>>
>>
>> Can you instead add a boolean parameter to xen_convert_trap_info() to =
indicate whether to skip empty entries? That will avoid (almost) duplicat=
ing the code.
>=20
> I can, sure, but I specifically didn't, as the result is going to be le=
ss
> readable imo. Instead I was considering to fold xen_convert_trap_info()=

> into its only remaining caller. Yet if you're convinced adding the
> parameter is the way to do, I will go that route. But please confirm.

I don't think the result will be very hard to read. All you need is the
new parameter and extending the if statement in xen_convert_trap_info()
to increment out always if no entry is to be skipped.


Juergen


--------------279F817B8478DF0B10F430EA
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

--------------279F817B8478DF0B10F430EA--

--VyKTfuTUEuumpyk746zj4W8NilR2uKD3Y--

--TfFI4OElXqzn9AyCgez8IR0kpl6ts1NgM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFEOgcFAwAAAAAACgkQsN6d1ii/Ey9s
Swf/Wk16JCMb8ogQrim92gEAKYI2AW6QlgvCrEGd3sApOLn4HTxXnwYxrMx7wRG7O3HTRAiVIAQ7
jY3wklehZDwGJdH8B2h5MzJHs8Y3M+Hnts1ik9QhOu0UGw01nIXSsm9gaMxmfBegNFBKhIlZE6zU
eySBIglvguNlavrPPvWGY/xFTnBy8E0l71bjX8ScVYjwfakcAzkaUePf6JksR+/xXd/BcIa1bJHK
dMBwvSW6wQ6h1N0YO4hDXXzn7iad0/mTpVIzc7rSRZIP3ROM0yaFL3UHI1cJvzapD4O1e/ewWMNZ
IOltcX1UAhUOo43cTstKqo+mhxUEvQcA11hRbx0OMg==
=zSeB
-----END PGP SIGNATURE-----

--TfFI4OElXqzn9AyCgez8IR0kpl6ts1NgM--

