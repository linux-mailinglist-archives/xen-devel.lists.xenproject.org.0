Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE83258D3B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4Bh-0000eN-DP; Tue, 01 Sep 2020 11:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4Bf-0000V0-Ev
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:51 +0000
X-Inumbo-ID: 5f199d10-49cb-442b-9f02-d3ab43f2ec64
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f199d10-49cb-442b-9f02-d3ab43f2ec64;
 Tue, 01 Sep 2020 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8ARSpqL0nd5zsCpnhZnfQ+5vJo5jg5hBQPEsOCe3kQ=;
 b=DR5CYW7d0mhFqK3eph/ezqb4uJOg8FjrNZ8JxzxCjulG0hdtQl4OdMSY
 Fh1Qh21STokYCUKkdILb1Wu9X3xdn9GtgxKtMiNn3c3HbtF76jonOCMJJ
 Uiay+DdEZKlXtqB1IWV7rYYl9fOudBLFdzYLd50jEVhDW01L+Mcb3AzXG U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TLJWm8NpR2KpPCRtGX1o5O+WTPORA4mgc8Ov6yZt8hRZiz4n0P7cd2AQVHj7+0MDJFiBu8CB1a
 Sd+Ss2oTTmwBvCTFszTXwajMkjAsnEwx/8Wlag95o6N88M+xZX+W6EfIMB2KDiT1FB4ysHugcF
 A7NXuPxoY+lXgn+z+9R317l4p5pA7wkkoVbPC3/J7EG8XypPdCaigNvplgTT8203xeSFoodCj3
 oXX7+D02t+2DTG8XIs1XAmfHlSVaJxiN+CK3UXTpf/onlACZfPLMCFR4wfWpuvi0BA5EoqNcEc
 rJI=
X-SBRS: 2.7
X-MesageID: 26058627
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26058627"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 6/8] x86/pv: disallow access to unknown MSRs
Date: Tue, 1 Sep 2020 12:54:43 +0200
Message-ID: <20200901105445.22277-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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


