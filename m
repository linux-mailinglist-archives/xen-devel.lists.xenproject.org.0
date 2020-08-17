Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF4246B9A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXL-00074o-5d; Mon, 17 Aug 2020 15:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hXJ-0006wT-Sw
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:59:01 +0000
X-Inumbo-ID: 551aade9-e5df-4280-bab1-3b1202ef45fb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 551aade9-e5df-4280-bab1-3b1202ef45fb;
 Mon, 17 Aug 2020 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zm6CDp60sdpOC6MU+Y+DF2KHVDov78uXMXqCCpLuKMs=;
 b=E3oNFcGvuMpNqM8mati3jDOuaPfWMRgGwMGpLWvxO8bT88bs/A5XvOo0
 kp2Bo2S8UtU76iq1ZufDi5cuMARO7KvkILX1mOoHI40XUwDOjsSuKYczZ
 Cm07DwOhDSWVW6720AfKumhMunS2Z/A9/hDNEC32no3JyI8qpMu916Eov 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xRY3ODaR/rhILx0O16Ymd5cRTkcJdHgHNk2/O8X99L80H2uGHJaNIY5Er1Kp9nHBgIAxlbpyGE
 1xcLS49aAruDzvKS6YYaWRDyopZekLW2Q9Tymuhy5bTiiHvhObwnUTYGcuLNg6HKFvaofM/jYa
 HHDWf4mefgck8v0iTCOAbx4qGvylS5zbzZDPOAaD/JvizTp/XI2BAXx6EZav6CsBiNBx2rRtTW
 92+BG6LrQBkJwxW1EGaqiOEA0FJD6mdUEe22ta+jut0ZyzI9w03Airrri/bCkJ2Kv9WxEXxbLR
 R48=
X-SBRS: 2.7
X-MesageID: 24850037
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24850037"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 8/8] x86/hvm: Disallow access to unknown MSRs
Date: Mon, 17 Aug 2020 17:57:57 +0200
Message-ID: <20200817155757.3372-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Andrew Cooper <andrew.cooper3@citrix.com>

Change the catch-all behavior for MSR not explicitly handled. Instead
of allow full read-access to the MSR space and silently dropping
writes return an exception when the MSR is not explicitly handled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c | 11 ++++-------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 671cdcb724..076fa67138 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1959,6 +1959,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
 
@@ -2140,10 +2141,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
-        /* Match up with the RDMSR side; ultimately this should go away. */
-        if ( rdmsr_safe(msr, msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 msr, msr_content);
         goto gpf;
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index fbfb31af05..800066da7d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3024,9 +3024,7 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
-        if ( rdmsr_safe(msr, *msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
 
@@ -3329,10 +3327,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
-        /* Match up with the RDMSR side; ultimately this should go away. */
-        if ( rdmsr_safe(msr, msr_content) == 0 )
-            break;
-
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 msr, msr_content);
         goto gp_fault;
     }
 
-- 
2.28.0


