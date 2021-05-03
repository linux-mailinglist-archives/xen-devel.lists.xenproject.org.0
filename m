Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C057F371820
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121699.229530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldafo-00019q-4m; Mon, 03 May 2021 15:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121699.229530; Mon, 03 May 2021 15:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldafo-00019R-1M; Mon, 03 May 2021 15:39:52 +0000
Received: by outflank-mailman (input) for mailman id 121699;
 Mon, 03 May 2021 15:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldafm-00019M-Uc
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:39:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 335820cc-7388-415e-bf6d-33d452fd8cb8;
 Mon, 03 May 2021 15:39:50 +0000 (UTC)
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
X-Inumbo-ID: 335820cc-7388-415e-bf6d-33d452fd8cb8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w7Xo1CRX6LgQwvrOXLUtnY7XKHYy8vBzRGguf0D0ZzU=;
  b=V05TcB4VfeAvhuszyvDSWlXfCCwBPVr2ixm8fZ6G4uR8nSsn3k5WfUbj
   FNB/6G2wle/pD2af6UTqabFBpFN4P7dhS//xLdvxk8pS2ZF4pBOsvIN1T
   LNYnucFQsXoqRfILqHhA4TCkIOR/LK08BLHqjYKZiys6Uw/C1aYJegStK
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vAYGs1Hij7qrprczXNX/gUlo7yBa9ui7IFjWJMPWCgq/AWEMZ+Euoz2iNLBf7NBIRU3+e9qUsi
 BGNyXhKmtCemdtRJINHLmWFi165SmJDLpzOnkk/UmI6g/C8tVEEN52OI28sAl4pC7c+1UFuiP4
 dRngxbWub4HGWauMHLjZdCQUd8w+b6gCyIliaGyFdSZk3je3Iw7NhCUqLnRfvAX1q47/UyJPJO
 Aqu1N+MkaT6b3Q958vwIoDcvHo3jd5mobTU/RvlQQrXziWw7SrEgCP9VSzX3SdKbVC2ni6udrv
 m7U=
X-SBRS: 5.1
X-MesageID: 43332330
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ECAIYKq21n+vdPLaZJjR6okaV5rUeYIsi2QD101hICF9WMqeis
 yogbAnxQb54Qx8ZFgMu/ClfJOBT3TV6IJv7eAqVouKcQH6tAKTQ71KwpDlx1TbdRHW0uJGz6
 9vf+xfJbTLbWRSqcb/7E2GH807wN+BmZrIuc7kw31gTR5nZshbhm8SZzqzKFF8RwVNGPMCZf
 mhz/dAzgDQHEg/X4CWAWQEQviGh/CjruODXTc2QyQIrCWvoFqTmdzHLyQ=
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43332330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] x86/xstate: Elide redundant writes in set_xcr0()
Date: Mon, 3 May 2021 16:39:34 +0100
Message-ID: <20210503153938.14109-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210503153938.14109-1-andrew.cooper3@citrix.com>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

XSETBV is an expensive instruction as, amongst other things, it involves
reconfiguring the instruction decode at the frontend of the pipeline.

We have several paths which reconfigure %xcr0 in quick succession (the context
switch path has 5, including the fpu save/restore helpers), and only a single
caller takes any care to try to skip redundant writes.

Update set_xcr0() to perform amortisation automatically, and simplify the
__context_switch() path as a consequence.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c |  4 +---
 xen/arch/x86/xstate.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4dc27f798e..50a27197b5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1977,9 +1977,7 @@ static void __context_switch(void)
         memcpy(stack_regs, &n->arch.user_regs, CTXT_SWITCH_STACK_BYTES);
         if ( cpu_has_xsave )
         {
-            u64 xcr0 = n->arch.xcr0 ?: XSTATE_FP_SSE;
-
-            if ( xcr0 != get_xcr0() && !set_xcr0(xcr0) )
+            if ( !set_xcr0(n->arch.xcr0 ?: XSTATE_FP_SSE) )
                 BUG();
 
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3794d9a5a5..f82dae8053 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -55,11 +55,18 @@ static inline bool xsetbv(u32 index, u64 xfeatures)
     return lo != 0;
 }
 
-bool set_xcr0(u64 xfeatures)
+bool set_xcr0(u64 val)
 {
-    if ( !xsetbv(XCR_XFEATURE_ENABLED_MASK, xfeatures) )
-        return false;
-    this_cpu(xcr0) = xfeatures;
+    uint64_t *this_xcr0 = &this_cpu(xcr0);
+
+    if ( *this_xcr0 != val )
+    {
+        if ( !xsetbv(XCR_XFEATURE_ENABLED_MASK, val) )
+            return false;
+
+        *this_xcr0 = val;
+    }
+
     return true;
 }
 
-- 
2.11.0


