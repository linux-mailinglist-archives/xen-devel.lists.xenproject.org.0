Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6A27E776
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581.1947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZzy-0004dg-I3; Wed, 30 Sep 2020 11:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581.1947; Wed, 30 Sep 2020 11:10:14 +0000
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
	id 1kNZzy-0004dH-Ec; Wed, 30 Sep 2020 11:10:14 +0000
Received: by outflank-mailman (input) for mailman id 581;
 Wed, 30 Sep 2020 11:10:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNZzx-0004cl-18
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:10:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a84eeb9b-de5c-43f6-a3fe-c2b85f6b8ec8;
 Wed, 30 Sep 2020 11:10:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNZzr-0007oC-P6; Wed, 30 Sep 2020 11:10:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNZzr-0001vB-Al; Wed, 30 Sep 2020 11:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNZzx-0004cl-18
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:10:13 +0000
X-Inumbo-ID: a84eeb9b-de5c-43f6-a3fe-c2b85f6b8ec8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a84eeb9b-de5c-43f6-a3fe-c2b85f6b8ec8;
	Wed, 30 Sep 2020 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vQhPHK+hACdRQr/fNAeltUsBwc2+DQKQScf+pa4aa0U=; b=cn77hQMQvCrV0q8WGa4p2F4DdU
	pR1ilzOIwxAl/y1ejkAhaauRBl1VeTq1Xlw+xRNbtEBNFIwvMZC0XfQHm6m28wIXV4sTbIDw6D97v
	GvkX9KiFtYsfkV4q63YkA3v1CeoON78m2tK5Ee6JZNuxxHRViR2IcykYS2Zx2WxYgHi8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNZzr-0007oC-P6; Wed, 30 Sep 2020 11:10:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNZzr-0001vB-Al; Wed, 30 Sep 2020 11:10:07 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org> <87k0wcppnj.fsf@linaro.org>
 <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org> <87d024p9tc.fsf@linaro.org>
 <a42d2724-4d9b-a177-35c7-44bd0250f265@xen.org> <874knfpn0n.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
Message-ID: <5afcd9d2-aa6f-9901-bd2c-b53c5649e498@xen.org>
Date: Wed, 30 Sep 2020 12:10:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <874knfpn0n.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alex,

On 30/09/2020 11:38, Alex Bennée wrote:
> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi Alex,
>>
>> On 29/09/2020 22:11, Alex Bennée wrote:
>>>
>>> Julien Grall <julien@xen.org> writes:
>>>
>>>> Hi Alex,
>>>>
>>>> On 29/09/2020 16:29, Alex Bennée wrote:
>>>>>
>>>>> Julien Grall <julien@xen.org> writes:
>>>>>
>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> Xen on ARM has been broken for quite a while on ACPI systems. This
>>>>>> series aims to fix it.
>>>>>>
>>>>>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
>>>>>> to only support 5.1). So I did only some light testing.
>>>>>
>>>>> I was hoping to get more diagnostics out to get it working under QEMU
>>>>> TCG so I think must of missed a step:
>>>>>
>>>>>      Loading Xen 4.15-unstable ...
>>>>>      Loading Linux 4.19.0-11-arm64 ...
>>>>>      Loading initial ramdisk ...
>>>>>      Using modules provided by bootloader in FDT
>>>>>      Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d0) EFI loader
>>>>>      ...silence...
>>>>>
>>>>> I have a grub installed from testing on a buster base:
>>>>>
>>>>>      dpkg --status grub-arm64-efi
>>>>>      Version: 2.04-8
>>>>>
>>>>> With:
>>>>>
>>>>>      GRUB_CMDLINE_LINUX_DEFAULT=""
>>>>>      GRUB_CMDLINE_LINUX="console=ttyAMA0"
>>>>>      GRUB_CMDLINE_LINUX_XEN_REPLACE="console=hvc0 earlyprintk=xen"
>>>>>      GRUB_CMDLINE_XEN="loglvl=all guest_loglvl=all com1=115200,8n1,0x3e8,5console=com1,vg"
>>>>>
>>>>> And I built Xen with --enable-systemd and tweaked the hypervisor .config:
>>>>>
>>>>>      CONFIG_EXPERT=y
>>>>>      CONFIG_ACPI=y
>>>>>
>>>>> So any pointers to make it more verbose would be helpful.
>>>>
>>>> The error is hapenning before Xen setup the console. You can get early
>>>> output on QEMU if you rebuild Xen with the following .config options:
>>>>
>>>> CONFIG_DEBUG=y
>>>> CONFIG_EARLY_UART_CHOICE_PL011=y
>>>> CONFIG_EARLY_UART_PL011=y
>>>> CONFIG_EARLY_PRINTK=y
>>>> CONFIG_EARLY_UART_BASE_ADDRESS=0x09000000
>>>> CONFIG_EARLY_UART_PL011_BAUD_RATE=0
>>>> CONFIG_EARLY_PRINTK_INC="debug-pl011.inc"
>>>
>>> OK I can see it fails on the ACPI and then tries to fall back to FDT and
>>> then fails to find the GIC:
>>>
>>>     (XEN) CMDLINE[00000000f7bbe000]:chosen placeholder root=UUID=cf00cd3a-066b-4146-bedf-f811d3343077 ro console=hvc0 earlyprintk=xen
>>>     (XEN)
>>>     (XEN) Command line: placeholder loglvl=all guest_loglvl=all com1=115200,8n1,0x3e8,5console=com1,vg no-real-mode edd=off
>>>     (XEN) parameter "placeholder" unknown!
>>>     (XEN) parameter "no-real-mode" unknown!
>>>     (XEN) parameter "edd" unknown!
>>>     (XEN) ACPI: RSDP 138560000, 0024 (r2 BOCHS )
>>>     (XEN) ACPI: XSDT 138550000, 004C (r1 BOCHS  BXPCFACP        1       1000013)
>>>     (XEN) ACPI: FACP 138510000, 010C (r5 BOCHS  BXPCFACP        1 BXPC        1)
>>>     (XEN) ACPI: DSDT 138520000, 14A6 (r2 BOCHS  BXPCDSDT        1 BXPC        1)
>>>     (XEN) ACPI: APIC 138500000, 018C (r3 BOCHS  BXPCAPIC        1 BXPC        1)
>>>     (XEN) ACPI: GTDT 1384F0000, 0060 (r2 BOCHS  BXPCGTDT        1 BXPC        1)
>>>     (XEN) ACPI: MCFG 1384E0000, 003C (r1 BOCHS  BXPCMCFG        1 BXPC        1)
>>>     (XEN) ACPI: SPCR 1384D0000, 0050 (r2 BOCHS  BXPCSPCR        1 BXPC        1)
>>>     (XEN) Unsupported FADT revision 5.1, should be 6.0+, will disable ACPI
>>>     (XEN) acpi_boot_table_init: FADT not found (-22)
>>>     (XEN) Domain heap initialised
>>>     (XEN) Booting using Device Tree
>>>     (XEN) Platform: Generic System
>>>     (XEN)
>>>     (XEN) ****************************************
>>>     (XEN) Panic on CPU 0:
>>>     (XEN) Unable to find compatible GIC in the device tree
>>>     (XEN) ****************************************
>>>     (XEN)
>>>     (XEN) Reboot in five seconds...
>>>
>>> Despite saying it is going to reboot it never manages to. Any idea how
>>> it is trying to reset the system?
>>
>> This is a bit of chicken and eggs problem. To know the reset method, you
>> need to parse the ACPI tables. As we can't parse then we don't know the
>> reset method. So, Xen will just do an infinite loop.
> 
> Well you do get some ACPI tables - downgrading the minimum at least
> restores the reset method detection. I wonder if it would be worth
> defaulting to PSCI if you don't know rather than hang indefinitely?

The risk is probably low enough to try to use PSCI even on platform not 
supporting it.

Although, it might be worth to check if EL3 is present to avoid 
panicking again and again on XGene.

> 
> FWIW the failure after that is failing to find the GIC - I'm just
> looking at the MADT table parsing now. Why am I getting a sense of
> DejaVu?

The ACPI code in Xen is based on the first ACPI implementation in Linux. 
So it is quite possible you encountered the bug there :).

>> It would probably be good to be more forthcoming with the users and say
>> it will not reboot.
>>
>> Also, IIRC, the time subsystem is not yet initialized. So it might be
>> possible to mdelay() doesn't work properly.
> 
> Surely that's an architectural subsystem so there is no reason that
> couldn't be up and running.

In theory yes, but the code is also catering some interesting/weird 
platforms behavior:
    1) There are (were?) platform where CNTFREQ was not set correctly
    2) Some platforms, such as the one with Exynos 5, (used to?) require 
specific code to enable the arch timer.

We are still using the Arndale for automated testing. So we would need 
to keep the hacks.

But it would be possible to rework the code and try to make the timer 
available earlier for well-behaved platforms.

Cheers,

-- 
Julien Grall

