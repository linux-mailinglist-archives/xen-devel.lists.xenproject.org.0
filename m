Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1414B5154
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271911.466645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDC-0001Lw-0q; Mon, 14 Feb 2022 13:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271911.466645; Mon, 14 Feb 2022 13:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDB-0001JL-To; Mon, 14 Feb 2022 13:16:13 +0000
Received: by outflank-mailman (input) for mailman id 271911;
 Mon, 14 Feb 2022 13:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4l-0008IH-IZ
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10903f77-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:30 +0100 (CET)
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
X-Inumbo-ID: 10903f77-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qS6HhUKN86A8O5F/mJjxVhOAaZfp/FzJTL8mzLuXTEg=;
  b=Kjf/OXFWAfIAFA9XcKlg8eZUEOSiyWZYH/GtFkREA9K+HCbi5ilmhxx7
   7LvPauUBCcuE+cUHpi2x+UQBIknYIzksqVnc7HIJePU7L4SicftK2JHWL
   xxj+RvTZm7bmrDZgyje9aEonWVnVVV48YF+4+6HLdp1Xgo1bAoKYImgLN
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uSSGRCrGGWROjzd7XrtaTrhsfnXs5nikIijwlK+Rl6ZwFVbBzHkKT0hPoClM69p6DuRg4bGxbf
 iNePTXbFksnnZluH0HTDnKUeNKIJWBfbwxGojI11xQq4+Tl5jWQBWPyYsMQLQut2OIBER6hQXt
 ljKpl/643UWhWqu5wLwdbUsGJnB3ls2wbQ/5WSDaJZrCR7J3NbhNA5COIJljRjf/0f6bLfbo7D
 cM1bmQRRIKC/cAdfdWkjcsyYp8p4DOhR1r6MLSNn4NvB/VWvJtOs3D0sYSoZvt46EJ6GQ6ATKU
 At812VL6d/xvLUI/onkGRt0Q
X-SBRS: 5.1
X-MesageID: 64554515
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:X538yay202sG4MOGOyR6t+cvwSrEfRIJ4+MujC+fZmUNrF6WrkVVm
 zAXDWqAPP+JZGXze9txbN6xpEkFu8eGzNAyQFFt/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9NBk
 tdMtbGLdRcwY7f02880eERySD4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwTQKqDP
 pdxhTxHVQmHag8MZGguUqkwrb+DhUT/LWNgpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelifqJ0Ey/W/9kF
 1wNpzAW7oMb3xGBFcaoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
 nfMxoq0XmI37NV5XFrAru/8kN+kBcQCwYbujwcgRBBN3dTsqZpbYvnnHoc6S/7dYjEY9FjNL
 9G2QMoW2u97YS0jjfzTEbX7b9WE/Mahc+LNzl+LNl9JFysgDGJfW6Sm6ELA8dFLJ5uDQ1+Ks
 RAswpbCsL9eXczQzHXWGo3h+Y1FAN7fblXhbaNHRcF9p1xBBVb/FWyv3N2ODBgwaZtVEdMYS
 ETSpRlQ9Pdu0IiCNsdKj3aKI51yl8DITI29PtiNN4YmSsUhJWevoXA1DWbNjj+FraTZufxmU
 XttWZ33Vihy5GUO5GfeetrxJpd1mnFglTuLH8iTItbO+eP2WUN5gIwtaDOmBt3VJovd+Fi9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:FzHS1aFzFpbBqtNipLqE6seALOsnbusQ8zAXP0AYc3Jom62j5r
 mTdZsgtSMc5Ax8ZJhko6HkBEDiewK7yXcW2/hzAV7KZmCP0wHEEGgh1/qH/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554515"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 15/70] xen: CFI hardening for call_rcu()
Date: Mon, 14 Feb 2022 12:50:32 +0000
Message-ID: <20220214125127.17985-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 5df0d167537b..32ec156e6f6a 100644
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
@@ -1108,7 +1108,7 @@ void vcpu_end_shutdown_deferral(struct vcpu *v)
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


