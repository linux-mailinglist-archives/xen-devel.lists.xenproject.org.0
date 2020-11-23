Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB62C0D74
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:29:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34453.65524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCpp-0007Nx-QT; Mon, 23 Nov 2020 14:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34453.65524; Mon, 23 Nov 2020 14:28:53 +0000
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
	id 1khCpp-0007NY-Md; Mon, 23 Nov 2020 14:28:53 +0000
Received: by outflank-mailman (input) for mailman id 34453;
 Mon, 23 Nov 2020 14:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCpo-0007NR-BU
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:28:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b88f0e-fb39-4d76-a764-5f487489d6af;
 Mon, 23 Nov 2020 14:28:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B7B1AC0C;
 Mon, 23 Nov 2020 14:28:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCpo-0007NR-BU
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:28:52 +0000
X-Inumbo-ID: 17b88f0e-fb39-4d76-a764-5f487489d6af
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 17b88f0e-fb39-4d76-a764-5f487489d6af;
	Mon, 23 Nov 2020 14:28:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2IjvyVaTtBoXKw+aBkmUgzfUhgQtRJHM3VJQSAXVi0=;
	b=L7Ay3yAv+eM/6Wp6ZELrjbzSrvAWpDny4Dz2Bnl8h21I5fOGfUjA5eLLNVlVMVePIZdefU
	/HiBV2okpQit4u6pSNfCdItfIxSRDXLXYDHbiOfYDcR7HvzK1Q0BgD3aPE7pjDYr7bZjFB
	60TJ+OsWxEKwA1zC0RkYQH1DynBR6O8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7B7B1AC0C;
	Mon, 23 Nov 2020 14:28:50 +0000 (UTC)
Subject: [PATCH v2 05/17] x86/xstate: re-use valid_xcr0() for boot-time checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <ddb0309a-4e6b-a6e8-9b54-7b2005f87112@suse.com>
Date: Mon, 23 Nov 2020 15:28:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Instead of (just partially) open-coding it, re-use the function after
suitably moving it up.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -611,6 +611,34 @@ unsigned int xstate_ctxt_size(u64 xcr0)
     return _xstate_ctxt_size(xcr0);
 }
 
+static bool valid_xcr0(uint64_t xcr0)
+{
+    /* FP must be unconditionally set. */
+    if ( !(xcr0 & X86_XCR0_FP) )
+        return false;
+
+    /* YMM depends on SSE. */
+    if ( (xcr0 & X86_XCR0_YMM) && !(xcr0 & X86_XCR0_SSE) )
+        return false;
+
+    if ( xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
+    {
+        /* OPMASK, ZMM, and HI_ZMM require YMM. */
+        if ( !(xcr0 & X86_XCR0_YMM) )
+            return false;
+
+        /* OPMASK, ZMM, and HI_ZMM must be the same. */
+        if ( ~xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
+            return false;
+    }
+
+    /* BNDREGS and BNDCSR must be the same. */
+    if ( !(xcr0 & X86_XCR0_BNDREGS) != !(xcr0 & X86_XCR0_BNDCSR) )
+        return false;
+
+    return true;
+}
+
 /* Collect the information of processor's extended state */
 void xstate_init(struct cpuinfo_x86 *c)
 {
@@ -646,10 +674,9 @@ void xstate_init(struct cpuinfo_x86 *c)
     }
 
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-
-    BUG_ON((eax & XSTATE_FP_SSE) != XSTATE_FP_SSE);
-    BUG_ON((eax & X86_XCR0_YMM) && !(eax & X86_XCR0_SSE));
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
+    BUG_ON(!valid_xcr0(feature_mask));
+    BUG_ON(!(feature_mask & X86_XCR0_SSE));
 
     /*
      * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
@@ -679,31 +706,6 @@ void xstate_init(struct cpuinfo_x86 *c)
         BUG();
 }
 
-static bool valid_xcr0(u64 xcr0)
-{
-    /* FP must be unconditionally set. */
-    if ( !(xcr0 & X86_XCR0_FP) )
-        return false;
-
-    /* YMM depends on SSE. */
-    if ( (xcr0 & X86_XCR0_YMM) && !(xcr0 & X86_XCR0_SSE) )
-        return false;
-
-    if ( xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
-    {
-        /* OPMASK, ZMM, and HI_ZMM require YMM. */
-        if ( !(xcr0 & X86_XCR0_YMM) )
-            return false;
-
-        /* OPMASK, ZMM, and HI_ZMM must be the same. */
-        if ( ~xcr0 & (X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM) )
-            return false;
-    }
-
-    /* BNDREGS and BNDCSR must be the same. */
-    return !(xcr0 & X86_XCR0_BNDREGS) == !(xcr0 & X86_XCR0_BNDCSR);
-}
-
 int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
                     const struct xsave_hdr *hdr)
 {


