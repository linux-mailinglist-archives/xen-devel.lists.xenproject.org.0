Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2484B517E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272097.466921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFH-0007Pn-Fi; Mon, 14 Feb 2022 13:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272097.466921; Mon, 14 Feb 2022 13:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFH-0007MB-8Y; Mon, 14 Feb 2022 13:18:23 +0000
Received: by outflank-mailman (input) for mailman id 272097;
 Mon, 14 Feb 2022 13:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4j-0008IH-Sa
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e18c045-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:26 +0100 (CET)
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
X-Inumbo-ID: 0e18c045-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LtJo+RP7waNzs+O/em8BrBScnR7VYL3LyvaDnkUSQHU=;
  b=Rjh25R4g4/Hjy+5YLDHBsHixUq159uEw6MR5EXTMVs7ME+P9qIKRskPb
   3HGdReXkf4jbM+PS7YeBb+mb/Z2FNcNsVS1e8bywpNO2OKYdVy3ITpJql
   +SDXUcWN7J15CdXNkHSjFT9k0iUtwXnwwKJpCFDJgyEHT3kPTybiMbgEu
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JHmOLz3WTCcCK+Mlkx2/1s5a3W5ucwAGtEWS1O9nHaWkHNCnIuYmX04uzbDGFzFM+oSUl+IBV+
 txitSnxsmxLAkc++0xAhyeG7qGWdfRNkCxoUbL/KT25zgQurtKtmL1EHdm1XMa6O36iI1NwgBG
 fG+p8uKee+Fdfk5oI/zbno8Bxa6ezpGNodrfLe9Dubviye3BPZiXhq9NrxX7RsJNR420tYysIE
 /densTuIjbJnkkbUTxRaBEqP1e6hergHhP9Jt5UHFuyf/pdxpvLuJ1mte4KUGpMM+SB4BMmrQy
 EW0DmMu7AvwQ1x2Cr9hJiFLK
X-SBRS: 5.1
X-MesageID: 64554482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UjAjEaLg3RfVaszbFE+RyZIlxSXFcZb7ZxGr2PjKsXjdYENS3zUBm
 mBKX2vVO/iMZjf3KNgiPoSxoRxQusCAz4NhTQplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2yxdB32
 PRvmqW2SAULMbzTwbsyYyZXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls250SQaaED
 yYfQX1BXDjBPzRgA1dNV8MGwOeImVjYbjIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3OA+/m/mm+cdOtZK
 k429Tsx9PcdxHOkG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5TBvLBTUMnUz3blrAAx8FaBvajtDdEhqQQ3Q8lJG8qFpxZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1j+N6mHBmnTmLLX05pjz+uYejiLeuYe9tGDOzgioRtfnayOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:9JZrPanj0MRPGmbv4hoe/P0odXXpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554482"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 19/70] xsm: CFI hardening
Date: Mon, 14 Feb 2022 12:50:36 +0000
Message-ID: <20220214125127.17985-20-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h  | 211 ++++++++++++++++++++++--------------------
 xen/xsm/flask/flask_op.c |   2 +-
 xen/xsm/flask/hooks.c    | 232 ++++++++++++++++++++++++++---------------------
 xen/xsm/flask/private.h  |   4 +-
 xen/xsm/silo.c           |  24 ++---
 5 files changed, 257 insertions(+), 216 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b024119896e6..58afc1d58973 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -101,46 +101,48 @@ static always_inline int xsm_default_action(
     }
 }
 
-static XSM_INLINE void xsm_security_domaininfo(
+static XSM_INLINE void cf_check xsm_security_domaininfo(
     struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     return;
 }
 
-static XSM_INLINE int xsm_domain_create(
+static XSM_INLINE int cf_check xsm_domain_create(
     XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_getdomaininfo(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_domctl_scheduler_op(
+static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
+static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_set_target(
+static XSM_INLINE int cf_check xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int cf_check xsm_domctl(
+    XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
@@ -157,91 +159,93 @@ static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
     }
 }
 
-static XSM_INLINE int xsm_sysctl(XSM_DEFAULT_ARG int cmd)
+static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
+static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
+static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_domain(struct domain *d)
+static XSM_INLINE void cf_check xsm_free_security_domain(struct domain *d)
 {
     return;
 }
 
-static XSM_INLINE int xsm_grant_mapref(
+static XSM_INLINE int cf_check xsm_grant_mapref(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_unmapref(
+static XSM_INLINE int cf_check xsm_grant_unmapref(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_setup(
+static XSM_INLINE int cf_check xsm_grant_setup(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_transfer(
+static XSM_INLINE int cf_check xsm_grant_transfer(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_copy(
+static XSM_INLINE int cf_check xsm_grant_copy(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_query_size(
+static XSM_INLINE int cf_check xsm_grant_query_size(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_memory_exchange(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_memory_adjust_reservation(
+static XSM_INLINE int cf_check xsm_memory_adjust_reservation(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_stat_reservation(
+static XSM_INLINE int cf_check xsm_memory_stat_reservation(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int cf_check xsm_console_io(
+    XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     if ( d->is_console )
@@ -253,26 +257,27 @@ static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
     return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
-static XSM_INLINE int xsm_profile(XSM_DEFAULT_ARG struct domain *d, int op)
+static XSM_INLINE int cf_check xsm_profile(
+    XSM_DEFAULT_ARG struct domain *d, int op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_kexec(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_schedop_shutdown(
+static XSM_INLINE int cf_check xsm_schedop_shutdown(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_pin_page(
+static XSM_INLINE int cf_check xsm_memory_pin_page(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
     struct page_info *page)
 {
@@ -280,20 +285,20 @@ static XSM_INLINE int xsm_memory_pin_page(
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_unbound(
+static XSM_INLINE int cf_check xsm_evtchn_unbound(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_interdomain(
+static XSM_INLINE int cf_check xsm_evtchn_interdomain(
     XSM_DEFAULT_ARG struct domain *d1, struct evtchn *chan1, struct domain *d2,
     struct evtchn *chan2)
 {
@@ -301,89 +306,94 @@ static XSM_INLINE int xsm_evtchn_interdomain(
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
+static XSM_INLINE void cf_check xsm_evtchn_close_post(struct evtchn *chn)
 {
     return;
 }
 
-static XSM_INLINE int xsm_evtchn_send(
+static XSM_INLINE int cf_check xsm_evtchn_send(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_evtchn_status(
+static XSM_INLINE int cf_check xsm_evtchn_status(
     XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_reset(
+static XSM_INLINE int cf_check xsm_evtchn_reset(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_alloc_security_evtchns(
+static XSM_INLINE int cf_check xsm_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_evtchns(
+static XSM_INLINE void cf_check xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return;
 }
 
-static XSM_INLINE char *xsm_show_security_evtchn(
+static XSM_INLINE char *cf_check xsm_show_security_evtchn(
     struct domain *d, const struct evtchn *chn)
 {
     return NULL;
 }
 
-static XSM_INLINE int xsm_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_init_hardware_domain(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_get_pod_target(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_set_pod_target(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_get_vnumainfo(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int cf_check xsm_get_device_group(
+    XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_assign_device(
+static XSM_INLINE int cf_check xsm_assign_device(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_device(
+static XSM_INLINE int cf_check xsm_deassign_device(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
@@ -393,14 +403,14 @@ static XSM_INLINE int xsm_deassign_device(
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int xsm_assign_dtdevice(
+static XSM_INLINE int cf_check xsm_assign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_dtdevice(
+static XSM_INLINE int cf_check xsm_deassign_dtdevice(
     XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
@@ -409,142 +419,144 @@ static XSM_INLINE int xsm_deassign_dtdevice(
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static XSM_INLINE int xsm_resource_plug_core(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_unplug_core(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_resource_unplug_core(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_plug_pci(
+static XSM_INLINE int cf_check xsm_resource_plug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_unplug_pci(
+static XSM_INLINE int cf_check xsm_resource_unplug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_pci(
+static XSM_INLINE int cf_check xsm_resource_setup_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
+static XSM_INLINE int cf_check xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
+static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+static XSM_INLINE long cf_check xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
+static XSM_INLINE int cf_check xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
 #endif
 
-static XSM_INLINE char *xsm_show_irq_sid(int irq)
+static XSM_INLINE char *cf_check xsm_show_irq_sid(int irq)
 {
     return NULL;
 }
 
-static XSM_INLINE int xsm_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_map_domain_pirq(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_map_domain_irq(
+static XSM_INLINE int cf_check xsm_map_domain_irq(
     XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_unmap_domain_pirq(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_bind_pt_irq(
+static XSM_INLINE int cf_check xsm_bind_pt_irq(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unbind_pt_irq(
+static XSM_INLINE int cf_check xsm_unbind_pt_irq(
     XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_irq(
+static XSM_INLINE int cf_check xsm_unmap_domain_irq(
     XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_irq_permission(
+static XSM_INLINE int cf_check xsm_irq_permission(
     XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_permission(
+static XSM_INLINE int cf_check xsm_iomem_permission(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_mapping(
+static XSM_INLINE int cf_check xsm_iomem_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pci_config_permission(
+static XSM_INLINE int cf_check xsm_pci_config_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
     uint16_t end, uint8_t access)
 {
@@ -552,41 +564,42 @@ static XSM_INLINE int xsm_pci_config_permission(
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_add_to_physmap(
+static XSM_INLINE int cf_check xsm_add_to_physmap(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_remove_from_physmap(
+static XSM_INLINE int cf_check xsm_remove_from_physmap(
     XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_map_gmfn_foreign(
+static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_hvm_param(
+static XSM_INLINE int cf_check xsm_hvm_param(
     XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_altp2mhvm_op(
+static XSM_INLINE int cf_check xsm_hvm_altp2mhvm_op(
     XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
@@ -606,7 +619,7 @@ static XSM_INLINE int xsm_hvm_altp2mhvm_op(
     }
 }
 
-static XSM_INLINE int xsm_vm_event_control(
+static XSM_INLINE int cf_check xsm_vm_event_control(
     XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -614,7 +627,7 @@ static XSM_INLINE int xsm_vm_event_control(
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -622,7 +635,7 @@ static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -630,59 +643,61 @@ static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
 
-static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int cf_check xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
-static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_shadow_control(
+static XSM_INLINE int cf_check xsm_shadow_control(
     XSM_DEFAULT_ARG struct domain *d, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mem_sharing_op(
+static XSM_INLINE int cf_check xsm_mem_sharing_op(
     XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int xsm_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int cf_check xsm_apic(
+    XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
+static XSM_INLINE int cf_check xsm_machine_memory_map(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_domain_memory_map(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mmu_update(
+static XSM_INLINE int cf_check xsm_mmu_update(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
     uint32_t flags)
 {
@@ -695,42 +710,42 @@ static XSM_INLINE int xsm_mmu_update(
     return rc;
 }
 
-static XSM_INLINE int xsm_mmuext_op(
+static XSM_INLINE int cf_check xsm_mmuext_op(
     XSM_DEFAULT_ARG struct domain *d, struct domain *f)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_update_va_mapping(
+static XSM_INLINE int cf_check xsm_update_va_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_priv_mapping(
+static XSM_INLINE int cf_check xsm_priv_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_ioport_permission(
+static XSM_INLINE int cf_check xsm_ioport_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_ioport_mapping(
+static XSM_INLINE int cf_check xsm_ioport_mapping(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pmu_op(
+static XSM_INLINE int cf_check xsm_pmu_op(
     XSM_DEFAULT_ARG struct domain *d, unsigned int op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
@@ -748,30 +763,31 @@ static XSM_INLINE int xsm_pmu_op(
 
 #endif /* CONFIG_X86 */
 
-static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int xsm_argo_enable(const struct domain *d)
+static XSM_INLINE int cf_check xsm_argo_enable(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_register_single_source(
+static XSM_INLINE int cf_check xsm_argo_register_single_source(
     const struct domain *d, const struct domain *t)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_register_any_source(const struct domain *d)
+static XSM_INLINE int cf_check xsm_argo_register_any_source(
+    const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_send(
+static XSM_INLINE int cf_check xsm_argo_send(
     const struct domain *d, const struct domain *t)
 {
     return 0;
@@ -780,7 +796,7 @@ static XSM_INLINE int xsm_argo_send(
 #endif /* CONFIG_ARGO */
 
 #include <public/version.h>
-static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -804,7 +820,8 @@ static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
     }
 }
 
-static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int cf_check xsm_domain_resource_map(
+    XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 2d7ca3abaecd..707be72a3b96 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -607,7 +607,7 @@ static int flask_relabel_domain(struct xen_flask_relabel *arg)
 
 #endif /* !COMPAT */
 
-ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
+ret_t cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
 {
     xen_flask_op_t op;
     int rv;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 6ff1be28e4a4..63484e323c09 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -157,7 +157,7 @@ static int avc_unknown_permission(const char *name, int id)
     return rc;
 }
 
-static int flask_domain_alloc_security(struct domain *d)
+static int cf_check flask_domain_alloc_security(struct domain *d)
 {
     struct domain_security_struct *dsec;
 
@@ -186,7 +186,7 @@ static int flask_domain_alloc_security(struct domain *d)
     return 0;
 }
 
-static void flask_domain_free_security(struct domain *d)
+static void cf_check flask_domain_free_security(struct domain *d)
 {
     struct domain_security_struct *dsec = d->ssid;
 
@@ -197,8 +197,8 @@ static void flask_domain_free_security(struct domain *d)
     xfree(dsec);
 }
 
-static int flask_evtchn_unbound(struct domain *d1, struct evtchn *chn, 
-                                domid_t id2)
+static int cf_check flask_evtchn_unbound(
+    struct domain *d1, struct evtchn *chn, domid_t id2)
 {
     u32 sid1, sid2, newsid;
     int rc;
@@ -230,8 +230,9 @@ static int flask_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     return rc;
 }
 
-static int flask_evtchn_interdomain(struct domain *d1, struct evtchn *chn1, 
-                                    struct domain *d2, struct evtchn *chn2)
+static int cf_check flask_evtchn_interdomain(
+    struct domain *d1, struct evtchn *chn1,
+    struct domain *d2, struct evtchn *chn2)
 {
     u32 sid1, sid2, newsid, reverse_sid;
     int rc;
@@ -273,12 +274,12 @@ static int flask_evtchn_interdomain(struct domain *d1, struct evtchn *chn1,
     return rc;
 }
 
-static void flask_evtchn_close_post(struct evtchn *chn)
+static void cf_check flask_evtchn_close_post(struct evtchn *chn)
 {
     chn->ssid.flask_sid = SECINITSID_UNLABELED;
 }
 
-static int flask_evtchn_send(struct domain *d, struct evtchn *chn)
+static int cf_check flask_evtchn_send(struct domain *d, struct evtchn *chn)
 {
     int rc;
 
@@ -298,17 +299,18 @@ static int flask_evtchn_send(struct domain *d, struct evtchn *chn)
     return rc;
 }
 
-static int flask_evtchn_status(struct domain *d, struct evtchn *chn)
+static int cf_check flask_evtchn_status(struct domain *d, struct evtchn *chn)
 {
     return domain_has_evtchn(d, chn, EVENT__STATUS);
 }
 
-static int flask_evtchn_reset(struct domain *d1, struct domain *d2)
+static int cf_check flask_evtchn_reset(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_EVENT, EVENT__RESET);
 }
 
-static int flask_alloc_security_evtchns(struct evtchn chn[], unsigned int nr)
+static int cf_check flask_alloc_security_evtchns(
+    struct evtchn chn[], unsigned int nr)
 {
     unsigned int i;
 
@@ -318,7 +320,8 @@ static int flask_alloc_security_evtchns(struct evtchn chn[], unsigned int nr)
     return 0;
 }
 
-static void flask_free_security_evtchns(struct evtchn chn[], unsigned int nr)
+static void cf_check flask_free_security_evtchns(
+    struct evtchn chn[], unsigned int nr)
 {
     unsigned int i;
 
@@ -329,7 +332,8 @@ static void flask_free_security_evtchns(struct evtchn chn[], unsigned int nr)
         chn[i].ssid.flask_sid = SECINITSID_UNLABELED;
 }
 
-static char *flask_show_security_evtchn(struct domain *d, const struct evtchn *chn)
+static char *cf_check flask_show_security_evtchn(
+    struct domain *d, const struct evtchn *chn)
 {
     int irq;
     u32 sid = 0;
@@ -355,13 +359,13 @@ static char *flask_show_security_evtchn(struct domain *d, const struct evtchn *c
     return ctx;
 }
 
-static int flask_init_hardware_domain(struct domain *d)
+static int cf_check flask_init_hardware_domain(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__CREATE_HARDWARE_DOMAIN);
 }
 
-static int flask_grant_mapref(struct domain *d1, struct domain *d2, 
-                              uint32_t flags)
+static int cf_check flask_grant_mapref(
+    struct domain *d1, struct domain *d2, uint32_t flags)
 {
     u32 perms = GRANT__MAP_READ;
 
@@ -371,73 +375,75 @@ static int flask_grant_mapref(struct domain *d1, struct domain *d2,
     return domain_has_perm(d1, d2, SECCLASS_GRANT, perms);
 }
 
-static int flask_grant_unmapref(struct domain *d1, struct domain *d2)
+static int cf_check flask_grant_unmapref(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__UNMAP);
 }
 
-static int flask_grant_setup(struct domain *d1, struct domain *d2)
+static int cf_check flask_grant_setup(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__SETUP);
 }
 
-static int flask_grant_transfer(struct domain *d1, struct domain *d2)
+static int cf_check flask_grant_transfer(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__TRANSFER);
 }
 
-static int flask_grant_copy(struct domain *d1, struct domain *d2)
+static int cf_check flask_grant_copy(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__COPY);
 }
 
-static int flask_grant_query_size(struct domain *d1, struct domain *d2)
+static int cf_check flask_grant_query_size(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_GRANT, GRANT__QUERY);
 }
 
-static int flask_get_pod_target(struct domain *d)
+static int cf_check flask_get_pod_target(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETPODTARGET);
 }
 
-static int flask_set_pod_target(struct domain *d)
+static int cf_check flask_set_pod_target(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SETPODTARGET);
 }
 
-static int flask_memory_exchange(struct domain *d)
+static int cf_check flask_memory_exchange(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_MMU, MMU__EXCHANGE);
 }
 
-static int flask_memory_adjust_reservation(struct domain *d1, struct domain *d2)
+static int cf_check flask_memory_adjust_reservation(
+    struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__ADJUST);
 }
 
-static int flask_memory_stat_reservation(struct domain *d1, struct domain *d2)
+static int cf_check flask_memory_stat_reservation(
+    struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__STAT);
 }
 
-static int flask_memory_pin_page(struct domain *d1, struct domain *d2,
-                                 struct page_info *page)
+static int cf_check flask_memory_pin_page(
+    struct domain *d1, struct domain *d2, struct page_info *page)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__PINPAGE);
 }
 
-static int flask_claim_pages(struct domain *d)
+static int cf_check flask_claim_pages(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SETCLAIM);
 }
 
-static int flask_get_vnumainfo(struct domain *d)
+static int cf_check flask_get_vnumainfo(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_VNUMAINFO);
 }
 
-static int flask_console_io(struct domain *d, int cmd)
+static int cf_check flask_console_io(struct domain *d, int cmd)
 {
     u32 perm;
 
@@ -456,7 +462,7 @@ static int flask_console_io(struct domain *d, int cmd)
     return domain_has_xen(d, perm);
 }
 
-static int flask_profile(struct domain *d, int op)
+static int cf_check flask_profile(struct domain *d, int op)
 {
     u32 perm;
 
@@ -488,23 +494,23 @@ static int flask_profile(struct domain *d, int op)
     return domain_has_xen(d, perm);
 }
 
-static int flask_kexec(void)
+static int cf_check flask_kexec(void)
 {
     return domain_has_xen(current->domain, XEN__KEXEC);
 }
 
-static int flask_schedop_shutdown(struct domain *d1, struct domain *d2)
+static int cf_check flask_schedop_shutdown(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_DOMAIN, DOMAIN__SHUTDOWN);
 }
 
-static void flask_security_domaininfo(struct domain *d, 
-                                      struct xen_domctl_getdomaininfo *info)
+static void cf_check flask_security_domaininfo(
+    struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     info->ssidref = domain_sid(d);
 }
 
-static int flask_domain_create(struct domain *d, u32 ssidref)
+static int cf_check flask_domain_create(struct domain *d, u32 ssidref)
 {
     int rc;
     struct domain_security_struct *dsec = d->ssid;
@@ -532,12 +538,12 @@ static int flask_domain_create(struct domain *d, u32 ssidref)
     return rc;
 }
 
-static int flask_getdomaininfo(struct domain *d)
+static int cf_check flask_getdomaininfo(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETDOMAININFO);
 }
 
-static int flask_domctl_scheduler_op(struct domain *d, int op)
+static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
 {
     switch ( op )
     {
@@ -554,7 +560,7 @@ static int flask_domctl_scheduler_op(struct domain *d, int op)
     }
 }
 
-static int flask_sysctl_scheduler_op(int op)
+static int cf_check flask_sysctl_scheduler_op(int op)
 {
     switch ( op )
     {
@@ -569,7 +575,7 @@ static int flask_sysctl_scheduler_op(int op)
     }
 }
 
-static int flask_set_target(struct domain *d, struct domain *t)
+static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
     int rc;
     struct domain_security_struct *dsec, *tsec;
@@ -593,7 +599,7 @@ static int flask_set_target(struct domain *d, struct domain *t)
     return rc;
 }
 
-static int flask_domctl(struct domain *d, int cmd)
+static int cf_check flask_domctl(struct domain *d, int cmd)
 {
     switch ( cmd )
     {
@@ -757,7 +763,7 @@ static int flask_domctl(struct domain *d, int cmd)
     }
 }
 
-static int flask_sysctl(int cmd)
+static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
     {
@@ -835,7 +841,7 @@ static int flask_sysctl(int cmd)
     }
 }
 
-static int flask_readconsole(uint32_t clear)
+static int cf_check flask_readconsole(uint32_t clear)
 {
     u32 perms = XEN__READCONSOLE;
 
@@ -853,7 +859,7 @@ static inline u32 resource_to_perm(uint8_t access)
         return RESOURCE__REMOVE;
 }
 
-static char *flask_show_irq_sid (int irq)
+static char *cf_check flask_show_irq_sid(int irq)
 {
     u32 sid, ctx_len;
     char *ctx;
@@ -867,7 +873,7 @@ static char *flask_show_irq_sid (int irq)
     return ctx;
 }
 
-static int flask_map_domain_pirq (struct domain *d)
+static int cf_check flask_map_domain_pirq(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
 }
@@ -907,7 +913,7 @@ static u32 flask_iommu_resource_use_perm(const struct domain *d)
     return perm;
 }
 
-static int flask_map_domain_irq (struct domain *d, int irq, const void *data)
+static int cf_check flask_map_domain_irq(struct domain *d, int irq, const void *data)
 {
     u32 sid, dsid;
     int rc = -EPERM;
@@ -933,7 +939,7 @@ static int flask_map_domain_irq (struct domain *d, int irq, const void *data)
     return rc;
 }
 
-static int flask_unmap_domain_pirq (struct domain *d)
+static int cf_check flask_unmap_domain_pirq(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
@@ -954,7 +960,8 @@ static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
 #endif
 }
 
-static int flask_unmap_domain_irq (struct domain *d, int irq, const void *data)
+static int cf_check flask_unmap_domain_irq(
+    struct domain *d, int irq, const void *data)
 {
     u32 sid;
     int rc = -EPERM;
@@ -972,7 +979,8 @@ static int flask_unmap_domain_irq (struct domain *d, int irq, const void *data)
     return rc;
 }
 
-static int flask_bind_pt_irq (struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static int cf_check flask_bind_pt_irq(
+    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     u32 dsid, rsid;
     int rc = -EPERM;
@@ -998,12 +1006,14 @@ static int flask_bind_pt_irq (struct domain *d, struct xen_domctl_bind_pt_irq *b
     return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
-static int flask_unbind_pt_irq (struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static int cf_check flask_unbind_pt_irq(
+    struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
 }
 
-static int flask_irq_permission (struct domain *d, int pirq, uint8_t access)
+static int cf_check flask_irq_permission(
+    struct domain *d, int pirq, uint8_t access)
 {
     /* the PIRQ number is not useful; real IRQ is checked during mapping */
     return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
@@ -1016,7 +1026,8 @@ struct iomem_has_perm_data {
     u32 use_perm;
 };
 
-static int _iomem_has_perm(void *v, u32 sid, unsigned long start, unsigned long end)
+static int cf_check _iomem_has_perm(
+    void *v, u32 sid, unsigned long start, unsigned long end)
 {
     struct iomem_has_perm_data *data = v;
     struct avc_audit_data ad;
@@ -1034,7 +1045,8 @@ static int _iomem_has_perm(void *v, u32 sid, unsigned long start, unsigned long
     return avc_has_perm(data->dsid, sid, SECCLASS_RESOURCE, data->use_perm, &ad);
 }
 
-static int flask_iomem_permission(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
+static int cf_check flask_iomem_permission(
+    struct domain *d, uint64_t start, uint64_t end, uint8_t access)
 {
     struct iomem_has_perm_data data;
     int rc;
@@ -1056,12 +1068,14 @@ static int flask_iomem_permission(struct domain *d, uint64_t start, uint64_t end
     return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
 }
 
-static int flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
+static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
 {
     return flask_iomem_permission(d, start, end, access);
 }
 
-static int flask_pci_config_permission(struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
+static int cf_check flask_pci_config_permission(
+    struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
+    uint8_t access)
 {
     u32 dsid, rsid;
     int rc = -EPERM;
@@ -1085,12 +1099,12 @@ static int flask_pci_config_permission(struct domain *d, uint32_t machine_bdf, u
 
 }
 
-static int flask_resource_plug_core(void)
+static int cf_check flask_resource_plug_core(void)
 {
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__PLUG, NULL);
 }
 
-static int flask_resource_unplug_core(void)
+static int cf_check flask_resource_unplug_core(void)
 {
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__UNPLUG, NULL);
 }
@@ -1100,7 +1114,7 @@ static int flask_resource_use_core(void)
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__USE, NULL);
 }
 
-static int flask_resource_plug_pci(uint32_t machine_bdf)
+static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1115,7 +1129,7 @@ static int flask_resource_plug_pci(uint32_t machine_bdf)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__PLUG, &ad);
 }
 
-static int flask_resource_unplug_pci(uint32_t machine_bdf)
+static int cf_check flask_resource_unplug_pci(uint32_t machine_bdf)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1130,7 +1144,7 @@ static int flask_resource_unplug_pci(uint32_t machine_bdf)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__UNPLUG, &ad);
 }
 
-static int flask_resource_setup_pci(uint32_t machine_bdf)
+static int cf_check flask_resource_setup_pci(uint32_t machine_bdf)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1145,7 +1159,7 @@ static int flask_resource_setup_pci(uint32_t machine_bdf)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__SETUP, &ad);
 }
 
-static int flask_resource_setup_gsi(int gsi)
+static int cf_check flask_resource_setup_gsi(int gsi)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1158,12 +1172,12 @@ static int flask_resource_setup_gsi(int gsi)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__SETUP, &ad);
 }
 
-static int flask_resource_setup_misc(void)
+static int cf_check flask_resource_setup_misc(void)
 {
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
 }
 
-static inline int flask_page_offline(uint32_t cmd)
+static inline int cf_check flask_page_offline(uint32_t cmd)
 {
     switch (cmd) {
     case sysctl_page_offline:
@@ -1177,27 +1191,28 @@ static inline int flask_page_offline(uint32_t cmd)
     }
 }
 
-static inline int flask_hypfs_op(void)
+static inline int cf_check flask_hypfs_op(void)
 {
     return domain_has_xen(current->domain, XEN__HYPFS_OP);
 }
 
-static int flask_add_to_physmap(struct domain *d1, struct domain *d2)
+static int cf_check flask_add_to_physmap(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__PHYSMAP);
 }
 
-static int flask_remove_from_physmap(struct domain *d1, struct domain *d2)
+static int cf_check flask_remove_from_physmap(
+    struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__PHYSMAP);
 }
 
-static int flask_map_gmfn_foreign(struct domain *d, struct domain *t)
+static int cf_check flask_map_gmfn_foreign(struct domain *d, struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__MAP_READ | MMU__MAP_WRITE);
 }
 
-static int flask_hvm_param(struct domain *d, unsigned long op)
+static int cf_check flask_hvm_param(struct domain *d, unsigned long op)
 {
     u32 perm;
 
@@ -1216,12 +1231,12 @@ static int flask_hvm_param(struct domain *d, unsigned long op)
     return current_has_perm(d, SECCLASS_HVM, perm);
 }
 
-static int flask_hvm_param_altp2mhvm(struct domain *d)
+static int cf_check flask_hvm_param_altp2mhvm(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
 }
 
-static int flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
+static int cf_check flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
 {
     /*
      * Require both mode and XSM to allow the operation. Assume XSM rules
@@ -1245,34 +1260,34 @@ static int flask_hvm_altp2mhvm_op(struct domain *d, uint64_t mode, uint32_t op)
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM_OP);
 }
 
-static int flask_vm_event_control(struct domain *d, int mode, int op)
+static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static int flask_mem_access(struct domain *d)
+static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static int flask_mem_paging(struct domain *d)
+static int cf_check flask_mem_paging(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_PAGING);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static int flask_mem_sharing(struct domain *d)
+static int cf_check flask_mem_sharing(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_SHARING);
 }
 #endif
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static int flask_get_device_group(uint32_t machine_bdf)
+static int cf_check flask_get_device_group(uint32_t machine_bdf)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1296,7 +1311,7 @@ static int flask_test_assign_device(uint32_t machine_bdf)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__STAT_DEVICE, NULL);
 }
 
-static int flask_assign_device(struct domain *d, uint32_t machine_bdf)
+static int cf_check flask_assign_device(struct domain *d, uint32_t machine_bdf)
 {
     u32 dsid, rsid;
     int rc = -EPERM;
@@ -1326,7 +1341,8 @@ static int flask_assign_device(struct domain *d, uint32_t machine_bdf)
     return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
-static int flask_deassign_device(struct domain *d, uint32_t machine_bdf)
+static int cf_check flask_deassign_device(
+    struct domain *d, uint32_t machine_bdf)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1357,7 +1373,7 @@ static int flask_test_assign_dtdevice(const char *dtpath)
                                 NULL);
 }
 
-static int flask_assign_dtdevice(struct domain *d, const char *dtpath)
+static int cf_check flask_assign_dtdevice(struct domain *d, const char *dtpath)
 {
     u32 dsid, rsid;
     int rc = -EPERM;
@@ -1387,7 +1403,8 @@ static int flask_assign_dtdevice(struct domain *d, const char *dtpath)
     return avc_has_perm(dsid, rsid, SECCLASS_RESOURCE, dperm, &ad);
 }
 
-static int flask_deassign_dtdevice(struct domain *d, const char *dtpath)
+static int cf_check flask_deassign_dtdevice(
+    struct domain *d, const char *dtpath)
 {
     u32 rsid;
     int rc = -EPERM;
@@ -1405,7 +1422,7 @@ static int flask_deassign_dtdevice(struct domain *d, const char *dtpath)
 }
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static int flask_platform_op(uint32_t op)
+static int cf_check flask_platform_op(uint32_t op)
 {
     switch ( op )
     {
@@ -1474,12 +1491,12 @@ static int flask_platform_op(uint32_t op)
 }
 
 #ifdef CONFIG_X86
-static int flask_do_mca(void)
+static int cf_check flask_do_mca(void)
 {
     return domain_has_xen(current->domain, XEN__MCA_OP);
 }
 
-static int flask_shadow_control(struct domain *d, uint32_t op)
+static int cf_check flask_shadow_control(struct domain *d, uint32_t op)
 {
     u32 perm;
 
@@ -1513,7 +1530,8 @@ struct ioport_has_perm_data {
     u32 use_perm;
 };
 
-static int _ioport_has_perm(void *v, u32 sid, unsigned long start, unsigned long end)
+static int cf_check _ioport_has_perm(
+    void *v, u32 sid, unsigned long start, unsigned long end)
 {
     struct ioport_has_perm_data *data = v;
     struct avc_audit_data ad;
@@ -1531,7 +1549,8 @@ static int _ioport_has_perm(void *v, u32 sid, unsigned long start, unsigned long
     return avc_has_perm(data->dsid, sid, SECCLASS_RESOURCE, data->use_perm, &ad);
 }
 
-static int flask_ioport_permission(struct domain *d, uint32_t start, uint32_t end, uint8_t access)
+static int cf_check flask_ioport_permission(
+    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
 {
     int rc;
     struct ioport_has_perm_data data;
@@ -1554,12 +1573,14 @@ static int flask_ioport_permission(struct domain *d, uint32_t start, uint32_t en
     return security_iterate_ioport_sids(start, end, _ioport_has_perm, &data);
 }
 
-static int flask_ioport_mapping(struct domain *d, uint32_t start, uint32_t end, uint8_t access)
+static int cf_check flask_ioport_mapping(
+    struct domain *d, uint32_t start, uint32_t end, uint8_t access)
 {
     return flask_ioport_permission(d, start, end, access);
 }
 
-static int flask_mem_sharing_op(struct domain *d, struct domain *cd, int op)
+static int cf_check flask_mem_sharing_op(
+    struct domain *d, struct domain *cd, int op)
 {
     int rc = current_has_perm(cd, SECCLASS_HVM, HVM__MEM_SHARING);
     if ( rc )
@@ -1567,7 +1588,7 @@ static int flask_mem_sharing_op(struct domain *d, struct domain *cd, int op)
     return domain_has_perm(d, cd, SECCLASS_HVM, HVM__SHARE_MEM);
 }
 
-static int flask_apic(struct domain *d, int cmd)
+static int cf_check flask_apic(struct domain *d, int cmd)
 {
     u32 perm;
 
@@ -1587,18 +1608,18 @@ static int flask_apic(struct domain *d, int cmd)
     return domain_has_xen(d, perm);
 }
 
-static int flask_machine_memory_map(void)
+static int cf_check flask_machine_memory_map(void)
 {
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_MMU, MMU__MEMORYMAP, NULL);
 }
 
-static int flask_domain_memory_map(struct domain *d)
+static int cf_check flask_domain_memory_map(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
 }
 
-static int flask_mmu_update(struct domain *d, struct domain *t,
-                            struct domain *f, uint32_t flags)
+static int cf_check flask_mmu_update(
+    struct domain *d, struct domain *t, struct domain *f, uint32_t flags)
 {
     int rc = 0;
     u32 map_perms = 0;
@@ -1620,13 +1641,13 @@ static int flask_mmu_update(struct domain *d, struct domain *t,
     return rc;
 }
 
-static int flask_mmuext_op(struct domain *d, struct domain *f)
+static int cf_check flask_mmuext_op(struct domain *d, struct domain *f)
 {
     return domain_has_perm(d, f, SECCLASS_MMU, MMU__MMUEXT_OP);
 }
 
-static int flask_update_va_mapping(struct domain *d, struct domain *f,
-                                   l1_pgentry_t pte)
+static int cf_check flask_update_va_mapping(
+    struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
     u32 map_perms = MMU__MAP_READ;
     if ( !(l1e_get_flags(pte) & _PAGE_PRESENT) )
@@ -1637,12 +1658,12 @@ static int flask_update_va_mapping(struct domain *d, struct domain *f,
     return domain_has_perm(d, f, SECCLASS_MMU, map_perms);
 }
 
-static int flask_priv_mapping(struct domain *d, struct domain *t)
+static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__TARGET_HACK);
 }
 
-static int flask_pmu_op (struct domain *d, unsigned int op)
+static int cf_check flask_pmu_op(struct domain *d, unsigned int op)
 {
     u32 dsid = domain_sid(d);
 
@@ -1666,12 +1687,12 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
 }
 #endif /* CONFIG_X86 */
 
-static int flask_dm_op(struct domain *d)
+static int cf_check flask_dm_op(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__DM);
 }
 
-static int flask_xen_version (uint32_t op)
+static int cf_check flask_xen_version(uint32_t op)
 {
     u32 dsid = domain_sid(current->domain);
 
@@ -1711,32 +1732,33 @@ static int flask_xen_version (uint32_t op)
     }
 }
 
-static int flask_domain_resource_map(struct domain *d)
+static int cf_check flask_domain_resource_map(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__RESOURCE_MAP);
 }
 
 #ifdef CONFIG_ARGO
-static int flask_argo_enable(const struct domain *d)
+static int cf_check flask_argo_enable(const struct domain *d)
 {
     return avc_has_perm(domain_sid(d), SECINITSID_XEN, SECCLASS_ARGO,
                         ARGO__ENABLE, NULL);
 }
 
-static int flask_argo_register_single_source(const struct domain *d,
-                                             const struct domain *t)
+static int cf_check flask_argo_register_single_source(
+    const struct domain *d, const struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_ARGO,
                            ARGO__REGISTER_SINGLE_SOURCE);
 }
 
-static int flask_argo_register_any_source(const struct domain *d)
+static int cf_check flask_argo_register_any_source(const struct domain *d)
 {
     return avc_has_perm(domain_sid(d), SECINITSID_XEN, SECCLASS_ARGO,
                         ARGO__REGISTER_ANY_SOURCE, NULL);
 }
 
-static int flask_argo_send(const struct domain *d, const struct domain *t)
+static int cf_check flask_argo_send(
+    const struct domain *d, const struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_ARGO, ARGO__SEND);
 }
diff --git a/xen/xsm/flask/private.h b/xen/xsm/flask/private.h
index 73b0de87245a..429f213cce74 100644
--- a/xen/xsm/flask/private.h
+++ b/xen/xsm/flask/private.h
@@ -3,7 +3,7 @@
 
 #include <public/xen.h>
 
-long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+long cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+int cf_check compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
 #endif /* XSM_FLASK_PRIVATE */
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 3550dded7b4e..4d5fc98e7e54 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -33,8 +33,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
             is_control_domain(rdom) || ldom == rdom);
 }
 
-static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
-                               domid_t id2)
+static int cf_check silo_evtchn_unbound(
+    struct domain *d1, struct evtchn *chn, domid_t id2)
 {
     int rc = -EPERM;
     struct domain *d2 = rcu_lock_domain_by_any_id(id2);
@@ -51,30 +51,31 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     return rc;
 }
 
-static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
-                                   struct domain *d2, struct evtchn *chan2)
+static int cf_check silo_evtchn_interdomain(
+    struct domain *d1, struct evtchn *chan1,
+    struct domain *d2, struct evtchn *chan2)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
     return -EPERM;
 }
 
-static int silo_grant_mapref(struct domain *d1, struct domain *d2,
-                             uint32_t flags)
+static int cf_check silo_grant_mapref(
+    struct domain *d1, struct domain *d2, uint32_t flags)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_grant_mapref(d1, d2, flags);
     return -EPERM;
 }
 
-static int silo_grant_transfer(struct domain *d1, struct domain *d2)
+static int cf_check silo_grant_transfer(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_grant_transfer(d1, d2);
     return -EPERM;
 }
 
-static int silo_grant_copy(struct domain *d1, struct domain *d2)
+static int cf_check silo_grant_copy(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_grant_copy(d1, d2);
@@ -83,15 +84,16 @@ static int silo_grant_copy(struct domain *d1, struct domain *d2)
 
 #ifdef CONFIG_ARGO
 
-static int silo_argo_register_single_source(const struct domain *d1,
-                                            const struct domain *d2)
+static int cf_check silo_argo_register_single_source(
+    const struct domain *d1, const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_argo_register_single_source(d1, d2);
     return -EPERM;
 }
 
-static int silo_argo_send(const struct domain *d1, const struct domain *d2)
+static int cf_check silo_argo_send(
+    const struct domain *d1, const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
         return xsm_argo_send(d1, d2);
-- 
2.11.0


