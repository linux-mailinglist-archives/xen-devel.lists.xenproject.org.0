Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC77704A6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577189.904144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwir-00083V-Rg; Fri, 04 Aug 2023 15:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577189.904144; Fri, 04 Aug 2023 15:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwir-00080v-P0; Fri, 04 Aug 2023 15:28:13 +0000
Received: by outflank-mailman (input) for mailman id 577189;
 Fri, 04 Aug 2023 15:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwiq-00080Z-5M
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 841a11cc-32db-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 17:28:09 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D61F84EE0737;
 Fri,  4 Aug 2023 17:28:07 +0200 (CEST)
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
X-Inumbo-ID: 841a11cc-32db-11ee-8613-37d641c3527e
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 0/6] xen: address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 17:27:43 +0200
Message-Id: <cover.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses shadowing issues to resolve violations of Rule 5.3, whose
headline states:
"An identifier declared in an inner scope shall not hide an identifier
declared in an outer scope". To do this, suitable renames are made.
In some cases global objects are modified, while other modifications concern
local variables, possibly lessening the probability of future clashes from
occurring, by suffixing variables in some macros.

No functional change.

Nicola Vetrini (6):
  x86: rename variable 'e820' to address MISRA C:2012 Rule 5.3
  libelf: address MISRA C:2012 Rule 5.3
  xen/delay: address MISRA C:2012 Rule 5.3.
  x86/include: address MISRA C:2012 Rule 5.3.
  x86/xstate: address MISRA C:2012 Rule 5.3
  x86: refactor macros in 'xen-mca.h' to address MISRA C:2012 Rule 5.3

 xen/arch/x86/dom0_build.c                | 10 ++--
 xen/arch/x86/e820.c                      | 66 ++++++++++++------------
 xen/arch/x86/guest/xen/xen.c             |  4 +-
 xen/arch/x86/hvm/dom0_build.c            |  6 +--
 xen/arch/x86/include/asm/e820.h          |  2 +-
 xen/arch/x86/include/asm/mpspec.h        |  2 +-
 xen/arch/x86/mm.c                        | 49 +++++++++---------
 xen/arch/x86/numa.c                      |  8 +--
 xen/arch/x86/setup.c                     | 22 ++++----
 xen/arch/x86/srat.c                      |  6 +--
 xen/arch/x86/x86_64/mmconf-fam10h.c      |  2 +-
 xen/arch/x86/xstate.c                    | 30 +++++------
 xen/common/libelf/libelf-tools.c         | 24 ++++-----
 xen/drivers/passthrough/amd/iommu_acpi.c |  2 +-
 xen/include/public/arch-x86/xen-mca.h    | 38 +++++++-------
 xen/include/xen/delay.h                  |  2 +-
 16 files changed, 137 insertions(+), 136 deletions(-)

--
2.34.1

