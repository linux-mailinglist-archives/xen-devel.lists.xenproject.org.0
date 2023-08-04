Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1776FB9A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 10:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576961.903691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmw-00077Q-NO; Fri, 04 Aug 2023 08:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576961.903691; Fri, 04 Aug 2023 08:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpmw-00075B-K1; Fri, 04 Aug 2023 08:03:58 +0000
Received: by outflank-mailman (input) for mailman id 576961;
 Fri, 04 Aug 2023 08:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRpmv-000750-5n
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 08:03:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c2d89f-329d-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 10:03:56 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 26A614EE0737;
 Fri,  4 Aug 2023 10:03:55 +0200 (CEST)
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
X-Inumbo-ID: 75c2d89f-329d-11ee-b26a-6b7b168915f2
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
Subject: [XEN PATCH v2 0/4] x86: address some violations of MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 10:03:32 +0200
Message-Id: <cover.1691135862.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some variables are renamed or deleted in this series to avoid shadowing, which
violates MISRA C:2012 Rule 5.3, whose headline is:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

---
Changes in v2:
- Addressed comments on patches 1 and 2. Patches 3 and 4 are unchanged.

Nicola Vetrini (4):
  x86/mce: address MISRA C:2012 Rule 5.3
  x86/mtrr: address MISRA C:2012 Rule 5.3
  x86/irq: rename variable to address MISRA C:2012 Rule 5.3
  x86/setup: address MISRA C:2012 Rule 5.3

 xen/arch/x86/cpu/mcheck/barrier.c |  8 ++++----
 xen/arch/x86/cpu/mcheck/barrier.h | 14 +++++++-------
 xen/arch/x86/hvm/hvm.c            |  2 +-
 xen/arch/x86/hvm/mtrr.c           | 32 +++++++++++++++----------------
 xen/arch/x86/include/asm/irq.h    |  2 +-
 xen/arch/x86/include/asm/setup.h  |  2 +-
 xen/arch/x86/io_apic.c            | 10 +++++-----
 xen/arch/x86/irq.c                | 12 ++++++------
 xen/arch/x86/msi.c                |  4 ++--
 xen/arch/x86/setup.c              |  3 +--
 xen/include/xen/irq.h             |  2 +-
 11 files changed, 45 insertions(+), 46 deletions(-)

--
2.34.1

