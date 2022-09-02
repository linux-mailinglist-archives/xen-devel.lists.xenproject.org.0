Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A45AB185
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397708.638370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6q3-0000yI-1p; Fri, 02 Sep 2022 13:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397708.638370; Fri, 02 Sep 2022 13:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6q2-0000vK-V4; Fri, 02 Sep 2022 13:36:02 +0000
Received: by outflank-mailman (input) for mailman id 397708;
 Fri, 02 Sep 2022 13:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oU6q1-0008PC-Du
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:36:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2e5e0a77-2ac4-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:36:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5C0ED1;
 Fri,  2 Sep 2022 06:36:05 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 796933F766;
 Fri,  2 Sep 2022 06:35:58 -0700 (PDT)
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
X-Inumbo-ID: 2e5e0a77-2ac4-11ed-934f-f50d60e1c1bd
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 02/10] xen/arm: smmuv3: Fix endianness annotations
Date: Fri,  2 Sep 2022 14:34:54 +0100
Message-Id: <c78674d8a1d413133edfc208b877fef19f2bdf2c.1662123432.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662123432.git.rahul.singh@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commit 376cdf66f624. This is the clean backport without
any changes.

When building with C=1, sparse reports some issues regarding
endianness annotations:

arm-smmu-v3.c:221:26: warning: cast to restricted __le64
arm-smmu-v3.c:221:24: warning: incorrect type in assignment (different base types)
arm-smmu-v3.c:221:24:    expected restricted __le64 [usertype]
arm-smmu-v3.c:221:24:    got unsigned long long [usertype]
arm-smmu-v3.c:229:20: warning: incorrect type in argument 1 (different base types)
arm-smmu-v3.c:229:20:    expected restricted __le64 [usertype] *[assigned] dst
arm-smmu-v3.c:229:20:    got unsigned long long [usertype] *ent
arm-smmu-v3.c:229:25: warning: incorrect type in argument 2 (different base types)
arm-smmu-v3.c:229:25:    expected unsigned long long [usertype] *[assigned] src
arm-smmu-v3.c:229:25:    got restricted __le64 [usertype] *
arm-smmu-v3.c:396:20: warning: incorrect type in argument 1 (different base types)
arm-smmu-v3.c:396:20:    expected restricted __le64 [usertype] *[assigned] dst
arm-smmu-v3.c:396:20:    got unsigned long long *
arm-smmu-v3.c:396:25: warning: incorrect type in argument 2 (different base types)
arm-smmu-v3.c:396:25:    expected unsigned long long [usertype] *[assigned] src
arm-smmu-v3.c:396:25:    got restricted __le64 [usertype] *
arm-smmu-v3.c:1349:32: warning: invalid assignment: |=
arm-smmu-v3.c:1349:32:    left side has type restricted __le64
arm-smmu-v3.c:1349:32:    right side has type unsigned long
arm-smmu-v3.c:1396:53: warning: incorrect type in argument 3 (different base types)
arm-smmu-v3.c:1396:53:    expected restricted __le64 [usertype] *dst
arm-smmu-v3.c:1396:53:    got unsigned long long [usertype] *strtab
arm-smmu-v3.c:1424:39: warning: incorrect type in argument 1 (different base types)
arm-smmu-v3.c:1424:39:    expected unsigned long long [usertype] *[assigned] strtab
arm-smmu-v3.c:1424:39:    got restricted __le64 [usertype] *l2ptr

While harmless, they are incorrect and could hide actual errors during
development. Fix them.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20200918141856.629722-1-jean-philippe@linaro.org
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 376cdf66f624
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - fix commit msg
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 340609264d..64d39bb4d3 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1037,7 +1037,7 @@ static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
 	return 0;
 }
 
-static void queue_read(__le64 *dst, u64 *src, size_t n_dwords)
+static void queue_read(u64 *dst, __le64 *src, size_t n_dwords)
 {
 	int i;
 
@@ -1436,7 +1436,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
 }
 
-static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
+static void arm_smmu_init_bypass_stes(__le64 *strtab, unsigned int nent)
 {
 	unsigned int i;
 
-- 
2.25.1


