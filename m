Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9841BFE9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198657.352261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1l-0005h4-0f; Wed, 29 Sep 2021 07:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198657.352261; Wed, 29 Sep 2021 07:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1k-0005dn-Sy; Wed, 29 Sep 2021 07:29:16 +0000
Received: by outflank-mailman (input) for mailman id 198657;
 Wed, 29 Sep 2021 07:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVU1j-0005a5-Rs
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:29:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb613999-5047-4698-aa39-578e7a473992;
 Wed, 29 Sep 2021 07:29:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E194224EC;
 Wed, 29 Sep 2021 07:29:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE0F713A81;
 Wed, 29 Sep 2021 07:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GzfrNMkVVGG9bQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Sep 2021 07:29:13 +0000
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
X-Inumbo-ID: cb613999-5047-4698-aa39-578e7a473992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632900554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4h7YMX3LLHXl2S8vcVGzM/WIVpMM9pP4B8+ifC55tfk=;
	b=qsDMJVPQ25FCCCnLnyvSFuiyu4QNd+rP2d1OfjdiFc0qQK+eyWF5yoIExoc9+/PFqxYTKC
	F1KxRE/P/qnLfhacw+uq9XS0HPVhvZKtZVjbu2YswGVKS65ukEeEmSGwG+mW/gQNjUx9/D
	9QWabMtI7eIUL/zE3jzwu4gpbmZYAFc=
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
 <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
 <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
 <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
 <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
 <1bcb3b62-8327-7da8-abdb-65ee965714a7@suse.com>
 <86a4d837-5603-39d0-4643-c31597d524df@suse.com>
 <ae73b283-fca4-de3f-d654-bde94405e05f@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7a8e5cdb-a871-0e86-86b6-66c30201b946@suse.com>
Date: Wed, 29 Sep 2021 09:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ae73b283-fca4-de3f-d654-bde94405e05f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MMQcAhhCjtW07P3U4QBPLy4Z2cS5VX1JL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MMQcAhhCjtW07P3U4QBPLy4Z2cS5VX1JL
Content-Type: multipart/mixed; boundary="UaLZCwVVKZGxpPOyBu4Wt0fV4LDwM5FmX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <7a8e5cdb-a871-0e86-86b6-66c30201b946@suse.com>
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
 <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
 <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
 <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
 <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
 <1bcb3b62-8327-7da8-abdb-65ee965714a7@suse.com>
 <86a4d837-5603-39d0-4643-c31597d524df@suse.com>
 <ae73b283-fca4-de3f-d654-bde94405e05f@suse.com>
In-Reply-To: <ae73b283-fca4-de3f-d654-bde94405e05f@suse.com>

--UaLZCwVVKZGxpPOyBu4Wt0fV4LDwM5FmX
Content-Type: multipart/mixed;
 boundary="------------E692F45CC8D35ECDC1CD735D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E692F45CC8D35ECDC1CD735D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.09.21 09:28, Jan Beulich wrote:
> On 29.09.2021 07:45, Juergen Gross wrote:
>> On 23.09.21 17:31, Jan Beulich wrote:
>>> On 23.09.2021 17:25, Juergen Gross wrote:
>>>> On 23.09.21 17:19, Jan Beulich wrote:
>>>>> On 23.09.2021 17:15, Juergen Gross wrote:
>>>>>> On 23.09.21 17:10, Jan Beulich wrote:
>>>>>>> On 23.09.2021 16:59, Juergen Gross wrote:
>>>>>>>> On 07.09.21 12:11, Jan Beulich wrote:
>>>>>>>>> This was effectively lost while dropping PVHv1 code. Move the f=
unction
>>>>>>>>> and arrange for it to be called the same way as done in PV mode=
=2E Clearly
>>>>>>>>> this then needs re-introducing the XENFEAT_mmu_pt_update_preser=
ve_ad
>>>>>>>>> check that was recently removed, as that's a PV-only feature.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>
>>>>>>>>> --- a/arch/x86/xen/enlighten.c
>>>>>>>>> +++ b/arch/x86/xen/enlighten.c
>>>>>>>>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>>>>>>>>       	return ((per_cpu(xen_vcpu, cpu) =3D=3D NULL) ? -ENODEV :=
 0);
>>>>>>>>>       }
>>>>>>>>>      =20
>>>>>>>>> +void __init xen_banner(void)
>>>>>>>>> +{
>>>>>>>>> +	unsigned version =3D HYPERVISOR_xen_version(XENVER_version, N=
ULL);
>>>>>>>>> +	struct xen_extraversion extra;
>>>>>>>>
>>>>>>>> Please add a blank line here.
>>>>>>>
>>>>>>> Oops.
>>>>>>>
>>>>>>>>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>>>>>>>>> +
>>>>>>>>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.nam=
e);
>>>>>>>>
>>>>>>>> Is this correct? I don't think the kernel needs to be paravirtua=
lized
>>>>>>>> with PVH (at least not to the same extend as for PV).
>>>>>>>
>>>>>>> What else do you suggest the message to say? Simply drop
>>>>>>> "paravirtualized"? To some extent it is applicable imo, further
>>>>>>> qualified by pv_info.name. And that's how it apparently was with
>>>>>>> PVHv1.
>>>>>>
>>>>>> The string could be selected depending on CONFIG_XEN_PV.
>>>>>
>>>>> Hmm, now I'm confused: Doesn't this setting control whether the ker=
nel
>>>>> can run in PV mode? If so, that functionality being present should =
have
>>>>> no effect on the functionality of the kernel when running in PVH mo=
de.
>>>>> So what you suggest would end up in misleading information imo.
>>>>
>>>> Hmm, yes, I mixed "paravirtualized" with "capable to run
>>>> paravirtualized".
>>>>
>>>> So the string should depend on xen_pv_domain().
>>>
>>> But that's already expressed by pv_info.name then being "Xen PV".
>>
>> True. Okay, I'm fine with just dropping "paravirtualized".
>=20
> Done. Do you want me to also make pr_info() vs printk(KERN_INFO ...)
> consistent in the function at this occasion? If so - which of the two?

pr_info(), please.


Juergen


--------------E692F45CC8D35ECDC1CD735D
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

--------------E692F45CC8D35ECDC1CD735D--

--UaLZCwVVKZGxpPOyBu4Wt0fV4LDwM5FmX--

--MMQcAhhCjtW07P3U4QBPLy4Z2cS5VX1JL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFUFckFAwAAAAAACgkQsN6d1ii/Ey+z
DQf/X8d9dogA6BM6662Ei5fM97QDmK4Q5eLr+oLP7OniSOhbVemUfgyUFdQoI5tx5qFnADmQrqsu
wSwr+0+ci7F1C6mUVbjQxeYWs0n1nbY5xS4bBVoNjBk+KDM7lhZhpghA3jbUHiZsK2nJlhooObCN
yntYic5yPi7YJ0vkdfCOdM/YWhP9OyfYBBmussH/OD1sz64ViL04T+qgHD3pZU7nc86tmvJZ0RZs
RgOxDEeqT03Q1rx0B0/ffKB7NyTvvw8J3u27DoEcAQYcvoYfdZ+YPwJvsXWJjWG4VDP3+P0s1Xi6
EEiPxPa3Nr0ixMWI5z5hV3Nik0We/uW9OAaK8agttQ==
=8Tbb
-----END PGP SIGNATURE-----

--MMQcAhhCjtW07P3U4QBPLy4Z2cS5VX1JL--

