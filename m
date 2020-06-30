Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354620F4BA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFTb-0007q0-R0; Tue, 30 Jun 2020 12:35:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFTa-0007pv-Lk
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:02 +0000
X-Inumbo-ID: 1c286414-bace-11ea-860f-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c286414-bace-11ea-860f-12813bfff9fa;
 Tue, 30 Jun 2020 12:34:59 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0B87CA37E4;
 Tue, 30 Jun 2020 14:34:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EAA8DA37E2;
 Tue, 30 Jun 2020 14:34:56 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gvwubWuY7bvm; Tue, 30 Jun 2020 14:34:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3AD71A37E4;
 Tue, 30 Jun 2020 14:34:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tFbQ69aFBKZj; Tue, 30 Jun 2020 14:34:56 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0525AA37E2;
 Tue, 30 Jun 2020 14:34:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E48842255E;
 Tue, 30 Jun 2020 14:34:25 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ltQoc2YjWCCQ; Tue, 30 Jun 2020 14:34:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5388A2252B;
 Tue, 30 Jun 2020 14:34:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nzLQXCLE_Qn8; Tue, 30 Jun 2020 14:34:20 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 176942200C;
 Tue, 30 Jun 2020 14:34:20 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 00/10] Implement support for external IPT monitoring
Date: Tue, 30 Jun 2020 14:33:43 +0200
Message-Id: <cover.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, luwei.kang@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Intel Processor Trace is an architectural extension available in modern Intel 
family CPUs. It allows recording the detailed trace of activity while the 
processor executes the code. One might use the recorded trace to reconstruct 
the code flow. It means, to find out the executed code paths, determine 
branches taken, and so forth.

The abovementioned feature is described in Intel(R) 64 and IA-32 Architectures 
Software Developer's Manual Volume 3C: System Programming Guide, Part 3, 
Chapter 36: "Intel Processor Trace."

This patch series implements an interface that Dom0 could use in order to 
enable IPT for particular vCPUs in DomU, allowing for external monitoring. Such 
a feature has numerous applications like malware monitoring, fuzzing, or 
performance testing.

Also thanks to Tamas K Lengyel for a few preliminary hints before
first version of this patch was submitted to xen-devel.

Changed since v1:
  * MSR_RTIT_CTL is managed using MSR load lists
  * other PT-related MSRs are modified only when vCPU goes out of context
  * trace buffer is now acquired as a resource
  * added vmtrace_pt_size parameter in xl.cfg, the size of trace buffer
    must be specified in the moment of domain creation
  * trace buffers are allocated on domain creation, destructed on
    domain destruction
  * HVMOP_vmtrace_ipt_enable/disable is limited to enabling/disabling PT
    these calls don't manage buffer memory anymore
  * lifted 32 MFN/GFN array limit when acquiring resources
  * minor code style changes according to review

Changed since v2:
  * trace buffer is now allocated on domain creation (in v2 it was
    allocated when hvm param was set)
  * restored 32-item limit in mfn/gfn arrays in acquire_resource
    and instead implemented hypercall continuations
  * code changes according to Jan's and Roger's review

Changed since v3:
  * vmtrace HVMOPs are not implemented as DOMCTLs
  * patches splitted up according to Andrew's comments
  * code changes according to v3 review on the mailing list


Michal Leszczynski (10):
  x86/vmx: add Intel PT MSR definitions
  x86/vmx: add IPT cpu feature
  tools/libxl: add vmtrace_pt_size parameter
  x86/vmx: implement processor tracing for VMX
  common/domain: allocate vmtrace_pt_buffer
  memory: batch processing in acquire_resource()
  x86/mm: add vmtrace_buf resource type
  x86/domctl: add XEN_DOMCTL_vmtrace_op
  tools/libxc: add xc_vmtrace_* functions
  tools/proctrace: add proctrace tool

 docs/man/xl.cfg.5.pod.in                    |  10 +
 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/libxc/Makefile                        |   1 +
 tools/libxc/include/xenctrl.h               |  39 +++
 tools/libxc/xc_vmtrace.c                    |  73 +++++
 tools/libxl/libxl.h                         |   8 +
 tools/libxl/libxl_create.c                  |   1 +
 tools/libxl/libxl_types.idl                 |   2 +
 tools/proctrace/COPYING                     | 339 ++++++++++++++++++++
 tools/proctrace/Makefile                    |  48 +++
 tools/proctrace/proctrace.c                 | 163 ++++++++++
 tools/xl/xl_parse.c                         |  20 ++
 xen/arch/x86/domain.c                       |  11 +
 xen/arch/x86/domctl.c                       |  48 +++
 xen/arch/x86/hvm/vmx/vmcs.c                 |   7 +-
 xen/arch/x86/hvm/vmx/vmx.c                  |  89 +++++
 xen/arch/x86/mm.c                           |  25 ++
 xen/common/domain.c                         |  46 +++
 xen/common/memory.c                         |  32 +-
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/domain.h                |   4 +
 xen/include/asm-x86/hvm/hvm.h               |  38 +++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/hvm/vmx/vmx.h           |  14 +
 xen/include/asm-x86/msr-index.h             |  37 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  27 ++
 xen/include/public/memory.h                 |   1 +
 xen/include/xen/domain.h                    |   2 +
 xen/include/xen/sched.h                     |   4 +
 31 files changed, 1094 insertions(+), 4 deletions(-)
 create mode 100644 tools/libxc/xc_vmtrace.c
 create mode 100644 tools/proctrace/COPYING
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

-- 
2.20.1


