Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92799309191
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78637.143180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTs-0000hb-0P; Sat, 30 Jan 2021 02:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78637.143180; Sat, 30 Jan 2021 02:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gTr-0000gy-S9; Sat, 30 Jan 2021 02:59:23 +0000
Received: by outflank-mailman (input) for mailman id 78637;
 Sat, 30 Jan 2021 02:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gTq-0000YD-Q7
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:22 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d657e7b-95f0-4b8d-93db-3330e23ff20a;
 Sat, 30 Jan 2021 02:59:12 +0000 (UTC)
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
X-Inumbo-ID: 4d657e7b-95f0-4b8d-93db-3330e23ff20a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8vgH45XlNNq0PCbPRDg9sE+eRRJKofBQp4hdFGXVgoY=;
  b=a2fGwvNCovZH9g4Q1KNmF2DiT9+MZ1tKqxBebUn4JOTCLDl7um6KIYc2
   +6NJ4ElOEI5tPQYMBrUvXcecz4mfdmhTkKnTa4bysJZaPicDq6cMNbJGW
   Oj7v0iHRoAh8a4XeSxCnHIQgmtmy/BygdzC9mTZlcS8ASu+OARai2tuvu
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: x6FII1DBgEZCwjABwaIKg7sLAAANYTPvSaryuUuV6nwXqVX1BRzFbH9BNaudHSHrDPfn10kEgR
 4PzjduA+DinvCteRhqXXkhTmHMlWyjtnziq3J0EhgXhzCPqU25ScQxW5wxevZmvcXWggzgB0WR
 gD+vBw9ZJ95d/caR+gMiPuymtU3tBN55FutuFryYK98jTPeEvHX6vd4BSiagxPwWE720Q3PAVp
 NcIDz9SM8iyk71fR9/emoBF6wD4BgQp5ps9D14KvbU4J2cHVpSbW26n0U312vRy+ML/iUihgt9
 xhI=
X-SBRS: 5.1
X-MesageID: 36399490
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36399490"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v8 00/16] acquire_resource size and external IPT monitoring
Date: Sat, 30 Jan 2021 02:58:36 +0000
Message-ID: <20210130025852.12430-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Combined series (as they are dependent).  First, the resource size fixes, and
then the external IPT monitoring built on top.

Posting in full for reference, but several patches are ready to go in.  Those
in need of review are patch 6, 8 and 12.

See individual patches for changes.  The major work was rebasing over the
ARM/IOREQ series which moved a load of code which this series was bugfixing.

Andrew Cooper (7):
  xen/memory: Reject out-of-range resource 'frame' values
  xen/gnttab: Rework resource acquisition
  xen/memory: Fix acquire_resource size semantics
  xen/memory: Improve compat XENMEM_acquire_resource handling
  xen/memory: Indent part of acquire_resource()
  xen/memory: Fix mapping grant tables with XENMEM_acquire_resource
  xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vmtrace

Michał Leszczyński (7):
  xen/domain: Add vmtrace_size domain creation parameter
  tools/[lib]xl: Add vmtrace_buf_size parameter
  xen/memory: Add a vmtrace_buf resource type
  x86/vmx: Add Intel Processor Trace support
  xen/domctl: Add XEN_DOMCTL_vmtrace_op
  tools/libxc: Add xc_vmtrace_* functions
  tools/misc: Add xen-vmtrace tool

Tamas K Lengyel (2):
  xen/vmtrace: support for VM forks
  x86/vm_event: Carry the vmtrace buffer position in vm_event

 docs/man/xl.cfg.5.pod.in                    |   9 +
 tools/golang/xenlight/helpers.gen.go        |   4 +
 tools/golang/xenlight/types.gen.go          |   2 +
 tools/include/libxl.h                       |  14 ++
 tools/include/xenctrl.h                     |  73 ++++++++
 tools/libs/ctrl/Makefile                    |   1 +
 tools/libs/ctrl/xc_vmtrace.c                | 128 +++++++++++++
 tools/libs/light/libxl.c                    |   2 +
 tools/libs/light/libxl_cpuid.c              |   1 +
 tools/libs/light/libxl_create.c             |   1 +
 tools/libs/light/libxl_types.idl            |   5 +
 tools/misc/.gitignore                       |   1 +
 tools/misc/Makefile                         |   7 +
 tools/misc/xen-cpuid.c                      |   2 +-
 tools/misc/xen-vmtrace.c                    | 154 ++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml              |   1 +
 tools/ocaml/libs/xc/xenctrl.mli             |   1 +
 tools/xl/xl_info.c                          |   5 +-
 tools/xl/xl_parse.c                         |   4 +
 xen/arch/x86/domain.c                       |  23 +++
 xen/arch/x86/domctl.c                       |  55 ++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  19 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 200 +++++++++++++++++++-
 xen/arch/x86/mm/mem_sharing.c               |   3 +
 xen/arch/x86/vm_event.c                     |   3 +
 xen/common/compat/memory.c                  | 147 +++++++++++----
 xen/common/domain.c                         |  81 ++++++++
 xen/common/grant_table.c                    | 112 ++++++++----
 xen/common/ioreq.c                          |   2 +-
 xen/common/memory.c                         | 274 +++++++++++++++++++---------
 xen/common/sysctl.c                         |   2 +
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |  72 ++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/msr.h                   |  32 ++++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  38 ++++
 xen/include/public/memory.h                 |  18 +-
 xen/include/public/sysctl.h                 |   3 +-
 xen/include/public/vm_event.h               |   7 +
 xen/include/xen/domain.h                    |   2 +
 xen/include/xen/grant_table.h               |  21 ++-
 xen/include/xen/ioreq.h                     |   2 +-
 xen/include/xen/sched.h                     |   6 +
 xen/xsm/flask/hooks.c                       |   1 +
 45 files changed, 1366 insertions(+), 178 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_vmtrace.c
 create mode 100644 tools/misc/xen-vmtrace.c

-- 
2.11.0


