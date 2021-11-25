Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11445DCD9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231519.400672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGIJ-0003V3-KK; Thu, 25 Nov 2021 15:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231519.400672; Thu, 25 Nov 2021 15:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGIJ-0003So-GQ; Thu, 25 Nov 2021 15:04:15 +0000
Received: by outflank-mailman (input) for mailman id 231519;
 Thu, 25 Nov 2021 15:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqGII-0003SZ-Aa
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:04:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f353a1da-4e00-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 16:04:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E7C01FD34;
 Thu, 25 Nov 2021 15:04:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE58913C3A;
 Thu, 25 Nov 2021 15:04:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eygFK+uln2HgIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 15:04:11 +0000
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
X-Inumbo-ID: f353a1da-4e00-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637852652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71Gn/xLF7wxtMMi8bI6HFnFTVDo5tdupsVVOA4H+vaw=;
	b=rXvkAa6t+S1M9laQ1fWlcG3R7qQJLTV8m+wZA5YwRH24Eyu9t3UTDgHsz+3F9b7akdylA5
	KWCUu/j0tnglx2oVQ1PX9MLSQEXY57yXePm/znBEqSSyARq1vnpUpFopr256YPy3vlr6rd
	2JoAem1VobSWwS2v5zgWET8YuvoRHtg=
Subject: Re: [PATCH 1/2] xen: make HYPERVISOR_get_debugreg() always_inline
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
References: <20211125092056.24758-1-jgross@suse.com>
 <20211125092056.24758-2-jgross@suse.com>
 <3c922d47-9eab-5150-f4c6-3db40a77599a@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c4a1657b-2904-0d10-3a95-07b84062eb52@suse.com>
Date: Thu, 25 Nov 2021 16:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3c922d47-9eab-5150-f4c6-3db40a77599a@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cTvb1TrDemrs7rZWKbuTGacbuFmBID4LS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cTvb1TrDemrs7rZWKbuTGacbuFmBID4LS
Content-Type: multipart/mixed; boundary="XrZRoueycgDK9qenwHRSZrKRri8rmwiiw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Message-ID: <c4a1657b-2904-0d10-3a95-07b84062eb52@suse.com>
Subject: Re: [PATCH 1/2] xen: make HYPERVISOR_get_debugreg() always_inline
References: <20211125092056.24758-1-jgross@suse.com>
 <20211125092056.24758-2-jgross@suse.com>
 <3c922d47-9eab-5150-f4c6-3db40a77599a@srcf.net>
In-Reply-To: <3c922d47-9eab-5150-f4c6-3db40a77599a@srcf.net>

--XrZRoueycgDK9qenwHRSZrKRri8rmwiiw
Content-Type: multipart/mixed;
 boundary="------------5906338CD015122B005CEF44"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5906338CD015122B005CEF44
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.11.21 16:00, Andrew Cooper wrote:
> On 25/11/2021 09:20, Juergen Gross wrote:
>> HYPERVISOR_get_debugreg() is being called from noinstr code, so it
>> should be attributed "always_inline".
>>
>> Fixes: f4afb713e5c3a4419ba ("x86/xen: Make get_debugreg() noinstr")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/include/asm/xen/hypercall.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/a=
sm/xen/hypercall.h
>> index 0575f5863b7f..28ca1119606b 100644
>> --- a/arch/x86/include/asm/xen/hypercall.h
>> +++ b/arch/x86/include/asm/xen/hypercall.h
>> @@ -287,7 +287,7 @@ HYPERVISOR_set_debugreg(int reg, unsigned long val=
ue)
>>   	return _hypercall2(int, set_debugreg, reg, value);
>>   }
>>  =20
>> -static inline unsigned long
>> +static __always_inline unsigned long
>>   HYPERVISOR_get_debugreg(int reg)
>>   {
>>   	return _hypercall1(unsigned long, get_debugreg, reg);
>=20
> All this is going to do is push the error one step further in.
>=20
> Next, objtool will complain that hypercall_page isn't noinstr.

I don't think so:

=2Epushsection .noinstr.text, "ax"
         .balign PAGE_SIZE
SYM_CODE_START(hypercall_page)
         .rept (PAGE_SIZE / 32)
                 UNWIND_HINT_FUNC
                 .skip 31, 0x90
                 ret
         .endr


Juergen

--------------5906338CD015122B005CEF44
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

--------------5906338CD015122B005CEF44--

--XrZRoueycgDK9qenwHRSZrKRri8rmwiiw--

--cTvb1TrDemrs7rZWKbuTGacbuFmBID4LS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGfpesFAwAAAAAACgkQsN6d1ii/Ey/E
dQf8DdZ7eB+R+VSU+fGFTtjcyA2aPXevi/ePGxJIGBBNmPOmn77qMoIJ9mnNs+aaGGIpWtypXG41
n/UAscmGGYCP7R+qVXUS9T56YmXhQruBlgHSUqQ3BWv/Q9dXtTi1BNfGeYwFLNyLsMpdIdnbjdwJ
PN0AZN9OIckQXYKD/o41cd80a74jljOgCHoFkg9QPATyfVbJDDLSI9xILaKAGVsic4D6/3yXdHx5
D40UG2HRwdijy8JtXF7jYrxKZ4oi35oWiH1Ep6wcSnjZtXC4yWkQ9VzKMfcGVHHKJ2B3pvBbVKv1
OKy/Lls52+6u1b54KBO53I1Ya349oypr0d91ZnTqBg==
=SX/C
-----END PGP SIGNATURE-----

--cTvb1TrDemrs7rZWKbuTGacbuFmBID4LS--

