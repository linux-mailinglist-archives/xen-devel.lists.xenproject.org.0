Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6945EEC4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232884.404111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxW-0002vh-FP; Fri, 26 Nov 2021 13:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232884.404111; Fri, 26 Nov 2021 13:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxW-0002n5-6z; Fri, 26 Nov 2021 13:08:10 +0000
Received: by outflank-mailman (input) for mailman id 232884;
 Fri, 26 Nov 2021 13:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavn-0003W9-UN
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6af88e9-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:22 +0100 (CET)
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
X-Inumbo-ID: a6af88e9-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qfUingeWCHJT51H02rxG/ZbTxmF7Rj5Q8LszhraqNPA=;
  b=J006ZpAr2/t9KwkDAhcOQS2Z2Jd38lUdDZvJuj0zOFita6rXCRICXrvc
   ss5+Rgxvsf0N9P3oHHrCcYqUcvmNHd8UooYEg1vWWgFZSDXuG5+aLA2dY
   j++QJjpsQA8WCIneEWf/pBiGeAr9O42412DkB+GHtgMUiyFZB8G2rGU0w
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KXYoeP8jX1bI+Ae0aKL40CGzTIUxv4bCczKT3qQ/DpGuU7tl9lhapSAxM1OXKpHkRfliSfw/Uv
 OTxMIU5VyfbDGIVNQFb1NoZT+xcsd8JAB7ebJt6U+fluELXvKrPMvSI+6Vb4Z4gzF+tqP8+uNw
 bhfSrOkIHtS5IfbHy8fUZlZxu1P0afzxFze5c9k6jdplDfwO89IX5tu7vxKBamDvmpFPtIlcIt
 KuRRqowFUziHC9m6RqzeRX1fn71tTUjod9ZCRHUtG8WdFb+uS9yfWhAfDo30UQpI9ZKKIwUdUz
 RI6zajh7mDHwIC+yOp7Fd1oe
X-SBRS: 5.1
X-MesageID: 58193875
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lfsn1qsSEZH49a5cJxwcrtVeS+fnVKNZMUV32f8akzHdYApBsoF/q
 tZmKW6Fbv3fZWqhfNB/b9+z8x4BvcPXy4drGVZkqSpmQSkR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnsHgRA0YAYH1hPVHbRpoEgZcYu5f0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5NIMmowMXwsZTVdEVYNIowGut6VuWjhdT5FhWqUl4wetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q2q+eZpwKNFREJPDU8Zh8FailaoMDK9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPdb9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YzQPHNFBz3ohZPmLy8Bhklfy+F1e5eJFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMMuJFHao3AyOxLLt4wIrKTKufpkU
 Xt8WZzxZUv29Iw9lGbmLwvj+eNDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 i3nBxIDlgOg3SavxMfjQikLVY4DlK1X9RoTVRHA937xs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:iSJhWqGgOw7FtXhYpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193875"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/65] xen: Annotate fnptr targets from call_rcu()
Date: Fri, 26 Nov 2021 12:33:52 +0000
Message-ID: <20211126123446.32324-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c       | 2 +-
 xen/arch/x86/hvm/vmsi.c       | 2 +-
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 xen/arch/x86/percpu.c         | 2 +-
 xen/common/domain.c           | 4 ++--
 xen/common/radix-tree.c       | 2 +-
 xen/common/rcupdate.c         | 2 +-
 xen/common/sched/core.c       | 2 +-
 xen/xsm/flask/avc.c           | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index b3ef1bf54133..42f3d8319296 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -586,7 +586,7 @@ int hvm_get_mem_pinned_cacheattr(struct domain *d, gfn_t gfn,
     return rc;
 }
 
-static void free_pinned_cacheattr_entry(struct rcu_head *rcu)
+static void cf_check free_pinned_cacheattr_entry(struct rcu_head *rcu)
 {
     xfree(container_of(rcu, struct hvm_mem_pinned_cacheattr_range, rcu));
 }
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b439..2889575a2035 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -441,7 +441,7 @@ static void add_msixtbl_entry(struct domain *d,
     list_add_rcu(&entry->list, &d->arch.hvm.msixtbl_list);
 }
 
-static void free_msixtbl_entry(struct rcu_head *rcu)
+static void cf_check free_msixtbl_entry(struct rcu_head *rcu)
 {
     struct msixtbl_entry *entry;
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 74d2869c0e6f..15e6a7ed814b 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -75,7 +75,7 @@ static DEFINE_SPINLOCK(shr_audit_lock);
 static DEFINE_RCU_READ_LOCK(shr_audit_read_lock);
 
 /* RCU delayed free of audit list entry */
-static void _free_pg_shared_info(struct rcu_head *head)
+static void cf_check _free_pg_shared_info(struct rcu_head *head)
 {
     xfree(container_of(head, struct page_sharing_info, rcu_head));
 }
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index eb3ba7bc8874..46460689b73d 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -45,7 +45,7 @@ struct free_info {
 };
 static DEFINE_PER_CPU(struct free_info, free_info);
 
-static void _free_percpu_area(struct rcu_head *head)
+static void cf_check _free_percpu_area(struct rcu_head *head)
 {
     struct free_info *info = container_of(head, struct free_info, rcu);
     unsigned int cpu = info->cpu;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2698dbda1398..a8b6ee59587c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -365,7 +365,7 @@ static int __init cf_check parse_extra_guest_irqs(const char *s)
 }
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
-static void _free_pirq_struct(struct rcu_head *head)
+static void cf_check _free_pirq_struct(struct rcu_head *head)
 {
     xfree(container_of(head, struct pirq, rcu_head));
 }
@@ -1116,7 +1116,7 @@ void vcpu_end_shutdown_deferral(struct vcpu *v)
 }
 
 /* Complete domain destroy after RCU readers are not holding old references. */
-static void complete_domain_destroy(struct rcu_head *head)
+static void cf_check complete_domain_destroy(struct rcu_head *head)
 {
     struct domain *d = container_of(head, struct domain, rcu);
     struct vcpu *v;
diff --git a/xen/common/radix-tree.c b/xen/common/radix-tree.c
index 628a7e06988f..33b47748ae49 100644
--- a/xen/common/radix-tree.c
+++ b/xen/common/radix-tree.c
@@ -58,7 +58,7 @@ static struct radix_tree_node *rcu_node_alloc(void *arg)
 	return rcu_node ? &rcu_node->node : NULL;
 }
 
-static void _rcu_node_free(struct rcu_head *head)
+static void cf_check _rcu_node_free(struct rcu_head *head)
 {
 	struct rcu_node *rcu_node =
 		container_of(head, struct rcu_node, rcu_head);
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index f9dd2584a8b7..423d6b1d6d02 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -167,7 +167,7 @@ static int rsinterval = 1000;
 static atomic_t cpu_count = ATOMIC_INIT(0);
 static atomic_t pending_count = ATOMIC_INIT(0);
 
-static void rcu_barrier_callback(struct rcu_head *head)
+static void cf_check rcu_barrier_callback(struct rcu_head *head)
 {
     /*
      * We need a barrier making all previous writes visible to other cpus
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index cf1ba01b4d87..285de9ee2a19 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2798,7 +2798,7 @@ static int cpu_schedule_up(unsigned int cpu)
     return 0;
 }
 
-static void sched_res_free(struct rcu_head *head)
+static void cf_check sched_res_free(struct rcu_head *head)
 {
     struct sched_resource *sr = container_of(head, struct sched_resource, rcu);
 
diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 87ea38b7a0d0..e20c16504213 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -276,7 +276,7 @@ int avc_get_hash_stats(struct xen_flask_hash_stats *arg)
     return 0;
 }
 
-static void avc_node_free(struct rcu_head *rhead)
+static void cf_check avc_node_free(struct rcu_head *rhead)
 {
     struct avc_node *node = container_of(rhead, struct avc_node, rhead);
     xfree(node);
-- 
2.11.0


