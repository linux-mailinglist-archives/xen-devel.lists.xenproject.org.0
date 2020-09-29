Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1827DCCF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 01:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386.1147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNPEF-0004M9-SE; Tue, 29 Sep 2020 23:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386.1147; Tue, 29 Sep 2020 23:40:15 +0000
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
	id 1kNPEF-0004Lk-P7; Tue, 29 Sep 2020 23:40:15 +0000
Received: by outflank-mailman (input) for mailman id 386;
 Tue, 29 Sep 2020 23:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5uqA=DG=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1kNPEE-0004Lf-7Q
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 23:40:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cbb8baeb-19b5-4d66-bbb4-8621277e90e5;
 Tue, 29 Sep 2020 23:40:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BA0D6E;
 Tue, 29 Sep 2020 16:40:06 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2303F70D;
 Tue, 29 Sep 2020 16:40:04 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5uqA=DG=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
	id 1kNPEE-0004Lf-7Q
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 23:40:14 +0000
X-Inumbo-ID: cbb8baeb-19b5-4d66-bbb4-8621277e90e5
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id cbb8baeb-19b5-4d66-bbb4-8621277e90e5;
	Tue, 29 Sep 2020 23:40:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6BA0D6E;
	Tue, 29 Sep 2020 16:40:06 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2303F70D;
	Tue, 29 Sep 2020 16:40:04 -0700 (PDT)
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org> <87k0wcppnj.fsf@linaro.org>
 <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org> <87d024p9tc.fsf@linaro.org>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <d4f86fcf-fe13-5d96-895f-2737300b6628@arm.com>
Date: Wed, 30 Sep 2020 00:39:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87d024p9tc.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 29/09/2020 22:11, Alex Bennée wrote:

Hi,

> Julien Grall <julien@xen.org> writes:
> 
>> Hi Alex,
>>
>> On 29/09/2020 16:29, Alex Bennée wrote:
>>>
>>> Julien Grall <julien@xen.org> writes:
>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Hi all,
>>>>
>>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>>> series aims to fix it.
>>>>
>>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
>>>> to only support 5.1).

Does QEMU provide ACPI tables? Or is this actually EDK2 generating them?

> So I did only some light testing.

So about that v6.0 or later: it seems like the requirement comes from:
commit 1c9bd43019cd "arm/acpi: Parse FADT table and get PSCI flags":
"Since STAO table and the GIC version are introduced by ACPI 6.0, we
will check the version and only parse FADT table with version >= 6.0. If
firmware provides ACPI tables with ACPI version less than 6.0, OS will
be messed up with those information, so disable ACPI if we get an FADT
table with version less than 6.0."

STAO (and XENV) have indeed been introduced by ACPI v6.0, but those
tables are supposed to be *generated* by Xen and handed down to Dom0,
they will never be provided by firmware (or parsed) by the Xen
hypervisor. Checking the Linux code it seems to actually not (yet?)
support the STAO named list, and currently finds and uses the STAO (UART
block bit) regardless of the FADT version number.

I can't find anything GIC related in the FADT, the whole GIC information
is described in MADT.

Linux/arm64 seems to be happy with ACPI >= v5.1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/acpi.c#n148

So can we relax the v6.0 requirement, to be actually >= v5.1? That is
among the first to support ARM anyway, IIRC.

I have only a smattering about ACPI, so happy to stand corrected.

Cheers,
Andre

>>>
>>> I was hoping to get more diagnostics out to get it working under QEMU
>>> TCG so I think must of missed a step:
>>>
>>>    Loading Xen 4.15-unstable ...
>>>    Loading Linux 4.19.0-11-arm64 ...
>>>    Loading initial ramdisk ...
>>>    Using modules provided by bootloader in FDT
>>>    Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d0) EFI loader
>>>    ...silence...
>>>
>>> I have a grub installed from testing on a buster base:
>>>
>>>    dpkg --status grub-arm64-efi
>>>    Version: 2.04-8
>>>
>>> With:
>>>
>>>    GRUB_CMDLINE_LINUX_DEFAULT=""
>>>    GRUB_CMDLINE_LINUX="console=ttyAMA0"
>>>    GRUB_CMDLINE_LINUX_XEN_REPLACE="console=hvc0 earlyprintk=xen"
>>>    GRUB_CMDLINE_XEN="loglvl=all guest_loglvl=all com1=115200,8n1,0x3e8,5console=com1,vg"
>>>
>>> And I built Xen with --enable-systemd and tweaked the hypervisor .config:
>>>
>>>    CONFIG_EXPERT=y
>>>    CONFIG_ACPI=y
>>>
>>> So any pointers to make it more verbose would be helpful.
>>
>> The error is hapenning before Xen setup the console. You can get early 
>> output on QEMU if you rebuild Xen with the following .config options:
>>
>> CONFIG_DEBUG=y
>> CONFIG_EARLY_UART_CHOICE_PL011=y
>> CONFIG_EARLY_UART_PL011=y
>> CONFIG_EARLY_PRINTK=y
>> CONFIG_EARLY_UART_BASE_ADDRESS=0x09000000
>> CONFIG_EARLY_UART_PL011_BAUD_RATE=0
>> CONFIG_EARLY_PRINTK_INC="debug-pl011.inc"
> 
> OK I can see it fails on the ACPI and then tries to fall back to FDT and
> then fails to find the GIC:
> 
>   (XEN) CMDLINE[00000000f7bbe000]:chosen placeholder root=UUID=cf00cd3a-066b-4146-bedf-f811d3343077 ro console=hvc0 earlyprintk=xen
>   (XEN)
>   (XEN) Command line: placeholder loglvl=all guest_loglvl=all com1=115200,8n1,0x3e8,5console=com1,vg no-real-mode edd=off
>   (XEN) parameter "placeholder" unknown!
>   (XEN) parameter "no-real-mode" unknown!
>   (XEN) parameter "edd" unknown!
>   (XEN) ACPI: RSDP 138560000, 0024 (r2 BOCHS )
>   (XEN) ACPI: XSDT 138550000, 004C (r1 BOCHS  BXPCFACP        1       1000013)
>   (XEN) ACPI: FACP 138510000, 010C (r5 BOCHS  BXPCFACP        1 BXPC        1)
>   (XEN) ACPI: DSDT 138520000, 14A6 (r2 BOCHS  BXPCDSDT        1 BXPC        1)
>   (XEN) ACPI: APIC 138500000, 018C (r3 BOCHS  BXPCAPIC        1 BXPC        1)
>   (XEN) ACPI: GTDT 1384F0000, 0060 (r2 BOCHS  BXPCGTDT        1 BXPC        1)
>   (XEN) ACPI: MCFG 1384E0000, 003C (r1 BOCHS  BXPCMCFG        1 BXPC        1)
>   (XEN) ACPI: SPCR 1384D0000, 0050 (r2 BOCHS  BXPCSPCR        1 BXPC        1)
>   (XEN) Unsupported FADT revision 5.1, should be 6.0+, will disable ACPI
>   (XEN) acpi_boot_table_init: FADT not found (-22)
>   (XEN) Domain heap initialised
>   (XEN) Booting using Device Tree
>   (XEN) Platform: Generic System
>   (XEN)
>   (XEN) ****************************************
>   (XEN) Panic on CPU 0:
>   (XEN) Unable to find compatible GIC in the device tree
>   (XEN) ****************************************
>   (XEN)
>   (XEN) Reboot in five seconds...
> 
> Despite saying it is going to reboot it never manages to. Any idea how
> it is trying to reset the system?
> 


