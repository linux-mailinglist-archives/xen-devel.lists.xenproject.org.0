Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCD5510DF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352421.579201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRK-000280-7q; Mon, 20 Jun 2022 07:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352421.579201; Mon, 20 Jun 2022 07:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRK-00025k-2l; Mon, 20 Jun 2022 07:03:14 +0000
Received: by outflank-mailman (input) for mailman id 352421;
 Mon, 20 Jun 2022 07:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRJ-0001Yx-77
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0c3a8213-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE8151424;
 Mon, 20 Jun 2022 00:03:11 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AC823F5A1;
 Mon, 20 Jun 2022 00:03:09 -0700 (PDT)
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
X-Inumbo-ID: 0c3a8213-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/9] xen/domain: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:38 +0200
Message-Id: <20220620070245.77979-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/common/domain.c      | 2 +-
 xen/include/xen/domain.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7570eae91a..57a8515f21 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1446,7 +1446,7 @@ int vcpu_reset(struct vcpu *v)
  * of memory, and it sets a pending event to make sure that a pending
  * event doesn't get missed.
  */
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
+int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
 {
     struct domain *d = v->domain;
     void *mapping;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1c3c88a14d..628b14b086 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -65,7 +65,7 @@ void cf_check free_pirq_struct(void *);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
+int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
 void unmap_vcpu_info(struct vcpu *v);
 
 int arch_domain_create(struct domain *d,
-- 
2.25.1


