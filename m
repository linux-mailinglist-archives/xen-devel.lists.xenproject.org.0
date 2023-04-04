Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A706B6D5C5D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517713.803493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLL-0006B4-VH; Tue, 04 Apr 2023 09:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517713.803493; Tue, 04 Apr 2023 09:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLL-00064o-Qh; Tue, 04 Apr 2023 09:52:47 +0000
Received: by outflank-mailman (input) for mailman id 517713;
 Tue, 04 Apr 2023 09:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLJ-0005bo-Os
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70fd1efd-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:52:43 +0200 (CEST)
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
X-Inumbo-ID: 70fd1efd-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DskzMb94090V7ZbiUkJVNj9GkqXb607CuUmAX3BTcQA=;
  b=debtlS28BTxGtSYZb6P407iklmOqyFqitg4Ggsc3Y/bOyPWvsKpskBpf
   9Ty8v+uGuUaL6rEzOL0IsmCjHuHKQ2HpAIvnZnYlggJ6OjpIIVfuZAeua
   a2YndCaKf97FkyASzT+DLkvOICgR+PWgtrMzeFD927vihzC6Bn/dZ8tM8
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103612244
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:oo6hb6gLw1Ufv2IQodeBTL1UX161HxAKZh0ujC45NGQN5FlHY01je
 htvWmiBPPuDYTf1c9okbty+/U4GupXSz9Q3QQM/rC48Eyob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQmLCFXNyvEht6PwbGlEMRP1skGCdX0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jmYpj6jXk1y2Nq38n2ByjG9i+r1m332faEjMKO92vduqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEscw8UuYDY54APtxPMUIxOM/64q/jpBmSlq
 9yVlxTSl4n/nOZSifXjoA+Z2W31znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfC9SYq0DKuOMIomjn1NmOivpXkGWKJt9zq1zBhEfV8XY
 v93jvpA/V5FUP86nVJats8W0KMxxzBW+F4/savTlkz9uZLHPS79dFvwGAfWBgzPxP/e8Vq9H
 hc2H5fi9iizp8WlPXaLq9dPcglaRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:Cxf9BKmoCalSaIbUWjqMRhn2btnpDfLd3DAbv31ZSRFFG/Fwwf
 re+sjztCWE6gr5PUtK8+xoV5PwOU80iqQFmrX5UY3OYOCigguVxeJZnO7fKl/behEWn9Q1vZ
 uIMZIOa+EYa2IXsS+Q2meF+rgbr+Vv+ZrY/9v2/jNWSAlhaeVN6Bp0ER+BEld7AClqbKBJcK
 a01458ojKrezAyYt6gDncIG8jvzue77a7OUFo9AhYs6k2ygTutrJ7WeiLouSsjbw==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="103612244"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 02/15] x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields
Date: Tue, 4 Apr 2023 10:52:09 +0100
Message-ID: <20230404095222.1373721-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These weren't great names to begin with, and using {leaves,msrs} matches up
better with the existing nr_{leaves,msr} parameters anyway.

Furthermore, by renaming these fields we can get away with using some #define
trickery to avoid the struct {cpuid,msr}_policy merge needing to happen in a
single changeset.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix typo in commit message
---
 tools/libs/guest/xg_cpuid_x86.c | 12 ++++++------
 xen/arch/x86/domctl.c           | 12 ++++++------
 xen/arch/x86/sysctl.c           |  8 ++++----
 xen/include/public/domctl.h     |  4 ++--
 xen/include/public/sysctl.h     |  4 ++--
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 1b02bc987af7..5fae06e77804 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -145,9 +145,9 @@ static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
     sysctl.cmd = XEN_SYSCTL_get_cpu_policy;
     sysctl.u.cpu_policy.index = index;
     sysctl.u.cpu_policy.nr_leaves = *nr_leaves;
-    set_xen_guest_handle(sysctl.u.cpu_policy.cpuid_policy, leaves);
+    set_xen_guest_handle(sysctl.u.cpu_policy.leaves, leaves);
     sysctl.u.cpu_policy.nr_msrs = *nr_msrs;
-    set_xen_guest_handle(sysctl.u.cpu_policy.msr_policy, msrs);
+    set_xen_guest_handle(sysctl.u.cpu_policy.msrs, msrs);
 
     ret = do_sysctl(xch, &sysctl);
 
@@ -183,9 +183,9 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     domctl.cmd = XEN_DOMCTL_get_cpu_policy;
     domctl.domain = domid;
     domctl.u.cpu_policy.nr_leaves = *nr_leaves;
-    set_xen_guest_handle(domctl.u.cpu_policy.cpuid_policy, leaves);
+    set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
     domctl.u.cpu_policy.nr_msrs = *nr_msrs;
-    set_xen_guest_handle(domctl.u.cpu_policy.msr_policy, msrs);
+    set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
 
     ret = do_domctl(xch, &domctl);
 
@@ -232,9 +232,9 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     domctl.cmd = XEN_DOMCTL_set_cpu_policy;
     domctl.domain = domid;
     domctl.u.cpu_policy.nr_leaves = nr_leaves;
-    set_xen_guest_handle(domctl.u.cpu_policy.cpuid_policy, leaves);
+    set_xen_guest_handle(domctl.u.cpu_policy.leaves, leaves);
     domctl.u.cpu_policy.nr_msrs = nr_msrs;
-    set_xen_guest_handle(domctl.u.cpu_policy.msr_policy, msrs);
+    set_xen_guest_handle(domctl.u.cpu_policy.msrs, msrs);
     domctl.u.cpu_policy.err_leaf = -1;
     domctl.u.cpu_policy.err_subleaf = -1;
     domctl.u.cpu_policy.err_msr = -1;
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 0b41b279507e..944af63e68d0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -54,10 +54,10 @@ static int update_domain_cpu_policy(struct domain *d,
 
     /* Merge the toolstack provided data. */
     if ( (ret = x86_cpuid_copy_from_buffer(
-              new.cpuid, xdpc->cpuid_policy, xdpc->nr_leaves,
+              new.cpuid, xdpc->leaves, xdpc->nr_leaves,
               &err.leaf, &err.subleaf)) ||
          (ret = x86_msr_copy_from_buffer(
-              new.msr, xdpc->msr_policy, xdpc->nr_msrs, &err.msr)) )
+              new.msr, xdpc->msrs, xdpc->nr_msrs, &err.msr)) )
         goto out;
 
     /* Trim any newly-stale out-of-range leaves. */
@@ -1317,20 +1317,20 @@ long arch_do_domctl(
 
     case XEN_DOMCTL_get_cpu_policy:
         /* Process the CPUID leaves. */
-        if ( guest_handle_is_null(domctl->u.cpu_policy.cpuid_policy) )
+        if ( guest_handle_is_null(domctl->u.cpu_policy.leaves) )
             domctl->u.cpu_policy.nr_leaves = CPUID_MAX_SERIALISED_LEAVES;
         else if ( (ret = x86_cpuid_copy_to_buffer(
                        d->arch.cpuid,
-                       domctl->u.cpu_policy.cpuid_policy,
+                       domctl->u.cpu_policy.leaves,
                        &domctl->u.cpu_policy.nr_leaves)) )
             break;
 
         /* Process the MSR entries. */
-        if ( guest_handle_is_null(domctl->u.cpu_policy.msr_policy) )
+        if ( guest_handle_is_null(domctl->u.cpu_policy.msrs) )
             domctl->u.cpu_policy.nr_msrs = MSR_MAX_SERIALISED_ENTRIES;
         else if ( (ret = x86_msr_copy_to_buffer(
                        d->arch.msr,
-                       domctl->u.cpu_policy.msr_policy,
+                       domctl->u.cpu_policy.msrs,
                        &domctl->u.cpu_policy.nr_msrs)) )
             break;
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 3f5b092df16a..3ed7c69f4315 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -411,11 +411,11 @@ long arch_do_sysctl(
         }
 
         /* Process the CPUID leaves. */
-        if ( guest_handle_is_null(sysctl->u.cpu_policy.cpuid_policy) )
+        if ( guest_handle_is_null(sysctl->u.cpu_policy.leaves) )
             sysctl->u.cpu_policy.nr_leaves = CPUID_MAX_SERIALISED_LEAVES;
         else if ( (ret = x86_cpuid_copy_to_buffer(
                        policy->cpuid,
-                       sysctl->u.cpu_policy.cpuid_policy,
+                       sysctl->u.cpu_policy.leaves,
                        &sysctl->u.cpu_policy.nr_leaves)) )
             break;
 
@@ -427,11 +427,11 @@ long arch_do_sysctl(
         }
 
         /* Process the MSR entries. */
-        if ( guest_handle_is_null(sysctl->u.cpu_policy.msr_policy) )
+        if ( guest_handle_is_null(sysctl->u.cpu_policy.msrs) )
             sysctl->u.cpu_policy.nr_msrs = MSR_MAX_SERIALISED_ENTRIES;
         else if ( (ret = x86_msr_copy_to_buffer(
                        policy->msr,
-                       sysctl->u.cpu_policy.msr_policy,
+                       sysctl->u.cpu_policy.msrs,
                        &sysctl->u.cpu_policy.nr_msrs)) )
             break;
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 7280e9f96816..529801c89ba3 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -683,8 +683,8 @@ struct xen_domctl_cpu_policy {
                          * 'cpuid_policy'. */
     uint32_t nr_msrs;   /* IN/OUT: Number of MSRs in/written to
                          * 'msr_policy' */
-    XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* IN/OUT */
-    XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_policy;    /* IN/OUT */
+    XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) leaves; /* IN/OUT */
+    XEN_GUEST_HANDLE_64(xen_msr_entry_t)  msrs;   /* IN/OUT */
 
     /*
      * OUT, set_policy only.  Written in some (but not all) error cases to
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index e8dded9fb94a..2b24d6bfd00e 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1050,8 +1050,8 @@ struct xen_sysctl_cpu_policy {
                            * 'msr_policy', or the maximum number of MSRs if
                            * the guest handle is NULL. */
     uint32_t _rsvd;       /* Must be zero. */
-    XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_policy; /* OUT */
-    XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_policy;    /* OUT */
+    XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) leaves; /* OUT */
+    XEN_GUEST_HANDLE_64(xen_msr_entry_t)  msrs;   /* OUT */
 };
 typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
-- 
2.30.2


