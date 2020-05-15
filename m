Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3F1D5BF9
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 23:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZiH2-0004dF-O5; Fri, 15 May 2020 21:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2khj=65=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jZiH0-0004dA-Oa
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 21:53:42 +0000
X-Inumbo-ID: 894d2af8-96f6-11ea-9887-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 894d2af8-96f6-11ea-9887-bc764e2007e4;
 Fri, 15 May 2020 21:53:40 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04FLrZwT017507;
 Fri, 15 May 2020 23:53:35 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 6C18C2810; Fri, 15 May 2020 23:53:35 +0200 (CEST)
Date: Fri, 15 May 2020 23:53:35 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200515215335.GA9991@antioche.eu.org>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]);
 Fri, 15 May 2020 23:53:35 +0200 (MEST)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 15, 2020 at 10:38:13PM +0100, Andrew Cooper wrote:
> > [...]
> > Does it help ?
> 
> Yes and no.  This is collateral damage of earlier bug.
> 
> What failed was xen_init_fv()'s
> 
>     shared_page = xc_map_foreign_range(xc_handle, domid, XC_PAGE_SIZE,
>                                        PROT_READ|PROT_WRITE, ioreq_pfn);
>     if (shared_page == NULL) {
>         fprintf(logfile, "map shared IO page returned error %d\n", errno);
>         exit(-1);
>     }
> 
> because we've ended up with a non-NULL pointer with no mapping behind
> it, hence the SIGSEGV for the first time we try to use the pointer.
> 
> Whatever logic is behind xc_map_foreign_range() should have returned
> NULL or a real mapping.

What's strange is that the mapping is validated, by mapping it in
the dom0 kernel space. But when we try to remap in in the process's
space, it fails.

> 
> ioreq_pfn ought to be something just below the 4G boundary, and the
> toolstack ought to put memory there in the first place.  Can you
> identify what value ioreq_pfn has,

You mean, something like:
(gdb) print/x ioreq_pfn
$2 = 0xfeff0

> and whether it matches up with the
> magic gfn range as reported by `xl create -vvv` for the guest?

I guess you mean
xl -vvv create
the output is attached

The kernel says it tries to map 0xfeff0000 to virtual address 0x79656f951000.


-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=typescript
Content-Transfer-Encoding: quoted-printable

Script started on Fri May 15 23:47:25 2020
# xl -vvv create nb1=3D-=08 =08=08 =08-hbvm=08 =08=08 =08=08 =08vm=0D=0D
Parsing config from nb1-hvm=0D
libxl: debug: libxl_create.c:1819:do_domain_create: Domain 0:ao 0x75de79e9b=
000: create: how=3D0x0 callback=3D0x0 poller=3D0x75de79ec60a0=0D
libxl: detail: libxl_create.c:584:libxl__domain_make: passthrough: disabled=
=0D
libxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=
=3Dhda spec.backend=3Dunknown=0D
libxl: debug: libxl_device.c:415:libxl__device_disk_set_backend: Disk vdev=
=3Dhda, using backend phy=0D
libxl: debug: libxl_create.c:1148:initiate_domain_create: Domain 5:running =
bootloader=0D
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 5:not a =
PV/PVH domain, skipping bootloader=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79e64cd0: deregister unregistered=0D
domainbuilder: detail: xc_dom_allocate: cmdline=3D"", features=3D""=0D
domainbuilder: detail: xc_dom_kernel_file: filename=3D"/usr/pkg/libexec/xen=
/boot/hvmloader"=0D
domainbuilder: detail: xc_dom_malloc_filemap    : 337 kB=0D
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.13, caps xen-3.0-x86_64 =
xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 =0D
domainbuilder: detail: xc_dom_parse_image: called=0D
domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ... =0D
domainbuilder: detail: loader probe failed=0D
domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ... =
=0D
domainbuilder: detail: xc_dom_probe_bzimage_kernel: kernel is not a bzImage=
=0D
domainbuilder: detail: loader probe failed=0D
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ... =0D
domainbuilder: detail: loader probe OK=0D
xc: detail: ELF: phdr: paddr=3D0x100000 memsz=3D0x5c844=0D
xc: detail: ELF: memory: 0x100000 -> 0x15c844=0D
domainbuilder: detail: xc_dom_mem_init: mem 1020 MB, pages 0x3fc00 pages, 4=
k each=0D
domainbuilder: detail: xc_dom_mem_init: 0x3fc00 pages=0D
domainbuilder: detail: xc_dom_boot_mem_init: called=0D
domainbuilder: detail: range: start=3D0x0 end=3D0x3fc00000=0D
domainbuilder: detail: xc_dom_malloc            : 2040 kB=0D
xc: detail: PHYSICAL MEMORY ALLOCATION:=0D
xc: detail:   4KB PAGES: 0x0000000000000200=0D
xc: detail:   2MB PAGES: 0x00000000000001fd=0D
xc: detail:   1GB PAGES: 0x0000000000000000=0D
domainbuilder: detail: xc_dom_build_image: called=0D
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x100+=
0x5d at 0x75de79b31000=0D
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 -> 0=
x15d000  (pfn 0x100 + 0x5d pages)=0D
xc: detail: ELF: phdr 0 at 0x75de79ad4000 -> 0x75de79b26ca0=0D
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x15d+=
0x1 at 0x75de79e1d000=0D
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x15d000 ->=
 0x15e000  (pfn 0x15d + 0x1 pages)=0D
domainbuilder: detail: alloc_pgtables_hvm: doing nothing=0D
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x15e000=0D
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0=0D
domainbuilder: detail: xc_dom_boot_image: called=0D
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x=
86_64=0D
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x=
86_32p=0D
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_32 <=3D matches=0D
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_32p=0D
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x=
86_64=0D
domainbuilder: detail: domain builder memory footprint=0D
domainbuilder: detail:    allocated=0D
domainbuilder: detail:       malloc             : 2045 kB=0D
domainbuilder: detail:       anon mmap          : 0 bytes=0D
domainbuilder: detail:    mapped=0D
domainbuilder: detail:       file mmap          : 337 kB=0D
domainbuilder: detail:       domU mmap          : 376 kB=0D
domainbuilder: detail: vcpu_hvm: called=0D
domainbuilder: detail: compat_gnttab_hvm_seed: d5: pfn=3D0xff000=0D
domainbuilder: detail: xc_dom_set_gnttab_entry: d5 gnt[0] -> d0 0xfefff=0D
domainbuilder: detail: xc_dom_set_gnttab_entry: d5 gnt[1] -> d0 0xfeffc=0D
domainbuilder: detail: xc_dom_release: called=0D
libxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=
=3Dhda spec.backend=3Dphy=0D
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x75d=
e79bfd4d0 wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/0: regi=
ster slotnum=3D3=0D
libxl: debug: libxl_create.c:1856:do_domain_create: Domain 0:ao 0x75de79e9b=
000: inprogress: poller=3D0x75de79ec60a0, flags=3Di=0D
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x75de79bfd4d0 =
wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/0: event epath=3D=
/local/domain/0/backend/vbd/5/768/state=0D
libxl: debug: libxl_event.c:881:devstate_callback: backend /local/domain/0/=
backend/vbd/5/768/state wanted state 2 still waiting state 1=0D
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x75de79bfd4d0 =
wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/0: event epath=3D=
/local/domain/0/backend/vbd/5/768/state=0D
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/=
backend/vbd/5/768/state wanted state 2 ok=0D
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfd4d0 wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/0: de=
register slotnum=3D3=0D
libxl: debug: libxl_device.c:1090:device_backend_callback: Domain 5:calling=
 device_backend_cleanup=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfd4d0: deregister unregistered=0D
libxl: debug: libxl_device.c:1191:device_hotplug: Domain 5:calling hotplug =
script: /usr/pkg/etc/xen/scripts/block /local/domain/0/backend/vbd/5/768=0D
libxl: debug: libxl_device.c:1192:device_hotplug: Domain 5:extra args:=0D
libxl: debug: libxl_device.c:1198:device_hotplug: Domain 5:     2=0D
libxl: debug: libxl_device.c:1200:device_hotplug: Domain 5:env:=0D
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execu=
te: /usr/pkg/etc/xen/scripts/block /local/domain/0/backend/vbd/5/768 =0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfd5d0: deregister unregistered=0D
libxl: debug: libxl_netbsd.c:74:libxl__get_hotplug_script_info: Domain 5:nu=
m_exec 1, not running hotplug scripts=0D
libxl: debug: libxl_device.c:1176:device_hotplug: Domain 5:No hotplug scrip=
t to execute=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfd5d0: deregister unregistered=0D
libxl: debug: libxl_dm.c:2626:libxl__spawn_local_dm: Domain 5:Spawning devi=
ce-model /usr/pkg/libexec/xen/bin/qemu-dm with arguments:=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  /usr/pkg/li=
bexec/xen/bin/qemu-dm=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -d=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  5=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -domain-nam=
e=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  nb1=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -vnc=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  132.227.103=
=2E47:1=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -videoram=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  4=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -boot=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  cda=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -usb=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -usbdevice=
=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  tablet=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -acpi=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -vcpu_avail=
=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  0x01=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -net=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  nic,vlan=3D=
0,macaddr=3D00:16:3e:00:10:54,model=3De1000=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -net=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  tap,vlan=3D=
0,ifname=3Dxvif5i0-emu,bridge=3Dbridge0,script=3D/usr/pkg/etc/xen/scripts/q=
emu-ifup,downscript=3D/usr/pkg/etc/xen/scripts/qemu-ifup=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  -M=0D
libxl: debug: libxl_dm.c:2628:libxl__spawn_local_dm: Domain 5:  xenfv=0D
libxl: debug: libxl_dm.c:2630:libxl__spawn_local_dm: Domain 5:Spawning devi=
ce-model /usr/pkg/libexec/xen/bin/qemu-dm with additional environment:=0D
libxl: debug: libxl_dm.c:2632:libxl__spawn_local_dm: Domain 5:  XEN_QEMU_CO=
NSOLE_LIMIT=3D1048576=0D
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x75d=
e79e64fc8 wpath=3D/local/domain/0/device-model/5/state token=3D3/1: registe=
r slotnum=3D3=0D
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x75de79e64fc8 =
wpath=3D/local/domain/0/device-model/5/state token=3D3/1: event epath=3D/lo=
cal/domain/0/device-model/5/state=0D
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 5 device model: sp=
awn watch p=3D(null)=0D
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79e64fc8 wpath=3D/local/domain/0/device-model/5/state token=3D3/1: dereg=
ister slotnum=3D3=0D
libxl: error: libxl_dm.c:2783:device_model_spawn_outcome: Domain 5:domain 5=
 device model: spawn failed (rc=3D-3)=0D
libxl: error: libxl_dm.c:2999:device_model_postconfig_done: Domain 5:Post D=
M startup configs failed, rc=3D-3=0D
libxl: debug: libxl_qmp.c:1896:libxl__ev_qmp_dispose: Domain 0: ev 0x75de79=
e64fe0=0D
libxl: error: libxl_create.c:1676:domcreate_devmodel_started: Domain 5:devi=
ce model did not start: -3=0D
libxl: debug: libxl_dm.c:3237:libxl__destroy_device_model: Domain 5:Didn't =
find dm UID; destroying by pid=0D
libxl: error: libxl_dm.c:3103:kill_device_model: Device Model already exite=
d=0D
libxl: debug: libxl_event.c:639:libxl__ev_xswatch_register: watch w=3D0x75d=
e79bfe0d0 wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/2: regi=
ster slotnum=3D3=0D
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x75de79bfe0d0 =
wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/2: event epath=3D=
/local/domain/0/backend/vbd/5/768/state=0D
libxl: debug: libxl_event.c:881:devstate_callback: backend /local/domain/0/=
backend/vbd/5/768/state wanted state 6 still waiting state 5=0D
libxl: debug: libxl_event.c:576:watchfd_callback: watch w=3D0x75de79bfe0d0 =
wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/2: event epath=3D=
/local/domain/0/backend/vbd/5/768/state=0D
libxl: debug: libxl_event.c:877:devstate_callback: backend /local/domain/0/=
backend/vbd/5/768/state wanted state 6 ok=0D
libxl: debug: libxl_event.c:676:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfe0d0 wpath=3D/local/domain/0/backend/vbd/5/768/state token=3D3/2: de=
register slotnum=3D3=0D
libxl: debug: libxl_device.c:1090:device_backend_callback: Domain 5:calling=
 device_backend_cleanup=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfe0d0: deregister unregistered=0D
libxl: debug: libxl_device.c:1191:device_hotplug: Domain 5:calling hotplug =
script: /usr/pkg/etc/xen/scripts/block /local/domain/0/backend/vbd/5/768=0D
libxl: debug: libxl_device.c:1192:device_hotplug: Domain 5:extra args:=0D
libxl: debug: libxl_device.c:1198:device_hotplug: Domain 5:     6=0D
libxl: debug: libxl_device.c:1200:device_hotplug: Domain 5:env:=0D
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execu=
te: /usr/pkg/etc/xen/scripts/block /local/domain/0/backend/vbd/5/768 =0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfe1d0: deregister unregistered=0D
libxl: debug: libxl_netbsd.c:74:libxl__get_hotplug_script_info: Domain 5:nu=
m_exec 1, not running hotplug scripts=0D
libxl: debug: libxl_device.c:1176:device_hotplug: Domain 5:No hotplug scrip=
t to execute=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfe1d0: deregister unregistered=0D
libxl: debug: libxl_device.c:1176:device_hotplug: Domain 5:No hotplug scrip=
t to execute=0D
libxl: debug: libxl_event.c:689:libxl__ev_xswatch_deregister: watch w=3D0x7=
5de79bfe5d0: deregister unregistered=0D
libxl: debug: libxl_domain.c:1355:devices_destroy_cb: Domain 5:Forked pid 2=
095 for destroy of domain=0D
libxl: debug: libxl_event.c:1893:libxl__ao_complete: ao 0x75de79e9b000: com=
plete, rc=3D-3=0D
libxl: debug: libxl_event.c:1862:libxl__ao__destroy: ao 0x75de79e9b000: des=
troy=0D
libxl: debug: libxl_domain.c:1040:libxl_domain_destroy: Domain 5:ao 0x75de7=
9e9b000: create: how=3D0x0 callback=3D0x0 poller=3D0x75de79ec60a0=0D
libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 5:Non-exista=
nt domain=0D
libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 5:Unable =
to destroy guest=0D
libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 5:Destruction o=
f domain failed=0D
libxl: debug: libxl_event.c:1893:libxl__ao_complete: ao 0x75de79e9b000: com=
plete, rc=3D-21=0D
libxl: debug: libxl_domain.c:1049:libxl_domain_destroy: Domain 5:ao 0x75de7=
9e9b000: inprogress: poller=3D0x75de79ec60a0, flags=3Dic=0D
libxl: debug: libxl_event.c:1862:libxl__ao__destroy: ao 0x75de79e9b000: des=
troy=0D
xencall:buffer: debug: total allocations:400 total releases:400=0D
xencall:buffer: debug: current allocations:0 maximum allocations:3=0D
xencall:buffer: debug: cache current size:3=0D
xencall:buffer: debug: cache hits:383 misses:3 toobig:14=0D
xencall:buffer: debug: total allocations:0 total releases:0=0D
xencall:buffer: debug: current allocations:0 maximum allocations:0=0D
xencall:buffer: debug: cache current size:0=0D
xencall:buffer: debug: cache hits:0 misses:0 toobig:0=0D
#=20
Script done on Fri May 15 23:47:46 2020

--ew6BAiZeqk4r7MaW--

