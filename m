Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C637D220D67
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvgt4-00074R-8y; Wed, 15 Jul 2020 12:51:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U57p=A2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jvgt2-00074M-HS
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:51:48 +0000
X-Inumbo-ID: f10b1ce0-c699-11ea-93d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f10b1ce0-c699-11ea-93d9-12813bfff9fa;
 Wed, 15 Jul 2020 12:51:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FC80AD81;
 Wed, 15 Jul 2020 12:51:49 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Subject: [PATCH 00/12] tools: move more libraries into tools/libs
Date: Wed, 15 Jul 2020 14:51:43 +0200
Message-Id: <20200715125143.15199-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move some more libraries under tools/libs, including libxenctrl. This
is resulting in a lot of cleanup work regarding building libs and
restructuring of the tools directory.

I have (for now) left out some more libraries like libxenguest and
libxl, but I can have a try moving those, too, if wanted.

Please note that patch 8 ("tools: move libxenctrl below tools/libs")
needs the related mini-os and qemu-trad patches applied in order not
to break the build:

https://lists.xen.org/archives/html/xen-devel/2020-07/msg00548.html
https://lists.xen.org/archives/html/xen-devel/2020-07/msg00617.html

As discussed at the Xen developers summit this series has been
selected to act as a test case for sending pull requests via gitlab.
This is the reason the patches are _not_ sent individually to
xen-devel, but only the cover letter.

The full series is available at:

git@gitlab.com:jgross1/xen.git libbuild/v1


Juergen Gross (12):
  stubdom: add stubdom/mini-os.mk for Xen paths used by Mini-OS
  tools: switch XEN_LIBXEN* make variables to lower case (XEN_libxen*)
  tools: add a copy of library headers in tools/include
  tools: don't call make recursively from libs.mk
  tools: define ROUNDUP() in tools/include/xen-tools/libs.h
  tools/misc: don't use libxenctrl internals from misc tools
  tools/libxc: untangle libxenctrl from libxenguest
  tools: move libxenctrl below tools/libs
  tools: split libxenstore into new tools/libs/store directory
  tools: split libxenvchan into new tools/libs/vchan directory
  tools: split libxenstat into new tools/libs/stat directory
  tools: generate most contents of library make variables

 .gitignore                                    |  29 +++-
 MAINTAINERS                                   |   2 +-
 stubdom/Makefile                              |  29 +++-
 stubdom/grub/kexec.c                          |   2 +-
 stubdom/mini-os.mk                            |  17 ++
 tools/Makefile                                |  15 +-
 tools/Rules.mk                                | 142 ++++++---------
 tools/console/daemon/io.c                     |   6 +-
 tools/golang/xenlight/Makefile                |   4 +-
 tools/helpers/init-xenstore-domain.c          |   2 +-
 tools/include/xen-tools/libs.h                |   4 +
 tools/libs/Makefile                           |   4 +
 tools/libs/call/Makefile                      |   3 +-
 tools/libs/call/buffer.c                      |   3 +-
 tools/libs/ctrl/Makefile                      |  68 ++++++++
 tools/{libxc => libs/ctrl}/include/xenctrl.h  |   0
 .../ctrl}/include/xenctrl_compat.h            |   0
 .../ctrl/include/xenctrl_dom.h}               |  10 +-
 tools/libs/ctrl/libxenctrl.map                |   3 +
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
 tools/{libxc => libs/ctrl}/xc_domain.c        | 129 +-------------
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
 tools/{libxc => libs/ctrl}/xc_private.h       |  36 ++++
 tools/{libxc => libs/ctrl}/xc_psr.c           |   0
 tools/{libxc => libs/ctrl}/xc_resource.c      |   0
 tools/{libxc => libs/ctrl}/xc_resume.c        |   2 -
 tools/{libxc => libs/ctrl}/xc_rt.c            |   0
 tools/{libxc => libs/ctrl}/xc_solaris.c       |   0
 tools/{libxc => libs/ctrl}/xc_tbuf.c          |   0
 tools/{libxc => libs/ctrl}/xc_vm_event.c      |   0
 .../ctrl/xenctrl.pc.in}                       |   0
 tools/libs/devicemodel/Makefile               |   3 +-
 tools/libs/evtchn/Makefile                    |   3 +-
 tools/libs/foreignmemory/Makefile             |   3 +-
 tools/libs/foreignmemory/linux.c              |   3 +-
 tools/libs/gnttab/Makefile                    |   3 +-
 tools/libs/gnttab/private.h                   |   3 -
 tools/libs/hypfs/Makefile                     |   3 +-
 tools/libs/libs.mk                            |  34 +++-
 .../{xenstat/libxenstat => libs/stat}/COPYING |   0
 .../libxenstat => libs/stat}/Makefile         |  97 +++--------
 .../stat}/bindings/swig/perl/.empty           |   0
 .../stat}/bindings/swig/python/.empty         |   0
 .../stat}/bindings/swig/xenstat.i             |   0
 .../src => libs/stat/include}/xenstat.h       |   3 +
 tools/libs/stat/libxenstat.map                |  54 ++++++
 .../libxenstat/src => libs/stat}/xenstat.c    |   0
 .../libxenstat => libs/stat}/xenstat.pc.in    |   2 +-
 .../src => libs/stat}/xenstat_freebsd.c       |   0
 .../src => libs/stat}/xenstat_linux.c         |   4 +-
 .../src => libs/stat}/xenstat_netbsd.c        |   0
 .../src => libs/stat}/xenstat_priv.h          |   0
 .../src => libs/stat}/xenstat_qmp.c           |   0
 .../src => libs/stat}/xenstat_solaris.c       |   0
 tools/libs/store/Makefile                     |  65 +++++++
 .../store}/include/compat/xs.h                |   0
 .../store}/include/compat/xs_lib.h            |   0
 .../store}/include/xenstore.h                 |   0
 tools/libs/store/libxenstore.map              |  49 ++++++
 tools/{xenstore => libs/store}/xenstore.pc.in |   0
 tools/{xenstore => libs/store}/xs.c           |   0
 tools/libs/toolcore/Makefile                  |   2 +-
 tools/libs/toollog/Makefile                   |   2 +-
 tools/libs/vchan/Makefile                     |  18 ++
 .../vchan/include}/libxenvchan.h              |   0
 tools/{libvchan => libs/vchan}/init.c         |   0
 tools/{libvchan => libs/vchan}/io.c           |   0
 tools/libs/vchan/libxenvchan.map              |  16 ++
 tools/{libvchan => libs/vchan}/xenvchan.pc.in |   0
 tools/libvchan/Makefile                       |  95 -----------
 tools/libxc/Makefile                          | 161 +++++-------------
 tools/libxc/include/xenguest.h                |   8 +-
 tools/libxc/xc_efi.h                          | 158 -----------------
 tools/libxc/xc_elf.h                          |  16 --
 .../libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c}  |   0
 tools/libxc/{xc_dom_arm.c => xg_dom_arm.c}    |   2 +-
 ...imageloader.c => xg_dom_armzimageloader.c} |   2 +-
 ...{xc_dom_binloader.c => xg_dom_binloader.c} |   2 +-
 tools/libxc/{xc_dom_boot.c => xg_dom_boot.c}  |   2 +-
 ...bzimageloader.c => xg_dom_bzimageloader.c} |   2 +-
 ...m_compat_linux.c => xg_dom_compat_linux.c} |   2 +-
 tools/libxc/{xc_dom_core.c => xg_dom_core.c}  |   2 +-
 ...c_dom_decompress.h => xg_dom_decompress.h} |   4 +-
 ...compress_lz4.c => xg_dom_decompress_lz4.c} |   2 +-
 ...ss_unsafe.c => xg_dom_decompress_unsafe.c} |   2 +-
 ...ss_unsafe.h => xg_dom_decompress_unsafe.h} |   2 +-
 ...ip2.c => xg_dom_decompress_unsafe_bzip2.c} |   2 +-
 ...lzma.c => xg_dom_decompress_unsafe_lzma.c} |   2 +-
 ...o1x.c => xg_dom_decompress_unsafe_lzo1x.c} |   2 +-
 ...afe_xz.c => xg_dom_decompress_unsafe_xz.c} |   2 +-
 ...{xc_dom_elfloader.c => xg_dom_elfloader.c} |   2 +-
 ...{xc_dom_hvmloader.c => xg_dom_hvmloader.c} |   2 +-
 tools/libxc/{xc_dom_x86.c => xg_dom_x86.c}    |   2 +-
 tools/libxc/xg_domain.c                       | 149 ++++++++++++++++
 .../libxc/{xc_nomigrate.c => xg_nomigrate.c}  |   0
 .../{xc_offline_page.c => xg_offline_page.c}  |   2 +-
 tools/libxc/xg_private.h                      |  23 ---
 tools/libxc/xg_save_restore.h                 |  13 --
 .../libxc/{xc_sr_common.c => xg_sr_common.c}  |   2 +-
 .../libxc/{xc_sr_common.h => xg_sr_common.h}  |   4 +-
 ...{xc_sr_common_x86.c => xg_sr_common_x86.c} |   2 +-
 ...{xc_sr_common_x86.h => xg_sr_common_x86.h} |   2 +-
 ..._common_x86_pv.c => xg_sr_common_x86_pv.c} |   2 +-
 ..._common_x86_pv.h => xg_sr_common_x86_pv.h} |   2 +-
 .../{xc_sr_restore.c => xg_sr_restore.c}      |   2 +-
 ...tore_x86_hvm.c => xg_sr_restore_x86_hvm.c} |   2 +-
 ...estore_x86_pv.c => xg_sr_restore_x86_pv.c} |   2 +-
 tools/libxc/{xc_sr_save.c => xg_sr_save.c}    |   2 +-
 ...sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} |   2 +-
 ...c_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} |   2 +-
 ..._stream_format.h => xg_sr_stream_format.h} |   0
 tools/libxc/{xc_suspend.c => xg_suspend.c}    |   0
 tools/libxl/Makefile                          |   2 +-
 tools/libxl/libxl_arm.c                       |   2 +-
 tools/libxl/libxl_arm.h                       |   2 +-
 tools/libxl/libxl_create.c                    |   2 +-
 tools/libxl/libxl_dm.c                        |   2 +-
 tools/libxl/libxl_dom.c                       |   2 +-
 tools/libxl/libxl_internal.h                  |   5 +-
 tools/libxl/libxl_vnuma.c                     |   2 +-
 tools/libxl/libxl_x86.c                       |   2 +-
 tools/libxl/libxl_x86_acpi.c                  |   2 +-
 tools/misc/Makefile                           |   5 +-
 tools/misc/xen-hptool.c                       |   8 +-
 tools/misc/xen-mfndump.c                      |  70 ++++----
 tools/python/Makefile                         |   2 +-
 tools/python/setup.py                         |  12 +-
 tools/python/xen/lowlevel/xc/xc.c             |   2 +-
 tools/vchan/Makefile                          |  37 ++++
 tools/{libvchan => vchan}/node-select.c       |   0
 tools/{libvchan => vchan}/node.c              |   0
 .../{libvchan => vchan}/vchan-socket-proxy.c  |   0
 tools/xcutils/readnotes.c                     |   2 +-
 tools/xenstat/Makefile                        |  10 --
 tools/xenstore/Makefile                       |  82 +--------
 tools/xenstore/{include => }/xenstore_lib.h   |   0
 tools/xenstore/xenstored_core.c               |   2 -
 tools/{xenstat => }/xentop/Makefile           |   2 +-
 tools/{xenstat => }/xentop/TODO               |   0
 tools/{xenstat => }/xentop/xentop.c           |   0
 174 files changed, 856 insertions(+), 986 deletions(-)
 create mode 100644 stubdom/mini-os.mk
 create mode 100644 tools/libs/ctrl/Makefile
 rename tools/{libxc => libs/ctrl}/include/xenctrl.h (100%)
 rename tools/{libxc => libs/ctrl}/include/xenctrl_compat.h (100%)
 rename tools/{libxc/include/xc_dom.h => libs/ctrl/include/xenctrl_dom.h} (98%)
 create mode 100644 tools/libs/ctrl/libxenctrl.map
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
 rename tools/{libxc/xencontrol.pc.in => libs/ctrl/xenctrl.pc.in} (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/COPYING (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/Makefile (56%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/perl/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/python/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/xenstat.i (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat/include}/xenstat.h (98%)
 create mode 100644 tools/libs/stat/libxenstat.map
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat.c (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/xenstat.pc.in (82%)
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
 rename tools/{xenstore => libs/store}/xenstore.pc.in (100%)
 rename tools/{xenstore => libs/store}/xs.c (100%)
 create mode 100644 tools/libs/vchan/Makefile
 rename tools/{libvchan => libs/vchan/include}/libxenvchan.h (100%)
 rename tools/{libvchan => libs/vchan}/init.c (100%)
 rename tools/{libvchan => libs/vchan}/io.c (100%)
 create mode 100644 tools/libs/vchan/libxenvchan.map
 rename tools/{libvchan => libs/vchan}/xenvchan.pc.in (100%)
 delete mode 100644 tools/libvchan/Makefile
 delete mode 100644 tools/libxc/xc_efi.h
 delete mode 100644 tools/libxc/xc_elf.h
 rename tools/libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c} (100%)
 rename tools/libxc/{xc_dom_arm.c => xg_dom_arm.c} (99%)
 rename tools/libxc/{xc_dom_armzimageloader.c => xg_dom_armzimageloader.c} (99%)
 rename tools/libxc/{xc_dom_binloader.c => xg_dom_binloader.c} (99%)
 rename tools/libxc/{xc_dom_boot.c => xg_dom_boot.c} (99%)
 rename tools/libxc/{xc_dom_bzimageloader.c => xg_dom_bzimageloader.c} (99%)
 rename tools/libxc/{xc_dom_compat_linux.c => xg_dom_compat_linux.c} (99%)
 rename tools/libxc/{xc_dom_core.c => xg_dom_core.c} (99%)
 rename tools/libxc/{xc_dom_decompress.h => xg_dom_decompress.h} (62%)
 rename tools/libxc/{xc_dom_decompress_lz4.c => xg_dom_decompress_lz4.c} (98%)
 rename tools/libxc/{xc_dom_decompress_unsafe.c => xg_dom_decompress_unsafe.c} (96%)
 rename tools/libxc/{xc_dom_decompress_unsafe.h => xg_dom_decompress_unsafe.h} (97%)
 rename tools/libxc/{xc_dom_decompress_unsafe_bzip2.c => xg_dom_decompress_unsafe_bzip2.c} (87%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzma.c => xg_dom_decompress_unsafe_lzma.c} (87%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzo1x.c => xg_dom_decompress_unsafe_lzo1x.c} (96%)
 rename tools/libxc/{xc_dom_decompress_unsafe_xz.c => xg_dom_decompress_unsafe_xz.c} (95%)
 rename tools/libxc/{xc_dom_elfloader.c => xg_dom_elfloader.c} (99%)
 rename tools/libxc/{xc_dom_hvmloader.c => xg_dom_hvmloader.c} (99%)
 rename tools/libxc/{xc_dom_x86.c => xg_dom_x86.c} (99%)
 create mode 100644 tools/libxc/xg_domain.c
 rename tools/libxc/{xc_nomigrate.c => xg_nomigrate.c} (100%)
 rename tools/libxc/{xc_offline_page.c => xg_offline_page.c} (99%)
 rename tools/libxc/{xc_sr_common.c => xg_sr_common.c} (99%)
 rename tools/libxc/{xc_sr_common.h => xg_sr_common.h} (99%)
 rename tools/libxc/{xc_sr_common_x86.c => xg_sr_common_x86.c} (99%)
 rename tools/libxc/{xc_sr_common_x86.h => xg_sr_common_x86.h} (98%)
 rename tools/libxc/{xc_sr_common_x86_pv.c => xg_sr_common_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_common_x86_pv.h => xg_sr_common_x86_pv.h} (98%)
 rename tools/libxc/{xc_sr_restore.c => xg_sr_restore.c} (99%)
 rename tools/libxc/{xc_sr_restore_x86_hvm.c => xg_sr_restore_x86_hvm.c} (99%)
 rename tools/libxc/{xc_sr_restore_x86_pv.c => xg_sr_restore_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_save.c => xg_sr_save.c} (99%)
 rename tools/libxc/{xc_sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} (99%)
 rename tools/libxc/{xc_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_stream_format.h => xg_sr_stream_format.h} (100%)
 rename tools/libxc/{xc_suspend.c => xg_suspend.c} (100%)
 create mode 100644 tools/vchan/Makefile
 rename tools/{libvchan => vchan}/node-select.c (100%)
 rename tools/{libvchan => vchan}/node.c (100%)
 rename tools/{libvchan => vchan}/vchan-socket-proxy.c (100%)
 delete mode 100644 tools/xenstat/Makefile
 rename tools/xenstore/{include => }/xenstore_lib.h (100%)
 rename tools/{xenstat => }/xentop/Makefile (97%)
 rename tools/{xenstat => }/xentop/TODO (100%)
 rename tools/{xenstat => }/xentop/xentop.c (100%)

-- 
2.26.2


