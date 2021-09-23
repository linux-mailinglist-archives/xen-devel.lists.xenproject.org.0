Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6941416201
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194456.346415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQbP-00007S-Fm; Thu, 23 Sep 2021 15:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194456.346415; Thu, 23 Sep 2021 15:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQbP-0008VP-CM; Thu, 23 Sep 2021 15:25:35 +0000
Received: by outflank-mailman (input) for mailman id 194456;
 Thu, 23 Sep 2021 15:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTQbN-0008VJ-49
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:25:33 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfb6bf79-9ac5-4a67-a859-21cf5f5b4e41;
 Thu, 23 Sep 2021 15:25:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F8A622259;
 Thu, 23 Sep 2021 15:25:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3927313E6E;
 Thu, 23 Sep 2021 15:25:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GFygDGucTGGrDgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 15:25:31 +0000
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
X-Inumbo-ID: cfb6bf79-9ac5-4a67-a859-21cf5f5b4e41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632410731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ej12isJcowNNLOgeaywRRKDnV7BrcTMYPQN4LE2jtM=;
	b=nk/pt2Cd+40MLiSy77vU9N0l6Hgyxkt9XZ6YBuEUBjCL/+lRzsPQKnh24s+RsgPJX+ufyX
	5Zyvx/LsIrJW5w4gLm2dTqGpP01Tt+s6VnezQ6lNtSUTk+dfhmRR+BFczXPPmUiJPz8H05
	4LG0d1lTw2IBepayEdBxxf5/TQIkxXw=
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
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
Message-ID: <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
Date: Thu, 23 Sep 2021 17:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PFXOQuIsPnpM36gnvqC8IX13s63RGmP6X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PFXOQuIsPnpM36gnvqC8IX13s63RGmP6X
Content-Type: multipart/mixed; boundary="mUFqiPeflUgtMo9r5bhO1fdNfDpEYCym1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <e095eec1-f35b-ca35-9ad1-54c817e61408@suse.com>
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
 <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
 <89cb2d39-2bfc-dccf-8e92-39e4e952750d@suse.com>
 <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>
In-Reply-To: <f613a83c-2b29-23eb-ca78-a8a75a67f651@suse.com>

--mUFqiPeflUgtMo9r5bhO1fdNfDpEYCym1
Content-Type: multipart/mixed;
 boundary="------------C640D5E0E67FA74A447A863B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C640D5E0E67FA74A447A863B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.09.21 17:19, Jan Beulich wrote:
> On 23.09.2021 17:15, Juergen Gross wrote:
>> On 23.09.21 17:10, Jan Beulich wrote:
>>> On 23.09.2021 16:59, Juergen Gross wrote:
>>>> On 07.09.21 12:11, Jan Beulich wrote:
>>>>> This was effectively lost while dropping PVHv1 code. Move the funct=
ion
>>>>> and arrange for it to be called the same way as done in PV mode. Cl=
early
>>>>> this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_a=
d
>>>>> check that was recently removed, as that's a PV-only feature.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/arch/x86/xen/enlighten.c
>>>>> +++ b/arch/x86/xen/enlighten.c
>>>>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>>>>     	return ((per_cpu(xen_vcpu, cpu) =3D=3D NULL) ? -ENODEV : 0);
>>>>>     }
>>>>>    =20
>>>>> +void __init xen_banner(void)
>>>>> +{
>>>>> +	unsigned version =3D HYPERVISOR_xen_version(XENVER_version, NULL)=
;
>>>>> +	struct xen_extraversion extra;
>>>>
>>>> Please add a blank line here.
>>>
>>> Oops.
>>>
>>>>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>>>>> +
>>>>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
>>>>
>>>> Is this correct? I don't think the kernel needs to be paravirtualize=
d
>>>> with PVH (at least not to the same extend as for PV).
>>>
>>> What else do you suggest the message to say? Simply drop
>>> "paravirtualized"? To some extent it is applicable imo, further
>>> qualified by pv_info.name. And that's how it apparently was with
>>> PVHv1.
>>
>> The string could be selected depending on CONFIG_XEN_PV.
>=20
> Hmm, now I'm confused: Doesn't this setting control whether the kernel
> can run in PV mode? If so, that functionality being present should have=

> no effect on the functionality of the kernel when running in PVH mode.
> So what you suggest would end up in misleading information imo.

Hmm, yes, I mixed "paravirtualized" with "capable to run
paravirtualized".

So the string should depend on xen_pv_domain().


Juergen

--------------C640D5E0E67FA74A447A863B
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

--------------C640D5E0E67FA74A447A863B--

--mUFqiPeflUgtMo9r5bhO1fdNfDpEYCym1--

--PFXOQuIsPnpM36gnvqC8IX13s63RGmP6X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMnGoFAwAAAAAACgkQsN6d1ii/Ey9z
uwf8C88vGxy+hk85cObqee7HTXy4o0t1QPe02mx9fEDsYrOnesJBQwrBX3BlYbUDMXUpsMxqMOgi
jcUTJIExSYGXCKmp8OS9+8bBxlO7kk1T+G7qDDgUqcZW6WJHY8BekoKTfzvk9oS3eW49KPrJyEwM
1udbzsYB9VNNUAklxFJ5k7kVR6YHVQpAfq+2wC2+UPffHjgpZW9kmRs8lS5PcTONWQCSvWY9mbth
aAzP6/ImzElQmRGrtJ02N82o5e+T38hc53wZW3uvOQvdJb22iSH2uzw+uRmo9cS1ZHuMpwyX0akw
Xrr01pTaSeTTDIFatD6AnAy4toV9nz3xX9jvY9BjCw==
=PcsT
-----END PGP SIGNATURE-----

--PFXOQuIsPnpM36gnvqC8IX13s63RGmP6X--

