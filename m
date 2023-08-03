Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59376E5A1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576203.902110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVXy-0000II-NF; Thu, 03 Aug 2023 10:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576203.902110; Thu, 03 Aug 2023 10:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVXy-0000F9-KG; Thu, 03 Aug 2023 10:27:10 +0000
Received: by outflank-mailman (input) for mailman id 576203;
 Thu, 03 Aug 2023 10:27:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVXx-0008Qm-E4
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cef0546-31e8-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:27:09 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 464F84EE0740;
 Thu,  3 Aug 2023 12:27:08 +0200 (CEST)
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
X-Inumbo-ID: 4cef0546-31e8-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 08/13] xen/hvm: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:23 +0200
Message-Id: <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hvm/emulate.c | 2 +-
 xen/arch/x86/hvm/io.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 75ee98a73b..053c6b495d 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -74,7 +74,7 @@ static int cf_check null_read(
     const struct hvm_io_handler *io_handler, uint64_t addr, uint32_t size,
     uint64_t *data)
 {
-    *data = ~0ul;
+    *data = ~0UL;
     return X86EMUL_OKAY;
 }
 
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 53de1a967d..d75af83ad0 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -400,7 +400,7 @@ static int cf_check vpci_mmcfg_read(
     unsigned int reg;
     pci_sbdf_t sbdf;
 
-    *data = ~0ul;
+    *data = ~0UL;
 
     read_lock(&d->arch.hvm.mmcfg_lock);
     mmcfg = vpci_mmcfg_find(d, addr);
-- 
2.34.1


