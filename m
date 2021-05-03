Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE8371821
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121701.229554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaft-0001ES-Rl; Mon, 03 May 2021 15:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121701.229554; Mon, 03 May 2021 15:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaft-0001Df-Nt; Mon, 03 May 2021 15:39:57 +0000
Received: by outflank-mailman (input) for mailman id 121701;
 Mon, 03 May 2021 15:39:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldafr-00019M-Qf
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:39:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3bbfcf4-ecb2-4c99-a13a-5e390c53d09e;
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
X-Inumbo-ID: c3bbfcf4-ecb2-4c99-a13a-5e390c53d09e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UBDI32eRY/hcnx9jebSRvWF1wyrbcX7Hg6wiMTv7Ipw=;
  b=S8dCWq2rP7/xXKspjjOofl+wDIrtDuFJQLS8Hk6HU38vHvzkiyA+sLwJ
   sN07PFNNkPZ1RmeOR6/LEKzucLuw+eS8fvOan78RU9IKbMDd56Bx1auA3
   8YmqwN7RlAfJb/69VjrNucZH9Pku+4cJZ3Wpl0j6tajNwbxyFxbqr7SCO
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: H5HLuDGyqEByLnCPYbYjLdx7mfF/ERASTva30yvuQ1iok75tvfyaLNmFDOJjcdrg22kapJlzVo
 /DYx6XvBIdcuSXrsWC2CXKgZhZxazfprOKt5dQJz0I1bNkUPTPNQvfw2zrPiN7b+3OEUuUAmYo
 0MkXfJgzwAeV8myO2Kx6f7EqhHyjn6qTUc9mdRVk8FsUxNRXBKZkMNicsQxj1HdFoAfUvv5+VF
 YdqFWwptXKqRhyk06x/iJkSd9+S4a7zYPcFkLhITqW6X+uOX6QhwuT+79ahopfezdA9puN9XoA
 oDg=
X-SBRS: 5.1
X-MesageID: 43332332
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KLSibKFGXtC7fUmdpLqEF8eALOonbusQ8zAX/mp2TgFYddHdqt
 C2kJ0guSPcpRQwfDUbmd6GMLSdWn+0z/VIyKQYILvKZmbbkUSyKoUK1+Xf6hntATf3+OIY9Y
 oISchDIfnxCVQ/ssrg+gm/FL8boeWvy6yjiefAw3oFd2gDAcxdxj1kAQWWGFAefngkObMFEv
 Onl696jgvlVXMLbtmqQlkpNtKzw+HjpdbdT1orJzNP0njtsQ+V
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43332332"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] x86/cpuid: Simplify recalculate_xstate()
Date: Mon, 3 May 2021 16:39:37 +0100
Message-ID: <20210503153938.14109-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210503153938.14109-1-andrew.cooper3@citrix.com>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Make use of the new xstate_uncompressed_size() helper rather than maintaining
the running calculation while accumulating feature components.

The rest of the CPUID data can come direct from the raw cpuid policy.  All
per-component data forms an ABI through the behaviour of the X{SAVE,RSTOR}*
instructions, and are constant.

Use for_each_set_bit() rather than opencoding a slightly awkward version of
it.  Mask the attributes in ecx down based on the visible features.  This
isn't actually necessary for any components or attributes defined at the time
of writing (up to AMX), but is added out of an abundance of caution.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Using min() in for_each_set_bit() leads to awful code generation, as it
prohibits the optimiations for spotting that the bitmap is <= BITS_PER_LONG.
As p->xstate is long enough already, use a BUILD_BUG_ON() instead.
---
 xen/arch/x86/cpuid.c | 52 +++++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 752bf244ea..c7f8388e5d 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -154,8 +154,7 @@ static void sanitise_featureset(uint32_t *fs)
 static void recalculate_xstate(struct cpuid_policy *p)
 {
     uint64_t xstates = XSTATE_FP_SSE;
-    uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
-    unsigned int i, Da1 = p->xstate.Da1;
+    unsigned int i, ecx_bits = 0, Da1 = p->xstate.Da1;
 
     /*
      * The Da1 leaf is the only piece of information preserved in the common
@@ -167,61 +166,44 @@ static void recalculate_xstate(struct cpuid_policy *p)
         return;
 
     if ( p->basic.avx )
-    {
         xstates |= X86_XCR0_YMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_YMM_POS] +
-                          xstate_sizes[X86_XCR0_YMM_POS]);
-    }
 
     if ( p->feat.mpx )
-    {
         xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
-                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
-    }
 
     if ( p->feat.avx512f )
-    {
         xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
-                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
-    }
 
     if ( p->feat.pku )
-    {
         xstates |= X86_XCR0_PKRU;
-        xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_PKRU_POS] +
-                          xstate_sizes[X86_XCR0_PKRU_POS]);
-    }
 
-    p->xstate.max_size  =  xstate_size;
+    /* Subleaf 0 */
+    p->xstate.max_size =
+        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
     p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
     p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
 
+    /* Subleaf 1 */
     p->xstate.Da1 = Da1;
     if ( p->xstate.xsaves )
     {
+        ecx_bits |= 3; /* Align64, XSS */
         p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
         p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
     }
-    else
-        xstates &= ~XSTATE_XSAVES_ONLY;
 
-    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
+    /* Subleafs 2+ */
+    xstates &= ~XSTATE_FP_SSE;
+    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
+    for_each_set_bit ( i, &xstates, 63 )
     {
-        uint64_t curr_xstate = 1ul << i;
-
-        if ( !(xstates & curr_xstate) )
-            continue;
-
-        p->xstate.comp[i].size   = xstate_sizes[i];
-        p->xstate.comp[i].offset = xstate_offsets[i];
-        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
-        p->xstate.comp[i].align  = curr_xstate & xstate_align;
+        /*
+         * Pass through size (eax) and offset (ebx) directly.  Visbility of
+         * attributes in ecx limited by visible features in Da1.
+         */
+        p->xstate.raw[i].a = raw_cpuid_policy.xstate.raw[i].a;
+        p->xstate.raw[i].b = raw_cpuid_policy.xstate.raw[i].b;
+        p->xstate.raw[i].c = raw_cpuid_policy.xstate.raw[i].c & ecx_bits;
     }
 }
 
-- 
2.11.0


