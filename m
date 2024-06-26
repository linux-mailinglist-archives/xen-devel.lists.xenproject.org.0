Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F4917C70
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748584.1156344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwq-0004sA-0c; Wed, 26 Jun 2024 09:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748584.1156344; Wed, 26 Jun 2024 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwp-0004nn-SF; Wed, 26 Jun 2024 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 748584;
 Wed, 26 Jun 2024 09:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwo-0004l5-Cz
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689f4503-339e-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:28:12 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 8001D4EE0738;
 Wed, 26 Jun 2024 11:28:11 +0200 (CEST)
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
X-Inumbo-ID: 689f4503-339e-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH v3 00/12] x86: address some violations of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:27:53 +0200
Message-Id: <cover.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a missing escape in a deviation and addresses some
violations.

Federico Serafini (12):
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
  x86/vPIC: address a violation of MISRA C Rule 16.3
  x86/vlapic: address a violation of MISRA C Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c                | 1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c              | 2 ++
 xen/arch/x86/cpu/vpmu.c                          | 3 +++
 xen/arch/x86/cpu/vpmu_intel.c                    | 2 ++
 xen/arch/x86/cpuid.c                             | 3 +--
 xen/arch/x86/domctl.c                            | 1 +
 xen/arch/x86/hvm/emulate.c                       | 9 ++++++---
 xen/arch/x86/hvm/hvm.c                           | 5 +++++
 xen/arch/x86/hvm/hypercall.c                     | 1 +
 xen/arch/x86/hvm/irq.c                           | 1 +
 xen/arch/x86/hvm/pmtimer.c                       | 1 +
 xen/arch/x86/hvm/vlapic.c                        | 1 +
 xen/arch/x86/hvm/vpic.c                          | 1 +
 xen/arch/x86/hvm/vpt.c                           | 4 +++-
 xen/arch/x86/mm.c                                | 1 +
 xen/arch/x86/mpparse.c                           | 1 +
 xen/arch/x86/traps.c                             | 3 +++
 18 files changed, 35 insertions(+), 7 deletions(-)

-- 
2.34.1


