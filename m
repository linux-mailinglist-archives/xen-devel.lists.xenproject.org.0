Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98893F081
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766466.1176943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEt-0000Nn-KA; Mon, 29 Jul 2024 09:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766466.1176943; Mon, 29 Jul 2024 09:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEt-0000M5-HS; Mon, 29 Jul 2024 09:00:19 +0000
Received: by outflank-mailman (input) for mailman id 766466;
 Mon, 29 Jul 2024 09:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEs-0000Lt-4b
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9724428-4d88-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 11:00:17 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 613654EE0759;
 Mon, 29 Jul 2024 11:00:15 +0200 (CEST)
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
X-Inumbo-ID: f9724428-4d88-11ef-bc01-fd08da9f4363
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
Subject: [XEN PATCH v5 0/8] x86: address some violations of MISRA C Rule 16.3
Date: Mon, 29 Jul 2024 11:00:01 +0200
Message-Id: <cover.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a missing escape in a deviation and addresses some
violations.

Federico Serafini (8):
  automation/eclair: fix deviation of MISRA C Rule 16.3
  x86/vpmu: address violations of MISRA C Rule 16.3
  x86/traps: address violations of MISRA C Rule 16.3
  x86/mce: address violations of MISRA C Rule 16.3
  x86/hvm: address violations of MISRA C Rule 16.3
  x86/hvm: add defensive statements in unreachable program points
  x86/mm: add defensive return
  x86/mpparse: address a violation of MISRA C Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl |  5 ++---
 xen/arch/x86/cpu/mcheck/mce_amd.c                |  1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c              |  2 ++
 xen/arch/x86/cpu/vpmu.c                          |  3 +++
 xen/arch/x86/cpu/vpmu_intel.c                    |  2 ++
 xen/arch/x86/hvm/emulate.c                       | 12 +++++++-----
 xen/arch/x86/hvm/hvm.c                           |  5 +++++
 xen/arch/x86/hvm/hypercall.c                     |  2 +-
 xen/arch/x86/hvm/irq.c                           |  1 +
 xen/arch/x86/hvm/pmtimer.c                       |  1 +
 xen/arch/x86/hvm/svm/svm.c                       |  2 ++
 xen/arch/x86/hvm/vlapic.c                        |  1 +
 xen/arch/x86/hvm/vmx/vmcs.c                      |  2 ++
 xen/arch/x86/hvm/vmx/vmx.c                       |  3 ++-
 xen/arch/x86/hvm/vmx/vvmx.c                      |  1 +
 xen/arch/x86/hvm/vpic.c                          |  1 +
 xen/arch/x86/hvm/vpt.c                           |  3 +--
 xen/arch/x86/mm.c                                |  1 +
 xen/arch/x86/mpparse.c                           |  1 +
 xen/arch/x86/traps.c                             |  3 +++
 20 files changed, 40 insertions(+), 12 deletions(-)

-- 
2.34.1


