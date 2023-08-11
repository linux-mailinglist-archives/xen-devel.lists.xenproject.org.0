Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E6778804
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582284.911988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRC-0004hJ-Nr; Fri, 11 Aug 2023 07:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582284.911988; Fri, 11 Aug 2023 07:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRC-0004cy-Gr; Fri, 11 Aug 2023 07:19:58 +0000
Received: by outflank-mailman (input) for mailman id 582284;
 Fri, 11 Aug 2023 07:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMRB-00039t-0F
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7842eadc-3817-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 09:19:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 47C104EE0743;
 Fri, 11 Aug 2023 09:19:54 +0200 (CEST)
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
X-Inumbo-ID: 7842eadc-3817-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 4/6] cpufreq: add missing include of header 'pmstat.h'
Date: Fri, 11 Aug 2023 09:19:29 +0200
Message-Id: <424e0523b9ec68eda5cf5b41a7bb6c980df2a52d.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The missing header included by this patch provides a declaration for
'set_px_pminfo' that is visible prior to the definition in this file.
This also resolves a violation of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 452119c09420 ("x86 and ia64: move cpufreq notify code to commone place")
---
 xen/drivers/cpufreq/cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 2321c7dd07b1..4482bbe53a1e 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -39,6 +39,7 @@
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
+#include <xen/pmstat.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
-- 
2.34.1


