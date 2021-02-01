Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6AA30B37B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80195.146569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibn-0007oJ-7K; Mon, 01 Feb 2021 23:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80195.146569; Mon, 01 Feb 2021 23:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibn-0007nD-2h; Mon, 01 Feb 2021 23:27:51 +0000
Received: by outflank-mailman (input) for mailman id 80195;
 Mon, 01 Feb 2021 23:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibk-0007PB-SZ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7290a8cc-2697-4c86-a1de-a9c8fc86c84b;
 Mon, 01 Feb 2021 23:27:35 +0000 (UTC)
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
X-Inumbo-ID: 7290a8cc-2697-4c86-a1de-a9c8fc86c84b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vuuwq+6fSuNyCmrq1LxmH6Aqiqy1A+s02+fVKEkgO+4=;
  b=OatCVzKqX4fMD5FwX+vlL5/K9WYg5uS95lqVNRHI1JBpYR/9PJR+4Aiw
   CwtErrZTlER4W/8a/x+HSJny943Z4U8VdmRGBBtK5zhFaaWSc/sdZQrUs
   GXNjEncR2OPQ40JeComWBDMh5Ot6t6X/6oTFx3Bi4TNhDfwPyUOngv4+l
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +RXHQME0JbXlIVKVhTdFc35TdYsQ/l2+XYnNQNL2+IQShsdxGo+SWoIc/Ds9PwB0Zr4BG4pIKp
 Iix87JetSgQNyyjwFqcco0J39yiqp/ruPnzu8SfPsVAqwNktkQXo7SWw2fdrwhIV5tCMM/3/zl
 ZuuYJjLQS7PSTcx5/Yt5OsBYAVPWFRusTVR/dWiAqwosaKQXFrvl/ulK3bxY+cqE0SPkQUuorV
 pQR6oFYYcmRRfgkOapMEnraQT6udL4EcGDRyFeNceBYZuon7OHNv07Go66OFDY7X9/PbVGJTS8
 aro=
X-SBRS: 5.1
X-MesageID: 36319805
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36319805"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>, "Jun
 Nakajima" <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v9 00/11] acquire_resource size and external IPT monitoring
Date: Mon, 1 Feb 2021 23:26:52 +0000
Message-ID: <20210201232703.29275-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Combined series (as they are dependent).  First, the resource size fixes, and
then the external IPT monitoring built on top.  Some patches got committed
before the feature freeze date last Friday.  This is the remainder.

Everything is suitably reviewed now, unless anyone has any last minute urgent
issues.

Therefore, I'd like to request a release exception.

Patch 1 is a bugfix, and the last in a long line of fixes to the
acquire_resource hypercall.  Technically it ought not to need a release ack at
this point.

The rest of the patches are a feature, originally contributed by CERT.PL for a
project they are working on, which got blocked for reasons outside of their
control (blocked on my acquire_resource fixes, and the extreme quantity of
security work this release cycle).

Intel Processor Trace is a debugging/diagnostic feature, which allows for
reconstruction of the exact execution path of the target.  As implemented
here, a monitoring agent can trace execution within the guest.

There are two production users of this already.

1) KFX - https://github.com/intel/kernel-fuzzer-for-xen-project

   This is a project lead by Tamas which is a fuzzer based on Xen, with AFL
   running in dom0, and backended with introspection and VMFork/reset for
   injecting data and parallel testing.  It uses IPT (this series) to feed the
   taken-path back to AFL, is far more convenient than recompiling the
   subject-under-test, and is far faster than using breakpoints for path
   reconstruction.

2) Drakvuf Sandbox - https://github.com/CERT-Polska/drakvuf-sandbox

   This project, lead by a team at CERT is an automatic malware-analysis SaaS
   offering, which will inspect suspicious files and attempt to provoke them
   to extract their payload, with introspection stepping in once it is fully
   unpacked, to inspect and classify the malware.

Both are very exciting projects, and the addition of IPT support like this
helps keep Xen at the forefront of hypervisor introspection technologies.

When I've got enough free time to do some paperwork, I'm intending to add IPT
as tech-preview (in particular - there are some hardware errata which concern
me, and an as-yet uninvestigated exclusion vs LBR as a hardware restriction).

It has active downstream users and extensive testing, as well as being fairly
isolated in terms of interactions with the rest of Xen, so the changes of a
showstopper affecting other features is very slim.


Andrew Cooper (1):
  xen/memory: Fix mapping grant tables with XENMEM_acquire_resource

Michał Leszczyński (7):
  xen/domain: Add vmtrace_size domain creation parameter
  tools/[lib]xl: Add vmtrace_buf_size parameter
  xen/memory: Add a vmtrace_buf resource type
  x86/vmx: Add Intel Processor Trace support
  xen/domctl: Add XEN_DOMCTL_vmtrace_op
  tools/libxc: Add xc_vmtrace_* functions
  tools/misc: Add xen-vmtrace tool

Tamas K Lengyel (3):
  xen/vmtrace: support for VM forks
  x86/vm_event: Carry the vmtrace buffer position in vm_event
  x86/vm_event: add response flag to reset vmtrace buffer

 docs/man/xl.cfg.5.pod.in                    |   9 ++
 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/include/libxl.h                       |   7 ++
 tools/include/xenctrl.h                     |  73 +++++++++++
 tools/libs/ctrl/Makefile                    |   1 +
 tools/libs/ctrl/xc_vmtrace.c                | 128 ++++++++++++++++++++
 tools/libs/light/libxl_cpuid.c              |   1 +
 tools/libs/light/libxl_create.c             |   1 +
 tools/libs/light/libxl_types.idl            |   4 +
 tools/misc/.gitignore                       |   1 +
 tools/misc/Makefile                         |   7 ++
 tools/misc/xen-cpuid.c                      |   2 +-
 tools/misc/xen-vmtrace.c                    | 166 +++++++++++++++++++++++++
 tools/xl/xl_parse.c                         |   4 +
 xen/arch/x86/domain.c                       |  23 ++++
 xen/arch/x86/domctl.c                       |  55 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  19 ++-
 xen/arch/x86/hvm/vmx/vmx.c                  | 180 +++++++++++++++++++++++++++-
 xen/arch/x86/mm/mem_sharing.c               |   3 +
 xen/arch/x86/vm_event.c                     |  10 ++
 xen/common/compat/memory.c                  | 114 ++++++++++++++----
 xen/common/domain.c                         |  64 ++++++++++
 xen/common/grant_table.c                    |   3 +
 xen/common/memory.c                         | 153 ++++++++++++++++++-----
 xen/common/vm_event.c                       |   3 +
 xen/include/asm-arm/vm_event.h              |   6 +
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |  72 +++++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/msr.h                   |  32 +++++
 xen/include/asm-x86/vm_event.h              |   2 +
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  38 ++++++
 xen/include/public/memory.h                 |   1 +
 xen/include/public/vm_event.h               |  11 ++
 xen/include/xen/sched.h                     |   6 +
 xen/xsm/flask/hooks.c                       |   1 +
 38 files changed, 1150 insertions(+), 59 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_vmtrace.c
 create mode 100644 tools/misc/xen-vmtrace.c

-- 
2.11.0


