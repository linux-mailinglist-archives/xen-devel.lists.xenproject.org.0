Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E29145BB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746319.1153333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd3-0002yJ-3e; Mon, 24 Jun 2024 09:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746319.1153333; Mon, 24 Jun 2024 09:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd3-0002x2-0J; Mon, 24 Jun 2024 09:04:49 +0000
Received: by outflank-mailman (input) for mailman id 746319;
 Mon, 24 Jun 2024 09:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfd1-0002wq-Np
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdad74b6-3208-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 11:04:46 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id 55E264EE0738;
 Mon, 24 Jun 2024 11:04:45 +0200 (CEST)
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
X-Inumbo-ID: cdad74b6-3208-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 00/13] x86: address some violations of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:24 +0200
Message-Id: <cover.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a missing escape in a deviation and addresses some
violations.

Federico Serafini (13):
  automation/eclair: fix deviation of MISRA C Rule 16.3
  x86/cpuid: use fallthrough pseudo keyword
  x86/domctl: address a violation of MISRA C Rule 16.3
  x86/vpmu: address violations of MISRA C Rule 16.3
  x86/traps: address violations of MISRA C Rule 16.3
  x86/mce: address violations of MISRA C Rule 16.3
  x86/hvm: address violations of MISRA C Rule 16.3
  x86/vpt: address a violation of MISRA C Rule 16.3
  x86/mm: add defensive return
  x86/mpparse: address a violation of MISRA C Rule 16.3
  x86/pmtimer: address a violation of MISRA C Rule 16.3
  x86/vPIC: address a violation of MISRA C Rule 16.3
  x86/vlapic: address a violation of MISRA C Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c                | 1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c              | 2 ++
 xen/arch/x86/cpu/vpmu.c                          | 3 +++
 xen/arch/x86/cpu/vpmu_intel.c                    | 1 +
 xen/arch/x86/cpuid.c                             | 3 +--
 xen/arch/x86/domctl.c                            | 1 +
 xen/arch/x86/hvm/emulate.c                       | 9 ++++++---
 xen/arch/x86/hvm/hvm.c                           | 6 ++++++
 xen/arch/x86/hvm/hypercall.c                     | 1 +
 xen/arch/x86/hvm/irq.c                           | 1 +
 xen/arch/x86/hvm/pmtimer.c                       | 1 +
 xen/arch/x86/hvm/vlapic.c                        | 1 +
 xen/arch/x86/hvm/vpic.c                          | 1 +
 xen/arch/x86/hvm/vpt.c                           | 2 ++
 xen/arch/x86/mm.c                                | 1 +
 xen/arch/x86/mpparse.c                           | 1 +
 xen/arch/x86/traps.c                             | 3 +++
 18 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.34.1


