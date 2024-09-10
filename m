Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C997312B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795237.1204501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoF-0007qR-Sy; Tue, 10 Sep 2024 10:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795237.1204501; Tue, 10 Sep 2024 10:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoF-0007ge-Gc; Tue, 10 Sep 2024 10:09:19 +0000
Received: by outflank-mailman (input) for mailman id 795237;
 Tue, 10 Sep 2024 10:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoD-0006in-8N
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc116e4f-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:15 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 170314EE07BB;
 Tue, 10 Sep 2024 12:09:15 +0200 (CEST)
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
X-Inumbo-ID: bc116e4f-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962955; bh=4YJCnP58zIp/0pTRunzm9AkmIlx7TkkO1ZpWoUscNoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s9ClveXE7mU4vBe7fJEjEl3cdzNCrlpaLLdciLxacR/z8dsGnaeceG++Rm8Ba4BK0
	 kUzCA76P4YcW2slLQjpxJR9JHbaAeQ3FFUqN0w7VRtDJSuJyN+meUMb/a0XOpHfTVZ
	 iNxp8HhKabnYW/9gd5cyODkIjrXaZ1nVl9gIQmX9rN8SQQCDjmr+SkTUL++x201R25
	 k3CSRHyVjoO/fI2E+RubxWqIx7eF/lPZV74v1QcpqopyB93xAP0Z/RGrVEJfBPbYeK
	 AwdjfLJo/pQgQxrJ86R8bx1dbjIwWzmEZS9D6+f2qGsioQCO6PSHGSl4ZviiTuajcw
	 ZcFI2NKBvrVPw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 06/12] x86/mm: address violations of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:58 +0200
Message-Id: <0773f4b5678ee340af201b454e37178e750cbd8d.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/mm/guest_walk.c     | 1 +
 xen/arch/x86/mm/hap/hap.c        | 2 +-
 xen/arch/x86/mm/hap/nested_hap.c | 1 +
 xen/arch/x86/mm/paging.c         | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index fe7393334f..bc032d697c 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -497,6 +497,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
             paging_mark_dirty(d, gw->l4mfn);
             hvmemul_write_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e));
         }
+        break;
 #endif
     }
 
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index d2011fde24..ec5043a8aa 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -652,7 +652,7 @@ int hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return rc;
     case XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION:
         sc->mb = hap_get_allocation(d);
-        /* Fall through... */
+        fallthrough;
     case XEN_DOMCTL_SHADOW_OP_OFF:
         return 0;
     default:
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 080b60adf0..cc7bc6e5ea 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -217,6 +217,7 @@ int nestedhvm_hap_nested_page_fault(
         p2ma_10 = p2m_access_n;
         /* For safety, remove all permissions. */
         gdprintk(XENLOG_ERR, "Unhandled p2m access type:%d\n", p2ma_10);
+        break;
     }
     /* Use minimal permission for nested p2m. */
     p2ma_10 &= (p2m_access_t)p2ma_21;
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index dd47bde5ce..c77f4c1dac 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -726,7 +726,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
     case XEN_DOMCTL_SHADOW_OP_ENABLE:
         if ( !(sc->mode & XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY) )
             break;
-        /* Else fall through... */
+        fallthrough;
     case XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY:
         return paging_log_dirty_enable(d);
 
-- 
2.34.1


