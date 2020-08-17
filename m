Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7D4246B98
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXG-00072L-Eb; Mon, 17 Aug 2020 15:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hXE-0006wT-Sr
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:58:56 +0000
X-Inumbo-ID: 2ce9f53b-fa70-4091-9fe2-e08bcbb8e0ef
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ce9f53b-fa70-4091-9fe2-e08bcbb8e0ef;
 Mon, 17 Aug 2020 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QNFt2MaUZcrOOAd88SQa0Ik2DvsRYhMp9yfE1IOX5hU=;
 b=Y1btFBefmPM8R1xh6XGy7YzgfqnRLNmoJQlhrDnXSvUjwcVMkqPPdCQd
 QpM2V4A8c+jhcxHoXIW96HI7vkK8z4VTq+YliykSk7lvrkk/sx4wd0WJO
 Ly5f1kwKo6iaW9IgankPKr7P+l4CWPJlokSBvvY8qxxiUnxlVQpjom2aq w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NU9qgm32sbZAg/M6wZCR814YO56u5+nQkqPxfQY6imYPhVmCJ0901RS9QRLzbmQCFQR3U8r538
 zzhZ+JcpAxA5TCUddnOmWSAVeq36BYI5POJWt4HU+DoCXsyEWfcM0JXqOVbP64+ffpvJ9qDCTn
 PnF+c10//W6bOXIUtKENaPf+SJQJWfCS6R0JDFa7FMGLygthS+gewHlkkDssWmCpQxFg+gfnrq
 oN95CG2eSDgr4UXyXRvoe1pu4T3oBUEIa+tAYcfoMLZNVXraa1pcnEbOh+YhxA+dK7WaWmXnbB
 WfY=
X-SBRS: 2.7
X-MesageID: 25616946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="25616946"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 7/8] x86/pv: disallow access to unknown MSRs
Date: Mon, 17 Aug 2020 17:57:56 +0200
Message-ID: <20200817155757.3372-8-roger.pau@citrix.com>
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

Change the catch-all behavior for MSR not explicitly handled. Instead
of allow full read-access to the MSR space and silently dropping
writes return an exception when the MSR is not explicitly handled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 76c878b677..fcbcf5a6c2 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -976,9 +976,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        break;
+
     normal:
-        /* Everyone can read the MSR space. */
-        /* gdprintk(XENLOG_WARNING, "Domain attempted RDMSR %08x\n", reg); */
         if ( rdmsr_safe(reg, *val) )
             break;
         return X86EMUL_OKAY;
@@ -1143,14 +1144,15 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        if ( rdmsr_safe(reg, temp) )
-            break;
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 reg, val);
+        break;
 
-        if ( val != temp )
     invalid:
-            gdprintk(XENLOG_WARNING,
-                     "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
-                     reg, temp, val);
+        gdprintk(XENLOG_WARNING,
+                 "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
+                 reg, temp, val);
         return X86EMUL_OKAY;
     }
 
-- 
2.28.0


