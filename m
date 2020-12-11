Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1202D70D3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 08:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50170.88733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kncro-0003E3-9J; Fri, 11 Dec 2020 07:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50170.88733; Fri, 11 Dec 2020 07:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kncro-0003Dc-5H; Fri, 11 Dec 2020 07:29:28 +0000
Received: by outflank-mailman (input) for mailman id 50170;
 Fri, 11 Dec 2020 07:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUOP=FP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kncrm-0003DX-7D
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 07:29:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67638adc-6b35-4e3d-9229-58b3d12efaab;
 Fri, 11 Dec 2020 07:29:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12DE8AD89;
 Fri, 11 Dec 2020 07:29:24 +0000 (UTC)
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
X-Inumbo-ID: 67638adc-6b35-4e3d-9229-58b3d12efaab
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607671764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fPwAidkTrgf97zPXZszv7FmlRWHvgtBbJyaopcekBzQ=;
	b=hFNKxjrOkkvgjXmOlhjDFHWUhdLU4+mFBdj5FV7O66TEaBdRv1LrsZkMh3RAYK2+PA8dea
	115l7xaIH2F3jkwJu7mcCCmrN6tjhMrOjjImH75/EK2orywE5SgD5NLO8G4nAenGugHUi5
	152EGphoiwqr68mF5jgZKikj7qKmVWo=
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
 <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
 <59f126a3-f716-345b-b464-746e6156c15a@suse.com>
 <1e305cf6-aa14-54cc-a77d-88bb38ba4c6e@xen.org>
 <7271b2f4-816a-5541-5402-50ea29218d81@suse.com>
 <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6c3d19ef-0d35-df66-5e12-29b429b7508c@suse.com>
Date: Fri, 11 Dec 2020 08:29:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VFLHCm6CY74osF9WDGGBBLkwrxodNhg0l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VFLHCm6CY74osF9WDGGBBLkwrxodNhg0l
Content-Type: multipart/mixed; boundary="GKqxofmATCbfupQHtnk6QK3EdX5MgUoBC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <6c3d19ef-0d35-df66-5e12-29b429b7508c@suse.com>
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
 <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
 <59f126a3-f716-345b-b464-746e6156c15a@suse.com>
 <1e305cf6-aa14-54cc-a77d-88bb38ba4c6e@xen.org>
 <7271b2f4-816a-5541-5402-50ea29218d81@suse.com>
 <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
In-Reply-To: <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>

--GKqxofmATCbfupQHtnk6QK3EdX5MgUoBC
Content-Type: multipart/mixed;
 boundary="------------830E8BAD214008B147031534"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------830E8BAD214008B147031534
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.12.20 08:24, Jan Beulich wrote:
> On 11.12.2020 08:02, J=C3=BCrgen Gro=C3=9F wrote:
>> On 10.12.20 21:51, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 09/12/2020 14:29, Jan Beulich wrote:
>>>> On 09.12.2020 13:11, Julien Grall wrote:
>>>>> On 26/11/2020 11:20, Jan Beulich wrote:
>>>>>> On 26.11.2020 09:03, Juergen Gross wrote:
>>>>>>> When the host crashes it would sometimes be nice to have addition=
al
>>>>>>> debug data available which could be produced via debug keys, but
>>>>>>> halting the server for manual intervention might be impossible du=
e to
>>>>>>> the need to reboot/kexec rather sooner than later.
>>>>>>>
>>>>>>> Add support for automatic debug key actions in case of crashes wh=
ich
>>>>>>> can be activated via boot- or runtime-parameter.
>>>>>>>
>>>>>>> Depending on the type of crash the desired data might be differen=
t, so
>>>>>>> support different settings for the possible types of crashes.
>>>>>>>
>>>>>>> The parameter is "crash-debug" with the following syntax:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0 crash-debug-<type>=3D<string>
>>>>>>>
>>>>>>> with <type> being one of:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0 panic, hwdom, watchdog, kexeccmd, debugkey
>>>>>>>
>>>>>>> and <string> a sequence of debug key characters with '+' having t=
he
>>>>>>> special semantics of a 10 millisecond pause.
>>>>>>>
>>>>>>> So "crash-debug-watchdog=3D0+0qr" would result in special output =
in case
>>>>>>> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,=

>>>>>>> domain info, run queues).
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>> ---
>>>>>>> V2:
>>>>>>> - switched special character '.' to '+' (Jan Beulich)
>>>>>>> - 10 ms instead of 1 s pause (Jan Beulich)
>>>>>>> - added more text to the boot parameter description (Jan Beulich)=

>>>>>>>
>>>>>>> V3:
>>>>>>> - added const (Jan Beulich)
>>>>>>> - thorough test of crash reason parameter (Jan Beulich)
>>>>>>> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
>>>>>>> - added dummy get_irq_regs() helper on Arm
>>>>>>>
>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>
>>>>>> Except for the Arm aspect, where I'm not sure using
>>>>>> guest_cpu_user_regs() is correct in all cases,
>>>>>
>>>>> I am not entirely sure to understand what get_irq_regs() is suppose=
d to
>>>>> returned on x86. Is it the registers saved from the most recent
>>>>> exception?
>>>>
>>>> An interrupt (not an exception) sets the underlying per-CPU
>>>> variable, such that interested parties will know the real
>>>> context is not guest or "normal" Xen code, but an IRQ.
>>>
>>> Thanks for the explanation. I am a bit confused to why we need to giv=
e a
>>> regs to handle_keypress() because no-one seems to use it. Do you have=
 an
>>> explanation?
>>
>> dump_registers() (key 'd') is using it.
>>
>>>
>>> To add to the confusion, it looks like that get_irqs_regs() may retur=
n
>>> NULL. So sometimes we may pass guest_cpu_regs() (which may contain
>>> garbagge or a set too far).
>>
>> I guess this is a best effort approach.
>=20
> Indeed. If there are ways to make it "more best", we should of
> course follow them. (Except before Dom0 starts, I'm afraid I
> don't see though where garbage would come from. And even then,
> just like for the idle vCPU-s, it shouldn't really be garbage,
> or else this suggests missing initialization somewhere.)
>=20
>>> I guess providing the wrong information to handle_keypress() is not
>>> going to matter that much because no-one use it (?). Although, I'd li=
ke
>>> to make sure this is not going to bite us in the future.
>>
>> TBH using the 'd' handler isn't making that much sense, as the
>> information delivered would be of interest only in case of a panic(),
>> which is already printing that information.
>=20
> I disagree. I've had numerous cases where I found this key very
> useful. Or do you mean what you say just for the new purpose
> added here?

Just for the new purpose.


Juergen

--------------830E8BAD214008B147031534
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

--------------830E8BAD214008B147031534--

--GKqxofmATCbfupQHtnk6QK3EdX5MgUoBC--

--VFLHCm6CY74osF9WDGGBBLkwrxodNhg0l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/TH9MFAwAAAAAACgkQsN6d1ii/Ey9g
1gf/TJv6fuI9FxMhKRjAfz6C/GhUxhTHy0HSQISDWtpOgcSWbHfTWe2Aq/uKSuGTQyOQ2A+0ybCb
ndQXnWdR3AyT2V2laJeJ2FT33OnErwXq/gt2iLT+upvBRuIOwp99C+v/J1+9b6BIV1hJpd2tWM/T
FqEf+EZFgH3vsCH07+UmzSZvlvA4Y86RJsSfGp75syWxsMyMPzyAzHLY1TUwayxFCvglIrNvoido
y0/T/NLAVxwFbKMRPQhN8LoZJTMUVnTzJFGibXUzxfldYKUVGo+Cs1avt1RH93zB7a+KgBBoisWI
R6E+nwwabDngVBJM8FtgPSyxby9aoKyaj5hfMCepTQ==
=cNXU
-----END PGP SIGNATURE-----

--VFLHCm6CY74osF9WDGGBBLkwrxodNhg0l--

