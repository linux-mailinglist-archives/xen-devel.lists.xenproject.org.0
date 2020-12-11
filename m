Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC922D74DA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 12:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50467.89139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kngr8-0007za-O1; Fri, 11 Dec 2020 11:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50467.89139; Fri, 11 Dec 2020 11:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kngr8-0007zB-Ke; Fri, 11 Dec 2020 11:45:02 +0000
Received: by outflank-mailman (input) for mailman id 50467;
 Fri, 11 Dec 2020 11:45:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23LR=FP=amazon.com=prvs=6077e6b67=havanur@srs-us1.protection.inumbo.net>)
 id 1kngr6-0007z6-Uu
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 11:45:01 +0000
Received: from smtp-fw-9103.amazon.com (unknown [207.171.188.200])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aba78b82-178c-45bc-99d3-79849b36a793;
 Fri, 11 Dec 2020 11:44:59 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 11 Dec 2020 11:44:52 +0000
Received: from EX13D36EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3A097A1E9A
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 11:44:52 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D36EUA002.ant.amazon.com (10.43.165.193) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 11 Dec 2020 11:44:50 +0000
Received: from dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com
 (172.19.122.179) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 11 Dec 2020 11:44:49 +0000
Received: by dev-dsk-havanur-1a-5f065856.eu-west-1.amazon.com (Postfix,
 from userid 11119479)
 id 1024C85312; Fri, 11 Dec 2020 11:44:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: aba78b82-178c-45bc-99d3-79849b36a793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1607687099; x=1639223099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=bWTBNMn9wmpyCukdPNpbfEWEuuOq3TCX8H0gkb2gEpI=;
  b=tuAOI22QuflZNcXZX16UggofKUISr+5DqbdNbibYfmmv/yfIVOiZXGyU
   q0FYbS94ewRgeydE5WM7qWzSy0v+D9kSz1T3jUoiRsfxh6O+TzH8baGX5
   Y408m5A50Xr3qV5/Cczj0EPlDeNdQglVY1nfzjfefJSNiYbkNpo+Kqp4V
   A=;
X-IronPort-AV: E=Sophos;i="5.78,411,1599523200"; 
   d="scan'208";a="902266083"
From: Harsha Shamsundara Havanur <havanur@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: Harsha Shamsundara Havanur <havanur@amazon.com>
Subject: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the domain
Date: Fri, 11 Dec 2020 11:44:36 +0000
Message-ID: <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <cover.1607686878.git.havanur@amazon.com>
References: <cover.1607686878.git.havanur@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk

A HVM domain flushes cache on all the cpus using
`flush_all` macro which uses cpu_online_map, during
i) creation of a new domain
ii) when device-model op is performed
iii) when domain is destructed.

This triggers IPI on all the cpus, thus affecting other
domains that are pinned to different pcpus. This patch
restricts cache flush to the set of cpus affinitized to
the current domain using `domain->dirty_cpumask`.

Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
---
 xen/arch/x86/hvm/hvm.c     | 2 +-
 xen/arch/x86/hvm/mtrr.c    | 6 +++---
 xen/arch/x86/hvm/svm/svm.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 54e32e4fe8..ec247c7010 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2219,7 +2219,7 @@ void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
             domain_pause_nosync(v->domain);
 
             /* Flush physical caches. */
-            flush_all(FLUSH_CACHE);
+            flush_mask(v->domain->dirty_cpumask, FLUSH_CACHE);
             hvm_set_uc_mode(v, 1);
 
             domain_unpause(v->domain);
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index fb051d59c3..0d804c1fa0 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -631,7 +631,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
                         break;
                     /* fall through */
                 default:
-                    flush_all(FLUSH_CACHE);
+                    flush_mask(d->dirty_cpumask, FLUSH_CACHE);
                     break;
                 }
                 return 0;
@@ -683,7 +683,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
     list_add_rcu(&range->list, &d->arch.hvm.pinned_cacheattr_ranges);
     p2m_memory_type_changed(d);
     if ( type != PAT_TYPE_WRBACK )
-        flush_all(FLUSH_CACHE);
+        flush_mask(d->dirty_cpumask, FLUSH_CACHE);
 
     return 0;
 }
@@ -785,7 +785,7 @@ void memory_type_changed(struct domain *d)
          d->vcpu && d->vcpu[0] )
     {
         p2m_memory_type_changed(d);
-        flush_all(FLUSH_CACHE);
+        flush_mask(d->dirty_cpumask, FLUSH_CACHE);
     }
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index cfea5b5523..383e763d7d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2395,7 +2395,7 @@ static void svm_vmexit_mce_intercept(
 static void svm_wbinvd_intercept(void)
 {
     if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE);
+        flush_mask(current->domain->dirty_cpumask, FLUSH_CACHE);
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 86b8916a5d..a05c7036c4 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3349,7 +3349,7 @@ static void vmx_wbinvd_intercept(void)
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE);
+        flush_mask(current->domain->dirty_cpumask, FLUSH_CACHE);
     else
         wbinvd();
 }
-- 
2.16.6


