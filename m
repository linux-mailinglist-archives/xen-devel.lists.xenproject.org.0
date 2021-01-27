Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F200A30585D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75931.136922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4i2Q-0003nx-Uu; Wed, 27 Jan 2021 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75931.136922; Wed, 27 Jan 2021 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4i2Q-0003nY-RY; Wed, 27 Jan 2021 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 75931;
 Wed, 27 Jan 2021 10:27:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFzC=G6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l4i2P-0003nT-1T
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:27:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d4a7a4f-fd58-4fe0-9f2a-6aaf43559f0c;
 Wed, 27 Jan 2021 10:26:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C194FADA2;
 Wed, 27 Jan 2021 10:26:57 +0000 (UTC)
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
X-Inumbo-ID: 0d4a7a4f-fd58-4fe0-9f2a-6aaf43559f0c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611743217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCSEw5IKbkt10LxDH6btSRzN19f+vZPTc+6q9fs5sDY=;
	b=HD0DlG+ubmbiz6DcviGqYBxD/AwSgSiI/PhM+su5op3Y3XArbAUis4ytG344D6mO9qbCxT
	zWSwPOC6QjJg2G6vdpC+HVCJhl5mnSyEgEfMx9ITlhNgncUvJPX/sQ0417rIeiB6t6Qw1z
	iMhyLbt1d2ojIBxU+CufyI60NFt0FHg=
Subject: Re: [PATCH v2] x86/xen: avoid warning in Xen pv guest with
 CONFIG_AMD_MEM_ENCRYPT enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20210127093822.18570-1-jgross@suse.com>
 <fb2305a4-4741-c641-9639-5b17b63f2baf@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2dc49fae-bf35-7c7d-2d86-338665db27ca@suse.com>
Date: Wed, 27 Jan 2021 11:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <fb2305a4-4741-c641-9639-5b17b63f2baf@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ae0qWicHCmbfPiNOK9GAVSDefNkktA1hT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ae0qWicHCmbfPiNOK9GAVSDefNkktA1hT
Content-Type: multipart/mixed; boundary="7jkOIed7ZUVZJSS2ImsckjQxSXeAfqxSB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Message-ID: <2dc49fae-bf35-7c7d-2d86-338665db27ca@suse.com>
Subject: Re: [PATCH v2] x86/xen: avoid warning in Xen pv guest with
 CONFIG_AMD_MEM_ENCRYPT enabled
References: <20210127093822.18570-1-jgross@suse.com>
 <fb2305a4-4741-c641-9639-5b17b63f2baf@citrix.com>
In-Reply-To: <fb2305a4-4741-c641-9639-5b17b63f2baf@citrix.com>

--7jkOIed7ZUVZJSS2ImsckjQxSXeAfqxSB
Content-Type: multipart/mixed;
 boundary="------------6EDABF7462AFF4137F4C713B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6EDABF7462AFF4137F4C713B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.01.21 10:43, Andrew Cooper wrote:
> On 27/01/2021 09:38, Juergen Gross wrote:
>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c=

>> index 4409306364dc..ca5ac10fcbf7 100644
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -583,6 +583,12 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
>>   		exc_debug(regs);
>>   }
>>  =20
>> +DEFINE_IDTENTRY_RAW(exc_xen_unknown_trap)
>> +{
>> +	/* This should never happen and there is no way to handle it. */
>> +	panic("Unknown trap in Xen PV mode.");
>=20
> Looks much better.=C2=A0 How about including regs->entry_vector here, j=
ust to
> short circuit the inevitable swearing which will accompany encountering=

> this panic() ?

You are aware the regs parameter is struct pt_regs *, not the Xen
struct cpu_user_regs *?

So I have no idea how I should get this information without creating
a per-vector handler.


Juergen

--------------6EDABF7462AFF4137F4C713B
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------6EDABF7462AFF4137F4C713B--

--7jkOIed7ZUVZJSS2ImsckjQxSXeAfqxSB--

--Ae0qWicHCmbfPiNOK9GAVSDefNkktA1hT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmARP/AFAwAAAAAACgkQsN6d1ii/Ey8H
KQf/d1qSrElkCAvRhLViB1sKaD8JgIQ7K8qv9q/g4aa6727Q7UcRwqqXX/ktKjEnCQhBdnFdKUDQ
RqPHHVLASanPanrfEPT2ciZxCIn7iSVSoK9ivrWQWSALyoROYanMGh/Hgm6MxHcaZGi2Ft5BXSgc
tFfl3mlP8WUIkJSg/OT2zbiJAs0ZxruwoA6wpASzHxxjenl3UycAEx9Gg+jVJo5ENsv5pJNVwIa2
1GD+MuuIMjnnS5O6+doKlxis7qUdQZYXuHrHtN59nw7rTGlwhESo45jesuOMf2gGKYV30rWE0LaH
E1bNYskTbuHW0NwVidVkpOJ4UZ7CfvPRxPPEbrp4nw==
=vR4K
-----END PGP SIGNATURE-----

--Ae0qWicHCmbfPiNOK9GAVSDefNkktA1hT--

