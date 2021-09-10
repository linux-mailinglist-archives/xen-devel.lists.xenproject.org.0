Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087B406A37
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184255.332838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdts-0001Uo-3W; Fri, 10 Sep 2021 10:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184255.332838; Fri, 10 Sep 2021 10:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdts-0001Sn-0U; Fri, 10 Sep 2021 10:36:52 +0000
Received: by outflank-mailman (input) for mailman id 184255;
 Fri, 10 Sep 2021 10:36:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOdtp-0001Sh-NP
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:36:49 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00142df0-1223-11ec-b224-12813bfff9fa;
 Fri, 10 Sep 2021 10:36:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 57C2D1FE65;
 Fri, 10 Sep 2021 10:36:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAC4813D29;
 Fri, 10 Sep 2021 10:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qSszNz41O2FOFwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 10:36:46 +0000
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
X-Inumbo-ID: 00142df0-1223-11ec-b224-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631270207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H2VnXoHa2A4K95NUzL7qITQw88USxIzmreaA433cCYQ=;
	b=HR548Zw8DIrBJ/igCxh2VQX2odWSM3fMFY/SXo9k5d2wwRft6NEROE0M2SyIgTThv/c/uc
	Kafb6F8o2BYzI1gnT6G9xbSF4sFE2rnnOcVK7hUw+wgnQDRJ9lTkw6WSJm5kKY5UoVBaLI
	I+BHBnDRL6eAh9GcNYYk7x41wJdP2tw=
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Jan Beulich <jbeulich@suse.com>
References: <20210730103854.12681-1-jgross@suse.com>
 <20210730103854.12681-3-jgross@suse.com> <YTswC2T2cvsEw2dP@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/3] xen/blkfront: don't take local copy of a request
 from the ring page
Message-ID: <ca6e6e23-6e24-38cb-1d06-b25c83767e6d@suse.com>
Date: Fri, 10 Sep 2021 12:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTswC2T2cvsEw2dP@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YDiXBiNt21aKFiTvqXl3q9RqqBf0BQSSN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YDiXBiNt21aKFiTvqXl3q9RqqBf0BQSSN
Content-Type: multipart/mixed; boundary="JUVTtvF3oNKhDqHwfJSukXexFi2WlmUoF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <ca6e6e23-6e24-38cb-1d06-b25c83767e6d@suse.com>
Subject: Re: [PATCH v3 2/3] xen/blkfront: don't take local copy of a request
 from the ring page
References: <20210730103854.12681-1-jgross@suse.com>
 <20210730103854.12681-3-jgross@suse.com> <YTswC2T2cvsEw2dP@mail-itl>
In-Reply-To: <YTswC2T2cvsEw2dP@mail-itl>

--JUVTtvF3oNKhDqHwfJSukXexFi2WlmUoF
Content-Type: multipart/mixed;
 boundary="------------011F05A4CB9DE931D3CC7582"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------011F05A4CB9DE931D3CC7582
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.09.21 12:14, Marek Marczykowski-G=C3=B3recki wrote:
> On Fri, Jul 30, 2021 at 12:38:53PM +0200, Juergen Gross wrote:
>> In order to avoid a malicious backend being able to influence the loca=
l
>> copy of a request build the request locally first and then copy it to
>> the ring page instead of doing it the other way round as today.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> ---
>> V2:
>> - init variable to avoid potential compiler warning (Jan Beulich)
>> ---
>>   drivers/block/xen-blkfront.c | 25 +++++++++++++++----------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront=
=2Ec
>> index 15e840287734..b7301006fb28 100644
>=20
> (...)
>=20
>> @@ -827,10 +832,10 @@ static int blkif_queue_rw_req(struct request *re=
q, struct blkfront_ring_info *ri
>>   	if (setup.segments)
>>   		kunmap_atomic(setup.segments);
>>  =20
>> -	/* Keep a private copy so we can reissue requests when recovering. *=
/
>> -	rinfo->shadow[id].req =3D *ring_req;
>> +	/* Copy request(s) to the ring page. */
>> +	*final_ring_req =3D *ring_req;
>=20
> Is this guaranteed to not be optimized by the compiler in an unsafe way=

> (like, do the operation the other way around)?

I don't think the C standard allows that. AFAIK reordering writes is
allowed only between sequence points. And each external function call is
a sequence point, making such an optimization in our case illegal.


Juergen

--------------011F05A4CB9DE931D3CC7582
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

--------------011F05A4CB9DE931D3CC7582--

--JUVTtvF3oNKhDqHwfJSukXexFi2WlmUoF--

--YDiXBiNt21aKFiTvqXl3q9RqqBf0BQSSN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE7NT4FAwAAAAAACgkQsN6d1ii/Ey8t
2gf+N+WivElKoy9i6Whxd4rrrfEgFb+GzHmhiPCJfNEpstG02jsb0k43eda74wAcdEVpHl7EIG7i
8gBbJwSxH5ZAm295X5wMia00fFtlyppP5uinCToZsE/sbGx2nOCako4HrVNfCzP16R6tXclaY9ho
0dvWYDCF/owSYAzT5OgDkSxVRRqLbZz1CnjFtVRDgp/UXCPJnehCMZ1nxBh6HNBBLPgrE6YldLqN
HzkEqs4n3CBFGOD7BzZ25UbLS7PH+JGDWaEWk1ZLFZFm1unwxM5qn42FQf0f0IvrAGAS3WNiq7Nh
Al23xfAoUu3Nulw+cTq3M2avOvoC5C5/y4XeC8aGSg==
=Dr55
-----END PGP SIGNATURE-----

--YDiXBiNt21aKFiTvqXl3q9RqqBf0BQSSN--

