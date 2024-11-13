Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A789C6AC1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835130.1250971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8wa-0000JV-Nj; Wed, 13 Nov 2024 08:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835130.1250971; Wed, 13 Nov 2024 08:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8wa-0000HR-KJ; Wed, 13 Nov 2024 08:41:44 +0000
Received: by outflank-mailman (input) for mailman id 835130;
 Wed, 13 Nov 2024 08:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXmd=SI=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tB8wZ-0000HK-7G
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:41:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a25ab4f-a19b-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 09:41:40 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id AF1A24EE073E;
 Wed, 13 Nov 2024 09:41:38 +0100 (CET)
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
X-Inumbo-ID: 1a25ab4f-a19b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFhMjVhYjRmLWExOWItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDg3MzAwLjY0OTQzMywic2VuZGVyIjoiYWxlc3NhbmRyby56dWNjaGVsbGlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731487299; bh=Auwitcc81tqmJQ/dEGLefdDXa7T3qBP/amuAto1B4FE=;
	h=From:To:Cc:Subject:Date:From;
	b=yPky5YYQ/qe64DYl8gdaYfrhPxYFaGwmbcGrpscNagPUqmJ27b/vt2IEgueQz9LtN
	 V6XFITLCAVuPHsKwN/jQFoJFNe8lFXUB6ttfNJl1L7iqZ1M8tX7B3BVAT0Z8Qy7rKy
	 XdqGJMmOry/zn+zv4N0oFirQelOVlESBYrrV+WmYkNNQOpswSOQczLmiJzUARDrCxP
	 iBu1UQOVfEYE8/ed3KgF4lGhgaHJc5kiOYS4V4cW2IqQjw0s2FHrlnnGINvVYHzRfm
	 xgzvBnKIw30gke8ez284ck2F+ZOTIVYo/dFSqzOKK1yYueElyMqZ0etHjCGgGI6uiy
	 byDEFIgEimLeQ==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
Date: Wed, 13 Nov 2024 09:41:26 +0100
Message-ID: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 5.2 which states as
following: Identifiers declared in the same scope and name space shall
be distinct.

This deviation addresses violations of Rule 5.2 arising from
identifiers generated through token pasting macros CHECK_NAME_ and
DEFINE_COMPAT_HANDLE.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index c5663eed2b..ee1ac3b602 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -88,6 +88,10 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
 # Series 5.
 #
 
+-doc_begin="Identifiers generated through the following token pasting macros are excluded from compliance to this rule"
+-config=MC3R1.R5.2,reports+={safe, "any_area(any_loc(any_exp(macro(^CHECK_NAME_$))&&any_exp(macro(^DEFINE_COMPAT_HANDLE$))))"}
+-doc_end
+
 -doc_begin="The project adopted the rule with an exception listed in
 'docs/misra/rules.rst'"
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 15a993d050..aa98acc45f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -97,6 +97,13 @@ Deviations related to MISRA C:2012 Rules:
        are not instances of commented-out code.
      - Tagged as `safe` for ECLAIR.
 
+   * - R5.2
+     - Macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE through token pasting
+       generate non-compliant identifiers. Such identifiers are allowed.
+     - Tagged as `safe` for ECLAIR. So far, the following macros are deviated:
+         - CHECK_NAME_
+         - DEFINE_COMPAT_HANDLE
+
    * - R5.3
      - As specified in rules.rst, shadowing due to macros being used as macro
        arguments is allowed, as it's deemed not at risk of causing developer
-- 
2.43.0


