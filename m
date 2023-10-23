Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF2A7D2F2D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621179.967391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgA-0008KI-8N; Mon, 23 Oct 2023 09:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621179.967391; Mon, 23 Oct 2023 09:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgA-0008Hp-4m; Mon, 23 Oct 2023 09:56:58 +0000
Received: by outflank-mailman (input) for mailman id 621179;
 Mon, 23 Oct 2023 09:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qurg7-0007mu-Ug
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:56:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce8f8b4-718a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:56:51 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4EA4C4EE0740;
 Mon, 23 Oct 2023 11:56:48 +0200 (CEST)
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
X-Inumbo-ID: 7ce8f8b4-718a-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH][for-4.19 v4 0/8] Fix or deviate various instances of missing declarations
Date: Mon, 23 Oct 2023 11:56:37 +0200
Message-Id: <cover.1698053876.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patches in this series aim to fix or deviate various instances where a
function or variable do not have a declaration visible when such entity is
defined (in violation of MISRA C:2012 Rule 8.4).
An exception listed under docs/misra/rules.rst allows asm-only functions and
variables to be exempted, while the other instances are either changed
(e.g., making them static) or a missing header inclusion is added.

Nicola Vetrini (8):
  xen: modify or add declarations for variables where needed
  x86: add deviations for variables only used in asm code
  x86: add deviation comments for  asm-only functions
  x86/grant: switch included header to make declarations visible
  x86/vm_event: add missing include for hvm_vm_event_do_resume
  xen/console: remove stub definition in consoled.h
  x86/mem_access: make function static
  docs/misra: exclude three more files

 docs/misra/exclude-list.json               | 12 ++++++++++++
 xen/arch/arm/include/asm/setup.h           |  3 +++
 xen/arch/arm/include/asm/smp.h             |  3 +++
 xen/arch/arm/platform_hypercall.c          |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c              |  7 ++++---
 xen/arch/x86/hvm/grant_table.c             |  3 +--
 xen/arch/x86/hvm/svm/intr.c                |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c           |  1 +
 xen/arch/x86/hvm/svm/svm.c                 |  2 ++
 xen/arch/x86/hvm/vm_event.c                |  1 +
 xen/arch/x86/hvm/vmx/intr.c                |  1 +
 xen/arch/x86/hvm/vmx/vmx.c                 |  2 ++
 xen/arch/x86/hvm/vmx/vvmx.c                |  1 +
 xen/arch/x86/include/asm/asm_defns.h       |  1 +
 xen/arch/x86/include/asm/hvm/grant_table.h |  2 ++
 xen/arch/x86/irq.c                         |  2 +-
 xen/arch/x86/mm/mem_access.c               |  6 +++---
 xen/arch/x86/setup.c                       |  4 +++-
 xen/arch/x86/traps.c                       |  1 +
 xen/arch/x86/x86_64/traps.c                |  1 +
 xen/include/xen/consoled.h                 |  7 -------
 xen/include/xen/symbols.h                  |  1 +
 22 files changed, 46 insertions(+), 18 deletions(-)

--
2.34.1

