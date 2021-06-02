Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083E398E4C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136112.252603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdz-0007yv-Hk; Wed, 02 Jun 2021 15:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136112.252603; Wed, 02 Jun 2021 15:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdz-0007vK-AH; Wed, 02 Jun 2021 15:18:55 +0000
Received: by outflank-mailman (input) for mailman id 136112;
 Wed, 02 Jun 2021 15:18:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loSdx-0004jV-HS
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:18:53 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9afb638b-a057-403f-b890-232ab2c4305f;
 Wed, 02 Jun 2021 15:18:34 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C60921C9F;
 Wed,  2 Jun 2021 15:18:32 +0000 (UTC)
Received: by imap.suse.de (Postfix, from userid 51)
 id 7712811CC0; Wed,  2 Jun 2021 15:18:23 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2E5C611F32;
 Wed,  2 Jun 2021 15:10:22 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id EG3BCF6ft2DJBAAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 15:10:22 +0000
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
X-Inumbo-ID: 9afb638b-a057-403f-b890-232ab2c4305f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622647112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ogV5wNk51FdvQJ93nInVRa11ugw7H3eLjSN1UBRHUMg=;
	b=VZ/sEqCnTKdL3yQUmmuB4fZ+u/h/ufbvpY6nuZiTfUTSbuOef9eHnvN3oSB945kQxwpOMY
	/oez4nwSDzW0xlpCKpQTK2nZjqb1YwqMRlSKKfjm+kcs/sQADpVjPdw8uZb1wsQl2bByyk
	2vxbgFXb+Kfw+gA+MYZ3BwbHpLsiqq0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622646622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ogV5wNk51FdvQJ93nInVRa11ugw7H3eLjSN1UBRHUMg=;
	b=QyoJOgo3H2v0w10KYk5gk5pgnq3YUMCC531gS0c+W68PmTGGWEKsUpH2yGYpQ0rwuTPBCT
	g+YqqQRg5IboZBfzcS6DCwHxe+X5PTfxJeAF7aiLcKAyWnrs3ErHlB+4VFXHPxPruXoLcz
	Gt3tlA5l6mA/aH7acocE9GubSrzHyng=
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20210412152236.1975-1-jgross@suse.com>
 <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
 <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>
Message-ID: <b4135462-2eba-f236-679a-c37617808656@suse.com>
Date: Wed, 2 Jun 2021 17:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="G73A7fA0HIQOCHlizcXAVyGpJQXGHgTwT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G73A7fA0HIQOCHlizcXAVyGpJQXGHgTwT
Content-Type: multipart/mixed; boundary="4bT5Jfg0Lb5jWuFlmGD0LHlYKz9hMgUx3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-ID: <b4135462-2eba-f236-679a-c37617808656@suse.com>
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
References: <20210412152236.1975-1-jgross@suse.com>
 <b79c60e4-7c41-be9a-b0df-e9f9cf71eafa@suse.com>
 <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>
In-Reply-To: <9cbac4d9-16d8-ff52-eb8f-8375cb88af93@suse.com>

--4bT5Jfg0Lb5jWuFlmGD0LHlYKz9hMgUx3
Content-Type: multipart/mixed;
 boundary="------------74EC891718F504DE99235ABB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------74EC891718F504DE99235ABB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.05.21 09:32, Juergen Gross wrote:
> On 12.05.21 08:58, Juergen Gross wrote:
>> Ping?
>=20
> Now each patch has an Ack by Wei. Could the series be either applied or=

> get more comments, please?

And another PING.

Do I need to setup a cron job pinging each day to get a reaction?


Juergen

>=20
>=20
> Juergen
>=20
>>
>> On 12.04.21 17:22, Juergen Gross wrote:
>>> There are some corners left which don't support the not so very new
>>> linear p2m list of pv guests, which has been introduced in Linux kern=
el
>>> 3.19 and which is mandatory for non-legacy versions of Xen since kern=
el
>>> 4.14.
>>>
>>> This series adds support for the linear p2m list where it is missing
>>> (colo support and "xl dump-core").
>>>
>>> In theory it should be possible to merge the p2m list mapping code
>>> from migration handling and core dump handling, but this needs quite
>>> some cleanup before this is possible.
>>>
>>> The first three patches of this series are fixing real problems, so
>>> I've put them at the start of this series, especially in order to mak=
e
>>> backports easier.
>>>
>>> The other three patches are only the first steps of cleanup. The main=

>>> work done here is to concentrate all p2m mapping in libxenguest inste=
ad
>>> of having one implementation in each of libxenguest and libxenctrl.
>>>
>>> Merging the two implementations should be rather easy, but this will
>>> require to touch many lines of code, as the migration handling varian=
t
>>> seems to be more mature, but it is using the migration stream specifi=
c
>>> structures heavily. So I'd like to have some confirmation that my way=

>>> to clean this up is the right one.
>>>
>>> My idea would be to add the data needed for p2m mapping to struct
>>> domain_info_context and replace the related fields in struct
>>> xc_sr_context with a struct domain_info_context. Modifying the
>>> interface of xc_core_arch_map_p2m() to take most current parameters
>>> via struct domain_info_context would then enable migration coding to
>>> use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m(=
)
>>> should look basically like the current migration p2m mapping code
>>> afterwards.
>>>
>>> Any comments to that plan?
>>>
>>> Changes in V2:
>>> - added missing #include in ocaml stub
>>>
>>> Juergen Gross (6):
>>> =C2=A0=C2=A0 tools/libs/guest: fix max_pfn setting in map_p2m()
>>> =C2=A0=C2=A0 tools/libs/ctrl: fix xc_core_arch_map_p2m() to support l=
inear p2m
>>> =C2=A0=C2=A0=C2=A0=C2=A0 table
>>> =C2=A0=C2=A0 tools/libs/ctrl: use common p2m mapping code in=20
>>> xc_domain_resume_any()
>>> =C2=A0=C2=A0 tools/libs: move xc_resume.c to libxenguest
>>> =C2=A0=C2=A0 tools/libs: move xc_core* from libxenctrl to libxenguest=

>>> =C2=A0=C2=A0 tools/libs/guest: make some definitions private to libxe=
nguest
>>>
>>> =C2=A0 tools/include/xenctrl.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 63 ---
>>> =C2=A0 tools/include/xenguest.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 63 +++
>>> =C2=A0 tools/libs/ctrl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 -
>>> =C2=A0 tools/libs/ctrl/xc_core_x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 223 ---=
-------
>>> =C2=A0 tools/libs/ctrl/xc_domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 -
>>> =C2=A0 tools/libs/ctrl/xc_private.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> 43 +-
>>> =C2=A0 tools/libs/guest/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 4 +
>>> =C2=A0 .../libs/{ctrl/xc_core.c =3D> guest/xg_core.c}=C2=A0 |=C2=A0=C2=
=A0 7 +-
>>> =C2=A0 .../libs/{ctrl/xc_core.h =3D> guest/xg_core.h}=C2=A0 |=C2=A0 1=
5=20
> +-
>>> =C2=A0 .../xc_core_arm.c =3D> guest/xg_core_arm.c}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 31 +-
>>> =C2=A0 .../xc_core_arm.h =3D> guest/xg_core_arm.h}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
>>> =C2=A0 tools/libs/guest/xg_core_x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 399 +++++++++=
+++++++++
>>> =C2=A0 .../xc_core_x86.h =3D> guest/xg_core_x86.h}=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
>>> =C2=A0 tools/libs/guest/xg_dom_boot.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2=20

> +-
>>> =C2=A0 tools/libs/guest/xg_domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> 19 +-
>>> =C2=A0 tools/libs/guest/xg_offline_page.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 tools/libs/guest/xg_private.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1=
6 +-
>>> =C2=A0 .../{ctrl/xc_resume.c =3D> guest/xg_resume.c}=C2=A0=C2=A0 |=20
> 69 +--
>>> =C2=A0 tools/libs/guest/xg_sr_save_x86_pv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 tools/ocaml/libs/xc/xenctrl_stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 20 files changed, 545 insertions(+), 420 deletions(-)
>>> =C2=A0 delete mode 100644 tools/libs/ctrl/xc_core_x86.c
>>> =C2=A0 rename tools/libs/{ctrl/xc_core.c =3D> guest/xg_core.c} (99%)
>>> =C2=A0 rename tools/libs/{ctrl/xc_core.h =3D> guest/xg_core.h} (92%)
>>> =C2=A0 rename tools/libs/{ctrl/xc_core_arm.c =3D> guest/xg_core_arm.c=
}=20
> (72%)
>>> =C2=A0 rename tools/libs/{ctrl/xc_core_arm.h =3D> guest/xg_core_arm.h=
}=20
> (100%)
>>> =C2=A0 create mode 100644 tools/libs/guest/xg_core_x86.c
>>> =C2=A0 rename tools/libs/{ctrl/xc_core_x86.h =3D> guest/xg_core_x86.h=
}=20
> (100%)
>>> =C2=A0 rename tools/libs/{ctrl/xc_resume.c =3D> guest/xg_resume.c} (8=
0%)
>>>
>>
>=20


--------------74EC891718F504DE99235ABB
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

--------------74EC891718F504DE99235ABB--

--4bT5Jfg0Lb5jWuFlmGD0LHlYKz9hMgUx3--

--G73A7fA0HIQOCHlizcXAVyGpJQXGHgTwT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3n10FAwAAAAAACgkQsN6d1ii/Ey8G
GAf+JKjxfRkaYjnbbDtpCOwB1g2krduWx/+wnikrCQahwtLdRvQpqgSUwpYDKYoVB41ReEihtEDC
bW66vSgqQ8jGWr6fug97EeGBnpd771jJAenfPwk7452DWzDkEXPVuBGHbPbbopf+L1vTzdxZ3U30
LguVhe4jk20HogUKhG+/396h9GdWTkf+we1SvgQ8AAG8YEwJcGS4RS5z3ocGowNHwuPhqoJkZ5nT
DBcNnkqmccwUQ2uDow6GQAlFaWtG/+2u0e8F5ed2SScdyvhoFYhMRz6xXoxou9+Lmw3obyT4Uglg
AeBWDia2igTxAUBGpac10TD3VVfF722ueefGcEMPPA==
=P5rU
-----END PGP SIGNATURE-----

--G73A7fA0HIQOCHlizcXAVyGpJQXGHgTwT--

