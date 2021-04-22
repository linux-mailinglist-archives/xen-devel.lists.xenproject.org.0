Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D43682B4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115508.220408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZafC-00053t-6w; Thu, 22 Apr 2021 14:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115508.220408; Thu, 22 Apr 2021 14:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZafC-00053T-3S; Thu, 22 Apr 2021 14:50:42 +0000
Received: by outflank-mailman (input) for mailman id 115508;
 Thu, 22 Apr 2021 14:50:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZafB-00053M-0t
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:50:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e877c9df-396e-4d3d-babf-7035a0da8ede;
 Thu, 22 Apr 2021 14:50:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E701AEC6;
 Thu, 22 Apr 2021 14:50:39 +0000 (UTC)
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
X-Inumbo-ID: e877c9df-396e-4d3d-babf-7035a0da8ede
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8opvY7uAAKKl+VTk1uX8v+giIhvZM4yDWQN/O3L3BD0=;
	b=NnH0ao7PeJ7xx6CqWxxfekzBqhEfxincSwKDwUwRX+EzXPGc/ci3yMfQXRf27SrZzLask1
	Nx0pBksaUD6dhP4b/MNIVyxFc8FBrjp21p7JjbzXQSsfC/Bw+Zc72pQYvfUbKKzGkYTurk
	5jaDGLh9rFgtP9IOq+oqGRx98ECrqq4=
Subject: [PATCH v3 11/22] x86/CPUID: move bounding of max_{,sub}leaf fields to
 library code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <079ec0a9-fde7-e7a9-40d1-bea50a0c9a0a@suse.com>
Date: Thu, 22 Apr 2021 16:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Break out this logic from calculate_host_policy() to also use it in the
x86 emulator harness, where subsequently we'll want to avoid open-coding
AMX maximum palette bounding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -79,6 +79,7 @@ bool emul_test_init(void)
     unsigned long sp;
 
     x86_cpuid_policy_fill_native(&cp);
+    x86_cpuid_policy_bound_max_leaves(&cp);
 
     /*
      * The emulator doesn't use these instructions, so can always emulate
@@ -91,6 +92,8 @@ bool emul_test_init(void)
     cp.feat.rdpid = true;
     cp.extd.clzero = true;
 
+    x86_cpuid_policy_shrink_max_leaves(&cp);
+
     if ( cpu_has_xsave )
     {
         unsigned int tmp, ebx;
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -322,12 +322,7 @@ static void __init calculate_host_policy
 
     *p = raw_cpuid_policy;
 
-    p->basic.max_leaf =
-        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
-    p->feat.max_subleaf =
-        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
+    x86_cpuid_policy_bound_max_leaves(p);
 
     cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -352,6 +352,12 @@ void x86_cpuid_policy_fill_native(struct
 void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 
 /**
+ * Bound max leaf/subleaf values according to the capacity of the respective
+ * arrays in struct cpuid_policy.
+ */
+void x86_cpuid_policy_bound_max_leaves(struct cpuid_policy *p);
+
+/**
  * Shrink max leaf/subleaf values such that the last respective valid entry
  * isn't all blank.  While permitted by the spec, such extraneous leaves may
  * provide undue "hints" to guests.
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -238,6 +238,16 @@ void x86_cpuid_policy_clear_out_of_range
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 
+void x86_cpuid_policy_bound_max_leaves(struct cpuid_policy *p)
+{
+    p->basic.max_leaf =
+        min_t(uint32_t, p->basic.max_leaf, ARRAY_SIZE(p->basic.raw) - 1);
+    p->feat.max_subleaf =
+        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf & 0xffff,
+                                          ARRAY_SIZE(p->extd.raw) - 1);
+}
+
 void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
 {
     unsigned int i;


