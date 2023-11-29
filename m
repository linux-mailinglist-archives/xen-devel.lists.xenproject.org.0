Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1D7FDB2B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643991.1004568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQi-0001W3-KH; Wed, 29 Nov 2023 15:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643991.1004568; Wed, 29 Nov 2023 15:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQi-0001RW-FG; Wed, 29 Nov 2023 15:24:48 +0000
Received: by outflank-mailman (input) for mailman id 643991;
 Wed, 29 Nov 2023 15:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQg-0001PZ-Jy
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c92f608-8ecb-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 16:24:44 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 5BBC54EE0737;
 Wed, 29 Nov 2023 16:24:43 +0100 (CET)
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
X-Inumbo-ID: 6c92f608-8ecb-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 0/7] address some violations of MISRA C Rule 8.4
Date: Wed, 29 Nov 2023 16:24:18 +0100
Message-Id: <cover.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series addresses some of the remaining violations of MISRA C:2012 Rule 8.4.

Some of the modifications are done according to the feedback received in this
thread [1]


Nicola Vetrini (7):
  xen/arm: mmu: add headers for missing declarations
  x86/i8259: add missing header for init_IRQ declaration
  xen/x86: add missing instances of asmlinkage attributes
  x86/viridian: make build_assertions static
  docs/misra: add entry to exclude-list.json
  xen/x86: remove stale comment
  xen/page_alloc: deviate first_valid_mfn for MISRA C Rule 8.4

 docs/misra/exclude-list.json         | 4 ++++
 xen/arch/arm/mmu/setup.c             | 1 +
 xen/arch/arm/mmu/smpboot.c           | 2 ++
 xen/arch/x86/cpu/mcheck/mce.c        | 2 +-
 xen/arch/x86/desc.c                  | 2 +-
 xen/arch/x86/efi/efi-boot.h          | 5 +++--
 xen/arch/x86/hvm/viridian/synic.c    | 2 +-
 xen/arch/x86/i8259.c                 | 1 +
 xen/arch/x86/include/asm/hypercall.h | 2 +-
 xen/arch/x86/mm.c                    | 2 +-
 xen/arch/x86/smpboot.c               | 2 +-
 xen/common/page_alloc.c              | 1 +
 12 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.34.1

