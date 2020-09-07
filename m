Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2F25F869
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 12:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERi-0003d5-Lg; Mon, 07 Sep 2020 10:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERh-0003cB-CA
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:21 +0000
X-Inumbo-ID: 4b450513-54a3-4bae-bc6d-75269621a256
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b450513-54a3-4bae-bc6d-75269621a256;
 Mon, 07 Sep 2020 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8ARSpqL0nd5zsCpnhZnfQ+5vJo5jg5hBQPEsOCe3kQ=;
 b=Ephu8dS2dF54UEybLNMyca9q+9fVYDs7ZT5kH9PZKzUUTCvozZPrlIv+
 W4XiwGDcMEwsiGpSc52z0NIP8OUlVn6Cw3tpF2KQUnr/tewHUrXtDsNJA
 0uCWT+vbXxF0XW9d2O24gowegZ4HU3PZL1nywmhKHDk4hyuFHsULytZAF w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zrx06ZZm3y/d8DXXOyhdwcPXrzwO4yAA2TAXBmb5Z7jVFUyiFFR1vfq2w9WwTFl2Y40jYRjAAL
 9Oa/8rNgX3k2qMr8z5YsM0TQsC8A5rcKUSxxhIr+60Iaawbc1DUyR5mpfSAD38i6T/YNSNuYFk
 ZAxH3wnwoWoZBAFiKbMYuQglf5aHirV0m5S5pp/4jm6ichANZBe/WoT6jXPNAC0QhgM0Z+bLwc
 WZGAxwee7aoBnhZJKyHbZjSdwjqokppnD8vBd5JSVy+XDs0PmyZKz+tMmiFMsC6UgSIe/GLLUp
 uj4=
X-SBRS: 2.7
X-MesageID: 26100626
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26100626"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/5] x86/pv: disallow access to unknown MSRs
Date: Mon, 7 Sep 2020 12:31:41 +0200
Message-ID: <20200907103143.58845-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907103143.58845-1-roger.pau@citrix.com>
References: <20200907103143.58845-1-roger.pau@citrix.com>
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
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Added missing 0x prefix.
---
 xen/arch/x86/pv/emul-priv-op.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index bcc1188f6a..2d9953f5b4 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -972,9 +972,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
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
@@ -1141,14 +1142,15 @@ static int write_msr(unsigned int reg, uint64_t val,
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
+                 "Domain attempted WRMSR 0x%08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
+                 reg, temp, val);
         return X86EMUL_OKAY;
     }
 
-- 
2.28.0


