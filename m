Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4D6CF4C4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516349.800333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcls-00068R-Ez; Wed, 29 Mar 2023 20:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516349.800333; Wed, 29 Mar 2023 20:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcls-00065G-BF; Wed, 29 Mar 2023 20:51:52 +0000
Received: by outflank-mailman (input) for mailman id 516349;
 Wed, 29 Mar 2023 20:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclq-0005Jv-FS
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 857fb6f4-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:47 +0200 (CEST)
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
X-Inumbo-ID: 857fb6f4-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NckHj1O1Qja849d/pT2PCkOTAN3iToXm4XGv0xmEyS8=;
  b=HFN8tIsJytnxUayhDlBj3vW+4/qFhPiKG9+36XlvaPcLjGvAeBqrj1md
   MdOy0Nt/BImSjm0OoV9qZw6eWR9zleF6b2L48JEe3hGqcfz+JftR8qjkK
   xq/5ZbvE74+ttjVjre5ZfGw+YJLa0nQibx+l7MYe7DrBh6qigNhjNbkp7
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103989104
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TZsNV6o8SvieYHrMeBzHW+6GGmFeBmJiZRIvgKrLsJaIsI4StFCzt
 garIBnUPf7bYGqgKt4iPIu//UkH6pXXm9E1Gwo9/i9gFitB+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzShNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB0cZzO7v++H+YLlZe5NhOQ6E5OzLbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 juepDWpU0hCaLRzzxKf60+Tt+qMtxijBoQ/D+Sx7/VnvmCckzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMo8tDAmLk+vyv/EPlkMayVl+KvQSDJl
 mXiQDcFu1kDsSIa//zlogGW02Lw+sihoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTY28Cq6LMIoQPPCdkTNrGgk0PSZ8OEiz+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dg5acCdnXcmu8qS6tIere2JbJY3oMNeJqZtJRmCvt/09ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:K7L9SKAYyv0KMVflHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103989104"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/9] x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr_policy} fields
Date: Wed, 29 Mar 2023 21:51:30 +0100
Message-ID: <20230329205137.323253-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These weren't great names to begin with, and using {leaves,msrs} matches up
better with the existing nr_{leaves,msr} parameters anyway.

Furthermore,by renaming these fields we can get away with using some #define
trickary to avoid the struct {cpuid,msr}_policy merge needing to happen in a
single changeset.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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


