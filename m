Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CC4157A8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 06:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193411.344498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTGbQ-0006vr-63; Thu, 23 Sep 2021 04:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193411.344498; Thu, 23 Sep 2021 04:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTGbQ-0006t7-2Y; Thu, 23 Sep 2021 04:44:56 +0000
Received: by outflank-mailman (input) for mailman id 193411;
 Thu, 23 Sep 2021 04:44:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTGbO-0006t1-2d
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 04:44:54 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fda70712-1c28-11ec-ba13-12813bfff9fa;
 Thu, 23 Sep 2021 04:44:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5C5822304;
 Thu, 23 Sep 2021 04:44:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D2B113DBB;
 Thu, 23 Sep 2021 04:44:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TWNPHUMGTGHlNwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 04:44:51 +0000
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
X-Inumbo-ID: fda70712-1c28-11ec-ba13-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632372291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DS1OShxkN081ActC9VohxvjjWhXQsUmGfkvB+j0Sq4=;
	b=NxKyAbJyMgEPCr4dSNHUkVYCcpBq8h4ByundRC9cvA4lsE4KPrue+SiaBi7yzhPxl8HhrZ
	jITXbjboLxn7r1+fA/d5DKm+Zm0Xfc1CWQa4nDujoUZwGkWwpVQayUeMYhV+ZlPw+OjWsd
	TrSZkpkSTvUiO0G1dTM319PHna12LRo=
Subject: Re: [PATCH v2 1/2] x86/xen: remove xen_have_vcpu_info_placement flag
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210922103102.3589-1-jgross@suse.com>
 <20210922103102.3589-2-jgross@suse.com>
 <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7de79902-e31b-899d-44bb-f9daabb2ecf0@suse.com>
Date: Thu, 23 Sep 2021 06:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7p42MbmcR2R1URc5b0nLq1zIkTD8u7F9m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7p42MbmcR2R1URc5b0nLq1zIkTD8u7F9m
Content-Type: multipart/mixed; boundary="IlXSuJXAwFX31QSGBlKtSGJwPbIgwtFQl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <7de79902-e31b-899d-44bb-f9daabb2ecf0@suse.com>
Subject: Re: [PATCH v2 1/2] x86/xen: remove xen_have_vcpu_info_placement flag
References: <20210922103102.3589-1-jgross@suse.com>
 <20210922103102.3589-2-jgross@suse.com>
 <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>
In-Reply-To: <212d31cd-650d-27c6-b523-fd4f686872d1@oracle.com>

--IlXSuJXAwFX31QSGBlKtSGJwPbIgwtFQl
Content-Type: multipart/mixed;
 boundary="------------2D82B1FDA2C0BF04A0178389"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2D82B1FDA2C0BF04A0178389
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.09.21 23:43, Boris Ostrovsky wrote:
>=20
> On 9/22/21 6:31 AM, Juergen Gross wrote:
>>  =20
>> -	if (xen_have_vcpu_info_placement) {
>> -		vcpup =3D &per_cpu(xen_vcpu_info, cpu);
>> -		info.mfn =3D arbitrary_virt_to_mfn(vcpup);
>> -		info.offset =3D offset_in_page(vcpup);
>> +	vcpup =3D &per_cpu(xen_vcpu_info, cpu);
>> +	info.mfn =3D arbitrary_virt_to_mfn(vcpup);
>> +	info.offset =3D offset_in_page(vcpup);
>>  =20
>> -		/*
>> -		 * Check to see if the hypervisor will put the vcpu_info
>> -		 * structure where we want it, which allows direct access via
>> -		 * a percpu-variable.
>> -		 * N.B. This hypercall can _only_ be called once per CPU.
>> -		 * Subsequent calls will error out with -EINVAL. This is due to
>> -		 * the fact that hypervisor has no unregister variant and this
>> -		 * hypercall does not allow to over-write info.mfn and
>> -		 * info.offset.
>> -		 */
>> -		err =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info,
>> -					 xen_vcpu_nr(cpu), &info);
>> -
>> -		if (err) {
>> -			pr_warn_once("register_vcpu_info failed: cpu=3D%d err=3D%d\n",
>> -				     cpu, err);
>> -			xen_have_vcpu_info_placement =3D 0;
>> -		} else {
>> -			/*
>> -			 * This cpu is using the registered vcpu info, even if
>> -			 * later ones fail to.
>> -			 */
>> -			per_cpu(xen_vcpu, cpu) =3D vcpup;
>> -		}
>> -	}
>> -
>> -	if (!xen_have_vcpu_info_placement)
>> -		xen_vcpu_info_reset(cpu);
>> +	/*
>> +	 * N.B. This hypercall can _only_ be called once per CPU.
>> +	 * Subsequent calls will error out with -EINVAL. This is due to
>> +	 * the fact that hypervisor has no unregister variant and this
>> +	 * hypercall does not allow to over-write info.mfn and
>> +	 * info.offset.
>> +	 */
>> +	err =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cp=
u),
>> +				 &info);
>> +	if (err)
>> +		panic("register_vcpu_info failed: cpu=3D%d err=3D%d\n", cpu, err);
>>  =20
>=20
>=20
> This is change in behavior. Before if the hypercall failed we still try=
 to boot. I am not sure we need to worry about this (since it's not clear=
 it actually works)=C2=A0 but I'd at least mention this in the commit mes=
sage.

Hmm, maybe I should have been more explicit saying that the hypercall
was introduced in Xen 3.4, and only reason of failure is either an
illegal vcpu, an invalid mapping specification, or a try to reissue the
hypercall for a vcpu. None of those should ever happen.


Juergen

--------------2D82B1FDA2C0BF04A0178389
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

--------------2D82B1FDA2C0BF04A0178389--

--IlXSuJXAwFX31QSGBlKtSGJwPbIgwtFQl--

--7p42MbmcR2R1URc5b0nLq1zIkTD8u7F9m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMBkIFAwAAAAAACgkQsN6d1ii/Ey/C
QAf+MW8NU9ZWXXfs6ZXLLjQIV2BF+hUkXZKRQdnZdeNvIr2UQrI40xq5SihwSro9Tnr9vLldkD/y
2Krat7LKnzMF/MfK5XXm2v9iuTK3Rc/1AYCnovaiDbRJCd+h+3cWWccEyhNEtsjV7m70m9+E9oYV
zx0iarlETkSzZfilELCEFvgn037PJveprAhaODuxL8h7JV0zFwkGyUOowQz5TiY/iQ3Nmzv2GzF8
3WS/lzTV8NhJgMqwSVecAUBJkdRG/hCzxBuoTuPuaSp8YBSWwfgCtfWL3Cz1f3aLsBtGH4wi18L5
Wifa075NKRESCVJDxHEM2tbFJVfYiXXe4Wgxg9LwFw==
=c79E
-----END PGP SIGNATURE-----

--7p42MbmcR2R1URc5b0nLq1zIkTD8u7F9m--

