Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20DA3EEEFF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 17:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167956.306631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0oK-0005yB-AH; Tue, 17 Aug 2021 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167956.306631; Tue, 17 Aug 2021 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0oK-0005vx-73; Tue, 17 Aug 2021 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 167956;
 Tue, 17 Aug 2021 15:15:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mG0oH-0005vr-SX
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 15:15:25 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1c9c7a4-ff6d-11eb-a4d5-12813bfff9fa;
 Tue, 17 Aug 2021 15:15:24 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7EEE021F70;
 Tue, 17 Aug 2021 15:15:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3CB2212FF9;
 Tue, 17 Aug 2021 15:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mkH0DIvSG2EZWgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 17 Aug 2021 15:15:23 +0000
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
X-Inumbo-ID: f1c9c7a4-ff6d-11eb-a4d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629213323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqVkH+OT4YCiF+f4+snpkxi7RfWpUkg7iNbNxW94QgU=;
	b=PJ7LqGbPM/+qtZWIPJFhKl3y+GNZw/zcj0tX93yh4m7JOrj8SAs+71xUkjVtY5308P9jTT
	Nxfy3sX+j3H8kxlsHgvogTZBe7/NoetlRqu6XGR529t8g0XWbIDZiC0St1qPqz7MjwiJcu
	KIdw/pntKrm/FRPNdaV/lfDfHPzVyPQ=
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YRvMy9NgGxYKRcNc@mail-itl>
From: Juergen Gross <jgross@suse.com>
Message-ID: <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
Date: Tue, 17 Aug 2021 17:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRvMy9NgGxYKRcNc@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JWBSpzCrT1wyTGpAB93gtoZNlYFqiu3V4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JWBSpzCrT1wyTGpAB93gtoZNlYFqiu3V4
Content-Type: multipart/mixed; boundary="LSHmlJch2tkdMWvVNCyRR0o4B62lRz9zL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
References: <YRvMy9NgGxYKRcNc@mail-itl>
In-Reply-To: <YRvMy9NgGxYKRcNc@mail-itl>

--LSHmlJch2tkdMWvVNCyRR0o4B62lRz9zL
Content-Type: multipart/mixed;
 boundary="------------7DF220BAF4EF3E854196BDB2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7DF220BAF4EF3E854196BDB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.08.21 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 17, 2021 at 04:04:24PM +0200, Jan Beulich wrote:
>> On 17.08.2021 15:48, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Tue, Aug 17, 2021 at 02:29:20PM +0100, Andrew Cooper wrote:
>>>> On 17/08/2021 14:21, Jan Beulich wrote:
>>>>> On 17.08.2021 15:06, Andrew Cooper wrote:
>>>>>> Perhaps we want the cpu_down() logic to explicitly invalidate thei=
r
>>>>>> lazily cached values?
>>>>> I'd rather do this on the cpu_up() path (no point clobbering what m=
ay
>>>>> get further clobbered, and then perhaps not to a value of our likin=
g),
>>>>> yet then we can really avoid doing this from a notifier and instead=
 do
>>>>> it early enough in xstate_init() (taking care of XSS at the same ti=
me).
>>>
>>> Funny you mention notifiers. Apparently cpufreq driver does use it to=

>>> initialize things. And fails to do so:
>>>
>>> (XEN) Finishing wakeup from ACPI S3 state.
>>> (XEN) CPU0: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f=

>>> (XEN) Enabling non-boot CPUs  ...
>>> (XEN) CPU1: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f=

>>> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d04024ad2b>] vcpu_runstate_get+0x153/0x244=

>>> (XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
>>> (XEN) rax: 0000000000000000   rbx: ffff830049667c50   rcx: 0000000000=
000001
>>> (XEN) rdx: 000000321d74d000   rsi: ffff830049667c50   rdi: ffff83025d=
cc0000
>>> (XEN) rbp: ffff830049667c40   rsp: ffff830049667c10   r8:  ffff830205=
11a820
>>> (XEN) r9:  ffff82d04057ef78   r10: 0180000000000000   r11: 8000000000=
000000
>>> (XEN) r12: ffff83025dcc0000   r13: ffff830205118c60   r14: 0000000000=
000001
>>> (XEN) r15: 0000000000000010   cr0: 000000008005003b   cr4: 0000000000=
3526e0
>>> (XEN) cr3: 0000000049656000   cr2: 0000000000000028
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000=
000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008=

>>> (XEN) Xen code around <ffff82d04024ad2b> (vcpu_runstate_get+0x153/0x2=
44):
>>> (XEN)  48 8b 14 ca 48 8b 04 02 <4c> 8b 70 28 e9 01 ff ff ff 4c 8d 3d =
dd 64 32 00
>>> (XEN) Xen stack trace from rsp=3Dffff830049667c10:
>>> (XEN)    0000000000000180 ffff83025dcbd410 ffff83020511bf30 ffff83020=
5118c60
>>> (XEN)    0000000000000001 0000000000000010 ffff830049667c80 ffff82d04=
024ae73
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 000000000=
0000000
>>> (XEN)    0000000000000000 0000000000000000 ffff830049667cb8 ffff82d04=
02560a9
>>> (XEN)    ffff830205118320 0000000000000001 ffff83020511bf30 ffff83025=
dc7a6f0
>>> (XEN)    0000000000000000 ffff830049667d58 ffff82d040254cb1 000000014=
02e9f74
>>> (XEN)    0000000000000000 ffff830049667d10 ffff82d040224eda 000000000=
025dc81
>>> (XEN)    000000321d74d000 ffff82d040571278 0000000000000001 ffff83004=
9667d28
>>> (XEN)    ffff82d040228b44 ffff82d0403102cf 0000000000000000 ffff82d04=
02283a4
>>> (XEN)    ffff82d040459688 ffff82d040459680 ffff82d040459240 000000000=
0000004
>>> (XEN)    0000000000000000 ffff830049667d68 ffff82d04025510e ffff83004=
9667db0
>>> (XEN)    ffff82d040221ba4 0000000000000000 0000000000000001 000000000=
0000001
>>> (XEN)    0000000000000000 ffff830049667e00 0000000000000001 ffff82d04=
058a5c0
>>> (XEN)    ffff830049667dc8 ffff82d040203867 0000000000000001 ffff83004=
9667df0
>>> (XEN)    ffff82d040203c51 ffff82d040459400 0000000000000001 000000000=
0000010
>>> (XEN)    ffff830049667e20 ffff82d040203e26 ffff830049667ef8 000000000=
0000000
>>> (XEN)    0000000000000003 0000000000000200 ffff830049667e50 ffff82d04=
0270bac
>>> (XEN)    ffff83020116a640 ffff830258ff6000 0000000000000000 000000000=
0000000
>>> (XEN)    ffff830049667e70 ffff82d0402056aa ffff830258ff61b8 ffff82d04=
05701b0
>>> (XEN)    ffff830049667e88 ffff82d04022963c ffff82d0405701a0 ffff83004=
9667eb8
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d04024ad2b>] R vcpu_runstate_get+0x153/0x244
>=20
> This is xen/common/sched/core.c:322. get_sched_res(v->processor) is
> NULL at this point for CPU1.
>=20
> The only place that can calls set_sched_res() and doesn't expect the
> previous value to be valid, is cpu_schedule_up(). For non-BSP its calle=
d
> _only_ from notifier at CPU_UP_PREPARE (cpu_schedule_callback()), but
> that notifier explicitly exclude suspend/resume case:
>=20
>      static int cpu_schedule_callback(
>          struct notifier_block *nfb, unsigned long action, void *hcpu)
>      {
>          unsigned int cpu =3D (unsigned long)hcpu;
>          int rc =3D 0;
>=20
>          /*
>           * All scheduler related suspend/resume handling needed is don=
e in
>           * cpupool.c.
>           */
>          if ( system_state > SYS_STATE_active )
>              return NOTIFY_DONE;
>=20
> But, nothing in cpupool.c is calling into set_sched_res().
>=20
> On the other hand, sched_rm_cpu() (which I believe is called as part of=

> parking the CPU) calls cpu_schedule_down(), which then calls
> set_sched_res(cpu, NULL).
>=20
> In short: scheduler for parked CPUs is not re-initialized during resume=
=2E
> But cpufreq expects it to be...

I'll be looking into that.


Juergen

--------------7DF220BAF4EF3E854196BDB2
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

--------------7DF220BAF4EF3E854196BDB2--

--LSHmlJch2tkdMWvVNCyRR0o4B62lRz9zL--

--JWBSpzCrT1wyTGpAB93gtoZNlYFqiu3V4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEb0ooFAwAAAAAACgkQsN6d1ii/Ey80
jAf/V4AamdAJwhAH6tY9474jK1benQSJyGajf0dmzbEEQjK25vLbHLW5FqtVcmgrJyTxIXHWrU1I
VCtjq20oT/oZ40KkrYgKC0GP0fOvdpy6IU90Qrkx3Ok4Ilisy537H/aSRXdNjBvPJk60OpOWeXWa
9mkAc6jyHRWDaqSfCgPqUfz4CF2GK2flvSP1Ncb638P1gaK2s4rOymTPachWzAXBXggkkUgRpBIa
ViSXp/t+LdZEhfl4lPGHyT8cbjWVwq7I/AvckgPY+6SZm0t2ttON5h6LE2lERYMdEiFPYeaYCGQI
cuHCp8Kl5GdIvZRrf2OInc7MfhadbDn1vGYIHozDoA==
=gUT6
-----END PGP SIGNATURE-----

--JWBSpzCrT1wyTGpAB93gtoZNlYFqiu3V4--

