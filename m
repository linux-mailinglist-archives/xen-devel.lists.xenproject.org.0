Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD71791AB2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 17:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595327.928860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBcn-0000HB-Vm; Mon, 04 Sep 2023 15:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595327.928860; Mon, 04 Sep 2023 15:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBcn-0000FS-T5; Mon, 04 Sep 2023 15:36:25 +0000
Received: by outflank-mailman (input) for mailman id 595327;
 Mon, 04 Sep 2023 15:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MaJ0=EU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdBcm-0000FK-Te
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 15:36:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd510055-4b38-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 17:36:23 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 469794EE0737;
 Mon,  4 Sep 2023 17:36:22 +0200 (CEST)
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
X-Inumbo-ID: cd510055-4b38-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] xen/arm: ioreq: add header for 'handle_ioserv' and 'try_fwd_ioserv'
Date: Mon,  4 Sep 2023 17:36:06 +0200
Message-Id: <7a58fd2e4361de53fc81475dd4aca52a57b770f1.1693581823.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions referenced by this patch should have had a compatible
declaration visible prior to their definition. This is achieved by
including the arch-specific header in 'xen/arch/arm/ioreq.c'

Fixes: cb9953d2f2bc ("arm/ioreq: Introduce arch specific bits for IOREQ/DM features")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Avoid including <asm/ioreq.h> in <xen/ioreq.h> to allow new architectures
  (e.g. ppc and riscv) not to provide one more stub header,
  as pointed out by Jan Beulich.
---
 xen/arch/arm/ioreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 55854571898d..3bed0a14c050 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -9,6 +9,7 @@
 #include <xen/ioreq.h>

 #include <asm/traps.h>
+#include <asm/ioreq.h>

 #include <public/hvm/ioreq.h>

--
2.34.1

