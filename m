Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D9255D62
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfz7-0004iO-OM; Fri, 28 Aug 2020 15:08:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfz6-0004eG-4q
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:08 +0000
X-Inumbo-ID: 0d69e379-c5e3-4af1-9278-45bdbcd4107a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d69e379-c5e3-4af1-9278-45bdbcd4107a;
 Fri, 28 Aug 2020 15:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C4B5AF1F;
 Fri, 28 Aug 2020 15:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>
Subject: [PATCH v4 00/31] tools: move most libraries into tools/libs
Date: Fri, 28 Aug 2020 17:07:16 +0200
Message-Id: <20200828150747.25305-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move most remaining libraries under tools/libs, including libxenctrl
and libxl. This is resulting in a lot of cleanup work regarding
building libs and restructuring of the tools directory.

After this huge cleanup all dependencies between libraries are defined
in a single rather small file tools/libs/uselibs.mk, which is used to
create the needed make variables and to control the stubdom build
dependencies as well.

Another bonus of the rework is the automation of setting the versions
of unstable libraries. This removes the need to bump those versions
manually for each Xen release.

libfsimage is not moved by this series, as IMO there are some open
questions:
- should it really be unstable?
- is the support of adding external fs-support used in practice, i.e.
  shouldn't the fs-specific sub-libraries be just included into
  libfsimage instead of being loaded dynamically?

The complete series is available via:

git://xenbits.xen.org/people/jgross/xen.git libbuild-v4

Changes in V4:
- removed already applied patches (1-8, 10)
- added new patches 1, 29
- replaced (old) patch 37 with new patch 30
- especially fixed qemu build and parallel make
- rebased to current staging

Changes in V3:
- more cleanup added
- added moving libxenguest, libxl and libxlutil
- split out dependencies into uselibs.mk
- use uselibs.mk for stubdoms build

Juergen Gross (31):
  tools: generate pkg-config files from make variables
  tools: drop explicit path specifications for qemu build
  tools/python: drop libxenguest from setup.py
  tools: fix pkg-config file for libxenguest
  tools: don't assume libxenguest and libxenctrl to be in same directory
  tools/misc: don't use libxenctrl internals from xen-hptool
  tools/misc: don't include xg_save_restore.h from xen-mfndump.c
  tools/misc: replace PAGE_SIZE with XC_PAGE_SIZE in xen-mfndump.c
  tools/misc: drop all libxc internals from xen-mfndump.c
  tools/libxc: remove unused headers xc_efi.h and xc_elf.h
  tools/libxc: move xc_[un]map_domain_meminfo() into new source
    xg_domain.c
  tools/libxc: rename all libxenguest sources to xg_*
  tools/libxc: rename libxenguest internal headers
  tools/misc: rename xc_dom.h do xenctrl_dom.h
  tools/libxc: untangle libxenctrl from libxenguest
  tools/xcutils: use official headers in readnotes
  tools/xenpaging: remove libxc internals
  tools: move libxenctrl below tools/libs
  tools/libxc: move libxenguest to tools/libs/guest
  tools: split libxenstore into new tools/libs/store directory
  tools: split libxenvchan into new tools/libs/vchan directory
  tools: split libxenstat into new tools/libs/stat directory
  tools/libxl: fix dependencies of libxl tests
  tools/libxl: don't include libxl_osdeps.h from libxlutil sources
  tools/libxl: add missing items to clean target
  tools/libxl: move xl parsing checks to tools/xl
  tools/xl: don't assume libxl and libxlutil are in one directory
  tools/libxl: move libxenlight to tools/libs/light
  tools: rename global libxlutil make variables
  tools/libs: add option for library names not starting with libxen
  tools: move libxlutil to tools/libs/util

 .gitignore                                    |  74 ++--
 MAINTAINERS                                   |   2 +-
 stubdom/Makefile                              |  36 +-
 stubdom/grub/Makefile                         |   4 +-
 stubdom/grub/kexec.c                          |   2 +-
 stubdom/mini-os.mk                            |   6 +-
 tools/Makefile                                |  34 +-
 tools/Rules.mk                                | 102 ++---
 tools/configure                               |   2 +-
 tools/configure.ac                            |   2 +-
 tools/helpers/init-xenstore-domain.c          |   2 +-
 tools/libs/Makefile                           |   7 +
 tools/libs/call/xencall.pc.in                 |  10 -
 tools/libs/ctrl/Makefile                      |  72 ++++
 tools/{libxc => libs/ctrl}/include/xenctrl.h  |   0
 .../ctrl}/include/xenctrl_compat.h            |   0
 .../ctrl/include/xenctrl_dom.h}               |  10 +-
 tools/{libxc => libs/ctrl}/xc_altp2m.c        |   0
 tools/{libxc => libs/ctrl}/xc_arinc653.c      |   0
 tools/{libxc => libs/ctrl}/xc_bitops.h        |   0
 tools/{libxc => libs/ctrl}/xc_core.c          |   5 +-
 tools/{libxc => libs/ctrl}/xc_core.h          |   2 +-
 tools/{libxc => libs/ctrl}/xc_core_arm.c      |   2 +-
 tools/{libxc => libs/ctrl}/xc_core_arm.h      |   0
 tools/{libxc => libs/ctrl}/xc_core_x86.c      |   6 +-
 tools/{libxc => libs/ctrl}/xc_core_x86.h      |   0
 tools/{libxc => libs/ctrl}/xc_cpu_hotplug.c   |   0
 tools/{libxc => libs/ctrl}/xc_cpupool.c       |   0
 tools/{libxc => libs/ctrl}/xc_csched.c        |   0
 tools/{libxc => libs/ctrl}/xc_csched2.c       |   0
 .../ctrl}/xc_devicemodel_compat.c             |   0
 tools/{libxc => libs/ctrl}/xc_domain.c        | 129 +-----
 tools/{libxc => libs/ctrl}/xc_evtchn.c        |   0
 tools/{libxc => libs/ctrl}/xc_evtchn_compat.c |   0
 tools/{libxc => libs/ctrl}/xc_flask.c         |   0
 .../{libxc => libs/ctrl}/xc_foreign_memory.c  |   0
 tools/{libxc => libs/ctrl}/xc_freebsd.c       |   0
 tools/{libxc => libs/ctrl}/xc_gnttab.c        |   0
 tools/{libxc => libs/ctrl}/xc_gnttab_compat.c |   0
 tools/{libxc => libs/ctrl}/xc_hcall_buf.c     |   1 -
 tools/{libxc => libs/ctrl}/xc_kexec.c         |   0
 tools/{libxc => libs/ctrl}/xc_linux.c         |   0
 tools/{libxc => libs/ctrl}/xc_mem_access.c    |   0
 tools/{libxc => libs/ctrl}/xc_mem_paging.c    |   0
 tools/{libxc => libs/ctrl}/xc_memshr.c        |   0
 tools/{libxc => libs/ctrl}/xc_minios.c        |   0
 tools/{libxc => libs/ctrl}/xc_misc.c          |   0
 tools/{libxc => libs/ctrl}/xc_monitor.c       |   0
 tools/{libxc => libs/ctrl}/xc_msr_x86.h       |   0
 tools/{libxc => libs/ctrl}/xc_netbsd.c        |   0
 tools/{libxc => libs/ctrl}/xc_pagetab.c       |   0
 tools/{libxc => libs/ctrl}/xc_physdev.c       |   0
 tools/{libxc => libs/ctrl}/xc_pm.c            |   0
 tools/{libxc => libs/ctrl}/xc_private.c       |   3 +-
 tools/{libxc => libs/ctrl}/xc_private.h       |  36 ++
 tools/{libxc => libs/ctrl}/xc_psr.c           |   0
 tools/{libxc => libs/ctrl}/xc_resource.c      |   0
 tools/{libxc => libs/ctrl}/xc_resume.c        |   2 -
 tools/{libxc => libs/ctrl}/xc_rt.c            |   0
 tools/{libxc => libs/ctrl}/xc_solaris.c       |   0
 tools/{libxc => libs/ctrl}/xc_tbuf.c          |   0
 tools/{libxc => libs/ctrl}/xc_vm_event.c      |   0
 tools/libs/devicemodel/xendevicemodel.pc.in   |  10 -
 tools/libs/evtchn/xenevtchn.pc.in             |  10 -
 .../libs/foreignmemory/xenforeignmemory.pc.in |  10 -
 tools/libs/gnttab/xengnttab.pc.in             |  10 -
 tools/{libxc => libs/guest}/COPYING           |   0
 tools/libs/guest/Makefile                     | 121 ++++++
 .../{libxc => libs/guest}/include/xenguest.h  |   8 +-
 .../guest/xg_cpuid_x86.c}                     |   0
 .../xc_dom_arm.c => libs/guest/xg_dom_arm.c}  |   2 +-
 .../guest/xg_dom_armzimageloader.c}           |   2 +-
 .../guest/xg_dom_binloader.c}                 |   2 +-
 .../guest/xg_dom_boot.c}                      |   2 +-
 .../guest/xg_dom_bzimageloader.c}             |   2 +-
 .../guest/xg_dom_compat_linux.c}              |   2 +-
 .../guest/xg_dom_core.c}                      |   2 +-
 .../guest/xg_dom_decompress.h}                |   4 +-
 .../guest/xg_dom_decompress_lz4.c}            |   2 +-
 .../guest/xg_dom_decompress_unsafe.c}         |   2 +-
 .../guest/xg_dom_decompress_unsafe.h}         |   2 +-
 .../guest/xg_dom_decompress_unsafe_bzip2.c}   |   2 +-
 .../guest/xg_dom_decompress_unsafe_lzma.c}    |   2 +-
 .../guest/xg_dom_decompress_unsafe_lzo1x.c}   |   2 +-
 .../guest/xg_dom_decompress_unsafe_xz.c}      |   2 +-
 .../guest/xg_dom_elfloader.c}                 |   2 +-
 .../guest/xg_dom_hvmloader.c}                 |   2 +-
 .../xc_dom_x86.c => libs/guest/xg_dom_x86.c}  |   2 +-
 tools/libs/guest/xg_domain.c                  | 149 +++++++
 .../guest/xg_nomigrate.c}                     |   0
 .../guest/xg_offline_page.c}                  |   2 +-
 tools/{libxc => libs/guest}/xg_private.c      |   0
 tools/{libxc => libs/guest}/xg_private.h      |  22 -
 tools/{libxc => libs/guest}/xg_save_restore.h |  13 -
 .../guest/xg_sr_common.c}                     |   2 +-
 .../guest/xg_sr_common.h}                     |   4 +-
 .../guest/xg_sr_common_x86.c}                 |   2 +-
 .../guest/xg_sr_common_x86.h}                 |   2 +-
 .../guest/xg_sr_common_x86_pv.c}              |   2 +-
 .../guest/xg_sr_common_x86_pv.h}              |   2 +-
 .../guest/xg_sr_restore.c}                    |   2 +-
 .../guest/xg_sr_restore_x86_hvm.c}            |   2 +-
 .../guest/xg_sr_restore_x86_pv.c}             |   2 +-
 .../xc_sr_save.c => libs/guest/xg_sr_save.c}  |   2 +-
 .../guest/xg_sr_save_x86_hvm.c}               |   2 +-
 .../guest/xg_sr_save_x86_pv.c}                |   2 +-
 .../guest/xg_sr_stream_format.h}              |   0
 .../xc_suspend.c => libs/guest/xg_suspend.c}  |   0
 tools/libs/hypfs/xenhypfs.pc.in               |  10 -
 tools/libs/libs.mk                            |  47 ++-
 tools/{libxl => libs/light}/CODING_STYLE      |   0
 tools/libs/light/Makefile                     | 291 ++++++++++++++
 .../light}/check-libxl-api-rules              |   0
 tools/{libxl => libs/light}/flexarray.c       |   0
 tools/{libxl => libs/light}/flexarray.h       |   0
 tools/{libxl => libs/light}/gentest.py        |   0
 tools/{libxl => libs/light}/gentypes.py       |   0
 tools/{libxl => libs/light}/idl.py            |   0
 tools/{libxl => libs/light}/idl.txt           |   0
 tools/{libxl => libs/light/include}/libxl.h   |   0
 .../light/include}/libxl_event.h              |   0
 .../light/include}/libxl_json.h               |   0
 .../light/include}/libxl_utils.h              |   0
 .../light/include}/libxl_uuid.h               |   0
 tools/{libxl => libs/light}/libxl.c           |   0
 tools/{libxl => libs/light}/libxl_9pfs.c      |   0
 tools/{libxl => libs/light}/libxl_aoutils.c   |   0
 tools/{libxl => libs/light}/libxl_arch.h      |   0
 tools/{libxl => libs/light}/libxl_arm.c       |   2 +-
 tools/{libxl => libs/light}/libxl_arm.h       |   2 +-
 tools/{libxl => libs/light}/libxl_arm_acpi.c  |   0
 .../{libxl => libs/light}/libxl_arm_no_acpi.c |   0
 .../{libxl => libs/light}/libxl_bootloader.c  |   0
 .../light}/libxl_checkpoint_device.c          |   0
 tools/{libxl => libs/light}/libxl_colo.h      |   0
 tools/{libxl => libs/light}/libxl_colo_nic.c  |   0
 .../{libxl => libs/light}/libxl_colo_proxy.c  |   0
 .../{libxl => libs/light}/libxl_colo_qdisk.c  |   0
 .../light}/libxl_colo_restore.c               |   0
 tools/{libxl => libs/light}/libxl_colo_save.c |   0
 tools/{libxl => libs/light}/libxl_console.c   |   0
 .../light}/libxl_convert_callout.c            |   0
 tools/{libxl => libs/light}/libxl_cpuid.c     |   0
 tools/{libxl => libs/light}/libxl_cpupool.c   |   0
 tools/{libxl => libs/light}/libxl_create.c    |   2 +-
 tools/{libxl => libs/light}/libxl_device.c    |   0
 tools/{libxl => libs/light}/libxl_disk.c      |   0
 tools/{libxl => libs/light}/libxl_dm.c        |   2 +-
 tools/{libxl => libs/light}/libxl_dom.c       |   2 +-
 tools/{libxl => libs/light}/libxl_dom_save.c  |   0
 .../{libxl => libs/light}/libxl_dom_suspend.c |   0
 tools/{libxl => libs/light}/libxl_domain.c    |   0
 tools/{libxl => libs/light}/libxl_event.c     |   0
 tools/{libxl => libs/light}/libxl_exec.c      |   0
 tools/{libxl => libs/light}/libxl_flask.c     |   0
 tools/{libxl => libs/light}/libxl_fork.c      |   0
 tools/{libxl => libs/light}/libxl_freebsd.c   |   0
 tools/{libxl => libs/light}/libxl_genid.c     |   0
 tools/{libxl => libs/light}/libxl_internal.c  |   0
 tools/{libxl => libs/light}/libxl_internal.h  |   2 +-
 tools/{libxl => libs/light}/libxl_json.c      |   0
 .../light}/libxl_libfdt_compat.c              |   0
 .../light}/libxl_libfdt_compat.h              |   0
 tools/{libxl => libs/light}/libxl_linux.c     |   0
 tools/{libxl => libs/light}/libxl_mem.c       |   0
 tools/{libxl => libs/light}/libxl_netbsd.c    |   0
 tools/{libxl => libs/light}/libxl_netbuffer.c |   0
 tools/{libxl => libs/light}/libxl_nic.c       |   0
 tools/{libxl => libs/light}/libxl_no_colo.c   |   0
 .../light}/libxl_no_convert_callout.c         |   0
 tools/{libxl => libs/light}/libxl_nocpuid.c   |   0
 .../{libxl => libs/light}/libxl_nonetbuffer.c |   0
 tools/{libxl => libs/light}/libxl_numa.c      |   0
 tools/{libxl => libs/light}/libxl_osdeps.h    |   0
 tools/{libxl => libs/light}/libxl_paths.c     |   0
 tools/{libxl => libs/light}/libxl_pci.c       |   0
 tools/{libxl => libs/light}/libxl_psr.c       |   0
 tools/{libxl => libs/light}/libxl_pvcalls.c   |   0
 tools/{libxl => libs/light}/libxl_qmp.c       |   0
 tools/{libxl => libs/light}/libxl_remus.c     |   0
 .../light}/libxl_remus_disk_drbd.c            |   0
 .../light}/libxl_save_callout.c               |   0
 .../{libxl => libs/light}/libxl_save_helper.c |   0
 .../light}/libxl_save_msgs_gen.pl             |   0
 tools/{libxl => libs/light}/libxl_sched.c     |   0
 .../light}/libxl_sr_stream_format.h           |   0
 .../{libxl => libs/light}/libxl_stream_read.c |   0
 .../light}/libxl_stream_write.c               |   0
 .../light}/libxl_test_fdevent.c               |   0
 .../light}/libxl_test_fdevent.h               |   0
 .../light}/libxl_test_timedereg.c             |   0
 .../light}/libxl_test_timedereg.h             |   0
 tools/{libxl => libs/light}/libxl_tmem.c      |   0
 tools/{libxl => libs/light}/libxl_types.idl   |   0
 .../light}/libxl_types_internal.idl           |   0
 tools/{libxl => libs/light}/libxl_usb.c       |   0
 tools/{libxl => libs/light}/libxl_utils.c     |   0
 tools/{libxl => libs/light}/libxl_uuid.c      |   0
 tools/{libxl => libs/light}/libxl_vdispl.c    |   0
 tools/{libxl => libs/light}/libxl_vkb.c       |   0
 tools/{libxl => libs/light}/libxl_vnuma.c     |   2 +-
 tools/{libxl => libs/light}/libxl_vsnd.c      |   0
 tools/{libxl => libs/light}/libxl_vtpm.c      |   0
 tools/{libxl => libs/light}/libxl_x86.c       |   2 +-
 tools/{libxl => libs/light}/libxl_x86_acpi.c  |   2 +-
 tools/{libxl => libs/light}/libxl_x86_acpi.h  |   0
 tools/{libxl => libs/light}/libxl_xshelp.c    |   0
 tools/{libxl => libs/light}/osdeps.c          |   0
 tools/{libxl => libs/light}/test_common.c     |   0
 tools/{libxl => libs/light}/test_common.h     |   0
 .../{libxl => libs/light}/test_fdderegrace.c  |   0
 tools/{libxl => libs/light}/test_timedereg.c  |   0
 .../{xenstat/libxenstat => libs/stat}/COPYING |   0
 .../libxenstat => libs/stat}/Makefile         | 100 +----
 .../stat}/bindings/swig/perl/.empty           |   0
 .../stat}/bindings/swig/python/.empty         |   0
 .../stat}/bindings/swig/xenstat.i             |   0
 .../src => libs/stat/include}/xenstat.h       |   3 +
 .../libxenstat/src => libs/stat}/xenstat.c    |   0
 .../src => libs/stat}/xenstat_freebsd.c       |   0
 .../src => libs/stat}/xenstat_linux.c         |   4 +-
 .../src => libs/stat}/xenstat_netbsd.c        |   0
 .../src => libs/stat}/xenstat_priv.h          |   0
 .../src => libs/stat}/xenstat_qmp.c           |   0
 .../src => libs/stat}/xenstat_solaris.c       |   0
 tools/libs/store/Makefile                     |  64 +++
 .../store}/include/compat/xs.h                |   0
 .../store}/include/compat/xs_lib.h            |   0
 .../store}/include/xenstore.h                 |   0
 tools/libs/store/libxenstore.map              |  49 +++
 tools/{xenstore => libs/store}/xs.c           |   0
 tools/libs/toolcore/Makefile                  |   1 +
 tools/libs/toolcore/xentoolcore.pc.in         |   9 -
 tools/libs/toollog/xentoollog.pc.in           |   9 -
 tools/libs/uselibs.mk                         |  15 +
 tools/libs/util/CODING_STYLE                  | 330 +++++++++++++++
 tools/libs/util/Makefile                      |  63 +++
 .../{libxl => libs/util/include}/libxlutil.h  |   0
 tools/{libxl => libs/util}/libxlu_cfg.c       |   3 +-
 tools/{libxl => libs/util}/libxlu_cfg_i.h     |   1 -
 tools/{libxl => libs/util}/libxlu_cfg_l.c     |   0
 tools/{libxl => libs/util}/libxlu_cfg_l.h     |   0
 tools/{libxl => libs/util}/libxlu_cfg_l.l     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.c     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.h     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.y     |   0
 tools/{libxl => libs/util}/libxlu_disk.c      |   1 -
 tools/{libxl => libs/util}/libxlu_disk_i.h    |   0
 tools/{libxl => libs/util}/libxlu_disk_l.c    |  14 +-
 tools/{libxl => libs/util}/libxlu_disk_l.h    |   8 +-
 tools/{libxl => libs/util}/libxlu_disk_l.l    |   2 +-
 tools/{libxl => libs/util}/libxlu_internal.h  |   0
 tools/{libxl => libs/util}/libxlu_pci.c       |   3 +-
 tools/{libxl => libs/util}/libxlu_vif.c       |   3 +-
 tools/libs/vchan/Makefile                     |  20 +
 .../vchan/include}/libxenvchan.h              |   0
 tools/{libvchan => libs/vchan}/init.c         |   0
 tools/{libvchan => libs/vchan}/io.c           |   0
 tools/libvchan/Makefile                       |  95 -----
 tools/libvchan/xenvchan.pc.in                 |  10 -
 tools/libxc/Makefile                          | 280 -------------
 tools/libxc/xc_efi.h                          | 158 --------
 tools/libxc/xc_elf.h                          |  16 -
 tools/libxc/xencontrol.pc.in                  |  10 -
 tools/libxc/xenguest.pc.in                    |  10 -
 tools/libxl/Makefile                          | 375 ------------------
 tools/libxl/xenlight.pc.in                    |  12 -
 tools/libxl/xlutil.pc.in                      |  10 -
 tools/misc/Makefile                           |   5 +-
 tools/misc/xen-hptool.c                       |   8 +-
 tools/misc/xen-mfndump.c                      |  44 +-
 tools/ocaml/libs/xl/Makefile                  |   8 +-
 tools/ocaml/xenstored/Makefile                |   2 +-
 tools/python/Makefile                         |   2 +-
 tools/python/setup.py                         |  12 +-
 tools/python/xen/lowlevel/xc/xc.c             |   2 +-
 tools/vchan/Makefile                          |  37 ++
 tools/{libvchan => vchan}/node-select.c       |   0
 tools/{libvchan => vchan}/node.c              |   0
 .../{libvchan => vchan}/vchan-socket-proxy.c  |   0
 tools/xcutils/Makefile                        |   3 +-
 tools/xcutils/readnotes.c                     |   5 +-
 tools/xenpaging/Makefile                      |   3 +-
 tools/xenpaging/file_ops.c                    |   8 +-
 tools/xenpaging/pagein.c                      |   2 +-
 tools/xenpaging/policy_default.c              |   2 +-
 tools/xenpaging/xenpaging.c                   |  32 +-
 tools/xenpaging/xenpaging.h                   |  70 +++-
 tools/xenstat/Makefile                        |  10 -
 tools/xenstat/libxenstat/xenstat.pc.in        |  10 -
 tools/xenstore/Makefile                       |  82 +---
 tools/xenstore/xenstore.pc.in                 |  11 -
 tools/xenstore/{include => }/xenstore_lib.h   |   0
 tools/{xenstat => }/xentop/Makefile           |   2 +-
 tools/{xenstat => }/xentop/TODO               |   0
 tools/{xenstat => }/xentop/xentop.c           |   0
 tools/xl/Makefile                             |   3 +-
 tools/{libxl => xl}/check-xl-disk-parse       |   0
 tools/{libxl => xl}/check-xl-vcpupin-parse    |   0
 .../check-xl-vcpupin-parse.data-example       |   0
 tools/{libxl => xl}/check-xl-vif-parse        |   0
 301 files changed, 1643 insertions(+), 1734 deletions(-)
 delete mode 100644 tools/libs/call/xencall.pc.in
 create mode 100644 tools/libs/ctrl/Makefile
 rename tools/{libxc => libs/ctrl}/include/xenctrl.h (100%)
 rename tools/{libxc => libs/ctrl}/include/xenctrl_compat.h (100%)
 rename tools/{libxc/include/xc_dom.h => libs/ctrl/include/xenctrl_dom.h} (98%)
 rename tools/{libxc => libs/ctrl}/xc_altp2m.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_arinc653.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_bitops.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_core.c (99%)
 rename tools/{libxc => libs/ctrl}/xc_core.h (99%)
 rename tools/{libxc => libs/ctrl}/xc_core_arm.c (99%)
 rename tools/{libxc => libs/ctrl}/xc_core_arm.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_core_x86.c (98%)
 rename tools/{libxc => libs/ctrl}/xc_core_x86.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_cpu_hotplug.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_cpupool.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_csched.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_csched2.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_devicemodel_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_domain.c (94%)
 rename tools/{libxc => libs/ctrl}/xc_evtchn.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_evtchn_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_flask.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_foreign_memory.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_freebsd.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_gnttab.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_gnttab_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_hcall_buf.c (99%)
 rename tools/{libxc => libs/ctrl}/xc_kexec.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_linux.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_mem_access.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_mem_paging.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_memshr.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_minios.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_misc.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_monitor.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_msr_x86.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_netbsd.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_pagetab.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_physdev.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_pm.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_private.c (99%)
 rename tools/{libxc => libs/ctrl}/xc_private.h (91%)
 rename tools/{libxc => libs/ctrl}/xc_psr.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_resource.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_resume.c (99%)
 rename tools/{libxc => libs/ctrl}/xc_rt.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_solaris.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_tbuf.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_vm_event.c (100%)
 delete mode 100644 tools/libs/devicemodel/xendevicemodel.pc.in
 delete mode 100644 tools/libs/evtchn/xenevtchn.pc.in
 delete mode 100644 tools/libs/foreignmemory/xenforeignmemory.pc.in
 delete mode 100644 tools/libs/gnttab/xengnttab.pc.in
 rename tools/{libxc => libs/guest}/COPYING (100%)
 create mode 100644 tools/libs/guest/Makefile
 rename tools/{libxc => libs/guest}/include/xenguest.h (99%)
 rename tools/{libxc/xc_cpuid_x86.c => libs/guest/xg_cpuid_x86.c} (100%)
 rename tools/{libxc/xc_dom_arm.c => libs/guest/xg_dom_arm.c} (99%)
 rename tools/{libxc/xc_dom_armzimageloader.c => libs/guest/xg_dom_armzimageloader.c} (99%)
 rename tools/{libxc/xc_dom_binloader.c => libs/guest/xg_dom_binloader.c} (99%)
 rename tools/{libxc/xc_dom_boot.c => libs/guest/xg_dom_boot.c} (99%)
 rename tools/{libxc/xc_dom_bzimageloader.c => libs/guest/xg_dom_bzimageloader.c} (99%)
 rename tools/{libxc/xc_dom_compat_linux.c => libs/guest/xg_dom_compat_linux.c} (99%)
 rename tools/{libxc/xc_dom_core.c => libs/guest/xg_dom_core.c} (99%)
 rename tools/{libxc/xc_dom_decompress.h => libs/guest/xg_dom_decompress.h} (62%)
 rename tools/{libxc/xc_dom_decompress_lz4.c => libs/guest/xg_dom_decompress_lz4.c} (98%)
 rename tools/{libxc/xc_dom_decompress_unsafe.c => libs/guest/xg_dom_decompress_unsafe.c} (96%)
 rename tools/{libxc/xc_dom_decompress_unsafe.h => libs/guest/xg_dom_decompress_unsafe.h} (97%)
 rename tools/{libxc/xc_dom_decompress_unsafe_bzip2.c => libs/guest/xg_dom_decompress_unsafe_bzip2.c} (87%)
 rename tools/{libxc/xc_dom_decompress_unsafe_lzma.c => libs/guest/xg_dom_decompress_unsafe_lzma.c} (87%)
 rename tools/{libxc/xc_dom_decompress_unsafe_lzo1x.c => libs/guest/xg_dom_decompress_unsafe_lzo1x.c} (96%)
 rename tools/{libxc/xc_dom_decompress_unsafe_xz.c => libs/guest/xg_dom_decompress_unsafe_xz.c} (95%)
 rename tools/{libxc/xc_dom_elfloader.c => libs/guest/xg_dom_elfloader.c} (99%)
 rename tools/{libxc/xc_dom_hvmloader.c => libs/guest/xg_dom_hvmloader.c} (99%)
 rename tools/{libxc/xc_dom_x86.c => libs/guest/xg_dom_x86.c} (99%)
 create mode 100644 tools/libs/guest/xg_domain.c
 rename tools/{libxc/xc_nomigrate.c => libs/guest/xg_nomigrate.c} (100%)
 rename tools/{libxc/xc_offline_page.c => libs/guest/xg_offline_page.c} (99%)
 rename tools/{libxc => libs/guest}/xg_private.c (100%)
 rename tools/{libxc => libs/guest}/xg_private.h (81%)
 rename tools/{libxc => libs/guest}/xg_save_restore.h (91%)
 rename tools/{libxc/xc_sr_common.c => libs/guest/xg_sr_common.c} (99%)
 rename tools/{libxc/xc_sr_common.h => libs/guest/xg_sr_common.h} (99%)
 rename tools/{libxc/xc_sr_common_x86.c => libs/guest/xg_sr_common_x86.c} (99%)
 rename tools/{libxc/xc_sr_common_x86.h => libs/guest/xg_sr_common_x86.h} (98%)
 rename tools/{libxc/xc_sr_common_x86_pv.c => libs/guest/xg_sr_common_x86_pv.c} (99%)
 rename tools/{libxc/xc_sr_common_x86_pv.h => libs/guest/xg_sr_common_x86_pv.h} (98%)
 rename tools/{libxc/xc_sr_restore.c => libs/guest/xg_sr_restore.c} (99%)
 rename tools/{libxc/xc_sr_restore_x86_hvm.c => libs/guest/xg_sr_restore_x86_hvm.c} (99%)
 rename tools/{libxc/xc_sr_restore_x86_pv.c => libs/guest/xg_sr_restore_x86_pv.c} (99%)
 rename tools/{libxc/xc_sr_save.c => libs/guest/xg_sr_save.c} (99%)
 rename tools/{libxc/xc_sr_save_x86_hvm.c => libs/guest/xg_sr_save_x86_hvm.c} (99%)
 rename tools/{libxc/xc_sr_save_x86_pv.c => libs/guest/xg_sr_save_x86_pv.c} (99%)
 rename tools/{libxc/xc_sr_stream_format.h => libs/guest/xg_sr_stream_format.h} (100%)
 rename tools/{libxc/xc_suspend.c => libs/guest/xg_suspend.c} (100%)
 delete mode 100644 tools/libs/hypfs/xenhypfs.pc.in
 rename tools/{libxl => libs/light}/CODING_STYLE (100%)
 create mode 100644 tools/libs/light/Makefile
 rename tools/{libxl => libs/light}/check-libxl-api-rules (100%)
 rename tools/{libxl => libs/light}/flexarray.c (100%)
 rename tools/{libxl => libs/light}/flexarray.h (100%)
 rename tools/{libxl => libs/light}/gentest.py (100%)
 rename tools/{libxl => libs/light}/gentypes.py (100%)
 rename tools/{libxl => libs/light}/idl.py (100%)
 rename tools/{libxl => libs/light}/idl.txt (100%)
 rename tools/{libxl => libs/light/include}/libxl.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_event.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_json.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_utils.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_uuid.h (100%)
 rename tools/{libxl => libs/light}/libxl.c (100%)
 rename tools/{libxl => libs/light}/libxl_9pfs.c (100%)
 rename tools/{libxl => libs/light}/libxl_aoutils.c (100%)
 rename tools/{libxl => libs/light}/libxl_arch.h (100%)
 rename tools/{libxl => libs/light}/libxl_arm.c (99%)
 rename tools/{libxl => libs/light}/libxl_arm.h (98%)
 rename tools/{libxl => libs/light}/libxl_arm_acpi.c (100%)
 rename tools/{libxl => libs/light}/libxl_arm_no_acpi.c (100%)
 rename tools/{libxl => libs/light}/libxl_bootloader.c (100%)
 rename tools/{libxl => libs/light}/libxl_checkpoint_device.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo.h (100%)
 rename tools/{libxl => libs/light}/libxl_colo_nic.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_proxy.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_qdisk.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_restore.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_save.c (100%)
 rename tools/{libxl => libs/light}/libxl_console.c (100%)
 rename tools/{libxl => libs/light}/libxl_convert_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_cpuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_cpupool.c (100%)
 rename tools/{libxl => libs/light}/libxl_create.c (99%)
 rename tools/{libxl => libs/light}/libxl_device.c (100%)
 rename tools/{libxl => libs/light}/libxl_disk.c (100%)
 rename tools/{libxl => libs/light}/libxl_dm.c (99%)
 rename tools/{libxl => libs/light}/libxl_dom.c (99%)
 rename tools/{libxl => libs/light}/libxl_dom_save.c (100%)
 rename tools/{libxl => libs/light}/libxl_dom_suspend.c (100%)
 rename tools/{libxl => libs/light}/libxl_domain.c (100%)
 rename tools/{libxl => libs/light}/libxl_event.c (100%)
 rename tools/{libxl => libs/light}/libxl_exec.c (100%)
 rename tools/{libxl => libs/light}/libxl_flask.c (100%)
 rename tools/{libxl => libs/light}/libxl_fork.c (100%)
 rename tools/{libxl => libs/light}/libxl_freebsd.c (100%)
 rename tools/{libxl => libs/light}/libxl_genid.c (100%)
 rename tools/{libxl => libs/light}/libxl_internal.c (100%)
 rename tools/{libxl => libs/light}/libxl_internal.h (99%)
 rename tools/{libxl => libs/light}/libxl_json.c (100%)
 rename tools/{libxl => libs/light}/libxl_libfdt_compat.c (100%)
 rename tools/{libxl => libs/light}/libxl_libfdt_compat.h (100%)
 rename tools/{libxl => libs/light}/libxl_linux.c (100%)
 rename tools/{libxl => libs/light}/libxl_mem.c (100%)
 rename tools/{libxl => libs/light}/libxl_netbsd.c (100%)
 rename tools/{libxl => libs/light}/libxl_netbuffer.c (100%)
 rename tools/{libxl => libs/light}/libxl_nic.c (100%)
 rename tools/{libxl => libs/light}/libxl_no_colo.c (100%)
 rename tools/{libxl => libs/light}/libxl_no_convert_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_nocpuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_nonetbuffer.c (100%)
 rename tools/{libxl => libs/light}/libxl_numa.c (100%)
 rename tools/{libxl => libs/light}/libxl_osdeps.h (100%)
 rename tools/{libxl => libs/light}/libxl_paths.c (100%)
 rename tools/{libxl => libs/light}/libxl_pci.c (100%)
 rename tools/{libxl => libs/light}/libxl_psr.c (100%)
 rename tools/{libxl => libs/light}/libxl_pvcalls.c (100%)
 rename tools/{libxl => libs/light}/libxl_qmp.c (100%)
 rename tools/{libxl => libs/light}/libxl_remus.c (100%)
 rename tools/{libxl => libs/light}/libxl_remus_disk_drbd.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_helper.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_msgs_gen.pl (100%)
 rename tools/{libxl => libs/light}/libxl_sched.c (100%)
 rename tools/{libxl => libs/light}/libxl_sr_stream_format.h (100%)
 rename tools/{libxl => libs/light}/libxl_stream_read.c (100%)
 rename tools/{libxl => libs/light}/libxl_stream_write.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_fdevent.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_fdevent.h (100%)
 rename tools/{libxl => libs/light}/libxl_test_timedereg.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_timedereg.h (100%)
 rename tools/{libxl => libs/light}/libxl_tmem.c (100%)
 rename tools/{libxl => libs/light}/libxl_types.idl (100%)
 rename tools/{libxl => libs/light}/libxl_types_internal.idl (100%)
 rename tools/{libxl => libs/light}/libxl_usb.c (100%)
 rename tools/{libxl => libs/light}/libxl_utils.c (100%)
 rename tools/{libxl => libs/light}/libxl_uuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_vdispl.c (100%)
 rename tools/{libxl => libs/light}/libxl_vkb.c (100%)
 rename tools/{libxl => libs/light}/libxl_vnuma.c (99%)
 rename tools/{libxl => libs/light}/libxl_vsnd.c (100%)
 rename tools/{libxl => libs/light}/libxl_vtpm.c (100%)
 rename tools/{libxl => libs/light}/libxl_x86.c (99%)
 rename tools/{libxl => libs/light}/libxl_x86_acpi.c (99%)
 rename tools/{libxl => libs/light}/libxl_x86_acpi.h (100%)
 rename tools/{libxl => libs/light}/libxl_xshelp.c (100%)
 rename tools/{libxl => libs/light}/osdeps.c (100%)
 rename tools/{libxl => libs/light}/test_common.c (100%)
 rename tools/{libxl => libs/light}/test_common.h (100%)
 rename tools/{libxl => libs/light}/test_fdderegrace.c (100%)
 rename tools/{libxl => libs/light}/test_timedereg.c (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/COPYING (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/Makefile (55%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/perl/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/python/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/xenstat.i (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat/include}/xenstat.h (98%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_freebsd.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_linux.c (98%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_netbsd.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_priv.h (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_qmp.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_solaris.c (100%)
 create mode 100644 tools/libs/store/Makefile
 rename tools/{xenstore => libs/store}/include/compat/xs.h (100%)
 rename tools/{xenstore => libs/store}/include/compat/xs_lib.h (100%)
 rename tools/{xenstore => libs/store}/include/xenstore.h (100%)
 create mode 100644 tools/libs/store/libxenstore.map
 rename tools/{xenstore => libs/store}/xs.c (100%)
 delete mode 100644 tools/libs/toolcore/xentoolcore.pc.in
 delete mode 100644 tools/libs/toollog/xentoollog.pc.in
 create mode 100644 tools/libs/util/CODING_STYLE
 create mode 100644 tools/libs/util/Makefile
 rename tools/{libxl => libs/util/include}/libxlutil.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg.c (99%)
 rename tools/{libxl => libs/util}/libxlu_cfg_i.h (96%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.c (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.l (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.c (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.y (100%)
 rename tools/{libxl => libs/util}/libxlu_disk.c (97%)
 rename tools/{libxl => libs/util}/libxlu_disk_i.h (100%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.c (99%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.h (99%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.l (99%)
 rename tools/{libxl => libs/util}/libxlu_internal.h (100%)
 rename tools/{libxl => libs/util}/libxlu_pci.c (99%)
 rename tools/{libxl => libs/util}/libxlu_vif.c (98%)
 create mode 100644 tools/libs/vchan/Makefile
 rename tools/{libvchan => libs/vchan/include}/libxenvchan.h (100%)
 rename tools/{libvchan => libs/vchan}/init.c (100%)
 rename tools/{libvchan => libs/vchan}/io.c (100%)
 delete mode 100644 tools/libvchan/Makefile
 delete mode 100644 tools/libvchan/xenvchan.pc.in
 delete mode 100644 tools/libxc/Makefile
 delete mode 100644 tools/libxc/xc_efi.h
 delete mode 100644 tools/libxc/xc_elf.h
 delete mode 100644 tools/libxc/xencontrol.pc.in
 delete mode 100644 tools/libxc/xenguest.pc.in
 delete mode 100644 tools/libxl/Makefile
 delete mode 100644 tools/libxl/xenlight.pc.in
 delete mode 100644 tools/libxl/xlutil.pc.in
 create mode 100644 tools/vchan/Makefile
 rename tools/{libvchan => vchan}/node-select.c (100%)
 rename tools/{libvchan => vchan}/node.c (100%)
 rename tools/{libvchan => vchan}/vchan-socket-proxy.c (100%)
 delete mode 100644 tools/xenstat/Makefile
 delete mode 100644 tools/xenstat/libxenstat/xenstat.pc.in
 delete mode 100644 tools/xenstore/xenstore.pc.in
 rename tools/xenstore/{include => }/xenstore_lib.h (100%)
 rename tools/{xenstat => }/xentop/Makefile (97%)
 rename tools/{xenstat => }/xentop/TODO (100%)
 rename tools/{xenstat => }/xentop/xentop.c (100%)
 rename tools/{libxl => xl}/check-xl-disk-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse.data-example (100%)
 rename tools/{libxl => xl}/check-xl-vif-parse (100%)

-- 
2.26.2


