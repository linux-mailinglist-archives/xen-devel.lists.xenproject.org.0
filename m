Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EE40AC32
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 13:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186431.335157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Gh-0000Ed-Gy; Tue, 14 Sep 2021 11:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186431.335157; Tue, 14 Sep 2021 11:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6Gh-0000Bu-DT; Tue, 14 Sep 2021 11:06:27 +0000
Received: by outflank-mailman (input) for mailman id 186431;
 Tue, 14 Sep 2021 11:06:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ6Gf-0000Bo-Gb
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:06:25 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee6afe6-4360-4252-a4bb-6faef91203c9;
 Tue, 14 Sep 2021 11:06:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 932FE21F51;
 Tue, 14 Sep 2021 11:06:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A5E013D3F;
 Tue, 14 Sep 2021 11:06:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U4NADC+CQGFKewAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 11:06:23 +0000
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
X-Inumbo-ID: eee6afe6-4360-4252-a4bb-6faef91203c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631617583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5FxNj08CZ7D7xF1jTkAJfDCxzu7SlZTTuvd1FJwKeVk=;
	b=onsgYDREoW47skJj4r49hw+zmvw/8XSZgHOpYdh4JRLlFeDkFQ1RqqVx/JCZa6a5rQEltI
	K7sbB7ijciaQ0LtxT/tj/NtzNgQJ2LJ/JCBYvUbZWdNFu1yErmcDa+ZO1gRZ/vYVAmMmDF
	kW5kgqtxW1smaCkQWoMe5niFADJDIx8=
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <20210914094108.22482-1-jgross@suse.com>
 <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>
Date: Tue, 14 Sep 2021 13:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PYYcy5EsIvN2Mh4E4aFREQNEmA4Z3j9xW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PYYcy5EsIvN2Mh4E4aFREQNEmA4Z3j9xW
Content-Type: multipart/mixed; boundary="t0VTqccQOdjCg6wBQWftT76NFO9b4tjpL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <6cdc71dc-c26d-5c59-b7dd-0eb47ab9c861@suse.com>
Subject: Re: [PATCH] x86/setup: call early_reserve_memory() earlier
References: <20210914094108.22482-1-jgross@suse.com>
 <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>
In-Reply-To: <b15fa98e-f9a8-abac-2d16-83c29dafc517@suse.com>

--t0VTqccQOdjCg6wBQWftT76NFO9b4tjpL
Content-Type: multipart/mixed;
 boundary="------------262AC67502117700DCC747A9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------262AC67502117700DCC747A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.09.21 12:03, Jan Beulich wrote:
> On 14.09.2021 11:41, Juergen Gross wrote:
>> Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
>> reservations") introduced early_reserve_memory() to do all needed
>> initial memblock_reserve() calls in one function. Unfortunately the
>> call of early_reserve_memory() is done too late for Xen dom0, as in
>> some cases a Xen hook called by e820__memory_setup() will need those
>> memory reservations to have happened already.
>>
>> Move the call of early_reserve_memory() to the beginning of
>> setup_arch() in order to avoid such problems.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reserva=
tions")
>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/kernel/setup.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 79f164141116..f369c51ec580 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -757,6 +757,18 @@ dump_kernel_offset(struct notifier_block *self, u=
nsigned long v, void *p)
>>  =20
>>   void __init setup_arch(char **cmdline_p)
>>   {
>> +	/*
>> +	 * Do some memory reservations *before* memory is added to
>> +	 * memblock, so memblock allocations won't overwrite it.
>> +	 * Do it after early param, so we could get (unlikely) panic from
>> +	 * serial.
>=20
> Hmm, this part of the comment is not only stale now, but gets actively
> undermined. No idea how likely such a panic() would be, and hence how
> relevant it is to retain this particular property.

Ah, right.

The alternative would be to split it up again. Let's let the x86
maintainers decide which way is the better one.


Juergen

>=20
> Jan
>=20
>> +	 * After this point everything still needed from the boot loader or
>> +	 * firmware or kernel text should be early reserved or marked not
>> +	 * RAM in e820. All other memory is free game.
>> +	 */
>> +	early_reserve_memory();
>> +
>>   #ifdef CONFIG_X86_32
>>   	memcpy(&boot_cpu_data, &new_cpu_data, sizeof(new_cpu_data));
>>  =20
>> @@ -876,18 +888,6 @@ void __init setup_arch(char **cmdline_p)
>>  =20
>>   	parse_early_param();
>>  =20
>> -	/*
>> -	 * Do some memory reservations *before* memory is added to
>> -	 * memblock, so memblock allocations won't overwrite it.
>> -	 * Do it after early param, so we could get (unlikely) panic from
>> -	 * serial.
>> -	 *
>> -	 * After this point everything still needed from the boot loader or
>> -	 * firmware or kernel text should be early reserved or marked not
>> -	 * RAM in e820. All other memory is free game.
>> -	 */
>> -	early_reserve_memory();
>> -
>>   #ifdef CONFIG_MEMORY_HOTPLUG
>>   	/*
>>   	 * Memory used by the kernel cannot be hot-removed because Linux
>>
>=20


--------------262AC67502117700DCC747A9
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

--------------262AC67502117700DCC747A9--

--t0VTqccQOdjCg6wBQWftT76NFO9b4tjpL--

--PYYcy5EsIvN2Mh4E4aFREQNEmA4Z3j9xW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFAgi4FAwAAAAAACgkQsN6d1ii/Ey8P
bQf/bl8cCERGWocCyopsKc1tUuNDgMDxHRw4XwHm/SbBMOXOg1uVMrJ9Ysquf5rCZcn2zHocJplH
PQTvkKRNIr+1NCxdO90lu1tPNBLj0yT6JUk5n/bPEC+EVWTCYU+Eh0t5KNV1W0evto4OrMRU+oQK
R3zN/DfQQts3IxQxfjWA8rOff6HtRgtNEybiJh5OI/00tmIdr8qigad9J1W5s1iFHezLU2RbgjLj
6CBmrKVZdjatj942oBCN/xS1AdvtJHHlheptPSh/gdcFUl0FcOkhDh+C25/A3w9ev1ChLa+P9l46
Wlbop6C+gMGcgSpcpJaU3ivxNbdvze8UQcLardyC3g==
=uz1U
-----END PGP SIGNATURE-----

--PYYcy5EsIvN2Mh4E4aFREQNEmA4Z3j9xW--

