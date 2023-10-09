Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7C7BD3E2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614143.955072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAO-0005Ws-Vf; Mon, 09 Oct 2023 06:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614143.955072; Mon, 09 Oct 2023 06:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAO-0005V1-Rk; Mon, 09 Oct 2023 06:55:00 +0000
Received: by outflank-mailman (input) for mailman id 614143;
 Mon, 09 Oct 2023 06:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAO-0005Uv-2n
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23997c8-6670-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 08:54:58 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 459AE4EE073F;
 Mon,  9 Oct 2023 08:54:55 +0200 (CEST)
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
X-Inumbo-ID: c23997c8-6670-11ee-98d3-6d05b1d4d9a1
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH][for-4.19 v2 0/7] Fix or deviate various instances of missing declarations
Date: Mon,  9 Oct 2023 08:54:45 +0200
Message-Id: <cover.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patches in this series aim to fix or deviate various instances where a
function or variable do not have a declaration visible when such entity is
defined (in violation of MISRA C:2012 Rule 8.4).
An exception listed under docs/misra/rules.rst allows asm-only functions and
variables to be exempted, while the other instances are either changed
(e.g., making them static) or a missing header inclusion is added.

Some of the patches in this series are potential candidates for bug fixes, or
just general improvements that may be suited for inclusion in the next rc.

The deviation comment used by these patches is still SAF-x-safe, which is being
phased out in favour of some other name, as discussed here [1]. When such a name
has been determined, a new (trivial) version of this series can be produced,
the change could be made on commit or as part of the SAF rename troughout the
codebase.

Nicola Vetrini (7):
  xen: add declarations for variables where needed
  x86: add deviations for variables only used in asm code
  x86: add deviation comments for  asm-only functions
  x86/grant: switch included header to make declarations visible
  x86/vm_event: add missing include for hvm_vm_event_do_resume
  xen/console: make function static inline
  x86/mem_access: make function static

 xen/arch/arm/include/asm/setup.h           |  3 +++
 xen/arch/arm/include/asm/smp.h             |  3 +++
 xen/arch/arm/platform_hypercall.c          |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c              |  6 +++---
 xen/arch/x86/hvm/grant_table.c             |  3 +--
 xen/arch/x86/hvm/svm/intr.c                |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c           |  1 +
 xen/arch/x86/hvm/svm/svm.c                 |  2 ++
 xen/arch/x86/hvm/vm_event.c                |  1 +
 xen/arch/x86/include/asm/asm_defns.h       |  1 +
 xen/arch/x86/include/asm/compat.h          |  1 +
 xen/arch/x86/include/asm/hvm/grant_table.h |  2 ++
 xen/arch/x86/include/asm/setup.h           |  1 +
 xen/arch/x86/irq.c                         |  2 +-
 xen/arch/x86/mm/mem_access.c               |  2 +-
 xen/arch/x86/setup.c                       |  1 +
 xen/arch/x86/traps.c                       |  1 +
 xen/arch/x86/x86_64/traps.c                |  1 +
 xen/common/symbols.c                       | 17 -----------------
 xen/include/xen/consoled.h                 |  2 +-
 xen/include/xen/symbols.h                  | 18 ++++++++++++++++++
 21 files changed, 45 insertions(+), 26 deletions(-)

--
2.34.1

