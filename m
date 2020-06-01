Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBA1EA4D4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkO6-0006Ze-4K; Mon, 01 Jun 2020 13:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkO5-0006ZZ-0M
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:21:57 +0000
X-Inumbo-ID: dc42d76e-a40a-11ea-ab1b-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc42d76e-a40a-11ea-ab1b-12813bfff9fa;
 Mon, 01 Jun 2020 13:21:54 +0000 (UTC)
IronPort-SDR: uAtTg3fLpoTIMRRet8XzBfbpM1/hjbrkoNFueeSjioCTMsw5UFacIxJyZEfi9xoHRCQF+LwtTt
 wCqN/4+yaNpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:53 -0700
IronPort-SDR: nNWIq1uD8ie8+x2jOfIxLgZ6NTtxtphM8yRjD0RWCh6CBrTs/5CHHxkpNk699d8CDzLq1CYq+6
 PM1tGdbULxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887244"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:51 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 00/13] VM forking
Date: Mon,  1 Jun 2020 06:21:34 -0700
Message-Id: <cover.1591017086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The following patches are part of the series that implement VM forking for
Intel HVM guests to allow for the fast creation of identical VMs without the
assosciated high startup costs of booting or restoring the VM from a savefile.

JIRA issue: https://xenproject.atlassian.net/browse/XEN-89

The fork operation is implemented as part of the "xl fork-vm" command:
    xl fork-vm -C <config> -Q <qemu-save-file> <parent_domid>

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

The series has been tested with Windows VMs and functions as expected. Linux
VMs when forked from a running VM will have a frozen VNC screen. Linux VMs at
this time can only be forked with a working device model when the parent VM was
restored from a snapshot using "xl restore -p". This is a known limitation due
to Linux VMs having to be made aware of being saved/migrated.

New in v19:
	Including all the patches currently outstanding into the series
	Breaking up libxl/xl patch to many sub-patches to make it easier to review
	libxl/xl is now reduced to the bare essential to launch QEMU for a VM fork

Tamas K Lengyel (13):
  x86/mem_sharing: block interrupt injection for forks
  tools/libxc: xc_memshr_fork with interrupts blocked
  tools/libxl: Split libxl__domain_make
  tools/libxl: populate xenstore entries when launching dm for VM fork
  tools/libxl: Add checks for dm_restore_file
  tools/libxl: adjust domcreate_bootloader_done
  tools/libxl: Adjust libxl__build_pre
  tools/libxl: Adjust libxl__build_post
  tools/libxl: libxl__build_hvm_fork
  tools/libxl: set QEMU saved_state from dm_restore_file
  tools/libxl: Add VM forking public functions
  tools/xl: Add xl fork-vm command
  tools/xl: document fork-vm command

 docs/man/xl.1.pod.in             |  39 +++++++++
 tools/libxc/include/xenctrl.h    |   3 +-
 tools/libxc/xc_memshr.c          |   4 +-
 tools/libxl/libxl.h              |  10 +++
 tools/libxl/libxl_create.c       | 134 +++++++++++++++++++++++++------
 tools/libxl/libxl_dm.c           |   2 +-
 tools/libxl/libxl_dom.c          |  59 +++++++++++---
 tools/libxl/libxl_internal.h     |   5 +-
 tools/libxl/libxl_types.idl      |   1 +
 tools/xl/Makefile                |   2 +-
 tools/xl/xl.h                    |   4 +
 tools/xl/xl_cmdtable.c           |  13 +++
 tools/xl/xl_forkvm.c             | 122 ++++++++++++++++++++++++++++
 tools/xl/xl_vmcontrol.c          |  13 +++
 xen/arch/x86/hvm/vmx/intr.c      |   6 ++
 xen/arch/x86/mm/mem_sharing.c    |   6 +-
 xen/include/asm-x86/hvm/domain.h |   2 +-
 xen/include/public/memory.h      |   3 +
 18 files changed, 383 insertions(+), 45 deletions(-)
 create mode 100644 tools/xl/xl_forkvm.c

-- 
2.25.1


