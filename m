Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE883A97F2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 12:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142845.263449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltT14-0005y0-UT; Wed, 16 Jun 2021 10:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142845.263449; Wed, 16 Jun 2021 10:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltT14-0005ux-Qr; Wed, 16 Jun 2021 10:43:26 +0000
Received: by outflank-mailman (input) for mailman id 142845;
 Wed, 16 Jun 2021 10:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltT13-0005ur-Dq
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 10:43:25 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2bd153-6eb0-4245-a224-e0501f2e24a2;
 Wed, 16 Jun 2021 10:43:24 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0E78219D6;
 Wed, 16 Jun 2021 10:43:23 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6E6DF118DD;
 Wed, 16 Jun 2021 10:43:23 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dDzIGcvVyWD4VQAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 16 Jun 2021 10:43:23 +0000
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
X-Inumbo-ID: 3c2bd153-6eb0-4245-a224-e0501f2e24a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623840203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb/rTfViqgn/up8wJQ8Yp+8BLgpyC0oL3NZRhwy1EjM=;
	b=iZJqsfEt4IlOt/DOipSdqvicm54qbRFcmtYCAkNzVbMhGQ6sZ+IWJY2hJqSrH5ePW++wY/
	gusZGx+7LXRlIiEjEiMqAsMwcQlMnjboE5LfAUQq0+kqnT71lmOvWlS/0gxeW8Sr/nPh07
	YfHv1BAZQmsynoOETzu8jhG8OQ6kn3M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623840203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb/rTfViqgn/up8wJQ8Yp+8BLgpyC0oL3NZRhwy1EjM=;
	b=iZJqsfEt4IlOt/DOipSdqvicm54qbRFcmtYCAkNzVbMhGQ6sZ+IWJY2hJqSrH5ePW++wY/
	gusZGx+7LXRlIiEjEiMqAsMwcQlMnjboE5LfAUQq0+kqnT71lmOvWlS/0gxeW8Sr/nPh07
	YfHv1BAZQmsynoOETzu8jhG8OQ6kn3M=
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
Message-ID: <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
Date: Wed, 16 Jun 2021 12:43:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xuNDAfV0ocaoXYJt1qoHabXYUrAOASd1N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xuNDAfV0ocaoXYJt1qoHabXYUrAOASd1N
Content-Type: multipart/mixed; boundary="yn2w8Vnh1nN6dHx4ICehFvVeJJ4q41bwl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
In-Reply-To: <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>

--yn2w8Vnh1nN6dHx4ICehFvVeJJ4q41bwl
Content-Type: multipart/mixed;
 boundary="------------4AEF556428C2D08DB245AC5A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4AEF556428C2D08DB245AC5A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 11:56, Jan Beulich wrote:
> On 16.06.2021 09:30, Juergen Gross wrote:
>> --- a/arch/x86/xen/p2m.c
>> +++ b/arch/x86/xen/p2m.c
>> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>>   EXPORT_SYMBOL_GPL(xen_p2m_addr);
>>   unsigned long xen_p2m_size __read_mostly;
>>   EXPORT_SYMBOL_GPL(xen_p2m_size);
>> -unsigned long xen_max_p2m_pfn __read_mostly;
>> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
>> +unsigned long xen_p2m_max_size __read_mostly;
>> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);
>=20
> Instead of renaming the exported variable (which will break consumers
> anyway), how about dropping the apparently unneeded export at this
> occasion?

Why do you think it isn't needed? It is being referenced via the inline
function __pfn_to_mfn() in arch/x86/include/asm/xen/page.h. And
__pfn_to_mfn() is used via lots of other inline functions and macros.

> Further it looks to me as if xen_p2m_size and this variable
> were actually always kept in sync, so I'd like to put up the question
> of dropping one of the two.

Hmm, should be possible, yes.

>=20
>> @@ -121,7 +121,7 @@ static pte_t *p2m_identity_pte;
>>    * can avoid scanning the whole P2M (which may be sized to account f=
or
>>    * hotplugged memory).
>>    */
>> -static unsigned long xen_p2m_last_pfn;
>> +static unsigned long xen_p2m_pfn_limit;
>=20
> As to the comment remark in patch 1: You don't alter the comment
> here either, and "limit" still doesn't make clear whether that's an
> inclusive or exclusive limit.

Oh, indeed. Will fix that.


Juergen

--------------4AEF556428C2D08DB245AC5A
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

--------------4AEF556428C2D08DB245AC5A--

--yn2w8Vnh1nN6dHx4ICehFvVeJJ4q41bwl--

--xuNDAfV0ocaoXYJt1qoHabXYUrAOASd1N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDJ1coFAwAAAAAACgkQsN6d1ii/Ey+E
xAf+JOLQ5Gtcr4+HH7tJx/skcMTr4v4NFPbV4rcwXsYKzElIbBDOoTQY0X3nndWsvOyYJS0WLjPd
cwxP5RhuTdgwKi5ReJ0+M25tL/T/5E9WRovxXHi5AyYw8IXJ47XzXQYHIods7ZtlCH9VJwSLblaF
UfkkBd8jgoCInCkszeD5nYmpm+zV0H0loCLK0QcJCSiHrZy2Hw4w1F5S1v6FZ4/MT/MpOx3OGB/j
bW0SssPOmlwnXO05w8gLw0TvoJBu2sUVdYDZIePFfxfZkjR1PV8XB//slMiCpoB67XYWidEZ77Sa
D6jQ3ep2sbqZgTnW+Lx895wXqcneGxSqq51n+beLzQ==
=cvhV
-----END PGP SIGNATURE-----

--xuNDAfV0ocaoXYJt1qoHabXYUrAOASd1N--

