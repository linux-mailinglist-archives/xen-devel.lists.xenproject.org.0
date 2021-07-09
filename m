Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AC3C2552
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 15:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153684.283914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1qxT-0004hV-GG; Fri, 09 Jul 2021 13:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153684.283914; Fri, 09 Jul 2021 13:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1qxT-0004ev-D9; Fri, 09 Jul 2021 13:54:23 +0000
Received: by outflank-mailman (input) for mailman id 153684;
 Fri, 09 Jul 2021 13:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kUe=MB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1qxS-0004ep-83
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 13:54:22 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e3ff2b-84cc-4645-a0d9-9e1db1308da2;
 Fri, 09 Jul 2021 13:54:21 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BA3D22312;
 Fri,  9 Jul 2021 13:54:20 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 48851137F8;
 Fri,  9 Jul 2021 13:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id h+nnDwxV6GAqeAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 09 Jul 2021 13:54:20 +0000
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
X-Inumbo-ID: a5e3ff2b-84cc-4645-a0d9-9e1db1308da2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625838860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pYcFbzVs+nt+UrJKaNfGtZEdh6esdWkryDHl6n/wINE=;
	b=s+Wbabp+Rpuft2Pb34V0GfC9WZ2FiaSCQOPCDKhvFQy7GFymlxbHPzz2yI5kKWz1Zsnljv
	JxzirPWhEMense2vHjfCO3rOWYkF46aHBlL+v4kFgRu0WrKz29Kkdy7N4vuOAPUV4q/Yl1
	Uw8dXx/HbuUscaxyrYDMC4ErzzHgnG8=
Subject: Re: [PATCH v2 2/3] xen/blkfront: don't take local copy of a request
 from the ring page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Jan Beulich <jbeulich@suse.com>
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-3-jgross@suse.com> <YOgPCZbEF+t5DN+G@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
Message-ID: <57f50e6f-4fc4-7318-9f7f-c5b4e0e63487@suse.com>
Date: Fri, 9 Jul 2021 15:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOgPCZbEF+t5DN+G@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rmyaqJHSnZ9Q2teyceTX9GLRzbIdvZGdC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rmyaqJHSnZ9Q2teyceTX9GLRzbIdvZGdC
Content-Type: multipart/mixed; boundary="V2YEAoLTDoiLiUaHWQ3PyouYqQ5WXYqkP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <57f50e6f-4fc4-7318-9f7f-c5b4e0e63487@suse.com>
Subject: Re: [PATCH v2 2/3] xen/blkfront: don't take local copy of a request
 from the ring page
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-3-jgross@suse.com> <YOgPCZbEF+t5DN+G@Air-de-Roger>
In-Reply-To: <YOgPCZbEF+t5DN+G@Air-de-Roger>

--V2YEAoLTDoiLiUaHWQ3PyouYqQ5WXYqkP
Content-Type: multipart/mixed;
 boundary="------------394D9FD2988C5A38C6586243"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------394D9FD2988C5A38C6586243
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.07.21 10:55, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jul 08, 2021 at 02:43:44PM +0200, Juergen Gross wrote:
>> In order to avoid a malicious backend being able to influence the loca=
l
>> copy of a request build the request locally first and then copy it to
>> the ring page instead of doing it the other way round as today.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrx.com>
>=20
> Thanks!
>=20
> One unrelated comment below.
>=20

=2E..

>> @@ -798,7 +801,9 @@ static int blkif_queue_rw_req(struct request *req,=
 struct blkfront_ring_info *ri
>>   		ring_req->u.rw.nr_segments =3D num_grant;
>>   		if (unlikely(require_extra_req)) {
>>   			extra_id =3D blkif_ring_get_request(rinfo, req,
>> -							  &extra_ring_req);
>> +							  &final_extra_ring_req);
>> +			extra_ring_req =3D &rinfo->shadow[extra_id].req;
>=20
> I'm slightly confused about this extra request stuff because I cannot
> find any check that asserts we have two empty slots on the ring before
> getting here (I only see a RING_FULL check in blkif_queue_rq).
>=20
> This is AFAIK only used on Arm when guest page size > 4KB.

I agree that this is a bug and should be fixed.


Juergen

--------------394D9FD2988C5A38C6586243
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

--------------394D9FD2988C5A38C6586243--

--V2YEAoLTDoiLiUaHWQ3PyouYqQ5WXYqkP--

--rmyaqJHSnZ9Q2teyceTX9GLRzbIdvZGdC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDoVQsFAwAAAAAACgkQsN6d1ii/Ey8N
3wf9EH4Rre+cHR2SHXBP//TGxZRVnHAgv6Coa8591dXk0ZDOKH8as41kE6KLMIA7PewKK+U9J56F
YFGpBRgVFsheOz+rqRB3xEPRA/bxZjE+ADfWDuB+10JHodllNpWODj8NH34JVTLxpmnXxa1e9hkg
s7GTFN6ycEaH7GOz6z0r8Hlap+ErnafsF6/RKIPBSz6DC3rSafuUjW6z6HBkHJGKmI0r7jd+9ygR
T2w6h+jdWhr5r4Zru5rCUXQfTI4S/XeEH+KphbRaIS/dHDsqGJ7QUf2rw9vCc4ZJIpSey4Qp3DVJ
XbQvEeikehlBeuGQeCwRT0pbZ8z7wA17wWCZB6iQGw==
=x9l4
-----END PGP SIGNATURE-----

--rmyaqJHSnZ9Q2teyceTX9GLRzbIdvZGdC--

