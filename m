Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28410441D4E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219244.379989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6v-000184-SH; Mon, 01 Nov 2021 15:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219244.379989; Mon, 01 Nov 2021 15:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6v-00012A-MS; Mon, 01 Nov 2021 15:20:33 +0000
Received: by outflank-mailman (input) for mailman id 219244;
 Mon, 01 Nov 2021 15:20:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6t-0008DB-Ne
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ddb02c-3b27-11ec-8548-12813bfff9fa;
 Mon, 01 Nov 2021 15:20:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C13451FD6F;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7674813A4A;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yC+XG7MFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:19 +0000
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
X-Inumbo-ID: 38ddb02c-3b27-11ec-8548-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XG67DS83CIrGacinsOg2WG7ocvVLz9fjlKD5/7+q6zE=;
	b=MEYMGdotgZGdwNeV33M7fDE8Z2Ac60uaX702ELKddiZUiSSQ4WKo5WOnA2XVkDDAjm1WpI
	RwpmVr5CZeuPenjV6ltmKotw1+C5qSS37k8pBOTo2ivTdblxL07zS/QBjQ5PDjdOn4Drzo
	S55G5hUoyCguRv8C4l0e8UNsTF2mu0s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/15] xen: move do_vcpu_op() to arch specific code
Date: Mon,  1 Nov 2021 16:20:02 +0100
Message-Id: <20211101152015.28488-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today Arm is using another entry point for the vcpu_op hypercall as
x86, as some of the common sub-ops are not supported on Arm. The Arm
specific handler filetrs out the not supported sub-ops and then calls
the common handler. This leads to the weird call hierarchy:

  do_arm_vcpu_op()
    do_vcpu_op()
      arch_do_vcpu_op()

Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
of above calls can be avoided without restricting any potential
future use of common sub-ops for Arm.

Additionally the single user of HYPERCALL_ARM() can be modified and
HYPERCALL_ARM() can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/domain.c           | 15 ++++++++-------
 xen/arch/arm/traps.c            |  7 +------
 xen/arch/x86/domain.c           | 11 +++++++----
 xen/arch/x86/x86_64/domain.c    | 16 ++++++++++++----
 xen/common/compat/domain.c      | 14 ++++++--------
 xen/common/domain.c             | 11 ++++-------
 xen/include/asm-arm/hypercall.h |  2 --
 xen/include/asm-x86/hypercall.h |  2 +-
 xen/include/xen/hypercall.h     |  2 +-
 9 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b23550..691a14277e 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1074,23 +1074,24 @@ void arch_dump_domain_info(struct domain *d)
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
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fb..7abc28848e 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1351,11 +1351,6 @@ typedef struct {
         .nr_args = _nr_args,                                         \
     }
 
-#define HYPERCALL_ARM(_name, _nr_args)                        \
-    [ __HYPERVISOR_ ## _name ] =  {                                  \
-        .fn = (arm_hypercall_fn_t) &do_arm_ ## _name,                \
-        .nr_args = _nr_args,                                         \
-    }
 /*
  * Only use this for hypercalls which were deprecated (i.e. replaced
  * by something else) before Xen on ARM was created, i.e. *not* for
@@ -1386,7 +1381,7 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #endif
     HYPERCALL(multicall, 2),
     HYPERCALL(platform_op, 1),
-    HYPERCALL_ARM(vcpu_op, 3),
+    HYPERCALL(vcpu_op, 3),
     HYPERCALL(vm_assist, 2),
 #ifdef CONFIG_ARGO
     HYPERCALL(argo_op, 5),
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..e1440ec2f5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1488,11 +1488,14 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-long
-arch_do_vcpu_op(
-    int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
+    struct domain *d = current->domain;
+    struct vcpu *v;
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return -ENOENT;
 
     switch ( cmd )
     {
@@ -1544,7 +1547,7 @@ arch_do_vcpu_op(
     }
 
     default:
-        rc = -ENOSYS;
+        rc = common_vcpu_op(cmd, v, arg);
         break;
     }
 
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
index 98b8c15cea..1119534679 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -38,14 +38,12 @@ CHECK_vcpu_hvm_context;
 
 #endif
 
-int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
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
@@ -102,7 +100,7 @@ int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) ar
     case VCPUOP_stop_singleshot_timer:
     case VCPUOP_register_vcpu_info:
     case VCPUOP_send_nmi:
-        rc = do_vcpu_op(cmd, vcpuid, arg);
+        rc = common_vcpu_op(cmd, v, arg);
         break;
 
     case VCPUOP_get_runstate_info:
@@ -133,7 +131,7 @@ int compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) ar
     }
 
     default:
-        rc = arch_compat_vcpu_op(cmd, v, arg);
+        rc = -ENOSYS;
         break;
     }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..8eb36fe714 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1559,14 +1559,11 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     return rc;
 }
 
-long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
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
@@ -1736,7 +1733,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
     }
 
     default:
-        rc = arch_do_vcpu_op(cmd, v, arg);
+        rc = -ENOSYS;
         break;
     }
 
diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/asm-arm/hypercall.h
index a0c5a31a2f..9fd13c6b2c 100644
--- a/xen/include/asm-arm/hypercall.h
+++ b/xen/include/asm-arm/hypercall.h
@@ -4,8 +4,6 @@
 #include <public/domctl.h> /* for arch_do_domctl */
 int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg);
-
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 5d394d4923..e614f7c78c 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -152,7 +152,7 @@ compat_physdev_op(
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
 extern int
-arch_compat_vcpu_op(
+compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 extern int compat_mmuext_op(
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 07b10ec230..30558d3c61 100644
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
2.26.2


