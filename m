Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8B3BF54A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 07:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152868.282403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1MsQ-0001SQ-KX; Thu, 08 Jul 2021 05:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152868.282403; Thu, 08 Jul 2021 05:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1MsQ-0001QZ-Gi; Thu, 08 Jul 2021 05:47:10 +0000
Received: by outflank-mailman (input) for mailman id 152868;
 Thu, 08 Jul 2021 05:47:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQIU=MA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1MsP-0001QT-2g
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 05:47:09 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee2de78e-dfaf-11eb-8558-12813bfff9fa;
 Thu, 08 Jul 2021 05:47:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0479620131;
 Thu,  8 Jul 2021 05:47:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B37E61340F;
 Thu,  8 Jul 2021 05:47:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id CQAAKlqR5mDNfQAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 08 Jul 2021 05:47:06 +0000
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
X-Inumbo-ID: ee2de78e-dfaf-11eb-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625723227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ip5DNgexySMwzuWqwa7ACJthFTxiFhdfI+wAfyqI2vQ=;
	b=mtRhjyizl14mUB363xUyJ8hB7aUMyzMYom33vs6fkxmXh8GwkExiFT8QbjKbQGoINv2kte
	gOjwk1DxWJ93vQZ3gvMeN0i2VIfQ7+bhXGMkeixDvAWNvM/EEzz5AeozWs2btvrqz7US2A
	3k5qRk9rE4C8vyovYqa7MoEsauJPO/w=
Subject: Re: [PATCH 4/8] xen/blkfront: don't trust the backend response data
 blindly
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-5-jgross@suse.com>
 <315ad8b9-8a98-8d3e-f66c-ab32af2731a8@suse.com>
 <6095c4b9-a9bb-8a38-fb6c-a5483105b802@suse.com>
 <a19a13ba-a386-2808-ad85-338d47085fa6@suse.com>
 <030ef85e-b5af-f46e-c8dc-88b8d195c4e1@suse.com>
 <477f01cd-8793-705c-10f9-cf0c0cd6ed84@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <dca55162-ec2e-682a-824d-b657a6407249@suse.com>
Date: Thu, 8 Jul 2021 07:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <477f01cd-8793-705c-10f9-cf0c0cd6ed84@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="65Cl9OH3VxhoDnxdHBagUmL999Yvk5KRj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--65Cl9OH3VxhoDnxdHBagUmL999Yvk5KRj
Content-Type: multipart/mixed; boundary="TaRSfQAduiJvbDCSd5wNF88LIRKqIxccY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <dca55162-ec2e-682a-824d-b657a6407249@suse.com>
Subject: Re: [PATCH 4/8] xen/blkfront: don't trust the backend response data
 blindly
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-5-jgross@suse.com>
 <315ad8b9-8a98-8d3e-f66c-ab32af2731a8@suse.com>
 <6095c4b9-a9bb-8a38-fb6c-a5483105b802@suse.com>
 <a19a13ba-a386-2808-ad85-338d47085fa6@suse.com>
 <030ef85e-b5af-f46e-c8dc-88b8d195c4e1@suse.com>
 <477f01cd-8793-705c-10f9-cf0c0cd6ed84@suse.com>
In-Reply-To: <477f01cd-8793-705c-10f9-cf0c0cd6ed84@suse.com>

--TaRSfQAduiJvbDCSd5wNF88LIRKqIxccY
Content-Type: multipart/mixed;
 boundary="------------1299B9F7BEB5CBBFFB8C69D9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1299B9F7BEB5CBBFFB8C69D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.05.21 17:33, Jan Beulich wrote:
> On 17.05.2021 17:22, Juergen Gross wrote:
>> On 17.05.21 17:12, Jan Beulich wrote:
>>> On 17.05.2021 16:23, Juergen Gross wrote:
>>>> On 17.05.21 16:11, Jan Beulich wrote:
>>>>> On 13.05.2021 12:02, Juergen Gross wrote:
>>>>>> @@ -1574,10 +1580,16 @@ static irqreturn_t blkif_interrupt(int irq=
, void *dev_id)
>>>>>>     	spin_lock_irqsave(&rinfo->ring_lock, flags);
>>>>>>      again:
>>>>>>     	rp =3D rinfo->ring.sring->rsp_prod;
>>>>>> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
>>>>>> +		pr_alert("%s: illegal number of responses %u\n",
>>>>>> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
>>>>>> +		goto err;
>>>>>> +	}
>>>>>>     	rmb(); /* Ensure we see queued responses up to 'rp'. */
>>>>>
>>>>> I think you want to insert after the barrier.
>>>>
>>>> Why? The relevant variable which is checked is "rp". The result of t=
he
>>>> check is in no way depending on the responses themselves. And any ch=
ange
>>>> of rsp_cons is protected by ring_lock, so there is no possibility of=

>>>> reading an old value here.
>>>
>>> But this is a standard double read situation: You might check a value=

>>> and then (via a separate read) use a different one past the barrier.
>>
>> Yes and no.
>>
>> rsp_cons should never be written by the other side, and additionally
>> it would be read multiple times anyway.
>=20
> But I'm talking about rsp_prod, as that's what rp gets loaded from.

Oh, now I get your problem.

But shouldn't that better be solved by using READ_ONCE() for reading rp
instead?


Juergen

--------------1299B9F7BEB5CBBFFB8C69D9
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

--------------1299B9F7BEB5CBBFFB8C69D9--

--TaRSfQAduiJvbDCSd5wNF88LIRKqIxccY--

--65Cl9OH3VxhoDnxdHBagUmL999Yvk5KRj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDmkVoFAwAAAAAACgkQsN6d1ii/Ey9d
SAf+KLMOHqZAOwV2oMpLnGz6nvcW8YhRf7arZPFHVihB8LPCP/ZMeXdUOOrg4Es9ObCPK3OsCyjO
2ZLyzCQN+5haDXDOJkvUkf6mZ4u/lS44+t0gONnt9mCbH1DAr/8vLPnAGXWbPy1bULNZS58k3j5c
Mb/bW0RiqyiAQWP8xXe7EkC4DV5fwQG1QUnOV3ULDUorDihhshR82yfWQ7+HzbzUVg2OZZGU8UlX
htMrMbRFoCfAEO98yZ+qbHTE/i54dl7pUAwc1dSqvMrYCGnCf0Q4D8E2xHzOhpDohPxpjPYGXF12
YgTs6YPWhtmHoOKBBACBsPfJWyBa0ZOIFq9oWWbTAQ==
=p302
-----END PGP SIGNATURE-----

--65Cl9OH3VxhoDnxdHBagUmL999Yvk5KRj--

