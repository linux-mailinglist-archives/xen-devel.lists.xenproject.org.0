Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8363214EBD
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9np-0005br-A4; Sun, 05 Jul 2020 18:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9no-0005bc-36
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:55:48 +0000
X-Inumbo-ID: 225d0dc2-bef1-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 225d0dc2-bef1-11ea-bca7-bc764e2007e4;
 Sun, 05 Jul 2020 18:55:46 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B3835A2022;
 Sun,  5 Jul 2020 20:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AB0C0A1F8E;
 Sun,  5 Jul 2020 20:55:44 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id M_2M1YoxZiRc; Sun,  5 Jul 2020 20:55:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 01133A201B;
 Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id y5Wiv2tvmoYa; Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A5E75A1F91;
 Sun,  5 Jul 2020 20:55:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 721A622C2B;
 Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ZdhWyUy1OfMH; Sun,  5 Jul 2020 20:55:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id CEF9F22BF7;
 Sun,  5 Jul 2020 20:55:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BPpe4wxl5z5N; Sun,  5 Jul 2020 20:55:07 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 9CA72228F7;
 Sun,  5 Jul 2020 20:55:07 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 00/11] Implement support for external IPT monitoring
Date: Sun,  5 Jul 2020 20:54:53 +0200
Message-Id: <cover.1593974333.git.michal.leszczynski@cert.pl>
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

This patch series is available on GitHub:
https://github.com/icedevml/xen/tree/ipt-patch-v5


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

 docs/man/xl.cfg.5.pod.in                    |  11 ++
 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/libxc/Makefile                        |   1 +
 tools/libxc/include/xenctrl.h               |  39 +++++
 tools/libxc/xc_vmtrace.c                    |  73 +++++++++
 tools/libxl/libxl.h                         |   8 +
 tools/libxl/libxl_create.c                  |   1 +
 tools/libxl/libxl_types.idl                 |   2 +
 tools/proctrace/Makefile                    |  48 ++++++
 tools/proctrace/proctrace.c                 | 163 ++++++++++++++++++++
 tools/xl/xl_parse.c                         |  22 +++
 xen/arch/x86/domain.c                       |  19 +++
 xen/arch/x86/domctl.c                       |  48 ++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |  15 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 109 +++++++++++++
 xen/common/domain.c                         |  33 ++++
 xen/common/memory.c                         |  77 ++++++++-
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |  20 +++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/hvm/vmx/vmx.h           |  14 ++
 xen/include/asm-x86/msr-index.h             |  24 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |  27 ++++
 xen/include/public/memory.h                 |   1 +
 xen/include/xen/domain.h                    |   2 +
 xen/include/xen/sched.h                     |   8 +
 28 files changed, 768 insertions(+), 6 deletions(-)
 create mode 100644 tools/libxc/xc_vmtrace.c
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

--=20
2.17.1


