Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6B415A8C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193538.344732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKfE-0006fv-1e; Thu, 23 Sep 2021 09:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193538.344732; Thu, 23 Sep 2021 09:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKfD-0006d4-Tt; Thu, 23 Sep 2021 09:05:07 +0000
Received: by outflank-mailman (input) for mailman id 193538;
 Thu, 23 Sep 2021 09:05:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTKfC-0006cw-3s
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:05:06 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b18149d-86b2-4347-a0e7-0c03ee8279bf;
 Thu, 23 Sep 2021 09:05:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5525922346;
 Thu, 23 Sep 2021 09:05:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C26413DCA;
 Thu, 23 Sep 2021 09:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H9zeBEBDTGE/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 09:05:04 +0000
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
X-Inumbo-ID: 3b18149d-86b2-4347-a0e7-0c03ee8279bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632387904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SlpT/lxAM3jzsI+Mgdob12kTvoXiVmms10P//QNB5AM=;
	b=iJTsPXCZYqt7+JPZVlPz+d97attND1bUg4UgMjSGHD6dztJbvcmzF6AFh5gEbvKFmXg0uJ
	lCq2nlY6Q4mbQ43BR52LvI0eD26NVg+7csnAhVBROg2WN95lA0HbDAAyOxYsz1KQJnjw5N
	pJ7ELKTtB5XYS6h387+HTsjodpvSzc0=
Subject: Re: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210922101422.2319240-1-andr2000@gmail.com>
 <20210922101422.2319240-2-andr2000@gmail.com>
 <alpine.DEB.2.21.2109221407350.17979@sstabellini-ThinkPad-T480s>
 <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7880dee9-7372-5a25-db55-018f21e8b08c@suse.com>
Date: Thu, 23 Sep 2021 11:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Raagvfdh0L7U0w5qqCjIvjKl35tyxY7y3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Raagvfdh0L7U0w5qqCjIvjKl35tyxY7y3
Content-Type: multipart/mixed; boundary="GNX9GoSgpMQWceOML5nwDmElT2X4pKTAT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <7880dee9-7372-5a25-db55-018f21e8b08c@suse.com>
Subject: Re: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
References: <20210922101422.2319240-1-andr2000@gmail.com>
 <20210922101422.2319240-2-andr2000@gmail.com>
 <alpine.DEB.2.21.2109221407350.17979@sstabellini-ThinkPad-T480s>
 <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com>
In-Reply-To: <4552e4b6-21a8-4829-16b4-7cda8ba0c0d1@epam.com>

--GNX9GoSgpMQWceOML5nwDmElT2X4pKTAT
Content-Type: multipart/mixed;
 boundary="------------FEAB4E1D867B0D1D35FC67BF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FEAB4E1D867B0D1D35FC67BF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.09.21 11:02, Oleksandr Andrushchenko wrote:
>=20
> On 23.09.21 00:10, Stefano Stabellini wrote:
>> On Wed, 22 Sep 2021, Oleksandr Andrushchenko wrote:
>>> --- a/drivers/xen/xen-pciback/xenbus.c
>>> +++ b/drivers/xen/xen-pciback/xenbus.c
>>> @@ -743,6 +743,9 @@ const struct xen_pcibk_backend *__read_mostly xen=
_pcibk_backend;
>>>   =20
>>>    int __init xen_pcibk_xenbus_register(void)
>>>    {
>>> +	if (!xen_pcibk_pv_support())
>>> +		return 0;
>> Is this truly enough to stop the PV backend from initializing? Have yo=
u
>> actually tested it to make sure? If it works, amazing! I am quite happ=
y
>> about this approach :-)
>=20
> Well, I put some logs into the driver and saw nothing obvious pointing
>=20
> to any backend activities (probably this is also because I don't have a=
ny
>=20
> frontend). I see that the xenbus driver is not registered. In XenStore =
I see:
>=20
> root@dom0:~# xenstore-ls -f | grep pci
> /local/domain/0/backend/pci =3D ""
> /local/domain/0/backend/pci/2 =3D ""
> /local/domain/0/backend/pci/2/0 =3D ""
> /local/domain/0/backend/pci/2/0/frontend =3D "/local/domain/2/device/pc=
i/0"
> /local/domain/0/backend/pci/2/0/frontend-id =3D "2"
> /local/domain/0/backend/pci/2/0/online =3D "1"
> /local/domain/0/backend/pci/2/0/state =3D "1"
> /local/domain/0/backend/pci/2/0/domain =3D "DomU"
> /local/domain/0/backend/pci/2/0/key-0 =3D "0000:03:00.0"
> /local/domain/0/backend/pci/2/0/dev-0 =3D "0000:03:00.0"
> /local/domain/0/backend/pci/2/0/opts-0 =3D "msitranslate=3D0,power_mgmt=
=3D0,permissive=3D0,rdm_policy=3Dstrict"
> /local/domain/0/backend/pci/2/0/state-0 =3D "1"
> /local/domain/0/backend/pci/2/0/num_devs =3D "1"
> /local/domain/2/device/pci =3D ""
> /local/domain/2/device/pci/0 =3D ""
> /local/domain/2/device/pci/0/backend =3D "/local/domain/0/backend/pci/2=
/0"
> /local/domain/2/device/pci/0/backend-id =3D "0"
> /local/domain/2/device/pci/0/state =3D "1"
> /libxl/pci =3D ""
> /libxl/pci/0000-03-00-0 =3D ""
> /libxl/pci/0000-03-00-0/domid =3D "2"
>=20
> But IIUIC these come from the toolstack
>=20
> @Juergen, do you know how to check if the backend is indeed not running=

>=20
> or the above should be enough to prove?

I don't see how the backend could be running without being registered
with xenbus. It won't receive any watches, so there is no way a
connection with a frontend could be established.


Juergen


--------------FEAB4E1D867B0D1D35FC67BF
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

--------------FEAB4E1D867B0D1D35FC67BF--

--GNX9GoSgpMQWceOML5nwDmElT2X4pKTAT--

--Raagvfdh0L7U0w5qqCjIvjKl35tyxY7y3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMQz8FAwAAAAAACgkQsN6d1ii/Ey95
CAf+LMrSF13F920AxmTtvMQbhQu/0abJ9OnAxlSGWpWb/n/qBvHE80H3GU69e4jRMCxQdru9w4F9
z9IUDYL7w2ypVjWVmKszhCw3kDxP5SwH/SWGEu83cPIyfVW9ew3x0/wGIwEoFEOI/51iKvLIrwcw
00tjR7RsSDAtHtc8zbLo87aYVYwo2J+NeKknTwYBDG2Poo+y9yNq+wrTxYTlPb3PF4TIfmcxm6Wu
ZCAL2Gx0I6iEAp9pj+IOyErh7yCS4twkwP85gF8N/2N2FdC5bCuYIKyqgpCseef833dSmPsQvWIv
kIfkrFqZ0Ph9X716CVtHvtS5I1XDX8TrjFN5tF6k9w==
=mvh6
-----END PGP SIGNATURE-----

--Raagvfdh0L7U0w5qqCjIvjKl35tyxY7y3--

