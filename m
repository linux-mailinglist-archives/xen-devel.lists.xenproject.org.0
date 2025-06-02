Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FEACAE1F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 14:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003297.1382836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM4Mc-0000xo-Ux; Mon, 02 Jun 2025 12:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003297.1382836; Mon, 02 Jun 2025 12:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM4Mc-0000w1-RZ; Mon, 02 Jun 2025 12:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1003297;
 Mon, 02 Jun 2025 12:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxQh=YR=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uM4Ma-0000vv-TA
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 12:34:01 +0000
Received: from gw4.antarean.org (gw4.antarean.org [136.144.238.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id da5c0921-3fad-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 14:33:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4b9tT62dzmzNkbn
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 14:29:46 +0200 (CEST)
Received: from gw4.antarean.org ([127.0.0.1])
 by localhost (gw4.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuC9TymzEBZm for <xen-devel@lists.xenproject.org>;
 Mon,  2 Jun 2025 14:29:44 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4b9tT46f8yzNkDx
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 14:29:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4b9tYv3y12z17
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 12:33:55 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id X4pFflhNJVX9 for <xen-devel@lists.xenproject.org>;
 Mon,  2 Jun 2025 12:28:55 +0000 (UTC)
Received: from persephone.localnet (persephone.adm.antarean.org [10.55.16.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPS id 4b9tS70LY2z15
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 12:28:55 +0000 (UTC)
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
X-Inumbo-ID: da5c0921-3fad-11f0-a300-13f23c93f187
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1748867335;
	bh=14z1t6M505HYK1WY1Wpn6iJw1GferfRcM4xInosrBWk=;
	h=From:To:Subject:Date;
	b=X8ZGj/GAKiMpoFvKC0fmngDkcweAVYLusPlNnfGZS2AeJ9xba5PnNnyrTJEM+q/A3
	 PZ5XLDBu6i41JvtONS1eLq6MkB5Ba4c3cd5ORKKwbMdi9yjL5+9lEhisY6NbZ8+Dd+
	 VbKtIV1OgzeYFXt8/gGdoIQm/4R8kseM0kt+ELYM=
From: "J. Roeleveld" <joost@antarean.org>
To: xen-devel@lists.xenproject.org
Subject: Kernel panic when passing through 2 identical PCI devices
Date: Mon, 02 Jun 2025 14:28:54 +0200
Message-ID: <2226691.irdbgypaU6@persephone>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart13775105.uLZWGnKmhe"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart13775105.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi all,

I have a domain to which I pass through 4 PCI devices:
2 NVMe drives
83:00.0   Samsung 980 NVMe
84:00.0   Samsung 980 NVMe

2 HBA Controllers
86:00.0   LSI SAS3008
87:00.0   LSI SAS3008

This works fine with Xen version 4.18.4_pre1.
However, when trying to update to 4.19, this fails.

Checking the output during boot, I think I found something. But my knowledge 
is insufficient to figure out what is causing what I am seeing and how to fix 
this.
 
From the below (where I only focus on the 2 NVMe drives), it is similar to the 
succesfull boot up until it tries to "claiming resource 0000:84:00.0/0".
At which point sysfs fails because the entry for "84" is already present.

The SAS drives appear be dones correctly, but am unable to confirm this as the 
NVMEs are required for a succesful boot.

For completeness, I have attached the output for the failed boot, a normal 
succesfull boot (using 4.18.4_pre1) and my xl.conf (which might need 
adjusting)

=== (output for just the NVME devices) ===
pci_bus 0000:83: root bus resource [io  0x0000-0xffff]
pci_bus 0000:83: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:83: root bus resource [bus 00-ff]
pci 0000:83:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
pci 0000:83:00.0: BAR 0 [mem 0xfbc00000-0xfbc03fff 64bit]
pcifront pci-0: claiming resource 0000:83:00.0/0
pcifront pci-0: Creating PCI Frontend Bus 0000:84
pcifront pci-0: PCI host bridge to bus 0000:84
pci_bus 0000:84: root bus resource [io  0x0000-0xffff]
pci_bus 0000:84: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:84: busn_res: can not insert [bus 84-ff] under domain [bus 00-ff] 
(conflicts with (null) [bus 83-ff])
pci_bus 0000:84: root bus resource [bus 00-ff]
pci 0000:84:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
pci 0000:84:00.0: BAR 0 [mem 0xfbb00000-0xfbb03fff 64bit]
pcifront pci-0: claiming resource 0000:84:00.0/0
sysfs: cannot create duplicate filename '/devices/pci-0/
pci0000:84/0000:84:00.0/resource0'
CPU: 2 UID: 0 PID: 39 Comm: xenwatch Not tainted 6.12.21-gentoo-generic #1
Call Trace:
 <TASK>
 dump_stack_lvl+0x56/0x80
 sysfs_warn_dup+0x51/0x60
 sysfs_add_bin_file_mode_ns+0x8a/0xa0
 sysfs_create_bin_file+0x5e/0x80
 pci_create_attr+0xfc/0x140
 pci_create_resource_files+0x30/0x90
 pci_bus_add_device+0x26/0x80
 pci_bus_add_devices+0x27/0x60
 pcifront_rescan_root+0x18a/0x220
 pcifront_connect+0x117/0x170
 ? xenbus_read_driver_state+0x32/0x60
 ? xenbus_otherend_changed+0x49/0xa0
 ? __pfx_xenwatch_thread+0x10/0x10
 xenwatch_thread+0xf6/0x130
 ? __pfx_autoremove_wake_function+0x10/0x10
 kthread+0xea/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x1f/0x40
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
===


--nextPart13775105.uLZWGnKmhe
Content-Disposition: attachment; filename="xl_config.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="xl_config.txt"

name = "san1"
kernel = "/opt/local/pvgrub2/grub-x86_64-xen.bin"
memory = 98304
maxmem = 98304
vcpus = 4
pool = "Pool-storage"
cpus = ["20","21","22","23"]

vif = [ 'mac=00:16:3e:16:10:3d, bridge=bradm',
        'mac=00:16:3e:16:15:3d, bridge=brstr']
disk = [ 'phy:/dev/zvol/zhost/os/services/san1/root,xvda1,rw',
         'phy:/dev/zvol/zhost/os/services/san1/home,xvda2,rw',
         'phy:/dev/zvol/zhost/os/services/san1/var,xvda3,rw',
         'phy:/dev/zvol/zhost/swap/san1,xvda4,rw']
# (83:00:0) = NVMe 3
# (84:00.0) = NVMe 4
# (86:00.0) = HBA 1
# (87:00.0) = HBA 2
pci = [
       '83:00.0,permissive=1',
       '84:00.0,permissive=1',
       '86:00.0,permissive=1',
       '87:00.0,permissive=1']
driver_domain=1

--nextPart13775105.uLZWGnKmhe
Content-Disposition: attachment; filename="Boot_Succesfull.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="Boot_Succesfull.txt"

Parsing config from /etc/xen/domains/san1/san1
[30m[47mWelcome to GRUB!


[37m[40m[37m[40m[37m[40m[3;39H      [ grub.cfg  304B  100%  1.95KiB/s ][3;1H[H[J[1;1H  Booting `Default'


Linux version 6.12.21-gentoo-generic (root@san1) (gcc (Gentoo Hardened 14.2.1_p20241221 p7) 14.2.1 20241221, GNU ld (Gentoo 2.44 p1) 2.44.0) #1 SMP PREEMPT_DYNAMIC Tue Apr 29 10:13:56 UTC 2025
Command line: root=/dev/xvda1 nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
  Hygon HygonGenuine
  zhaoxin   Shanghai  
ACPI in unprivileged domain disabled
Released 0 page(s)
BIOS-provided physical RAM map:
Xen: [mem 0x0000000000000000-0x000000000009ffff] usable
Xen: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Xen: [mem 0x0000000000100000-0x0000000078da2fff] usable
Xen: [mem 0x0000000078da3000-0x00000000795bbfff] reserved
Xen: [mem 0x00000000795bc000-0x000000007969ffff] unusable
Xen: [mem 0x00000000796a0000-0x0000000079c1efff] ACPI NVS
Xen: [mem 0x0000000079c1f000-0x000000007bcf6fff] reserved
Xen: [mem 0x000000007bcf7000-0x000000007bcf7fff] unusable
Xen: [mem 0x000000007bcf8000-0x000000007bd7dfff] reserved
Xen: [mem 0x000000007bd7e000-0x000000007bffffff] unusable
Xen: [mem 0x000000007c000000-0x000000008fffffff] reserved
Xen: [mem 0x00000000c7ffc000-0x00000000c7ffcfff] reserved
Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
Xen: [mem 0x00000000fec00000-0x00000000fec01fff] reserved
Xen: [mem 0x00000000fec40000-0x00000000fec40fff] reserved
Xen: [mem 0x00000000fed1c000-0x00000000fed44fff] reserved
Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Xen: [mem 0x0000000100000000-0x000000188725cfff] usable
NX (Execute Disable) protection: active
APIC: Static calls initialized
DMI not present or invalid.
Hypervisor detected: Xen PV
Xen PV: Detected 4 vCPUS
tsc: Fast TSC calibration failed
tsc: Detected 2399.998 MHz processor
last_pfn = 0x188725d max_arch_pfn = 0x400000000
MTRR map: 0 entries (0 fixed + 0 variable; max 0), built from 0 variable MTRRs
MTRRs set to read-only
x86/PAT: PAT support disabled because CONFIG_X86_PAT is disabled in the kernel.
x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
last_pfn = 0x78da3 max_arch_pfn = 0x400000000
Kernel/User page tables isolation: disabled on XEN PV.
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000188725cfff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x000000000009ffff]
  node   0: [mem 0x0000000000100000-0x0000000078da2fff]
  node   0: [mem 0x0000000100000000-0x000000188725cfff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000188725cfff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 96 pages in unavailable ranges
On node 0, zone Normal: 29277 pages in unavailable ranges
On node 0, zone Normal: 3491 pages in unavailable ranges
p2m virtual area at (____ptrval____), size is c600000
Remapped 553565 page(s)
Remapped 0 non-RAM page(s)
CPU topo: Max. logical packages:   1
CPU topo: Max. logical dies:       1
CPU topo: Max. dies per package:   1
CPU topo: Max. threads per core:   2
CPU topo: Num. cores per package:     2
CPU topo: Num. threads per package:   4
CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
[mem 0x90000000-0xc7ffbfff] available for PCI devices
Booting kernel on Xen
Xen version: 4.18.4-pre (preserve-AD)
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
setup_percpu: NR_CPUS:64 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
percpu: Embedded 57 pages/cpu s195928 r8192 d29352 u524288
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Kernel command line: root=/dev/xvda1 nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768
random: crng init done
Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 25165727
mem auto-init: stack:off, heap alloc:off, heap free:off
software IO TLB: area num 4.
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Dynamic Preempt: voluntary
rcu: Preemptible hierarchical RCU implementation.
rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
	Trampoline variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
Using NULL legacy PIC
NR_IRQS: 4352, nr_irqs: 80, preallocated irqs: 0
xen:events: Using FIFO-based ABI
rcu: srcu_init: Setting srcu_struct sizes based on contention.
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
printk: legacy console [hvc0] enabled
clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
installing Xen timer for CPU 0
APIC: Switched APIC routing to: Xen PV
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x229835b7123, max_idle_ns: 440795242976 ns
Calibrating delay loop (skipped), value calculated using timer frequency.. 4799.99 BogoMIPS (lpj=23999980)
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Spectre V2 : Mitigation: Retpolines
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
Spectre V2 : Enabling Restricted Speculation for firmware calls
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Spectre V2 : User space: Mitigation: STIBP via prctl
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: Clear CPU buffers
MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Freeing SMP alternatives memory: 24K
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
cpu 0 spinlock event irq 1
VPMU disabled by hypervisor.
Performance Events: unsupported p6 CPU model 79 no PMU driver, software events only.
signal: max sigframe size: 1776
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
smp: Bringing up secondary CPUs ...
installing Xen timer for CPU 2
cpu 2 spinlock event irq 11
installing Xen timer for CPU 1
installing Xen timer for CPU 3
cpu 1 spinlock event irq 22
MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
cpu 3 spinlock event irq 23
smp: Brought up 1 node, 4 CPUs
Memory: 98485732K/100662908K available (12288K kernel code, 3568K rwdata, 5024K rodata, 2276K init, 2376K bss, 2168812K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
xen:grant_table: Grant tables using version 1 layout
Grant table initialized
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'user_space'
dca service started, version 1.12.1
PCI: setting up Xen PCI frontend stub
cryptd: max_cpu_qlen set to 1000
ACPI: Interpreter disabled.
xen:balloon: Initialising balloon driver
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: lazy mode
SCSI subsystem initialized
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
PCI: System does not support PCI
vgaarb: loaded
clocksource: Switched to clocksource xen
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
pnp: PnP ACPI: disabled
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 524288 (order: 10, 4194304 bytes, linear)
TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
TCP: Hash tables configured (established 524288 bind 65536)
UDP hash table entries: 65536 (order: 9, 2097152 bytes, linear)
UDP-Lite hash table entries: 65536 (order: 9, 2097152 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp-with-tls transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 64
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x000000187d000000-0x0000001881000000] (64MB)
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x229835b7123, max_idle_ns: 440795242976 ns
workingset: timestamp_bits=46 max_order=25 bucket_order=0
DLM installed
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
fuse: init (API version 7.41)
JFS: nTxBlock = 8192, nTxLock = 65536
SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
Key type asymmetric registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
io scheduler mq-deadline registered
io scheduler kyber registered
uvesafb: failed to execute /sbin/v86d
uvesafb: make sure that the v86d helper is installed and executable
uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
uvesafb: vbe_init() failed with -22
uvesafb uvesafb.0: probe with driver uvesafb failed with error -22
ioatdma: Intel(R) QuickData Technology Driver 5.00
xen:xen_evtchn: Event-channel device installed
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
pcifront pci-0: Installing PCI frontend
pcifront pci-0: Creating PCI Frontend Bus 0000:83
pcifront pci-0: PCI host bridge to bus 0000:83
pci_bus 0000:83: root bus resource [io  0x0000-0xffff]
pci_bus 0000:83: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:83: root bus resource [bus 00-ff]
pci 0000:83:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
loop: module loaded
pci 0000:83:00.0: BAR 0 [mem 0xfbc00000-0xfbc03fff 64bit]
SCSI Media Changer driver v0.25 
xen_netfront: Initialising Xen virtual ethernet driver
i8042: PNP: No PS/2 controller found.
i8042: Probing ports directly.
pcifront pci-0: claiming resource 0000:83:00.0/0
i8042: No controller found
pcifront pci-0: Creating PCI Frontend Bus 0000:84
pcifront pci-0: PCI host bridge to bus 0000:84
pci_bus 0000:84: root bus resource [io  0x0000-0xffff]
pci_bus 0000:84: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:84: busn_res: can not insert [bus 84-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:84: root bus resource [bus 00-ff]
mousedev: PS/2 mouse device common for all mice
device-mapper: uevent: version 1.0.3
pci 0000:84:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
device-mapper: multipath round-robin: version 1.2.0 loaded
intel_pstate: CPU model not supported
hid: raw HID events driver (C) Jiri Kosina
Initializing XFRM netlink socket
NET: Registered PF_PACKET protocol family
sctp: Hash tables configured (bind 2048/2048)
pci 0000:84:00.0: BAR 0 [mem 0xfbb00000-0xfbb03fff 64bit]
Key type dns_resolver registered
pcifront pci-0: claiming resource 0000:84:00.0/0
pcifront pci-0: Creating PCI Frontend Bus 0000:86
pcifront pci-0: PCI host bridge to bus 0000:86
pci_bus 0000:86: root bus resource [io  0x0000-0xffff]
pci_bus 0000:86: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:86: busn_res: can not insert [bus 86-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:86: root bus resource [bus 00-ff]
pci 0000:86:00.0: [1000:0097] type 00 class 0x010700 PCIe Endpoint
IPI shorthand broadcast: enabled
pci 0000:86:00.0: BAR 0 [io  0xf000-0xf0ff]
pci 0000:86:00.0: BAR 1 [mem 0xfba40000-0xfba4ffff 64bit]
pci 0000:86:00.0: BAR 3 [mem 0xfba00000-0xfba3ffff 64bit]
pci 0000:86:00.0: ROM [mem 0xfb900000-0xfb9fffff pref]
pci 0000:86:00.0: supports D1 D2
pci 0000:86:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:86:00.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
sched_clock: Marking stable (3911602419, 705114)->(3914816421, -2508888)
pcifront pci-0: claiming resource 0000:86:00.0/0
pcifront pci-0: claiming resource 0000:86:00.0/1
pcifront pci-0: claiming resource 0000:86:00.0/3
pcifront pci-0: claiming resource 0000:86:00.0/6
registered taskstats version 1
pcifront pci-0: Creating PCI Frontend Bus 0000:87
pcifront pci-0: PCI host bridge to bus 0000:87
pci_bus 0000:87: root bus resource [io  0x0000-0xffff]
pci_bus 0000:87: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:87: busn_res: can not insert [bus 87-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:87: root bus resource [bus 00-ff]
pci 0000:87:00.0: [1000:0097] type 00 class 0x010700 PCIe Endpoint
pci 0000:87:00.0: BAR 0 [io  0xe000-0xe0ff]
pci 0000:87:00.0: BAR 1 [mem 0xfb840000-0xfb84ffff 64bit]
pci 0000:87:00.0: BAR 3 [mem 0xfb800000-0xfb83ffff 64bit]
pci 0000:87:00.0: ROM [mem 0xfb700000-0xfb7fffff pref]
pci 0000:87:00.0: supports D1 D2
pci 0000:87:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:87:00.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
pcifront pci-0: claiming resource 0000:87:00.0/0
pcifront pci-0: claiming resource 0000:87:00.0/1
pcifront pci-0: claiming resource 0000:87:00.0/3
pcifront pci-0: claiming resource 0000:87:00.0/6
xen_netfront: backend supports XDP headroom
xen_netfront: backend supports XDP headroom
blkfront: xvda1: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda2: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda3: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda4: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
clk: Disabling unused clocks
EXT4-fs (xvda1): mounted filesystem f46e14cc-db5e-410f-9c70-9b9eb1498be9 r/w with ordered data mode. Quota mode: none.
VFS: Mounted root (ext4 filesystem) on device 202:1.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 2276K
Write protecting the kernel read-only data: 18432k
Freeing unused kernel image (rodata/data gap) memory: 1120K
rodata_test: all tests were successful
Run /sbin/init as init process

INIT: version 3.09 booting

--nextPart13775105.uLZWGnKmhe
Content-Disposition: attachment; filename="Boot_Failed.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="Boot_Failed.txt"

Parsing config from /etc/xen/domains/san1/san1
[30m[47mWelcome to GRUB!


[37m[40m[37m[40m[37m[40m[3;39H      [ grub.cfg  304B  100%  2.01KiB/s ][3;1H[H[J[1;1H  Booting `Default'


Linux version 6.12.21-gentoo-generic (root@san1) (gcc (Gentoo Hardened 14.2.1_p20241221 p7) 14.2.1 20241221, GNU ld (Gentoo 2.44 p1) 2.44.0) #1 SMP PREEMPT_DYNAMIC Tue Apr 29 10:13:56 UTC 2025
Command line: root=/dev/xvda1 nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
  Hygon HygonGenuine
  zhaoxin   Shanghai  
ACPI in unprivileged domain disabled
Released 0 page(s)
BIOS-provided physical RAM map:
Xen: [mem 0x0000000000000000-0x000000000009ffff] usable
Xen: [mem 0x00000000000a0000-0x00000000000fffff] reserved
Xen: [mem 0x0000000000100000-0x0000000078da2fff] usable
Xen: [mem 0x0000000078da3000-0x00000000795bbfff] reserved
Xen: [mem 0x00000000795bc000-0x000000007969ffff] unusable
Xen: [mem 0x00000000796a0000-0x0000000079c1efff] ACPI NVS
Xen: [mem 0x0000000079c1f000-0x000000007bcf6fff] reserved
Xen: [mem 0x000000007bcf7000-0x000000007bcf7fff] unusable
Xen: [mem 0x000000007bcf8000-0x000000007bd7dfff] reserved
Xen: [mem 0x000000007bd7e000-0x000000007bffffff] unusable
Xen: [mem 0x000000007c000000-0x000000008fffffff] reserved
Xen: [mem 0x00000000c7ffc000-0x00000000c7ffcfff] reserved
Xen: [mem 0x00000000fbffc000-0x00000000fbffcfff] reserved
Xen: [mem 0x00000000fec00000-0x00000000fec01fff] reserved
Xen: [mem 0x00000000fec40000-0x00000000fec40fff] reserved
Xen: [mem 0x00000000fed1c000-0x00000000fed44fff] reserved
Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
Xen: [mem 0x0000000100000000-0x000000188725cfff] usable
NX (Execute Disable) protection: active
APIC: Static calls initialized
DMI not present or invalid.
Hypervisor detected: Xen PV
Xen PV: Detected 4 vCPUS
tsc: Fast TSC calibration failed
tsc: Detected 2399.994 MHz processor
last_pfn = 0x188725d max_arch_pfn = 0x400000000
MTRR map: 0 entries (0 fixed + 0 variable; max 0), built from 0 variable MTRRs
MTRRs set to read-only
x86/PAT: PAT support disabled because CONFIG_X86_PAT is disabled in the kernel.
x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
last_pfn = 0x78da3 max_arch_pfn = 0x400000000
Kernel/User page tables isolation: disabled on XEN PV.
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000188725cfff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x000000000009ffff]
  node   0: [mem 0x0000000000100000-0x0000000078da2fff]
  node   0: [mem 0x0000000100000000-0x000000188725cfff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000188725cfff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 96 pages in unavailable ranges
On node 0, zone Normal: 29277 pages in unavailable ranges
On node 0, zone Normal: 3491 pages in unavailable ranges
p2m virtual area at (____ptrval____), size is c600000
Remapped 553565 page(s)
Remapped 0 non-RAM page(s)
CPU topo: Max. logical packages:   1
CPU topo: Max. logical dies:       1
CPU topo: Max. dies per package:   1
CPU topo: Max. threads per core:   2
CPU topo: Num. cores per package:     2
CPU topo: Num. threads per package:   4
CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
[mem 0x90000000-0xc7ffbfff] available for PCI devices
Booting kernel on Xen
Xen version: 4.19.1 (preserve-AD)
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
setup_percpu: NR_CPUS:64 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
percpu: Embedded 57 pages/cpu s195928 r8192 d29352 u524288
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Kernel command line: root=/dev/xvda1 nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768
random: crng init done
Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes, linear)
Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 25165727
mem auto-init: stack:off, heap alloc:off, heap free:off
software IO TLB: area num 4.
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Dynamic Preempt: voluntary
rcu: Preemptible hierarchical RCU implementation.
rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
	Trampoline variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
Using NULL legacy PIC
NR_IRQS: 4352, nr_irqs: 80, preallocated irqs: 0
xen:events: Using FIFO-based ABI
rcu: srcu_init: Setting srcu_struct sizes based on contention.
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
printk: legacy console [hvc0] enabled
clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
installing Xen timer for CPU 0
APIC: Switched APIC routing to: Xen PV
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x229831eaaf8, max_idle_ns: 440795283826 ns
Calibrating delay loop (skipped), value calculated using timer frequency.. 4799.98 BogoMIPS (lpj=23999940)
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Spectre V2 : Mitigation: Retpolines
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
Spectre V2 : Enabling Restricted Speculation for firmware calls
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Spectre V2 : User space: Mitigation: STIBP via prctl
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: Clear CPU buffers
MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Freeing SMP alternatives memory: 24K
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
cpu 0 spinlock event irq 1
VPMU disabled by hypervisor.
Performance Events: unsupported p6 CPU model 79 no PMU driver, software events only.
signal: max sigframe size: 1776
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
smp: Bringing up secondary CPUs ...
installing Xen timer for CPU 2
cpu 2 spinlock event irq 11
installing Xen timer for CPU 1
installing Xen timer for CPU 3
cpu 1 spinlock event irq 22
MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
cpu 3 spinlock event irq 23
smp: Brought up 1 node, 4 CPUs
Memory: 98485732K/100662908K available (12288K kernel code, 3568K rwdata, 5024K rodata, 2276K init, 2376K bss, 2168812K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
xen:grant_table: Grant tables using version 1 layout
Grant table initialized
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'user_space'
dca service started, version 1.12.1
PCI: setting up Xen PCI frontend stub
cryptd: max_cpu_qlen set to 1000
ACPI: Interpreter disabled.
xen:balloon: Initialising balloon driver
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: lazy mode
SCSI subsystem initialized
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
PCI: System does not support PCI
vgaarb: loaded
clocksource: Switched to clocksource xen
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
pnp: PnP ACPI: disabled
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 65536 (order: 8, 1048576 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 524288 (order: 10, 4194304 bytes, linear)
TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
TCP: Hash tables configured (established 524288 bind 65536)
UDP hash table entries: 65536 (order: 9, 2097152 bytes, linear)
UDP-Lite hash table entries: 65536 (order: 9, 2097152 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp-with-tls transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 64
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x000000187d000000-0x0000001881000000] (64MB)
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x229831eaaf8, max_idle_ns: 440795283826 ns
workingset: timestamp_bits=46 max_order=25 bucket_order=0
DLM installed
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
fuse: init (API version 7.41)
JFS: nTxBlock = 8192, nTxLock = 65536
SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
Key type asymmetric registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
io scheduler mq-deadline registered
io scheduler kyber registered
uvesafb: failed to execute /sbin/v86d
uvesafb: make sure that the v86d helper is installed and executable
uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
uvesafb: vbe_init() failed with -22
uvesafb uvesafb.0: probe with driver uvesafb failed with error -22
ioatdma: Intel(R) QuickData Technology Driver 5.00
xen:xen_evtchn: Event-channel device installed
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
pcifront pci-0: Installing PCI frontend
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
pcifront pci-0: Creating PCI Frontend Bus 0000:83
pcifront pci-0: PCI host bridge to bus 0000:83
pci_bus 0000:83: root bus resource [io  0x0000-0xffff]
pci_bus 0000:83: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:83: root bus resource [bus 00-ff]
pci 0000:83:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
pci 0000:83:00.0: BAR 0 [mem 0xfbc00000-0xfbc03fff 64bit]
loop: module loaded
SCSI Media Changer driver v0.25 
xen_netfront: Initialising Xen virtual ethernet driver
i8042: PNP: No PS/2 controller found.
i8042: Probing ports directly.
i8042: No controller found
mousedev: PS/2 mouse device common for all mice
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
device-mapper: multipath round-robin: version 1.2.0 loaded
intel_pstate: CPU model not supported
hid: raw HID events driver (C) Jiri Kosina
Initializing XFRM netlink socket
NET: Registered PF_PACKET protocol family
sctp: Hash tables configured (bind 2048/2048)
Key type dns_resolver registered
pcifront pci-0: claiming resource 0000:83:00.0/0
pcifront pci-0: Creating PCI Frontend Bus 0000:84
pcifront pci-0: PCI host bridge to bus 0000:84
pci_bus 0000:84: root bus resource [io  0x0000-0xffff]
pci_bus 0000:84: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:84: busn_res: can not insert [bus 84-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:84: root bus resource [bus 00-ff]
pci 0000:84:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
pci 0000:84:00.0: BAR 0 [mem 0xfbb00000-0xfbb03fff 64bit]
IPI shorthand broadcast: enabled
sched_clock: Marking stable (3910019036, 711046)->(3920862979, -10132897)
registered taskstats version 1
pcifront pci-0: claiming resource 0000:84:00.0/0
sysfs: cannot create duplicate filename '/devices/pci-0/pci0000:84/0000:84:00.0/resource0'
CPU: 2 UID: 0 PID: 39 Comm: xenwatch Not tainted 6.12.21-gentoo-generic #1
Call Trace:
 <TASK>
 dump_stack_lvl+0x56/0x80
 sysfs_warn_dup+0x51/0x60
 sysfs_add_bin_file_mode_ns+0x8a/0xa0
 sysfs_create_bin_file+0x5e/0x80
 pci_create_attr+0xfc/0x140
 pci_create_resource_files+0x30/0x90
 pci_bus_add_device+0x26/0x80
 pci_bus_add_devices+0x27/0x60
 pcifront_rescan_root+0x18a/0x220
 pcifront_connect+0x117/0x170
 ? xenbus_read_driver_state+0x32/0x60
 ? xenbus_otherend_changed+0x49/0xa0
 ? __pfx_xenwatch_thread+0x10/0x10
 xenwatch_thread+0xf6/0x130
 ? __pfx_autoremove_wake_function+0x10/0x10
 kthread+0xea/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x1f/0x40
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
pcifront pci-0: Creating PCI Frontend Bus 0000:86
pcifront pci-0: PCI host bridge to bus 0000:86
pci_bus 0000:86: root bus resource [io  0x0000-0xffff]
pci_bus 0000:86: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:86: busn_res: can not insert [bus 86-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:86: root bus resource [bus 00-ff]
pci 0000:86:00.0: [1000:0097] type 00 class 0x010700 PCIe Endpoint
pci 0000:86:00.0: BAR 0 [io  0xf000-0xf0ff]
pci 0000:86:00.0: BAR 1 [mem 0xfba40000-0xfba4ffff 64bit]
pci 0000:86:00.0: BAR 3 [mem 0xfba00000-0xfba3ffff 64bit]
pci 0000:86:00.0: ROM [mem 0xfb900000-0xfb9fffff pref]
pci 0000:86:00.0: supports D1 D2
pci 0000:86:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:86:00.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
pcifront pci-0: claiming resource 0000:86:00.0/0
pcifront pci-0: claiming resource 0000:86:00.0/1
pcifront pci-0: claiming resource 0000:86:00.0/3
pcifront pci-0: claiming resource 0000:86:00.0/6
pcifront pci-0: Creating PCI Frontend Bus 0000:87
pcifront pci-0: PCI host bridge to bus 0000:87
pci_bus 0000:87: root bus resource [io  0x0000-0xffff]
pci_bus 0000:87: root bus resource [mem 0x00000000-0x3fffffffffff]
pci_bus 0000:87: busn_res: can not insert [bus 87-ff] under domain [bus 00-ff] (conflicts with (null) [bus 83-ff])
pci_bus 0000:87: root bus resource [bus 00-ff]
pci 0000:87:00.0: [1000:0097] type 00 class 0x010700 PCIe Endpoint
pci 0000:87:00.0: BAR 0 [io  0xe000-0xe0ff]
pci 0000:87:00.0: BAR 1 [mem 0xfb840000-0xfb84ffff 64bit]
pci 0000:87:00.0: BAR 3 [mem 0xfb800000-0xfb83ffff 64bit]
pci 0000:87:00.0: ROM [mem 0xfb700000-0xfb7fffff pref]
pci 0000:87:00.0: supports D1 D2
pci 0000:87:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:87:00.0 (capable of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
pcifront pci-0: claiming resource 0000:87:00.0/0
pcifront pci-0: claiming resource 0000:87:00.0/1
pcifront pci-0: claiming resource 0000:87:00.0/3
pcifront pci-0: claiming resource 0000:87:00.0/6
xen_netfront: backend supports XDP headroom
xen_netfront: backend supports XDP headroom
blkfront: xvda1: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda2: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda3: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
blkfront: xvda4: flush diskcache: enabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
clk: Disabling unused clocks
EXT4-fs (xvda1): 14 orphan inodes deleted
EXT4-fs (xvda1): recovery complete
EXT4-fs (xvda1): mounted filesystem f46e14cc-db5e-410f-9c70-9b9eb1498be9 r/w with ordered data mode. Quota mode: none.
VFS: Mounted root (ext4 filesystem) on device 202:1.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 2276K
Write protecting the kernel read-only data: 18432k
Freeing unused kernel image (rodata/data gap) memory: 1120K
rodata_test: all tests were successful
Run /sbin/init as init process

INIT: version 3.09 booting

--nextPart13775105.uLZWGnKmhe--




