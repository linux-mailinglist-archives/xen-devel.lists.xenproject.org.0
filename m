Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753B21780F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:40:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSO-0007ep-7m; Tue, 07 Jul 2020 19:40:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSM-0007ao-VY
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:40:42 +0000
X-Inumbo-ID: b7fb4044-c089-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7fb4044-c089-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 19:40:32 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 45DD5A2657;
 Tue,  7 Jul 2020 21:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2DAB7A261F;
 Tue,  7 Jul 2020 21:40:30 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id A7sP2nFKaCHb; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 76ADDA265A;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S1odB7LY9wkz; Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3E4C7A2646;
 Tue,  7 Jul 2020 21:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 192B622466;
 Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ziXmPpBNaCej; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4AA252230B;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Gzc46ntvovfp; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 13D8C21B7E;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 00/11] Implement support for external IPT monitoring
Date: Tue,  7 Jul 2020 21:39:39 +0200
Message-Id: <cover.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 Stefano Stabellini <sstabellini@kernel.org>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Intel Processor Trace is an architectural extension available in modern I=
ntel=20
family CPUs. It allows recording the detailed trace of activity while the=
=20
processor executes the code. One might use the recorded trace to reconstr=
uct=20
the code flow. It means, to find out the executed code paths, determine=20
branches taken, and so forth.

The abovementioned feature is described in Intel(R) 64 and IA-32 Architec=
tures=20
Software Developer's Manual Volume 3C: System Programming Guide, Part 3,=20
Chapter 36: "Intel Processor Trace."

This patch series implements an interface that Dom0 could use in order to=
=20
enable IPT for particular vCPUs in DomU, allowing for external monitoring=
. Such=20
a feature has numerous applications like malware monitoring, fuzzing, or=20
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

Changed since v4:
  * rebased to commit be63d9d4
  * fixed dependencies between patches
    (earlier patches don't reference further patches)
  * introduced preemption check in acquire_resource
  * moved buffer allocation to common code
  * splitted some patches according to code review
  * minor fixes according to code review

Changed since v5:
  * trace buffer size is now dynamically determined by the proctrace
    tool
  * trace buffer size variable is uniformly defined as uint32_t
    processor_trace_buf_kb in hypervisor, toolstack and ABI
  * buffer pages are not freed explicitly but reference count is
    now used instead
  * minor fixes according to code review

This patch series is available on GitHub:
https://github.com/icedevml/xen/tree/ipt-patch-v6


Michal Leszczynski (11):
  memory: batch processing in acquire_resource()
  x86/vmx: add Intel PT MSR definitions
  x86/vmx: add IPT cpu feature
  common: add vmtrace_pt_size domain parameter
  tools/libxl: add vmtrace_pt_size parameter
  x86/hvm: processor trace interface in HVM
  x86/vmx: implement IPT in VMX
  x86/mm: add vmtrace_buf resource type
  x86/domctl: add XEN_DOMCTL_vmtrace_op
  tools/libxc: add xc_vmtrace_* functions
  tools/proctrace: add proctrace tool

 docs/man/xl.cfg.5.pod.in                    |  13 ++
 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/libxc/Makefile                        |   1 +
 tools/libxc/include/xenctrl.h               |  40 +++++
 tools/libxc/xc_vmtrace.c                    |  87 ++++++++++
 tools/libxl/libxl.h                         |   8 +
 tools/libxl/libxl_create.c                  |   1 +
 tools/libxl/libxl_types.idl                 |   4 +
 tools/proctrace/Makefile                    |  45 +++++
 tools/proctrace/proctrace.c                 | 179 ++++++++++++++++++++
 tools/xl/xl_parse.c                         |  22 +++
 xen/arch/x86/domain.c                       |  27 +++
 xen/arch/x86/domctl.c                       |  50 ++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  15 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 110 ++++++++++++
 xen/common/domain.c                         |  46 +++++
 xen/common/memory.c                         |  80 ++++++++-
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |  20 +++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/hvm/vmx/vmx.h           |  14 ++
 xen/include/asm-x86/msr-index.h             |  24 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  29 ++++
 xen/include/public/memory.h                 |   1 +
 xen/include/xen/domain.h                    |   2 +
 xen/include/xen/sched.h                     |   7 +
 28 files changed, 828 insertions(+), 6 deletions(-)
 create mode 100644 tools/libxc/xc_vmtrace.c
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

--=20
2.17.1


