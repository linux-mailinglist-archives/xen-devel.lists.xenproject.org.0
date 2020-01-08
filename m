Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA2133B70
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 06:53:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip4EY-00084b-VI; Wed, 08 Jan 2020 05:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/nrn=25=intel.com=tao3.xu@srs-us1.protection.inumbo.net>)
 id 1ip4EX-00084W-9S
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 05:50:21 +0000
X-Inumbo-ID: c03c9160-31da-11ea-bf56-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c03c9160-31da-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 05:50:19 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 21:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,408,1571727600"; 
 d="log'?scan'208";a="215852432"
Received: from shzintpr04.sh.intel.com (HELO [0.0.0.0]) ([10.239.4.101])
 by orsmga008.jf.intel.com with ESMTP; 07 Jan 2020 21:50:16 -0800
To: xen-devel@lists.xenproject.org
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <764d3c88-ce22-c968-9169-896892aa55e5@intel.com>
Date: Wed, 8 Jan 2020 13:50:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------E1D1F89C363881B3D635C50E"
Content-Language: en-US
Subject: [Xen-devel] [BUG] XEN crash and double fault when doing cpu
 online/offline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------E1D1F89C363881B3D635C50E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When I use xen-hptool cpu-offline/cpu-online to let CPU in a socket 
online/offline using the script as follows:

for((j=48;j<=95;j++));
do
   xen-hptool cpu-offline $j
done

for((j=48;j<=95;j++));
do
   xen-hptool cpu-online $j
done

Xen crash when cpu re-online. I use the upstream XEN(0dd92688) and try 
many days, it still crash. But if I only do cpu online/offline for CPU 
48~59, Xen will not crash. The bug can be reproduced when we do cpu 
online/offline for most CPU in a socket. And interesting thing is when 
we use the script as follow:

for((j=48;j<=95;j++));
do
   xen-hptool cpu-offline $j
   xen-hptool cpu-online $j
done

Xen will not crash too. Is there a bug in sched_credit2?

The crash message as follows:

(XEN) Adding cpu 77 to runqueue 1
(XEN) Adding cpu 78 to runqueue 1
(XEN) Adding cpu 79 to runqueue 1
(XEN) Adding cpu 80 to runqueue 1
(X(ENXE) N) *** DOUBLE FAULT ***
(XEN) Assertion 'debug->cpu == smp_processor_id()' failed at spinlock.c:88
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) Debugging connection not set up.
(XEN) CPU:    48
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d080240bfc>] _spin_unlock+0x40/0x42
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff830059027fff   rbx: 0000000000000046   rcx: 0000000000000000
(XEN) rdx: 0000000000000030   rsi: 0000000000000046   rdi: ffff82d080819860
(XEN) rbp: ffff830059027a78   rsp: ffff830059027a78   r8:  0000000000000000
(XEN) r9:  0000000000000004   r10: 0000000000000001   r11: 0000000000000002
(XEN) r12: ffff82d08044d270   r13: 0000000000000010   r14: ffff82d08044d270
(XEN) r15: ffff82d0808197e0   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000059014000   cr2: 00007f9d0fbc1cd9
(XEN) fsb: 00007feb9960a740   gsb: ffff88fcdafc0000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d080240bfc> (_spin_unlock+0x40/0x42):
(XEN)  ff 0f 66 83 07 01 5d c3 <0f> 0b 55 48 89 e5 e8 b5 ff ff ff fb 5d 
c3 55 48
(XEN) Xen stack trace from rsp=ffff830059027a78:
(XEN)    ffff830059027a90 ffff82d080240c17 0000000000000020 ffff830059027ae8
(XEN)    ffff82d080252ea9 0000000d8081a6a0 0000000000000046 ffff82d080819860
(XEN)    0000001000000000 0000000000000006 ffff82d08044d26a ffff82d08093e700
(XEN)    0000000000000086 ffff830059027b98 ffff830059027af8 ffff82d08024fe41
(XEN)    ffff830059027b18 ffff82d08024fe7d 0000000000000000 ffff82d08092f3a0
(XEN)    ffff830059027b80 ffff82d08024fee2 ffff830059027b50 ffff82d0802fa68e
(XEN)    0000000000000001 ffff830059027b60 ffff82d080240b77 ffff82d080819718
(XEN)    ffff82d08045b4d0 ffff82d08092f3a0 ffff830059027bd8 0000000000000086
(XEN)    ffff82d08093e71e ffff830059027bc8 ffff82d0802503ea ffff82d08044d26a
(XEN)    ffff82d08093e703 0000000000000051 ffff83203ffe20b0 ffff8320104e00d8
(XEN)    0000000000000001 ffff8323996aad00 ffff830059027c20 ffff82d080250502
(XEN)    ffff82d000000018 ffff830059027c30 ffff830059027bf0 ffff830059027c38
(XEN)    0000000000000051 0000000000000001 0000000000000001 ffff83239969f580
(XEN)    0000000000000003 ffff830059027c80 ffff82d0802303e8 0000000000000051
(XEN)    0000005159027c78 ffff82d080952b80 00000000000000e0 ffff8323996aad00
(XEN)    ffff83203ffe20b0 ffff83239969f580 ffff82d080930008 ffff82d08094c840
(XEN)    0000000000000051 ffff830059027cc0 ffff82d0802307e1 ffff8323996aad00
(XEN)    0000000000000051 ffff82d080930008 ffff82d080803660 0000000000000051
(XEN)    ffff8323996aad00 ffff830059027d58 ffff82d08023f1fd ffff830059027d10
(XEN)    0000000000000206 ffff82d080819680 ffff83239969f580 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d080240bfc>] R _spin_unlock+0x40/0x42
(XEN)    [<ffff82d080240c17>] F _spin_unlock_irqrestore+0xd/0x24
(XEN)    [<ffff82d080252ea9>] F serial_puts+0x131/0x141
(XEN)    [<ffff82d08024fe41>] F console_serial_puts+0x28/0x2a
(XEN)    [<ffff82d08024fe7d>] F drivers/char/console.c#__putstr+0x3a/0x8b
(XEN)    [<ffff82d08024fee2>] F 
drivers/char/console.c#printk_start_of_line+0x14/0x17b
(XEN)    [<ffff82d0802503ea>] F 
drivers/char/console.c#vprintk_common+0x8d/0x158
(XEN)    [<ffff82d080250502>] F printk+0x4d/0x4f
(XEN)    [<ffff82d0802303e8>] F common/sched_credit2.c#init_pdata+0xdd/0x441
(XEN)    [<ffff82d0802307e1>] F 
common/sched_credit2.c#csched2_switch_sched+0x95/0xe2
(XEN)    [<ffff82d08023f1fd>] F schedule_cpu_add+0x18a/0x3fd
(XEN)    [<ffff82d080201a9f>] F 
common/cpupool.c#cpupool_assign_cpu_locked+0x58/0x189
(XEN)    [<ffff82d080201ee2>] F common/cpupool.c#cpu_callback+0x186/0x3c1
(XEN)    [<ffff82d0802242c0>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080200f95>] F 
common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080201215>] F cpu_up+0xa8/0xe5
(XEN)    [<ffff82d0802a7e28>] F cpu_up_helper+0xf/0xa5
(XEN)    [<ffff82d080205d5d>] F 
common/domain.c#continue_hypercall_tasklet_handler+0x4c/0xb9
(XEN)    [<ffff82d080242ddb>] F common/tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d0802430bc>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0802751e8>] F arch/x86/domain.c#idle_loop+0x40/0x9b
(XEN)
(XEN) RIP:    e008:[<ffff82d0bffcf800>](XEN)
(XEN) ****************************************
  ffff82d0bffcf800(XEN) Panic on CPU 0:

(XEN) RFLAGS: 0000000000010006   (XEN) Assertion 'debug->cpu == 
smp_processor_id()' failed at spinlock.c:88
CONTEXT: hypervisor(XEN) ****************************************
(XEN)

(XEN) rax: 0000000000000018   rbx: 00008c7d886a544d   rcx: ffffffff8100130a
(XEN) Reboot in five seconds...
(XEN) rdx: ffffc90040798e40   rsi: 0000000000000004   rdi: 0000000000000008
(XEN) Debugging connection not set up.
(XEN) rbp: 0000000000000004   rsp: ffffc90040798e28   r8:  00008c7cde95e94d
(XEN) r9:  0000006185e58599   r10: 000000000000010a   r11: 0000000000000206
(XEN) r12: ffff88fcdaf17140   r13: ffff88fcdaf1e438   r14: ffff88fcdaf1e478
(XEN) r15: ffff88fcdaf1e4b8   cr0: 0000000080050033   cr4: 00000000003426e0
(XEN) cr3: 000000238bc52000   cr2: ffffc90040798e18
(XEN) fsb: 0000000000000000   gsb: ffff88fcdaf00000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d0bffcf800> (ffff82d0bffcf800):
(XEN)  00 00 00 00 00 00 00 00 <00> 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00
(XEN) Current stack base ffffc90040798000 differs from expected 
ffff837e77008000
(XEN) Valid stack range: ffffc9004079e000-ffffc900407a0000, 
sp=ffffc90040798e28, tss.rsp0=ffff837e7700ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 48:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<0000000067b4cb2d>] 0000000067b4cb2d
(XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: ffff830059027780   rcx: 0000000067c50000
(XEN) rdx: 0000000000000000   rsi: 00000000003526e0   rdi: ffff830059027760
(XEN) rbp: ffff8300590278a0   rsp: ffff8300590276c0   r8:  ffff830059027780
(XEN) r9:  ffff830059027760   r10: 0000000067b4e1b8   r11: 0101010101010101
(XEN) r12: 00000000fffffffe   r13: 0000000000000000   r14: 0000000000000065
(XEN) r15: 0000000000000003   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 000000203fe4e000   cr2: 0000000067c50010
(XEN) fsb: 00007feb9960a740   gsb: ffff88fcdafc0000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <0000000067b4cb2d> (0000000067b4cb2d):
(XEN)  6b c0 10 48 8b 4c 24 20 <48> 8b 44 01 10 48 89 44 24 28 48 8b 44 
24 28 48
(XEN) Xen stack trace from rsp=ffff8300590276c0:
(XEN)    ffff832010000400 00000000000000f1 ffff8300590276e0 ffff8300590276f8
(XEN)    0000000067c50000 ffff82d0802510dc ffff82d0808197e0 0000000067b4bf3c
(XEN)    ffff830059027780 0000000000000060 ffff82d08093ebe0 ffff82d0808197e0
(XEN)    000000203fe4e000 0000000067b4b590 ffff830059027800 ffff82d080240b77
(XEN)    ffff832010000400 00000000000000f1 ffff830059027760 0000000067aeb54b
(XEN)    ffff8300590277c8 ffff82d0802858ca ffff82d080389845 ffff832010000424
(XEN)    00000000000fa000 67c5000000000200 ffff82d080389845 0000000067aeb8d7
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffff830059027fff
(XEN)    0000000000000000 0000000067aeb6ae ffff82d0803898ba 0000000000000003
(XEN)    00000000003526e0 ffff830059027840 0000000000000000 0000000067aeb476
(XEN)    ffff830000000000 ffff830059027860 0000000059014000 0000000000000000
(XEN)    ffff830059027850 ffff82d080386464 0000000000000000 ffff82d080386768
(XEN)    0000000000000000 00000000fffffffe ffff8300590278a0 ffff82d080386739
(XEN)    0000000059014000 0000000000000283 ffff830059027888 000000000000e010
(XEN)    ffff82d0802a4d55 0000000000000046 ffff82d08046b5d0 ffffffffffffffff
(XEN)    ffff8300590278f0 ffff82d0802a4607 0000138800000000 0000000000000000
(XEN)    0000000000000000 0000000000000046 ffff82d08046b5d0 ffff82d080240bfe
(XEN)    ffff82d08044c815 0000000000000003 ffff830059027958 ffff82d080250ea9
(XEN)    ffff830000000028 ffff830059027968 ffff830059027918 ffff82d080240e1c
(XEN)    ffff82d08045c610 ffff82d080451a57 ffff82d08044c815 0000000000000058
(XEN) Xen call trace:
(XEN)    [<0000000067b4cb2d>] R 0000000067b4cb2d
(XEN)    [<ffff832010000400>] S ffff832010000400
(XEN)    [<ffff82d0802a4607>] F machine_restart+0x168/0x28a
(XEN)    [<ffff82d080250ea9>] F console_suspend+0/0x28
(XEN)    [<ffff82d0802abf51>] F do_invalid_op+0x387/0x3b5
(XEN)    [<ffff82d080389a3d>] F 
x86_64/entry.S#handle_exception_saved+0x68/0x94
(XEN)    [<ffff82d080240bfc>] F _spin_unlock+0x40/0x42
(XEN)    [<ffff82d080240c17>] F _spin_unlock_irqrestore+0xd/0x24
(XEN)    [<ffff82d080252ea9>] F serial_puts+0x131/0x141
(XEN)    [<ffff82d08024fe41>] F console_serial_puts+0x28/0x2a
(XEN)    [<ffff82d08024fe7d>] F drivers/char/console.c#__putstr+0x3a/0x8b
(XEN)    [<ffff82d08024fee2>] F 
drivers/char/console.c#printk_start_of_line+0x14/0x17b
(XEN)    [<ffff82d0802503ea>] F 
drivers/char/console.c#vprintk_common+0x8d/0x158
(XEN)    [<ffff82d080250502>] F printk+0x4d/0x4f
(XEN)    [<ffff82d0802303e8>] F common/sched_credit2.c#init_pdata+0xdd/0x441
(XEN)    [<ffff82d0802307e1>] F 
common/sched_credit2.c#csched2_switch_sched+0x95/0xe2
(XEN)    [<ffff82d08023f1fd>] F schedule_cpu_add+0x18a/0x3fd
(XEN)    [<ffff82d080201a9f>] F 
common/cpupool.c#cpupool_assign_cpu_locked+0x58/0x189
(XEN)    [<ffff82d080201ee2>] F common/cpupool.c#cpu_callback+0x186/0x3c1
(XEN)    [<ffff82d0802242c0>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080200f95>] F 
common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080201215>] F cpu_up+0xa8/0xe5
(XEN)    [<ffff82d0802a7e28>] F cpu_up_helper+0xf/0xa5
(XEN)    [<ffff82d080205d5d>] F 
common/domain.c#continue_hypercall_tasklet_handler+0x4c/0xb9
(XEN)    [<ffff82d080242ddb>] F common/tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d0802430bc>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0802751e8>] F arch/x86/domain.c#idle_loop+0x40/0x9b
(XEN)
(XEN) Pagetable walk from 0000000067c50010:
(XEN)  L4[0x000] = 000000203fe4d063 ffffffffffffffff
(XEN)  L3[0x001] = 000000005900d063 ffffffffffffffff
(XEN)  L2[0x13e] = 0000000000000000 ffffffffffffffff
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 0000000067c50010
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

--------------E1D1F89C363881B3D635C50E
Content-Type: text/x-log; charset=UTF-8;
 name="crash_upstream.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="crash_upstream.log"

(XEN) Removing cpu 48 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU49 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU49 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU49 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU49 bank 11, using 0x1
(XEN) Removing cpu 49 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU50 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU50 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU50 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU50 bank 11, using 0x1
(XEN) Removing cpu 50 from runqueue 1
(XEN) Broke affinity for IRQ120, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU52 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU52 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU52 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU52 bank 11, using 0x1
(XEN) Removing cpu 51 from runqueue 1
(XEN) Removing cpu 52 from runqueue 1
(XEN) Broke affinity for IRQ8, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ104, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ105, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ106, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ107, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ108, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ109, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ110, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ319, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ320, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ321, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ322, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ323, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ324, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ325, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ326, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ327, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU55 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU55 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU55 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU55 bank 11, using 0x1
(XEN) Removing cpu 53 from runqueue 1
(XEN) Removing cpu 54 from runqueue 1
(XEN) Broke affinity for IRQ136, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Removing cpu 55 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU56 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU56 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU56 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU56 bank 11, using 0x1
(XEN) Removing cpu 56 from runqueue 1
(XEN) Broke affinity for IRQ116, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ119, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ121, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ122, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ123, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ124, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ128, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ129, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ130, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ132, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ133, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ134, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ135, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ137, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ139, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ140, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ141, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ142, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ143, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ144, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ145, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ146, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ147, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ148, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ149, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ150, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ151, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ152, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ154, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ156, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ157, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ158, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ159, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ160, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ161, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ162, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ163, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ164, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ165, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ166, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ167, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ168, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ169, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ170, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ171, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ172, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ174, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ175, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ176, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ177, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ179, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ213, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ214, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ215, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ216, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ217, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ218, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ219, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ220, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ221, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ222, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ223, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ224, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ225, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ226, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ227, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ228, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ229, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ230, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ231, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ232, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ233, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ234, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ235, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ236, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ237, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ238, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ239, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ240, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ241, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ242, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ243, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ244, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ245, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ246, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ247, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ248, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ249, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ250, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ251, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ252, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ253, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ254, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ255, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ256, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ257, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ258, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ259, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ260, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ261, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ262, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ263, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ264, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ265, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ266, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ267, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ268, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ269, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ270, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ271, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ272, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ273, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ274, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ275, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ276, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU57 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU57 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU57 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU57 bank 11, using 0x1
(XEN) Removing cpu 57 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU58 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU58 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU58 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU58 bank 11, using 0x1
(XEN) Removing cpu 58 from runqueue 1
(XEN) Broke affinity for IRQ127, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ153, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU59 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU59 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU59 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU59 bank 11, using 0x1
(XEN) Removing cpu 59 from runqueue 1
(XEN) Broke affinity for IRQ278, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU61 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU61 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU61 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU61 bank 11, using 0x1
(XEN) Removing cpu 60 from runqueue 1
(XEN) Broke affinity for IRQ318, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Removing cpu 61 from runqueue 1
(XEN) Broke affinity for IRQ111, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU63 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU63 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU63 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU63 bank 11, using 0x1
(XEN) Removing cpu 62 from runqueue 1
(XEN) Removing cpu 63 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU64 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU64 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU64 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU64 bank 11, using 0x1
(XEN) Removing cpu 64 from runqueue 1
(XEN) Broke affinity for IRQ138, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU65 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU65 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU65 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU65 bank 11, using 0x1
(XEN) Removing cpu 65 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU66 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU66 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU66 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU66 bank 11, using 0x1
(XEN) Removing cpu 66 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU67 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU67 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU67 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU67 bank 11, using 0x1
(XEN) Removing cpu 67 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU69 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU69 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU69 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU69 bank 11, using 0x1
(XEN) Removing cpu 68 from runqueue 1
(XEN) Removing cpu 69 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU75 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU75 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU75 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU75 bank 11, using 0x1
(XEN) Removing cpu 70 from runqueue 1
(XEN) Broke affinity for IRQ114, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Removing cpu 71 from runqueue 1
(XEN) Broke affinity for IRQ153, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Removing cpu 72 from runqueue 1
(XEN) Removing cpu 73 from runqueue 1
(XEN) Removing cpu 74 from runqueue 1
(XEN) Removing cpu 75 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU76 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU76 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU76 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU76 bank 11, using 0x1
(XEN) Removing cpu 76 from runqueue 1
(XEN) Broke affinity for IRQ311, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ312, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ313, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ314, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ315, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ316, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU77 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU77 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU77 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU77 bank 11, using 0x1
(XEN) Removing cpu 77 from runqueue 1
(XEN) Broke affinity for IRQ16, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU78 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU78 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU78 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU78 bank 11, using 0x1
(XEN) Removing cpu 78 from runqueue 1
(XEN) Broke affinity for IRQ118, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU79 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU79 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU79 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU79 bank 11, using 0x1
(XEN) Removing cpu 79 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU80 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU80 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU80 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU80 bank 11, using 0x1
(XEN) Removing cpu 80 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU81 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU81 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU81 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU81 bank 11, using 0x1
(XEN) Removing cpu 81 from runqueue 1
(XEN) Broke affinity for IRQ317, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU82 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU82 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU82 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU82 bank 11, using 0x1
(XEN) Removing cpu 82 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU84 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU84 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU84 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU84 bank 11, using 0x1
(XEN) Removing cpu 83 from runqueue 1
(XEN) Removing cpu 84 from runqueue 1
(XEN) Broke affinity for IRQ113, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ178, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ212, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ277, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU85 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU85 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU85 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU85 bank 11, using 0x1
(XEN) Removing cpu 85 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU86 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU86 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU86 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU86 bank 11, using 0x1
(XEN) Removing cpu 86 from runqueue 1
(XEN) Broke affinity for IRQ112, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ153, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU87 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU87 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU87 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU87 bank 11, using 0x1
(XEN) Removing cpu 87 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU88 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU88 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU88 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU88 bank 11, using 0x1
(XEN) Removing cpu 88 from runqueue 1
(XEN) Broke affinity for IRQ9, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) Broke affinity for IRQ153, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU89 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU89 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU89 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU89 bank 11, using 0x1
(XEN) Removing cpu 89 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU91 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU91 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU91 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU91 bank 11, using 0x1
(XEN) Removing cpu 90 from runqueue 1
(XEN) Removing cpu 91 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU92 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU92 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU92 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU92 bank 11, using 0x1
(XEN) Removing cpu 92 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU93 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU93 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU93 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU93 bank 11, using 0x1
(XEN) Removing cpu 93 from runqueue 1
(XEN) CMCI: threshold 0x2 too large for CPU94 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU94 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU94 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU94 bank 11, using 0x1
(XEN) Removing cpu 94 from runqueue 1
(XEN) Broke affinity for IRQ153, new: ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
(XEN) CMCI: threshold 0x2 too large for CPU95 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU95 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU95 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU95 bank 11, using 0x1
(XEN) Removing cpu 95 from runqueue 1
(XEN)  No cpus left on runqueue, disabling
(XEN) CMCI: threshold 0x2 too large for CPU48 bank 6, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU48 bank 9, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU48 bank 10, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU48 bank 11, using 0x1
(XEN) Adding cpu 48 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 49 to runqueue 1
(XEN) Adding cpu 50 to runqueue 1
(XEN) Adding cpu 51 to runqueue 1
(XEN) Adding cpu 52 to runqueue 1
(XEN) Adding cpu 53 to runqueue 1
(XEN) Adding cpu 54 to runqueue 1
(XEN) Adding cpu 55 to runqueue 1
(XEN) Adding cpu 56 to runqueue 1
(XEN) Adding cpu 57 to runqueue 1
(XEN) Adding cpu 58 to runqueue 1
(XEN) Adding cpu 59 to runqueue 1
(XEN) Adding cpu 60 to runqueue 1
(XEN) Adding cpu 61 to runqueue 1
(XEN) Adding cpu 62 to runqueue 1
(XEN) Adding cpu 63 to runqueue 1
(XEN) Adding cpu 64 to runqueue 1
(XEN) Adding cpu 65 to runqueue 1
(XEN) Adding cpu 66 to runqueue 1
(XEN) Adding cpu 67 to runqueue 1
(XEN) Adding cpu 68 to runqueue 1
(XEN) Adding cpu 69 to runqueue 1
(XEN) Adding cpu 70 to runqueue 1
(XEN) Adding cpu 71 to runqueue 1
(XEN) Adding cpu 72 to runqueue 1
(XEN) Adding cpu 73 to runqueue 1
(XEN) Adding cpu 74 to runqueue 1
(XEN) Adding cpu 75 to runqueue 1
(XEN) Adding cpu 76 to runqueue 1
(XEN) Adding cpu 77 to runqueue 1
(XEN) Adding cpu 78 to runqueue 1
(XEN) Adding cpu 79 to runqueue 1
(XEN) Adding cpu 80 to runqueue 1
(X(ENXE) N) *** DOUBLE FAULT ***
(XEN) Assertion 'debug->cpu == smp_processor_id()' failed at spinlock.c:88
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) Debugging connection not set up.
(XEN) CPU:    48
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d080240bfc>] _spin_unlock+0x40/0x42
(XEN) RFLAGS: 0000000000010006   CONTEXT: hypervisor
(XEN) rax: ffff830059027fff   rbx: 0000000000000046   rcx: 0000000000000000
(XEN) rdx: 0000000000000030   rsi: 0000000000000046   rdi: ffff82d080819860
(XEN) rbp: ffff830059027a78   rsp: ffff830059027a78   r8:  0000000000000000
(XEN) r9:  0000000000000004   r10: 0000000000000001   r11: 0000000000000002
(XEN) r12: ffff82d08044d270   r13: 0000000000000010   r14: ffff82d08044d270
(XEN) r15: ffff82d0808197e0   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000059014000   cr2: 00007f9d0fbc1cd9
(XEN) fsb: 00007feb9960a740   gsb: ffff88fcdafc0000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d080240bfc> (_spin_unlock+0x40/0x42):
(XEN)  ff 0f 66 83 07 01 5d c3 <0f> 0b 55 48 89 e5 e8 b5 ff ff ff fb 5d c3 55 48
(XEN) Xen stack trace from rsp=ffff830059027a78:
(XEN)    ffff830059027a90 ffff82d080240c17 0000000000000020 ffff830059027ae8
(XEN)    ffff82d080252ea9 0000000d8081a6a0 0000000000000046 ffff82d080819860
(XEN)    0000001000000000 0000000000000006 ffff82d08044d26a ffff82d08093e700
(XEN)    0000000000000086 ffff830059027b98 ffff830059027af8 ffff82d08024fe41
(XEN)    ffff830059027b18 ffff82d08024fe7d 0000000000000000 ffff82d08092f3a0
(XEN)    ffff830059027b80 ffff82d08024fee2 ffff830059027b50 ffff82d0802fa68e
(XEN)    0000000000000001 ffff830059027b60 ffff82d080240b77 ffff82d080819718
(XEN)    ffff82d08045b4d0 ffff82d08092f3a0 ffff830059027bd8 0000000000000086
(XEN)    ffff82d08093e71e ffff830059027bc8 ffff82d0802503ea ffff82d08044d26a
(XEN)    ffff82d08093e703 0000000000000051 ffff83203ffe20b0 ffff8320104e00d8
(XEN)    0000000000000001 ffff8323996aad00 ffff830059027c20 ffff82d080250502
(XEN)    ffff82d000000018 ffff830059027c30 ffff830059027bf0 ffff830059027c38
(XEN)    0000000000000051 0000000000000001 0000000000000001 ffff83239969f580
(XEN)    0000000000000003 ffff830059027c80 ffff82d0802303e8 0000000000000051
(XEN)    0000005159027c78 ffff82d080952b80 00000000000000e0 ffff8323996aad00
(XEN)    ffff83203ffe20b0 ffff83239969f580 ffff82d080930008 ffff82d08094c840
(XEN)    0000000000000051 ffff830059027cc0 ffff82d0802307e1 ffff8323996aad00
(XEN)    0000000000000051 ffff82d080930008 ffff82d080803660 0000000000000051
(XEN)    ffff8323996aad00 ffff830059027d58 ffff82d08023f1fd ffff830059027d10
(XEN)    0000000000000206 ffff82d080819680 ffff83239969f580 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d080240bfc>] R _spin_unlock+0x40/0x42
(XEN)    [<ffff82d080240c17>] F _spin_unlock_irqrestore+0xd/0x24
(XEN)    [<ffff82d080252ea9>] F serial_puts+0x131/0x141
(XEN)    [<ffff82d08024fe41>] F console_serial_puts+0x28/0x2a
(XEN)    [<ffff82d08024fe7d>] F drivers/char/console.c#__putstr+0x3a/0x8b
(XEN)    [<ffff82d08024fee2>] F drivers/char/console.c#printk_start_of_line+0x14/0x17b
(XEN)    [<ffff82d0802503ea>] F drivers/char/console.c#vprintk_common+0x8d/0x158
(XEN)    [<ffff82d080250502>] F printk+0x4d/0x4f
(XEN)    [<ffff82d0802303e8>] F common/sched_credit2.c#init_pdata+0xdd/0x441
(XEN)    [<ffff82d0802307e1>] F common/sched_credit2.c#csched2_switch_sched+0x95/0xe2
(XEN)    [<ffff82d08023f1fd>] F schedule_cpu_add+0x18a/0x3fd
(XEN)    [<ffff82d080201a9f>] F common/cpupool.c#cpupool_assign_cpu_locked+0x58/0x189
(XEN)    [<ffff82d080201ee2>] F common/cpupool.c#cpu_callback+0x186/0x3c1
(XEN)    [<ffff82d0802242c0>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080200f95>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080201215>] F cpu_up+0xa8/0xe5
(XEN)    [<ffff82d0802a7e28>] F cpu_up_helper+0xf/0xa5
(XEN)    [<ffff82d080205d5d>] F common/domain.c#continue_hypercall_tasklet_handler+0x4c/0xb9
(XEN)    [<ffff82d080242ddb>] F common/tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d0802430bc>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0802751e8>] F arch/x86/domain.c#idle_loop+0x40/0x9b
(XEN) 
(XEN) RIP:    e008:[<ffff82d0bffcf800>](XEN) 
(XEN) ****************************************
 ffff82d0bffcf800(XEN) Panic on CPU 0:

(XEN) RFLAGS: 0000000000010006   (XEN) Assertion 'debug->cpu == smp_processor_id()' failed at spinlock.c:88
CONTEXT: hypervisor(XEN) ****************************************
(XEN) 

(XEN) rax: 0000000000000018   rbx: 00008c7d886a544d   rcx: ffffffff8100130a
(XEN) Reboot in five seconds...
(XEN) rdx: ffffc90040798e40   rsi: 0000000000000004   rdi: 0000000000000008
(XEN) Debugging connection not set up.
(XEN) rbp: 0000000000000004   rsp: ffffc90040798e28   r8:  00008c7cde95e94d
(XEN) r9:  0000006185e58599   r10: 000000000000010a   r11: 0000000000000206
(XEN) r12: ffff88fcdaf17140   r13: ffff88fcdaf1e438   r14: ffff88fcdaf1e478
(XEN) r15: ffff88fcdaf1e4b8   cr0: 0000000080050033   cr4: 00000000003426e0
(XEN) cr3: 000000238bc52000   cr2: ffffc90040798e18
(XEN) fsb: 0000000000000000   gsb: ffff88fcdaf00000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d0bffcf800> (ffff82d0bffcf800):
(XEN)  00 00 00 00 00 00 00 00 <00> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
(XEN) Current stack base ffffc90040798000 differs from expected ffff837e77008000
(XEN) Valid stack range: ffffc9004079e000-ffffc900407a0000, sp=ffffc90040798e28, tss.rsp0=ffff837e7700ffa0
(XEN) No stack overflow detected. Skipping stack trace.
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 48:
(XEN) DOUBLE FAULT -- system shutdown
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.
(XEN) Debugging connection not set up.
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<0000000067b4cb2d>] 0000000067b4cb2d
(XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: ffff830059027780   rcx: 0000000067c50000
(XEN) rdx: 0000000000000000   rsi: 00000000003526e0   rdi: ffff830059027760
(XEN) rbp: ffff8300590278a0   rsp: ffff8300590276c0   r8:  ffff830059027780
(XEN) r9:  ffff830059027760   r10: 0000000067b4e1b8   r11: 0101010101010101
(XEN) r12: 00000000fffffffe   r13: 0000000000000000   r14: 0000000000000065
(XEN) r15: 0000000000000003   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 000000203fe4e000   cr2: 0000000067c50010
(XEN) fsb: 00007feb9960a740   gsb: ffff88fcdafc0000   gss: 0000000000000000
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <0000000067b4cb2d> (0000000067b4cb2d):
(XEN)  6b c0 10 48 8b 4c 24 20 <48> 8b 44 01 10 48 89 44 24 28 48 8b 44 24 28 48
(XEN) Xen stack trace from rsp=ffff8300590276c0:
(XEN)    ffff832010000400 00000000000000f1 ffff8300590276e0 ffff8300590276f8
(XEN)    0000000067c50000 ffff82d0802510dc ffff82d0808197e0 0000000067b4bf3c
(XEN)    ffff830059027780 0000000000000060 ffff82d08093ebe0 ffff82d0808197e0
(XEN)    000000203fe4e000 0000000067b4b590 ffff830059027800 ffff82d080240b77
(XEN)    ffff832010000400 00000000000000f1 ffff830059027760 0000000067aeb54b
(XEN)    ffff8300590277c8 ffff82d0802858ca ffff82d080389845 ffff832010000424
(XEN)    00000000000fa000 67c5000000000200 ffff82d080389845 0000000067aeb8d7
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffff830059027fff
(XEN)    0000000000000000 0000000067aeb6ae ffff82d0803898ba 0000000000000003
(XEN)    00000000003526e0 ffff830059027840 0000000000000000 0000000067aeb476
(XEN)    ffff830000000000 ffff830059027860 0000000059014000 0000000000000000
(XEN)    ffff830059027850 ffff82d080386464 0000000000000000 ffff82d080386768
(XEN)    0000000000000000 00000000fffffffe ffff8300590278a0 ffff82d080386739
(XEN)    0000000059014000 0000000000000283 ffff830059027888 000000000000e010
(XEN)    ffff82d0802a4d55 0000000000000046 ffff82d08046b5d0 ffffffffffffffff
(XEN)    ffff8300590278f0 ffff82d0802a4607 0000138800000000 0000000000000000
(XEN)    0000000000000000 0000000000000046 ffff82d08046b5d0 ffff82d080240bfe
(XEN)    ffff82d08044c815 0000000000000003 ffff830059027958 ffff82d080250ea9
(XEN)    ffff830000000028 ffff830059027968 ffff830059027918 ffff82d080240e1c
(XEN)    ffff82d08045c610 ffff82d080451a57 ffff82d08044c815 0000000000000058
(XEN) Xen call trace:
(XEN)    [<0000000067b4cb2d>] R 0000000067b4cb2d
(XEN)    [<ffff832010000400>] S ffff832010000400
(XEN)    [<ffff82d0802a4607>] F machine_restart+0x168/0x28a
(XEN)    [<ffff82d080250ea9>] F console_suspend+0/0x28
(XEN)    [<ffff82d0802abf51>] F do_invalid_op+0x387/0x3b5
(XEN)    [<ffff82d080389a3d>] F x86_64/entry.S#handle_exception_saved+0x68/0x94
(XEN)    [<ffff82d080240bfc>] F _spin_unlock+0x40/0x42
(XEN)    [<ffff82d080240c17>] F _spin_unlock_irqrestore+0xd/0x24
(XEN)    [<ffff82d080252ea9>] F serial_puts+0x131/0x141
(XEN)    [<ffff82d08024fe41>] F console_serial_puts+0x28/0x2a
(XEN)    [<ffff82d08024fe7d>] F drivers/char/console.c#__putstr+0x3a/0x8b
(XEN)    [<ffff82d08024fee2>] F drivers/char/console.c#printk_start_of_line+0x14/0x17b
(XEN)    [<ffff82d0802503ea>] F drivers/char/console.c#vprintk_common+0x8d/0x158
(XEN)    [<ffff82d080250502>] F printk+0x4d/0x4f
(XEN)    [<ffff82d0802303e8>] F common/sched_credit2.c#init_pdata+0xdd/0x441
(XEN)    [<ffff82d0802307e1>] F common/sched_credit2.c#csched2_switch_sched+0x95/0xe2
(XEN)    [<ffff82d08023f1fd>] F schedule_cpu_add+0x18a/0x3fd
(XEN)    [<ffff82d080201a9f>] F common/cpupool.c#cpupool_assign_cpu_locked+0x58/0x189
(XEN)    [<ffff82d080201ee2>] F common/cpupool.c#cpu_callback+0x186/0x3c1
(XEN)    [<ffff82d0802242c0>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d080200f95>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d080201215>] F cpu_up+0xa8/0xe5
(XEN)    [<ffff82d0802a7e28>] F cpu_up_helper+0xf/0xa5
(XEN)    [<ffff82d080205d5d>] F common/domain.c#continue_hypercall_tasklet_handler+0x4c/0xb9
(XEN)    [<ffff82d080242ddb>] F common/tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d0802430bc>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0802751e8>] F arch/x86/domain.c#idle_loop+0x40/0x9b
(XEN) 
(XEN) Pagetable walk from 0000000067c50010:
(XEN)  L4[0x000] = 000000203fe4d063 ffffffffffffffff
(XEN)  L3[0x001] = 000000005900d063 ffffffffffffffff
(XEN)  L2[0x13e] = 0000000000000000 ffffffffffffffff
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0000]
(XEN) Faulting linear address: 0000000067c50010
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
(XEN) Debugging connection not set up.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
--------------E1D1F89C363881B3D635C50E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------E1D1F89C363881B3D635C50E--

