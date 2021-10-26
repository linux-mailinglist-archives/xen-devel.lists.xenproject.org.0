Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B443ACF8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 09:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216247.375773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGea-0002wX-4C; Tue, 26 Oct 2021 07:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216247.375773; Tue, 26 Oct 2021 07:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGea-0002u9-0A; Tue, 26 Oct 2021 07:13:48 +0000
Received: by outflank-mailman (input) for mailman id 216247;
 Tue, 26 Oct 2021 07:13:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSYy=PO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfGeY-0002tM-KY
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 07:13:46 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 418fa05c-362c-11ec-8428-12813bfff9fa;
 Tue, 26 Oct 2021 07:13:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6238821940;
 Tue, 26 Oct 2021 07:13:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2E5A13CCA;
 Tue, 26 Oct 2021 07:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7H0bOaeqd2GLLwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Oct 2021 07:13:43 +0000
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
X-Inumbo-ID: 418fa05c-362c-11ec-8428-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635232424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XIm7H1NXWQguuHEZW7jiUPfL4o978yLyAtodWckzLYY=;
	b=OiXOrzavk+ZMCxE4aEaKbQH+B+PWdUpKOYJ58wshKojoNJd2V2MrgqckBz2BcivwISOdYc
	mNGAa6KfooqJ8tj9dNm3AodRvKeN+HHtrNXbAv56pQB6p91vRGmW4Wr7Krrgdd9xMiCC7g
	oz6xH+B7JV5Xnz8Dh9+YhhhkYaYWX24=
Subject: Re: [PATCH] xen: Fix implicit type conversion
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <1635218868-2437564-1-git-send-email-jiasheng@iscas.ac.cn>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b85fc46c-1c0c-87e6-3221-c13fb98856ec@suse.com>
Date: Tue, 26 Oct 2021 09:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1635218868-2437564-1-git-send-email-jiasheng@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="99XBLDRORLEoblM9AoV0HXYmPlxUqqJQ8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--99XBLDRORLEoblM9AoV0HXYmPlxUqqJQ8
Content-Type: multipart/mixed; boundary="qJkaCkRICl179ZSYKmG00kVO89yJ36MR1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <b85fc46c-1c0c-87e6-3221-c13fb98856ec@suse.com>
Subject: Re: [PATCH] xen: Fix implicit type conversion
References: <1635218868-2437564-1-git-send-email-jiasheng@iscas.ac.cn>
In-Reply-To: <1635218868-2437564-1-git-send-email-jiasheng@iscas.ac.cn>

--qJkaCkRICl179ZSYKmG00kVO89yJ36MR1
Content-Type: multipart/mixed;
 boundary="------------BF424F510ECB9792D93575FD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BF424F510ECB9792D93575FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.10.21 05:27, Jiasheng Jiang wrote:
> The variable 'i' is defined as UINT.
> However in the for_each_possible_cpu, its value is assigned to -1.
> That doesn't make sense and in the cpumask_next() it is implicitly
> type conversed to INT.
> It is universally accepted that the implicit type conversion is
> terrible.
> Also, having the good programming custom will set an example for
> others.
> Thus, it might be better to change the definition of 'i' from UINT
> to INT.
>=20
> Fixes: 3fac101 ("xen: Re-upload processor PM data to hypervisor after S=
3 resume (v2)")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/xen/xen-acpi-processor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-pr=
ocessor.c
> index df7cab8..2551691 100644
> --- a/drivers/xen/xen-acpi-processor.c
> +++ b/drivers/xen/xen-acpi-processor.c
> @@ -518,7 +518,7 @@ static struct syscore_ops xap_syscore_ops =3D {
>  =20
>   static int __init xen_acpi_processor_init(void)
>   {
> -	unsigned int i;
> +	int i;

I agree with the approach, but could you please fix all the other
similar issues in that file, please?

The same should be done in free_acpi_perf_data() and in
xen_upload_processor_pm_data().


Juergen

--------------BF424F510ECB9792D93575FD
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

--------------BF424F510ECB9792D93575FD--

--qJkaCkRICl179ZSYKmG00kVO89yJ36MR1--

--99XBLDRORLEoblM9AoV0HXYmPlxUqqJQ8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF3qqcFAwAAAAAACgkQsN6d1ii/Ey+D
TwgAiaYgm6f+6d+KtD421JSmH4FGKVs85spfNEElB4K7+haiEEg2zF6Jc58dsZY5WClzZerZCakD
BovSX+M/aWTQ1p/2yvtjp4hMzcB3IQXuACXT30Z1nXMbLoIPXMmZaN60946iW3rJ70RSWjbsKzH4
OBiGZJI6KjmnO95sRjVVpLrUO+Y7uVMATRSWmH9kJQVGa41I3Gw6km5ScZncIp3K/Qh6Ahg9aUzm
Z8ZlwZu4j2I/8t0/7bfhfT7IZkMMQsLGDr4TJ+Ee79Szc/3mDQSp/xxai3EAjRufyYou+DHfrgml
LH2sOcqgBCKQ5JoSt1+kKdTSFoxCpbFHJSbXcyhyeA==
=AWwJ
-----END PGP SIGNATURE-----

--99XBLDRORLEoblM9AoV0HXYmPlxUqqJQ8--

