Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CD76D039
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574971.900627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006dB-6A; Wed, 02 Aug 2023 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574971.900627; Wed, 02 Aug 2023 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006bd-2R; Wed, 02 Aug 2023 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 574971;
 Wed, 02 Aug 2023 14:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzm-0006bO-3e
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 437097a0-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:36 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 784624EE0737;
 Wed,  2 Aug 2023 16:38:34 +0200 (CEST)
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
X-Inumbo-ID: 437097a0-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 00/11] xen: address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:06 +0200
Message-Id: <cover.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headline for Rule 2.1 states:
"A project shall not contain unreachable code". Violations of this rule addressed
by this patch are caused by two constructs:

1. Declarations inside switch statements, before any clause. This construct is
   allowed by the language, but is considered unreachable code, since the program
	 execution doesn't ever reach these statements, even though the variables are
	 introduced in the switch block.
2. Code following functions that are not intended to return to the caller or
   additional statements required by defensive programming practices or other
	 MISRA rules (such as a break to end each switch clause, even if that break
	 is effectively unreachable).

(1) is resolved by moving the declarations in an appropriate scope, while (2) is
addressed by adding ASSERT_UNREACHABLE() calls to signal that the code below is
intentionally unreachable, thus motivating the violation of the rule.

---
The approach taken in this series to address the violations is the outcome of
a MISRA C group meeting held 25/07/2023.

Nicola Vetrini (11):
  x86/efi: move variable declaration to address MISRA C:2012 Rule 2.1
  x86: move declarations to address MISRA C:2012 Rule 2.1
  x86/uaccess: move declarations to address MISRA C:2012 Rule 2.1
  x86emul: move variable definitions to address MISRA C:2012 Rule 2.1
  drivers/pci: move variable definitions to address MISRA C:2012 Rule
    2.1
  xen/ioreq: move variable declaration to address MISRA C:2012 Rule 2.1
  xen: address MISRA C:2012 Rule 2.1
  xen: move declarations to address MISRA C:2012 Rule 2.1
  x86/xstate: moved BUILD_BUG_ON to address MISRA C:2012 Rule 2.1
  xen/sched: add ASSERT_UNREACHABLE() to address MISRA C:2012 Rule 2.1
  x86/mm: Add assertion to address MISRA C:2012 Rule 2.1

 xen/arch/x86/cpuid.c                   |  3 +--
 xen/arch/x86/domain.c                  | 23 +++++++++++------------
 xen/arch/x86/efi/efi-boot.h            |  5 ++---
 xen/arch/x86/hvm/emulate.c             |  9 ++++-----
 xen/arch/x86/hvm/hvm.c                 | 10 ++++------
 xen/arch/x86/include/asm/uaccess.h     |  6 ++++--
 xen/arch/x86/irq.c                     |  3 +--
 xen/arch/x86/mm.c                      |  1 +
 xen/arch/x86/mm/p2m-pod.c              |  1 +
 xen/arch/x86/msr.c                     |  3 +--
 xen/arch/x86/x86_emulate/0f01.c        |  7 +++----
 xen/arch/x86/x86_emulate/blk.c         | 17 ++++++++---------
 xen/arch/x86/x86_emulate/decode.c      |  3 ++-
 xen/arch/x86/x86_emulate/fpu.c         |  3 +--
 xen/arch/x86/x86_emulate/util-xen.c    |  4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 +++++++-------
 xen/arch/x86/xstate.c                  |  3 ++-
 xen/common/compat/memory.c             |  3 +--
 xen/common/domain.c                    | 15 +++++++--------
 xen/common/ioreq.c                     |  3 +--
 xen/common/sched/core.c                |  1 +
 xen/common/shutdown.c                  | 18 ++++++++++++------
 xen/drivers/passthrough/pci.c          | 10 ++++------
 23 files changed, 81 insertions(+), 84 deletions(-)

--
2.34.1

