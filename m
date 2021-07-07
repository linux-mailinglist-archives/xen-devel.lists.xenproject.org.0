Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993843BE676
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 12:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152119.281042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m14zC-0001xG-DT; Wed, 07 Jul 2021 10:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152119.281042; Wed, 07 Jul 2021 10:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m14zC-0001uR-9l; Wed, 07 Jul 2021 10:40:58 +0000
Received: by outflank-mailman (input) for mailman id 152119;
 Wed, 07 Jul 2021 10:40:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dzvn=L7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m14zA-0001uL-VJ
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 10:40:56 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f6a59b0-b0bc-45db-bdab-a4bde3c63308;
 Wed, 07 Jul 2021 10:40:55 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 23C782266A;
 Wed,  7 Jul 2021 10:40:55 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E7DCB13966;
 Wed,  7 Jul 2021 10:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YmzbNraE5WCKVgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Jul 2021 10:40:54 +0000
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
X-Inumbo-ID: 8f6a59b0-b0bc-45db-bdab-a4bde3c63308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625654455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N11h7ouUFr3DAUuHEdSGvJoajgCZswBXRGsMpwGbDbA=;
	b=XpSIH/dwC0N6Cqx3dG9AWgmfbTjKk1JKRC3HBaKVQE9EmrJKF2OKyjqyVs3cFukgw/eeBZ
	QjFG3JbAuqq5OcFKCZaeE2O3wF5cDehmrvqQgIZuZGGkwVszQL1ZPJ9pf3dHy0IzgFQ1PI
	O+wCoNRZkUzdTt7XmLJDTCBP27Q3deg=
Subject: Re: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
To: Jan Beulich <jbeulich@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20210707091045.460-1-jgross@suse.com>
 <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
Date: Wed, 7 Jul 2021 12:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EaXVOFEGH7qawZGUIhRcY8ubI1x9QO3nU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EaXVOFEGH7qawZGUIhRcY8ubI1x9QO3nU
Content-Type: multipart/mixed; boundary="9rpfACyjVhmGUQOwL4hqApmFGAJalcBco";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Message-ID: <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
Subject: Re: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
References: <20210707091045.460-1-jgross@suse.com>
 <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
In-Reply-To: <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>

--9rpfACyjVhmGUQOwL4hqApmFGAJalcBco
Content-Type: multipart/mixed;
 boundary="------------41A7E563365649DB0BFE43DE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------41A7E563365649DB0BFE43DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.07.21 11:57, Jan Beulich wrote:
> On 07.07.2021 11:10, Juergen Gross wrote:
>> Xen frontends shouldn't BUG() in case of illegal data received from
>> their backends. So replace the BUG_ON()s when reading illegal data fro=
m
>> the ring page with negative return values.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
>> --- a/drivers/tty/hvc/hvc_xen.c
>> +++ b/drivers/tty/hvc/hvc_xen.c
>> @@ -86,7 +86,11 @@ static int __write_console(struct xencons_info *xen=
cons,
>>   	cons =3D intf->out_cons;
>>   	prod =3D intf->out_prod;
>>   	mb();			/* update queue values before going on */
>=20
> Largely unrelated note: While in general the barriers here may want
> switching to virt_*mb(), this particular one looks to be too heavy
> anyway: a read barrier is all that's needed here afaict, just like
> there's only a write barrier between ring contents and producer
> writing in __write_console().

I agree.

> And btw, since I've got puzzled by the linuxppc-dev@ in the recipients
> list, I did look up relevant entries in ./MAINTAINERS. Shouldn't the
> file be part of "XEN HYPERVISOR INTERFACE"?

I wouldn't mind. Greg, Jiri, what do you think?


Juergen

--------------41A7E563365649DB0BFE43DE
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

--------------41A7E563365649DB0BFE43DE--

--9rpfACyjVhmGUQOwL4hqApmFGAJalcBco--

--EaXVOFEGH7qawZGUIhRcY8ubI1x9QO3nU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDlhLYFAwAAAAAACgkQsN6d1ii/Ey+h
nQf6Am00Vqi/6Jzpyxf14vmtTaZqJJyMAr8bZlczlxZd4ym8ttPZ+0X4jC1Qhj95xncLLcRPD48n
zjXrUXqgw243BwaSFx1VjnFxbvVIwhQ4/xQcxhj2ccJlliUXdd0h0ebveKgE5TL30jtmPJdrcUJH
JHvDivp5gzcRmVVqRAJ007+8Ug0HEnWpPoHcOrTn7ot2/lYye/wEkIrDF4pri2JGN9A2lQ+NefgT
iN8vVD/skh5e0wQ8JLD/7jM5r1kO4Z2lls19/f/78jX9RKs5qVjKGBCYlsTrx27NQl+4Enjw7Aap
U+NwoaH2WO02AP0QOSWmerIH0liA1Y4hfdePbRYFdA==
=4Hku
-----END PGP SIGNATURE-----

--EaXVOFEGH7qawZGUIhRcY8ubI1x9QO3nU--

