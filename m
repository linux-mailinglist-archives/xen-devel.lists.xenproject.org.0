Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE35CA7327
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178635.1502398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC6-0006K9-CJ; Fri, 05 Dec 2025 10:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178635.1502398; Fri, 05 Dec 2025 10:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC6-0006IG-4L; Fri, 05 Dec 2025 10:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1178635;
 Fri, 05 Dec 2025 10:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4nT=6L=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vRTC4-0005Ju-A6
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:37:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6dc0335a-d1c6-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 11:37:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F95F1575;
 Fri,  5 Dec 2025 02:37:34 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.45.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E79ED3F86F;
 Fri,  5 Dec 2025 02:37:40 -0800 (PST)
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
X-Inumbo-ID: 6dc0335a-d1c6-11f0-980a-7dc792cee155
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
Date: Fri,  5 Dec 2025 11:36:36 +0100
Message-ID: <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764930353.git.bertrand.marquis@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_64bit_domain(d) is not set during domain_init as the domain field is
only set when loading the domain image which is done after executing
domain_init.

Fix the implementation to set is_64bit when version gets negotiated.
is_64bit is only used during partition_info_get once a domain is added
in the list of domains having ffa support. It must only be accessed when
the rwlock is taken (which is the case).

is_64bit must not be used without the rwlock taken and other places in
the code needing to test 64bit support of the current domain will have
to use calls to is_64bit_domain instead of the field from now on.

Fixes: 09a201605f99 ("xen/arm: ffa: Introduce VM to VM support")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- patch introduced
---
 xen/arch/arm/tee/ffa.c         | 9 ++++++++-
 xen/arch/arm/tee/ffa_private.h | 5 +++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aadd6c21e7f2..0f6f837378cc 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -180,6 +180,14 @@ static bool ffa_negotiate_version(struct cpu_user_regs *regs)
             goto out_handled;
         }
 
+        /*
+         * We cannot set is_64bit during domain init because the field is not
+         * yet initialized.
+         * This field is only used during partinfo_get with the rwlock taken
+         * so there is no ordering issue with guest_vers.
+         */
+        ctx->is_64bit = is_64bit_domain(d);
+
         /*
          * A successful FFA_VERSION call does not freeze negotiation. Guests
          * are allowed to issue multiple FFA_VERSION attempts (e.g. probing
@@ -433,7 +441,6 @@ static int ffa_domain_init(struct domain *d)
 
     ctx->ffa_id = ffa_get_vm_id(d);
     ctx->num_vcpus = d->max_vcpus;
-    ctx->is_64bit = is_64bit_domain(d);
 
     /*
      * ffa_domain_teardown() will be called if ffa_domain_init() returns an
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 4e4ac7fd7bc4..2daa4589a930 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -344,6 +344,11 @@ struct ffa_ctx {
     /* FF-A Endpoint ID */
     uint16_t ffa_id;
     uint16_t num_vcpus;
+    /*
+     * Must only be accessed with the ffa_ctx_list_rwlock taken as it set
+     * when guest_vers is set and other accesses could see a partially set
+     * value.
+     */
     bool is_64bit;
 
     /*
-- 
2.51.2


