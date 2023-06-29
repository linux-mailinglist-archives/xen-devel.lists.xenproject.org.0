Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB528742A06
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556955.869884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzp-00011v-RA; Thu, 29 Jun 2023 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556955.869884; Thu, 29 Jun 2023 15:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzp-0000zk-Nl; Thu, 29 Jun 2023 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 556955;
 Thu, 29 Jun 2023 15:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzn-0000zP-Fs
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68ba15ba-1695-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 17:55:46 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id 37F7D4EE0737;
 Thu, 29 Jun 2023 17:55:43 +0200 (CEST)
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
X-Inumbo-ID: 68ba15ba-1695-11ee-b237-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 0/5] Fix violations of MISRA C:2012 Rule 8.3 on parameter names
Date: Thu, 29 Jun 2023 17:55:28 +0200
Message-Id: <cover.1688049494.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To comply with Rule 8.3 ("All declarations of an object or function
shall use the same names and type qualifiers") change the parameter
names in order to have function declarations consistent with the
corresponding definitions.

Federico Serafini (5):
  x86: swap parameter names of hvm_copy_context_and_params() declaration
  x86: change parameter names of nestedhvm_vcpu_iomap_get() definition
  x86/vlapic: change parameter names in function definitions
  x86/x86_emulate: change parameter name from 's' to 'state'
  x86: make parameter names of function declarations consistent

 xen/arch/x86/cpu/mcheck/mce.h           |  2 +-
 xen/arch/x86/cpu/mcheck/x86_mca.h       |  2 +-
 xen/arch/x86/hvm/nestedhvm.c            | 10 ++---
 xen/arch/x86/hvm/rtc.c                  |  2 +-
 xen/arch/x86/hvm/svm/nestedhvm.h        |  2 +-
 xen/arch/x86/hvm/vioapic.c              |  2 +-
 xen/arch/x86/hvm/vlapic.c               | 56 ++++++++++++-------------
 xen/arch/x86/include/asm/genapic.h      |  2 +-
 xen/arch/x86/include/asm/guest_pt.h     |  2 +-
 xen/arch/x86/include/asm/hap.h          |  2 +-
 xen/arch/x86/include/asm/hvm/hvm.h      |  2 +-
 xen/arch/x86/include/asm/hvm/io.h       |  2 +-
 xen/arch/x86/include/asm/hvm/monitor.h  |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 +-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  8 ++--
 xen/arch/x86/include/asm/io_apic.h      |  2 +-
 xen/arch/x86/include/asm/irq.h          |  6 +--
 xen/arch/x86/include/asm/mem_access.h   |  2 +-
 xen/arch/x86/include/asm/mpspec.h       |  2 +-
 xen/arch/x86/include/asm/msi.h          |  4 +-
 xen/arch/x86/include/asm/p2m.h          |  8 ++--
 xen/arch/x86/include/asm/paging.h       |  2 +-
 xen/arch/x86/include/asm/psr.h          |  2 +-
 xen/arch/x86/include/asm/setup.h        |  2 +-
 xen/arch/x86/include/asm/uaccess.h      |  6 +--
 xen/arch/x86/include/asm/xstate.h       |  2 +-
 xen/arch/x86/x86_emulate/blk.c          | 38 ++++++++---------
 xen/arch/x86/x86_emulate/util-xen.c     | 46 ++++++++++----------
 xen/arch/x86/x86_emulate/util.c         | 54 ++++++++++++------------
 xen/include/xen/lib/x86/cpu-policy.h    | 29 ++++++-------
 31 files changed, 154 insertions(+), 153 deletions(-)

-- 
2.34.1


