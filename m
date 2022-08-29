Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E175A43C8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 09:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394466.633876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSZCr-0006TY-RU; Mon, 29 Aug 2022 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394466.633876; Mon, 29 Aug 2022 07:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSZCr-0006Rk-Ny; Mon, 29 Aug 2022 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 394466;
 Mon, 29 Aug 2022 07:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CYo=ZB=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1oSZCp-0006Re-Me
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 07:29:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4410a3f5-276c-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 09:29:07 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id cu2so14004044ejb.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Aug 2022 00:29:07 -0700 (PDT)
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
X-Inumbo-ID: 4410a3f5-276c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VGRGpLybpaUoO4p/65puE/IRAsBFo00WEEBcsjWfKCo=;
        b=ai9Wt43G9/QTFFm69QzN2x7Q2VX3kBP36+m6hpr6VMvfgJbhk0BnWVlihq1BlUc4IE
         CddPYCMHvti/hPJWrN3jqNt6FK829lwJhnwaY7NeSCsQEN4mbouxVq3nn7txBC6Nk16b
         dEH1QBy6eW7q6DKfK2oHd+5lXDCDWlAM16sQ/1t4Dz82oY3w1OqYrCSce9L2exW5DE0e
         yE7FOFcljI8i9hPaQZx2YzX4phI9yI5ij6NjdfAN2btAS2b9EQu7pWdTbxyjdi44WPzq
         lis851VEfGNvD5o57Wv4In7NRc45QjOpLmJtvPdmxux7tzqd9hxGinlG3nDbK22+rcEI
         518Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VGRGpLybpaUoO4p/65puE/IRAsBFo00WEEBcsjWfKCo=;
        b=luQq4n8zFv14vKiigoE32d+N6h/nSvlkOaKw0uNo33sMyfyv/qXWdkC1V/hcAK9m+R
         NolHy74WpT8UUulO9L1Q5AO+aGT5m63Ko0JdQh5ZdI6zJopV8Ud7n79kWoAboDW7YsrZ
         k8XnHyxJB3g7oL+9dv6sCqIp+sSHERG8uqu+ALIorgpzSW+38EJv0/u5P71mc9wvste/
         jEWyvnKrNjx/D07rYGemm2/yOu29zDpeT3TOd8B1kvXgFQ6eWqYZrhpkKj1SUBNmgeD8
         hWF1VI/j/dgH4aFTTBlkvTX0wkJmkl0K+ZeKW77vubLKDgWKhuoH6uEJ4aiEcwOlwVCo
         gBiA==
X-Gm-Message-State: ACgBeo3+lGPyHb3nn4iG4K8WRs7++UG77Kni7BEvlT+YGQ+5p3pOs2VC
	p4jaWkK3R4880CtoK4IVZSrtAdUeJ5wO4SdA4Tc=
X-Google-Smtp-Source: AA6agR4y5jMuv6jSZ5sSNKDFOe8I0a31QLtu17GG8VKaVs9ZVFePON0AKpaVKgKbQrKtO5lH4T6s0Wg5Ls5YXtAERVQ=
X-Received: by 2002:a17:906:505:b0:73d:b188:17d9 with SMTP id
 j5-20020a170906050500b0073db18817d9mr12172728eja.97.1661758146494; Mon, 29
 Aug 2022 00:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com>
 <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com> <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
 <CALAP8f-3jcGen82DaVrxRTF3TMDVMkLJA5Nsxu=HDYFDqTOOdQ@mail.gmail.com>
 <62627CF0-8594-4DEB-9F6C-37AECDE6B77B@arm.com> <CALAP8f_JqwRcPM9_xLT6U6xeHLDVNO5itA0ELC_pZ-xyUyKqtQ@mail.gmail.com>
 <E9EE3632-4591-4A2F-BF28-E69A961F1E5E@arm.com>
In-Reply-To: <E9EE3632-4591-4A2F-BF28-E69A961F1E5E@arm.com>
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Mon, 29 Aug 2022 12:57:50 +0530
Message-ID: <CALAP8f99rDQMr24AoXBBEs0==mHJ-rxAZ5+5tqoo8HztxMiA2Q@mail.gmail.com>
Subject: Re: Porting xen on rpi4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000006453605e75c3883"

--00000000000006453605e75c3883
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

Thanks for your support!

As suggested, I enabled BLK_DEV_LOOP in the kernel & now I can see loop
devices in the "/dev" directory.
I could see xen-guest-image-minimal loading but at the end it's throwing
error *INIT: cannot execute "/sbin/getty-wrapper"*

I found start_getty in the image but getty-wrapper is not there. while
exploring source could see getty-wrapper in meta-virtualization sysvinit,
but start_getty is in poky sysvinit.
Any suggestions on this issue? Adding full logs below for reference:

















































































































































































































































*root@raspberrypi4-64:~# xl create -c guest1.cfg Parsing config from
guest1.cfgBooting Linux on physical CPU 0x0000000000 [0x410fd083]Linux
version 5.15.54-yocto-standard (oe-user@oe-host) (aarch64-poky-linux-gcc
(GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220623) #1 SMP PREEMPT Thu Jul
14 18:52:13 UTC 2022random: crng init doneMachine model: XENVM-4.16Xen 4.16
support foundefi: UEFI not found.Zone ranges:  DMA      [mem
0x0000000040000000-0x000000007fffffff]  DMA32    empty  Normal
emptyMovable zone start for each nodeEarly memory node ranges  node   0:
[mem 0x0000000040000000-0x000000007fffffff]Initmem setup node 0 [mem
0x0000000040000000-0x000000007fffffff]cma: Reserved 16 MiB at
0x000000007dc00000psci: probing for conduit method from DT.psci: PSCIv1.1
detected in firmware.psci: Using standard PSCI v0.2 function IDspsci:
Trusted OS migration not requiredpsci: SMC Calling Convention v1.1percpu:
Embedded 27 pages/cpu s70360 r8192 d32040 u110592Detected PIPT I-cache on
CPU0CPU features: detected: Spectre-v2CPU features: detected: Spectre-v4CPU
features: detected: Spectre-BHBCPU features: detected: ARM errata 1165522,
1319367, or 1530923Built 1 zonelists, mobility grouping on.  Total pages:
258048Kernel command line: console=3Dhvc0 earlyprintk=3Dxen sync_console
root=3D/dev/xvdaUnknown kernel command line parameters "sync_console
earlyprintk=3Dxen", will be passed to user space.Dentry cache hash table
entries: 131072 (order: 8, 1048576 bytes, linear)Inode-cache hash table
entries: 65536 (order: 7, 524288 bytes, linear)mem auto-init: stack:off,
heap alloc:off, heap free:offMemory: 985220K/1048576K available (13376K
kernel code, 2060K rwdata, 4372K rodata, 4160K init, 714K bss, 46972K
reserved, 16384K cma-reserved)SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0,
CPUs=3D1, Nodes=3D1ftrace: allocating 41866 entries in 164 pagesftrace:
allocated 164 pages with 3 groupstrace event string verifier disabledrcu:
Preemptible hierarchical RCU implementation.rcu: RCU event tracing is
enabled.rcu: RCU restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.
Trampoline variant of Tasks RCU enabled. Rude variant of Tasks RCU enabled.
Tracing variant of Tasks RCU enabled.rcu: RCU calculated value of
scheduler-enlistment delay is 25 jiffies.rcu: Adjusting geometry for
rcu_fanout_leaf=3D16, nr_cpu_ids=3D1NR_IRQS: 64, nr_irqs: 64, preallocated
irqs: 0Root IRQ handler: gic_handle_irqkfence: initialized - using 2097152
bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)arch_timer:
cp15 timer(s) running at 54.00MHz (virt).clocksource: arch_sys_counter:
mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123
nssched_clock: 56 bits at 54MHz, resolution 18ns, wraps every
4398046511102nsConsole: colour dummy device 80x25printk: console [hvc0]
enabledCalibrating delay loop (skipped), value calculated using timer
frequency.. 108.00 BogoMIPS (lpj=3D216000)pid_max: default: 32768 minimum:
301LSM: Security Framework initializinglandlock: Up and running.Mount-cache
hash table entries: 2048 (order: 2, 16384 bytes, linear)Mountpoint-cache
hash table entries: 2048 (order: 2, 16384 bytes, linear)xen:grant_table:
Grant tables using version 1 layoutGrant table initializedxen:events: Using
FIFO-based ABIXen: initializing cpu0rcu: Hierarchical SRCU
implementation.EFI services will not be available.smp: Bringing up
secondary CPUs ...smp: Brought up 1 node, 1 CPUSMP: Total of 1 processors
activated.CPU features: detected: 32-bit EL0 SupportCPU features: detected:
CRC32 instructionsCPU: All CPU(s) started at EL1alternatives: patching
kernel codedevtmpfs: initializedclocksource: jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 nsfutex hash table
entries: 256 (order: 2, 16384 bytes, linear)pinctrl core: initialized
pinctrl subsystemDMI not present or invalid.NET: Registered
PF_NETLINK/PF_ROUTE protocol familyDMA: preallocated 128 KiB GFP_KERNEL
pool for atomic allocationsDMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA
pool for atomic allocationsDMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32
pool for atomic allocationsthermal_sys: Registered thermal governor
'step_wise'hw-breakpoint: found 6 breakpoint and 4 watchpoint
registers.ASID allocator initialised with 65536 entriesSerial: AMBA PL011
UART driverraid6: neonx8   gen()  1585 MB/sraid6: neonx8   xor()  1177
MB/sraid6: neonx4   gen()  1701 MB/sraid6: neonx4   xor()  1279 MB/sraid6:
neonx2   gen()  1473 MB/sraid6: neonx2   xor()  1161 MB/sraid6: neonx1
gen()  1131 MB/sraid6: neonx1   xor()   929 MB/sraid6: int64x8  gen()   946
MB/sraid6: int64x8  xor()   555 MB/sraid6: int64x4  gen()   985 MB/sraid6:
int64x4  xor()   570 MB/sraid6: int64x2  gen()   914 MB/sraid6: int64x2
 xor()   506 MB/sraid6: int64x1  gen()   714 MB/sraid6: int64x1  xor()
377 MB/sraid6: using algorithm neonx4 gen() 1701 MB/sraid6: .... xor() 1279
MB/s, rmw enabledraid6: using neon recovery algorithmxen:balloon:
Initialising balloon driveriommu: Default domain type: Translated iommu:
DMA domain TLB invalidation policy: strict mode vgaarb: loadedSCSI
subsystem initializedusbcore: registered new interface driver usbfsusbcore:
registered new interface driver hubusbcore: registered new device driver
usbpps_core: LinuxPPS API ver. 1 registeredpps_core: Software ver. 5.3.6 -
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it
<giometti@linux.it>>PTP clock support registeredBluetooth: Core ver
2.22NET: Registered PF_BLUETOOTH protocol familyBluetooth: HCI device and
connection manager initializedBluetooth: HCI socket layer
initializedBluetooth: L2CAP socket layer initializedBluetooth: SCO socket
layer initializedclocksource: Switched to clocksource arch_sys_counterNET:
Registered PF_INET protocol familyIP idents hash table entries: 16384
(order: 5, 131072 bytes, linear)tcp_listen_portaddr_hash hash table
entries: 512 (order: 1, 8192 bytes, linear)Table-perturb hash table
entries: 65536 (order: 6, 262144 bytes, linear)TCP established hash table
entries: 8192 (order: 4, 65536 bytes, linear)TCP bind hash table entries:
8192 (order: 5, 131072 bytes, linear)TCP: Hash tables configured
(established 8192 bind 8192)UDP hash table entries: 512 (order: 2, 16384
bytes, linear)UDP-Lite hash table entries: 512 (order: 2, 16384 bytes,
linear)NET: Registered PF_UNIX/PF_LOCAL protocol familyRPC: Registered
named UNIX socket transport module.RPC: Registered udp transport
module.RPC: Registered tcp transport module.RPC: Registered tcp NFSv4.1
backchannel transport module.PCI: CLS 0 bytes, default 64Initialise system
trusted keyringsworkingset: timestamp_bits=3D46 max_order=3D18
bucket_order=3D0NFS: Registering the id_resolver key typeKey type id_resolv=
er
registeredKey type id_legacy registeredKey type cifs.idmap registeredxor:
measuring software checksum speed   8regs           :  2522 MB/sec   32regs
         :  2865 MB/sec   arm64_neon      :  2319 MB/secxor: using
function: 32regs (2865 MB/sec)async_tx: api initialized (async)Key type
asymmetric registeredAsymmetric key parser 'x509' registeredBlock layer
SCSI generic (bsg) driver version 0.4 loaded (major 249)io scheduler
mq-deadline registeredio scheduler kyber registeredxen:xen_evtchn:
Event-channel device installedSerial: 8250/16550 driver, 1 ports, IRQ
sharing enabledcacheinfo: Unable to detect cache hierarchy for CPU 0brd:
module loadedloop: module loadedInvalid max_queues (4), will use default
max: 1.xen_netfront: Initialising Xen virtual ethernet driverusbcore:
registered new interface driver lan78xxusbcore: registered new interface
driver asixusbcore: registered new interface driver ax88179_178ausbcore:
registered new interface driver cdc_etherusbcore: registered new interface
driver smsc95xxusbcore: registered new interface driver net1080usbcore:
registered new interface driver cdc_subsetusbcore: registered new interface
driver zaurususbcore: registered new interface driver cdc_ncmusbcore:
registered new interface driver aqc111usbcore: registered new interface
driver usb-storagedevice-mapper: ioctl: 4.45.0-ioctl (2021-03-22)
initialised: dm-devel@redhat.com <dm-devel@redhat.com>sdhci: Secure Digital
Host Controller Interface driversdhci: Copyright(c) Pierre
Ossmansdhci-pltfm: SDHCI platform and OF driver helperusbcore: registered
new interface driver usbhidusbhid: USB HID core driveru32 classifier
input device check on    Actions configuredNET: Registered PF_INET6
protocol familySegment Routing with IPv6In-situ OAM (IOAM) with IPv6sit:
IPv6, IPv4 and MPLS over IPv4 tunneling driverNET: Registered PF_PACKET
protocol familyBridge firewalling registeredlib80211: common routines for
IEEE802.11 driversKey type dns_resolver registeredLoading compiled-in X.509
certificatesKey type ._fscrypt registeredKey type .fscrypt registeredKey
type fscrypt-provisioning registeredBtrfs loaded, crc32c=3Dcrc32c-generic,
zoned=3Dno, fsverity=3DnoKey type encrypted registeredxen_netfront: backend
supports XDP headroomblkfront: xvda: flush diskcache: enabled; persistent
grants: enabled; indirect descriptors: enabled; bounce buffer:
enabledprintk: console [netcon0] enablednetconsole: network logging
startedmd: Waiting for all devices to be available before autodetectmd: If
you don't use raid, use raid=3Dnoautodetectmd: Autodetecting RAID arrays.md=
:
autorun ...md: ... autorun DONE.EXT4-fs (xvda): mounting ext3 file system
using the ext4 subsystemEXT4-fs (xvda): INFO: recovery required on readonly
filesystemEXT4-fs (xvda): write access will be enabled during
recoveryEXT4-fs (xvda): recovery completeEXT4-fs (xvda): mounted filesystem
with ordered data mode. Opts: (null). Quota mode: disabled.VFS: Mounted
root (ext3 filesystem) readonly on device 202:0.devtmpfs: mountedFreeing
unused kernel memory: 4160KRun /sbin/init as init processINIT: version 3.01
bootingStarting udevudevd[128]: starting version 3.2.10udevd[129]: starting
eudev-3.2.10EXT4-fs (xvda): re-mounted. Opts: (null). Quota mode:
disabled.INIT: Entering runlevel: 5Configuring network interfaces...
udhcpc: started, v1.35.0udhcpc: broadcasting discoverIPv6: eth0: IPv6
duplicate address fe80::e65f:1ff:fecd:7bdb used by e4:5f:01:cd:7b:db
detected!udhcpc: broadcasting discoverudhcpc: broadcasting discoverudhcpc:
no lease, failingifup: failed to bring up eth0Starting syslogd/klogd:
doneStarting domain watchdog daemon: [  OK  ]INIT: cannot execute
"/sbin/getty-wrapper"INIT: cannot execute "/sbin/getty-wrapper"INIT: cannot
execute "/sbin/getty-wrapper"INIT: cannot execute
"/sbin/getty-wrapper"INIT: cannot execute "/sbin/getty-wrapper"INIT: cannot
execute "/sbin/getty-wrapper"INIT: cannot execute
"/sbin/getty-wrapper"INIT: cannot execute "/sbin/getty-wrapper"INIT: cannot
execute "/sbin/getty-wrapper"INIT: cannot execute
"/sbin/getty-wrapper"INIT: Id "X0" respawning too fast: disabled for 5
minutes*

Regards,
Vipul Kumar

On Thu, Aug 25, 2022 at 2:58 PM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Vipul,
>
> > On 25 Aug 2022, at 09:56, Vipul Suneja <vsuneja63@gmail.com> wrote:
> >
> > Hi Bertrand,
> >
> > Thanks!
> >
> > No, I couldn't see /dev/loop0. Can you please guide me to create it?
>
> First thing to try is =E2=80=9Cmodprobe loop"
>
> It that does not work (ie module not found) you should check in your linu=
x
> config if BLK_DEV_LOOP is enabled.
>
> >
> > I didn't change dom0 configurations, it's default generated by yocto.
> >
> > I will append this "IMAGE_FSTYPES:append =3D " wic.gz=E2=80=9D" in loca=
l.conf &
> will update you.
> >
>
> Cheers
> Bertrand
>
> > Regards,
> > Vipul Kumar
> >
> > On Thu, Aug 25, 2022 at 1:25 PM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > Hi Vipul,
> >
> > > On 25 Aug 2022, at 08:31, Vipul Suneja <vsuneja63@gmail.com> wrote:
> > >
> > > Hi Stefano,
> > >
> > > Thanks!
> > >
> > > As suggested, I changed the guest1.cfg file. Below are the contents o=
f
> config file
> > >
> > > kernel =3D "/home/root/Image"
> > > cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console root=3D/de=
v/xvda"
> > > memory =3D "1024"
> > > name =3D "guest1"
> > > vcpus =3D 1
> > > serial=3D"pty"
> > > disk =3D [
> 'file:/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3,xvda,w' ]
> > > vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront', ]
> > >
> > > Its failing with below logs:
> > >
> > > root@raspberrypi4-64:~# xl create -c guest1.cfg
> > > Parsing config from guest1.cfg
> > > Invalid parameter `type'.
> > > libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
> /etc/xen/scripts/block add [742] exited with error status 1
> > > libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb:
> script: losetup /dev/loop0
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 failed
> > > libxl: error: libxl_create.c:1643:domcreate_launch_dm: Domain 1:unabl=
e
> to add disk devices
> > > libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus:
> /etc/xen/scripts/block remove [793] exited with error status 1
> > > libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb:
> script: /etc/xen/scripts/block failed; error detected.
> > > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 1:Non-existant domain
> > > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> > > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 1:Destruction of domain failed
> >
> > I think you have a loop issue.
> >
> > Could you check if /dev/loop0 exists ?
> >
> > Did you change something on the dom0 linux configuration generated by
> Yocto ?
> >
> > We are using Yocto on RPI4 here without any issue like that, only
> difference with
> > your setup is that we generate a wic image to have a real disk image
> instead of
> > using the ext3/ext4 one.
> >
> > Should be possible to do the same on your side by adding the following
> in local.conf:
> > IMAGE_FSTYPES:append =3D " wic.gz=E2=80=9D
> >
> > >
> > > Even after removing 'type=3Dnetfront' from vif it's failing.
> >
> > This option is only for hvm on x86, so you can remove it from your
> configuration.
> >
> > > One more doubt here, could this mac address be a dummy or actual here=
?
> >
> > This is a dummy one you set for the guest network interface and this is
> the Mac
> >  address other devices on your network will see so it must be fully
> valid (and
> >  not conflicting with other devices on your network).
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Regards,
> > > Vipul Kumar
> > >
> > > On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> > > On Wed, 24 Aug 2022, Vipul Suneja wrote:
> > > > Hi Bertrand,
> > > > Thanks for your response!
> > > >
> > > > I builded the guest image on yocto kirkstone source which has FSTYP=
E
> ext3. Guest image generated is
> > > > xen-guest-image-minimal-raspberrypi4-64.ext3.
> > > > Below is the content of guest.cfg file
> > > >
> > > >    kernel =3D "/home/root/Image"
> > > >    cmdline =3D "console=3Dhvc0 earlyprintk=3Dxen sync_console
> root=3D/dev/xvda"
> > > >    memory =3D "256"
> > > >    name =3D "guest1"
> > > >    vcpus =3D 1
> > > >    serial=3D"pty"
> > > >    disk =3D [ 'phy:/dev/loop0,xvda,w' ]
> > > >    vif=3D[ 'mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfront=
', ]
> > > >
> > > > I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 t=
o
> a virtual device & then will run the guest VM by command "xl create -c
> > > > guest.cfg". But facing issue while trying to mount.
> > >
> > > You don't actually need to mount
> > > xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to ru=
n
> > > your guest VM with "xl create".
> > >
> > > It is enough to do this instead, as Bertrand suggested:
> > >
> > >
> disk=3D["file:/path/to/file/xen-guest-image-minimal-raspberrypi4-64.ext3,=
xvda,w"]
> > >
> > > No need to call losetup or mount. Just xl create -c.
> > >
> > > More answers below.
> > >
> > >
> > > > Regards,
> > > > Vipul Kumar
> > > >
> > > > On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > > >       Hi Vipul,
> > > >
> > > >       > On 24 Aug 2022, at 15:16, Vipul Suneja <vsuneja63@gmail.com=
>
> wrote:
> > > >       >
> > > >       > Hi,
> > > >       >
> > > >       > I am porting xen hypervisor on rpi4 with yocto kirkstone
> sources. Followed the basic steps to build xen-image-minimal &
> > > >       xen-guest-image-minimal. I could flash sd card with xen
> minimal image & could see dom0 up. I copied "Image",
> > > >       "xen-guest-image-minimal" .ext3 file & guest.cfg to
> "/home/root". After that created a bridge with below step:
> > > >       >
> > > >       > killall -SIGUSR2 udhcpc
> > > >       > brctl addbr xenbr0
> > > >       > brctl addif xenbr0 eth0
> > > >       > killall udhcpc
> > > >       > udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0
> > > >       >
> > > >       > Could see the xenbr0 interface up.
> > > >       > After that while mounting the guest file system it shows no
> such file or directory but the file is already there.
> > > >       >
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> > > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>    247 Mar  9 12:37 guest1.cfg
> > > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# chmod 0777
> xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
> > > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
> 24652288 Mar  9 12:36 Image
> > > >       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root
>    247 Mar  9 12:37 guest1.cfg
> > > >       > [23:40:15] <Guest9046> -rwxrwxrwx    1 root     root
>  868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> losetup:
> xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
> > > >       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup
> /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
> > > >       > [23:40:15] <Guest9046> losetup:
> /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or
> directory
> > >
> > > It looks like either
> > > /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn't exist
> or
> > > /dev/loop0 doesn't exist
> > >
> > >
> > > >       Why do you want to mount the file system ?
> > > >
> > > >       Anyway this is not related to Xen, I guess you could start
> without xen and still not manage to mount the file like that (linux
> > > >       configuration issue ?)
> > > >
> > > >       What is the content of you guest.cfg
> > > >       How do you want to pass the guest root file system ?
> > > >
> > > >       Yocto should actually generate an img file and you could use
> it by having something like this in your guest.cfg:
> > > >       disk=3D["file:/home/root/guest1.img,xvda,w=E2=80=9D]
> > > >
> > > >       Cheers
> > > >       Bertrand
> > > >
> > > >       >
> > > >       > Any input on this issue will be really helpful, expecting
> your response.
> > > >       >
> > > >       > Thanks & Regards,
> > > >       > Vipul Kumar
> > > >
> > > >
> > > >
> >
>
>

--00000000000006453605e75c3883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bertrand,<div><br></div><div>Thanks for your support!</=
div><div><br></div><div>As suggested, I enabled BLK_DEV_LOOP in the kernel =
&amp; now I can see loop devices in the &quot;/dev&quot; directory.=C2=A0</=
div><div>I could see xen-guest-image-minimal loading but at the end it&#39;=
s throwing error <b style=3D"">INIT: cannot execute &quot;/sbin/getty-wrapp=
er&quot;</b></div><div><b style=3D""><br></b></div><div>I found start_getty=
 in the image but getty-wrapper is not there. while exploring source could =
see getty-wrapper in meta-virtualization sysvinit,</div><div>but start_gett=
y is in poky sysvinit.=C2=A0</div><div>Any suggestions=C2=A0on this issue? =
Adding full logs below for reference:</div><div><br></div><div><b>root@rasp=
berrypi4-64:~# xl create -c guest1.cfg <br>Parsing config from guest1.cfg<b=
r>Booting Linux on physical CPU 0x0000000000 [0x410fd083]<br>Linux version =
5.15.54-yocto-standard (oe-user@oe-host) (aarch64-poky-linux-gcc (GCC) 11.3=
.0, GNU ld (GNU Binutils) 2.38.20220623) #1 SMP PREEMPT Thu Jul 14 18:52:13=
 UTC 2022<br>random: crng init done<br>Machine model: XENVM-4.16<br>Xen 4.1=
6 support found<br>efi: UEFI not found.<br>Zone ranges:<br>=C2=A0 DMA =C2=
=A0 =C2=A0 =C2=A0[mem 0x0000000040000000-0x000000007fffffff]<br>=C2=A0 DMA3=
2 =C2=A0 =C2=A0empty<br>=C2=A0 Normal =C2=A0 empty<br>Movable zone start fo=
r each node<br>Early memory node ranges<br>=C2=A0 node =C2=A0 0: [mem 0x000=
0000040000000-0x000000007fffffff]<br>Initmem setup node 0 [mem 0x0000000040=
000000-0x000000007fffffff]<br>cma: Reserved 16 MiB at 0x000000007dc00000<br=
>psci: probing for conduit method from DT.<br>psci: PSCIv1.1 detected in fi=
rmware.<br>psci: Using standard PSCI v0.2 function IDs<br>psci: Trusted OS =
migration not required<br>psci: SMC Calling Convention v1.1<br>percpu: Embe=
dded 27 pages/cpu s70360 r8192 d32040 u110592<br>Detected PIPT I-cache on C=
PU0<br>CPU features: detected: Spectre-v2<br>CPU features: detected: Spectr=
e-v4<br>CPU features: detected: Spectre-BHB<br>CPU features: detected: ARM =
errata 1165522, 1319367, or 1530923<br>Built 1 zonelists, mobility grouping=
 on.=C2=A0 Total pages: 258048<br>Kernel command line: console=3Dhvc0 early=
printk=3Dxen sync_console root=3D/dev/xvda<br>Unknown kernel command line p=
arameters &quot;sync_console earlyprintk=3Dxen&quot;, will be passed to use=
r space.<br>Dentry cache hash table entries: 131072 (order: 8, 1048576 byte=
s, linear)<br>Inode-cache hash table entries: 65536 (order: 7, 524288 bytes=
, linear)<br>mem auto-init: stack:off, heap alloc:off, heap free:off<br>Mem=
ory: 985220K/1048576K available (13376K kernel code, 2060K rwdata, 4372K ro=
data, 4160K init, 714K bss, 46972K reserved, 16384K cma-reserved)<br>SLUB: =
HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1<br>ftrace: a=
llocating 41866 entries in 164 pages<br>ftrace: allocated 164 pages with 3 =
groups<br>trace event string verifier disabled<br>rcu: Preemptible hierarch=
ical RCU implementation.<br>rcu: 	RCU event tracing is enabled.<br>rcu: 	RC=
U restricting CPUs from NR_CPUS=3D4 to nr_cpu_ids=3D1.<br>	Trampoline varia=
nt of Tasks RCU enabled.<br>	Rude variant of Tasks RCU enabled.<br>	Tracing=
 variant of Tasks RCU enabled.<br>rcu: RCU calculated value of scheduler-en=
listment delay is 25 jiffies.<br>rcu: Adjusting geometry for rcu_fanout_lea=
f=3D16, nr_cpu_ids=3D1<br>NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br=
>Root IRQ handler: gic_handle_irq<br>kfence: initialized - using 2097152 by=
tes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)<br>arch_timer:=
 cp15 timer(s) running at 54.00MHz (virt).<br>clocksource: arch_sys_counter=
: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123=
 ns<br>sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 43980465=
11102ns<br>Console: colour dummy device 80x25<br>printk: console [hvc0] ena=
bled<br>Calibrating delay loop (skipped), value calculated using timer freq=
uency.. 108.00 BogoMIPS (lpj=3D216000)<br>pid_max: default: 32768 minimum: =
301<br>LSM: Security Framework initializing<br>landlock: Up and running.<br=
>Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)<br>Mo=
untpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)<br>=
xen:grant_table: Grant tables using version 1 layout<br>Grant table initial=
ized<br>xen:events: Using FIFO-based ABI<br>Xen: initializing cpu0<br>rcu: =
Hierarchical SRCU implementation.<br>EFI services will not be available.<br=
>smp: Bringing up secondary CPUs ...<br>smp: Brought up 1 node, 1 CPU<br>SM=
P: Total of 1 processors activated.<br>CPU features: detected: 32-bit EL0 S=
upport<br>CPU features: detected: CRC32 instructions<br>CPU: All CPU(s) sta=
rted at EL1<br>alternatives: patching kernel code<br>devtmpfs: initialized<=
br>clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_=
ns: 7645041785100000 ns<br>futex hash table entries: 256 (order: 2, 16384 b=
ytes, linear)<br>pinctrl core: initialized pinctrl subsystem<br>DMI not pre=
sent or invalid.<br>NET: Registered PF_NETLINK/PF_ROUTE protocol family<br>=
DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations<br>DMA: pr=
eallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations<br>DMA: p=
reallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations<br>the=
rmal_sys: Registered thermal governor &#39;step_wise&#39;<br>hw-breakpoint:=
 found 6 breakpoint and 4 watchpoint registers.<br>ASID allocator initialis=
ed with 65536 entries<br>Serial: AMBA PL011 UART driver<br>raid6: neonx8 =
=C2=A0 gen() =C2=A01585 MB/s<br>raid6: neonx8 =C2=A0 xor() =C2=A01177 MB/s<=
br>raid6: neonx4 =C2=A0 gen() =C2=A01701 MB/s<br>raid6: neonx4 =C2=A0 xor()=
 =C2=A01279 MB/s<br>raid6: neonx2 =C2=A0 gen() =C2=A01473 MB/s<br>raid6: ne=
onx2 =C2=A0 xor() =C2=A01161 MB/s<br>raid6: neonx1 =C2=A0 gen() =C2=A01131 =
MB/s<br>raid6: neonx1 =C2=A0 xor() =C2=A0 929 MB/s<br>raid6: int64x8 =C2=A0=
gen() =C2=A0 946 MB/s<br>raid6: int64x8 =C2=A0xor() =C2=A0 555 MB/s<br>raid=
6: int64x4 =C2=A0gen() =C2=A0 985 MB/s<br>raid6: int64x4 =C2=A0xor() =C2=A0=
 570 MB/s<br>raid6: int64x2 =C2=A0gen() =C2=A0 914 MB/s<br>raid6: int64x2 =
=C2=A0xor() =C2=A0 506 MB/s<br>raid6: int64x1 =C2=A0gen() =C2=A0 714 MB/s<b=
r>raid6: int64x1 =C2=A0xor() =C2=A0 377 MB/s<br>raid6: using algorithm neon=
x4 gen() 1701 MB/s<br>raid6: .... xor() 1279 MB/s, rmw enabled<br>raid6: us=
ing neon recovery algorithm<br>xen:balloon: Initialising balloon driver<br>=
iommu: Default domain type: Translated <br>iommu: DMA domain TLB invalidati=
on policy: strict mode <br>vgaarb: loaded<br>SCSI subsystem initialized<br>=
usbcore: registered new interface driver usbfs<br>usbcore: registered new i=
nterface driver hub<br>usbcore: registered new device driver usb<br>pps_cor=
e: LinuxPPS API ver. 1 registered<br>pps_core: Software ver. 5.3.6 - Copyri=
ght 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it">gio=
metti@linux.it</a>&gt;<br>PTP clock support registered<br>Bluetooth: Core v=
er 2.22<br>NET: Registered PF_BLUETOOTH protocol family<br>Bluetooth: HCI d=
evice and connection manager initialized<br>Bluetooth: HCI socket layer ini=
tialized<br>Bluetooth: L2CAP socket layer initialized<br>Bluetooth: SCO soc=
ket layer initialized<br>clocksource: Switched to clocksource arch_sys_coun=
ter<br>NET: Registered PF_INET protocol family<br>IP idents hash table entr=
ies: 16384 (order: 5, 131072 bytes, linear)<br>tcp_listen_portaddr_hash has=
h table entries: 512 (order: 1, 8192 bytes, linear)<br>Table-perturb hash t=
able entries: 65536 (order: 6, 262144 bytes, linear)<br>TCP established has=
h table entries: 8192 (order: 4, 65536 bytes, linear)<br>TCP bind hash tabl=
e entries: 8192 (order: 5, 131072 bytes, linear)<br>TCP: Hash tables config=
ured (established 8192 bind 8192)<br>UDP hash table entries: 512 (order: 2,=
 16384 bytes, linear)<br>UDP-Lite hash table entries: 512 (order: 2, 16384 =
bytes, linear)<br>NET: Registered PF_UNIX/PF_LOCAL protocol family<br>RPC: =
Registered named UNIX socket transport module.<br>RPC: Registered udp trans=
port module.<br>RPC: Registered tcp transport module.<br>RPC: Registered tc=
p NFSv4.1 backchannel transport module.<br>PCI: CLS 0 bytes, default 64<br>=
Initialise system trusted keyrings<br>workingset: timestamp_bits=3D46 max_o=
rder=3D18 bucket_order=3D0<br>NFS: Registering the id_resolver key type<br>=
Key type id_resolver registered<br>Key type id_legacy registered<br>Key typ=
e cifs.idmap registered<br>xor: measuring software checksum speed<br>=C2=A0=
 =C2=A08regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A02522 MB/sec<br>=C2=
=A0 =C2=A032regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A02865 MB/sec<br>=
=C2=A0 =C2=A0arm64_neon =C2=A0 =C2=A0 =C2=A0: =C2=A02319 MB/sec<br>xor: usi=
ng function: 32regs (2865 MB/sec)<br>async_tx: api initialized (async)<br>K=
ey type asymmetric registered<br>Asymmetric key parser &#39;x509&#39; regis=
tered<br>Block layer SCSI generic (bsg) driver version 0.4 loaded (major 24=
9)<br>io scheduler mq-deadline registered<br>io scheduler kyber registered<=
br>xen:xen_evtchn: Event-channel device installed<br>Serial: 8250/16550 dri=
ver, 1 ports, IRQ sharing enabled<br>cacheinfo: Unable to detect cache hier=
archy for CPU 0<br>brd: module loaded<br>loop: module loaded<br>Invalid max=
_queues (4), will use default max: 1.<br>xen_netfront: Initialising Xen vir=
tual ethernet driver<br>usbcore: registered new interface driver lan78xx<br=
>usbcore: registered new interface driver asix<br>usbcore: registered new i=
nterface driver ax88179_178a<br>usbcore: registered new interface driver cd=
c_ether<br>usbcore: registered new interface driver smsc95xx<br>usbcore: re=
gistered new interface driver net1080<br>usbcore: registered new interface =
driver cdc_subset<br>usbcore: registered new interface driver zaurus<br>usb=
core: registered new interface driver cdc_ncm<br>usbcore: registered new in=
terface driver aqc111<br>usbcore: registered new interface driver usb-stora=
ge<br>device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: <a href=
=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</a><br>sdhci: Secure Di=
gital Host Controller Interface driver<br>sdhci: Copyright(c) Pierre Ossman=
<br>sdhci-pltfm: SDHCI platform and OF driver helper<br>usbcore: registered=
 new interface driver usbhid<br>usbhid: USB HID core driver<br>u32 classifi=
er<br>=C2=A0 =C2=A0 input device check on<br>=C2=A0 =C2=A0 Actions configur=
ed<br>NET: Registered PF_INET6 protocol family<br>Segment Routing with IPv6=
<br>In-situ OAM (IOAM) with IPv6<br>sit: IPv6, IPv4 and MPLS over IPv4 tunn=
eling driver<br>NET: Registered PF_PACKET protocol family<br>Bridge firewal=
ling registered<br>lib80211: common routines for IEEE802.11 drivers<br>Key =
type dns_resolver registered<br>Loading compiled-in X.509 certificates<br>K=
ey type ._fscrypt registered<br>Key type .fscrypt registered<br>Key type fs=
crypt-provisioning registered<br>Btrfs loaded, crc32c=3Dcrc32c-generic, zon=
ed=3Dno, fsverity=3Dno<br>Key type encrypted registered<br>xen_netfront: ba=
ckend supports XDP headroom<br>blkfront: xvda: flush diskcache: enabled; pe=
rsistent grants: enabled; indirect descriptors: enabled; bounce buffer: ena=
bled<br>printk: console [netcon0] enabled<br>netconsole: network logging st=
arted<br>md: Waiting for all devices to be available before autodetect<br>m=
d: If you don&#39;t use raid, use raid=3Dnoautodetect<br>md: Autodetecting =
RAID arrays.<br>md: autorun ...<br>md: ... autorun DONE.<br>EXT4-fs (xvda):=
 mounting ext3 file system using the ext4 subsystem<br>EXT4-fs (xvda): INFO=
: recovery required on readonly filesystem<br>EXT4-fs (xvda): write access =
will be enabled during recovery<br>EXT4-fs (xvda): recovery complete<br>EXT=
4-fs (xvda): mounted filesystem with ordered data mode. Opts: (null). Quota=
 mode: disabled.<br>VFS: Mounted root (ext3 filesystem) readonly on device =
202:0.<br>devtmpfs: mounted<br>Freeing unused kernel memory: 4160K<br>Run /=
sbin/init as init process<br>INIT: version 3.01 booting<br>Starting udev<br=
>udevd[128]: starting version 3.2.10<br>udevd[129]: starting eudev-3.2.10<b=
r>EXT4-fs (xvda): re-mounted. Opts: (null). Quota mode: disabled.<br>INIT: =
Entering runlevel: 5<br>Configuring network interfaces... udhcpc: started, =
v1.35.0<br>udhcpc: broadcasting discover<br>IPv6: eth0: IPv6 duplicate addr=
ess fe80::e65f:1ff:fecd:7bdb used by e4:5f:01:cd:7b:db detected!<br>udhcpc:=
 broadcasting discover<br>udhcpc: broadcasting discover<br>udhcpc: no lease=
, failing<br>ifup: failed to bring up eth0<br>Starting syslogd/klogd: done<=
br>Starting domain watchdog daemon: [ =C2=A0OK =C2=A0]<br>INIT: cannot exec=
ute &quot;/sbin/getty-wrapper&quot;<br>INIT: cannot execute &quot;/sbin/get=
ty-wrapper&quot;<br>INIT: cannot execute &quot;/sbin/getty-wrapper&quot;<br=
>INIT: cannot execute &quot;/sbin/getty-wrapper&quot;<br>INIT: cannot execu=
te &quot;/sbin/getty-wrapper&quot;<br>INIT: cannot execute &quot;/sbin/gett=
y-wrapper&quot;<br>INIT: cannot execute &quot;/sbin/getty-wrapper&quot;<br>=
INIT: cannot execute &quot;/sbin/getty-wrapper&quot;<br>INIT: cannot execut=
e &quot;/sbin/getty-wrapper&quot;<br>INIT: cannot execute &quot;/sbin/getty=
-wrapper&quot;<br>INIT: Id &quot;X0&quot; respawning too fast: disabled for=
 5 minutes</b><br></div><div><b><br></b></div><div>Regards,</div><div>Vipul=
 Kumar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Aug 25, 2022 at 2:58 PM Bertrand Marquis &lt;<a href=3D=
"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vipul,<br>
<br>
&gt; On 25 Aug 2022, at 09:56, Vipul Suneja &lt;<a href=3D"mailto:vsuneja63=
@gmail.com" target=3D"_blank">vsuneja63@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Bertrand,<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; No, I couldn&#39;t see /dev/loop0. Can you please guide me to create i=
t?<br>
<br>
First thing to try is =E2=80=9Cmodprobe loop&quot;<br>
<br>
It that does not work (ie module not found) you should check in your linux =
config if BLK_DEV_LOOP is enabled.<br>
<br>
&gt; <br>
&gt; I didn&#39;t change dom0 configurations, it&#39;s default generated by=
 yocto.<br>
&gt;=C2=A0 <br>
&gt; I will append this &quot;IMAGE_FSTYPES:append =3D &quot; wic.gz=E2=80=
=9D&quot; in local.conf &amp; will update you.<br>
&gt; <br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; Regards,<br>
&gt; Vipul Kumar<br>
&gt; <br>
&gt; On Thu, Aug 25, 2022 at 1:25 PM Bertrand Marquis &lt;<a href=3D"mailto=
:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&g=
t; wrote:<br>
&gt; Hi Vipul,<br>
&gt; <br>
&gt; &gt; On 25 Aug 2022, at 08:31, Vipul Suneja &lt;<a href=3D"mailto:vsun=
eja63@gmail.com" target=3D"_blank">vsuneja63@gmail.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Hi Stefano,<br>
&gt; &gt; <br>
&gt; &gt; Thanks!<br>
&gt; &gt; <br>
&gt; &gt; As suggested, I changed the guest1.cfg file. Below are the conten=
ts of config file<br>
&gt; &gt; <br>
&gt; &gt; kernel =3D &quot;/home/root/Image&quot;<br>
&gt; &gt; cmdline =3D &quot;console=3Dhvc0 earlyprintk=3Dxen sync_console r=
oot=3D/dev/xvda&quot;<br>
&gt; &gt; memory =3D &quot;1024&quot;<br>
&gt; &gt; name =3D &quot;guest1&quot;<br>
&gt; &gt; vcpus =3D 1<br>
&gt; &gt; serial=3D&quot;pty&quot;<br>
&gt; &gt; disk =3D [ &#39;file:/home/root/xen-guest-image-minimal-raspberry=
pi4-64.ext3,xvda,w&#39; ]<br>
&gt; &gt; vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dxenbr0,type=3Dnetfr=
ont&#39;, ]<br>
&gt; &gt; <br>
&gt; &gt; Its failing with below logs:<br>
&gt; &gt; <br>
&gt; &gt; root@raspberrypi4-64:~# xl create -c guest1.cfg <br>
&gt; &gt; Parsing config from guest1.cfg<br>
&gt; &gt; Invalid parameter `type&#39;.<br>
&gt; &gt; libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: /et=
c/xen/scripts/block add [742] exited with error status 1<br>
&gt; &gt; libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: =
script: losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-=
64.ext3 failed<br>
&gt; &gt; libxl: error: libxl_create.c:1643:domcreate_launch_dm: Domain 1:u=
nable to add disk devices<br>
&gt; &gt; libxl: error: libxl_exec.c:117:libxl_report_child_exitstatus: /et=
c/xen/scripts/block remove [793] exited with error status 1<br>
&gt; &gt; libxl: error: libxl_device.c:1265:device_hotplug_child_death_cb: =
script: /etc/xen/scripts/block failed; error detected.<br>
&gt; &gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:=
Non-existant domain<br>
&gt; &gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain=
 1:Unable to destroy guest<br>
&gt; &gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Des=
truction of domain failed<br>
&gt; <br>
&gt; I think you have a loop issue.<br>
&gt; <br>
&gt; Could you check if /dev/loop0 exists ?<br>
&gt; <br>
&gt; Did you change something on the dom0 linux configuration generated by =
Yocto ?<br>
&gt; <br>
&gt; We are using Yocto on RPI4 here without any issue like that, only diff=
erence with<br>
&gt; your setup is that we generate a wic image to have a real disk image i=
nstead of<br>
&gt; using the ext3/ext4 one.<br>
&gt; <br>
&gt; Should be possible to do the same on your side by adding the following=
 in local.conf:<br>
&gt; IMAGE_FSTYPES:append =3D &quot; wic.gz=E2=80=9D<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Even after removing &#39;type=3Dnetfront&#39; from vif it&#39;s f=
ailing. <br>
&gt; <br>
&gt; This option is only for hvm on x86, so you can remove it from your con=
figuration.<br>
&gt; <br>
&gt; &gt; One more doubt here, could this mac address be a dummy or actual =
here?<br>
&gt; <br>
&gt; This is a dummy one you set for the guest network interface and this i=
s the Mac<br>
&gt;=C2=A0 address other devices on your network will see so it must be ful=
ly valid (and<br>
&gt;=C2=A0 not conflicting with other devices on your network).<br>
&gt; <br>
&gt; Cheers<br>
&gt; Bertrand<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Vipul Kumar<br>
&gt; &gt; <br>
&gt; &gt; On Thu, Aug 25, 2022 at 2:36 AM Stefano Stabellini &lt;<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
>&gt; wrote:<br>
&gt; &gt; On Wed, 24 Aug 2022, Vipul Suneja wrote:<br>
&gt; &gt; &gt; Hi Bertrand,<br>
&gt; &gt; &gt; Thanks for your response!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I builded the guest image on yocto kirkstone source which ha=
s FSTYPE ext3. Guest image generated is<br>
&gt; &gt; &gt; xen-guest-image-minimal-raspberrypi4-64.ext3.<br>
&gt; &gt; &gt; Below is the content of guest.cfg file<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 kernel =3D &quot;/home/root/Image&quot; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 cmdline =3D &quot;console=3Dhvc0 earlyprintk=3D=
xen sync_console root=3D/dev/xvda&quot; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 memory =3D &quot;256&quot; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 name =3D &quot;guest1&quot; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 vcpus =3D 1 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 serial=3D&quot;pty&quot; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 disk =3D [ &#39;phy:/dev/loop0,xvda,w&#39; ] <b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 vif=3D[ &#39;mac=3D00:11:22:66:88:22,bridge=3Dx=
enbr0,type=3Dnetfront&#39;, ]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I am trying to mount xen-guest-image-minimal-raspberrypi4-64=
.ext3 to a virtual device &amp; then will run the guest VM by command &quot=
;xl create -c<br>
&gt; &gt; &gt; guest.cfg&quot;. But facing issue while trying to mount. <br=
>
&gt; &gt; <br>
&gt; &gt; You don&#39;t actually need to mount<br>
&gt; &gt; xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it t=
o run<br>
&gt; &gt; your guest VM with &quot;xl create&quot;. <br>
&gt; &gt; <br>
&gt; &gt; It is enough to do this instead, as Bertrand suggested:<br>
&gt; &gt; <br>
&gt; &gt; disk=3D[&quot;file:/path/to/file/xen-guest-image-minimal-raspberr=
ypi4-64.ext3,xvda,w&quot;]<br>
&gt; &gt; <br>
&gt; &gt; No need to call losetup or mount. Just xl create -c.<br>
&gt; &gt; <br>
&gt; &gt; More answers below.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Vipul Kumar<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis &lt;<a href=
=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm=
.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Vipul,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On 24 Aug 2022, at 15:16, Vip=
ul Suneja &lt;<a href=3D"mailto:vsuneja63@gmail.com" target=3D"_blank">vsun=
eja63@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am porting xen hypervisor o=
n rpi4 with yocto kirkstone sources. Followed the basic steps to build xen-=
image-minimal &amp;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen-guest-image-minimal. I could f=
lash sd card with xen minimal image &amp; could see dom0 up. I copied &quot=
;Image&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;xen-guest-image-minimal&quot=
; .ext3 file &amp; guest.cfg to &quot;/home/root&quot;. After that created =
a bridge with below step:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall -SIGUSR2 udhcpc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addbr xenbr0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; brctl addif xenbr0 eth0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; killall udhcpc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; udhcpc -R -b -p /var/run/udhc=
pc.xenbr0.pid -i xenbr0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Could see the xenbr0 interfac=
e up.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; After that while mounting the=
 guest file system it shows no such file or directory but the file is alrea=
dy there.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# ls -l<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
24652288 Mar=C2=A0 9 12:36 Image<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A08=
68220928 Mar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# chmod 0777 xen-guest-image-minimal-raspberrypi4-64.=
ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# ls -l<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
24652288 Mar=C2=A0 9 12:36 Image<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0247 Mar=C2=A0 9 12:37 guest1.cfg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
-rwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A08=
68220928 Mar=C2=A0 9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberr=
ypi4-64.ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
losetup: xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or dire=
ctory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minim=
al-raspberrypi4-64.ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
losetup: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such f=
ile or directory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~#<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~#<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~#<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minim=
al-raspberrypi4-64.ext3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [23:40:15] &lt;Guest9046&gt; =
losetup: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such f=
ile or directory<br>
&gt; &gt; <br>
&gt; &gt; It looks like either<br>
&gt; &gt; /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn&#39=
;t exist or<br>
&gt; &gt; /dev/loop0 doesn&#39;t exist<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Why do you want to mount the file =
system ?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyway this is not related to Xen,=
 I guess you could start without xen and still not manage to mount the file=
 like that (linux<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration issue ?)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What is the content of you guest.c=
fg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How do you want to pass the guest =
root file system ?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yocto should actually generate an =
img file and you could use it by having something like this in your guest.c=
fg:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk=3D[&quot;file:/home/root/gues=
t1.img,xvda,w=E2=80=9D]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Bertrand<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any input on this issue will =
be really helpful, expecting your response.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks &amp; Regards,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Vipul Kumar<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000006453605e75c3883--

