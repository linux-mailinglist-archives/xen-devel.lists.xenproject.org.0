Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BD910747
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744608.1151676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN1-0007rk-Lu; Thu, 20 Jun 2024 14:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744608.1151676; Thu, 20 Jun 2024 14:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN1-0007pI-IZ; Thu, 20 Jun 2024 14:02:35 +0000
Received: by outflank-mailman (input) for mailman id 744608;
 Thu, 20 Jun 2024 14:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN0-0007p3-Ga
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bce82612-2f0d-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:02:32 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id DC19F4EE0738;
 Thu, 20 Jun 2024 16:02:30 +0200 (CEST)
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
X-Inumbo-ID: bce82612-2f0d-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 00/13] x86: address violations of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 16:02:11 +0200
Message-Id: <cover.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses violations of MISRA C Rule 16.3 and updates
the ECLAIR configuration to consider also hypened fall-through comment
as a deviation to the rule.

Federico Serafini (13):
  automation/eclair: consider also hypened fall-through
  x86/cpuid: use fallthrough pseudo keyword
  x86/domctl: add missing break statement
  x86/vpmu: address violations of MISRA C Rule 16.3
  x86/traps: use fallthrough pseudo keyword
  x86/mce: add missing break statements
  x86/hvm: address violations of MISRA C Rule 16.3
  x86/vpt: address a violation of MISRA C Rule 16.3
  x86/mm: add defensive return
  x86/mpparse: add break statement
  x86/pmtimer: address a violation of MISRA C Rule 16.3
  x86/vPIC: address a violation of MISRA C Rule 16.3
  x86/vlapic: address a violation of MISRA C Rule 16.3

 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 docs/misra/deviations.rst                        | 4 ++++
 xen/arch/x86/cpu/mcheck/mce_amd.c                | 1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c              | 2 ++
 xen/arch/x86/cpu/vpmu.c                          | 3 +++
 xen/arch/x86/cpu/vpmu_intel.c                    | 1 +
 xen/arch/x86/cpuid.c                             | 3 +--
 xen/arch/x86/domctl.c                            | 1 +
 xen/arch/x86/hvm/emulate.c                       | 3 +++
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
 19 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.34.1


