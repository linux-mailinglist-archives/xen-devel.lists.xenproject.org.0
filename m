Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CB2B4A76
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 17:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28518.57604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keh9a-0000sm-OJ; Mon, 16 Nov 2020 16:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28518.57604; Mon, 16 Nov 2020 16:14:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keh9a-0000sM-Kq; Mon, 16 Nov 2020 16:14:54 +0000
Received: by outflank-mailman (input) for mailman id 28518;
 Mon, 16 Nov 2020 16:14:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zhvb=EW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1keh9Y-0000sD-Vy
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:14:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c671058-066a-4d06-8e89-164d625d3135;
 Mon, 16 Nov 2020 16:14:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F83FABF4;
 Mon, 16 Nov 2020 16:14:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zhvb=EW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1keh9Y-0000sD-Vy
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:14:53 +0000
X-Inumbo-ID: 5c671058-066a-4d06-8e89-164d625d3135
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c671058-066a-4d06-8e89-164d625d3135;
	Mon, 16 Nov 2020 16:14:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605543291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lTyk9A6GGIcJAoS076O0S7xHALgB4HNkwhV5vuZqpwk=;
	b=ZPZN5D8lqmlYewhYgNSlFsQ2Ora4cljy8/rfRs988QzFMylI/mruDB0Ya8qDmnTqPR63nr
	1Tz3MK+afJKEHmkl0omh70DfCg1bxiFaZ6kNm1BJv26QfK/5lehM8QwgXzteKPTnuJnb+0
	052GkwV7/+9QYXi4xbo4SvEVoeBJbX4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1F83FABF4;
	Mon, 16 Nov 2020 16:14:51 +0000 (UTC)
Subject: Re: [PATCH 2/4] x86/xen: use specific Xen pv interrupt entry for DF
To: Andy Lutomirski <luto@amacapital.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201116152301.24558-1-jgross@suse.com>
 <20201116152301.24558-3-jgross@suse.com>
 <CALCETrWVSEB5zrUiZ81KaB5egx78TfDuSDv+qR3HFtJ=SKxwkQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c5af2206-28fb-a95c-e003-6d12594b915e@suse.com>
Date: Mon, 16 Nov 2020 17:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALCETrWVSEB5zrUiZ81KaB5egx78TfDuSDv+qR3HFtJ=SKxwkQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KV3Sotp1vrb9BEntdK4bhW84qAEyG2Rmb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KV3Sotp1vrb9BEntdK4bhW84qAEyG2Rmb
Content-Type: multipart/mixed; boundary="2HZrYXKuAhgHcBDOR5iPLffuBQQTs9hXe";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <c5af2206-28fb-a95c-e003-6d12594b915e@suse.com>
Subject: Re: [PATCH 2/4] x86/xen: use specific Xen pv interrupt entry for DF
References: <20201116152301.24558-1-jgross@suse.com>
 <20201116152301.24558-3-jgross@suse.com>
 <CALCETrWVSEB5zrUiZ81KaB5egx78TfDuSDv+qR3HFtJ=SKxwkQ@mail.gmail.com>
In-Reply-To: <CALCETrWVSEB5zrUiZ81KaB5egx78TfDuSDv+qR3HFtJ=SKxwkQ@mail.gmail.com>

--2HZrYXKuAhgHcBDOR5iPLffuBQQTs9hXe
Content-Type: multipart/mixed;
 boundary="------------00E5D34FFC63ED429A7BC194"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------00E5D34FFC63ED429A7BC194
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.11.20 17:12, Andy Lutomirski wrote:
> On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>>
>> Xen PV guests don't use IST. For double fault interrupts switch to
>> the same model as NMI.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/include/asm/idtentry.h | 3 +++
>>   arch/x86/xen/enlighten_pv.c     | 8 +++++++-
>>   arch/x86/xen/xen-asm.S          | 2 +-
>>   3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/id=
tentry.h
>> index 3505c0396fa5..b35825392547 100644
>> --- a/arch/x86/include/asm/idtentry.h
>> +++ b/arch/x86/include/asm/idtentry.h
>> @@ -611,6 +611,9 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_DB,   xenpv_exc_debu=
g);
>>
>>   /* #DF */
>>   DECLARE_IDTENTRY_DF(X86_TRAP_DF,       exc_double_fault);
>> +#ifdef CONFIG_XEN_PV
>> +DECLARE_IDTENTRY_RAW_ERRORCODE(X86_TRAP_DF,    xenpv_exc_double_fault=
);
>> +#endif
>>
>>   /* #VC */
>>   #ifdef CONFIG_AMD_MEM_ENCRYPT
>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c=

>> index 9f5e44c1f70a..803fbcb398c4 100644
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -571,6 +571,12 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
>>          exc_nmi(regs);
>>   }
>>
>> +DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
>> +{
>> +       /* On Xen PV, DF doesn't use IST.  The C part is the sane as n=
ative. */
>=20
> I would like to think that code is sane, but you probably meant "same".=


Oh, this is the result of copy and paste. Now we have two sane
functions. :-)


Juergen

--------------00E5D34FFC63ED429A7BC194
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

--------------00E5D34FFC63ED429A7BC194--

--2HZrYXKuAhgHcBDOR5iPLffuBQQTs9hXe--

--KV3Sotp1vrb9BEntdK4bhW84qAEyG2Rmb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+ypXkFAwAAAAAACgkQsN6d1ii/Ey+v
Igf+MEHD1T2xZkUxUQFMxBH7GfzMQ527kw50LN0yFocRqbN5R6VB309zKZOY2eNYgtUpE/oNdw4W
rAhifQNZXlEaG83PnGrSgQ5Lss3L1J17WW6q26KrCA0Pfnc0P17rHkUwJMxB0F3qC/rJqLlw/n7v
rFxZmVIX8ATSgSyRq31BKOCVAFBFPkM464Ntu/ZS+h2TPUL/6HHzukYySOOonu1DR/ZSBZYiEYN/
TDPBJhzuFQOwbUQRsPgvfXO7nDCD0V2c/fqkYAw/9Bofbu0MVcrpQasDgeQ6PxvQ6uFmH2HubsHB
8MduN3P84h684BHX2RJjQHfLOKXG1AMqh5edHl0vow==
=JuGh
-----END PGP SIGNATURE-----

--KV3Sotp1vrb9BEntdK4bhW84qAEyG2Rmb--

