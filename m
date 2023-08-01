Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A876B504
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 14:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574137.899330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQonf-0002TJ-PP; Tue, 01 Aug 2023 12:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574137.899330; Tue, 01 Aug 2023 12:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQonf-0002PQ-MG; Tue, 01 Aug 2023 12:48:31 +0000
Received: by outflank-mailman (input) for mailman id 574137;
 Tue, 01 Aug 2023 12:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQond-0002MY-Og
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 12:48:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b11ccd-3069-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 14:48:27 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9D86E4EE0737;
 Tue,  1 Aug 2023 14:48:25 +0200 (CEST)
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
X-Inumbo-ID: b5b11ccd-3069-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v2 0/3] xen: address MISRA C:2012 Rule 5.3
Date: Tue,  1 Aug 2023 14:47:41 +0200
Message-Id: <cover.1690893696.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 5.3 has the following headline:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

The following two strategies are adopted to deal with some violations
of this rule:
- renaming of local variables, functions or parameters;
- removal of unnecessary declarations.

No functional changes.

Changes in v2:
- Patches 1/4 and 2/4 from the previous version of this patch
  (https://lore.kernel.org/xen-devel/cover.1690810346.git.nicola.vetrini@bugseng.com/)
	are already committed to staging, therefore are excluded from this series.

Nicola Vetrini (3):
  xen/common: address MISRA C:2012 Rule 5.3
  drivers/char: address MISRA C:2012 Rule 5.3
  arm/efi: address MISRA C:2012 Rule 5.3

 xen/arch/arm/efi/efi-boot.h  | 84 ++++++++++++++++++------------------
 xen/common/compat/memory.c   |  7 ++-
 xen/common/numa.c            | 20 ++++-----
 xen/drivers/char/ehci-dbgp.c |  4 +-
 xen/drivers/char/ns16550.c   |  6 +--
 5 files changed, 59 insertions(+), 62 deletions(-)

--
2.34.1

