Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633C434A6E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 13:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213867.372222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdA2F-0006sT-8P; Wed, 20 Oct 2021 11:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213867.372222; Wed, 20 Oct 2021 11:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdA2F-0006qO-51; Wed, 20 Oct 2021 11:45:31 +0000
Received: by outflank-mailman (input) for mailman id 213867;
 Wed, 20 Oct 2021 11:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jFZ1=PI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mdA2D-0006qI-GS
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 11:45:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdbb9b73-9318-4109-9492-cdc126991f55;
 Wed, 20 Oct 2021 11:45:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3F371FDA0;
 Wed, 20 Oct 2021 11:45:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2687613AFE;
 Wed, 20 Oct 2021 11:45:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n5J5B1cBcGGyRQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Oct 2021 11:45:27 +0000
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
X-Inumbo-ID: fdbb9b73-9318-4109-9492-cdc126991f55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634730327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MfMr7xDgBMORSAcevQGXNZhMVrmu5n8C9a6uNTYGF8A=;
	b=GXUImd9sI+V1t42XbQtAf9oU+G2aVeUFZxpxso0Sozxdji3HfoRjDqQXseDjjraIy7OKKg
	zkyDb0nFlt0SlTjJRyP4Wb8LmgRbDmV7z5drADVDBGuXwDAs/njLoO46hGk+YTC4Bskz6A
	RmGT8iFjO/OXMb2BwAPAB0zLjSC20no=
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
 <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
 <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
 <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
Message-ID: <19c25cbf-8697-b970-91e5-195f07a5222a@suse.com>
Date: Wed, 20 Oct 2021 13:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1fkSp4VMzBO8cyJHSkWawTmj7a6yPzO6V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1fkSp4VMzBO8cyJHSkWawTmj7a6yPzO6V
Content-Type: multipart/mixed; boundary="YevP9PZvckMQptO720Ak6QVp5z6Y1P2Ix";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <19c25cbf-8697-b970-91e5-195f07a5222a@suse.com>
Subject: Re: [PATCH v2 2/6] gnttab: allow setting max version per-domain
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-3-roger.pau@citrix.com>
 <f5564634-5f9e-0b94-f73a-d44ae65c30f4@suse.com>
 <0b58667f-b6bc-d5b5-2dd1-0c8996367319@suse.com>
 <YW/NipJMLH0Zz05s@MacBook-Air-de-Roger.local>
 <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>
In-Reply-To: <a3d9388a-e2f5-76aa-d51a-2d74afb92bbd@suse.com>

--YevP9PZvckMQptO720Ak6QVp5z6Y1P2Ix
Content-Type: multipart/mixed;
 boundary="------------5EF8B48D71E8C3FA94A7414B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5EF8B48D71E8C3FA94A7414B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.10.21 12:57, Jan Beulich wrote:
> On 20.10.2021 10:04, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Oct 15, 2021 at 11:48:33AM +0200, Jan Beulich wrote:
>>> On 15.10.2021 11:39, Jan Beulich wrote:
>>>> On 22.09.2021 10:21, Roger Pau Monne wrote:
>>>>> --- a/xen/include/public/domctl.h
>>>>> +++ b/xen/include/public/domctl.h
>>>>> @@ -87,14 +87,22 @@ struct xen_domctl_createdomain {
>>>>>       /*
>>>>>        * Various domain limits, which impact the quantity of resour=
ces
>>>>>        * (global mapping space, xenheap, etc) a guest may consume. =
 For
>>>>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use th=
e
>>>>> -     * default maximum value in the hypervisor".
>>>>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_versio=
n < 0
>>>>> +     * means "use the default maximum value in the hypervisor".
>>>>>        */
>>>>>       uint32_t max_vcpus;
>>>>>       uint32_t max_evtchn_port;
>>>>>       int32_t max_grant_frames;
>>>>>       int32_t max_maptrack_frames;
>>>>>  =20
>>>>> +/* Grant version, use low 4 bits. */
>>>>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
>>>>> +#define XEN_DOMCTL_GRANT_version_default 0xf
>>>>> +
>>>>> +#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
>>>>> +
>>>>> +    uint32_t grant_opts;
>>>>
>>>> As it now seems unlikely that this will make 4.16, please don't forg=
et
>>>> to bump the interface version for 4.17. With that and preferably wit=
h
>>>> the nit above addressed, hypervisor parts:
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Actually no, I'm afraid there is an issue with migration: If the tool=

>>> stack remembers the "use default" setting and hands this to the new
>>> host, that host's default may be different from the source host's. It=

>>> is the effective max-version that needs passing on in this case, whic=
h
>>> in turn requires a means to obtain the value.
>>
>> Hm, my thinking was that the admin (or a higer level orchestration
>> tool) would already have performed the necessary adjustments to assert=

>> the environments are compatible.
>=20
> I don't think we can rely on this in the hypervisor. We may take this
> as a prereq for proper working, but I think we ought to detect
> violations and report errors in such a case.
>=20
>> This problem already exist today where you can migrate a VM from a
>> host having the max default grant version to one having
>> gnttab=3Dmax-ver:1 without complains.
>=20
> Are you sure about "without complaints"? What would a guest do if it
> expects to be able to use v2, since it was able to on the prior host?

A Linux guest should "just work". On resume it is setting up the grant
interface again like on boot (in fact there is one difference: the
number of grant frames is kept from before suspending).

Guest transparent migration wouldn't work in such a case, and I have no
idea how other OS's will react.


Juergen

--------------5EF8B48D71E8C3FA94A7414B
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

--------------5EF8B48D71E8C3FA94A7414B--

--YevP9PZvckMQptO720Ak6QVp5z6Y1P2Ix--

--1fkSp4VMzBO8cyJHSkWawTmj7a6yPzO6V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFwAVYFAwAAAAAACgkQsN6d1ii/Ey8J
yAf/RtkZFRGaZ/EK/IpeWaI3zct6cbONzlP4gmVKSPqG6tBTT7SoR0IyELeDOYsRnOggSBXxVizB
m2je4zOMN29inwU5aTguKGCom194fzjyZDK+u9dabO0TG1B5gOGNkFfqPDCIU0S+48Ntw9eu56kT
Wm4KB6Xc5SP6q74fZaHc3SzX03y4MFS1mJ0sOg3qQor/VLTNFPLcWOhLv9SplgBRCyU7hyoPCd/o
/n4RdLyJhV57/B4qXfPq0FuQUJRlYnrkJ136UrfH/eul9fPTaPMsZA0ad2EcY1swGVGkXTublXQe
BsgPVpxFV6JLy9Azv/SRwKYW0A0cw6ep+Kupgse5LQ==
=pDl9
-----END PGP SIGNATURE-----

--1fkSp4VMzBO8cyJHSkWawTmj7a6yPzO6V--

