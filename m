Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E3415C95
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193726.345096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMek-0007OC-Pi; Thu, 23 Sep 2021 11:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193726.345096; Thu, 23 Sep 2021 11:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMek-0007Ki-M8; Thu, 23 Sep 2021 11:12:46 +0000
Received: by outflank-mailman (input) for mailman id 193726;
 Thu, 23 Sep 2021 11:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTMej-0007Ka-Ap
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:12:45 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cb3bf9d-1c5f-11ec-ba2a-12813bfff9fa;
 Thu, 23 Sep 2021 11:12:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9419E1FFA5;
 Thu, 23 Sep 2021 11:12:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AFA313DCD;
 Thu, 23 Sep 2021 11:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +cGmECthTGEpegAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 11:12:43 +0000
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
X-Inumbo-ID: 2cb3bf9d-1c5f-11ec-ba2a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632395563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aEVPoxQen73SrDxSP+9kD2Kz53XX95G6TqvPawceJl0=;
	b=aMIMZ3p+NoahC+IwiLLRYLcRvVU9dvfBfQn/9wyv7qpmsc66wjyLirHMsuSYegGl79SY5s
	7X/s5hh43TI0cvshY647L+Bi+i46ymVBlv985tPGD2kdbgsGwZ9zuaiivCuSe2D8C4fmBp
	enCX7AFR4JnBcWeS7WwWHxXnsjhFLF0=
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210923095345.185489-1-andr2000@gmail.com>
 <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <478b9175-f21f-b77a-2bc1-ad230bbdf548@suse.com>
Date: Thu, 23 Sep 2021 13:12:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2lcwPdRBsDCp1LdWI77itRlY1UcSO1FMi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2lcwPdRBsDCp1LdWI77itRlY1UcSO1FMi
Content-Type: multipart/mixed; boundary="RabaBlNU167INrkhGG7TimY4gvZhpBVDu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <478b9175-f21f-b77a-2bc1-ad230bbdf548@suse.com>
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
References: <20210923095345.185489-1-andr2000@gmail.com>
 <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
In-Reply-To: <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>

--RabaBlNU167INrkhGG7TimY4gvZhpBVDu
Content-Type: multipart/mixed;
 boundary="------------A604B18524153844DF606DEF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A604B18524153844DF606DEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23.09.21 13:10, Jan Beulich wrote:
> On 23.09.2021 11:53, Oleksandr Andrushchenko wrote:
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -180,10 +180,34 @@ config SWIOTLB_XEN
>>   	select DMA_OPS
>>   	select SWIOTLB
>>  =20
>> +config XEN_PCI_STUB
>> +	bool
>> +
>> +config XEN_PCIDEV_STUB
>> +	tristate "Xen PCI-device stub driver"
>> +	depends on PCI && !X86 && XEN
>> +	depends on XEN_BACKEND
>> +	select XEN_PCI_STUB
>> +	default m
>> +	help
>> +	  The PCI device stub driver provides limited version of the PCI
>> +	  device backend driver without para-virtualized support for guests.=

>> +	  If you select this to be a module, you will need to make sure no
>> +	  other driver has bound to the device(s) you want to make visible t=
o
>> +	  other guests.
>> +
>> +	  The "hide" parameter (only applicable if backend driver is compile=
d
>> +	  into the kernel) allows you to bind the PCI devices to this module=

>> +	  from the default device drivers. The argument is the list of PCI B=
DFs:
>> +	  xen-pciback.hide=3D(03:00.0)(04:00.0)
>> +
>> +	  If in doubt, say m.
>> +
>>   config XEN_PCIDEV_BACKEND
>>   	tristate "Xen PCI-device backend driver"
>>   	depends on PCI && X86 && XEN
>>   	depends on XEN_BACKEND
>> +	select XEN_PCI_STUB
>=20
> Does kconfig not at least warn about this? The selected item has a
> "depends on !X88" conflicting with the "depends on X86" here.

XEN_PCI_STUB !=3D XEN_PCIDEV_STUB


Juergen

--------------A604B18524153844DF606DEF
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

--------------A604B18524153844DF606DEF--

--RabaBlNU167INrkhGG7TimY4gvZhpBVDu--

--2lcwPdRBsDCp1LdWI77itRlY1UcSO1FMi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMYSoFAwAAAAAACgkQsN6d1ii/Ey9F
jAf8Dbp2R2HZn0f7rIjof1tX1Os673CwlUaxnI/ciMK9PSwo6nvII9KPwHFeK+STusBQ3uAafvBB
ztdiA0zYckwVE0zjyvaHJ+oa1IY0b5Nqbbj2bBopu+uKB3ZKnX6JD4AL4ro/RudxQC4FMN8+ILrJ
rzFTLYN6ErnQztmwnkiJGDlx5xfkyMULySu8S1FDjkdo9nDHZUUZMIorLjT6XD9AWB9oW07yJA+V
S5ZtbPQL4gSHhsIRKoMLipSy3aZhWKYsqYNtan5wA0uMqKDF36fpJmQwoMMjb+FC1wDkdzv/HsQV
lJcIiLuHYA8UrA53yoQmVLEPkEaAd4WVg27q/ol6tA==
=uxBc
-----END PGP SIGNATURE-----

--2lcwPdRBsDCp1LdWI77itRlY1UcSO1FMi--

