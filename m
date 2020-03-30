Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EE197F3A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 17:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIvvm-0000lb-7B; Mon, 30 Mar 2020 15:02:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1ChX=5P=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jIvvk-0000lW-S3
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 15:02:24 +0000
X-Inumbo-ID: 75430d4e-7297-11ea-b4f4-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75430d4e-7297-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 15:02:22 +0000 (UTC)
IronPort-SDR: tuj/J0R/9Y4oRZlN6h0ovXd2o0V6z3XAEUVLQFTMxGNEP7JAE1Q5W2LNh4Y3FeE/cOXpFhWc7n
 dvFnpDGWvDHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 08:02:21 -0700
IronPort-SDR: 2bt7AWq5SJherSwDbjfVTR8yE01xcBm0h+Ltuppne6VxFGIm9tnHGZi3jEudOXV2jiMuXvob3L
 eRu7mIRp5IWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="359199566"
Received: from yliu23-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.168.11])
 by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 08:02:18 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 08:02:07 -0700
Message-Id: <cover.1585579955.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v13 0/3] VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following series implements VM forking for Intel HVM guests to allow for
the fast creation of identical VMs without the assosciated high startup costs
of booting or restoring the VM from a savefile.

JIRA issue: https://xenproject.atlassian.net/browse/XEN-89

The fork operation is implemented as part of the "xl fork-vm" command:
    xl fork-vm -C <config> -Q <qemu-save-file> -m <max-vcpus> <parent_domid>
    
By default a fully functional fork is created. The user is in charge however to
create the appropriate config file for the fork and to generate the QEMU save
file before the fork-vm call is made. The config file needs to give the
fork a new name at minimum but other settings may also require changes. Certain
settings in the config file of both the parent and the fork have to be set to
default. Details are documented.

The interface also allows to split the forking into two steps:
    xl fork-vm --launch-dm no \
               -m <max-vcpus> \
               -p <parent_domid>
    xl fork-vm --launch-dm late \
               -C <config_file_for_fork> \
               -Q <qemu_save_file> \
               <fork_domid>

The split creation model is useful when the VM needs to be created as fast as
possible. The forked VM can be unpaused without the device model being launched
to be monitored and accessed via VMI. Note however that without its device
model running (depending on what is executing in the VM) it is bound to
misbehave or even crash when its trying to access devices that would be
emulated by QEMU. We anticipate that for certain use-cases this would be an
acceptable situation, in case for example when fuzzing is performed of code
segments that don't access such devices.

Launching the device model requires the QEMU Xen savefile to be generated
manually from the parent VM. This can be accomplished simply by connecting to
its QMP socket and issuing the "xen-save-devices-state" command. For example
using the standard tool socat these commands can be used to generate the file:
    socat - UNIX-CONNECT:/var/run/xen/qmp-libxl-<parent_domid>
    { "execute": "qmp_capabilities" }
    { "execute": "xen-save-devices-state", \
        "arguments": { "filename": "/path/to/save/qemu_state", \
                        "live": false} }

At runtime the forked VM starts running with an empty p2m which gets lazily
populated when the VM generates EPT faults, similar to how altp2m views are
populated. If the memory access is a read-only access, the p2m entry is
populated with a memory shared entry with its parent. For write memory accesses
or in case memory sharing wasn't possible (for example in case a reference is
held by a third party), a new page is allocated and the page contents are
copied over from the parent VM. Forks can be further forked if needed, thus
allowing for further memory savings.

A VM fork reset hypercall is also added that allows the fork to be reset to the
state it was just after a fork, also accessible via xl:
    xl fork-vm --fork-reset -p <fork_domid>

This is an optimization for cases where the forks are very short-lived and run
without a device model, so resetting saves some time compared to creating a
brand new fork provided the fork has not aquired a lot of memory. If the fork
has a lot of memory deduplicated it is likely going to be faster to create a
new fork from scratch and asynchronously destroying the old one.

The series has been tested with Windows VMs and functions as expected. Linux
VMs when forked from a running VM will have a frozen VNC screen. Linux VMs at
this time can only be forked with a working device model when the parent VM was
restored from a snapshot using "xl restore -p". This is a known limitation.
Also note that PVHVM/PVH Linux guests have not been tested. Forking most likely
works but PV devices and drivers would require additional wiring to set things
up properly since the guests are unaware of the forking taking place, unlike
the save/restore routine where the guest is made aware of the procedure.

Forking time has been measured to be 0.0007s, device model launch to be around
1s depending largely on the number of devices being emulated. Fork resets have
been measured to be 0.0001s under the optimal circumstances.

New in v13:
    style cleanups & minor adjustments
    Introduce and use PAGE_OFFSET macro

Patch 1 implements the VM fork
Patch 2 implements fork reset operation
Patch 3 adds the toolstack-side code implementing VM forking and reset

Tamas K Lengyel (3):
  xen/mem_sharing: VM forking
  x86/mem_sharing: reset a fork
  xen/tools: VM forking toolstack side

 docs/man/xl.1.pod.in              |  44 +++
 tools/libxc/include/xenctrl.h     |  13 +
 tools/libxc/xc_memshr.c           |  22 ++
 tools/libxl/libxl.h               |  11 +
 tools/libxl/libxl_create.c        | 361 ++++++++++++++-----------
 tools/libxl/libxl_dm.c            |   2 +-
 tools/libxl/libxl_dom.c           |  43 ++-
 tools/libxl/libxl_internal.h      |   7 +
 tools/libxl/libxl_types.idl       |   1 +
 tools/libxl/libxl_x86.c           |  41 +++
 tools/xl/Makefile                 |   2 +-
 tools/xl/xl.h                     |   5 +
 tools/xl/xl_cmdtable.c            |  15 ++
 tools/xl/xl_forkvm.c              | 147 ++++++++++
 tools/xl/xl_vmcontrol.c           |  14 +
 xen/arch/x86/domain.c             |  13 +
 xen/arch/x86/hvm/hvm.c            |   4 +-
 xen/arch/x86/mm/hap/hap.c         |   3 +-
 xen/arch/x86/mm/mem_sharing.c     | 428 ++++++++++++++++++++++++++++++
 xen/arch/x86/mm/p2m.c             |   9 +-
 xen/include/asm-arm/page.h        |   1 +
 xen/include/asm-x86/hap.h         |   1 +
 xen/include/asm-x86/hvm/hvm.h     |   2 +
 xen/include/asm-x86/mem_sharing.h |  18 ++
 xen/include/asm-x86/page.h        |   1 +
 xen/include/public/memory.h       |   6 +
 xen/include/xen/sched.h           |   1 +
 27 files changed, 1044 insertions(+), 171 deletions(-)
 create mode 100644 tools/xl/xl_forkvm.c

-- 
2.20.1


