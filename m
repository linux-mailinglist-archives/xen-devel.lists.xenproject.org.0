Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D286E9B2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 20:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687783.1071577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg8hP-0004AO-6j; Fri, 01 Mar 2024 19:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687783.1071577; Fri, 01 Mar 2024 19:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg8hP-00048E-42; Fri, 01 Mar 2024 19:37:39 +0000
Received: by outflank-mailman (input) for mailman id 687783;
 Fri, 01 Mar 2024 19:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=udTc=KH=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1rg8hN-000488-UL
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 19:37:38 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2792e4ea-d803-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 20:37:35 +0100 (CET)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 50.2.0 DYNA|AUTH)
 with ESMTPSA id Q6d30f021JbUCIo
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 1 Mar 2024 20:37:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id C0159212DF;
 Fri,  1 Mar 2024 20:37:29 +0100 (CET)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ix7kuN1XG4ag; Fri,  1 Mar 2024 20:37:28 +0100 (CET)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id 8A54820020;
 Fri,  1 Mar 2024 20:37:28 +0100 (CET)
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
X-Inumbo-ID: 2792e4ea-d803-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; t=1709321852; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ePxYMhOXB4gAjpfsYfIQhpL1wqwQ+ICzN1g/yf7eQtAFC/SggsIQMHm9NHGhDQJhcR
    9y8jNmql00h0qYGLl0Rt9VhteFJ7v9naRMip2VG7O0dS0nCsx1O06JXASNhlrHrbkHJM
    yfPZkG7gysOgOj7IgM6kith2U7Wjk7CKfnyPt8a5m3vCoTdm1O4BUlq5VA9CN2420Mbc
    xeKmZ5yiF4B0WWmNuknc6DcXO9dMqRpYMbNB5WHqliAuhCLRyt2gfuQyUsVqpWCFSFSg
    OWccoB9utSIi3OUfl5H0f3d+tNezEuRagBzOllgbO2OWADUsVQ4g2HOxrzaoNXOgs5Hp
    advA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1709321852;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IWlELYAiXQ3U7oDeD4QaXNJ3t+jMzhfgNyOJvwZwup4=;
    b=fjq8TEdvUICIDuR9rR9Se/D6wVEi1prxHVvedPvDSB6JzLtp3R1FGNkR8RFQE3a4O1
    deP7VZMJv7gpvY3sukiS1bRWIEPQU21oFiyw6upysABUkeLzG9GT7/5h0UfLmjXayZF+
    8Ty6LprlDMWk3Qqm25NClxpn8IUWvU06GSxWsBSOY6BMXARUSM6E+gwxsPlesEkqTUtE
    fjLe5zfklVRU6OriH2DZcvPDxiURHCX165bge2r7+hMpLd2Jw1/LwgFFvzlb+reFTRWh
    guQP2Gy1RjDrV5K5Xd5rS6IsXs++lAqCqe6CwWsxpRsZqZsrjgukNRxAX+7MCVSLbhKD
    wSnw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1709321852;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IWlELYAiXQ3U7oDeD4QaXNJ3t+jMzhfgNyOJvwZwup4=;
    b=jeDUrLs+dnjs9Jwih4MsOdMIJrs7IqOic9OjvRUbx0pusPuSd3CQppQUPzFuHDDain
    YN37M2BrcjGJ1Bnv0rEDSFguG5dCHwoiFSf/Tg/IzCEk12E52/Zo6uo39NL1mvTWKzzq
    xL3OsLNPFYU9iSRMRbgpAKE8r3Na0d1sdtS4abz8qIoWleCZjWEzJm73GX/S6YtscrTp
    RfxhwISBYshyMM5nCgnY5a5xbL1S/g17wlzECwvoa4Nqcpz5rizJy1cXfTZ+Y9G3K8xr
    uVYS8UdyY4yFi+A+0SAQt1Pe6ix4Ih3uB9CJDzxoYSU8iOESnZqIvQgxc9kOoPdg1zIb
    BIww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1709321852;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IWlELYAiXQ3U7oDeD4QaXNJ3t+jMzhfgNyOJvwZwup4=;
    b=m4mF3aJevvL7GZpZUoXOa9xq1UtSKxRTabznJxhqlQnTbcn8UKWln4Em0VTNrs40Vs
    NO0+qI7G1StoxZa/UXDg==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO96cCwacwToyD+C58ign1Q=="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <d99853d8-fae4-4710-87cb-d74fd1377a03@onlineschubla.de>
Date: Fri, 1 Mar 2024 20:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@cloud.com,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
 <ZarcWQ6Ugwowy050@mattapan.m5p.com>
 <CA+zSX=Y=BsVEp3o6jRprn5sntWVA0Z6wNXUxtffDN+=fPv_Fzg@mail.gmail.com>
 <4d7dbce9-ef20-4702-8056-9d5ab8152721@onlineschubla.de>
 <a5ad8772-01eb-4a84-93e2-c96c3b72fa48@xen.org>
From: Paul Leiber <paul@onlineschubla.de>
In-Reply-To: <a5ad8772-01eb-4a84-93e2-c96c3b72fa48@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 18.02.2024 um 18:49 schrieb Julien Grall:
> Hi,
> 
> On 17/02/2024 21:46, Paul Leiber wrote:
>> Am 22.01.2024 um 11:46 schrieb George Dunlap:
>>> On Fri, Jan 19, 2024 at 8:32 PM Elliott Mitchell <ehem+xen@m5p.com> 
>>> wrote:
>>>>
>>>> On Sun, Jan 14, 2024 at 10:54:24PM +0100, Paul Leiber wrote:
>>>>>
>>>>> Am 22.10.2023 um 07:42 schrieb Paul Leiber:
>>>>>> Am 13.10.2023 um 20:56 schrieb Paul Leiber:
>>>>>>> Hi Xen developers list,
>>>>>>>
>>>>>>> TL;DR:
>>>>>>> ------
>>>>>>>
>>>>>>> Causing certain web server traffic on a secondary VLAN on 
>>>>>>> Raspberry Pi
>>>>>>> under vanilla Debian/UEFI in combination with Xen leads to complete
>>>>>>> system reboot (watchdog triggering for Dom0). Other strange 
>>>>>>> things are
>>>>>>> happening.
>>>>>>>
>>>>>>> Description:
>>>>>>> ----------
>>>>>>>
>>>>>>> I recently set up Xen (self compiled, Version 4.18-rc) on a 
>>>>>>> Raspberry
>>>>>>> Pi 4B (on vanilla Debian Bookworm, UEFI boot mode). Until some time
>>>>>>> ago, everything worked well with Dom0, one DomU and one bridge.
>>>>>>>
>>>>>>> Then I wanted to actually make use of the virtualization and started
>>>>>>> to set up a second Debian Bookworm DomU (using xen-create-image) for
>>>>>>> monitoring my systems with zabbix (a webserver based system 
>>>>>>> monitoring
>>>>>>> solution). The bridge used for this setup was the device bridging 
>>>>>>> the
>>>>>>> hardware NIC. I installed zabbix, set it up, and everything went 
>>>>>>> well,
>>>>>>> I could access the web interface without any problem.
>>>>>>>
>>>>>>> Then I set up VLANs (initally using VLAN numbers 1 and 2) to 
>>>>>>> separate
>>>>>>> network traffic between the DomUs. I made the existing device bridge
>>>>>>> VLAN 1 (bridge 1) and created a secondary device for bridging VLAN 2
>>>>>>> (bridge 2). Using only bridge 1 / VLAN 1 everything works well, I 
>>>>>>> can
>>>>>>> access the zabbix web interface without any noticeable issue. After
>>>>>>> switching the zabbix DomU to VLAN 2 / bridge 2, everything seemingly
>>>>>>> keeps on working well, I can ping different devices in my network 
>>>>>>> from
>>>>>>> the zabbix DomU and vice versa, I can ssh into the machine.
>>>>>>>
>>>>>>> However, as soon as I remotely access the zabbix web interface, the
>>>>>>> complete system (DomUs and Dom0) becomes unresponsive and reboots
>>>>>>> after some time (usually seconds, sometimes 1-2 minutes). The reboot
>>>>>>> is reliably reproducable.
>>>>>>>
>>>>>>> I didn't see any error message in any log (zabbix, DomU syslog, Dom0
>>>>>>> syslog) except for the following lines immediately before the system
>>>>>>> reboots on the Xen serial console:
>>>>>>>
>>>>>>> (XEN) Watchdog timer fired for domain 0
>>>>>>> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
>>>>>>>
>>>>>>> As soon as I change the bridge to bridge 1 (with or without VLAN
>>>>>>> setup), the web interface is accessible again after booting the 
>>>>>>> zabbix
>>>>>>> DomU, no reboots.
>>>>>>>
>>>>>>> So I assume that causing specific traffic on the virtual NIC when
>>>>>>> using a VLAN setup with more than one VLAN under Xen makes the Dom0
>>>>>>> system hard crash. Of course, there might be other causes that 
>>>>>>> I'm not
>>>>>>> aware of, but to me, this seems to be the most likely explanation
>>>>>>> right now.
>>>>>>>
>>>>>>> What I tried:
>>>>>>> -------------
>>>>>>>
>>>>>>> 1. I changed the VLAN numbers. First to 101, 102, 103 etc. This was
>>>>>>> when I noticed another strange thing: VLANs with numbers >99 simply
>>>>>>> don't work on my Raspberry Pi under Debian, with or without Xen. 
>>>>>>> VLAN
>>>>>>> 99 works, VLAN 100 (or everything else >99 that I tried) doesn't 
>>>>>>> work.
>>>>>>> If I choose a number >99, the VLAN is not configured, "ip a" doesn't
>>>>>>> list it. Other Debian systems on x64 architecture don't show this
>>>>>>> behavior, there, it was no problem to set up VLANs > 99. Therefore,
>>>>>>> I've changed the VLANs to 10, 20, 30 etc., which worked. But it 
>>>>>>> didn't
>>>>>>> solve the initial problem of the crashing Dom0 and DomUs.
>>>>>>>
>>>>>>> 2. Different bridge options, without noticable effect:
>>>>>>> bridge_stp off      # dont use STP (spanning tree proto)
>>>>>>> bridge_waitport 0   # dont wait for port to be available
>>>>>>> bridge_fd 0         # no forward delay
>>>>>>>
>>>>>>> 3. Removing IPv6: No noticable effect.
>>>>>>>
>>>>>>> 4. Network traffic analysis: Now, here it becomes _really_ 
>>>>>>> strange. I
>>>>>>> started tcpdumps on Dom0, and depending on on which interface/bridge
>>>>>>> traffic was logged, the problem went away, meaning, the DomU was
>>>>>>> running smoothly for hours, even when accessing the zabbix web
>>>>>>> interface. Stopping the log makes the system crash (as above, after
>>>>>>> seconds up to 1-2 minutes) reproducably if I access the zabbix web
>>>>>>> interface.
>>>>>>>
>>>>>>> Logging enabcm6e4ei0 (NIC): no crashes
>>>>>>> Logging enabcm6e4ei0.10 (VLAN 10): instant crash
>>>>>>> Logging enabcm6e4ei0.20 (VLAN 20): no crashes
>>>>>>> Logging xenbr0 (on VLAN 10): instant crash
>>>>>>> Logging xenbr1 (on VLAN 20): no crashes
>>>>>>>
>>>>>>> I am clinging to the thought that there must be a rational 
>>>>>>> explanation
>>>>>>> for why logging the traffic on certain interfaces/bridges should 
>>>>>>> avoid
>>>>>>> the crash of the complete system, while logging other
>>>>>>> interfaces/bridges doesn't. I myself can't think of one.
>>>>>>>
>>>>>>> I checked the dumps of enabcm6e4ei0.10 and xenbr0 (where the system
>>>>>>> crashes) with wireshark, nothing sticks out to me (but I am 
>>>>>>> really no
>>>>>>> expert in analyzing network traffic). Dumps can be provided.
>>>>>>>
>>>>>>> 5. Watchdog: I tried to dig deeper into the cause for the watchdog
>>>>>>> triggering. However, I didn't find any useful documentation on 
>>>>>>> the web
>>>>>>> on how the watchdog works or how to enable logging.
>>>>>>>
>>>>>>> 6. Eliminating Xen as cause: I booted the Debian system (which in 
>>>>>>> Xen
>>>>>>> setup would be Dom0) without Xen and set it up to use the VLAN 20
>>>>>>> bridge (the same that leads to a reboot when using it in the 
>>>>>>> DomU) as
>>>>>>> primary network interface. Everything seemed to be working, I could
>>>>>>> download large files from the internet without any problem. 
>>>>>>> Setting up
>>>>>>> Zabbix on the base Debian system showed that the same setup 
>>>>>>> (VLANs 10
>>>>>>> and 20, bridges 1 and 2, using bridge 2 as interface for Zabbix)
>>>>>>> without Xen is working reliably, no reboots. This points to some Xen
>>>>>>> related component being the root cause, I think.
>>>>>>>
>>>>>>> 7. Eliminating Apache as root cause: Reloading the Apache starting
>>>>>>> page hosted on DomU several times per second didn't lead to a 
>>>>>>> reboot.
>>>>>>>
>>>>>>> 8. Recompiling Xen: Independent of which Xen master branch version I
>>>>>>> was using (all 4.18), the behavior was the same. I didn't get Xen
>>>>>>> working on ARM64/UEFI in version 4.17.
>>>>>>>
>>>>>>> Current situation:(XEN) d3v0 Unhandled SMC/HVC: 0x84000050
>>>>> (XEN) d3v0 Unhandled SMC/HVC: 0x8600ff01
>>>>> (XEN) d3v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 
>>>>> 1 to
>>>>> 2 frames
>>>>> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 
>>>>> 2 to
>>>>> 3 frames
>>>>> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 
>>>>> 3 to
>>>>> 4 frames
>>>>>>> ------------------
>>>>>>>
>>>>>>> I am out of ideas what to do next. Everything that was 
>>>>>>> recommended to
>>>>>>> me on xen-users didn't lead to significant insight or solve the 
>>>>>>> problem.
>>>>>>>
>>>>>>> I'd appreciate any hints how to troubleshoot this and/or how to
>>>>>>> proceed otherwise.
>>>>>>
>>>>>> O.k., let's try to break that issue down.
>>>>>>
>>>>>> Firstly, how can I get more information on why the Xen watchdog
>>>>>> triggers? Is there documentation? Are there any logs? I couldn't find
>>>>>> anything useful with my search skills.
>>>>>>
>>>>>
>>>>> After some delay, I have picked up the Raspberry Pi again, built Xen
>>>>> 4.19-unstable, with the same result: Reboot of the complete system 
>>>>> after
>>>>> the Dom0 watchdog triggering when accessing the Zabbix content on a
>>>>> webserver on DomU.
>>>>>
>>>>> I still would like to find out what's going wrong here, but I have no
>>>>> idea what to do. I'd appreciate any hint.
>>>>>
>>>>> Not knowing if it helps, I added Xen logs from boot until Dom0
>>>>> crash/reboot below.
>>>>>
>>>>> Loading Xen xen ...
>>>>> Loading Linux 6.1.0-17-arm64 ...
>>>>> Loading initial ramdisk ...
>>>>> Using modules provided by bootloader in FDT
>>>>> Xen 4.19-unstable (c/s Fri Jan 12 11:54:31 2024 +0000
>>>>> git:1ec3fe1f66-dirty) EFI
>>>>> loader
>>>>>    Xen 4.19-unstable
>>>>> (XEN) Xen version 4.19-unstable (root@lan.onlineschubla.de) (gcc 
>>>>> (Debian
>>>>> 12.2.0-
>>>>>
>>>>>
>>>>>                              14) 12.2.0) debug=y Sun Jan 14 
>>>>> 21:46:34 CET 2024
>>>>> (XEN) Latest ChangeSet: Fri Jan 12 11:54:31 2024 +0000 
>>>>> git:1ec3fe1f66-dirty
>>>>> (XEN) build-id: babb03cb6107fc46f7d8969142ccd6772a1133c3
>>>>> (XEN) Console output is synchronous.
>>>>> (XEN) Processor: 00000000410fd083: "ARM Limited", variant: 0x0, part
>>>>> 0xd08,rev 0
>>>>>
>>>>>
>>>>>                                  x3
>>>>> (XEN) 64-bit Execution:
>>>>> (XEN)   Processor Features: 0000000000002222 0000000000000000
>>>>> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
>>>>> (XEN)     Extensions: FloatingPoint AdvancedSIMD
>>>>> (XEN)   Debug Features: 0000000010305106 0000000000000000
>>>>> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
>>>>> (XEN)   Memory Model Features: 0000000000001124 0000000000000000
>>>>> (XEN)   ISA Features:  0000000000010000 0000000000000000
>>>>> (XEN) 32-bit Execution:
>>>>> (XEN)   Processor Features: 0000000000000131:0000000000011011
>>>>> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
>>>>> (XEN)     Extensions: GenericTimer Security
>>>>> (XEN)   Debug Features: 0000000003010066
>>>>> (XEN)   Auxiliary Features: 0000000000000000
>>>>> (XEN)   Memory Model Features: 0000000010201105 0000000040000000
>>>>> (XEN)                          0000000001260000 0000000002102211
>>>>> (XEN)   ISA Features: 0000000002101110 0000000013112111 
>>>>> 0000000021232042
>>>>> (XEN)                 0000000001112131 0000000000011142 
>>>>> 0000000000010001
>>>>> (XEN) Using SMC Calling Convention v1.2
>>>>> (XEN) Using PSCI v1.1
>>>>> (XEN) ACPI: GICC (acpi_id[0x0000] address[0xff842000] MPIDR[0x0] 
>>>>> enabled)
>>>>> (XEN) ACPI: GICC (acpi_id[0x0001] address[0xff842000] MPIDR[0x1] 
>>>>> enabled)
>>>>> (XEN) ACPI: GICC (acpi_id[0x0002] address[0xff842000] MPIDR[0x2] 
>>>>> enabled)
>>>>> (XEN) ACPI: GICC (acpi_id[0x0003] address[0xff842000] MPIDR[0x3] 
>>>>> enabled)
>>>>> (XEN) 4 CPUs enabled, 4 CPUs total
>>>>> (XEN) SMP: Allowing 4 CPUs
>>>>> (XEN) enabled workaround for: ARM erratum 1319537
>>>>> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 54000 KHz
>>>>> (XEN) GICv2 initialization:
>>>>> (XEN)         gic_dist_addr=00000000ff841000
>>>>> (XEN)         gic_cpu_addr=00000000ff842000
>>>>> (XEN)         gic_hyp_addr=00000000ff844000
>>>>> (XEN)         gic_vcpu_addr=00000000ff846000
>>>>> (XEN)         gic_maintenance_irq=25
>>>>> (XEN) GICv2: 256 lines, 4 cpus, secure (IID 0200143b).
>>>>> (XEN) XSM Framework v1.0.1 initialized
>>>>> (XEN) Initialising XSM SILO mode
>>>>> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
>>>>> (XEN) Initializing Credit2 scheduler
>>>>> (XEN)  load_precision_shift: 18
>>>>> (XEN)  load_window_shift: 30
>>>>> (XEN)  underload_balance_tolerance: 0
>>>>> (XEN)  overload_balance_tolerance: -3
>>>>> (XEN)  runqueues arrangement: socket
>>>>> (XEN)  cap enforcement granularity: 10ms
>>>>> (XEN) load tracking window length 1073741824 ns
>>>>> (XEN) Allocated console ring of 32 KiB.
>>>>> (XEN) CPU0: Guest atomics will try 16 times before pausing the domain
>>>>> (XEN) Bringing up CPU1
>>>>> (XEN) CPU1: Guest atomics will try 16 times before pausing the domain
>>>>> (XEN) CPU 1 booted.
>>>>> (XEN) Bringing up CPU2
>>>>> (XEN) CPU2: Guest atomics will try 13 times before pausing the domain
>>>>> (XEN) CPU 2 booted.
>>>>> (XEN) Bringing up CPU3
>>>>> (XEN) CPU3: Guest atomics will try 16 times before pausing the domain
>>>>> (XEN) Brought up 4 CPUs
>>>>> (XEN) CPU 3 booted.
>>>>> (XEN) I/O virtualisation disabled
>>>>> (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
>>>>> (XEN) P2M: 4 levels with order-0 root, VTCR 0x0000000080043594
>>>>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>>>> (XEN) Initializing Credit2 scheduler
>>>>> (XEN)  load_precision_shift: 18
>>>>> (XEN)  load_window_shift: 30
>>>>> (XEN)  underload_balance_tolerance: 0
>>>>> (XEN)  overload_balance_tolerance: -3
>>>>> (XEN)  runqueues arrangement: socket
>>>>> (XEN)  cap enforcement granularity: 10ms
>>>>> (XEN) load tracking window length 1073741824 ns
>>>>> (XEN) Adding cpu 0 to runqueue 0
>>>>> (XEN)  First cpu on runqueue, activating
>>>>> (XEN) Adding cpu 1 to runqueue 0
>>>>> (XEN) Adding cpu 2 to runqueue 0
>>>>> (XEN) Adding cpu 3 to runqueue 0
>>>>> (XEN) alternatives: Patching with alt table 00000a00002ee0b0 ->
>>>>> 00000a00002ef250
>>>>> (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>> (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>> (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>> (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
>>>>> (XEN) *** LOADING DOMAIN 0 ***
>>>>> (XEN) Loading d0 kernel from boot module @ 0000000030ef7000
>>>>> (XEN) Loading ramdisk from boot module @ 000000002ee6d000
>>>>> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
>>>>> (XEN) BANK[0] 0x00000040000000-0x00000080000000 (1024MB)
>>>>> (XEN) Grant table range: 0x0000002eceb000-0x0000002ed2b000
>>>>> (XEN) Allocating PPI 16 for event channel interrupt
>>>>> (XEN) Loading zImage from 0000000030ef7000 to
>>>>> 0000000040000000-0000000041f1c7c0
>>>>> (XEN) Loading d0 initrd from 000000002ee6d000 to
>>>>> 0x0000000048200000-0x000000004a
>>>>>
>>>>>
>>>>>                                                      288c22
>>>>> (XEN) Loading d0 DTB to 0x0000000048000000-0x00000000480002c3
>>>>> (XEN) Initial low memory virq threshold set at 0x4000 pages.
>>>>> (XEN) Scrubbing Free RAM in background
>>>>> (XEN) Std. Loglevel: All
>>>>> (XEN) Guest Loglevel: All
>>>>> (XEN) ***************************************************
>>>>> (XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
>>>>> (XEN) This option is intended to aid debugging of Xen by ensuring
>>>>> (XEN) that all output is synchronously delivered on the serial line.
>>>>> (XEN) However it can introduce SIGNIFICANT latencies and affect
>>>>> (XEN) timekeeping. It is NOT recommended for production use!
>>>>> (XEN) ***************************************************
>>>>> (XEN) 3... 2... 1...
>>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch 
>>>>> input)
>>>>> (XEN) Freed 376kB init memory.
>>>>> (XEN) d0v0 Unhandled SMC/HVC: 0x84000050
>>>>> (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to 
>>>>> ICACTIVER12
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to 
>>>>> ICACTIVER16
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to 
>>>>> ICACTIVER20
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to 
>>>>> ICACTIVER24
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to 
>>>>> ICACTIVER28
>>>>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) d1v0 Unhandled SMC/HVC: 0x84000050
>>>>> (XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
>>>>> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) common/grant_table.c:1909:d1v0 Expanding d1 grant table from 
>>>>> 1 to
>>>>> 2 frames
>>>>> (XEN) gnttab_mark_dirty not implemented yet
>>>>> (XEN) d2v0 Unhandled SMC/HVC: 0x84000050
>>>>> (XEN) d2v0 Unhandled SMC/HVC: 0x8600ff01
>>>>> (XEN) d2v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 
>>>>> 1 to
>>>>> 2 frames
>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 
>>>>> 2 to
>>>>> 3 frames
>>>>> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 
>>>>> 3 to
>>>>> 4 frames
>>>>> (XEN) Watchdog timer fired for domain 0
>>>>> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
>>>>
>>>> I'm unsure whose attention to draw to this report.
>>>>
>>>> This might be a scheduler issue since the watchdog timer is triggering.
>>>>
>>>> This might be an ACPI issue as ACPI is in use here.
>>>>
>>>> This might be an ARM Linux kernel issue.
>>>>
>>>> In the end this is someone running into trouble with Xen on an ARM
>>>> device.  Yet despite bringing up the issue hasn't gotten any help...
>>>
>>> Hey Elliot,
>>>
>>> Thanks for raising the visibility of this.  I'm not familiar with ARM,
>>> but if I were investigating this I'd try to figure out what the
>>> "unhandled" error messages are.  "gnttab_mark_dirty not implemented
>>> yet" looks pretty sus too, and also sounds like it might be something
>>> ARM-specific.
>>>
>>> I don't see anything suspicious WRT the scheduler, but a simple way to
>>> test that would be to set the scheduler to credit1 and see if that
>>> changes things.
>>
>> Just to rule out all possibilities, I did a test with credit(1) 
>> scheduler, which didn't change anything noticable. The watchdog 
>> triggered after traffic has been created on the VLAN.
> 
> Thanks for trying. Looking at the watchdog code, sadly, it doesn't seem 
> to do much logging or even dump some information (e.g. stack trace) when 
> it get triggers.
> 
> To answer your previous question about the watchdog, it is a daemon that 
> is running in the domain (in your case dom0). The only thing it will do 
> is every N secs (default 15 seconds), it will tell Xen that it is still 
> alive. If the domain has answered after M (default 30 seconds), then the 
> domain will be considered as unresponsive and Xen will shutdown it down.
> 
> If this is dom0, then the whole system will shutdown. As the others 
> hinted, this is likely a sign that your domain deadlock or is overloaded.
> 
> Have you tried to disable the watchdog and check the liveness of dom0? I 
> don't expect to solve your issue, but it could help to get some further 
> information out of the system before rebooting. The service is called 
> xen-watchdog.
> 
> If dom0 is partially stuck, then I would expect the kernel to start 
> printing some RCU stall after a few seconds.
> 
> If you have access to the console you can press CTRL + A three times. 
> This will switch to Xen console where you can ask to print more 
> information. 'h' will give you the list of all the keys supported.
> 
> I think, the keys '0' and 'q' would print useful information in your case.
> 
> Cheers,
> 


Stopping xen-watchdog prevents the reboot. However, when triggering 
traffic on the VLAN, Dom0 and DomU become completely unresponsive. No 
error or kernel message is printed in the serial console.

Switching to Xen console works. Pressing '0' produces the following output:

(XEN) '0' pressed -> dumping Dom0's registers
(XEN) *** Dumping Dom0 vcpu#0 state: ***
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     ffff800008027e50
(XEN) LR:     ffff800008027e44
(XEN) SP_EL0: ffff800009c78f80
(XEN) SP_EL1: ffff800008003b60
(XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
(XEN)      X0: 0000000000000001  X1: 0000000000000003  X2: 0000000000000000
(XEN)      X3: ffff800009c6eb08  X4: ffff800009c6ea88  X5: 0000000000000000
(XEN)      X6: 000000000001964d  X7: 0000000070000000  X8: 00000000000178a7
(XEN)      X9: ffff800008027e44 X10: 00000000000005ee X11: 0000000000000001
(XEN)     X12: ffff800009c6ebb0 X13: 0000000000000000 X14: 0000000000000000
(XEN)     X15: 0000000000000000 X16: ffff800008000000 X17: ffff800076596000
(XEN)     X18: 0000000000000000 X19: ffff8000097c2008 X20: ffff000042126c80
(XEN)     X21: ffff8000097c2008 X22: 0000000000000000 X23: 0000000000000005
(XEN)     X24: ffff8000097c2008 X25: ffff0000483309f8 X26: ffff800076596000
(XEN)     X27: ffff800009c67000 X28: ffff800009c78f80  FP: ffff800008003b60
(XEN)
(XEN)    ELR_EL1: ffff800008cad668
(XEN)    ESR_EL1: 56000000
(XEN)    FAR_EL1: 0000ffffa8ff7e48
(XEN)
(XEN)  SCTLR_EL1: 0000000034d4d91d
(XEN)    TCR_EL1: 00000074b5503510
(XEN)  TTBR0_EL1: 0000000046cd1000
(XEN)  TTBR1_EL1: 0a34000041612000
(XEN)
(XEN)   VTCR_EL2: 0000000080043594
(XEN)  VTTBR_EL2: 00010001fffac000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 00000000807c663f
(XEN)  TTBR0_EL2: 000000002ee24000
(XEN)
(XEN)    ESR_EL2: 0000000007e00000
(XEN)  HPFAR_EL2: 0000000000ff8410
(XEN)    FAR_EL2: ffff800008005f00
(XEN)
(XEN) Guest stack trace from sp=ffff800008003b60:
(XEN)   Failed to convert stack to physical address
(XEN) *** Dumping Dom0 vcpu#1 state: ***
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     ffff800008c5dc80
(XEN) LR:     ffff800008c5dc88
(XEN) SP_EL0: ffff000042272080
(XEN) SP_EL1: ffff80000800b0e0
(XEN) CPSR:   0000000080000305 MODE:64-bit EL1h (Guest Kernel, handler)
(XEN)      X0: 0000000000001c7a  X1: ffff80000800b0e0  X2: 0000000000000001
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: ffff00007fd78ad0
(XEN)      X6: 0000000000000001  X7: c0000000ffffefff  X8: 0000000000017fe8
(XEN)      X9: ffff800008c5dc4c X10: ffff800009cf0a78 X11: 00000000ffffefff
(XEN)     X12: 0720072007200720 X13: 0720072007200720 X14: 0720072007200720
(XEN)     X15: 0720072007200720 X16: 65206c6174614620 X17: 6e6f697470656378
(XEN)     X18: 0000000000000006 X19: 000000000000d2f0 X20: ffff8000090ebf50
(XEN)     X21: 000000060197033e X22: fffffff9fe6911da X23: 0000000000000023
(XEN)     X24: 0000000000418958 X25: 0000000000000001 X26: 0000000000000000
(XEN)     X27: 0000000000000000 X28: ffff000042272080  FP: ffff80000800b0e0
(XEN)
(XEN)    ELR_EL1: ffff800008c5dc80
(XEN)    ESR_EL1: f2000800
(XEN)    FAR_EL1: 0000aaaaf011c000
(XEN)
(XEN)  SCTLR_EL1: 0000000034d4d91d
(XEN)    TCR_EL1: 00000074b5503510
(XEN)  TTBR0_EL1: 0000000046cd1000
(XEN)  TTBR1_EL1: 0a34000041612000
(XEN)
(XEN)   VTCR_EL2: 0000000080043594
(XEN)  VTTBR_EL2: 00010001fffac000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 00000000807c663f
(XEN)  TTBR0_EL2: 000000002ee24000
(XEN)
(XEN)    ESR_EL2: 0000000007e00001
(XEN)  HPFAR_EL2: 0000000000ff8410
(XEN)    FAR_EL2: ffff800008005f00
(XEN)
(XEN) Guest stack trace from sp=ffff80000800b0e0:
(XEN)   Failed to convert stack to physical address
(XEN) *** Dumping Dom0 vcpu#2 state: ***
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     ffff800008027e50
(XEN) LR:     ffff800008027e44
(XEN) SP_EL0: ffff000042271040
(XEN) SP_EL1: ffff800009fcbf20
(XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
(XEN)      X0: 0000000000000001  X1: 0000000000000002  X2: 0000000000000000
(XEN)      X3: ffff800009c6eb08  X4: ffff800009c6ea88  X5: 0000000000000000
(XEN)      X6: 0000000000009c40  X7: 00003d08ffff63c0  X8: 003d090ce9e9e665
(XEN)      X9: ffff800008027e44 X10: 0000000000000008 X11: 0000000000000000
(XEN)     X12: 003d090ce9e9e665 X13: fffffffff7ed551f X14: 0000000000034bc0
(XEN)     X15: 00003d090ce92d00 X16: ffff800009fc8000 X17: ffff8000765d2000
(XEN)     X18: 0000000000000000 X19: ffff8000097c2008 X20: ffff000042126c80
(XEN)     X21: ffff8000097c2008 X22: 0000000000000002 X23: 0000000040000005
(XEN)     X24: 0000000000000000 X25: 0000000000000000 X26: ffff000042271040
(XEN)     X27: 0000000000000000 X28: ffff000042271040  FP: ffff800009fcbf20
(XEN)
(XEN)    ELR_EL1: ffff800008c9df8c
(XEN)    ESR_EL1: 56000000
(XEN)    FAR_EL1: 0000ffff280c2020
(XEN)
(XEN)  SCTLR_EL1: 0000000034d4d91d
(XEN)    TCR_EL1: 00000074b5503510
(XEN)  TTBR0_EL1: 000000004613e000
(XEN)  TTBR1_EL1: 0d88000041612000
(XEN)
(XEN)   VTCR_EL2: 0000000080043594
(XEN)  VTTBR_EL2: 00010001fffac000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 00000000807c663f
(XEN)  TTBR0_EL2: 000000002ee24000
(XEN)
(XEN)    ESR_EL2: 0000000007e00000
(XEN)  HPFAR_EL2: 0000000000ff8410
(XEN)    FAR_EL2: ffff800008005f00
(XEN)
(XEN) Guest stack trace from sp=ffff800009fcbf20:
(XEN)   Failed to convert stack to physical address
(XEN) *** Dumping Dom0 vcpu#3 state: ***
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) PC:     ffff800008027e50
(XEN) LR:     ffff800008027e44
(XEN) SP_EL0: ffff0000422730c0
(XEN) SP_EL1: ffff800009fd3f20
(XEN) CPSR:   00000000000003c5 MODE:64-bit EL1h (Guest Kernel, handler)
(XEN)      X0: 0000000000000001  X1: 0000000000000001  X2: 0000000000000000
(XEN)      X3: ffff800009c6eb08  X4: ffff800009c6ea88  X5: 0000000000000000
(XEN)      X6: 0000000157ebd3d8  X7: 0000000000000000  X8: ffff000042273cd0
(XEN)      X9: ffff800008027e44 X10: 0000000000000bb0 X11: 0000000000000001
(XEN)     X12: ffff800009c6ebb0 X13: 0000000000000030 X14: ffffffffffffffff
(XEN)     X15: ffff80000b809000 X16: ffff800009fd0000 X17: ffff8000765f0000
(XEN)     X18: ffff8000090e2000 X19: ffff8000097c2008 X20: ffff000042126c80
(XEN)     X21: ffff8000097c2008 X22: 0000000000000003 X23: 0000000040000005
(XEN)     X24: 0000000000000000 X25: 0000000000000000 X26: ffff0000422730c0
(XEN)     X27: 0000000000000000 X28: ffff0000422730c0  FP: ffff800009fd3f20
(XEN)
(XEN)    ELR_EL1: ffff800008c9df8c
(XEN)    ESR_EL1: 56000000
(XEN)    FAR_EL1: 0000aaaaf011c000
(XEN)
(XEN)  SCTLR_EL1: 0000000034d4d91d
(XEN)    TCR_EL1: 00000074b5503510
(XEN)  TTBR0_EL1: 00000000463ad000
(XEN)  TTBR1_EL1: 0d8a000041612000
(XEN)
(XEN)   VTCR_EL2: 0000000080043594
(XEN)  VTTBR_EL2: 00010001fffac000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 00000000807c663f
(XEN)  TTBR0_EL2: 000000002ee24000
(XEN)
(XEN)    ESR_EL2: 0000000007e00000
(XEN)  HPFAR_EL2: 0000000000ff8410
(XEN)    FAR_EL2: ffff800008005f00
(XEN)
(XEN) Guest stack trace from sp=ffff800009fd3f20:
(XEN)   Failed to convert stack to physical address




Pressing 'q' produces the following output:

(XEN) 'q' pressed -> dumping domain info (now = 727929105981)
(XEN) General information for domain 0:
(XEN)     refcnt=3 dying=0 pause_count=0
(XEN)     nr_pages=262144 xenheap_pages=2 dirty_cpus={} max_pages=262144
(XEN)     handle=00000000-0000-0000-0000-000000000000 vm_assist=00000020
(XEN) p2m mappings for domain 0 (vmid 1):
(XEN)   1G mappings: 0 (shattered 1)
(XEN)   2M mappings: 422 (shattered 90)
(XEN)   4K mappings: 45372
(XEN) Rangesets belonging to domain 0:
(XEN)     Interrupts { 32-152, 154-255 }
(XEN)     I/O Memory { 0-fe200, fe203-ff841, ff849-ffffffffffffffff }
(XEN) NODE affinity for domain 0: [0]
(XEN) VCPU information and callbacks for domain 0:
(XEN)   UNIT0 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU0: CPU3 [has=F] poll=0 upcall_pend=01 upcall_mask=01
(XEN)     pause_count=0 pause_flags=1
(XEN) GICH_LRs (vcpu 0) mask=f
(XEN)    VCPU_LR[0]=2a000002
(XEN)    VCPU_LR[1]=1a00001b
(XEN)    VCPU_LR[2]=1a000001
(XEN)    VCPU_LR[3]=1a000010
(XEN) Inflight irq=2 lr=0
(XEN) Inflight irq=27 lr=1
(XEN) Inflight irq=1 lr=2
(XEN) Inflight irq=16 lr=3
(XEN) No periodic timer
(XEN)   UNIT1 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU1: CPU1 [has=T] poll=0 upcall_pend=00 upcall_mask=00
(XEN)     pause_count=0 pause_flags=0
(XEN) GICH_LRs (vcpu 1) mask=0
(XEN)    VCPU_LR[0]=0
(XEN)    VCPU_LR[1]=0
(XEN)    VCPU_LR[2]=0
(XEN)    VCPU_LR[3]=0
(XEN) No periodic timer
(XEN)   UNIT2 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU2: CPU1 [has=F] poll=0 upcall_pend=01 upcall_mask=01
(XEN)     pause_count=0 pause_flags=1
(XEN) GICH_LRs (vcpu 2) mask=f
(XEN)    VCPU_LR[0]=2a000002
(XEN)    VCPU_LR[1]=1a000001
(XEN)    VCPU_LR[2]=1a00001b
(XEN)    VCPU_LR[3]=1a000010
(XEN) Inflight irq=2 lr=0
(XEN) Inflight irq=1 lr=1
(XEN) Inflight irq=27 lr=2
(XEN) Inflight irq=16 lr=3
(XEN) No periodic timer
(XEN)   UNIT3 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU3: CPU3 [has=F] poll=0 upcall_pend=00 upcall_mask=01
(XEN)     pause_count=0 pause_flags=1
(XEN) GICH_LRs (vcpu 3) mask=7
(XEN)    VCPU_LR[0]=2a000002
(XEN)    VCPU_LR[1]=1a00001b
(XEN)    VCPU_LR[2]=1a000001
(XEN)    VCPU_LR[3]=0
(XEN) Inflight irq=2 lr=0
(XEN) Inflight irq=27 lr=1
(XEN) Inflight irq=1 lr=2
(XEN) No periodic timer
(XEN) General information for domain 1:
(XEN)     refcnt=3 dying=0 pause_count=0
(XEN)     nr_pages=262148 xenheap_pages=3 dirty_cpus={} max_pages=262400
(XEN)     handle=f79da05c-9594-4085-9dd3-08a1197ae443 vm_assist=00000020
(XEN) p2m mappings for domain 1 (vmid 2):
(XEN)   1G mappings: 0 (shattered 1)
(XEN)   2M mappings: 511 (shattered 1)
(XEN)   4K mappings: 519
(XEN) Rangesets belonging to domain 1:
(XEN)     Interrupts { }
(XEN)     I/O Memory { }
(XEN) NODE affinity for domain 1: [0]
(XEN) VCPU information and callbacks for domain 1:
(XEN)   UNIT0 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU0: CPU3 [has=T] poll=0 upcall_pend=00 upcall_mask=01
(XEN)     pause_count=0 pause_flags=0
(XEN) GICH_LRs (vcpu 0) mask=0
(XEN)    VCPU_LR[0]=0
(XEN)    VCPU_LR[1]=0
(XEN)    VCPU_LR[2]=0
(XEN)    VCPU_LR[3]=0
(XEN) Inflight irq=27 lr=0
(XEN) No periodic timer
(XEN) General information for domain 2:
(XEN)     refcnt=3 dying=0 pause_count=0
(XEN)     nr_pages=262148 xenheap_pages=5 dirty_cpus={} max_pages=262400
(XEN)     handle=8a518bb5-a0f8-47d7-8220-62cc4035c5ed vm_assist=00000020
(XEN) p2m mappings for domain 2 (vmid 3):
(XEN)   1G mappings: 0 (shattered 1)
(XEN)   2M mappings: 511 (shattered 1)
(XEN)   4K mappings: 521
(XEN) Rangesets belonging to domain 2:
(XEN)     Interrupts { }
(XEN)     I/O Memory { }
(XEN) NODE affinity for domain 2: [0]
(XEN) VCPU information and callbacks for domain 2:
(XEN)   UNIT0 affinities: hard={0-3} soft={0-3}
(XEN)     VCPU0: CPU2 [has=T] poll=0 upcall_pend=00 upcall_mask=01
(XEN)     pause_count=0 pause_flags=0
(XEN) GICH_LRs (vcpu 0) mask=0
(XEN)    VCPU_LR[0]=0
(XEN)    VCPU_LR[1]=0
(XEN)    VCPU_LR[2]=0
(XEN)    VCPU_LR[3]=0
(XEN) Inflight irq=27 lr=0
(XEN) No periodic timer
(XEN) Notifying guest 0:0 (virq 1, port 0)
(XEN) Notifying guest 0:1 (virq 1, port 0)
(XEN) Notifying guest 0:2 (virq 1, port 0)
(XEN) Notifying guest 0:3 (virq 1, port 0)
(XEN) Notifying guest 1:0 (virq 1, port 0)
(XEN) Notifying guest 2:0 (virq 1, port 0)


Anything specific I should pay attention to?

Thanks,

Paul

