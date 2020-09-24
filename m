Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABF276E2E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:07:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLO9h-0002TL-N6; Thu, 24 Sep 2020 10:07:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UqNy=DB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLO9g-0002TC-58
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:07:12 +0000
X-Inumbo-ID: 2e0fde17-65d1-4a00-9777-3dfb464b9d47
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e0fde17-65d1-4a00-9777-3dfb464b9d47;
 Thu, 24 Sep 2020 10:07:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600942030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cnz26q+Wgad1fl+1lIDIN/z6TSHQ6Gfj97VLLyLlGgI=;
 b=l2a3ywsJbTP7GZ8SOp/dxfZseMCX366S2+AfBXRF2kLaFLGWvag+E/fr7qVctaDTARbuBK
 sqpcQfWLzRdVCndpBGBj+pImX72S+QsitiUq4DQlHAMYy6Ta7Yg4W9MiYCR3GmVeI2ZtNb
 R/l4H256UNd/7LS1ZwJbWI5BT79q97g=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 541D5B982;
 Thu, 24 Sep 2020 10:07:48 +0000 (UTC)
Subject: Re: [PATCH v5 0/4] tools: move most libraries into tools/libs
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>, Yang Hongyang
 <imhy.yang@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
References: <20200909114645.3709-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <822fc6b4-c57e-eb03-b7e8-287ed7d82a11@suse.com>
Date: Thu, 24 Sep 2020 11:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909114645.3709-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Ping?

Patches 2-4 could need some Acks...


Juergen

On 09.09.20 13:46, Juergen Gross wrote:
> The rest batch of the library build rework: the two remaining main
> libraries libxenlight and libxlutil are moved to tools/libs/ directory.
> 
> Changes in V5:
> - removed already applied patches (1-27)
> - rebased to current xen staging
> 
> Changes in V4:
> - removed already applied patches (1-8, 10)
> - added new patches 1, 29
> - replaced (old) patch 37 with new patch 30
> - especially fixed qemu build and parallel make
> - rebased to current staging
> 
> Changes in V3:
> - more cleanup added
> - added moving libxenguest, libxl and libxlutil
> - split out dependencies into uselibs.mk
> - use uselibs.mk for stubdoms build
> 
> Juergen Gross (4):
>    tools/libxl: move libxenlight to tools/libs/light
>    tools: rename global libxlutil make variables
>    tools/libs: add option for library names not starting with libxen
>    tools: move libxlutil to tools/libs/util
> 
>   .gitignore                                    |  37 +-
>   tools/Makefile                                |   1 -
>   tools/Rules.mk                                |  19 +-
>   tools/configure                               |   2 +-
>   tools/configure.ac                            |   2 +-
>   tools/golang/xenlight/Makefile                |   2 +-
>   tools/libs/Makefile                           |   2 +
>   tools/libs/libs.mk                            |  41 +-
>   tools/{libxl => libs/light}/CODING_STYLE      |   0
>   tools/libs/light/Makefile                     | 277 +++++++++++++
>   .../light}/check-libxl-api-rules              |   0
>   tools/{libxl => libs/light}/flexarray.c       |   0
>   tools/{libxl => libs/light}/flexarray.h       |   0
>   tools/{libxl => libs/light}/gentest.py        |   0
>   tools/{libxl => libs/light}/gentypes.py       |   0
>   tools/{libxl => libs/light}/idl.py            |   0
>   tools/{libxl => libs/light}/idl.txt           |   0
>   tools/{libxl => libs/light/include}/libxl.h   |   0
>   .../light/include}/libxl_event.h              |   0
>   .../light/include}/libxl_json.h               |   0
>   .../light/include}/libxl_utils.h              |   0
>   .../light/include}/libxl_uuid.h               |   0
>   tools/{libxl => libs/light}/libxl.c           |   0
>   tools/{libxl => libs/light}/libxl_9pfs.c      |   0
>   tools/{libxl => libs/light}/libxl_aoutils.c   |   0
>   tools/{libxl => libs/light}/libxl_arch.h      |   0
>   tools/{libxl => libs/light}/libxl_arm.c       |   0
>   tools/{libxl => libs/light}/libxl_arm.h       |   0
>   tools/{libxl => libs/light}/libxl_arm_acpi.c  |   0
>   .../{libxl => libs/light}/libxl_arm_no_acpi.c |   0
>   .../{libxl => libs/light}/libxl_bootloader.c  |   0
>   .../light}/libxl_checkpoint_device.c          |   0
>   tools/{libxl => libs/light}/libxl_colo.h      |   0
>   tools/{libxl => libs/light}/libxl_colo_nic.c  |   0
>   .../{libxl => libs/light}/libxl_colo_proxy.c  |   0
>   .../{libxl => libs/light}/libxl_colo_qdisk.c  |   0
>   .../light}/libxl_colo_restore.c               |   0
>   tools/{libxl => libs/light}/libxl_colo_save.c |   0
>   tools/{libxl => libs/light}/libxl_console.c   |   0
>   .../light}/libxl_convert_callout.c            |   0
>   tools/{libxl => libs/light}/libxl_cpuid.c     |   0
>   tools/{libxl => libs/light}/libxl_cpupool.c   |   0
>   tools/{libxl => libs/light}/libxl_create.c    |   0
>   tools/{libxl => libs/light}/libxl_device.c    |   0
>   tools/{libxl => libs/light}/libxl_disk.c      |   0
>   tools/{libxl => libs/light}/libxl_dm.c        |   0
>   tools/{libxl => libs/light}/libxl_dom.c       |   0
>   tools/{libxl => libs/light}/libxl_dom_save.c  |   0
>   .../{libxl => libs/light}/libxl_dom_suspend.c |   0
>   tools/{libxl => libs/light}/libxl_domain.c    |   0
>   tools/{libxl => libs/light}/libxl_event.c     |   0
>   tools/{libxl => libs/light}/libxl_exec.c      |   0
>   tools/{libxl => libs/light}/libxl_flask.c     |   0
>   tools/{libxl => libs/light}/libxl_fork.c      |   0
>   tools/{libxl => libs/light}/libxl_freebsd.c   |   0
>   tools/{libxl => libs/light}/libxl_genid.c     |   0
>   tools/{libxl => libs/light}/libxl_internal.c  |   0
>   tools/{libxl => libs/light}/libxl_internal.h  |   0
>   tools/{libxl => libs/light}/libxl_json.c      |   0
>   .../light}/libxl_libfdt_compat.c              |   0
>   .../light}/libxl_libfdt_compat.h              |   0
>   tools/{libxl => libs/light}/libxl_linux.c     |   0
>   tools/{libxl => libs/light}/libxl_mem.c       |   0
>   tools/{libxl => libs/light}/libxl_netbsd.c    |   0
>   tools/{libxl => libs/light}/libxl_netbuffer.c |   0
>   tools/{libxl => libs/light}/libxl_nic.c       |   0
>   tools/{libxl => libs/light}/libxl_no_colo.c   |   0
>   .../light}/libxl_no_convert_callout.c         |   0
>   tools/{libxl => libs/light}/libxl_nocpuid.c   |   0
>   .../{libxl => libs/light}/libxl_nonetbuffer.c |   0
>   tools/{libxl => libs/light}/libxl_numa.c      |   0
>   tools/{libxl => libs/light}/libxl_osdeps.h    |   0
>   tools/{libxl => libs/light}/libxl_paths.c     |   0
>   tools/{libxl => libs/light}/libxl_pci.c       |   0
>   tools/{libxl => libs/light}/libxl_psr.c       |   0
>   tools/{libxl => libs/light}/libxl_pvcalls.c   |   0
>   tools/{libxl => libs/light}/libxl_qmp.c       |   0
>   tools/{libxl => libs/light}/libxl_remus.c     |   0
>   .../light}/libxl_remus_disk_drbd.c            |   0
>   .../light}/libxl_save_callout.c               |   0
>   .../{libxl => libs/light}/libxl_save_helper.c |   0
>   .../light}/libxl_save_msgs_gen.pl             |   0
>   tools/{libxl => libs/light}/libxl_sched.c     |   0
>   .../light}/libxl_sr_stream_format.h           |   0
>   .../{libxl => libs/light}/libxl_stream_read.c |   0
>   .../light}/libxl_stream_write.c               |   0
>   .../light}/libxl_test_fdevent.c               |   0
>   .../light}/libxl_test_fdevent.h               |   0
>   .../light}/libxl_test_timedereg.c             |   0
>   .../light}/libxl_test_timedereg.h             |   0
>   tools/{libxl => libs/light}/libxl_tmem.c      |   0
>   tools/{libxl => libs/light}/libxl_types.idl   |   0
>   .../light}/libxl_types_internal.idl           |   0
>   tools/{libxl => libs/light}/libxl_usb.c       |   0
>   tools/{libxl => libs/light}/libxl_utils.c     |   0
>   tools/{libxl => libs/light}/libxl_uuid.c      |   0
>   tools/{libxl => libs/light}/libxl_vdispl.c    |   0
>   tools/{libxl => libs/light}/libxl_vkb.c       |   0
>   tools/{libxl => libs/light}/libxl_vnuma.c     |   0
>   tools/{libxl => libs/light}/libxl_vsnd.c      |   0
>   tools/{libxl => libs/light}/libxl_vtpm.c      |   0
>   tools/{libxl => libs/light}/libxl_x86.c       |   0
>   tools/{libxl => libs/light}/libxl_x86_acpi.c  |   0
>   tools/{libxl => libs/light}/libxl_x86_acpi.h  |   0
>   tools/{libxl => libs/light}/libxl_xshelp.c    |   0
>   tools/{libxl => libs/light}/osdeps.c          |   0
>   tools/{libxl => libs/light}/test_common.c     |   0
>   tools/{libxl => libs/light}/test_common.h     |   0
>   .../{libxl => libs/light}/test_fdderegrace.c  |   0
>   tools/{libxl => libs/light}/test_timedereg.c  |   0
>   tools/libs/uselibs.mk                         |   5 +
>   tools/libs/util/CODING_STYLE                  | 330 +++++++++++++++
>   tools/libs/util/Makefile                      |  63 +++
>   .../{libxl => libs/util/include}/libxlutil.h  |   0
>   tools/{libxl => libs/util}/libxlu_cfg.c       |   0
>   tools/{libxl => libs/util}/libxlu_cfg_i.h     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_l.c     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_l.h     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_l.l     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_y.c     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_y.h     |   0
>   tools/{libxl => libs/util}/libxlu_cfg_y.y     |   0
>   tools/{libxl => libs/util}/libxlu_disk.c      |   0
>   tools/{libxl => libs/util}/libxlu_disk_i.h    |   0
>   tools/{libxl => libs/util}/libxlu_disk_l.c    |   0
>   tools/{libxl => libs/util}/libxlu_disk_l.h    |   0
>   tools/{libxl => libs/util}/libxlu_disk_l.l    |   0
>   tools/{libxl => libs/util}/libxlu_internal.h  |   0
>   tools/{libxl => libs/util}/libxlu_pci.c       |   0
>   tools/{libxl => libs/util}/libxlu_vif.c       |   0
>   tools/libxl/Makefile                          | 384 ------------------
>   tools/ocaml/libs/xl/Makefile                  |   8 +-
>   tools/xl/Makefile                             |   4 +-
>   133 files changed, 731 insertions(+), 446 deletions(-)
>   rename tools/{libxl => libs/light}/CODING_STYLE (100%)
>   create mode 100644 tools/libs/light/Makefile
>   rename tools/{libxl => libs/light}/check-libxl-api-rules (100%)
>   rename tools/{libxl => libs/light}/flexarray.c (100%)
>   rename tools/{libxl => libs/light}/flexarray.h (100%)
>   rename tools/{libxl => libs/light}/gentest.py (100%)
>   rename tools/{libxl => libs/light}/gentypes.py (100%)
>   rename tools/{libxl => libs/light}/idl.py (100%)
>   rename tools/{libxl => libs/light}/idl.txt (100%)
>   rename tools/{libxl => libs/light/include}/libxl.h (100%)
>   rename tools/{libxl => libs/light/include}/libxl_event.h (100%)
>   rename tools/{libxl => libs/light/include}/libxl_json.h (100%)
>   rename tools/{libxl => libs/light/include}/libxl_utils.h (100%)
>   rename tools/{libxl => libs/light/include}/libxl_uuid.h (100%)
>   rename tools/{libxl => libs/light}/libxl.c (100%)
>   rename tools/{libxl => libs/light}/libxl_9pfs.c (100%)
>   rename tools/{libxl => libs/light}/libxl_aoutils.c (100%)
>   rename tools/{libxl => libs/light}/libxl_arch.h (100%)
>   rename tools/{libxl => libs/light}/libxl_arm.c (100%)
>   rename tools/{libxl => libs/light}/libxl_arm.h (100%)
>   rename tools/{libxl => libs/light}/libxl_arm_acpi.c (100%)
>   rename tools/{libxl => libs/light}/libxl_arm_no_acpi.c (100%)
>   rename tools/{libxl => libs/light}/libxl_bootloader.c (100%)
>   rename tools/{libxl => libs/light}/libxl_checkpoint_device.c (100%)
>   rename tools/{libxl => libs/light}/libxl_colo.h (100%)
>   rename tools/{libxl => libs/light}/libxl_colo_nic.c (100%)
>   rename tools/{libxl => libs/light}/libxl_colo_proxy.c (100%)
>   rename tools/{libxl => libs/light}/libxl_colo_qdisk.c (100%)
>   rename tools/{libxl => libs/light}/libxl_colo_restore.c (100%)
>   rename tools/{libxl => libs/light}/libxl_colo_save.c (100%)
>   rename tools/{libxl => libs/light}/libxl_console.c (100%)
>   rename tools/{libxl => libs/light}/libxl_convert_callout.c (100%)
>   rename tools/{libxl => libs/light}/libxl_cpuid.c (100%)
>   rename tools/{libxl => libs/light}/libxl_cpupool.c (100%)
>   rename tools/{libxl => libs/light}/libxl_create.c (100%)
>   rename tools/{libxl => libs/light}/libxl_device.c (100%)
>   rename tools/{libxl => libs/light}/libxl_disk.c (100%)
>   rename tools/{libxl => libs/light}/libxl_dm.c (100%)
>   rename tools/{libxl => libs/light}/libxl_dom.c (100%)
>   rename tools/{libxl => libs/light}/libxl_dom_save.c (100%)
>   rename tools/{libxl => libs/light}/libxl_dom_suspend.c (100%)
>   rename tools/{libxl => libs/light}/libxl_domain.c (100%)
>   rename tools/{libxl => libs/light}/libxl_event.c (100%)
>   rename tools/{libxl => libs/light}/libxl_exec.c (100%)
>   rename tools/{libxl => libs/light}/libxl_flask.c (100%)
>   rename tools/{libxl => libs/light}/libxl_fork.c (100%)
>   rename tools/{libxl => libs/light}/libxl_freebsd.c (100%)
>   rename tools/{libxl => libs/light}/libxl_genid.c (100%)
>   rename tools/{libxl => libs/light}/libxl_internal.c (100%)
>   rename tools/{libxl => libs/light}/libxl_internal.h (100%)
>   rename tools/{libxl => libs/light}/libxl_json.c (100%)
>   rename tools/{libxl => libs/light}/libxl_libfdt_compat.c (100%)
>   rename tools/{libxl => libs/light}/libxl_libfdt_compat.h (100%)
>   rename tools/{libxl => libs/light}/libxl_linux.c (100%)
>   rename tools/{libxl => libs/light}/libxl_mem.c (100%)
>   rename tools/{libxl => libs/light}/libxl_netbsd.c (100%)
>   rename tools/{libxl => libs/light}/libxl_netbuffer.c (100%)
>   rename tools/{libxl => libs/light}/libxl_nic.c (100%)
>   rename tools/{libxl => libs/light}/libxl_no_colo.c (100%)
>   rename tools/{libxl => libs/light}/libxl_no_convert_callout.c (100%)
>   rename tools/{libxl => libs/light}/libxl_nocpuid.c (100%)
>   rename tools/{libxl => libs/light}/libxl_nonetbuffer.c (100%)
>   rename tools/{libxl => libs/light}/libxl_numa.c (100%)
>   rename tools/{libxl => libs/light}/libxl_osdeps.h (100%)
>   rename tools/{libxl => libs/light}/libxl_paths.c (100%)
>   rename tools/{libxl => libs/light}/libxl_pci.c (100%)
>   rename tools/{libxl => libs/light}/libxl_psr.c (100%)
>   rename tools/{libxl => libs/light}/libxl_pvcalls.c (100%)
>   rename tools/{libxl => libs/light}/libxl_qmp.c (100%)
>   rename tools/{libxl => libs/light}/libxl_remus.c (100%)
>   rename tools/{libxl => libs/light}/libxl_remus_disk_drbd.c (100%)
>   rename tools/{libxl => libs/light}/libxl_save_callout.c (100%)
>   rename tools/{libxl => libs/light}/libxl_save_helper.c (100%)
>   rename tools/{libxl => libs/light}/libxl_save_msgs_gen.pl (100%)
>   rename tools/{libxl => libs/light}/libxl_sched.c (100%)
>   rename tools/{libxl => libs/light}/libxl_sr_stream_format.h (100%)
>   rename tools/{libxl => libs/light}/libxl_stream_read.c (100%)
>   rename tools/{libxl => libs/light}/libxl_stream_write.c (100%)
>   rename tools/{libxl => libs/light}/libxl_test_fdevent.c (100%)
>   rename tools/{libxl => libs/light}/libxl_test_fdevent.h (100%)
>   rename tools/{libxl => libs/light}/libxl_test_timedereg.c (100%)
>   rename tools/{libxl => libs/light}/libxl_test_timedereg.h (100%)
>   rename tools/{libxl => libs/light}/libxl_tmem.c (100%)
>   rename tools/{libxl => libs/light}/libxl_types.idl (100%)
>   rename tools/{libxl => libs/light}/libxl_types_internal.idl (100%)
>   rename tools/{libxl => libs/light}/libxl_usb.c (100%)
>   rename tools/{libxl => libs/light}/libxl_utils.c (100%)
>   rename tools/{libxl => libs/light}/libxl_uuid.c (100%)
>   rename tools/{libxl => libs/light}/libxl_vdispl.c (100%)
>   rename tools/{libxl => libs/light}/libxl_vkb.c (100%)
>   rename tools/{libxl => libs/light}/libxl_vnuma.c (100%)
>   rename tools/{libxl => libs/light}/libxl_vsnd.c (100%)
>   rename tools/{libxl => libs/light}/libxl_vtpm.c (100%)
>   rename tools/{libxl => libs/light}/libxl_x86.c (100%)
>   rename tools/{libxl => libs/light}/libxl_x86_acpi.c (100%)
>   rename tools/{libxl => libs/light}/libxl_x86_acpi.h (100%)
>   rename tools/{libxl => libs/light}/libxl_xshelp.c (100%)
>   rename tools/{libxl => libs/light}/osdeps.c (100%)
>   rename tools/{libxl => libs/light}/test_common.c (100%)
>   rename tools/{libxl => libs/light}/test_common.h (100%)
>   rename tools/{libxl => libs/light}/test_fdderegrace.c (100%)
>   rename tools/{libxl => libs/light}/test_timedereg.c (100%)
>   create mode 100644 tools/libs/util/CODING_STYLE
>   create mode 100644 tools/libs/util/Makefile
>   rename tools/{libxl => libs/util/include}/libxlutil.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_i.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_l.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_l.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_l.l (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_y.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_y.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_cfg_y.y (100%)
>   rename tools/{libxl => libs/util}/libxlu_disk.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_disk_i.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_disk_l.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_disk_l.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_disk_l.l (100%)
>   rename tools/{libxl => libs/util}/libxlu_internal.h (100%)
>   rename tools/{libxl => libs/util}/libxlu_pci.c (100%)
>   rename tools/{libxl => libs/util}/libxlu_vif.c (100%)
>   delete mode 100644 tools/libxl/Makefile
> 


