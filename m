Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE93FD73F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 11:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176246.320719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMwC-0005XP-Nd; Wed, 01 Sep 2021 09:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176246.320719; Wed, 01 Sep 2021 09:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLMwC-0005TG-Jl; Wed, 01 Sep 2021 09:53:44 +0000
Received: by outflank-mailman (input) for mailman id 176246;
 Wed, 01 Sep 2021 09:53:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0rUu=NX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mLMwA-0005Sz-LP
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 09:53:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 923e60a0-1d40-42e7-946d-0916f4d96220;
 Wed, 01 Sep 2021 09:53:41 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1C98202A9;
 Wed,  1 Sep 2021 09:53:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5360A13A45;
 Wed,  1 Sep 2021 09:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sOO0EaRNL2G0IAAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 01 Sep 2021 09:53:40 +0000
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
X-Inumbo-ID: 923e60a0-1d40-42e7-946d-0916f4d96220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630490020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aA6sPNMThuGUNYnDlunOAMyTa2yY+DaSnBdOYNd2FZY=;
	b=SeLuetNliD5GxhPHaMqcoEt2BmM/HT1trHCMQ5aac751U5VCy1NIjeb3saIDbKMUS1Apbb
	0IFRCp5PxCSZsE/VHKgZhRRCbW8XIHOLCtoKbT21kcW0d/P+sySIPMhx+PyrdMwYho6Mcl
	CRCbjCM/BZPrnVx7rtK12EyTPf1F+uE=
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20210831073039.7101-1-jgross@suse.com>
 <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Config: use Mini-OS master for xen-unstable
Message-ID: <d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
Date: Wed, 1 Sep 2021 11:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nffqn2zrwFK8ViexzHzIWpM3CQjmypOq3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nffqn2zrwFK8ViexzHzIWpM3CQjmypOq3
Content-Type: multipart/mixed; boundary="qDn4ONRi1pYHvLeWVtpyF4cKY3t3VuEvq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Message-ID: <d610c89b-fb46-338f-e4b6-5e1d5a0b5040@suse.com>
Subject: Re: [PATCH] Config: use Mini-OS master for xen-unstable
References: <20210831073039.7101-1-jgross@suse.com>
 <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>
In-Reply-To: <6837d551-6473-e34d-c0ae-043fcaa9482b@suse.com>

--qDn4ONRi1pYHvLeWVtpyF4cKY3t3VuEvq
Content-Type: multipart/mixed;
 boundary="------------909B2A3919721982D934BD8C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------909B2A3919721982D934BD8C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.09.21 10:59, Jan Beulich wrote:
> On 31.08.2021 09:30, Juergen Gross wrote:
>> In order to get Mini-OS master branch tested by OSStest, use it for
>> xen-unstable.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> There are some Mini-OS patches pending, of which at least the Mini-OS
>> netfront fix should be committed as it will be required for qemu-stubd=
om
>> to work.
>> ---
>>   Config.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Config.mk b/Config.mk
>> index 4d723eec1d..d4e8ced104 100644
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?=3D git://xenbits.xen.org/min=
i-os.git
>>   endif
>>   OVMF_UPSTREAM_REVISION ?=3D b37cfdd2807181aed2fee1e17bd7ec1190db266a=

>>   QEMU_UPSTREAM_REVISION ?=3D master
>> -MINIOS_UPSTREAM_REVISION ?=3D 051b87bb9c19609976fb038f386920e1ce5454c=
5
>> +MINIOS_UPSTREAM_REVISION ?=3D master
>=20
> I'm afraid this, effectively reverting 82c3d15c903a ("minios: Revert re=
cent
> change and revert to working minios"), would set us up for the same pro=
blem
> again that was dealt with there. IOW you're re-proposing a change of yo=
urs
> (e013e8514389 ["config: use mini-os master for unstable"]) which was
> subsequently reverted, without spelling out what has since changed.

How do you suggest to proceed then?

Will every Mini-OS commit require to be followed by a Xen commit then,
which will either result in a test success, or in a revert of that Xen
commit?

It should be noted that the presumed interface change in Mini-OS causing
the failure in OSStest last year has been reverted by me.


Juergen

--------------909B2A3919721982D934BD8C
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

--------------909B2A3919721982D934BD8C--

--qDn4ONRi1pYHvLeWVtpyF4cKY3t3VuEvq--

--nffqn2zrwFK8ViexzHzIWpM3CQjmypOq3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEvTaMFAwAAAAAACgkQsN6d1ii/Ey8n
BAf/SHfDRN/F/Dz+lUFMTTxNvOB8w2/qMorYOPAKT/kAKDmyC/UGUeNjKALUdGEt3kdd6PrQVczs
9JiaeeL/4OJLv2pnccrfXu/wwABZatvgy1VPyr+siI6jV1HxGGhEgDXsZ5bgyIIGxBfCVQaEyE57
M4PZG1bOZ5oPmtj5Bz5UA2it8xs1yMwqRcr11k7XbnCA0P4oHOC+bZew70P/U6+/Qp1Ku05aeBtz
FUjoOVrrm3u6X8gIKcUu6StmB2rBPQbpWAXNNnu6ay8XsYoVnBp59OW2jQ474bTOcv+X11L//bdJ
/KxJH+rmgXGe5Mfw+B3WmMqIBZhEFxShqmZrbDAS8w==
=zCn0
-----END PGP SIGNATURE-----

--nffqn2zrwFK8ViexzHzIWpM3CQjmypOq3--

