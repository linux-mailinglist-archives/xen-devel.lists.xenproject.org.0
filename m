Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9F1AE32B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUS8-0005xn-4Y; Fri, 17 Apr 2020 17:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lvC5=6B=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jPUS6-0005xi-3k
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:06:54 +0000
X-Inumbo-ID: d47239ea-80cd-11ea-8d58-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d47239ea-80cd-11ea-8d58-12813bfff9fa;
 Fri, 17 Apr 2020 17:06:51 +0000 (UTC)
IronPort-SDR: uAqTuY2qtf3n3mYcmOcg+siN8cEI9Pma4TpXewMywKgH+ZgCwvOAPt0Xb16Kv7TTzvJbBAruJD
 bxPLhqSC49Iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 10:06:44 -0700
IronPort-SDR: Hxljqv/S0DfA+K2ftb5Z32yh7sP3CD+PD7XvcRzVija6oON3r7toBlBuRSwlQfH5ZCW9VbW8Ot
 JC0UIYCBE6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="428288160"
Received: from keclark-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.135.32.180])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 10:06:41 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v15 0/3] VM forking
Date: Fri, 17 Apr 2020 10:06:30 -0700
Message-Id: <cover.1587141409.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following patches are part of the series that implement VM forking for
Intel HVM guests to allow for the fast creation of identical VMs without the
assosciated high startup costs of booting or restoring the VM from a savefile.

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

New in v15:
    Bugfix for fork reset with vm_events active
    Allowing forking a domain with IOMMU active

Patch 1 fix for VM fork reset dropping vm_events
Patch 2 adds option to fork a domain with IOMMU active
Patch 3 adds the toolstack-side code implementing VM forking and reset

Tamas K Lengyel (3):
  mem_sharing: don't reset vCPU info page during fork reset
  mem_sharing: allow forking domain with IOMMU enabled
  xen/tools: VM forking toolstack side

 docs/man/xl.1.pod.in          |  44 +++++
 tools/libxc/include/xenctrl.h |  14 ++
 tools/libxc/xc_memshr.c       |  26 +++
 tools/libxl/libxl.h           |  12 ++
 tools/libxl/libxl_create.c    | 361 +++++++++++++++++++---------------
 tools/libxl/libxl_dm.c        |   2 +-
 tools/libxl/libxl_dom.c       |  43 +++-
 tools/libxl/libxl_internal.h  |   7 +
 tools/libxl/libxl_types.idl   |   1 +
 tools/libxl/libxl_x86.c       |  42 ++++
 tools/xl/Makefile             |   2 +-
 tools/xl/xl.h                 |   5 +
 tools/xl/xl_cmdtable.c        |  15 ++
 tools/xl/xl_forkvm.c          | 149 ++++++++++++++
 tools/xl/xl_vmcontrol.c       |  14 ++
 xen/arch/x86/mm/mem_sharing.c |  68 ++++---
 xen/include/public/memory.h   |   4 +-
 17 files changed, 611 insertions(+), 198 deletions(-)
 create mode 100644 tools/xl/xl_forkvm.c

-- 
2.20.1


