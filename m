Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CE7B2125
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609916.949088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssx-00034b-Rk; Thu, 28 Sep 2023 15:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609916.949088; Thu, 28 Sep 2023 15:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlssx-00033F-Nz; Thu, 28 Sep 2023 15:25:03 +0000
Received: by outflank-mailman (input) for mailman id 609916;
 Thu, 28 Sep 2023 15:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRba=FM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qlssv-00032t-PZ
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:25:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3048edcd-5e13-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 17:25:00 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 361B14EE0739;
 Thu, 28 Sep 2023 17:24:59 +0200 (CEST)
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
X-Inumbo-ID: 3048edcd-5e13-11ee-878a-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	jbeulich@suse.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v7 0/4] xen/x86: address violations of MISRA C:2012 Rule 7.2
Date: Thu, 28 Sep 2023 17:23:00 +0200
Message-Id: <cover.1695913900.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
states:
"A 'u' or 'U' suffix shall be applied to all integer constants that are
represented in an unsigned type".

These violations are caused by the missing "u" or "U" suffix in unsigned
integer constants, such as:

xen/arch/x86/hvm/hypercall.c:132.17-132.26
if ( (eax & 0x80000000) && is_viridian_domain(currd) )

If a rule is not met, changes are needed in order to achieve compliance.
The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
adding the 'U' suffix to integers literals with unsigned type and also to
other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Gianluca Luparini (1):
  x86/vmx: address violations of MISRA C:2012 Rule 7.2

Simone Ballarin (3):
  x86/hvm: address violations of MISRA C:2012 Rule 7.2
  x86/include: address violations of MISRA C:2012 Rule 7.2
  xen/x86: address violations of MISRA C:2012 Rule 7.2

 xen/arch/x86/apic.c                     |   2 +-
 xen/arch/x86/cpu-policy.c               |  18 +--
 xen/arch/x86/cpu/vpmu_intel.c           |   2 +-
 xen/arch/x86/cpuid.c                    |   8 +-
 xen/arch/x86/extable.c                  |   2 +-
 xen/arch/x86/hvm/hypercall.c            |   2 +-
 xen/arch/x86/hvm/pmtimer.c              |   4 +-
 xen/arch/x86/hvm/stdvga.c               |  32 ++---
 xen/arch/x86/hvm/vlapic.c               |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |   6 +-
 xen/arch/x86/hvm/vmx/vvmx.c             |   8 +-
 xen/arch/x86/include/asm/apicdef.h      |   2 +-
 xen/arch/x86/include/asm/config.h       |   2 +-
 xen/arch/x86/include/asm/hpet.h         |   2 +-
 xen/arch/x86/include/asm/hvm/trace.h    |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic.h  |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  84 +++++------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  16 +--
 xen/arch/x86/include/asm/msi.h          |   2 +-
 xen/arch/x86/include/asm/msr-index.h    | 182 ++++++++++++------------
 xen/arch/x86/include/asm/pci.h          |   8 +-
 xen/arch/x86/include/asm/x86-defns.h    |  22 +--
 xen/arch/x86/percpu.c                   |   2 +-
 xen/arch/x86/psr.c                      |   2 +-
 xen/arch/x86/spec_ctrl.c                |  12 +-
 25 files changed, 216 insertions(+), 216 deletions(-)

-- 
2.34.1


