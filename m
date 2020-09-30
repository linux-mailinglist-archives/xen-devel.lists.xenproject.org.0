Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512A27EA2B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714.2419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcOt-0004cr-SJ; Wed, 30 Sep 2020 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714.2419; Wed, 30 Sep 2020 13:44:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcOt-0004c6-O0; Wed, 30 Sep 2020 13:44:07 +0000
Received: by outflank-mailman (input) for mailman id 714;
 Wed, 30 Sep 2020 13:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcOs-0004XG-M4
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:06 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a22d1d71-d2b5-4b7d-be5f-3cba54ee3e0c;
 Wed, 30 Sep 2020 13:44:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcOs-0004XG-M4
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:44:06 +0000
X-Inumbo-ID: a22d1d71-d2b5-4b7d-be5f-3cba54ee3e0c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a22d1d71-d2b5-4b7d-be5f-3cba54ee3e0c;
	Wed, 30 Sep 2020 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPZHvV7WercRVJvbGr8hSw3MlS+5rPwGf4cgVL7SwpY=;
  b=RI/wbZzp7gqW3EIUxIASZMXvRGKTEgU5d2ZBtFPr8Bm3X5QD8plSJ+eG
   DgfS/hak0S9prGa7cZg6xUfjOyKnIsljC/Pw1IPioKl8mPb66ZnnqSD7a
   kFZEAZhLDWtL6Vm9itDzeUaBVGjsr5TISx92y43iHMNVNMHB9/fo5HQwV
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: a6x58zNrPSi7fF0Odnji6cHgo3gjdaHN/R9Iwjt3tGJ8sOvFYpkKZG31dpV01LURqicrzQmN8G
 5BanRU9OgXtAzlGGeMrid+9FnPA7N7T9RP+zWOc18fE+ZKK86YUFeo1492bcjXpvjjUULfYETE
 Ll6LzkdtiKEayVR/+yja9uBH6AB9CWCSLDEO+kAVUQ9Hv/vzuvTOFzXsqyAht7/QQ0sSmIOSpM
 IyR0Oc66yWxvyoVap87d8T6mCQOU3UByXBE0MsRVEMBe9kQAGKD9enywGPpmrz8HZxMMQyegqC
 UVk=
X-SBRS: None
X-MesageID: 28300090
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28300090"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 5/8] x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM
Date: Wed, 30 Sep 2020 14:42:45 +0100
Message-ID: <20200930134248.4918-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With XEN_DOMCTL_CDF_nested_virt now passed properly to domain_create(),
reimplement nestedhvm_enabled() to use the property which is fixed for the
lifetime of the domain.

This makes the call to nestedhvm_vcpu_initialise() from hvm_vcpu_initialise()
no longer dead.  It became logically dead with the Xend => XL transition, as
they initialise HVM_PARAM_NESTEDHVM in opposite orders with respect to
XEN_DOMCTL_max_vcpus.

There is one opencoded user of nestedhvm_enabled() in HVM_PARAM_ALTP2M's
safety check.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

The redunction in complexity of nestedhvm_enabled() has a substantial effect:

  add/remove: 1/0 grow/shrink: 2/37 up/down: 669/-2095 (-1426)
---
 tools/libxl/libxl_x86.c             |  5 -----
 xen/arch/x86/hvm/hvm.c              | 33 ++++-----------------------------
 xen/include/asm-x86/hvm/nestedhvm.h |  5 ++---
 xen/include/public/hvm/params.h     |  4 +---
 4 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index 7d95506e00..72777fcaad 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -428,11 +428,6 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
             LOG(ERROR, "Couldn't set HVM_PARAM_TIMER_MODE");
             goto out;
         }
-        if (xc_hvm_param_set(xch, domid, HVM_PARAM_NESTEDHVM,
-                             libxl_defbool_val(info->nested_hvm))) {
-            LOG(ERROR, "Couldn't set HVM_PARAM_NESTEDHVM");
-            goto out;
-        }
         if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, altp2m)) {
             LOG(ERROR, "Couldn't set HVM_PARAM_ALTP2M");
             goto out;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2dfda93e09..101a739952 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4086,6 +4086,7 @@ static int hvm_allow_set_param(struct domain *d,
     case HVM_PARAM_MEMORY_EVENT_CR3:
     case HVM_PARAM_MEMORY_EVENT_CR4:
     case HVM_PARAM_MEMORY_EVENT_INT3:
+    case HVM_PARAM_NESTEDHVM:
     case HVM_PARAM_MEMORY_EVENT_SINGLE_STEP:
     case HVM_PARAM_BUFIOREQ_EVTCHN:
     case HVM_PARAM_MEMORY_EVENT_MSR:
@@ -4204,39 +4205,12 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     case HVM_PARAM_ACPI_IOPORTS_LOCATION:
         rc = pmtimer_change_ioport(d, value);
         break;
-    case HVM_PARAM_NESTEDHVM:
-        rc = xsm_hvm_param_nested(XSM_PRIV, d);
-        if ( rc )
-            break;
-        if ( value > 1 )
-            rc = -EINVAL;
-        /*
-         * Remove the check below once we have
-         * shadow-on-shadow.
-         */
-        if ( !paging_mode_hap(d) && value )
-            rc = -EINVAL;
-        if ( value &&
-             d->arch.hvm.params[HVM_PARAM_ALTP2M] )
-            rc = -EINVAL;
-        /* Set up NHVM state for any vcpus that are already up. */
-        if ( value &&
-             !d->arch.hvm.params[HVM_PARAM_NESTEDHVM] )
-            for_each_vcpu(d, v)
-                if ( rc == 0 )
-                    rc = nestedhvm_vcpu_initialise(v);
-        if ( !value || rc )
-            for_each_vcpu(d, v)
-                nestedhvm_vcpu_destroy(v);
-        break;
     case HVM_PARAM_ALTP2M:
         rc = xsm_hvm_param_altp2mhvm(XSM_PRIV, d);
         if ( rc )
             break;
-        if ( value > XEN_ALTP2M_limited )
-            rc = -EINVAL;
-        if ( value &&
-             d->arch.hvm.params[HVM_PARAM_NESTEDHVM] )
+        if ( (value > XEN_ALTP2M_limited) ||
+             (value && nestedhvm_enabled(d)) )
             rc = -EINVAL;
         break;
     case HVM_PARAM_TRIPLE_FAULT_REASON:
@@ -4390,6 +4364,7 @@ static int hvm_allow_get_param(struct domain *d,
     case HVM_PARAM_MEMORY_EVENT_CR3:
     case HVM_PARAM_MEMORY_EVENT_CR4:
     case HVM_PARAM_MEMORY_EVENT_INT3:
+    case HVM_PARAM_NESTEDHVM:
     case HVM_PARAM_MEMORY_EVENT_SINGLE_STEP:
     case HVM_PARAM_BUFIOREQ_EVTCHN:
     case HVM_PARAM_MEMORY_EVENT_MSR:
diff --git a/xen/include/asm-x86/hvm/nestedhvm.h b/xen/include/asm-x86/hvm/nestedhvm.h
index d9784a2e0b..385cb708a3 100644
--- a/xen/include/asm-x86/hvm/nestedhvm.h
+++ b/xen/include/asm-x86/hvm/nestedhvm.h
@@ -34,10 +34,9 @@ enum nestedhvm_vmexits {
 };
 
 /* Nested HVM on/off per domain */
-static always_inline bool nestedhvm_enabled(const struct domain *d)
+static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return is_hvm_domain(d) && d->arch.hvm.params &&
-        d->arch.hvm.params[HVM_PARAM_NESTEDHVM];
+    return d->options & XEN_DOMCTL_CDF_nested_virt;
 }
 
 /* Nested VCPU */
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0a91bfa749..0e3fdca096 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -34,6 +34,7 @@
 #define HVM_PARAM_MEMORY_EVENT_CR3          21
 #define HVM_PARAM_MEMORY_EVENT_CR4          22
 #define HVM_PARAM_MEMORY_EVENT_INT3         23
+#define HVM_PARAM_NESTEDHVM                 24
 #define HVM_PARAM_MEMORY_EVENT_SINGLE_STEP  25
 #define HVM_PARAM_BUFIOREQ_EVTCHN           26
 #define HVM_PARAM_MEMORY_EVENT_MSR          30
@@ -232,9 +233,6 @@
  */
 #define HVM_PARAM_ACPI_IOPORTS_LOCATION 19
 
-/* Boolean: Enable nestedhvm (hvm only) */
-#define HVM_PARAM_NESTEDHVM    24
-
 /* Params for the mem event rings */
 #define HVM_PARAM_PAGING_RING_PFN   27
 #define HVM_PARAM_MONITOR_RING_PFN  28
-- 
2.11.0


