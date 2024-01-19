Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC2832FCE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 21:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669132.1041772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQvXe-0004c4-CG; Fri, 19 Jan 2024 20:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669132.1041772; Fri, 19 Jan 2024 20:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQvXe-0004a0-9E; Fri, 19 Jan 2024 20:32:42 +0000
Received: by outflank-mailman (input) for mailman id 669132;
 Fri, 19 Jan 2024 20:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhZC=I5=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rQvXc-0004Zu-FV
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 20:32:40 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1b2c593-b709-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 21:32:37 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 40JKWP8c045722
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 19 Jan 2024 15:32:31 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 40JKWP37045721;
 Fri, 19 Jan 2024 12:32:25 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e1b2c593-b709-11ee-98f2-6d05b1d4d9a1
Date: Fri, 19 Jan 2024 12:32:25 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Paul Leiber <paul@onlineschubla.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Message-ID: <ZarcWQ6Ugwowy050@mattapan.m5p.com>
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
 <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
 <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8f39239-ea95-4fc7-9abe-6ca005eb02d2@onlineschubla.de>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Sun, Jan 14, 2024 at 10:54:24PM +0100, Paul Leiber wrote:
> 
> Am 22.10.2023 um 07:42 schrieb Paul Leiber:
> > Am 13.10.2023 um 20:56 schrieb Paul Leiber:
> >> Hi Xen developers list,
> >>
> >> TL;DR:
> >> ------
> >>
> >> Causing certain web server traffic on a secondary VLAN on Raspberry Pi 
> >> under vanilla Debian/UEFI in combination with Xen leads to complete 
> >> system reboot (watchdog triggering for Dom0). Other strange things are 
> >> happening.
> >>
> >> Description:
> >> ----------
> >>
> >> I recently set up Xen (self compiled, Version 4.18-rc) on a Raspberry 
> >> Pi 4B (on vanilla Debian Bookworm, UEFI boot mode). Until some time 
> >> ago, everything worked well with Dom0, one DomU and one bridge.
> >>
> >> Then I wanted to actually make use of the virtualization and started 
> >> to set up a second Debian Bookworm DomU (using xen-create-image) for 
> >> monitoring my systems with zabbix (a webserver based system monitoring 
> >> solution). The bridge used for this setup was the device bridging the 
> >> hardware NIC. I installed zabbix, set it up, and everything went well, 
> >> I could access the web interface without any problem.
> >>
> >> Then I set up VLANs (initally using VLAN numbers 1 and 2) to separate 
> >> network traffic between the DomUs. I made the existing device bridge 
> >> VLAN 1 (bridge 1) and created a secondary device for bridging VLAN 2 
> >> (bridge 2). Using only bridge 1 / VLAN 1 everything works well, I can 
> >> access the zabbix web interface without any noticeable issue. After 
> >> switching the zabbix DomU to VLAN 2 / bridge 2, everything seemingly 
> >> keeps on working well, I can ping different devices in my network from 
> >> the zabbix DomU and vice versa, I can ssh into the machine.
> >>
> >> However, as soon as I remotely access the zabbix web interface, the 
> >> complete system (DomUs and Dom0) becomes unresponsive and reboots 
> >> after some time (usually seconds, sometimes 1-2 minutes). The reboot 
> >> is reliably reproducable.
> >>
> >> I didn't see any error message in any log (zabbix, DomU syslog, Dom0 
> >> syslog) except for the following lines immediately before the system 
> >> reboots on the Xen serial console:
> >>
> >> (XEN) Watchdog timer fired for domain 0
> >> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
> >>
> >> As soon as I change the bridge to bridge 1 (with or without VLAN 
> >> setup), the web interface is accessible again after booting the zabbix 
> >> DomU, no reboots.
> >>
> >> So I assume that causing specific traffic on the virtual NIC when 
> >> using a VLAN setup with more than one VLAN under Xen makes the Dom0 
> >> system hard crash. Of course, there might be other causes that I'm not 
> >> aware of, but to me, this seems to be the most likely explanation 
> >> right now.
> >>
> >> What I tried:
> >> -------------
> >>
> >> 1. I changed the VLAN numbers. First to 101, 102, 103 etc. This was 
> >> when I noticed another strange thing: VLANs with numbers >99 simply 
> >> don't work on my Raspberry Pi under Debian, with or without Xen. VLAN 
> >> 99 works, VLAN 100 (or everything else >99 that I tried) doesn't work. 
> >> If I choose a number >99, the VLAN is not configured, "ip a" doesn't 
> >> list it. Other Debian systems on x64 architecture don't show this 
> >> behavior, there, it was no problem to set up VLANs > 99. Therefore, 
> >> I've changed the VLANs to 10, 20, 30 etc., which worked. But it didn't 
> >> solve the initial problem of the crashing Dom0 and DomUs.
> >>
> >> 2. Different bridge options, without noticable effect:
> >> bridge_stp off      # dont use STP (spanning tree proto)
> >> bridge_waitport 0   # dont wait for port to be available
> >> bridge_fd 0         # no forward delay
> >>
> >> 3. Removing IPv6: No noticable effect.
> >>
> >> 4. Network traffic analysis: Now, here it becomes _really_ strange. I 
> >> started tcpdumps on Dom0, and depending on on which interface/bridge 
> >> traffic was logged, the problem went away, meaning, the DomU was 
> >> running smoothly for hours, even when accessing the zabbix web 
> >> interface. Stopping the log makes the system crash (as above, after 
> >> seconds up to 1-2 minutes) reproducably if I access the zabbix web 
> >> interface.
> >>
> >> Logging enabcm6e4ei0 (NIC): no crashes
> >> Logging enabcm6e4ei0.10 (VLAN 10): instant crash
> >> Logging enabcm6e4ei0.20 (VLAN 20): no crashes
> >> Logging xenbr0 (on VLAN 10): instant crash
> >> Logging xenbr1 (on VLAN 20): no crashes
> >>
> >> I am clinging to the thought that there must be a rational explanation 
> >> for why logging the traffic on certain interfaces/bridges should avoid 
> >> the crash of the complete system, while logging other 
> >> interfaces/bridges doesn't. I myself can't think of one.
> >>
> >> I checked the dumps of enabcm6e4ei0.10 and xenbr0 (where the system 
> >> crashes) with wireshark, nothing sticks out to me (but I am really no 
> >> expert in analyzing network traffic). Dumps can be provided.
> >>
> >> 5. Watchdog: I tried to dig deeper into the cause for the watchdog 
> >> triggering. However, I didn't find any useful documentation on the web 
> >> on how the watchdog works or how to enable logging.
> >>
> >> 6. Eliminating Xen as cause: I booted the Debian system (which in Xen 
> >> setup would be Dom0) without Xen and set it up to use the VLAN 20 
> >> bridge (the same that leads to a reboot when using it in the DomU) as 
> >> primary network interface. Everything seemed to be working, I could 
> >> download large files from the internet without any problem. Setting up 
> >> Zabbix on the base Debian system showed that the same setup (VLANs 10 
> >> and 20, bridges 1 and 2, using bridge 2 as interface for Zabbix) 
> >> without Xen is working reliably, no reboots. This points to some Xen 
> >> related component being the root cause, I think.
> >>
> >> 7. Eliminating Apache as root cause: Reloading the Apache starting 
> >> page hosted on DomU several times per second didn't lead to a reboot.
> >>
> >> 8. Recompiling Xen: Independent of which Xen master branch version I 
> >> was using (all 4.18), the behavior was the same. I didn't get Xen 
> >> working on ARM64/UEFI in version 4.17.
> >>
> >> Current situation:(XEN) d3v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d3v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d3v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 1 to 
> 2 frames
> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 2 to 
> 3 frames
> (XEN) common/grant_table.c:1909:d3v0 Expanding d3 grant table from 3 to 
> 4 frames
> >> ------------------
> >>
> >> I am out of ideas what to do next. Everything that was recommended to 
> >> me on xen-users didn't lead to significant insight or solve the problem.
> >>
> >> I'd appreciate any hints how to troubleshoot this and/or how to 
> >> proceed otherwise.
> > 
> > O.k., let's try to break that issue down.
> > 
> > Firstly, how can I get more information on why the Xen watchdog 
> > triggers? Is there documentation? Are there any logs? I couldn't find 
> > anything useful with my search skills.
> > 
> 
> After some delay, I have picked up the Raspberry Pi again, built Xen 
> 4.19-unstable, with the same result: Reboot of the complete system after 
> the Dom0 watchdog triggering when accessing the Zabbix content on a 
> webserver on DomU.
> 
> I still would like to find out what's going wrong here, but I have no 
> idea what to do. I'd appreciate any hint.
> 
> Not knowing if it helps, I added Xen logs from boot until Dom0 
> crash/reboot below.
> 
> Loading Xen xen ...
> Loading Linux 6.1.0-17-arm64 ...
> Loading initial ramdisk ...
> Using modules provided by bootloader in FDT
> Xen 4.19-unstable (c/s Fri Jan 12 11:54:31 2024 +0000 
> git:1ec3fe1f66-dirty) EFI
> loader
>   Xen 4.19-unstable
> (XEN) Xen version 4.19-unstable (root@lan.onlineschubla.de) (gcc (Debian 
> 12.2.0- 
>  
>  
>                             14) 12.2.0) debug=y Sun Jan 14 21:46:34 CET 2024
> (XEN) Latest ChangeSet: Fri Jan 12 11:54:31 2024 +0000 git:1ec3fe1f66-dirty
> (XEN) build-id: babb03cb6107fc46f7d8969142ccd6772a1133c3
> (XEN) Console output is synchronous.
> (XEN) Processor: 00000000410fd083: "ARM Limited", variant: 0x0, part 
> 0xd08,rev 0 
>  
>  
>                                 x3
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 0000000000002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001124 0000000000000000
> (XEN)   ISA Features:  0000000000010000 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 0000000000000131:0000000000011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 0000000003010066
> (XEN)   Auxiliary Features: 0000000000000000
> (XEN)   Memory Model Features: 0000000010201105 0000000040000000
> (XEN)                          0000000001260000 0000000002102211
> (XEN)   ISA Features: 0000000002101110 0000000013112111 0000000021232042
> (XEN)                 0000000001112131 0000000000011142 0000000000010001
> (XEN) Using SMC Calling Convention v1.2
> (XEN) Using PSCI v1.1
> (XEN) ACPI: GICC (acpi_id[0x0000] address[0xff842000] MPIDR[0x0] enabled)
> (XEN) ACPI: GICC (acpi_id[0x0001] address[0xff842000] MPIDR[0x1] enabled)
> (XEN) ACPI: GICC (acpi_id[0x0002] address[0xff842000] MPIDR[0x2] enabled)
> (XEN) ACPI: GICC (acpi_id[0x0003] address[0xff842000] MPIDR[0x3] enabled)
> (XEN) 4 CPUs enabled, 4 CPUs total
> (XEN) SMP: Allowing 4 CPUs
> (XEN) enabled workaround for: ARM erratum 1319537
> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 54000 KHz
> (XEN) GICv2 initialization:
> (XEN)         gic_dist_addr=00000000ff841000
> (XEN)         gic_cpu_addr=00000000ff842000
> (XEN)         gic_hyp_addr=00000000ff844000
> (XEN)         gic_vcpu_addr=00000000ff846000
> (XEN)         gic_maintenance_irq=25
> (XEN) GICv2: 256 lines, 4 cpus, secure (IID 0200143b).
> (XEN) XSM Framework v1.0.1 initialized
> (XEN) Initialising XSM SILO mode
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN)  load_precision_shift: 18
> (XEN)  load_window_shift: 30
> (XEN)  underload_balance_tolerance: 0
> (XEN)  overload_balance_tolerance: -3
> (XEN)  runqueues arrangement: socket
> (XEN)  cap enforcement granularity: 10ms
> (XEN) load tracking window length 1073741824 ns
> (XEN) Allocated console ring of 32 KiB.
> (XEN) CPU0: Guest atomics will try 16 times before pausing the domain
> (XEN) Bringing up CPU1
> (XEN) CPU1: Guest atomics will try 16 times before pausing the domain
> (XEN) CPU 1 booted.
> (XEN) Bringing up CPU2
> (XEN) CPU2: Guest atomics will try 13 times before pausing the domain
> (XEN) CPU 2 booted.
> (XEN) Bringing up CPU3
> (XEN) CPU3: Guest atomics will try 16 times before pausing the domain
> (XEN) Brought up 4 CPUs
> (XEN) CPU 3 booted.
> (XEN) I/O virtualisation disabled
> (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
> (XEN) P2M: 4 levels with order-0 root, VTCR 0x0000000080043594
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Initializing Credit2 scheduler
> (XEN)  load_precision_shift: 18
> (XEN)  load_window_shift: 30
> (XEN)  underload_balance_tolerance: 0
> (XEN)  overload_balance_tolerance: -3
> (XEN)  runqueues arrangement: socket
> (XEN)  cap enforcement granularity: 10ms
> (XEN) load tracking window length 1073741824 ns
> (XEN) Adding cpu 0 to runqueue 0
> (XEN)  First cpu on runqueue, activating
> (XEN) Adding cpu 1 to runqueue 0
> (XEN) Adding cpu 2 to runqueue 0
> (XEN) Adding cpu 3 to runqueue 0
> (XEN) alternatives: Patching with alt table 00000a00002ee0b0 -> 
> 00000a00002ef250
> (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000030ef7000
> (XEN) Loading ramdisk from boot module @ 000000002ee6d000
> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
> (XEN) BANK[0] 0x00000040000000-0x00000080000000 (1024MB)
> (XEN) Grant table range: 0x0000002eceb000-0x0000002ed2b000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading zImage from 0000000030ef7000 to 
> 0000000040000000-0000000041f1c7c0
> (XEN) Loading d0 initrd from 000000002ee6d000 to 
> 0x0000000048200000-0x000000004a 
>  
>  
>                                                     288c22
> (XEN) Loading d0 DTB to 0x0000000048000000-0x00000000480002c3
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) ***************************************************
> (XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
> (XEN) This option is intended to aid debugging of Xen by ensuring
> (XEN) that all output is synchronously delivered on the serial line.
> (XEN) However it can introduce SIGNIFICANT latencies and affect
> (XEN) timekeeping. It is NOT recommended for production use!
> (XEN) ***************************************************
> (XEN) 3... 2... 1...
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 376kB init memory.
> (XEN) d0v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) d1v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) common/grant_table.c:1909:d1v0 Expanding d1 grant table from 1 to 
> 2 frames
> (XEN) gnttab_mark_dirty not implemented yet
> (XEN) d2v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d2v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d2v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 1 to 
> 2 frames
> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 2 to 
> 3 frames
> (XEN) common/grant_table.c:1909:d2v0 Expanding d2 grant table from 3 to 
> 4 frames
> (XEN) Watchdog timer fired for domain 0
> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine

I'm unsure whose attention to draw to this report.

This might be a scheduler issue since the watchdog timer is triggering.

This might be an ACPI issue as ACPI is in use here.

This might be an ARM Linux kernel issue.

In the end this is someone running into trouble with Xen on an ARM
device.  Yet despite bringing up the issue hasn't gotten any help...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



