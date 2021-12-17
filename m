Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334FC4794D0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248838.429235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIyE-0008PE-M2; Fri, 17 Dec 2021 19:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248838.429235; Fri, 17 Dec 2021 19:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIyE-0008NI-II; Fri, 17 Dec 2021 19:32:46 +0000
Received: by outflank-mailman (input) for mailman id 248838;
 Fri, 17 Dec 2021 19:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIyD-0007M8-SX
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:32:45 +0000
Received: from sender3-of-o52.zoho.com (sender3-of-o52.zoho.com
 [136.143.184.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1afcfdc4-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:32:44 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769526620437.16843681891885;
 Fri, 17 Dec 2021 11:32:06 -0800 (PST)
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
X-Inumbo-ID: 1afcfdc4-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769529; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bo7rv4wId/5VhflcAuS0iCH2o0c3/9MGoimLxmZKC41fY6+GNf31ArfsQuIkOu3SuV4Zo+eZXoFI8a9yKMAoehdKq239GDtVKz2kCZPgBhjZJ/8G8+pmm0X+h2lbUuZsy8yqH7clwVDYB969ZVzsQCanur7+vJaX81Wo7smmg88=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769529; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5e0WDt0b0QAR/Q3VrnOoU5NuGPw9wyZBF+wd2t/YYDo=; 
	b=UIYLiIm3BrxcIojqPMcvhZ/DtO7qpVs84maSSpKBsHu4ON9OMwbUVX6mR1vO4yITL1ej/LJ/TKLzfvpMliBkrH8e/n5fW9SmfkLo+s3hAp8a4RH6t8v7LfqobWoUYBdrKPwV95XnhbfyYVCCgl9AaSGw8Kh+2vE1ZnsC5R1EcN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769529;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5e0WDt0b0QAR/Q3VrnOoU5NuGPw9wyZBF+wd2t/YYDo=;
	b=kX0pUUiV6zJydj03YUKM73B8KyuPotHqDosj6sBAE8dh1DUc+Y1F9kjojmKlvLsF
	icdmqNyYo+EYHHlAueXw+Ivhckxh1Er1WxaO5zSqeVN9r5MSygS0iHcHPRtR6qZvKXn
	+wZpEqT5zQuj2hwjNJZ1CtmSrrzdRr6BV28BwqLw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC 02/10] is_system_domain: replace open-coded instances
Date: Fri, 17 Dec 2021 18:34:28 -0500
Message-Id: <20211217233437.13791-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Christopher Clark <christopher.w.clark@gmail.com>

There were several instances of open-coded domid range checking. This commit
replaces those with the is_system_domain inline function.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/cpu/vpmu.c | 2 +-
 xen/common/domctl.c     | 2 +-
 xen/common/sched/core.c | 4 ++--
 xen/include/xen/sched.h | 5 +++++
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 8ec4547bed..179f3dcc5a 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -188,7 +188,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
      * in XENPMU_MODE_ALL, for everyone.
      */
     if ( (vpmu_mode & XENPMU_MODE_ALL) ||
-         (sampled->domain->domain_id >= DOMID_FIRST_RESERVED) )
+         (is_system_domain(sampled->domain)) )
     {
         sampling = choose_hwdom_vcpu();
         if ( !sampling )
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 879a2adcbe..67021cc54b 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -536,7 +536,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( !d )
         {
             ret = -EINVAL;
-            if ( op->domain >= DOMID_FIRST_RESERVED )
+            if ( is_system_domain_id(op->domain) )
                 break;
 
             rcu_read_lock(&domlist_read_lock);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..6ea8bcf62f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -821,7 +821,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
     int ret;
 
     ASSERT(d->cpupool == NULL);
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(!is_system_domain(d));
 
     if ( (ret = cpupool_add_domain(d, poolid)) )
         return ret;
@@ -845,7 +845,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
 
 void sched_destroy_domain(struct domain *d)
 {
-    ASSERT(d->domain_id < DOMID_FIRST_RESERVED);
+    ASSERT(!is_system_domain(d));
 
     if ( d->cpupool )
     {
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 28146ee404..1df09bcb77 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -613,6 +613,11 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
 #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
 #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
 
+static inline bool is_system_domain_id(domid_t id)
+{
+    return (id >= DOMID_FIRST_RESERVED);
+}
+
 static inline bool is_system_domain(const struct domain *d)
 {
     return d->domain_id >= DOMID_FIRST_RESERVED;
-- 
2.20.1


