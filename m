Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB523A55AF2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 00:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904347.1312237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKmR-0002ro-TD; Thu, 06 Mar 2025 23:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904347.1312237; Thu, 06 Mar 2025 23:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKmR-0002qM-PU; Thu, 06 Mar 2025 23:37:31 +0000
Received: by outflank-mailman (input) for mailman id 904347;
 Thu, 06 Mar 2025 23:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqKmQ-0002qG-QB
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 23:37:30 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63fa050-fae3-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 00:37:26 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so1162319f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 15:37:26 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103035sm3385593f8f.88.2025.03.06.15.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 15:37:25 -0800 (PST)
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
X-Inumbo-ID: f63fa050-fae3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741304246; x=1741909046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgxCttH33suy1PIbDNfIGygvWhpbVq7bxJFaW27stUE=;
        b=ROq4kI5ztEbttxOqZm/yyjMKk9S2UUNwcmz7rzmW87B68WF0/tPe0JVF4/lFuBNRIC
         Rn3jMdwm+vDD9MG+wYtn3vzOyq0LDeoZpkP5i9/ChQpPYH1eQN2gCuvQDSnexnFujB1d
         /5XXejXvy4zcszvDAMo/hCuaz5hjz9pklb0o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741304246; x=1741909046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgxCttH33suy1PIbDNfIGygvWhpbVq7bxJFaW27stUE=;
        b=EY1G9pkXuIdRQgVM1fvcMOwwT8UoopIDHR2bhzHTwaBZq/oZ4AwPe1sF7ZOGc4QABy
         4mdaWnnCgIJfrpVc2rf+0eOaEHg9+j0RIT9FOlVt3LxLfyA7P5SCRNFOj/MWZjHrEqY4
         JAqwCTQX3OmdFYgXlmyPZLjtVOqd3B1E/MdDphqRpSkhNSd5Fg0fR38bGUwRekycLclQ
         MJauqYiLrTJVJt6DZdWoHNi54fAIA9cl+wbDX82gqEaTdxUU3eMH4GEvxlbB/pMMR8/b
         ie5sP4C9+QXKLZpNyEgwqPioSecZx+3vleh0zXqYXnr6VPQFy59HqrVkFHh4BPKv9AF9
         UF6g==
X-Gm-Message-State: AOJu0Yynwm8i3xP2pjsFHU4ZeyACSxtp0IJi3QD3HFaSdr6YzI9Dn5h7
	SaUCEpLdDU1S3RNFuVON4yS+DnLKguWvptSwWp4dw9icyl5cI8I82iITi0FYnEs31PG6r7Irdre
	q
X-Gm-Gg: ASbGnctAmt18YeYpKV9mJYLVeF3WAlgDauzD7/3PMq5XVUQAqKTQF/HwFVI6Dd/Mhg8
	+tq7Pr7rQTrsM5581sSVWujkAnHgt96PGpjyC1+c0oN6MIf8w6jh1PMQ2xtdmdouDl4XW/FboPA
	faCdQyPkdfG6eVuTbHL0heHk3wgFs24YdHdJDH9zA8+LP4dpkOkSmTXMWueE5wFcYjsa8yVZslN
	EU4RiYFAX9B96kRXW6u6bwNNj6Xs4MiGn6K3h7oo/sDvpFUWR/rwG/pIvqjR3YT2+f31FuPT7Hc
	cOJjA/l2/aUWoSrDsPGdfjh8Gj2YRPZpbXD6B7aD/APuDyfkxBO8OOo9nBGAdNRwsj5ad1i4xiH
	o4CohjhOp27RNtyVjmlsB1ePK
X-Google-Smtp-Source: AGHT+IGTEcfFJbI3Sfu2AO2x/TL7T6BmRqA2jq9a6OpqOASVX3kLrIFoJMGghCqvuEs8pnWAzA0d2g==
X-Received: by 2002:a05:6000:402a:b0:390:ed05:aa26 with SMTP id ffacd0b85a97d-39132d30c22mr628818f8f.5.1741304246108;
        Thu, 06 Mar 2025 15:37:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/e820: Remove opencoded vendor/feature checks
Date: Thu,  6 Mar 2025 23:35:19 +0000
Message-Id: <20250306233519.3006560-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We've already scanned features by the time init_e820() is called.  Remove the
cpuid() calls.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Backporting.  Not sure it's worth backporing, but it is safe (just) to
backport past commit 365f408339d3 ("x86/boot: Load microcode much earlier on
boot").  That commit was the last one to reposition early_cpu_init().

I'm pretty sure that all 64bit CPUs have MTRR, but I'm less certain if
dropping the check is wise given the variety of VM configurations that exist.
---
 xen/arch/x86/e820.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index e052e84de75c..ca577c0bde0f 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -421,21 +421,12 @@ static void __init clip_to_limit(uint64_t limit, const char *warnmsg)
 /* Conservative estimate of top-of-RAM by looking for MTRR WB regions. */
 static uint64_t __init mtrr_top_of_ram(void)
 {
-    uint32_t eax, ebx, ecx, edx;
     uint64_t mtrr_cap, mtrr_def, addr_mask, base, mask, top;
     unsigned int i;
 
     /* By default we check only Intel systems. */
     if ( e820_mtrr_clip == -1 )
-    {
-        char vendor[13];
-        cpuid(0x00000000, &eax,
-              (uint32_t *)&vendor[0],
-              (uint32_t *)&vendor[8],
-              (uint32_t *)&vendor[4]);
-        vendor[12] = '\0';
-        e820_mtrr_clip = !strcmp(vendor, "GenuineIntel");
-    }
+        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 
     if ( !e820_mtrr_clip )
         return 0;
@@ -444,8 +435,7 @@ static uint64_t __init mtrr_top_of_ram(void)
         printk("Checking MTRR ranges...\n");
 
     /* Does the CPU support architectural MTRRs? */
-    cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-    if ( !test_bit(X86_FEATURE_MTRR & 31, &edx) )
+    if ( !cpu_has_mtrr )
          return 0;
 
     /* paddr_bits must have been set at this point */
-- 
2.39.5


