Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B927EA33
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721.2454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcQm-00056w-1K; Wed, 30 Sep 2020 13:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721.2454; Wed, 30 Sep 2020 13:46:04 +0000
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
	id 1kNcQl-00056F-Tk; Wed, 30 Sep 2020 13:46:03 +0000
Received: by outflank-mailman (input) for mailman id 721;
 Wed, 30 Sep 2020 13:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcQl-00052v-4d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:46:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1206cba0-a852-4df3-b2b9-f626274909e9;
 Wed, 30 Sep 2020 13:45:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcQl-00052v-4d
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:46:03 +0000
X-Inumbo-ID: 1206cba0-a852-4df3-b2b9-f626274909e9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1206cba0-a852-4df3-b2b9-f626274909e9;
	Wed, 30 Sep 2020 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjwCbNEiAtCg61EY837b6G5uXXMGVuCb608FCmyhoBg=;
  b=SD3NlFu1lBo+YpotcdsTTujCxvM8pkS2h4Zm4xgrGYrIK28kn3bXJw/1
   qZd8Lw8vN7/Gs7rvft1dRvK6HLuAyNMWkUC3vCz7WMRNRIykS6jS2YPcz
   kF04lGkG69Z9VqBDEBW8FBpfmeHkzF3nTl29LlOdMy81NQrfZUjfvJsp6
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TH2UcGYEphdKtwsoYvyNDdY7u52FzEHYlVlR6kZfdbEn9ZNDiF2S7wf7+L262B56OSCDaS4MVq
 CJQBWyspV1dN7bf1oIWYSVpW/k5DQblFq3Fr34fnw6rejh69lStgGAH44LijK04GDGCPP83DYR
 yP+9DqzZ4ftbvDUeQTSMCUQVohvGxzGxGiEzfVSd0fwbV5CwS021cxPSCjlpghDMzG0snLwQq5
 Jm9/2JNZiAFwhkQAMn/vqVR9ESXjgWudm5rXJS03bxFa3xsPZAgyEOcEN7Zof+cR2x/L4Zqogc
 MgA=
X-SBRS: None
X-MesageID: 27971438
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27971438"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] xen/domctl: Simplify DOMCTL_CDF_ checking logic
Date: Wed, 30 Sep 2020 14:42:42 +0100
Message-ID: <20200930134248.4918-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce some local variables to make the resulting logic easier to follow.
Join the two IOMMU checks in sanitise_domain_config().  Tweak some of the
terminology for better accuracy.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c |  7 ++++---
 xen/common/domain.c   | 32 ++++++++++++++++++++------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7e16d49bfd..d8f9be132c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -629,6 +629,7 @@ void arch_vcpu_destroy(struct vcpu *v)
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
+    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     unsigned int max_vcpus;
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -653,13 +654,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( (config->flags & XEN_DOMCTL_CDF_hap) && !hvm_hap_supported() )
+    if ( hap && !hvm_hap_supported() )
     {
-        dprintk(XENLOG_INFO, "HAP requested but not supported\n");
+        dprintk(XENLOG_INFO, "HAP requested but not available\n");
         return -EINVAL;
     }
 
-    if ( !(config->flags & XEN_DOMCTL_CDF_hvm) )
+    if ( !hvm )
         /*
          * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
          * for HVM guests.
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8cfa2e0b6b..cb617dc5aa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -299,6 +299,10 @@ static void _domain_destroy(struct domain *d)
 
 static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
+    bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
+    bool hap = config->flags & XEN_DOMCTL_CDF_hap;
+    bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
+
     if ( config->flags & ~(XEN_DOMCTL_CDF_hvm |
                            XEN_DOMCTL_CDF_hap |
                            XEN_DOMCTL_CDF_s3_integrity |
@@ -310,30 +314,34 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) && config->iommu_opts )
-    {
-        dprintk(XENLOG_INFO,
-                "IOMMU options specified but IOMMU not enabled\n");
-        return -EINVAL;
-    }
-
     if ( config->max_vcpus < 1 )
     {
         dprintk(XENLOG_INFO, "No vCPUS\n");
         return -EINVAL;
     }
 
-    if ( !(config->flags & XEN_DOMCTL_CDF_hvm) &&
-         (config->flags & XEN_DOMCTL_CDF_hap) )
+    if ( hap && !hvm )
     {
         dprintk(XENLOG_INFO, "HAP requested for non-HVM guest\n");
         return -EINVAL;
     }
 
-    if ( (config->flags & XEN_DOMCTL_CDF_iommu) && !iommu_enabled )
+    if ( iommu )
     {
-        dprintk(XENLOG_INFO, "IOMMU is not enabled\n");
-        return -EINVAL;
+        if ( !iommu_enabled )
+        {
+            dprintk(XENLOG_INFO, "IOMMU requested but not available\n");
+            return -EINVAL;
+        }
+    }
+    else
+    {
+        if ( config->iommu_opts )
+        {
+            dprintk(XENLOG_INFO,
+                    "IOMMU options specified but IOMMU not requested\n");
+            return -EINVAL;
+        }
     }
 
     return arch_sanitise_domain_config(config);
-- 
2.11.0


