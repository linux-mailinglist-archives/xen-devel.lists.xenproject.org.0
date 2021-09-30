Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838241DAB0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 15:08:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199936.354277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvmw-0003DE-2E; Thu, 30 Sep 2021 13:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199936.354277; Thu, 30 Sep 2021 13:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvmv-0003BR-VT; Thu, 30 Sep 2021 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 199936;
 Thu, 30 Sep 2021 13:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsc4=OU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVvmu-0003BL-2R
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 13:07:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b8af45d-1aad-4937-8842-7a374c6c342d;
 Thu, 30 Sep 2021 13:07:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B654203BB;
 Thu, 30 Sep 2021 13:07:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEA2613AF5;
 Thu, 30 Sep 2021 13:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DesOM6G2VWG1VAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Sep 2021 13:07:45 +0000
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
X-Inumbo-ID: 7b8af45d-1aad-4937-8842-7a374c6c342d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633007266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i1SW8NPZGg1GriXI8CfQXVexUlt3KJF4BcMKC51Kwak=;
	b=LPlYtfdJpzZoWGEb9OpP3I+Ro64B6sDmaWTwNzu+WURecbGDciVR+wilIgJJT0FcNfWA0b
	QkqhidCcc22ktXKB6zBhOlcDjxvHZJaLkGBvb0gyZp/XHrLod0MDWsz/Pjenue+MJHQSlC
	6USfxJ0g+eShB767YAxj/m6iTzNMHzI=
Subject: Re: [PATCH v2 09/10] xen-blkfront: add error handling support for
 add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk, colyli@suse.de,
 kent.overstreet@gmail.com, kbusch@kernel.org, sagi@grimberg.me,
 vishal.l.verma@intel.com, dan.j.williams@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, konrad.wilk@oracle.com, roger.pau@citrix.com,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, minchan@kernel.org,
 ngupta@vflare.org, senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210927220039.1064193-1-mcgrof@kernel.org>
 <20210927220039.1064193-10-mcgrof@kernel.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <50f5fcbe-fb34-1cb8-1965-dd3bfd7e1f12@suse.com>
Date: Thu, 30 Sep 2021 15:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210927220039.1064193-10-mcgrof@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="O5jaGfuKPjp2dmoP5IHIhPbF1qqBfXK7C"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--O5jaGfuKPjp2dmoP5IHIhPbF1qqBfXK7C
Content-Type: multipart/mixed; boundary="ZhXoHV0IZVGJD3tZd4HDqm50wpYE06BGa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk, colyli@suse.de,
 kent.overstreet@gmail.com, kbusch@kernel.org, sagi@grimberg.me,
 vishal.l.verma@intel.com, dan.j.williams@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, konrad.wilk@oracle.com, roger.pau@citrix.com,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, minchan@kernel.org,
 ngupta@vflare.org, senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <50f5fcbe-fb34-1cb8-1965-dd3bfd7e1f12@suse.com>
Subject: Re: [PATCH v2 09/10] xen-blkfront: add error handling support for
 add_disk()
References: <20210927220039.1064193-1-mcgrof@kernel.org>
 <20210927220039.1064193-10-mcgrof@kernel.org>
In-Reply-To: <20210927220039.1064193-10-mcgrof@kernel.org>

--ZhXoHV0IZVGJD3tZd4HDqm50wpYE06BGa
Content-Type: multipart/mixed;
 boundary="------------657B867CC90834C60D5C497D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------657B867CC90834C60D5C497D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.09.21 00:00, Luis Chamberlain wrote:
> We never checked for errors on device_add_disk() as this function
> returned void. Now that this is fixed, use the shiny new error
> handling. The function xlvbd_alloc_gendisk() typically does the
> unwinding on error on allocating the disk and creating the tag,
> but since all that error handling was stuffed inside
> xlvbd_alloc_gendisk() we must repeat the tag free'ing as well.
>=20
> We set the info->rq to NULL to ensure blkif_free() doesn't crash
> on blk_mq_stop_hw_queues() on device_add_disk() error as the queue
> will be long gone by then.
>=20
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


--------------657B867CC90834C60D5C497D
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

--------------657B867CC90834C60D5C497D--

--ZhXoHV0IZVGJD3tZd4HDqm50wpYE06BGa--

--O5jaGfuKPjp2dmoP5IHIhPbF1qqBfXK7C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFVtqAFAwAAAAAACgkQsN6d1ii/Ey9/
Ggf9Fzrs35IrfdUjKBrgggetJDMgl6I0Cc/n6Jtov78ZI8feS38DFu/MBlJr7yJi7nDb927EgLkY
Y12gOa0cyy+IViB/FsDGnzneZefxCV8ddwXHxUCK087pTn/rAExcemxNE6AQuP4c+Sg8SCgYbLuq
VMaH5zOY5g4WAv7oC5wxvUNRJDun8GXGkc3nrpqjmmK1jlQ3eYGUIuHk4I7aD4Ms75pVOywkbpOg
C9JTmp+fz8MknREAfAwX9343sfEr0+yceuLOx508VcF7asOTuQe78cbszDRUqWjUKvBniise0zdL
XkmSEsvS4U6iJZ0ZvU8D1pH443giDVPA6cWx9XIbQg==
=r4+e
-----END PGP SIGNATURE-----

--O5jaGfuKPjp2dmoP5IHIhPbF1qqBfXK7C--

