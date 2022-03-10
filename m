Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C44D41DE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288153.488631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJd-0000zd-34; Thu, 10 Mar 2022 07:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288153.488631; Thu, 10 Mar 2022 07:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDJc-0000pB-Qg; Thu, 10 Mar 2022 07:34:28 +0000
Received: by outflank-mailman (input) for mailman id 288153;
 Thu, 10 Mar 2022 07:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHx9=TV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSDJb-0000ZQ-3d
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:34:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82a45a74-a044-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 08:34:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1561D21110;
 Thu, 10 Mar 2022 07:34:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B505E13FA3;
 Thu, 10 Mar 2022 07:34:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eOz3KgCqKWIkIAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Mar 2022 07:34:24 +0000
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
X-Inumbo-ID: 82a45a74-a044-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646897665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mg0IVeDJK5l+42HD2r55olz6U0rWy21oGjPbgxp9ur4=;
	b=khPMbExQNW9xjF14IZTxqZgnbDDSgRXjgJJ/mufG7YNC7RbZexBaYM4eiAHzQUANUeYx4S
	Uf6BLnB0s1IqXAKPDrxwr3th9oWdeKr5hI4jCKfjXMllo6wJBzsjgEFVxfrDdnWXzFW8Jd
	mkqAryDvQgHq8kRBhRMRU22GRlWZP7U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 02/11] xen: move do_vcpu_op() to arch specific code
Date: Thu, 10 Mar 2022 08:34:11 +0100
Message-Id: <20220310073420.15622-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310073420.15622-1-jgross@suse.com>
References: <20220310073420.15622-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entry point used for the vcpu_op hypercall on Arm is different
from the one on x86 today, as some of the common sub-ops are not
supported on Arm. The Arm specific handler filters out the not
supported sub-ops and then calls the common handler. This leads to the
weird call hierarchy:

  do_arm_vcpu_op()
    do_vcpu_op()
      arch_do_vcpu_op()

Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
of above calls can be avoided without restricting any potential
future use of common sub-ops for Arm.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- don't remove HYPERCALL_ARM()
---
 xen/arch/arm/domain.c                | 15 ++++++++-------
 xen/arch/arm/include/asm/hypercall.h |  2 --
 xen/arch/arm/traps.c                 |  2 +-
 xen/arch/x86/domain.c                | 12 ++++++++----
 xen/arch/x86/include/asm/hypercall.h |  2 +-
 xen/arch/x86/x86_64/domain.c         | 16 ++++++++++++----
 xen/common/compat/domain.c           | 15 ++++++---------
 xen/common/domain.c                  | 12 ++++--------
 xen/include/xen/hypercall.h          |  2 +-
 9 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..2f8eaab7b5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1079,23 +1079,24 @@ void arch_dump_domain_info(struct domain *d)
 }
 
 
-long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
+    struct domain *d = current->domain;
+    struct vcpu *v;
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return -ENOENT;
+
     switch ( cmd )
     {
         case VCPUOP_register_vcpu_info:
         case VCPUOP_register_runstate_memory_area:
-            return do_vcpu_op(cmd, vcpuid, arg);
+            return common_vcpu_op(cmd, v, arg);
         default:
             return -EINVAL;
     }
 }
 
-long arch_do_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
-{
-    return -ENOSYS;
-}
-
 void arch_dump_vcpu_info(struct vcpu *v)
 {
     gic_dump_info(v);
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index 39d2e7889d..fac4d60f17 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -4,8 +4,6 @@
 #include <public/domctl.h> /* for arch_do_domctl */
 int do_arm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg);
-
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index f8c3ef0ca2..deb07784d9 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1380,7 +1380,7 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #endif
     HYPERCALL(multicall, 2),
     HYPERCALL(platform_op, 1),
-    HYPERCALL_ARM(vcpu_op, 3),
+    HYPERCALL(vcpu_op, 3),
     HYPERCALL(vm_assist, 2),
 #ifdef CONFIG_ARGO
     HYPERCALL(argo_op, 5),
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a5048ed654..d566fc82b4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1489,11 +1489,15 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-long
-arch_do_vcpu_op(
-    int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check do_vcpu_op(int cmd, unsigned int vcpuid,
+                         XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
+    struct domain *d = current->domain;
+    struct vcpu *v;
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return -ENOENT;
 
     switch ( cmd )
     {
@@ -1545,7 +1549,7 @@ arch_do_vcpu_op(
     }
 
     default:
-        rc = -ENOSYS;
+        rc = common_vcpu_op(cmd, v, arg);
         break;
     }
 
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 16d8418b57..610c37a0b8 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -145,7 +145,7 @@ compat_physdev_op(
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
 extern int
-arch_compat_vcpu_op(
+compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 extern int cf_check compat_mmuext_op(
diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index c46dccc25a..62fe51ee74 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -13,10 +13,14 @@ CHECK_vcpu_get_physid;
 #undef xen_vcpu_get_physid
 
 int
-arch_compat_vcpu_op(
-    int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    int rc = -ENOSYS;
+    int rc;
+    struct domain *d = current->domain;
+    struct vcpu *v;
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return -ENOENT;
 
     switch ( cmd )
     {
@@ -55,7 +59,11 @@ arch_compat_vcpu_op(
     }
 
     case VCPUOP_get_physid:
-        rc = arch_do_vcpu_op(cmd, v, arg);
+        rc = do_vcpu_op(cmd, vcpuid, arg);
+        break;
+
+    default:
+        rc = compat_common_vcpu_op(cmd, v, arg);
         break;
     }
 
diff --git a/xen/common/compat/domain.c b/xen/common/compat/domain.c
index afae27eeba..1119534679 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -38,15 +38,12 @@ CHECK_vcpu_hvm_context;
 
 #endif
 
-int cf_check compat_vcpu_op(
-    int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
+int compat_common_vcpu_op(int cmd, struct vcpu *v,
+                          XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    struct domain *d = current->domain;
-    struct vcpu *v;
     int rc = 0;
-
-    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
-        return -ENOENT;
+    struct domain *d = current->domain;
+    unsigned int vcpuid = v->vcpu_id;
 
     switch ( cmd )
     {
@@ -103,7 +100,7 @@ int cf_check compat_vcpu_op(
     case VCPUOP_stop_singleshot_timer:
     case VCPUOP_register_vcpu_info:
     case VCPUOP_send_nmi:
-        rc = do_vcpu_op(cmd, vcpuid, arg);
+        rc = common_vcpu_op(cmd, v, arg);
         break;
 
     case VCPUOP_get_runstate_info:
@@ -134,7 +131,7 @@ int cf_check compat_vcpu_op(
     }
 
     default:
-        rc = arch_compat_vcpu_op(cmd, v, arg);
+        rc = -ENOSYS;
         break;
     }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 351029f8b2..f9de1be43c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1570,15 +1570,11 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
-long cf_check do_vcpu_op(
-    int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
+long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    struct domain *d = current->domain;
-    struct vcpu *v;
     long rc = 0;
-
-    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
-        return -ENOENT;
+    struct domain *d = current->domain;
+    unsigned int vcpuid = v->vcpu_id;
 
     switch ( cmd )
     {
@@ -1750,7 +1746,7 @@ long cf_check do_vcpu_op(
     }
 
     default:
-        rc = arch_do_vcpu_op(cmd, v, arg);
+        rc = -ENOSYS;
         break;
     }
 
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 4dfd64cf71..82f7f2caeb 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -110,7 +110,7 @@ do_vcpu_op(
 
 struct vcpu;
 extern long
-arch_do_vcpu_op(int cmd,
+common_vcpu_op(int cmd,
     struct vcpu *v,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-- 
2.34.1


