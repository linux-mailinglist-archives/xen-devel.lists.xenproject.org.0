Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38C8B795D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714935.1116332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT3-00079M-Pz; Tue, 30 Apr 2024 14:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714935.1116332; Tue, 30 Apr 2024 14:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT3-00077p-M5; Tue, 30 Apr 2024 14:28:25 +0000
Received: by outflank-mailman (input) for mailman id 714935;
 Tue, 30 Apr 2024 14:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1oT2-00077h-WC
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:28:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6939ff9-06fd-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:28:23 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 5EF364EE074E;
 Tue, 30 Apr 2024 16:28:20 +0200 (CEST)
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
X-Inumbo-ID: e6939ff9-06fd-11ef-909b-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 0/3] address violations of MISRA C Rule 20.7
Date: Tue, 30 Apr 2024 16:28:13 +0200
Message-Id: <cover.1714487169.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series aims to refactor some macros that cause violations of MISRA C Rule
20.7 ("Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses"). All the macros touched by these patches are in some
way involved in violations, and the strategy adopted to bring them into
compliance is to add parentheses around macro arguments where needed.

Patch 1/3 is derived from that of v1; patches 2 and 3 are new to this series.

Nicola Vetrini (3):
  drivers: char: address violation of MISRA C Rule 20.7
  xen/unaligned: address violation of MISRA C Rule 20.7
  xen/pci: address violations of MISRA C Rule 20.7

 tools/include/xen-tools/common-macros.h | 2 +-
 xen/drivers/char/omap-uart.c            | 5 +++--
 xen/include/xen/pci_regs.h              | 6 +++---
 xen/include/xen/unaligned.h             | 2 +-
 xen/include/xen/vpci.h                  | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1

