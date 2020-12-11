Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E622D7436
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50392.89039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kng1Z-000275-U7; Fri, 11 Dec 2020 10:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50392.89039; Fri, 11 Dec 2020 10:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kng1Z-00026g-Qm; Fri, 11 Dec 2020 10:51:45 +0000
Received: by outflank-mailman (input) for mailman id 50392;
 Fri, 11 Dec 2020 10:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUOP=FP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kng1Y-00026Z-KH
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:51:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 836895c9-967a-4368-b2ad-930048613977;
 Fri, 11 Dec 2020 10:51:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0791AE30;
 Fri, 11 Dec 2020 10:51:37 +0000 (UTC)
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
X-Inumbo-ID: 836895c9-967a-4368-b2ad-930048613977
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607683898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cEPs72V6kbjOf2vtS1YWBD94WU9sx8YmyOMjFajxa18=;
	b=Il2kLVWQ+rZg9SGG2p2gb9CWyF/pAIdSTXJ/0TZdRsvxjk+YYHGvmRYvrSq21EqBFT5Rvo
	nMZq1y0jvaXBt9GqmE2yGjvjG4fMMPwWFRStQ5z5DkvOhnPw4PyucGiUYfTD9rxgqWP3p/
	aSo96o+TKPH8nsOZ6+Ag0rNGS+0EJgc=
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
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
 <699e48ea-8807-a1f3-d2b9-dc918913ede8@xen.org>
 <18959d53-30d9-b702-81df-8a4051d61fb2@suse.com>
 <ece0eb78-4e5f-2c2d-598d-aaf126fbcd23@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <683a9587-1e24-be6f-fa66-9c9050a00f66@suse.com>
Date: Fri, 11 Dec 2020 11:51:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ece0eb78-4e5f-2c2d-598d-aaf126fbcd23@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5yoA3nk5Guql2tAWJh4bpFi6kZb2VLqfk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5yoA3nk5Guql2tAWJh4bpFi6kZb2VLqfk
Content-Type: multipart/mixed; boundary="9twPgILxTIXvEKJmSUuXPfqXwg6jZD3bj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <683a9587-1e24-be6f-fa66-9c9050a00f66@suse.com>
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
 <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
 <59f126a3-f716-345b-b464-746e6156c15a@suse.com>
 <1e305cf6-aa14-54cc-a77d-88bb38ba4c6e@xen.org>
 <7271b2f4-816a-5541-5402-50ea29218d81@suse.com>
 <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
 <699e48ea-8807-a1f3-d2b9-dc918913ede8@xen.org>
 <18959d53-30d9-b702-81df-8a4051d61fb2@suse.com>
 <ece0eb78-4e5f-2c2d-598d-aaf126fbcd23@xen.org>
In-Reply-To: <ece0eb78-4e5f-2c2d-598d-aaf126fbcd23@xen.org>

--9twPgILxTIXvEKJmSUuXPfqXwg6jZD3bj
Content-Type: multipart/mixed;
 boundary="------------C2364B7C7D8B3952A37F3941"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C2364B7C7D8B3952A37F3941
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.12.20 11:49, Julien Grall wrote:
>=20
>=20
> On 11/12/2020 10:38, J=C3=BCrgen Gro=C3=9F wrote:
>> On 11.12.20 11:22, Julien Grall wrote:
>>> Hi,
>>>
>>> On 11/12/2020 07:24, Jan Beulich wrote:
>>>> On 11.12.2020 08:02, J=C3=BCrgen Gro=C3=9F wrote:
>>>>> On 10.12.20 21:51, Julien Grall wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On 09/12/2020 14:29, Jan Beulich wrote:
>>>>>>> On 09.12.2020 13:11, Julien Grall wrote:
>>>>>>>> On 26/11/2020 11:20, Jan Beulich wrote:
>>>>>>>>> On 26.11.2020 09:03, Juergen Gross wrote:
>>>>>>>>>> When the host crashes it would sometimes be nice to have=20
>>>>>>>>>> additional
>>>>>>>>>> debug data available which could be produced via debug keys, b=
ut
>>>>>>>>>> halting the server for manual intervention might be impossible=
=20
>>>>>>>>>> due to
>>>>>>>>>> the need to reboot/kexec rather sooner than later.
>>>>>>>>>>
>>>>>>>>>> Add support for automatic debug key actions in case of crashes=
=20
>>>>>>>>>> which
>>>>>>>>>> can be activated via boot- or runtime-parameter.
>>>>>>>>>>
>>>>>>>>>> Depending on the type of crash the desired data might be=20
>>>>>>>>>> different, so
>>>>>>>>>> support different settings for the possible types of crashes.
>>>>>>>>>>
>>>>>>>>>> The parameter is "crash-debug" with the following syntax:
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 crash-debug-<type>=3D<string>
>>>>>>>>>>
>>>>>>>>>> with <type> being one of:
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 panic, hwdom, watchdog, kexeccmd, deb=
ugkey
>>>>>>>>>>
>>>>>>>>>> and <string> a sequence of debug key characters with '+'=20
>>>>>>>>>> having the
>>>>>>>>>> special semantics of a 10 millisecond pause.
>>>>>>>>>>
>>>>>>>>>> So "crash-debug-watchdog=3D0+0qr" would result in special outp=
ut=20
>>>>>>>>>> in case
>>>>>>>>>> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 sta=
te,
>>>>>>>>>> domain info, run queues).
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>>>> ---
>>>>>>>>>> V2:
>>>>>>>>>> - switched special character '.' to '+' (Jan Beulich)
>>>>>>>>>> - 10 ms instead of 1 s pause (Jan Beulich)
>>>>>>>>>> - added more text to the boot parameter description (Jan Beuli=
ch)
>>>>>>>>>>
>>>>>>>>>> V3:
>>>>>>>>>> - added const (Jan Beulich)
>>>>>>>>>> - thorough test of crash reason parameter (Jan Beulich)
>>>>>>>>>> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
>>>>>>>>>> - added dummy get_irq_regs() helper on Arm
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>>>
>>>>>>>>> Except for the Arm aspect, where I'm not sure using
>>>>>>>>> guest_cpu_user_regs() is correct in all cases,
>>>>>>>>
>>>>>>>> I am not entirely sure to understand what get_irq_regs() is=20
>>>>>>>> supposed to
>>>>>>>> returned on x86. Is it the registers saved from the most recent
>>>>>>>> exception?
>>>>>>>
>>>>>>> An interrupt (not an exception) sets the underlying per-CPU
>>>>>>> variable, such that interested parties will know the real
>>>>>>> context is not guest or "normal" Xen code, but an IRQ.
>>>>>>
>>>>>> Thanks for the explanation. I am a bit confused to why we need to =

>>>>>> give a
>>>>>> regs to handle_keypress() because no-one seems to use it. Do you=20
>>>>>> have an
>>>>>> explanation?
>>>>>
>>>>> dump_registers() (key 'd') is using it.
>>>>>
>>>>>>
>>>>>> To add to the confusion, it looks like that get_irqs_regs() may=20
>>>>>> return
>>>>>> NULL. So sometimes we may pass guest_cpu_regs() (which may contain=

>>>>>> garbagge or a set too far).
>>>>>
>>>>> I guess this is a best effort approach.
>>>>
>>>> Indeed. If there are ways to make it "more best", we should of
>>>> course follow them. (Except before Dom0 starts, I'm afraid I
>>>> don't see though where garbage would come from. And even then,
>>>> just like for the idle vCPU-s, it shouldn't really be garbage,
>>>> or else this suggests missing initialization somewhere.)
>>>
>>> So I decided to mimick what 'd' does to see what happen if this is=20
>>> called early boot.
>>>
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 7fcff9af2a7e..9d33507a26eb 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -857,6 +857,8 @@ void __init start_xen(unsigned long=20
>>> boot_phys_offset,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 system_state =3D SYS_STATE_boot;
>>>
>>> +=C2=A0=C2=A0=C2=A0 dump_execstate(guest_cpu_user_regs());
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_init();
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( acpi_disabled )
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index 30d6f375a3af..50fcf2e8d70e 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1678,6 +1678,7 @@ void __init noreturn __start_xen(unsigned long =

>>> mbi_p)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end_boot_alloc=
ator();
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 system_state =3D SYS_STATE_boot;
>>> +=C2=A0=C2=A0=C2=A0 dump_execstate(guest_cpu_user_regs());
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * No calls involving ACPI code s=
hould go between the setting of
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * SYS_STATE_boot and vm_init() (=
or else acpi_os_{,un}map_memory()
>>>
>>> It leads to crash on both Arm and x86.
>>>
>>> For the Arm crash:
>>>
>>> (XEN) Data Abort Trap. Syndrome=3D0x1c08006
>>> (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR 0x0000000065a7f000
>>> (XEN) 0TH[0x0] =3D 0x0000000065a7ef7f
>>> (XEN) 1ST[0x0] =3D 0x0000000065a7bf7f
>>> (XEN) 2ND[0x0] =3D 0x0000000000000000
>>> (XEN) CPU0: Unexpected Trap: Data Abort
>>> (XEN) ----[ Xen-4.15-unstable=C2=A0 arm64=C2=A0 debug=3Dy=C2=A0=C2=A0=
 Not tainted ]----
>>> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
>>> (XEN) PC:=C2=A0=C2=A0=C2=A0=C2=A0 0000000000219674 dump_execstate+0x5=
8/0x1ec
>>> (XEN) LR:=C2=A0=C2=A0=C2=A0=C2=A0 00000000002d77dc
>>> (XEN) SP:=C2=A0=C2=A0=C2=A0=C2=A0 000000000030fdc0
>>> (XEN) CPSR:=C2=A0=C2=A0 800003c9 MODE:64-bit EL2h (Hypervisor, handle=
r)
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X0: 0000000000000000=C2=A0 X1: 00=
00000000000000=C2=A0 X2:=20
>>> 0000000000007fff
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X3: 00000000002b7198=C2=A0 X4: 00=
00000000000080=C2=A0 X5:=20
>>> 00000000002e9a68
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X6: 0080808080808080=C2=A0 X7: fe=
fefefefefeff09=C2=A0 X8:=20
>>> 7f7f7f7f7f7f7f7f
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X9: 717164616f726051 X10: 7f7f7f7=
f7f7f7f7f X11:=20
>>> 0101010101010101
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X12: 0000000000000008 X13: 00000000002b=
9a48 X14:=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X15: 0000000000400000 X16: 00000000002b=
a000 X17:=20
>>> 00000000002b9000
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X18: 00000000002b9000 X19: 000000000000=
0000 X20:=20
>>> 000000000030feb0
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X21: 0000000080000000 X22: 00000000002f=
0d30 X23:=20
>>> 00000000002f1d68
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X24: 00000000002f0eb8 X25: 000000004000=
0000 X26:=20
>>> 0000000080000000
>>> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X27: 0000000000000018 X28: 000000000003=
f970=C2=A0 FP:=20
>>> 000000000030fdc0
>>> (XEN)
>>> (XEN)=C2=A0=C2=A0 VTCR_EL2: 00000000
>>> (XEN)=C2=A0 VTTBR_EL2: 0000000000000000
>>> (XEN)
>>> (XEN)=C2=A0 SCTLR_EL2: 30cd183d
>>> (XEN)=C2=A0=C2=A0=C2=A0 HCR_EL2: 0000000000000038
>>> (XEN)=C2=A0 TTBR0_EL2: 0000000065a7f000
>>> (XEN)
>>> (XEN)=C2=A0=C2=A0=C2=A0 ESR_EL2: 97c08006
>>> (XEN)=C2=A0 HPFAR_EL2: 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 FAR_EL2: 0000000000000010
>>> (XEN)
>>> (XEN) Xen stack trace from sp=3D000000000030fdc0:
>>> (XEN)=C2=A0=C2=A0=C2=A0 000000000030fdf0 00000000002d77dc 00000000000=
80000=20
>>> 000000007fffc000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000080000000 00000000002f0d30 000000007f6=
8b250=20
>>> 00000000002001b8
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000065932000 0000000065732000 00000000784=
f9000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000400000 0000000065a2ad30 00000000000=
00630=20
>>> 0000000000000001
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 0000000000000001 00000000000=
00000=20
>>> 0000000000003000
>>> (XEN)=C2=A0=C2=A0=C2=A0 00000000784f9000 00000000002bc8e4 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000300000000 00000000000=
00000=20
>>> 00000040ffffffff
>>> (XEN)=C2=A0=C2=A0=C2=A0 00000000ffffffff 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN) Xen call trace:
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000219674>] dump_execstate+0x58/0x1e=
c (PC)
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<00000000002d77dc>] start_xen+0x3d0/0xcf8 (L=
R)
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<00000000002d77dc>] start_xen+0x3d0/0xcf8
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<00000000002001b8>] arm64/head.o#primary_swi=
tched+0x10/0x30
>>> (XEN)
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) CPU0: Unexpected Trap: Data Abort
>>> (XEN) ****************************************
>>>
>>> For the x86 crash:
>>>
>>> (XEN) Early fatal page fault at e008:ffff82d0402188b4=20
>>> (cr2=3D0000000000000010, ec=3D0000)
>>> (XEN) ----[ Xen-4.15-unstable=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0=C2=A0=
 Tainted:=C2=A0=C2=A0 C=C2=A0=C2=A0 ]----
>>> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
>>> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d0402188b4>] dump_execstate=
+0x42/0x167
>>> (XEN) RFLAGS: 0000000000010086=C2=A0=C2=A0 CONTEXT: hypervisor
>>> (XEN) rax: 0000000000000000=C2=A0=C2=A0 rbx: 0000000000000000=C2=A0=C2=
=A0 rcx:=20
>>> 0000000000000000
>>> (XEN) rdx: ffff82d0404affff=C2=A0=C2=A0 rsi: 000000000000000a=C2=A0=C2=
=A0 rdi:=20
>>> ffff82d0404afef8
>>> (XEN) rbp: ffff82d0404afd90=C2=A0=C2=A0 rsp: ffff82d0404afd80=C2=A0=C2=
=A0 r8:=20
>>> 0000000000000004
>>> (XEN) r9:=C2=A0 0101010101010101=C2=A0=C2=A0 r10: 0f0f0f0f0f0f0f0f=C2=
=A0=C2=A0 r11:=20
>>> 5555555555555555
>>> (XEN) r12: ffff82d0404afef8=C2=A0=C2=A0 r13: 0000000000800163=C2=A0=C2=
=A0 r14:=20
>>> ffff83000009dfb0
>>> (XEN) r15: 0000000000000002=C2=A0=C2=A0 cr0: 0000000080050033=C2=A0=C2=
=A0 cr4:=20
>>> 00000000000000a0
>>> (XEN) cr3: 00000000bfa9e000=C2=A0=C2=A0 cr2: 0000000000000010
>>> (XEN) fsb: 0000000000000000=C2=A0=C2=A0 gsb: 0000000000000000=C2=A0=C2=
=A0 gss:=20
>>> 0000000000000000
>>> (XEN) ds: 0000=C2=A0=C2=A0 es: 0000=C2=A0=C2=A0 fs: 0000=C2=A0=C2=A0 =
gs: 0000=C2=A0=C2=A0 ss: 0000=C2=A0=C2=A0 cs: e008
>>> (XEN) Xen code around <ffff82d0402188b4> (dump_execstate+0x42/0x167):=

>>> (XEN)=C2=A0 ff 7f 00 00 48 8b 40 c9 <48> 8b 40 10 66 81 38 ff 7f 75 4=
9 3b=20
>>> 1d 23 18 27
>>> (XEN) Xen stack trace from rsp=3Dffff82d0404afd80:
>>> (XEN)=C2=A0=C2=A0=C2=A0 000000000023ffff 00000000000005ed ffff82d0404=
afee8=20
>>> ffff82d0404378cb
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000002 0000000000000002 00000000000=
00002=20
>>> 0000000000000001
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 0000000000000001 00000000000=
00001=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 00000000000001ff 0000000002a45fff 00000000002=
40000=20
>>> 0000000002a45000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000100000 0000000000000000 00000000000=
001ff=20
>>> ffff82d040475c80
>>> (XEN)=C2=A0=C2=A0=C2=A0 ffff82d000800163 ffff83000009dee0 ffff8300000=
9dfb0=20
>>> 0000000000200001
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000100000000 0000000100000000 ffff8300000=
9df80=20
>>> 642ded38bf9fe4f3
>>> (XEN)=C2=A0=C2=A0=C2=A0 bf9fed3500000000 bfaafe980009df73 0009df73bf9=
fe7ea=20
>>> 00000004bf9fed31
>>> (XEN)=C2=A0=C2=A0=C2=A0 bfaafeb00009df01 0000000800000000 00000001000=
0006e=20
>>> 0000000000000003
>>> (XEN)=C2=A0=C2=A0=C2=A0 00000000000002f8 ffff82d0405b0000 ffff82d0404=
b0000=20
>>> 0000000000000002
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 ffff82d0402=
0012f=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000e01000000000 0000000000000000 00000000000=
00000=20
>>> 00000000000000a0
>>> (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000000=
00000=20
>>> 0000000000000000
>>> (XEN) Xen call trace:
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402188b4>] R dump_execstate+0x42/0x=
167
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0404378cb>] F __start_xen+0x1e10/0x2=
906
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04020012f>] F __high_start+0x8f/0x91=

>>> (XEN)
>>> (XEN) Pagetable walk from 0000000000000010:
>>> (XEN)=C2=A0 L4[0x000] =3D 00000000bfa54063 ffffffffffffffff
>>> (XEN)=C2=A0 L3[0x000] =3D 00000000bfa50063 ffffffffffffffff
>>> (XEN)=C2=A0 L2[0x000] =3D 00000000bfa4f063 ffffffffffffffff
>>> (XEN)=C2=A0 L1[0x000] =3D 0000000000000000 ffffffffffffffff
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) FATAL TRAP: vec 14, #PF[0000] IN INTERRUPT CONTEXT
>>> (XEN) ****************************************
>>> (XEN)
>>> (XEN) Reboot in five seconds...
>>>
>>> So I think guest_cpu_user_regs() is not quite yet ready to be called =

>>> from panic().
>>
>> guest_cpu_user_regs() isn't the problem, but dump_execstate().
>>
>> This is one of the caveats from the added boot parameter doc: some deb=
ug
>> keys might lead to problems. 'd' seems to be such a key when used for
>> the panic() case and the panic() happens in early boot.
>=20
> Right, I think we should be clearer in the documentation about the keys=
=20
> we know works.
>=20
>>
>>>
>>> A different approach my be to generate an exception and call the=20
>>> keyhandler from there. At least you know that the register would=20
>>> always be accurate.
>>
>> Or dump_execstate() is modified to accept NULL for regs and it will do=

>> nothing in case guest_cpu_user_regs() isn't valid (a test for idle vcp=
u
>> might be the easiest way to determine that).
>=20
> So Jan pointed out that current may not be initialized properly in earl=
y=20
> boot. So we possibly want to use "system_state" instead.

Fine with me. Will send an updated patch.


Juergen


--------------C2364B7C7D8B3952A37F3941
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

--------------C2364B7C7D8B3952A37F3941--

--9twPgILxTIXvEKJmSUuXPfqXwg6jZD3bj--

--5yoA3nk5Guql2tAWJh4bpFi6kZb2VLqfk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/TTzkFAwAAAAAACgkQsN6d1ii/Ey8f
lwf9HIOiY6OPYfgEZpODn6dTlW69nfMJ5PxcgDPgq/lfRvzay2+7SsIaIuFZX/oMjwThYylZ+/8J
UU7P6QwitYWtJNtYaSsw2WWamP6f3ROWWKPslQUT+ZxiTD3FPzoO2ZnyJ1I2HPxVtTC0H7eDnD/6
B6FCaKk+gj/cFHtO6myxkMaCISgrgInv2piVrU+K3Nf86KngIL6o1Yd90Qr7l0CIAu2puW9BsQex
/TjgnHxqoQ+4H8puwPgG6N9PzOJgYs7Y4jLpXf6lUYiBnYQApMlABh6lrp3TTgYm1oV5GLJ6wMyc
vdDAoAb85UsL+SjK8+dxPx/jG9/wY2TpCg6WI/JGzw==
=wVKI
-----END PGP SIGNATURE-----

--5yoA3nk5Guql2tAWJh4bpFi6kZb2VLqfk--

