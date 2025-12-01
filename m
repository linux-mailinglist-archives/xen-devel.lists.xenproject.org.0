Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD0C9828D
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 17:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175851.1500460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6MQ-0002aN-Tz; Mon, 01 Dec 2025 16:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175851.1500460; Mon, 01 Dec 2025 16:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6MQ-0002U5-PB; Mon, 01 Dec 2025 16:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1175851;
 Mon, 01 Dec 2025 16:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1GK=6H=bounce.vates.tech=bounce-md_30504962.692dbc21.v1-48f594ec5e2d46d98c7318464bdca1c2@srs-se1.protection.inumbo.net>)
 id 1vQ6MP-0002Ro-BC
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 16:02:45 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b2bbcf0-cecf-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 17:02:43 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dKpZn0pK2zCf9RN7
 for <xen-devel@lists.xenproject.org>; Mon,  1 Dec 2025 16:02:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 48f594ec5e2d46d98c7318464bdca1c2; Mon, 01 Dec 2025 16:02:41 +0000
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
X-Inumbo-ID: 2b2bbcf0-cecf-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764604961; x=1764874961;
	bh=wTQxpQQfgPrjbY7oIt614N2tDGiZ1nm5F0FQrhDGsts=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=n8WTVJa68gvA6/8QCRkaRQK9xKMaRihyoVp6ho8bOt5/3cRn4c5P6I1rCDJdzbi2p
	 ElJo0P79RBM/qojvB8ZSyfJxKCXkpBJJG1amfH0djmVI7M/WjFpiB1Orcv40GI31fF
	 YB6NRX/wRxtBsmk+mn2frRq1U0dFoZ/mM7UDWZbvWvZluoNK7NU4FmAQ1j84dbuLvQ
	 ALSh2pqpTY/QxxKWP0qBxHfIcjyUnwRemZ9KAwIWg90NYG0cQJe9Ix/Ix7CQNZcBPi
	 Ch88hcsuDepuXK5NkoPErWLYAoNyvmyPf4iBO3RH8h6Rye0JTTIVp/xiBTA3WXgoau
	 wQ7RdmBkCGOlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764604961; x=1764865461; i=julian.vetter@vates.tech;
	bh=wTQxpQQfgPrjbY7oIt614N2tDGiZ1nm5F0FQrhDGsts=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ewShey7UfWIxn/iLdwDXFhOOnVWqx/gHiiQsbzcWoWeJt4fr68RS/f3juDF9C3hO+
	 DmvQBxhhFLQPxlt/8fNezP8y90ieKr5Z7sQ7p9/guSS8HGzZYHRhq6G42doxoXJUSs
	 0bP3JOWCxoOSNPBpCmJuQNmLimQBDgJ6McjqMqYDfoOuVUX32wdKAlkZzmG15wmfDl
	 Uo+H3bI3VAql1mGK2jqEulki7sSzIZijZIsC8LzMjzUIltBPExr9vmKaRnCK04feow
	 V/NhHb0+gU8fvpeSgWJe2j+UNp7pvu7MlopQQ8ICr5F7m9KeTTA7fV79sN0wBQfeDN
	 GrxOPMXKNHwNQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/efi:=20Remove=20NX=20check=20from=20efi-boot.h?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764604951909
Message-Id: <c556d983-29da-467c-9787-a7d08b0b8f3c@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Teddy Astie" <teddy.astie@vates.tech>
References: <20251127143136.1598354-1-julian.vetter@vates.tech> <3653404b-0428-4dae-912f-18c4f8e74853@citrix.com> <83850159-6b76-4127-a689-e83a84c71e4f@vates.tech> <ac7c40e6-70d9-4141-bcb3-407e531d17ee@citrix.com>
In-Reply-To: <ac7c40e6-70d9-4141-bcb3-407e531d17ee@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.48f594ec5e2d46d98c7318464bdca1c2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251201:md
Date: Mon, 01 Dec 2025 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/28/25 7:25 PM, Andrew Cooper wrote:
> On 28/11/2025 1:19 pm, Julian Vetter wrote:
>> On 11/27/25 16:20, Andrew Cooper wrote:
>>> On 27/11/2025 2:31 pm, Julian Vetter wrote:
>>>> Currently Intel CPUs in EFI mode with the "Execute Disable Bit" disabl=
ed
>>>> and the 'CONFIG_REQUIRE_NX=3Dy' fail to boot, because this check is
>>>> performed before trampoline_setup is called, which determines if NX is
>>>> supported or if it's hidden by 'MSR_IA32_MISC_ENABLE[34] =3D 1' (if so=
,
>>>> re-enables NX).
>>>>
>>>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>>> Lovely...=C2=A0 This isn't the only bug; there's another one from the V=
ates
>>> forums about AMD CPUs which I haven't gotten around to fixing yet.
>>>
>> Thank you. I will have a look. I haven't seen this thread.
> 
> https://xcp-ng.org/forum/post/80714
> 
> But the tl;dr is that AMD have introduced a firmware option to disable
> NX.=C2=A0 Unlike Intel, there's no positive way to know you've reactivate=
d it.
> 

Yes, I found the thread. Thank you. I have now tested on 3 different AMD 
machines as well:
* Laptop with an Ryzen 9 5900HX -> XN not exposed via BIOS
* Beelink with AMD Ryzen 7 6800H-> XN exposed via BIOS -> XEN fails to 
boot if disabled
* Workstation with AMD Ryzen 5 7600 -> XN exposed via BIOS -> XEN fails 
to boot if disabled

again, I booted all machines via efi -> grub -> multiboot2 and I end up 
in the same "This build of Xen requires NX support", as on the Intel 
machines. But, as you explained the code path is the same, and the check 
even later than on Intel machines. So, no surprise.

> A conversation with AMD has revealed that there's no capability to
> prevent setting EFER.NXE, and that NX is always available in practice.
> I'm pretty sure the firmware is just clearing NX in the CPUID Override MS=
R.
> 
> However, to reactivate this safely, we need to do a wrmsr_safe(), which
> means we need to delay setting NXE until exception handling is available
> which is rather later on boot.=C2=A0 There's also a tangle with the
> order-of-initialisation of the CPUID Override MSRs which I found
> recently while doing something else.
> 
> The other observation is that, even on a STRICT_NX build of Xen, we can
> boot into __start_xen() because we can't insert NX into the pagetables
> that early.=C2=A0 In fact it's quite late that we lock down permissions; =
see
> the calls to modify_xen_mappings() in __start_xen().
> 
> Given that we need to be this late for AMD, we can also move the Intel
> logic later (effectively reverts part of the original work; sorry
> Alejandro) which means we can also use safe accessors, and we don't need
> to worry about the divergent early paths.
> 
>>
>>> Do you have any more information about which system looks like this?
>>>
>> I'm not sure if I understand your question correctly, but I was just
>> booting an Intel based machine newer than ~2012. I have tested this on 4
>> different machines, on which 3 hit this code path. One was a HPE
>> ProLiant m510 Server with a XEON CPU
> 
> Broadwell.
> 
>> , second was a Mini PC with Celeron CPU,
> 
> Sorry, not enough information here to figure out the microarchitecture.

Alder Lake Celeron.

> 
>> and third was an old Intel NUC DCCP847DYE also with a Celeron CPU.
> 
> Sandy Bridge.
> 
>> The only system where I couldn't reproduce the issue was an old
>> workstation with a Gigabyte mainboard. It has the flag in the Bios to
>> set MSR_IA32_MISC_ENABLE, but I'm not sure if it was actually booting
>> via UEFI.
> 
> Same, not enough information here.

Ivy Bridge (Intel Core i5-3470)

> 
> But, it's clear that Intel's XD-disable is still honoured in EFI mode on
> a wide range of systems, and that we need a fix for UEFI.
> 
>>   I will verify this on monday. I booted all the 3 other systems
>> via UEFI -> Grub -> multiboot2. My grub entry looks like this:
>>
>> multiboot2 /boot/xen.gz dom0_mem=3D2656M,max:2656M watchdog ucode=3Dscan
>> dom0_max_vcpus=3D1-8 crashkernel=3D256M,below=3D4G console=3Dvga vga=3Dm=
ode-0x0311
>> module2 boot/vmlinuz console=3Dhvc0 console=3Dtty0 init=3D/bin/sh
>> module2 boot/initrd-dom0
>>
>>> trampoline_setup isn't executed on all EFI boots.=C2=A0 I had a differe=
nt fix
>>> in mind, but it's a little more complicated.
>> Aha. yes, I didn't thought about other code paths.
> 
> https://xenbits.xen.org/docs/latest/hypervisor-guide/x86/how-xen-boots.ht=
ml
> 
> Here's something I put together to cover some of these details.=C2=A0 But=
,
> most of the detail is in the source only.
> 
> ~Andrew



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



