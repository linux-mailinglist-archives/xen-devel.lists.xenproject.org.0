Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42EB246B99
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXJ-00073u-Q7; Mon, 17 Aug 2020 15:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hXI-00073P-I6
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:59:00 +0000
X-Inumbo-ID: 9fb2d8e2-3995-469b-9d84-57708e00eb6e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb2d8e2-3995-469b-9d84-57708e00eb6e;
 Mon, 17 Aug 2020 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKzK+c5XyV+OLEz6QG9xmudgjXWSKUFpmUQMfU+3bSg=;
 b=ONUltRMm0RQNSBw4pXTqbQa58Cdkd38XqtVsFcltvWEfJGZMMS0zQ5kK
 xM6Hw1Kx+VvUSM18YRkIs/TrYu8A4iXYdzKwznLsVt8dIpWzpIryes3ev
 7cuKPv/7FKLfIzewVNfcvt3cFdeWW4PWyCCSsMxH0N3syyeLGHK/p1QCU c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vNnOf95SAcM0GK1/8PeZCJTmEGsEhWMOICD6AbiaziiIqB7OFH3eW9QOojO4AiD/kmTT8dYbQL
 lWn+rCwGlyAb04YtphdWOcto2QHQtipIv29JNtViI/HMfWlBeHPfyYbjOLDElT2sAQXPJhHLJs
 1lwZs975dYvQ2yl1QS1+9f4rK9fhTIhzH0UQNrbVIM87wd1ibaz85X9BFActm/o9ny1K4Clgrp
 OtCCk1zq0Ag+zFdAO+GO+y80bf8vBaEl9jexT5BgAGJH+ZOqeZiFwIe/liEvF4cKL7aYfS88Bq
 v+U=
X-SBRS: 2.7
X-MesageID: 24673328
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24673328"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] x86/pv: handle writes to the EFER MSR
Date: Mon, 17 Aug 2020 17:57:52 +0200
Message-ID: <20200817155757.3372-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Silently drop writes to the EFER MSR for PV guests if the value is not
changed from what it's being reported. Current PV Linux will attempt
to write to the MSR with the same value that's been read, and raising
a fault will result in a guest crash.

As part of this work introduce a helper to easily get the EFER value
reported to guests.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 35 ++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index efeb2a727e..fd3cbfaebc 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -837,6 +837,23 @@ static inline bool is_cpufreq_controller(const struct domain *d)
             is_hardware_domain(d));
 }
 
+static uint64_t guest_efer(const struct domain *d)
+{
+    uint64_t val;
+
+    /* Hide unknown bits, and unconditionally hide SVME from guests. */
+    val = read_efer() & EFER_KNOWN_MASK & ~EFER_SVME;
+    /*
+     * Hide the 64-bit features from 32-bit guests.  SCE has
+     * vendor-dependent behaviour.
+     */
+    if ( is_pv_32bit_domain(d) )
+        val &= ~(EFER_LME | EFER_LMA |
+                 (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
+                  ? EFER_SCE : 0));
+    return val;
+}
+
 static int read_msr(unsigned int reg, uint64_t *val,
                     struct x86_emulate_ctxt *ctxt)
 {
@@ -880,16 +897,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
         return X86EMUL_OKAY;
 
     case MSR_EFER:
-        /* Hide unknown bits, and unconditionally hide SVME from guests. */
-        *val = read_efer() & EFER_KNOWN_MASK & ~EFER_SVME;
-        /*
-         * Hide the 64-bit features from 32-bit guests.  SCE has
-         * vendor-dependent behaviour.
-         */
-        if ( is_pv_32bit_domain(currd) )
-            *val &= ~(EFER_LME | EFER_LMA |
-                      (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL
-                       ? EFER_SCE : 0));
+        *val = guest_efer(currd);
         return X86EMUL_OKAY;
 
     case MSR_K7_FID_VID_CTL:
@@ -1005,6 +1013,13 @@ static int write_msr(unsigned int reg, uint64_t val,
         curr->arch.pv.gs_base_user = val;
         return X86EMUL_OKAY;
 
+    case MSR_EFER:
+        /* Silently drop writes that don't change the reported value. */
+        temp = guest_efer(currd);
+        if ( val != temp )
+            goto invalid;
+        return X86EMUL_OKAY;
+
     case MSR_K7_FID_VID_STATUS:
     case MSR_K7_FID_VID_CTL:
     case MSR_K8_PSTATE_LIMIT:
-- 
2.28.0


