Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F492FAE0D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 01:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70079.125721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ewk-0001VU-Fx; Tue, 19 Jan 2021 00:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70079.125721; Tue, 19 Jan 2021 00:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ewk-0001V7-Cn; Tue, 19 Jan 2021 00:32:34 +0000
Received: by outflank-mailman (input) for mailman id 70079;
 Tue, 19 Jan 2021 00:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1ewj-0001V2-Pf
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 00:32:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a10339c7-ef15-40f6-9935-0b4572162fe2;
 Tue, 19 Jan 2021 00:32:32 +0000 (UTC)
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
X-Inumbo-ID: a10339c7-ef15-40f6-9935-0b4572162fe2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611016352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=16eafu996KkLHK2PLmSPD9wKUTun6plqrvEh4QZt+sA=;
  b=DbXrrKctrnHoOTeEeXqHiF+sr76WHZQNdq8jeFbUKMaBSpiDjR1rn3gD
   TwDgyHS9sCzpsAV5xvD7lpX6uuPz324FWl/SRmG4Hi0h5Nie7iq9mxgPq
   qpqElPPIzlN4DWBwBCx39Imhr4P4yHv2/qI5iCpi5MZDLcIpZSfe5ee+J
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HXY1jBmA1lDmdmpERs5Tk/+GrXeDVf2i2btJQ8AUKnDWSvCgbK1sSk9qqS3f1mu3sv0Mq5B8L9
 a5QVOP0lXyzx3ucml1AHv9mhqqe3vB2Jadhu2a7DjsaxLklebwQmAUyhE585zD1aepkAv964+N
 bfhDU1G1yOBvLX5QXMh9nQTj1pEWVp3g+jL3FmAfERKlbNJnA5gpR2H7ZkY66AaQsfZXmyb2Hc
 hAOPdMGgSl4YikbgP+joqGDOOfa4OyymDZZga/M1NNr5ZSChqz8cJ/hU62OfVqhqw3mWhPqR3O
 AvE=
X-SBRS: 5.1
X-MesageID: 35321214
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35321214"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/domain: Introduce vcpu_teardown()
Date: Tue, 19 Jan 2021 00:32:06 +0000
Message-ID: <20210119003206.2255-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Similarly to c/s 98d4d6d8a6 "xen/domain: Introduce domain_teardown()",
introduce a common mechanism for restartable per-vcpu teardown logic.

Extend the PROGRESS() mechanism to support saving and restoring the vcpu loop
variable across hypercalls.

This will eventually supersede domain_reliquish_resources(), and reduce the
quantity of redundant logic performed.

No functional change (yet).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

This is a prerequisite for the IPT series, to avoid introducing a latent
memory leak bug on ARM.
---
 xen/common/domain.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 xen/include/xen/sched.h |  1 +
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 164c9d14e9..7be3a7cf36 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -130,6 +130,22 @@ static void vcpu_info_reset(struct vcpu *v)
     v->vcpu_info_mfn = INVALID_MFN;
 }
 
+/*
+ * Release resources held by a vcpu.  There may or may not be live references
+ * to the vcpu, and it may or may not be fully constructed.
+ *
+ * If d->is_dying is DOMDYING_dead, this must not return non-zero.
+ */
+static int vcpu_teardown(struct vcpu *v)
+{
+    return 0;
+}
+
+/*
+ * Destoy a vcpu once all references to it have been dropped.  Used either
+ * from domain_destroy()'s RCU path, or from the vcpu_create() error path
+ * before the vcpu is placed on the domain's vcpu list.
+ */
 static void vcpu_destroy(struct vcpu *v)
 {
     free_vcpu_struct(v);
@@ -206,6 +222,11 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     sched_destroy_vcpu(v);
  fail_wq:
     destroy_waitqueue_vcpu(v);
+
+    /* Must not hit a continuation in this context. */
+    if ( vcpu_teardown(v) )
+        ASSERT_UNREACHABLE();
+
     vcpu_destroy(v);
 
     return NULL;
@@ -284,6 +305,9 @@ custom_param("extra_guest_irqs", parse_extra_guest_irqs);
  */
 static int domain_teardown(struct domain *d)
 {
+    struct vcpu *v;
+    int rc;
+
     BUG_ON(!d->is_dying);
 
     /*
@@ -298,7 +322,9 @@ static int domain_teardown(struct domain *d)
          * will logically restart work from this point.
          *
          * PROGRESS() markers must not be in the middle of loops.  The loop
-         * variable isn't preserved across a continuation.
+         * variable isn't preserved across a continuation.  PROGRESS_VCPU()
+         * markers may be used in the middle of for_each_vcpu() loops, which
+         * preserve v but no other loop variables.
          *
          * To avoid redundant work, there should be a marker before each
          * function which may return -ERESTART.
@@ -308,14 +334,32 @@ static int domain_teardown(struct domain *d)
         /* Fallthrough */                       \
     case PROG_ ## x
 
+#define PROGRESS_VCPU(x)                        \
+        d->teardown.val = PROG_vcpu_ ## x;      \
+        d->teardown.ptr = v;                    \
+        /* Fallthrough */                       \
+    case PROG_vcpu_ ## x:                       \
+        v = d->teardown.ptr
+
         enum {
-            PROG_done = 1,
+            PROG_vcpu_teardown = 1,
+            PROG_done,
         };
 
     case 0:
+        for_each_vcpu ( d, v )
+        {
+            PROGRESS_VCPU(teardown);
+
+            rc = vcpu_teardown(v);
+            if ( rc )
+                return rc;
+        }
+
     PROGRESS(done):
         break;
 
+#undef PROGRESS_VCPU
 #undef PROGRESS
 
     default:
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3e46384a3c..846a77c0bb 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -532,6 +532,7 @@ struct domain
      */
     struct {
         unsigned int val;
+        struct vcpu *ptr;
     } teardown;
 };
 
-- 
2.11.0


