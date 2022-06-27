Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D970555B9CA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356602.584868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ob9-0005ue-Dt; Mon, 27 Jun 2022 13:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356602.584868; Mon, 27 Jun 2022 13:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ob9-0005qn-9Q; Mon, 27 Jun 2022 13:16:15 +0000
Received: by outflank-mailman (input) for mailman id 356602;
 Mon, 27 Jun 2022 13:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5ob7-0005lc-Ad
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 50b8281d-f61b-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:16:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9545175A;
 Mon, 27 Jun 2022 06:16:11 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D23983F5A1;
 Mon, 27 Jun 2022 06:16:08 -0700 (PDT)
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
X-Inumbo-ID: 50b8281d-f61b-11ec-bd2d-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/7] xen/domain: Use unsigned int instead of plain unsigned
Date: Mon, 27 Jun 2022 15:15:38 +0200
Message-Id: <20220627131543.410971-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627131543.410971-1-michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just for the style and consistency reasons as the former is
being used more often than the latter.

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


