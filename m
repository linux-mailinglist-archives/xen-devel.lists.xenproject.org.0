Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC51C8F08
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:54:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFhpU-0005OO-3O; Wed, 02 Oct 2019 16:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=whiU=X3=prgmr.com=cmb@srs-us1.protection.inumbo.net>)
 id 1iFhpS-0005OJ-Io
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 16:50:18 +0000
X-Inumbo-ID: b395505c-e534-11e9-97fb-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by localhost (Halon) with ESMTPS
 id b395505c-e534-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 16:50:13 +0000 (UTC)
Received: from localhost (97-115-96-182.ptld.qwest.net [97.115.96.182])
 (Authenticated sender: cmb)
 by mail.prgmr.com (Postfix) with ESMTPSA id 1C1B7720087
 for <xen-devel@lists.xen.org>; Wed,  2 Oct 2019 17:45:12 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 1C1B7720087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1570052712;
 bh=HHfaEx1OyG1H6AYnvMKMUffBpUHeri+OymMZhwf3UWo=;
 h=From:To:Subject:References:Date:In-Reply-To:From;
 b=oJQnNTaOZBSKeH/POEeAKWKvGkhSxTdsBN2xJVNH6gtLi53c8M/NdTCGYsuM6Rc+o
 /r/ldnRW3Ssm4AwOPHFTaLb5OGNeZqp+kNN7ar9cGx7hx/oTvMLOuW99K/vgO0L/yq
 ah0yLA7herAdF19JTvB4HTjyn+yzCAGGX01D7C1k=
From: Chris Brannon <cmb@prgmr.com>
To: "xen-devel\@lists.xen.org" <xen-devel@lists.xen.org>
References: <aecc7e18-40ff-8bb8-467c-24bfe99ee8f1@prgmr.com>
 <470f5ce1-d43f-a5dd-a00d-e2ec339b06c0@suse.com>
Date: Wed, 02 Oct 2019 09:50:11 -0700
In-Reply-To: <470f5ce1-d43f-a5dd-a00d-e2ec339b06c0@suse.com> (Jan Beulich's
 message of "Mon, 23 Sep 2019 09:54:03 +0200")
Message-ID: <8736gb5by4.fsf@cmbmachine.messageid.invalid>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: Re: [Xen-devel] Crash with nested HVM and Linux v5.1+
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

--=-=-=
Content-Type: text/plain

Jan Beulich <jbeulich@suse.com> writes:

> On 21.09.2019 01:14, Sarah Newman wrote:
>> With nestedhvm=1, the L2 HVM guest is either hanging (Xen 4.8) or
>> crashing (Xen 4.12.1) the L1 Xen hypervisor with recent versions of
>> Linux. We
>> isolated the commit to:
>> 
>> commit 093ae8f9a86a974c920b613860f1f7fd5bbd70ab
>> Author: Borislav Petkov <bp@suse.de>
>> Date:   Thu Apr 12 13:11:36 2018 +0200
>
> Thanks for doing the bisection on the Linux side. Would you please also
> provide the actual data about the L1 Xen crash (i.e. a maximum
> verbosity L1 log of a debug build of Xen)? It might also turn out
> helpful if you could provide the corresponding L0 Xen log, assuming you
> have host access.

Typescripts are attached.
typescript-l1.txt contains the log of domain creation on the L1.
typescript-l0.txt contains both the log of domain creation on the L0,
and xl dmesg output from the L0.

Both the L0 and L1 are running debug builds of Xen 4.12.1.

-- Chris


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=typescript-l1.txt

Script started on Wed 02 Oct 2019 08:15:49 AM PDT
[cmb@nested-dom0 ~]$ sudo xl -vvvv create -F ~/crash.xl
Parsing config from /home/cmb/crash.xl
libxl: debug: libxl_create.c:1693:do_domain_create: Domain 0:ao 0x138bc50: create: how=(nil) callback=(nil) poller=0x1380b50
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hdd spec.backend=qdisk
libxl: debug: libxl_create.c:1018:initiate_domain_create: Domain 1:running bootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 1:not a PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x1381e68: deregister unregistered
domainbuilder: detail: xc_dom_allocate: cmdline="", features=""
domainbuilder: detail: xc_dom_kernel_file: filename="/usr/lib64/xen/boot/hvmloader"
domainbuilder: detail: xc_dom_malloc_filemap    : 609 kB
domainbuilder: detail: xc_dom_module_file: filename="/usr/lib64/xen/boot/ipxe.bin"
domainbuilder: detail: xc_dom_malloc_filemap    : 512 kB
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.12, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ... 
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=0x100000 memsz=0x67aa4
xc: detail: ELF: memory: 0x100000 -> 0x167aa4
domainbuilder: detail: xc_dom_mem_init: mem 512 MB, pages 0x20000 pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0x20000 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=0x0 end=0x20000000
domainbuilder: detail: xc_dom_malloc            : 1024 kB
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000200
xc: detail:   2MB PAGES: 0x00000000000000ff
xc: detail:   1GB PAGES: 0x0000000000000000
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x100+0x68 at 0x7fa020771000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 -> 0x168000  (pfn 0x100 + 0x68 pages)
xc: detail: ELF: phdr 0 at 0x7fa020709000 -> 0x7fa020766ec8
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x168+0x80 at 0x7fa01d392000
domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0x168000 -> 0x1e8000  (pfn 0x168 + 0x80 pages)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x1e8+0x1 at 0x7fa020902000
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x1e8000 -> 0x1e9000  (pfn 0x1e8 + 0x1 pages)
domainbuilder: detail: alloc_pgtables_hvm: doing nothing
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x1e9000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32 <= matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_64
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 1032 kB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 1121 kB
domainbuilder: detail:       domU mmap          : 932 kB
domainbuilder: detail: Adding module 0 guest_addr 168000 len 524288
domainbuilder: detail: vcpu_hvm: called
(XEN) HVM d1v0 save: CPU
(XEN) HVM d1 save: PIC
(XEN) HVM d1 save: IOAPIC
(XEN) HVM d1v0 save: LAPIC
(XEN) HVM d1v0 save: LAPIC_REGS
(XEN) HVM d1 save: PCI_IRQ
(XEN) HVM d1 save: ISA_IRQ
(XEN) HVM d1 save: PCI_LINK
(XEN) HVM d1 save: PIT
(XEN) HVM d1 save: RTC
(XEN) HVM d1 save: HPET
(XEN) HVM d1 save: PMTIMER
(XEN) HVM d1v0 save: MTRR
(XEN) HVM d1 save: VIRIDIAN_DOMAIN
(XEN) HVM d1v0 save: CPU_XSAVE
(XEN) HVM d1v0 save: VIRIDIAN_VCPU
(XEN) HVM d1v0 save: VMCE_VCPU
(XEN) HVM d1v0 save: TSC_ADJUST
(XEN) HVM d1v0 save: CPU_MSR
(XEN) HVM1 restore: CPU 0
domainbuilder: detail: compat_gnttab_hvm_seed: d1: pfn=0xff000
domainbuilder: detail: xc_dom_set_gnttab_entry: d1 gnt[0] -> d0 0xfefff
domainbuilder: detail: xc_dom_set_gnttab_entry: d1 gnt[1] -> d0 0xfeffc
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hdd spec.backend=qdisk
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x1383bb0: deregister unregistered
domainbuilder: detail: xc_dom_allocate: cmdline=" -d 1", features=""
libxl: debug: libxl_dom.c:799:libxl__build_pv: pv kernel mapped 0 path /usr/lib64/xen/boot/ioemu-stubdom.gz
domainbuilder: detail: xc_dom_kernel_file: filename="/usr/lib64/xen/boot/ioemu-stubdom.gz"
domainbuilder: detail: xc_dom_malloc_filemap    : 1435 kB
domainbuilder: detail: xc_dom_malloc            : 6500 kB
domainbuilder: detail: xc_dom_do_gunzip: unzip ok, 0x166e18 -> 0x659070
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.12, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ... 
domainbuilder: detail: xc_dom_probe_bzimage_kernel: kernel is not a bzImage
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ... 
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=0 memsz=0x566638
xc: detail: ELF: memory: 0 -> 0x566638
xc: detail: ELF: note: GUEST_OS = "Mini-OS"
xc: detail: ELF: note: LOADER = "generic"
xc: detail: ELF: note: HYPERCALL_PAGE = 0x2000
xc: detail: ELF: note: XEN_VERSION = "xen-3.0"
xc: detail: ELF: using notes from SHT_NOTE section
xc: detail: ELF: VIRT_BASE unset, using 0
xc: detail: ELF_PADDR_OFFSET unset, using 0
xc: detail: ELF: addresses:
xc: detail:     virt_base        = 0x0
xc: detail:     elf_paddr_offset = 0x0
xc: detail:     virt_offset      = 0x0
xc: detail:     virt_kstart      = 0x0
xc: detail:     virt_kend        = 0x566638
xc: detail:     virt_entry       = 0x0
xc: detail:     p2m_base         = 0xffffffffffffffff
domainbuilder: detail: xc_dom_parse_elf_kernel: xen-3.0-x86_64: 0x0 -> 0x566638
domainbuilder: detail: xc_dom_mem_init: mem 28 MB, pages 0x1c00 pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0x1c00 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: x86_compat: guest xen-3.0-x86_64, address size 64
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x0+0x567 at 0x7fa01c952000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x0 -> 0x567000  (pfn 0x0 + 0x567 pages)
xc: detail: ELF: phdr 0 at 0x7fa01c952000 -> 0x7fa01cabf188
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x567+0xe at 0x7fa02077d000
domainbuilder: detail: xc_dom_alloc_segment:   phys2mach    : 0x567000 -> 0x575000  (pfn 0x567 + 0xe pages)
domainbuilder: detail: xc_dom_alloc_page   :   start info   : 0x575000 (pfn 0x575)
domainbuilder: detail: xc_dom_alloc_page   :   xenstore     : 0x576000 (pfn 0x576)
domainbuilder: detail: xc_dom_alloc_page   :   console      : 0x577000 (pfn 0x577)
domainbuilder: detail: count_pgtables: 0x0000007fffffffff/39: 0x0000000000000000 -> 0x0000007fffffffff, 1 table(s)
domainbuilder: detail: count_pgtables: 0x000000003fffffff/30: 0x0000000000000000 -> 0x000000003fffffff, 1 table(s)
domainbuilder: detail: count_pgtables: 0x00000000001fffff/21: 0x0000000000000000 -> 0x00000000007fffff, 4 table(s)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x578+0x7 at 0x7fa020776000
domainbuilder: detail: xc_dom_alloc_segment:   page tables  : 0x578000 -> 0x57f000  (pfn 0x578 + 0x7 pages)
domainbuilder: detail: xc_dom_alloc_page   :   boot stack   : 0x57f000 (pfn 0x57f)
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x580000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x800000
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_64 <= matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_64
domainbuilder: detail: xc_dom_update_guest_p2m: dst 64bit, pages 0x1c00
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x575+0x1 at 0x7fa020902000
domainbuilder: detail: start_info_x86_64: called
domainbuilder: detail: setup_hypercall_page: vaddr=0x2000 pfn=0x2
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 6592 kB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 1435 kB
domainbuilder: detail:       domU mmap          : 5620 kB
domainbuilder: detail: bootlate_pv: shared_info: pfn 0x0, mfn 0x85ace
domainbuilder: detail: shared_info_x86_64: called
domainbuilder: detail: vcpu_x86_64: called
domainbuilder: detail: vcpu_x86_64: cr3: pfn 0x578 mfn 0x60f78
domainbuilder: detail: xc_dom_set_gnttab_entry: d2 gnt[0] -> d0 0x60f77
domainbuilder: detail: xc_dom_set_gnttab_entry: d2 gnt[1] -> d0 0x60f76
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hdd spec.backend=qdisk
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 2:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 2:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x1388270: deregister unregistered
libxl: debug: libxl_dm.c:2602:libxl__spawn_local_dm: Domain 2:Spawning device-model /usr/lib64/xen/bin/qemu-dm with arguments:
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  /usr/lib64/xen/bin/qemu-dm
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -d
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  2
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -domain-name
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  crash-dm
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -vnc
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  none
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -nographic
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -M
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  xenpv
libxl: debug: libxl_dm.c:2606:libxl__spawn_local_dm: Domain 2:Spawning device-model /usr/lib64/xen/bin/qemu-dm with additional environment:
libxl: debug: libxl_dm.c:2608:libxl__spawn_local_dm: Domain 2:  XEN_QEMU_CONSOLE_LIMIT=1048576
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x13828b8 wpath=/local/domain/0/device-model/2/state token=3/0: register slotnum=3
libxl: debug: libxl_create.c:1730:do_domain_create: Domain 0:ao 0x138bc50: inprogress: poller=0x1380b50, flags=i
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x13828b8 wpath=/local/domain/0/device-model/2/state token=3/0: event epath=/local/domain/0/device-model/2/state
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 2 device model: spawn watch p=(null)
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x13828b8 wpath=/local/domain/0/device-model/2/state token=3/0: event epath=/local/domain/0/device-model/2/state
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 2 device model: spawn watch p=running
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x13828b8 wpath=/local/domain/0/device-model/2/state token=3/0: deregister slotnum=3
libxl: debug: libxl_exec.c:129:libxl_report_child_exitstatus: domain 2 device model (dying as expected) [1124] died due to fatal signal Killed
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x13828b8: deregister unregistered
libxl: debug: libxl_qmp.c:2162:libxl__ev_qmp_dispose: Domain 0: ev 0x13828d0
(d2) Bootstrapping...
(d2) Xen Minimal OS (pv)!
libxl: (d2)   start_info: 0x575000(VA)
debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x1382b18 wpath=/local/domain/2/device-model/1/state token=3/1: register (d2)     nr_pages: 0x1c00
(d2)   shared_inf: 0x85ace000(MA)
(d2)      pt_base: 0x578000(VA)
(d2) nr_pt_frames: 0x7
(d2)     mfn_list: 0x567000(VA)
(d2)    mod_start: 0x0(VA)
(d2)      mod_len: 0
(d2)        flags: 0x0
(d2)     cmd_line:  -d 1
(d2)        stack: 0x525900-0x545900
slotnum=3
libxl: debug: (d2) MM: Init
(d2)       _text: 0x0(VA)
(d2)      _etext: 0x116092(VA)
(d2)    _erodata: 0x167000(VA)
(d2)      _edata: 0x16d188(VA)
(d2) stack start: 0x525900(VA)
(d2)        _end: 0x566638(VA)
(d2)   start_pfn: 57f
(d2)     max_pfn: 1c00
libxl_event.c:576:watchfd_callback: watch w=0x1382b18 wpath=/local/domain/2/device-model/1/state token=3/1: event epath=/local/(d2) Mapping memory range 0x57f000 - 0x1c00000
domain/2/device-model/1/state
(d2) setting 0x0-0x167000 readonly
(d2) skipped 1000
(d2) MM: Initialise page allocator for 589000(589000)-1c00000(1c00000)
(d2)     Adding memory range 58a000-1c00000
(d2) MM: done
(d2) Demand map pfns at 100000000000-108000000000.
(d2) Heap resides at 200000000000-208000000000.
(d2) Initialising timer interface
(d2) Initialising console ... done.
(XEN) grant_table.c:1751:d2v0 Expanding d2 grant table from 1 to 4 frames
(d2) gnttab_table mapped at 0x100000000000.
(d2) Initialising scheduler
(d2) Thread "Idle": pointer: 0x0x200000000050, stack: 0x0x5a0000
(d2) Thread "xenstore": pointer: 0x0x200000000800, stack: 0x0x5b0000
(d2) xenbus initialised on irq 1
(d2) Thread "shutdown": pointer: 0x0x200000000fb0, stack: 0x0x5c0000
(d2) main.c: dummy main: par=0x0
(d2) Thread "main": pointer: 0x0x200000001760, stack: 0x0x5d0000
(d2) sparsing 3MB at 183000
(d2) Thread "pcifront": pointer: 0x0x200000003c70, stack: 0x0x5e0000
(d2) pcifront_watches: waiting for backend path to appear device/pci/0/backend
(d2) dom vm is at /vm/c3a9c2fc-c22e-4995-82b7-d24fefbc9cde
(d2) xs_daemon_open -> 3, 0x16ba88
(d2) xs_watch(/local/domain/0/backend/qdisk/2/5696/params, hdd)
(d2) ******************* BLKFRONT for /local/domain/2/device/vbd/5696 **********
(d2) 
(d2) 
(d2) backend at /local/domain/0/backend/qdisk/2/5696
(d2) Failed to read /local/domain/0/backend/qdisk/2/5696/feature-flush-cache.
(d2) 17736 sectors of 512 bytes
(d2) **************************
(d2) blk_open(/local/domain/2/device/vbd/5696) -> 4
(d2) xs_directory(/local/domain/2/device/vkbd): ENOENT
(d2) xs_directory(/local/domain/2/device/vfb): ENOENT
(d2) xs_watch(device-model/1/logdirty/cmd, logdirty)
(d2) xs_watch(device-model/1/command, dm-command)
(d2) xs_watch(/local/domain/1/cpu, vcpu-set)
(d2) xs_read(/local/domain/0/backend/pci/1/0/msitranslate): EACCES
(d2) xs_read(/local/domain/0/backend/pci/1/0/power_mgmt): EACCES
(d2) ******************* CONSFRONT for device/console/3 **********
(d2) 
(d2) 
(d2) backend at /local/domain/0/backend/console/2/3
(d2) **************************
(d2) fd(5) = posix_openpt
(d2) fcntl(5, 3, 16/26)
(d2) fcntl(5, 4, ffffffff/37777777777)
(d2) fcntl(5, 3, 23/43)
(d2) fcntl(5, 4, ffffffff/37777777777)
(d2) xs_watch(/local/domain/0/backend/console/1, be:0x156dd2:1:0x167460)
(d2) xs_directory(/local/domain/0/backend/console/1): EACCES
(d2) xs_watch(/local/domain/0/backend/vkbd/1, be:0x153639:1:0x167400)
(d2) xs_directory(/local/domain/0/backend/vkbd/1): EACCES
(d2) xs_read(device-model/1/disable_pf): ENOENT
(d2) xs_watch(/local/domain/1/log-throttling, /local/domain/1/log-throttling)
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x1382b18 wpath=/local/domain/2/device-model/1/state token=3/1: event epath=/local/(d2) xs_read_watch() -> /local/domain/1/log-throttling /local/domain/1/log-throttling
domain/2/device-model/1/state
libxl: debug: (d2) xs_read(/local/domain/1/log-throttling): ENOENT
(d2) xs_read_watch() -> /local/domain/1/cpu vcpu-set
libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x1382b18 wpath=/local/domain/2/device-model/1/state token=3/1: deregis(d2) xs_read_watch() -> device-model/1/command dm-command
ter slotnum=3
libxl: debug: libxl_qmp.c:2162:libxl__ev_qmp_dispose: Domain 0: ev 0x1382178(d2) xs_read(device-model/1/command): ENOENT
(d2) xs_read_watch() -> device-model/1/logdirty/cmd logdirty

libxl: debug: libxl_event.c:2190:libxl__ao_progress_report: ao 0x138bc50: progress report: ignored
libxl: debug: libxl_event.c:1873:libxl__ao_complete: ao 0x138bc50: complete, rc=0(d2) xs_read(device-model/1/logdirty/cmd): ENOENT

libxl: debug: libxl_event.c:1842:libxl__ao__destroy: ao 0x138bc50: destroy(d2) xs_read_watch() -> /local/domain/0/backend/qdisk/2/5696/params hdd

Waiting for domain crash (domid 1) to die [pid 1121]
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x13801d0 wpath=@releaseDomain token=3/2: register slotnum=3(d1) HVM Loader
(d1) Detected Xen v4.12.1-1.el7
(d1) Xenbus rings @0xfeffc000, event channel 1

libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x13883c0 wpath=/local/domain/2/device/vbd/5696/eject token=2/3: register slotnum=2
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x13801d0 wpath=@releaseDomain token=3/2: event epath=@releaseDomain(d1) System requested ROMBIOS

(d1) CPU speed is 2200 MHz
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 1:[evg=0x138cda0] nentries=1 rc=1 1..1
libxl: (d1) Relocating guest memory for lowmem MMIO space enabled
debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 1:[evg=0x138cda0]   got=domaininfos[0] got->domain=1
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 1:Exists shutdown_reported=0 dominf.flags=ffff0122
(XEN) irq.c:374: Dom1 PCI link 0 changed 0 -> 5
(d1) PCI-ISA link 0 routed to IRQ5
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
(XEN) irq.c:374: Dom1 PCI link 1 changed 0 -> 10
(d1) PCI-ISA link 1 routed to IRQ10
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done(XEN) irq.c:374: Dom1 PCI link 2 changed 0 -> 11
(d1) PCI-ISA link 2 routed to IRQ11

libxl: debug: (XEN) irq.c:374: Dom1 PCI link 3 changed 0 -> 5
(d1) PCI-ISA link 3 routed to IRQ5
libxl_event.c:576:watchfd_callback: watch w=0x13883c0 wpath=/local/domain/2/device/vbd/5696/eject token=2/3: event epath=/local/domain/2/device/vbd/5696/eject
[  283.874958] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 234121
[  283.891019] Policy zone: DMA32
[  283.901630] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 234121
[  283.920617] Policy zone: DMA32
(d1) pci dev 01:3 INTA->IRQ10
(d1) pci dev 02:0 INTA->IRQ11
(d1) No RAM in high memory; setting high_mem resource base to 100000000
(d1) pci dev 02:0 bar 14 size 001000000: 0f0000008
(d1) pci dev 02:0 bar 10 size 000000100: 00000c001
(d1) pci dev 01:1 bar 20 size 000000010: 00000c101
(d1) Multiprocessor initialisation:
(d1)  - CPU0 ... 46-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1) Testing HVM environment:
(d1) Using scratch memory at 400000
(d1)  - REP INSB across page boundaries ... passed
(d1)  - REP INSW across page boundaries ... passed
(d1)  - GS base MSRs and SWAPGS ... passed
(d1) Passed 3 of 3 tests
(d1) Writing SMBIOS tables ...
(d1) Loading ROMBIOS ...
(d1) 16796 bytes of ROMBIOS high-memory extensions:
(d1)   Relocating to 0xfc001000-0xfc00519c ... done
(d1) Creating MP tables ...
(d1) No emulated VGA adaptor ...
(d1) Option ROMs:
(d1) Loading ACPI ...
(d1) vm86 TSS at fc011480
(d1) BIOS map:
(d1)  f0000-fffff: Main BIOS
(d1) E820 table:
(d1)  [00]: 00000000:00000000 - 00000000:0009e000: RAM
(d1)  [01]: 00000000:0009e000 - 00000000:000a0000: RESERVED
(d1)  HOLE: 00000000:000a0000 - 00000000:000e0000
(d1)  [02]: 00000000:000e0000 - 00000000:00100000: RESERVED
(d1)  [03]: 00000000:00100000 - 00000000:20000000: RAM
(d1)  HOLE: 00000000:20000000 - 00000000:fc000000
(d1)  [04]: 00000000:fc000000 - 00000001:00000000: RESERVED
(d1) Invoking ROMBIOS ...
(d1) Bochs BIOS - build: 06/23/99
(d1) $Revision: 1.221 $ $Date: 2008/12/07 17:32:29 $
(d1) Options: apmbios pcibios eltorito PMM 
(d1) 
(d1) ata1  slave: QEMU DVD-ROM ATAPI-4 CD-Rom/DVD-Rom
(d1) 
(d1) 
(d1) 
(d1) Press F12 for boot menu.
(d1) 
(d1) Booting from CD-Rom...
(d1) 8MB medium detected
(XEN) Dom1 callback via changed to Direct Vector 0xf3
L1 DOM0 crashed here, no further output.

--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=typescript-l0.txt
Content-Transfer-Encoding: 8bit

Script started on Wed 02 Oct 2019 08:59:52 AM PDT
cmb@phys-dom0 ~$ sudo xl -vvvv create -F ~/c7dom0.xl
Parsing config from /home/cmb/c7dom0.xl
libxl: debug: libxl_create.c:1693:do_domain_create: Domain 0:ao 0x8ce4a0: create: how=(nil) callback=(nil) poller=0x8ce0f0
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hda spec.backend=qdisk
libxl: debug: libxl_create.c:1018:initiate_domain_create: Domain 1:running bootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 1:not a PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8cf0c8: deregister unregistered
libxl: debug: libxl_sched.c:74:libxl__set_vcpuaffinity: Domain 1:New hard affinity for vcpu 0 has unreachable cpus
libxl: debug: libxl_sched.c:74:libxl__set_vcpuaffinity: Domain 1:New hard affinity for vcpu 1 has unreachable cpus
domainbuilder: detail: xc_dom_allocate: cmdline="", features=""
domainbuilder: detail: xc_dom_kernel_file: filename="/usr/lib64/xen/boot/hvmloader"
domainbuilder: detail: xc_dom_malloc_filemap    : 609 kB
domainbuilder: detail: xc_dom_module_file: filename="/usr/lib64/xen/boot/ipxe.bin"
domainbuilder: detail: xc_dom_malloc_filemap    : 512 kB
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.12, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ... 
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=0x100000 memsz=0x67aa4
xc: detail: ELF: memory: 0x100000 -> 0x167aa4
domainbuilder: detail: xc_dom_mem_init: mem 3072 MB, pages 0xc0000 pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0xc0000 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=0x0 end=0xc0000000
domainbuilder: detail: xc_dom_malloc            : 6144 kB
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000200
xc: detail:   2MB PAGES: 0x00000000000005ff
xc: detail:   1GB PAGES: 0x0000000000000000
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x100+0x68 at 0x7fb8127be000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 -> 0x168000  (pfn 0x100 + 0x68 pages)
xc: detail: ELF: phdr 0 at 0x7fb812756000 -> 0x7fb8127b3ec8
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x168+0x80 at 0x7fb80eee0000
domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0x168000 -> 0x1e8000  (pfn 0x168 + 0x80 pages)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x1e8+0x1 at 0x7fb812950000
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x1e8000 -> 0x1e9000  (pfn 0x1e8 + 0x1 pages)
domainbuilder: detail: alloc_pgtables_hvm: doing nothing
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x1e9000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32 <= matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_64
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 6152 kB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 1121 kB
domainbuilder: detail:       domU mmap          : 932 kB
domainbuilder: detail: Adding module 0 guest_addr 168000 len 524288
domainbuilder: detail: vcpu_hvm: called
domainbuilder: detail: compat_gnttab_hvm_seed: d1: pfn=0xff000
domainbuilder: detail: xc_dom_set_gnttab_entry: d1 gnt[0] -> d0 0xfefff
domainbuilder: detail: xc_dom_set_gnttab_entry: d1 gnt[1] -> d0 0xfeffc
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hda spec.backend=qdisk
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8d1220: deregister unregistered
domainbuilder: detail: xc_dom_allocate: cmdline=" -d 1", features=""
libxl: debug: libxl_dom.c:799:libxl__build_pv: pv kernel mapped 0 path /usr/lib64/xen/boot/ioemu-stubdom.gz
domainbuilder: detail: xc_dom_kernel_file: filename="/usr/lib64/xen/boot/ioemu-stubdom.gz"
domainbuilder: detail: xc_dom_malloc_filemap    : 1435 kB
domainbuilder: detail: xc_dom_malloc            : 6500 kB
domainbuilder: detail: xc_dom_do_gunzip: unzip ok, 0x166e18 -> 0x659070
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.12, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ... 
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ... 
domainbuilder: detail: xc_dom_probe_bzimage_kernel: kernel is not a bzImage
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ... 
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=0 memsz=0x566638
xc: detail: ELF: memory: 0 -> 0x566638
xc: detail: ELF: note: GUEST_OS = "Mini-OS"
xc: detail: ELF: note: LOADER = "generic"
xc: detail: ELF: note: HYPERCALL_PAGE = 0x2000
xc: detail: ELF: note: XEN_VERSION = "xen-3.0"
xc: detail: ELF: using notes from SHT_NOTE section
xc: detail: ELF: VIRT_BASE unset, using 0
xc: detail: ELF_PADDR_OFFSET unset, using 0
xc: detail: ELF: addresses:
xc: detail:     virt_base        = 0x0
xc: detail:     elf_paddr_offset = 0x0
xc: detail:     virt_offset      = 0x0
xc: detail:     virt_kstart      = 0x0
xc: detail:     virt_kend        = 0x566638
xc: detail:     virt_entry       = 0x0
xc: detail:     p2m_base         = 0xffffffffffffffff
domainbuilder: detail: xc_dom_parse_elf_kernel: xen-3.0-x86_64: 0x0 -> 0x566638
domainbuilder: detail: xc_dom_mem_init: mem 28 MB, pages 0x1c00 pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0x1c00 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: x86_compat: guest xen-3.0-x86_64, address size 64
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x0+0x567 at 0x7fb80e9a0000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x0 -> 0x567000  (pfn 0x0 + 0x567 pages)
xc: detail: ELF: phdr 0 at 0x7fb80e9a0000 -> 0x7fb80eb0d188
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x567+0xe at 0x7fb8127ca000
domainbuilder: detail: xc_dom_alloc_segment:   phys2mach    : 0x567000 -> 0x575000  (pfn 0x567 + 0xe pages)
domainbuilder: detail: xc_dom_alloc_page   :   start info   : 0x575000 (pfn 0x575)
domainbuilder: detail: xc_dom_alloc_page   :   xenstore     : 0x576000 (pfn 0x576)
domainbuilder: detail: xc_dom_alloc_page   :   console      : 0x577000 (pfn 0x577)
domainbuilder: detail: count_pgtables: 0x0000007fffffffff/39: 0x0000000000000000 -> 0x0000007fffffffff, 1 table(s)
domainbuilder: detail: count_pgtables: 0x000000003fffffff/30: 0x0000000000000000 -> 0x000000003fffffff, 1 table(s)
domainbuilder: detail: count_pgtables: 0x00000000001fffff/21: 0x0000000000000000 -> 0x00000000007fffff, 4 table(s)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x578+0x7 at 0x7fb8127c3000
domainbuilder: detail: xc_dom_alloc_segment:   page tables  : 0x578000 -> 0x57f000  (pfn 0x578 + 0x7 pages)
domainbuilder: detail: xc_dom_alloc_page   :   boot stack   : 0x57f000 (pfn 0x57f)
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x580000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x800000
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_64 <= matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_64
domainbuilder: detail: xc_dom_update_guest_p2m: dst 64bit, pages 0x1c00
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x575+0x1 at 0x7fb812950000
domainbuilder: detail: start_info_x86_64: called
domainbuilder: detail: setup_hypercall_page: vaddr=0x2000 pfn=0x2
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 6592 kB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 1435 kB
domainbuilder: detail:       domU mmap          : 5620 kB
domainbuilder: detail: bootlate_pv: shared_info: pfn 0x0, mfn 0x793ee
domainbuilder: detail: shared_info_x86_64: called
domainbuilder: detail: vcpu_x86_64: called
domainbuilder: detail: vcpu_x86_64: cr3: pfn 0x578 mfn 0x34578
domainbuilder: detail: xc_dom_set_gnttab_entry: d2 gnt[0] -> d0 0x34577
domainbuilder: detail: xc_dom_set_gnttab_entry: d2 gnt[1] -> d0 0x34576
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:397:libxl__device_disk_set_backend: Disk vdev=hda spec.backend=qdisk
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 2:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 2:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8d4d60: deregister unregistered
libxl: debug: libxl_dm.c:2602:libxl__spawn_local_dm: Domain 2:Spawning device-model /usr/lib64/xen/bin/qemu-dm with arguments:
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  /usr/lib64/xen/bin/qemu-dm
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -d
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  2
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -domain-name
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  cmb-c7dom0-dm
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -vnc
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  none
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -nographic
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  -M
libxl: debug: libxl_dm.c:2604:libxl__spawn_local_dm: Domain 2:  xenpv
libxl: debug: libxl_dm.c:2606:libxl__spawn_local_dm: Domain 2:Spawning device-model /usr/lib64/xen/bin/qemu-dm with additional environment:
libxl: debug: libxl_dm.c:2608:libxl__spawn_local_dm: Domain 2:  XEN_QEMU_CONSOLE_LIMIT=1048576
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8cfb18 wpath=/local/domain/0/device-model/2/state token=3/0: register slotnum=3
libxl: debug: libxl_create.c:1730:do_domain_create: Domain 0:ao 0x8ce4a0: inprogress: poller=0x8ce0f0, flags=i
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cfb18 wpath=/local/domain/0/device-model/2/state token=3/0: event epath=/local/domain/0/device-model/2/state
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 2 device model: spawn watch p=(null)
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cfb18 wpath=/local/domain/0/device-model/2/state token=3/0: event epath=/local/domain/0/device-model/2/state
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 2 device model: spawn watch p=running
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8cfb18 wpath=/local/domain/0/device-model/2/state token=3/0: deregister slotnum=3
libxl: debug: libxl_exec.c:129:libxl_report_child_exitstatus: domain 2 device model (dying as expected) [3256] died due to fatal signal Killed
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8cfb18: deregister unregistered
libxl: debug: libxl_qmp.c:2162:libxl__ev_qmp_dispose: Domain 0: ev 0x8cfb30
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8da410 wpath=/local/domain/0/backend/vif/2/0/state token=3/1: register slotnum=3
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8da410 wpath=/local/domain/0/backend/vif/2/0/state token=3/1: event epath=/local/domain/0/backend/vif/2/0/state
libxl: debug: libxl_event.c:881:devstate_callback: backend /local/domain/0/backend/vif/2/0/state wanted state 2 still waiting state 1
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8da410 wpath=/local/domain/0/backend/vif/2/0/state token=3/1: event epath=/local/domain/0/backend/vif/2/0/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/backend/vif/2/0/state wanted state 2 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8da410 wpath=/local/domain/0/backend/vif/2/0/state token=3/1: deregister slotnum=3
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 2:calling device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da410: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 2:calling hotplug script: /etc/xen/scripts/vif-bridge-extended online
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 2:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 2:	type_if=vif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 2:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	script: /etc/xen/scripts/vif-bridge-extended
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_PATH: backend/vif/2/0
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_BASE_PATH: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	netdev: 
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	vif: vif2.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge-extended online 
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da510: deregister unregistered
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 2:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da510: deregister unregistered
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8cfd78 wpath=/local/domain/2/device-model/1/state token=3/2: register slotnum=3
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cfd78 wpath=/local/domain/2/device-model/1/state token=3/2: event epath=/local/domain/2/device-model/1/state
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cfd78 wpath=/local/domain/2/device-model/1/state token=3/2: event epath=/local/domain/2/device-model/1/state
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8cfd78 wpath=/local/domain/2/device-model/1/state token=3/2: deregister slotnum=3
libxl: debug: libxl_qmp.c:2162:libxl__ev_qmp_dispose: Domain 0: ev 0x8cf3d8
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8db8d0 wpath=/local/domain/0/backend/vif/1/0/state token=3/3: register slotnum=3
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8db8d0 wpath=/local/domain/0/backend/vif/1/0/state token=3/3: event epath=/local/domain/0/backend/vif/1/0/state
libxl: debug: libxl_event.c:881:devstate_callback: backend /local/domain/0/backend/vif/1/0/state wanted state 2 still waiting state 1
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8db8d0 wpath=/local/domain/0/backend/vif/1/0/state token=3/3: event epath=/local/domain/0/backend/vif/1/0/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/backend/vif/1/0/state wanted state 2 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8db8d0 wpath=/local/domain/0/backend/vif/1/0/state token=3/3: deregister slotnum=3
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 1:calling device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db8d0: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 1:calling hotplug script: /etc/xen/scripts/vif-bridge-extended online
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 1:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 1:	type_if=vif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 1:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	script: /etc/xen/scripts/vif-bridge-extended
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_PATH: backend/vif/1/0
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_BASE_PATH: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	netdev: 
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	INTERFACE: vif1.0-emu
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	vif: vif1.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge-extended online 
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db9d0: deregister unregistered
libxl: debug: libxl_linux.c:226:libxl__get_hotplug_script_info: Domain 1:num_exec 1, not running hotplug scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db9d0: deregister unregistered
libxl: debug: libxl_event.c:2190:libxl__ao_progress_report: ao 0x8ce4a0: progress report: ignored
libxl: debug: libxl_event.c:1873:libxl__ao_complete: ao 0x8ce4a0: complete, rc=0
libxl: debug: libxl_event.c:1842:libxl__ao__destroy: ao 0x8ce4a0: destroy
Waiting for domain cmb-c7dom0 (domid 1) to die [pid 3253]
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8cc1d0 wpath=@releaseDomain token=3/4: register slotnum=3
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cc1d0 wpath=@releaseDomain token=3/4: event epath=@releaseDomain
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 1:[evg=0x8da020] nentries=1 rc=1 1..1
libxl: debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 1:[evg=0x8da020]   got=domaininfos[0] got->domain=1
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 1:Exists shutdown_reported=0 dominf.flags=ffff0122
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cc1d0 wpath=@releaseDomain token=3/4: event epath=@releaseDomain
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 1:[evg=0x8da020] nentries=1 rc=1 1..1
libxl: debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 1:[evg=0x8da020]   got=domaininfos[0] got->domain=1
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 1:Exists shutdown_reported=0 dominf.flags=30106
libxl: debug: libxl_domain.c:816:domain_death_xswatch_callback:  shutdown reporting
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done
Domain 1 has shut down, reason code 3 0x3
Action for shutdown reason code 3 is destroy
Domain 1 needs to be cleaned up: destroying the domain
libxl: debug: libxl_domain.c:902:libxl_domain_destroy: Domain 1:ao 0x8d14a0: create: how=(nil) callback=(nil) poller=0x8ce0f0
libxl: debug: libxl_dm.c:3008:libxl__destroy_device_model: Domain 2:Didn't find dm UID; destroying by pid
libxl: debug: libxl_dm.c:2877:kill_device_model: Device Model signaled
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8db5e0 wpath=/local/domain/0/backend/vif/2/0/state token=2/5: register slotnum=2
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=0x8da500 wpath=/local/domain/0/backend/vif/1/0/state token=1/6: register slotnum=1
libxl: debug: libxl_domain.c:911:libxl_domain_destroy: Domain 1:ao 0x8d14a0: inprogress: poller=0x8ce0f0, flags=i
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8db5e0 wpath=/local/domain/0/backend/vif/2/0/state token=2/5: event epath=/local/domain/0/backend/vif/2/0/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/backend/vif/2/0/state wanted state 6 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8db5e0 wpath=/local/domain/0/backend/vif/2/0/state token=2/5: deregister slotnum=2
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 2:calling device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db5e0: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 2:calling hotplug script: /etc/xen/scripts/vif-bridge-extended offline
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 2:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 2:	type_if=vif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 2:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	script: /etc/xen/scripts/vif-bridge-extended
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_PATH: backend/vif/2/0
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	XENBUS_BASE_PATH: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	netdev: 
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 2:	vif: vif2.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge-extended offline 
libxl: debug: libxl_event.c:545:watchfd_callback: watch epath=/local/domain/0/backend/vif/2/0/state token=2/5: empty slot
libxl: debug: libxl_event.c:545:watchfd_callback: watch epath=/local/domain/0/backend/vif/2/0/state token=2/5: empty slot
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8da500 wpath=/local/domain/0/backend/vif/1/0/state token=1/6: event epath=/local/domain/0/backend/vif/1/0/state
libxl: debug: libxl_event.c:881:devstate_callback: backend /local/domain/0/backend/vif/1/0/state wanted state 6 still waiting state 5
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8da500 wpath=/local/domain/0/backend/vif/1/0/state token=1/6: event epath=/local/domain/0/backend/vif/1/0/state
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/backend/vif/1/0/state wanted state 6 ok
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8da500 wpath=/local/domain/0/backend/vif/1/0/state token=1/6: deregister slotnum=1
libxl: debug: libxl_device.c:1117:device_backend_callback: Domain 1:calling device_backend_cleanup
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da500: deregister unregistered
libxl: debug: libxl_device.c:1218:device_hotplug: Domain 1:calling hotplug script: /etc/xen/scripts/vif-bridge-extended offline
libxl: debug: libxl_device.c:1219:device_hotplug: Domain 1:extra args:
libxl: debug: libxl_device.c:1225:device_hotplug: Domain 1:	type_if=vif
libxl: debug: libxl_device.c:1227:device_hotplug: Domain 1:env:
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	script: /etc/xen/scripts/vif-bridge-extended
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_PATH: backend/vif/1/0
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	XENBUS_BASE_PATH: backend
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	netdev: 
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	INTERFACE: vif1.0-emu
libxl: debug: libxl_device.c:1234:device_hotplug: Domain 1:	vif: vif1.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge-extended offline 
libxl: debug: libxl_event.c:545:watchfd_callback: watch epath=/local/domain/0/backend/vif/1/0/state token=1/6: empty slot
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db6e0: deregister unregistered
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 2:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8db6e0: deregister unregistered
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da600: deregister unregistered
libxl: debug: libxl_linux.c:226:libxl__get_hotplug_script_info: Domain 1:num_exec 1, not running hotplug scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da600: deregister unregistered
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 2:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 2:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8d1220: deregister unregistered
libxl: debug: libxl_domain.c:1194:devices_destroy_cb: Domain 2:Forked pid 3628 for destroy of domain
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=0x8cc1d0 wpath=@releaseDomain token=3/4: event epath=@releaseDomain
libxl: debug: libxl_domain.c:767:domain_death_xswatch_callback: Domain 1:[evg=0x8da020] nentries=1 rc=1 1..1
libxl: debug: libxl_domain.c:778:domain_death_xswatch_callback: Domain 1:[evg=0x8da020]   got=domaininfos[0] got->domain=1
libxl: debug: libxl_domain.c:804:domain_death_xswatch_callback: Domain 1:Exists shutdown_reported=1 dominf.flags=3010e
libxl: debug: libxl_domain.c:771:domain_death_xswatch_callback: [evg=0] all reported
libxl: debug: libxl_domain.c:833:domain_death_xswatch_callback: domain death search done
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 3, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8da220: deregister unregistered
libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 6, no need to execute scripts
libxl: debug: libxl_device.c:1203:device_hotplug: Domain 1:No hotplug script to execute
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=0x8cd5b0: deregister unregistered
libxl: debug: libxl_domain.c:1194:devices_destroy_cb: Domain 1:Forked pid 3629 for destroy of domain
libxl: debug: libxl_event.c:1873:libxl__ao_complete: ao 0x8d14a0: complete, rc=0
libxl: debug: libxl_event.c:1842:libxl__ao__destroy: ao 0x8d14a0: destroy
Done. Exiting now
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=0x8cc1d0 wpath=@releaseDomain token=3/4: deregister slotnum=3
xencall:buffer: debug: total allocations:1092 total releases:1092
xencall:buffer: debug: current allocations:0 maximum allocations:3
xencall:buffer: debug: cache current size:3
xencall:buffer: debug: cache hits:1055 misses:3 toobig:34
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0
cmb@phys-dom0 ~$[0m sudo xl dmesg
 Xen 4.12.1-1.el7
(XEN) Xen version 4.12.1-1.el7 (mockbuild@centos.org) (gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)) debug=y  Tue Oct  1 16:41:35 PDT 2019
(XEN) Latest ChangeSet: 
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: none; EDID transfer time: 1 seconds
(XEN)  EDID info not retrieved because no DDC retrieval method detected
(XEN) Disc information:
(XEN)  Found 2 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009ac00 (usable)
(XEN)  000000000009ac00 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 00000000796ee000 (usable)
(XEN)  00000000796ee000 - 00000000798bd000 (reserved)
(XEN)  00000000798bd000 - 00000000799be000 (usable)
(XEN)  00000000799be000 - 0000000079e5a000 (ACPI NVS)
(XEN)  0000000079e5a000 - 000000007bdb1000 (reserved)
(XEN)  000000007bdb1000 - 000000007bdb2000 (usable)
(XEN)  000000007bdb2000 - 000000007be38000 (reserved)
(XEN)  000000007be38000 - 000000007c000000 (usable)
(XEN)  0000000080000000 - 0000000090000000 (reserved)
(XEN)  00000000fed1c000 - 00000000fed20000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000280000000 (usable)
(XEN) New Xen image base address: 0x79000000
(XEN) ACPI: RSDP 000F0580, 0024 (r2 SUPERM)
(XEN) ACPI: XSDT 79A020A0, 00BC (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: FACP 79A1A900, 010C (r5 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: DSDT 79A021F0, 1870B (r2 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: FACS 79E58F80, 0040
(XEN) ACPI: APIC 79A1AA10, 0084 (r3 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: FPDT 79A1AA98, 0044 (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: FIDT 79A1AAE0, 009C (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SPMI 79A1AB80, 0040 (r5 SUPERM SMCI--MB        0 AMI.        0)
(XEN) ACPI: MCFG 79A1ABC0, 003C (r1 SUPERM SMCI--MB  1072009 MSFT       97)
(XEN) ACPI: UEFI 79A1AC00, 0042 (r1                        0             0)
(XEN) ACPI: DBG2 79A1AC48, 0072 (r0 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: HPET 79A1ACC0, 0038 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: WDDT 79A1ACF8, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: SSDT 79A1AD38, ED8B (r1    AMI    PmMgt        1 INTL 20120913)
(XEN) ACPI: SSDT 79A29AC8, 2285 (r2 SUPERM SpsNm           2 INTL 20120913)
(XEN) ACPI: SSDT 79A2BD50, 0064 (r2 SUPERM SpsNvs          2 INTL 20120913)
(XEN) ACPI: PRAD 79A2BDB8, 0102 (r2 SUPERM SMCI--MB        2 INTL 20120913)
(XEN) ACPI: DMAR 79A2BEC0, 00BC (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: HEST 79A2BF80, 00A8 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: BERT 79A2C028, 0030 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: ERST 79A2C058, 0230 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: EINJ 79A2C288, 0130 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) System RAM: 8089MB (8283464kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000280000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
(XEN) found SMP MP-table at 000fd940
(XEN) DMI 2.7 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x408 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 79e58f80/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[79e58f8c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x00] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] high level lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] high level lint[0x1])
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 760 MSI/MSI-X
(XEN) Not enabling x2APIC (upon firmware request)
(XEN) microcode: CPU0 updated from revision 0x700000c to 0x7000017, date = 2019-03-23 
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 0
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 6144K
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) mce_intel.c:780: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, SER, CMCI
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 19, using 0x1
(XEN) CPU0: Thermal monitoring enabled (TM1)
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features: IBRS/IBPB STIBP L1D_FLUSH SSBD MD_CLEAR
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: IBRS- SSBD-, Other: IBPB L1D_FLUSH VERW
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 46, Safe address 300000000000
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
(XEN)   Support for PV VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Initializing CPU#0
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2199.998 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080461c70 -> ffff82d080463bc6
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) CPU0: Intel(R) Xeon(R) CPU D-1518 @ 2.20GHz stepping 03
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) mwait-idle: MWAIT substates: 0x2120
(XEN) mwait-idle: v0.4.1 model 0x56
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Booting processor 1/2 eip 8a000
(XEN) Initializing CPU#1
(XEN) microcode: CPU1 updated from revision 0x700000c to 0x7000017, date = 2019-03-23 
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 1
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 6144K
(XEN) CPU1: Thermal monitoring enabled (TM1)
(XEN) CPU1: Intel(R) Xeon(R) CPU D-1518 @ 2.20GHz stepping 03
(XEN) Adding cpu 1 to runqueue 0
(XEN) Booting processor 2/4 eip 8a000
(XEN) Initializing CPU#2
(XEN) microcode: CPU2 updated from revision 0x700000c to 0x7000017, date = 2019-03-23 
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 2
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 6144K
(XEN) CPU2: Thermal monitoring enabled (TM1)
(XEN) CPU2: Intel(R) Xeon(R) CPU D-1518 @ 2.20GHz stepping 03
(XEN) Adding cpu 2 to runqueue 0
(XEN) Booting processor 3/6 eip 8a000
(XEN) Initializing CPU#3
(XEN) microcode: CPU3 updated from revision 0x700000c to 0x7000017, date = 2019-03-23 
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 3
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 6144K
(XEN) CPU3: Thermal monitoring enabled (TM1)
(XEN) CPU3: Intel(R) Xeon(R) CPU D-1518 @ 2.20GHz stepping 03
(XEN) Adding cpu 3 to runqueue 0
(XEN) Brought up 4 CPUs
(XEN) build-id: 8987a26abbd29d7845db55e16a34db271e0bef44
(XEN) Running stub recovery selftests...
(XEN) traps.c:1576: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08037c412
(XEN) traps.c:757: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d08037c412
(XEN) traps.c:1096: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08037c412
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 408 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0xe01000
(XEN) ELF: phdr: paddr=0x2000000 memsz=0x194000
(XEN) ELF: phdr: paddr=0x2194000 memsz=0x1b298
(XEN) ELF: phdr: paddr=0x21b0000 memsz=0x4e8000
(XEN) ELF: memory: 0x1000000 -> 0x2698000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff821b0180
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|auto_translated_physmap|supervisor_mode_kernel"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x90d
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff82698000
(XEN)     virt_entry       = 0xffffffff821b0180
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x2698000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000270000000->0000000274000000 (1027107 pages to be allocated)
(XEN)  Init. ramdisk: 000000027ec23000->000000027ffff463
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff82698000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000800000
(XEN)  Start info:    ffffffff82698000->ffffffff826984b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff82699000->ffffffff826b0000
(XEN)  Boot stack:    ffffffff826b0000->ffffffff826b1000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82800000
(XEN)  ENTRY ADDRESS: ffffffff821b0180
(XEN) Dom0 has maximum 2 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81e01000
(XEN) ELF: phdr 1 at 0xffffffff82000000 -> 0xffffffff82194000
(XEN) ELF: phdr 2 at 0xffffffff82194000 -> 0xffffffff821af298
(XEN) ELF: phdr 3 at 0xffffffff821b0000 -> 0xffffffff823f1000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 476kB init memory
(XEN) d0: Forcing write emulation on MFNs 80000-8ffff
(XEN) PCI add device 0000:ff:0b.0
(XEN) PCI add device 0000:ff:0b.1
(XEN) PCI add device 0000:ff:0b.2
(XEN) PCI add device 0000:ff:0b.3
(XEN) PCI add device 0000:ff:0c.0
(XEN) PCI add device 0000:ff:0c.1
(XEN) PCI add device 0000:ff:0c.2
(XEN) PCI add device 0000:ff:0c.3
(XEN) PCI add device 0000:ff:0f.0
(XEN) PCI add device 0000:ff:0f.4
(XEN) PCI add device 0000:ff:0f.5
(XEN) PCI add device 0000:ff:0f.6
(XEN) PCI add device 0000:ff:10.0
(XEN) PCI add device 0000:ff:10.1
(XEN) PCI add device 0000:ff:10.5
(XEN) PCI add device 0000:ff:10.6
(XEN) PCI add device 0000:ff:10.7
(XEN) PCI add device 0000:ff:12.0
(XEN) PCI add device 0000:ff:12.1
(XEN) PCI add device 0000:ff:13.0
(XEN) PCI add device 0000:ff:13.1
(XEN) PCI add device 0000:ff:13.2
(XEN) PCI add device 0000:ff:13.3
(XEN) PCI add device 0000:ff:13.4
(XEN) PCI add device 0000:ff:13.5
(XEN) PCI add device 0000:ff:13.6
(XEN) PCI add device 0000:ff:13.7
(XEN) PCI add device 0000:ff:14.0
(XEN) PCI add device 0000:ff:14.1
(XEN) PCI add device 0000:ff:14.2
(XEN) PCI add device 0000:ff:14.3
(XEN) PCI add device 0000:ff:14.4
(XEN) PCI add device 0000:ff:14.5
(XEN) PCI add device 0000:ff:14.6
(XEN) PCI add device 0000:ff:14.7
(XEN) PCI add device 0000:ff:15.0
(XEN) PCI add device 0000:ff:15.1
(XEN) PCI add device 0000:ff:15.2
(XEN) PCI add device 0000:ff:15.3
(XEN) PCI add device 0000:ff:1e.0
(XEN) PCI add device 0000:ff:1e.1
(XEN) PCI add device 0000:ff:1e.2
(XEN) PCI add device 0000:ff:1e.3
(XEN) PCI add device 0000:ff:1e.4
(XEN) PCI add device 0000:ff:1f.0
(XEN) PCI add device 0000:ff:1f.2
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:01.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:02.2
(XEN) PCI add device 0000:00:03.0
(XEN) PCI add device 0000:00:05.0
(XEN) PCI add device 0000:00:05.1
(XEN) PCI add device 0000:00:05.2
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:16.0
(XEN) PCI add device 0000:00:16.1
(XEN) PCI add device 0000:00:1a.0
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.4
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:00:1f.6
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:02:00.1
(XEN) PCI add device 0000:02:00.2
(XEN) PCI add device 0000:02:00.3
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:03:00.1
(XEN) PCI add device 0000:04:00.0
(XEN) PCI add device 0000:05:00.0
(XEN) PCI add device 0000:05:00.1
(XEN) PCI add device 0000:06:00.0
(XEN) PCI add device 0000:07:00.0
(XEN) d0: Forcing read-only access to MFN fed00
(XEN) traps.c:1576: GPF (0000): ffff82d08037191f [emul-priv-op.c#read_msr+0x413/0x4b3] -> ffff82d08037cbda
(XEN) traps.c:1576: GPF (0000): ffff82d08037191f [emul-priv-op.c#read_msr+0x413/0x4b3] -> ffff82d08037cbda
(XEN) memory.c:257:d0v1 Could not allocate order=18 extent: id=1 memflags=0xc0 (0 of 1)
(XEN) memory.c:257:d0v1 Could not allocate order=18 extent: id=1 memflags=0xc0 (0 of 1)
(XEN) HVM d1v0 save: CPU
(XEN) HVM d1v1 save: CPU
(XEN) HVM d1 save: PIC
(XEN) HVM d1 save: IOAPIC
(XEN) HVM d1v0 save: LAPIC
(XEN) HVM d1v1 save: LAPIC
(XEN) HVM d1v0 save: LAPIC_REGS
(XEN) HVM d1v1 save: LAPIC_REGS
(XEN) HVM d1 save: PCI_IRQ
(XEN) HVM d1 save: ISA_IRQ
(XEN) HVM d1 save: PCI_LINK
(XEN) HVM d1 save: PIT
(XEN) HVM d1 save: RTC
(XEN) HVM d1 save: HPET
(XEN) HVM d1 save: PMTIMER
(XEN) HVM d1v0 save: MTRR
(XEN) HVM d1v1 save: MTRR
(XEN) HVM d1 save: VIRIDIAN_DOMAIN
(XEN) HVM d1v0 save: CPU_XSAVE
(XEN) HVM d1v1 save: CPU_XSAVE
(XEN) HVM d1v0 save: VIRIDIAN_VCPU
(XEN) HVM d1v1 save: VIRIDIAN_VCPU
(XEN) HVM d1v0 save: VMCE_VCPU
(XEN) HVM d1v1 save: VMCE_VCPU
(XEN) HVM d1v0 save: TSC_ADJUST
(XEN) HVM d1v1 save: TSC_ADJUST
(XEN) HVM d1v0 save: CPU_MSR
(XEN) HVM d1v1 save: CPU_MSR
(XEN) HVM1 restore: CPU 0
(d2) Bootstrapping...
(d2) Xen Minimal OS (pv)!
(d2)   start_info: 0x575000(VA)
(d2)     nr_pages: 0x1c00
(d2)   shared_inf: 0x793ee000(MA)
(d2)      pt_base: 0x578000(VA)
(d2) nr_pt_frames: 0x7
(d2)     mfn_list: 0x567000(VA)
(d2)    mod_start: 0x0(VA)
(d2)      mod_len: 0
(d2)        flags: 0x0
(d2)     cmd_line:  -d 1
(d2)        stack: 0x525900-0x545900
(d2) MM: Init
(d2)       _text: 0x0(VA)
(d2)      _etext: 0x116092(VA)
(d2)    _erodata: 0x167000(VA)
(d2)      _edata: 0x16d188(VA)
(d2) stack start: 0x525900(VA)
(d2)        _end: 0x566638(VA)
(d2)   start_pfn: 57f
(d2)     max_pfn: 1c00
(d2) Mapping memory range 0x57f000 - 0x1c00000
(d2) setting 0x0-0x167000 readonly
(d2) skipped 1000
(d2) MM: Initialise page allocator for 589000(589000)-1c00000(1c00000)
(d2)     Adding memory range 58a000-1c00000
(d2) MM: done
(d2) Demand map pfns at 100000000000-108000000000.
(d2) Heap resides at 200000000000-208000000000.
(d2) Initialising timer interface
(d2) Initialising console ... done.
(XEN) grant_table.c:1751:d2v0 Expanding d2 grant table from 1 to 4 frames
(d2) gnttab_table mapped at 0x100000000000.
(d2) Initialising scheduler
(d2) Thread "Idle": pointer: 0x0x200000000050, stack: 0x0x5a0000
(d2) Thread "xenstore": pointer: 0x0x200000000800, stack: 0x0x5b0000
(d2) xenbus initialised on irq 1
(d2) Thread "shutdown": pointer: 0x0x200000000fb0, stack: 0x0x5c0000
(d2) main.c: dummy main: par=0x0
(d2) Thread "main": pointer: 0x0x200000001760, stack: 0x0x5d0000
(d2) sparsing 3MB at 183000
(d2) Thread "pcifront": pointer: 0x0x200000003c70, stack: 0x0x5e0000
(d2) pcifront_watches: waiting for backend path to appear device/pci/0/backend
(d2) dom vm is at /vm/95f11fc0-b9e7-47ff-8523-bacab35b96b6
(d2) ************************ NETFRONT for device/vif/0 **********
(d2) 
(d2) 
(d2) net TX ring size 256
(d2) net RX ring size 256
(d2) backend at /local/domain/0/backend/vif/2/0
(d2) mac is 00:16:3e:9a:7b:4f
(d2) **************************
(d2) tap_open((null)) -> 3
(d2) xs_daemon_open -> 4, 0x16baa8
(d2) ******************* BLKFRONT for /local/domain/2/device/vbd/768 **********
(d2) 
(d2) 
(d2) backend at /local/domain/0/backend/qdisk/2/768
(d2) Failed to read /local/domain/0/backend/qdisk/2/768/feature-flush-cache.
(d2) 6291456 sectors of 512 bytes
(d2) **************************
(d2) blk_open(/local/domain/2/device/vbd/768) -> 5
(d2) xs_directory(/local/domain/2/device/vkbd): ENOENT
(d2) xs_directory(/local/domain/2/device/vfb): ENOENT
(d2) xs_watch(device-model/1/logdirty/cmd, logdirty)
(d2) xs_watch(device-model/1/command, dm-command)
(d2) xs_watch(/local/domain/1/cpu, vcpu-set)
(d2) xs_read(/local/domain/0/backend/pci/1/0/msitranslate): EACCES
(d2) xs_read(/local/domain/0/backend/pci/1/0/power_mgmt): EACCES
(d2) ******************* CONSFRONT for device/console/3 **********
(d2) 
(d2) 
(d2) backend at /local/domain/0/backend/console/2/3
(d2) **************************
(d2) fd(6) = posix_openpt
(d2) fcntl(6, 3, 16/26)
(d2) fcntl(6, 4, ffffffff/37777777777)
(d2) fcntl(6, 3, 23/43)
(d2) fcntl(6, 4, ffffffff/37777777777)
(d2) xs_watch(/local/domain/0/backend/console/1, be:0x156dd2:1:0x167460)
(d2) xs_directory(/local/domain/0/backend/console/1): EACCES
(d2) xs_watch(/local/domain/0/backend/vkbd/1, be:0x153639:1:0x167400)
(d2) xs_directory(/local/domain/0/backend/vkbd/1): EACCES
(d2) xs_read(device-model/1/disable_pf): ENOENT
(d2) xs_watch(/local/domain/1/log-throttling, /local/domain/1/log-throttling)
(d2) xs_read_watch() -> /local/domain/1/log-throttling /local/domain/1/log-throttling
(d2) xs_read(/local/domain/1/log-throttling): ENOENT
(d2) xs_read_watch() -> /local/domain/1/cpu vcpu-set
(d2) xs_read_watch() -> device-model/1/command dm-command
(d2) xs_read(device-model/1/command): ENOENT
(d2) xs_read_watch() -> device-model/1/logdirty/cmd logdirty
(d2) xs_read(device-model/1/logdirty/cmd): ENOENT
(d1) HVM Loader
(d1) Detected Xen v4.12.1-1.el7
(d1) Xenbus rings @0xfeffc000, event channel 1
(d1) System requested ROMBIOS
(d1) CPU speed is 2200 MHz
(d1) Relocating guest memory for lowmem MMIO space enabled
(XEN) irq.c:374: Dom1 PCI link 0 changed 0 -> 5
(d1) PCI-ISA link 0 routed to IRQ5
(XEN) irq.c:374: Dom1 PCI link 1 changed 0 -> 10
(d1) PCI-ISA link 1 routed to IRQ10
(XEN) irq.c:374: Dom1 PCI link 2 changed 0 -> 11
(d1) PCI-ISA link 2 routed to IRQ11
(XEN) irq.c:374: Dom1 PCI link 3 changed 0 -> 5
(d1) PCI-ISA link 3 routed to IRQ5
(d1) pci dev 01:3 INTA->IRQ10
(d1) pci dev 02:0 INTA->IRQ11
(d1) pci dev 03:0 INTA->IRQ5
(d1) No RAM in high memory; setting high_mem resource base to 100000000
(d1) pci dev 02:0 bar 14 size 001000000: 0f0000008
(d1) pci dev 02:0 bar 10 size 000000100: 00000c001
(d1) pci dev 03:0 bar 10 size 000000100: 00000c101
(d1) pci dev 03:0 bar 14 size 000000100: 0f1000000
(d1) pci dev 01:1 bar 20 size 000000010: 00000c201
(d1) Multiprocessor initialisation:
(d1)  - CPU0 ... 46-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1)  - CPU1 ... 46-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1) Testing HVM environment:
(d1) Using scratch memory at 400000
(d1)  - REP INSB across page boundaries ... passed
(d1)  - REP INSW across page boundaries ... passed
(d1)  - GS base MSRs and SWAPGS ... passed
(d1) Passed 3 of 3 tests
(d1) Writing SMBIOS tables ...
(d1) Loading ROMBIOS ...
(d1) 16796 bytes of ROMBIOS high-memory extensions:
(d1)   Relocating to 0xfc001000-0xfc00519c ... done
(d1) Creating MP tables ...
(d1) No emulated VGA adaptor ...
(d1) Loading PCI Option ROM ...
(d1)  - Manufacturer: http://ipxe.org
(d1)  - Product name: iPXE
(d1) Option ROMs:
(d1)  c8000-d97ff: Etherboot ROM
(d1) Loading ACPI ...
(d1) vm86 TSS at fc011480
(d1) BIOS map:
(d1)  f0000-fffff: Main BIOS
(d1) E820 table:
(d1)  [00]: 00000000:00000000 - 00000000:0009e000: RAM
(d1)  [01]: 00000000:0009e000 - 00000000:000a0000: RESERVED
(d1)  HOLE: 00000000:000a0000 - 00000000:000e0000
(d1)  [02]: 00000000:000e0000 - 00000000:00100000: RESERVED
(d1)  [03]: 00000000:00100000 - 00000000:c0000000: RAM
(d1)  HOLE: 00000000:c0000000 - 00000000:fc000000
(d1)  [04]: 00000000:fc000000 - 00000001:00000000: RESERVED
(d1) Invoking ROMBIOS ...
(d1) Bochs BIOS - build: 06/23/99
(d1) $Revision: 1.221 $ $Date: 2008/12/07 17:32:29 $
(d1) Options: apmbios pcibios eltorito PMM 
(d1) 
(d1) ata0 master: QEMU HARDDISK ATA-7 Hard-Disk (3072 MBytes)
(d1) 
(d1) 
(d1) 
(d1) Press F12 for boot menu.
(d1) 
(d1) Booting from Hard Disk...
(XEN) irq.c:374: Dom1 PCI link 0 changed 5 -> 0
(XEN) irq.c:374: Dom1 PCI link 1 changed 10 -> 0
(XEN) irq.c:374: Dom1 PCI link 2 changed 11 -> 0
(XEN) irq.c:374: Dom1 PCI link 3 changed 5 -> 0
(XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -> ffff82d08037c9f2
(XEN) traps.c:1576: GPF (0000): ffff82d08031a80f [vmx.c#vmx_msr_read_intercept+0x387/0x3fd] -> ffff82d08037c9f2
(d2) xs_write(/vm/95f11fc0-b9e7-47ff-8523-bacab35b96b6/rtc/timeoffset): EACCES
(XEN) d1v1 Unhandled nested vmexit: reason 51
(XEN) domain_crash called from vvmx.c:2671
(XEN) Domain 1 (vcpu#1) crashed on cpu#2:
(XEN) ----[ Xen-4.12.1-1.el7  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    2
(XEN) RIP:    0010:[<ffffffffb3a695a2>]
(XEN) RFLAGS: 0000000000000006   CONTEXT: hvm guest (d1v1)
(XEN) rax: 000000002c175168   rbx: ffff92291f223680   rcx: 0000000000000008
(XEN) rdx: 0000000000000012   rsi: 0000000000000012   rdi: ffff92291f214100
(XEN) rbp: ffff92291f203e10   rsp: ffff92291f203df8   r8:  0000000000000000
(XEN) r9:  ffffffffffffffff   r10: 0000000000000000   r11: 0000003b9aca0000
(XEN) r12: 0000000000022ac0   r13: 0000000000000000   r14: ffffffffb5017740
(XEN) r15: ffffffffb502fb80   cr0: 0000000080050033   cr4: 00000000003626f0
(XEN) cr3: 000000001520e001   cr2: ffff922915c01000
(XEN) fsb: 0000000000000000   gsb: ffff92291f200000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0010
cmb@phys-dom0 ~$ exit
exit

Script done on Wed 02 Oct 2019 09:02:32 AM PDT

--=-=-=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=-=-=--

