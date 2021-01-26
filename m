Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75E30447A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 18:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75343.135635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RkK-0000po-NU; Tue, 26 Jan 2021 17:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75343.135635; Tue, 26 Jan 2021 17:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RkK-0000pS-Jm; Tue, 26 Jan 2021 17:03:16 +0000
Received: by outflank-mailman (input) for mailman id 75343;
 Tue, 26 Jan 2021 17:03:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StHo=G5=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l4RkJ-0000pM-2i
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 17:03:15 +0000
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.12]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1eef2d1d-0d93-4627-a53c-857dedbe3559;
 Tue, 26 Jan 2021 17:03:11 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5cf04198-5ff8-11eb-8cc2-d0431ea8bb03;
 Tue, 26 Jan 2021 17:03:08 +0000 (UTC)
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
X-Inumbo-ID: 1eef2d1d-0d93-4627-a53c-857dedbe3559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=2afwcZ5XmVIvUy8ALGgvd5dqeQKTfIQyi4bSoyV52ys=;
	b=MM0TDTLm05/NLdcQfJ/NHivf5T5pWS+KiBpCkPZqbfxro+BcSlv1yVLr7oe5e0NTKFvrY1ObhcSe4
	 SQEheyM6mXjKYCRqmjGDa848rgsonGkFcJKm3oxKgZ5WCS7Cu9rqt8aJtIwX9Vf6VZI1NRNxpdsYjn
	 CXocTIA9fDIXxYibCpOQQQB+Msui6lCSvLYz6yrt/ZPclLvwRLb3Nxfna8SsHgnS2u2Ri3OoVh1sOs
	 0VdLHNjHBQrhgThSx3WrwVTGA/0NjsjbzV5vY9YeemJqFJz+e/Fs20m83EGI0yt1L47/ckI4sHLT+b
	 k0yxafm0l7zRaoVvYGETgR7ckx53T1w==
X-HalOne-Cookie: 9fd41e6b116560ce8494b4b80c4b0a1ce54337d5
X-HalOne-ID: 5cf04198-5ff8-11eb-8cc2-d0431ea8bb03
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
Date: Tue, 26 Jan 2021 18:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/25/21 5:11 PM, Dario Faggioli wrote:
> On Fri, 2021-01-22 at 14:26 +0000, Julien Grall wrote:
>> Hi Anders,
>>
>> On 22/01/2021 08:06, Anders Törnqvist wrote:
>>> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>>>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>>> - booting with "sched=null vwfi=native" but not doing the IRQ
>>> passthrough that you mentioned above
>>> "xl destroy" gives
>>> (XEN) End of domain_destroy function
>>>
>>> Then a "xl create" says nothing but the domain has not started
>>> correct.
>>> "xl list" look like this for the domain:
>>> mydomu                                   2   512     1 ------
>>> 0.0
>> This is odd. I would have expected ``xl create`` to fail if something
>> went wrong with the domain creation.
>>
> So, Anders, would it be possible to issue a:
>
> # xl debug-keys r
> # xl dmesg
>
> And send it to us ?
>
> Ideally, you'd do it:
>   - with Julien's patch (the one he sent the other day, and that you
>     have already given a try to) applied
>   - while you are in the state above, i.e., after having tried to
>     destroy a domain and failing
>   - and maybe again after having tried to start a new domain
Here are some logs.

The system is booted as before with the patch and the domu config does 
not have the IRQs.


# xl list
Name                                        ID   Mem VCPUs State    Time(s)
Domain-0                                     0  3000     5 r-----     820.1
mydomu                                       1   511     1 r-----     157.0

# xl debug-keys r
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=191793008000
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0
(XEN)     run: [1.0] pcpu=5

# xl dmesg
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000080200000 - 00000000ffffffff
(XEN) RAM: 0000000880000000 - 00000008ffffffff
(XEN)
(XEN) MODULE[0]: 0000000080400000 - 000000008054d848 Xen
(XEN) MODULE[1]: 0000000083000000 - 0000000083018000 Device Tree
(XEN) MODULE[2]: 0000000088000000 - 0000000089701200 Kernel
(XEN)  RESVD[0]: 0000000088000000 - 0000000090000000
(XEN)  RESVD[1]: 0000000083000000 - 0000000083018000
(XEN)  RESVD[2]: 0000000084000000 - 0000000085ffffff
(XEN)  RESVD[3]: 0000000086000000 - 00000000863fffff
(XEN)  RESVD[4]: 0000000090000000 - 00000000903fffff
(XEN)  RESVD[5]: 0000000090400000 - 0000000091ffffff
(XEN)  RESVD[6]: 0000000092000000 - 00000000921fffff
(XEN)  RESVD[7]: 0000000092200000 - 00000000923fffff
(XEN)  RESVD[8]: 0000000092400000 - 00000000943fffff
(XEN)  RESVD[9]: 0000000094400000 - 0000000094bfffff
(XEN)
(XEN) CMDLINE[0000000088000000]:chosen console=hvc0 earlycon=xen 
root=/dev/mmcblk0p3 mem=3000M hostname=myhost 
video=HDMI-A-1:1920x1080@60 imxdrm.legacyfb_depth=32   quiet loglevel=3 
logo.nologo vt.global_cursor_default=0
(XEN)
(XEN) Command line: console=dtuart dtuart=/serial@5a060000 
dom0_mem=3000M dom0_max_vcpus=5 hmp-unsafe=true dom0_vcpus_pin 
sched=null vwfi=native
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) partition id 4
(XEN) Domain name mydomu
(XEN) *****Initialized MU
(XEN) Looking for dtuart at "/serial@5a060000", options ""
  Xen 4.13.1-pre
(XEN) Xen version 4.13.1-pre (anders@builder.local) 
(aarch64-poky-linux-gcc (GCC) 8.3.0) debug=n  Fri Jan 22 17:32:33 UTC 2021
(XEN) Latest ChangeSet: Wed Feb 27 17:56:28 2019 +0800 git:b64b8df-dirty
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000001002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:10011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 8000 KHz
(XEN) GICv3 initialization:
(XEN)       gic_dist_addr=0x00000051a00000
(XEN)       gic_maintenance_irq=25
(XEN)       gic_rdist_stride=0
(XEN)       gic_rdist_regions=1
(XEN)       redistributor regions:
(XEN)         - region 0: 0x00000051b00000 - 0x00000051bc0000
(XEN) GICv3 compatible with GICv2 cbase 0x00000052000000 vbase 
0x00000052020000
(XEN) GICv3: 544 lines, (IID 0001143b).
(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004002d000
(XEN) XSM Framework v1.0.0 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: null Scheduler (null)
(XEN) Initializing null scheduler
(XEN) WARNING: This is experimental software in development.
(XEN) Use at your own risk.
(XEN) Allocated console ring of 16 KiB.
(XEN) Bringing up CPU1
(XEN) GICv3: CPU1: Found redistributor in region 0 @00000000400ad000
(XEN) Bringing up CPU2
(XEN) GICv3: CPU2: Found redistributor in region 0 @00000000400cd000
(XEN) Bringing up CPU3
(XEN) GICv3: CPU3: Found redistributor in region 0 @000000004004d000
(XEN) Bringing up CPU4
(XEN) GICv3: CPU4: Found redistributor in region 0 @000000004006d000
(XEN) Bringing up CPU5
(XEN) GICv3: CPU5: Found redistributor in region 0 @000000004008d000
(XEN) Brought up 6 CPUs
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000088000000
(XEN) Allocating 1:1 mappings totalling 3000MB for dom0:
(XEN) BANK[0] 0x00000098000000-0x00000100000000 (1664MB)
(XEN) BANK[1] 0x00000880000000-0x000008c0000000 (1024MB)
(XEN) BANK[2] 0x000008d0000000-0x000008e0000000 (256MB)
(XEN) BANK[3] 0x000008ec800000-0x000008f0000000 (56MB)
(XEN) Grant table range: 0x00000080400000-0x00000080440000
(XEN) HACK: skip /imx8_gpu_ss setup!
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000088000000 to 
0000000098080000-0000000099781200
(XEN) Loading d0 DTB to 0x00000000a0000000-0x00000000a001772e
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) ***************************************************
(XEN) WARNING: HMP COMPUTING HAS BEEN ENABLED.
(XEN) It has implications on the security and stability of the system,
(XEN) unless the cpu affinity of all domains is specified.
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 336kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40
(XEN) Power on resource 215
(XEN) printk: 11 messages suppressed.
(XEN) d1v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=191793008000
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0
(XEN)     run: [1.0] pcpu=5


# xl destroy mydomu
(XEN) End of domain_destroy function

# xl list
Name                                        ID   Mem VCPUs State    Time(s)
Domain-0                                     0  3000     5 r-----    1057.9

# xl debug-keys r
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=223871439875
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0


# xl create mydomu.cfg
Parsing config from mydomu.cfg
(XEN) Power on resource 215

# xl list
Name                                        ID   Mem VCPUs State    Time(s)
Domain-0                                     0  3000     5 r-----    1152.1
mydomu                                       2   512     1 ------       0.0

# xl debug-keys r
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=241210530250
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN)     Domain: 2
(XEN)       7: [2.0] pcpu=-1
(XEN) Waitqueue: d2v0
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0

# xl dmesg
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000080200000 - 00000000ffffffff
(XEN) RAM: 0000000880000000 - 00000008ffffffff
(XEN)
(XEN) MODULE[0]: 0000000080400000 - 000000008054d848 Xen
(XEN) MODULE[1]: 0000000083000000 - 0000000083018000 Device Tree
(XEN) MODULE[2]: 0000000088000000 - 0000000089701200 Kernel
(XEN)  RESVD[0]: 0000000088000000 - 0000000090000000
(XEN)  RESVD[1]: 0000000083000000 - 0000000083018000
(XEN)  RESVD[2]: 0000000084000000 - 0000000085ffffff
(XEN)  RESVD[3]: 0000000086000000 - 00000000863fffff
(XEN)  RESVD[4]: 0000000090000000 - 00000000903fffff
(XEN)  RESVD[5]: 0000000090400000 - 0000000091ffffff
(XEN)  RESVD[6]: 0000000092000000 - 00000000921fffff
(XEN)  RESVD[7]: 0000000092200000 - 00000000923fffff
(XEN)  RESVD[8]: 0000000092400000 - 00000000943fffff
(XEN)  RESVD[9]: 0000000094400000 - 0000000094bfffff
(XEN)
(XEN) CMDLINE[0000000088000000]:chosen console=hvc0 earlycon=xen 
root=/dev/mmcblk0p3 mem=3000M hostname=myhost 
video=HDMI-A-1:1920x1080@60 imxdrm.legacyfb_depth=32   quiet loglevel=3 
logo.nologo vt.global_cursor_default=0
(XEN)
(XEN) Command line: console=dtuart dtuart=/serial@5a060000 
dom0_mem=3000M dom0_max_vcpus=5 hmp-unsafe=true dom0_vcpus_pin 
sched=null vwfi=native
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) partition id 4
(XEN) Domain name mydomu
(XEN) *****Initialized MU
(XEN) Looking for dtuart at "/serial@5a060000", options ""
  Xen 4.13.1-pre
(XEN) Xen version 4.13.1-pre (anders@builder.local) 
(aarch64-poky-linux-gcc (GCC) 8.3.0) debug=n  Fri Jan 22 17:32:33 UTC 2021
(XEN) Latest ChangeSet: Wed Feb 27 17:56:28 2019 +0800 git:b64b8df-dirty
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000001002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:10011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 8000 KHz
(XEN) GICv3 initialization:
(XEN)       gic_dist_addr=0x00000051a00000
(XEN)       gic_maintenance_irq=25
(XEN)       gic_rdist_stride=0
(XEN)       gic_rdist_regions=1
(XEN)       redistributor regions:
(XEN)         - region 0: 0x00000051b00000 - 0x00000051bc0000
(XEN) GICv3 compatible with GICv2 cbase 0x00000052000000 vbase 
0x00000052020000
(XEN) GICv3: 544 lines, (IID 0001143b).
(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004002d000
(XEN) XSM Framework v1.0.0 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: null Scheduler (null)
(XEN) Initializing null scheduler
(XEN) WARNING: This is experimental software in development.
(XEN) Use at your own risk.
(XEN) Allocated console ring of 16 KiB.
(XEN) Bringing up CPU1
(XEN) GICv3: CPU1: Found redistributor in region 0 @00000000400ad000
(XEN) Bringing up CPU2
(XEN) GICv3: CPU2: Found redistributor in region 0 @00000000400cd000
(XEN) Bringing up CPU3
(XEN) GICv3: CPU3: Found redistributor in region 0 @000000004004d000
(XEN) Bringing up CPU4
(XEN) GICv3: CPU4: Found redistributor in region 0 @000000004006d000
(XEN) Bringing up CPU5
(XEN) GICv3: CPU5: Found redistributor in region 0 @000000004008d000
(XEN) Brought up 6 CPUs
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000088000000
(XEN) Allocating 1:1 mappings totalling 3000MB for dom0:
(XEN) BANK[0] 0x00000098000000-0x00000100000000 (1664MB)
(XEN) BANK[1] 0x00000880000000-0x000008c0000000 (1024MB)
(XEN) BANK[2] 0x000008d0000000-0x000008e0000000 (256MB)
(XEN) BANK[3] 0x000008ec800000-0x000008f0000000 (56MB)
(XEN) Grant table range: 0x00000080400000-0x00000080440000
(XEN) HACK: skip /imx8_gpu_ss setup!
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000088000000 to 
0000000098080000-0000000099781200
(XEN) Loading d0 DTB to 0x00000000a0000000-0x00000000a001772e
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) ***************************************************
(XEN) WARNING: HMP COMPUTING HAS BEEN ENABLED.
(XEN) It has implications on the security and stability of the system,
(XEN) unless the cpu affinity of all domains is specified.
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 336kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40
(XEN) Power on resource 215
(XEN) printk: 11 messages suppressed.
(XEN) d1v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=191793008000
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0
(XEN)     run: [1.0] pcpu=5
(XEN) End of domain_destroy function
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=223871439875
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0
(XEN) Power on resource 215
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=241210530250
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 1
(XEN)       6: [1.0] pcpu=5
(XEN)     Domain: 2
(XEN)       7: [2.0] pcpu=-1
(XEN) Waitqueue: d2v0
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d1v0


I then repeated the "xl create" some times until it caused the 
complete_domain_destroy function to be called.
Then the information looked like this:

# xl debug-keys r
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=850134473000
(XEN) Online Cpus: 0-5
(XEN) Cpupool 0:
(XEN) Cpus: 0-5
(XEN) Scheduler: null Scheduler (null)
(XEN)     cpus_free =
(XEN) Domain info:
(XEN)     Domain: 0
(XEN)       1: [0.0] pcpu=0
(XEN)       2: [0.1] pcpu=1
(XEN)       3: [0.2] pcpu=2
(XEN)       4: [0.3] pcpu=3
(XEN)       5: [0.4] pcpu=4
(XEN)     Domain: 2
(XEN)       6: [2.0] pcpu=5
(XEN)     Domain: 3
(XEN)     Domain: 4
(XEN) Waitqueue:
(XEN) CPUs info:
(XEN) CPU[00] sibling={0}, core={0}, unit=d0v0
(XEN)     run: [0.0] pcpu=0
(XEN) CPU[01] sibling={1}, core={1}, unit=d0v1
(XEN)     run: [0.1] pcpu=1
(XEN) CPU[02] sibling={2}, core={2}, unit=d0v2
(XEN)     run: [0.2] pcpu=2
(XEN) CPU[03] sibling={3}, core={3}, unit=d0v3
(XEN)     run: [0.3] pcpu=3
(XEN) CPU[04] sibling={4}, core={4}, unit=d0v4
(XEN)     run: [0.4] pcpu=4
(XEN) CPU[05] sibling={5}, core={5}, unit=d2v0
(XEN)     run: [2.0] pcpu=5

# xl list
Name                                        ID   Mem VCPUs State    Time(s)
Domain-0                                     0  3000     5 r-----    4277.7
mydomu                                       2   511     1 r-----      15.6


>
>> One possibility is the NULL scheduler doesn't release the pCPUs until
>> the domain is fully destroyed. So if there is no pCPU free, it
>> wouldn't
>> be able to schedule the new domain.
>>
>> However, I would have expected the NULL scheduler to refuse the
>> domain
>> to create if there is no pCPU available.
>>
> Yeah but, unfortunately, the scheduler does not have it easy to fail
> domain creation at this stage (i.e., when we realize there are no
> available pCPUs). That's the reason why the NULL scheduler has a
> waitqueue, where vCPUs that cannot be put on any pCPU are put.
>
> Of course, this is a configuration error (or a bug, like maybe in this
> case :-/), and we print warnings when it happens.
>
>> @Dario, @Stefano, do you know when the NULL scheduler decides to
>> allocate the pCPU?
>>
> On which pCPU to allocate a vCPU is decided in null_unit_insert(),
> called from sched_alloc_unit() and sched_init_vcpu().
>
> On the other hand, a vCPU is properly removed from its pCPU, hence
> making the pCPU free for being assigned to some other vCPU, in
> unit_deassign(), called from null_unit_remove(), which in turn is
> called from sched_destroy_vcpu() Which is indeed called from
> complete_domain_destroy().
>
> Regards



