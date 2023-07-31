Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BEC7697BA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573057.897370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3k-0008K5-9U; Mon, 31 Jul 2023 13:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573057.897370; Mon, 31 Jul 2023 13:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3k-0008Hs-6B; Mon, 31 Jul 2023 13:35:40 +0000
Received: by outflank-mailman (input) for mailman id 573057;
 Mon, 31 Jul 2023 13:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQT3j-0008Hl-7r
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:35:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22070c65-2fa7-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:35:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B980C4EE0737;
 Mon, 31 Jul 2023 15:35:34 +0200 (CEST)
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
X-Inumbo-ID: 22070c65-2fa7-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH 0/4] xen: address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 15:34:58 +0200
Message-Id: <cover.1690810346.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

The following two strategies are adopted to deal with som violations
of this rule:
- renaming of local variables, functions or parameters;
- removal of unnecessary parameters from function definitions.

No functional changes.

Nicola Vetrini (4):
  xen/pci: rename local variable to address MISRA C:2012 Rule 5.3
  amd/iommu: rename functions to address MISRA C:2012 Rule 5.3
  xen: rename variables and parameters to address MISRA C:2012 Rule 5.3
  arm/efi: address MISRA C:2012 Rule 5.3

 xen/arch/arm/efi/efi-boot.h               | 29 +++++++++---------
 xen/common/compat/memory.c                |  6 ++--
 xen/common/numa.c                         | 36 +++++++++++------------
 xen/drivers/char/ehci-dbgp.c              |  4 +--
 xen/drivers/char/ns16550.c                |  4 +--
 xen/drivers/passthrough/amd/iommu_guest.c | 14 ++++-----
 xen/drivers/passthrough/pci.c             | 12 ++++----
 7 files changed, 53 insertions(+), 52 deletions(-)

--
2.34.1

