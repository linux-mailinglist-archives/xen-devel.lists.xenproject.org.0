Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D92C8592DF
	for <lists+xen-devel@lfdr.de>; Sat, 17 Feb 2024 22:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682494.1061590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbRoF-0000rZ-Et; Sat, 17 Feb 2024 21:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682494.1061590; Sat, 17 Feb 2024 21:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbRoF-0000oh-Bp; Sat, 17 Feb 2024 21:01:19 +0000
Received: by outflank-mailman (input) for mailman id 682494;
 Sat, 17 Feb 2024 21:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWb+=J2=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1rbRoC-0000ob-Up
 for xen-devel@lists.xenproject.org; Sat, 17 Feb 2024 21:01:17 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae4cd391-cdd7-11ee-98f5-efadbce2ee36;
 Sat, 17 Feb 2024 22:01:12 +0100 (CET)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 49.11.2 AUTH)
 with ESMTPSA id Y5995401HL18yWF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 17 Feb 2024 22:01:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id 7229E20BF4;
 Sat, 17 Feb 2024 22:01:08 +0100 (CET)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id UYWYfHpZfOkh; Sat, 17 Feb 2024 22:01:07 +0100 (CET)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id 9DD8A202E1;
 Sat, 17 Feb 2024 22:01:07 +0100 (CET)
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
X-Inumbo-ID: ae4cd391-cdd7-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1708203668; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NTaJQp2IQUWHCgm4COaB2kgwpdTzzEBTvnnPMGIDhSduk/xZ5ni7RIDoH8UU16lt1D
    lr5YogzyaVYAgq5hrgYaVUJGDGPjmHuhUw04XNdQnNyQGj2Q8Qkk7JXYq63VRUlRNLjE
    rNzZ531kJdWlReeAIV1um5IpNinUIlAGGCiWOZY/IbfHuKl6rF6kMTCrm5HBz/D58Wim
    rNHFrmUA3gTxua1J6QGk5aK4HzVpx8kCW63qDpdRcubdWKN8N53xcXi2hKWDkjmKkTaT
    QGMl7MGPIrOwLUkaM4R6LnjJo7d6zGRkVwG3omBulGcwZwTx+H6lfaXVHx7IjnNfP3nh
    udQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1708203668;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=X1wJzkstUc4HfiIEHygOoDaGxhWJmdEyuK1qZf2SRw8=;
    b=FrZ1T2Og7enpTuuHcKRLwlML3T5SSuRU6zvOuCZIK+jZNM9eQSHsm+fL3utJRki2JN
    0hKjFFBlNdwrCqp8yGXXvWgzAS7smT7ZEnnNzz1KoRpu1b9Fi0nhFk9Eg7BkbzKMSK2N
    KtKM8e75Dq6BYvtE5IZtDOPUxzsP8irq7UG/Qx59d4/UjBKUWKUswRVpYa36eS5LNW4g
    lMZazTgjkI2t+HeWAQmtMfi5AwKIOqg1Urx/15Ph0nM0xB8+RKgA59AOjLaxCMp/Ie5s
    sYks+wIzn9C+jZfGuQuaxtQXE6imhgYSFGQD1i090sMwfXbTHZam1rDsntBGRz67/6jE
    5LEw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1708203668;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=X1wJzkstUc4HfiIEHygOoDaGxhWJmdEyuK1qZf2SRw8=;
    b=juxdaj/09B1zjuv4GrmdXtpJYR+cmU8Oy2u89+QROqJEkJlWe14w4nLFKBAv1ebscM
    VnGl8KIy8ETeWZOmAxioFG50l3NIJ7UfqvU2VeQb6bGfokG46Db9tR8AZ9gAy1aUdq57
    Ki7EYnUkBjkp/WOy0sDMTiBZPY0jLGnXYGluh/UTpWEkzPsnsc9NxxPwE6OnIVeQe7DA
    ofsOnUQlk1ERttD9S/RjVlR7E8kr0Di4t5ymlk0HUUphD2rOE1UPikW+p2j7+7Jc0dU3
    HJ2rGX/2IxpVuGFblUBLR6+7KFXNPLzMlJ0B0PyC/6oRu3frmWJbvLL0P0pK3h23pk9G
    W5jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1708203668;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=X1wJzkstUc4HfiIEHygOoDaGxhWJmdEyuK1qZf2SRw8=;
    b=+OrXcgJCsoi7TemNZf0fBEQEKQwBRip1Oi7jenz8wL8tbzBgMqZiVa0l0DILwEOXmG
    Av63YJGZpfop+BcB7cDg==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO9uVFQeS3s1LjmLQORrCeiSIlV428qMUC/ada3WaVebykAvjCQ=="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <ab6cb863-4aee-4a4e-81c6-b3c0ca8cef13@onlineschubla.de>
Date: Sat, 17 Feb 2024 22:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <D2496DDC-78FA-4CC1-B7FC-EB62E506BC4F@arm.com>
 <1572ed53-494d-4dd0-b470-85ff2efb229b@onlineschubla.de>
 <D24E1CA2-4033-455D-A97A-3D35547FAE76@arm.com>
From: Paul Leiber <paul@onlineschubla.de>
In-Reply-To: <D24E1CA2-4033-455D-A97A-3D35547FAE76@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.01.2024 um 09:12 schrieb Bertrand Marquis:
> Hi Paul,
> 
> Please keep me in CC so that i can more easily find out that you answered me :-)
> 
>> On 25 Jan 2024, at 00:05, Paul Leiber <paul@onlineschubla.de> wrote:
>>
>> Elliot, Bertrand, George: Thanks for your replies.
>>
>> Am 23.01.2024 um 09:29 schrieb Bertrand Marquis:
>>> Hi,
>>>   will try to explain some of the messages here after but I am not sure of the reason
>>> of the crash so I will just set some pointers...
>>>> On 22 Jan 2024, at 11:46, George Dunlap <george.dunlap@cloud.com> wrote:
>>>>
>>>> On Fri, Jan 19, 2024 at 8:32 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>>>>>
>>>>> On Sun, Jan 14, 2024 at 10:54:24PM +0100, Paul Leiber wrote:
>>>>>>
>>>>>>>> TL;DR:
>>>>>>>> ------
>>>>>>>>
>>>>>>>> Causing certain web server traffic on a secondary VLAN on Raspberry Pi
>>>>>>>> under vanilla Debian/UEFI in combination with Xen leads to complete
>>>>>>>> system reboot (watchdog triggering for Dom0). Other strange things are
>>>>>>>> happening.
>>>>>>>>

[snip]

>>>>>>
>>>>>> Not knowing if it helps, I added Xen logs from boot until Dom0
>>>>>> crash/reboot below.
>>>>>>
>>>>>> Loading Xen xen ...
>>>>>> Loading Linux 6.1.0-17-arm64 ...
>>>>>> Loading initial ramdisk ...
>>>>>> Using modules provided by bootloader in FDT
>>>>>> Xen 4.19-unstable (c/s Fri Jan 12 11:54:31 2024 +0000
>>>>>> git:1ec3fe1f66-dirty) EFI
>>>>>> loader
>>>>>>   Xen 4.19-unstable
>>>>>> (XEN) Xen version 4.19-unstable (root@lan.onlineschubla.de) (gcc (Debian
>>>>>> 12.2.0-
>>>>>>
>>>>>>
>>>>>>                             14) 12.2.0) debug=y Sun Jan 14 21:46:34 CET 2024
>>>>>> (XEN) Latest ChangeSet: Fri Jan 12 11:54:31 2024 +0000 git:1ec3fe1f66-dirty
>>>>>> (XEN) build-id: babb03cb6107fc46f7d8969142ccd6772a1133c3
>>>>>> (XEN) Console output is synchronous.
>>>>>> (XEN) Processor: 00000000410fd083: "ARM Limited", variant: 0x0, part
>>>>>> 0xd08,rev 0
>>>>>>
>>>>>>
>>>>>>                                 x3
>>>>>> (XEN) 64-bit Execution:
>>>>>> (XEN)   Processor Features: 0000000000002222 0000000000000000
>>>>>> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
>>>>>> (XEN)     Extensions: FloatingPoint AdvancedSIMD
>>>>>> (XEN)   Debug Features: 0000000010305106 0000000000000000
>>>>>> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
>>>>>> (XEN)   Memory Model Features: 0000000000001124 0000000000000000
>>>>>> (XEN)   ISA Features:  0000000000010000 0000000000000000
>>>>>> (XEN) 32-bit Execution:
>>>>>> (XEN)   Processor Features: 0000000000000131:0000000000011011
>>>>>> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
>>>>>> (XEN)     Extensions: GenericTimer Security
>>>>>> (XEN)   Debug Features: 0000000003010066
>>>>>> (XEN)   Auxiliary Features: 0000000000000000
>>>>>> (XEN)   Memory Model Features: 0000000010201105 0000000040000000
>>>>>> (XEN)                          0000000001260000 0000000002102211
>>>>>> (XEN)   ISA Features: 0000000002101110 0000000013112111 0000000021232042
>>>>>> (XEN)                 0000000001112131 0000000000011142 0000000000010001
>>>>>> (XEN) Using SMC Calling Convention v1.2
>>>>>> (XEN) Using PSCI v1.1
>>>>>> (XEN) ACPI: GICC (acpi_id[0x0000] address[0xff842000] MPIDR[0x0] enabled)
>>>>>> (XEN) ACPI: GICC (acpi_id[0x0001] address[0xff842000] MPIDR[0x1] enabled)
>>>>>> (XEN) ACPI: GICC (acpi_id[0x0002] address[0xff842000] MPIDR[0x2] enabled)
>>>>>> (XEN) ACPI: GICC (acpi_id[0x0003] address[0xff842000] MPIDR[0x3] enabled)
>>>>>> (XEN) 4 CPUs enabled, 4 CPUs total
>>>>>> (XEN) SMP: Allowing 4 CPUs
>>>>>> (XEN) enabled workaround for: ARM erratum 1319537
>>>>>> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 54000 KHz
>>>>>> (XEN) GICv2 initialization:
>>>>>> (XEN)         gic_dist_addr=00000000ff841000
>>>>>> (XEN)         gic_cpu_addr=00000000ff842000
>>>>>> (XEN)         gic_hyp_addr=00000000ff844000
>>>>>> (XEN)         gic_vcpu_addr=00000000ff846000
>>>>>> (XEN)         gic_maintenance_irq=25
>>>>>> (XEN) GICv2: 256 lines, 4 cpus, secure (IID 0200143b).
>>>>>> (XEN) XSM Framework v1.0.1 initialized
>>>>>> (XEN) Initialising XSM SILO mode
>>>>>> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
>>>>>> (XEN) Initializing Credit2 scheduler
>>>>>> (XEN)  load_precision_shift: 18
>>>>>> (XEN)  load_window_shift: 30
>>>>>> (XEN)  underload_balance_tolerance: 0
>>>>>> (XEN)  overload_balance_tolerance: -3
>>>>>> (XEN)  runqueues arrangement: socket
>>>>>> (XEN)  cap enforcement granularity: 10ms
>>>>>> (XEN) load tracking window length 1073741824 ns
>>>>>> (XEN) Allocated console ring of 32 KiB.
>>>>>> (XEN) CPU0: Guest atomics will try 16 times before pausing the domain
>>>>>> (XEN) Bringing up CPU1
>>>>>> (XEN) CPU1: Guest atomics will try 16 times before pausing the domain
>>>>>> (XEN) CPU 1 booted.
>>>>>> (XEN) Bringing up CPU2
>>>>>> (XEN) CPU2: Guest atomics will try 13 times before pausing the domain
>>>>>> (XEN) CPU 2 booted.
>>>>>> (XEN) Bringing up CPU3
>>>>>> (XEN) CPU3: Guest atomics will try 16 times before pausing the domain
>>>>>> (XEN) Brought up 4 CPUs
>>>>>> (XEN) CPU 3 booted.
>>>>>> (XEN) I/O virtualisation disabled
>>>>>> (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
>>>>>> (XEN) P2M: 4 levels with order-0 root, VTCR 0x0000000080043594
>>>>>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>>>>> (XEN) Initializing Credit2 scheduler
>>>>>> (XEN)  load_precision_shift: 18
>>>>>> (XEN)  load_window_shift: 30
>>>>>> (XEN)  underload_balance_tolerance: 0
>>>>>> (XEN)  overload_balance_tolerance: -3
>>>>>> (XEN)  runqueues arrangement: socket
>>>>>> (XEN)  cap enforcement granularity: 10ms
>>>>>> (XEN) load tracking window length 1073741824 ns
>>>>>> (XEN) Adding cpu 0 to runqueue 0
>>>>>> (XEN)  First cpu on runqueue, activating
>>>>>> (XEN) Adding cpu 1 to runqueue 0
>>>>>> (XEN) Adding cpu 2 to runqueue 0
>>>>>> (XEN) Adding cpu 3 to runqueue 0
>>>>>> (XEN) alternatives: Patching with alt table 00000a00002ee0b0 ->
>>>>>> 00000a00002ef250
>>>>>> (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>>> (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>>> (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>>> (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>>> (XEN) *** LOADING DOMAIN 0 ***
>>>>>> (XEN) Loading d0 kernel from boot module @ 0000000030ef7000
>>>>>> (XEN) Loading ramdisk from boot module @ 000000002ee6d000
>>>>>> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
>>>>>> (XEN) BANK[0] 0x00000040000000-0x00000080000000 (1024MB)
>>>>>> (XEN) Grant table range: 0x0000002eceb000-0x0000002ed2b000
>>>>>> (XEN) Allocating PPI 16 for event channel interrupt
>>>>>> (XEN) Loading zImage from 0000000030ef7000 to
>>>>>> 0000000040000000-0000000041f1c7c0
>>>>>> (XEN) Loading d0 initrd from 000000002ee6d000 to
>>>>>> 0x0000000048200000-0x000000004a
>>>>>>
>>>>>>
>>>>>>                                                     288c22
>>>>>> (XEN) Loading d0 DTB to 0x0000000048000000-0x00000000480002c3
>>>>>> (XEN) Initial low memory virq threshold set at 0x4000 pages.
>>>>>> (XEN) Scrubbing Free RAM in background
>>>>>> (XEN) Std. Loglevel: All
>>>>>> (XEN) Guest Loglevel: All
>>>>>> (XEN) ***************************************************
>>>>>> (XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
>>>>>> (XEN) This option is intended to aid debugging of Xen by ensuring
>>>>>> (XEN) that all output is synchronously delivered on the serial line.
>>>>>> (XEN) However it can introduce SIGNIFICANT latencies and affect
>>>>>> (XEN) timekeeping. It is NOT recommended for production use!
>>>>>> (XEN) ***************************************************
>>>>>> (XEN) 3... 2... 1...
>>>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>>>>> (XEN) Freed 376kB init memory.
>>>>>> (XEN) d0v0 Unhandled SMC/HVC: 0x84000050
>>>>>> (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
>>> This means Linux is trying to do some kind of smc call which is not handled.
>>> I will highly suggest to investigate here as it could really be some platform
>>> specific calls trying to enable some clocks.
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
>>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>>> (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>>> (XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>>> (XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>> Those can be ignored. This is Linux writing to some GIC registers we do not
>>> emulate so we warn that those are ignored. Those messages are present on
>>> all arm targets when the log level of Xen is high.
>>>>>> (XEN) d1v0 Unhandled SMC/HVC: 0x84000050
>>>>>> (XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
>>> Same as upper done on a different core
>>>>>> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>> Can be ignored as explained earlier
>>>>>> (XEN) common/grant_table.c:1909:d1v0 Expanding d1 grant table from 1 to
>>>>>> 2 frames
>>> Those are internal debug messages to Xen and can be ignored (they are present
>>> on most arm targets).
>>>>>> (XEN) gnttab_mark_dirty not implemented yet
>>> Can be ignored to
>>>>>> (XEN) d2v0 Unhandled SMC/HVC: 0x84000050
>>>>>> (XEN) d2v0 Unhandled SMC/HVC: 0x8600ff01
>>> Same as upper on a different core
>>>>>> (XEN) d2v0: vGICD: unhandled word write 0x000000
>>> Same as upper on a different core
>>
>> Is this also relevant or not?
> 
> This one is weird and i cannot identify where it could come from as all printk in vGICD
> have something after. Maybe specific to your version of Xen.
> But I would say you can ignore.
> 
>>
>> I couldn't identify this yet. There is a mailing list exchange that could be related:
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00382.html
>>
>> Although I'm a little bit puzzled because when comparing with the other messages, this log meassage seems to be missing some parts "vGICD: unhandled word write 0x000000" instead of "vGICD: unhandled word write 0x000000xxxxxxx to y"
> 
> Agree, could be that something is lost in the console.
> 
>>
>>>>>> ffffffff to ICACTIVER0
>>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 1 to
>>>>>> 2 frames
>>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 2 to
>>>>>> 3 frames
>>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 3 to
>>>>>> 4 frames
>>>>>> (XEN) Watchdog timer fired for domain 0
>>>>>> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
>>>>>
>>>>> I'm unsure whose attention to draw to this report.
>>>>>
>>>>> This might be a scheduler issue since the watchdog timer is triggering.
>>>>>
>>>>> This might be an ACPI issue as ACPI is in use here.
>>>>>
>>>>> This might be an ARM Linux kernel issue.
>>>>>
>>>>> In the end this is someone running into trouble with Xen on an ARM
>>>>> device.  Yet despite bringing up the issue hasn't gotten any help...
>>>>
>>>> Hey Elliot,
>>>>
>>>> Thanks for raising the visibility of this.  I'm not familiar with ARM,
>>>> but if I were investigating this I'd try to figure out what the
>>>> "unhandled" error messages are.  "gnttab_mark_dirty not implemented
>>>> yet" looks pretty sus too, and also sounds like it might be something
>>>> ARM-specific.
>>> I tried to explain those and they are not the reason of the problem.
>>>>
>>>> I don't see anything suspicious WRT the scheduler, but a simple way to
>>>> test that would be to set the scheduler to credit1 and see if that
>>>> changes things.
>>> I would definitely suggest to investigate the 2 unhandled SMC/HVC calls
>>> as if one of them is to enable some clock it could explain why the system is
>>> getting stuck at some point (maybe waiting for something to be started).
>>> Other than that i did not see anything that could point to an obvious issue.
>>
>> I'll try to use credit1 scheduler and report results when I've got some more time, just to make sure.
> 
> This is not related to the scheduler. When i said clock i meant linux trying to configure the clock
> frequency or voltage of a specific peripheral.
> 
>>
>>  From what I could find out in ARM documentation, the unhandled calls seem to be the following:
>>
>> 0x84000050 = TRNG_VERSION, returns the implemented TRNG (True Random Number Generator) ABI version [1]
> 
> Could be the origin but then you can ignore i would say, linux might fall back to an other way.

The SMC code 0x84000050 is defined in include/linux/arm-smccc.h as 
constant ARM_SMCCC_TRNG_VERSION. This constant is used in six source 
files [1]. Two source files are smccc.h itself:

include/linux/arm-smccc.h
tools/include/linux/arm-smccc.h).

Three have to do with KVM:

arch/arm64/kvm/trng.c
arch/arm64/kvm/hypercalls.c
tools/testing/selftests/kvm/aarch64/hypercalls.c

One sticks out as not KVM related:

arch/arm64/include/asm/archrandom.h


>> 0x8600ff01 = Call UID Query for Vendor Specific Hypervisor Service, Returns a unique identifier of the service provider [2]
> 
> I would say this one is the problem and you would need to dig in Linux to understand what vendor specific call is being made.
> Linux might expect that this one is done but Xen is ignoring it.
> So Linux could just be waiting for something that was actually not started at all.
> 
>>
>> Does this make sense?
>>
>> What could be next steps?
> 
> I would say understand in Linux who is generating this call and try to disable in the linux
> configuration whatever clock/voltage/performance driver is doing this call.


The SMC code 0x8600ff01 is defined in include/linux/arm-smccc.h as 
constant ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID. This constant is also 
used in six source files [2], 2 of which again are smccc.h itself

include/linux/arm-smccc.h
tools/include/linux/arm-smccc.h

One is KVM documentation:

Documentation/virt/kvm/arm/hypercalls.rst

The three remaining again have to do with KVM:

drivers/firmware/smccc/kvm_guest.c
arch/arm64/kvm/hypercalls.c
tools/testing/selftests/kvm/aarch64/hypercalls.c

I wouldn't expect that anything KVM related could be the cause for the 
Xen watchdog triggering. If this is right, this would leave us with the 
TRNG trace in arch/arm64/include/asm/archrandom.h. Or am I wrong, and 
some KVM component can also be the cause?

Also, what still puzzles me is the fact that the Xen watchdog is only 
triggered when multiple VLANs are in use. Where could the connection to 
networking be?

Best regards,

Paul

[1] 
https://github.com/search?q=repo%3Atorvalds%2Flinux+ARM_SMCCC_TRNG_VERSION&type=code
[2] 
https://github.com/search?q=repo%3Atorvalds/linux%20ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID&type=code



