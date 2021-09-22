Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA724414556
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192339.342746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyiC-0003pC-9A; Wed, 22 Sep 2021 09:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192339.342746; Wed, 22 Sep 2021 09:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyiC-0003mN-68; Wed, 22 Sep 2021 09:38:44 +0000
Received: by outflank-mailman (input) for mailman id 192339;
 Wed, 22 Sep 2021 09:38:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSyiA-0003jm-C5
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:38:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddc4527e-1b88-11ec-b967-12813bfff9fa;
 Wed, 22 Sep 2021 09:38:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4AE81FD3D;
 Wed, 22 Sep 2021 09:38:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E46413D6E;
 Wed, 22 Sep 2021 09:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OOr5FJ75SmEWOgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 09:38:38 +0000
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
X-Inumbo-ID: ddc4527e-1b88-11ec-b967-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632303518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDITk7qYS46BDPvc5hGcTPTTlb+J+zDzHS0yTQOEps0=;
	b=BoBRVUN9t779M5zQ4BtUz+Sk8ipb7ZIb/PhyZ0wVfbYtcBc0suyrwTl4nd3Qg6ec7NYkpR
	zB3dDK0w2f648HiYeBT5pgfeaZEtSf3VaDL4SvZLQAOjTLLnd2Lr1EUlyrHKAnoifwqVlJ
	H9r2uscyiY+SMvJID5ClXV6eOyr3PYs=
Subject: Re: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-7-roger.pau@citrix.com>
 <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c6dc7f81-0c4a-5c2f-1ac8-bb3ce5a58120@suse.com>
Date: Wed, 22 Sep 2021 11:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4biEIaBNgREjbOueTenbcBFKojmVl3YtW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4biEIaBNgREjbOueTenbcBFKojmVl3YtW
Content-Type: multipart/mixed; boundary="atHKN1GnjO5GCPS3CqdmzqqSxsH74MF5n";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c6dc7f81-0c4a-5c2f-1ac8-bb3ce5a58120@suse.com>
Subject: Re: [PATCH v2 6/6] gnttab: allow disabling grant table per-domain
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-7-roger.pau@citrix.com>
 <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>
In-Reply-To: <b900f179-c6c2-00f5-e531-5110307fa491@xen.org>

--atHKN1GnjO5GCPS3CqdmzqqSxsH74MF5n
Content-Type: multipart/mixed;
 boundary="------------28E1F4F69A2E23BE3EAFEF9B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------28E1F4F69A2E23BE3EAFEF9B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.09.21 11:19, Julien Grall wrote:
> Hi Roger,
>=20
> On 22/09/2021 13:21, Roger Pau Monne wrote:
>> Allow setting max_grant_version to 0 in order to disable grant table
>> usage by a domain. This prevents allocating the grant-table structure
>> inside of Xen and requires guards to be added in several functions in
>> order to prevent dereferencing the structure.
>>
>> Note that a domain without a grant table could still use some of the
>> grant related hypercalls, it could for example issue a GNTTABOP_copy
>> of a grant reference from a remote domain into a local frame.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> ---
>> =C2=A0 docs/man/xl.cfg.5.pod.in=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
4 +-
>> =C2=A0 tools/libs/light/libxl_dom.c |=C2=A0=C2=A0 2 +-
>> =C2=A0 xen/common/grant_table.c=C2=A0=C2=A0=C2=A0=C2=A0 | 100 ++++++++=
+++++++++++++++++++++++++--
>> =C2=A0 3 files changed, 98 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index c5a447dfcd..d507540c2c 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -583,8 +583,8 @@ L<xl.conf(5)>.
>> =C2=A0 =3Ditem B<max_grant_version=3DNUMBER>
>> =C2=A0 Specify the maximum grant table version the domain is allowed t=
o=20
>> use. Current
>> -supported versions are 1 and 2. The default value is settable via
>> -L<xl.conf(5)>.
>> +supported versions are 1 and 2. Setting to 0 disables the grant table=
=20
>> for the
>> +domain. The default value is settable via L<xl.conf(5)>.
>=20
> Technically, the version only applies to format of the table for=20
> granting page. The mapping itself is version agnostic. So this feels a =

> bit wrong to use max_grant_version to not allocate d->grant_table.
>=20
> I also can see use-cases where we may want to allow a domain to grant=20
> page but not map grant (for instance, a further hardening of XSA-380). =

> Therefore, I think we want to keep max_grant_version for the table=20
> itself and manage the mappings separately (possibly by letting the admi=
n=20
> to select the max number of entries in the maptrack).

You mean the already existing domain config option max_maptrack_frames?


Juergen

--------------28E1F4F69A2E23BE3EAFEF9B
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

--------------28E1F4F69A2E23BE3EAFEF9B--

--atHKN1GnjO5GCPS3CqdmzqqSxsH74MF5n--

--4biEIaBNgREjbOueTenbcBFKojmVl3YtW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFK+Z0FAwAAAAAACgkQsN6d1ii/Ey+K
gQf/TUHGBjcBE2xdsOzBhcgvuDF/enEoSTZj2O0mtSB/hBI+blSAvbwMULcnYs/dfvPvLXhWP0oA
q+sJvLOv4LSdCcwp/OPfI8P0aqhL99JuDQUSD69xrclaYokuuhJqvrDKyp5tPd56NybLLSnmJcRC
OzcAyKYHm9oZEgGgQ5MJL4MoVzhobUK7YPKv5F386ITMp6QlSGpML7emGKqZYAs5q6ihefzgXL8x
IcnNffOyf5JpuCanv0YzV9SoPs4ZON+v9L344FTkShz+CD9rOFCKWCT09HDo35wsppCqzZMt9B6N
HhoBD+WTvuOli/diX3+H6pN9rC5WF3HlCH2285QqtA==
=/4tT
-----END PGP SIGNATURE-----

--4biEIaBNgREjbOueTenbcBFKojmVl3YtW--

