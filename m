Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF627739DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 13:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579639.907718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZw-0006DL-0H; Tue, 08 Aug 2023 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579639.907718; Tue, 08 Aug 2023 11:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZv-0006Ad-Sd; Tue, 08 Aug 2023 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 579639;
 Tue, 08 Aug 2023 11:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTKZt-00068O-UK
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 11:08:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edf280b3-35db-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 13:08:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 333A84EE0737;
 Tue,  8 Aug 2023 13:08:39 +0200 (CEST)
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
X-Inumbo-ID: edf280b3-35db-11ee-b280-6b7b168915f2
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
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 0/5] x86: address MISRA C:2012 Rule 5.3
Date: Tue,  8 Aug 2023 13:08:02 +0200
Message-Id: <cover.1691492441.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses shadowing issues to resolve violations of Rule 5.3, whose
headline states:
"An identifier declared in an inner scope shall not hide an identifier
declared in an outer scope". To do this, suitable renames are made.

The thread of the first submission is here [1]
---
Changes in v2:
- Addressed numerous review comments
- Dropped patch 2/6 [2], as that has already been committed

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg00538.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg00539.html
Nicola Vetrini (5):
  x86: address MISRA C:2012 Rule 5.3
  xen/delay: address MISRA C:2012 Rule 5.3.
  x86/include: address MISRA C:2012 Rule 5.3.
  x86/xstate: address MISRA C:2012 Rule 5.3
  x86: refactor macros in 'xen-mca.h'

 xen/arch/x86/e820.c                         | 36 +++++++++----------
 xen/arch/x86/guest/hyperv/hyperv.c          |  4 +--
 xen/arch/x86/guest/hypervisor.c             |  2 +-
 xen/arch/x86/guest/xen/xen.c                |  4 +--
 xen/arch/x86/include/asm/e820.h             |  3 +-
 xen/arch/x86/include/asm/guest/hypervisor.h |  2 +-
 xen/arch/x86/include/asm/mpspec.h           |  1 -
 xen/arch/x86/include/asm/pv/shim.h          |  2 +-
 xen/arch/x86/pv/shim.c                      | 10 +++---
 xen/arch/x86/setup.c                        |  8 ++---
 xen/arch/x86/x86_64/mmconf-fam10h.c         |  2 +-
 xen/arch/x86/xstate.c                       | 30 ++++++++--------
 xen/drivers/passthrough/amd/iommu_acpi.c    |  2 +-
 xen/include/public/arch-x86/xen-mca.h       | 38 ++++++++++-----------
 xen/include/xen/delay.h                     |  9 +++--
 15 files changed, 78 insertions(+), 75 deletions(-)

-- 
2.34.1


