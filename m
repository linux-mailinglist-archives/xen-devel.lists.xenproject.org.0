Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E4C2463BB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7blq-0004Av-Fs; Mon, 17 Aug 2020 09:49:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blp-00046j-09
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:37 +0000
X-Inumbo-ID: f8fc4389-5ba2-49c8-8c98-7414e914462f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8fc4389-5ba2-49c8-8c98-7414e914462f;
 Mon, 17 Aug 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39FB6ADA3;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Subject: [PATCH II v2 00/17] move libxenctrl to tools/libs directory
Date: Mon, 17 Aug 2020 11:49:05 +0200
Message-Id: <20200817094922.15768-1-jgross@suse.com>
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

This is part 2 of the series moving more libraries under tools/libs.
It is based on part 1 and does the needed cleanup work and moving for
libxenctrl into tools/libs/ctrl.

Please note that patch 17 ("tools: move libxenctrl below tools/libs")
needs the related qemu-trad patch applied in order not to break the
build:

https://lists.xen.org/archives/html/xen-devel/2020-07/msg00617.html

Changes in V2:
- split the original series into multiple parts, this being part 2
- split the original 3 patches into now 17 in order to make review
  easier
- fixed several bugs and addressed the few comments I received

Juergen Gross (17):
  stubdom: add correct dependencies for Xen libraries
  tools: drop explicit path specifications for qemu build
  tools: tweak tools/libs/libs.mk for being able to support libxenctrl
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
  tools: move libxenctrl below tools/libs

 .gitignore                                    |   8 +
 MAINTAINERS                                   |   2 +-
 stubdom/Makefile                              |  28 ++-
 stubdom/grub/kexec.c                          |   2 +-
 stubdom/mini-os.mk                            |   2 +-
 tools/Makefile                                |  26 +--
 tools/Rules.mk                                |  17 +-
 tools/helpers/init-xenstore-domain.c          |   2 +-
 tools/libs/Makefile                           |   1 +
 tools/libs/ctrl/Makefile                      |  68 ++++++++
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
 tools/{libxc => libs/ctrl}/xencontrol.pc.in   |   0
 tools/libs/libs.mk                            |  21 ++-
 tools/libxc/Makefile                          | 159 +++++-------------
 tools/libxc/include/xenguest.h                |   8 +-
 tools/libxc/xc_efi.h                          | 158 -----------------
 tools/libxc/xc_elf.h                          |  16 --
 tools/libxc/xenguest.pc.in                    |   2 +-
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
 tools/libxc/xg_private.h                      |  22 ---
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
 tools/libxl/libxl_internal.h                  |   2 +-
 tools/libxl/libxl_vnuma.c                     |   2 +-
 tools/libxl/libxl_x86.c                       |   2 +-
 tools/libxl/libxl_x86_acpi.c                  |   2 +-
 tools/misc/Makefile                           |   5 +-
 tools/misc/xen-hptool.c                       |   8 +-
 tools/misc/xen-mfndump.c                      |  44 +++--
 tools/python/Makefile                         |   2 +-
 tools/python/setup.py                         |  10 +-
 tools/python/xen/lowlevel/xc/xc.c             |   2 +-
 tools/xcutils/readnotes.c                     |   2 +-
 120 files changed, 457 insertions(+), 602 deletions(-)
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
 rename tools/{libxc => libs/ctrl}/xencontrol.pc.in (100%)
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

-- 
2.26.2


