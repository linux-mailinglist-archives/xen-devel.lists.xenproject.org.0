Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CC2FF735
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72436.130487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUs-0005ee-Qb; Thu, 21 Jan 2021 21:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72436.130487; Thu, 21 Jan 2021 21:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUs-0005dI-Gn; Thu, 21 Jan 2021 21:28:06 +0000
Received: by outflank-mailman (input) for mailman id 72436;
 Thu, 21 Jan 2021 21:28:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUq-0005Yt-E4
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:28:04 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b41da94-9c4b-431e-bbb5-ab35bfa2c978;
 Thu, 21 Jan 2021 21:28:03 +0000 (UTC)
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
X-Inumbo-ID: 2b41da94-9c4b-431e-bbb5-ab35bfa2c978
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1Ca5xuCph1ZevT1RLN44r957sztZOhJ/JinNLQ/WMSo=;
  b=hpDM4oab5dxV7UPE4pKmBXK+YTfyLs9zVyva+s4t9WSPORbPqLLaGfx7
   TWMdms6KDh18nyVTU5Mi9pYOzF3Ink0uRAhrvZtBvWsvnCy9s7AhJYNV3
   kyn1ogDgPmL6Z5AqzJCeaiLUcPxIMK6nP+JCjqV91ryy1oJk7x+yl6D5W
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AUv0b/DzVT+TLCyUdC1gJpK+1a9Uko3Jf96iNWdm48y78vrmKz2AqiwCICksFLQ2LnapXNpJ6G
 wfgQdw6diyatnAZoysaG378Z7ZB9/7sUW5zBZnMPqT5+26BHxU58aCrF+T/gshjGrvoampqtMI
 WANe/dBG2GeyH1qKZ1XU/d8RJNJT7FWcraC7uDlkwOm0A3g/3B+sJ6FZLBhdpe+iM4YSyhCrxh
 luMbazYdS5YGD4ZzzUexr/Zb3raxElhpSKKdqdCAAsvyPg232bzcUAbeskiUkOgq4djueRhvMY
 +3Q=
X-SBRS: 5.1
X-MesageID: 35651444
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35651444"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 00/10] Implement support for external IPT monitoring
Date: Thu, 21 Jan 2021 21:27:08 +0000
Message-ID: <20210121212718.2441-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the next iteration of the external IPT monitoring series, reworked
massively from v6 to fix a whole slew of bugs with the XENMEM_acquire_resource
interface.  It also includes some additional bugfixes to make traced VM's work
when forked.

A branch with all prerequisites is available at:
  https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-ipt

This version has undergone basic testing from Michał, Tamas and myself, and
seems to work for the intended usecases.

Andrew Cooper (1):
  xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace

Michał Leszczyński (7):
  xen/domain: Add vmtrace_frames domain creation parameter
  tools/[lib]xl: Add vmtrace_buf_size parameter
  xen/memory: Add a vmtrace_buf resource type
  x86/vmx: Add Intel Processor Trace support
  xen/domctl: Add XEN_DOMCTL_vmtrace_op
  tools/libxc: Add xc_vmtrace_* functions
  tools/misc: Add xen-vmtrace tool

Tamas K Lengyel (2):
  xen/vmtrace: support for VM forks
  x86/vm_event: Carry Processor Trace buffer offset in vm_event

 docs/man/xl.cfg.5.pod.in                    |   9 ++
 tools/golang/xenlight/helpers.gen.go        |   4 +
 tools/golang/xenlight/types.gen.go          |   2 +
 tools/include/libxl.h                       |  14 ++
 tools/include/xenctrl.h                     |  73 +++++++++++
 tools/libs/ctrl/Makefile                    |   1 +
 tools/libs/ctrl/xc_vmtrace.c                | 128 ++++++++++++++++++
 tools/libs/light/libxl.c                    |   2 +
 tools/libs/light/libxl_cpuid.c              |   1 +
 tools/libs/light/libxl_create.c             |   2 +
 tools/libs/light/libxl_types.idl            |   5 +
 tools/misc/.gitignore                       |   1 +
 tools/misc/Makefile                         |   4 +
 tools/misc/xen-cpuid.c                      |   2 +-
 tools/misc/xen-vmtrace.c                    | 154 ++++++++++++++++++++++
 tools/xl/xl_info.c                          |   5 +-
 tools/xl/xl_parse.c                         |   4 +
 xen/arch/x86/domain.c                       |  23 ++++
 xen/arch/x86/domctl.c                       |  55 ++++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  15 ++-
 xen/arch/x86/hvm/vmx/vmx.c                  | 196 +++++++++++++++++++++++++++-
 xen/arch/x86/mm/mem_sharing.c               |   3 +
 xen/arch/x86/vm_event.c                     |   3 +
 xen/common/domain.c                         |  58 ++++++++
 xen/common/memory.c                         |  27 ++++
 xen/common/sysctl.c                         |   2 +
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |  72 ++++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/msr.h                   |  32 +++++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  36 +++++
 xen/include/public/memory.h                 |   1 +
 xen/include/public/sysctl.h                 |   1 +
 xen/include/public/vm_event.h               |   6 +
 xen/include/xen/domain.h                    |   2 +
 xen/include/xen/sched.h                     |   7 +
 xen/xsm/flask/hooks.c                       |   1 +
 38 files changed, 952 insertions(+), 5 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_vmtrace.c
 create mode 100644 tools/misc/xen-vmtrace.c

-- 
2.11.0


