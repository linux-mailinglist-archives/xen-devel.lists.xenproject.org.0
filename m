Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35444B28743
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083898.1443442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F4-0008NX-IZ; Fri, 15 Aug 2025 20:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083898.1443442; Fri, 15 Aug 2025 20:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F3-00088l-Ip; Fri, 15 Aug 2025 20:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1083898;
 Fri, 15 Aug 2025 20:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ez-0005E7-Jz
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:33 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0fcd2e-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:32 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b00797dso14310255e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:32 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:30 -0700 (PDT)
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
X-Inumbo-ID: 3a0fcd2e-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290491; x=1755895291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l8iC7hfjMIumK90MTT4QYT+fq6ZtsDyp8BT4xY81Ws=;
        b=QgUKC5CwmPiTcmGUKQj4TFX97xJEJIrTv+BHwTwCnhuNMbQTHl1ZS3c5Dfxhdbaeo0
         8e1NMVLNvcEE/8G95mbintsRUbaHClebKRjn3CuS2WYeYZECKR5D1QzHVj+z6XUbbWPz
         ZlPwKiFu6s6y0EAAQDWjDvUexT7WKAk4+PFdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290491; x=1755895291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l8iC7hfjMIumK90MTT4QYT+fq6ZtsDyp8BT4xY81Ws=;
        b=AyjMgcLktLjUsx3yJetjn3xCx0FCLLIg5C4FPEI740u6/mVIgT6nlrQlwAPkM++MHR
         +kg9dGWa6Hn9lUgbDpCz40rCTg1KPovFllwit29AL6C6YVvI3Puj+MBpLSUIhIUoLZQA
         MO0e7bGom3oXqdoctan/WNmDEryfFUIZJgP4uknSOeUlkYccqZKfgvfZB4LLi/w4pu1h
         RD2DM4danEB6DjPwdiodcfnnSC/qZCvpCcHCgcEzgxIwZzkc0w913ar6DZz98yOv+PmW
         555OIxiwmS3ksiGBZQc9b26fd/Gjo14s6t3P99rscIImdgl83D8PVJdM0Q4OZ7Z/HVdQ
         icGQ==
X-Gm-Message-State: AOJu0YxnhgQAR5LzzoJHyZp6Vuk4U42UcR0zQQ6x8gN5QQ5NSxscFO+5
	i0ziSYXng0/OnyvzIhMwgUEIjeNylBOzoSdIckcnnSODKJrNS105x8a8q+TI+81i4+xssszf3F/
	os5gb
X-Gm-Gg: ASbGncu9CAG5i96IyEzfN7I8aM0BNSHdpfL9OI7o9wWlO3pUT6Tp91+z9oQ8LY4DCVl
	PcH5t0Ksobp25f6fwV2qssii//TP8nU7DnWT6UHnzB5rWm6TdH3jG1OK4xOopzgZ20xbY1rPzHJ
	ed1n/nK5k2xlOecaVw1HGkXwAlsi8qu2XgmyKIxcUCbltaoTipTFAKjgdPkvaOnkImGbI9qrp0F
	LTFJzsHZ3x7104jbcLHXRrXAHCuPeBc8zX7/k1Ti2dOC8p9BFKXfmJ3bHuewIbFcCcmJZiu5vZh
	yfrZe0+T0QKNXfr3z4ShrUlm50g9Q/jHmzZnmVjFySx08eOETgwMxsIvqNVm5WzxcuFnwcOR7dT
	ASofD2IZq1DpkBV3xLEyY39QurqeuULeDuG5wRXnD0TLAcuSJYaLq5YzPpRyq/YBlOETic2KUfU
	OW
X-Google-Smtp-Source: AGHT+IGLKcxsTFD/74Q1iwVsGiS+q0qhl5kyjKoENcYh0fT3yViCJ70DCGmKJRr8XyDGkjzzso3jDw==
X-Received: by 2002:a05:600c:1e03:b0:458:bfb1:1fb6 with SMTP id 5b1f17b1804b1-45a21d44a9amr32589075e9.2.1755290491196;
        Fri, 15 Aug 2025 13:41:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 14/16] x86/fsgsbase: Split out __{rd,wr}gskern() helpers
Date: Fri, 15 Aug 2025 21:41:15 +0100
Message-Id: <20250815204117.3312742-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now they're inline in {read,write}_gs_shadow(), but we're going to need
to use these elsewhere to support FRED.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/fsgsbase.h | 36 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
index 03e6a85d31ce..90d116f3bb54 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -32,6 +32,17 @@ static inline unsigned long __rdgsbase(void)
     return base;
 }
 
+static inline unsigned long __rdgskern(void)
+{
+    unsigned long base;
+
+    asm_inline volatile ( "swapgs\n\t"
+                          "rdgsbase %0\n\t"
+                          "swapgs" : "=r" (base) );
+
+    return base;
+}
+
 static inline void __wrfsbase(unsigned long base)
 {
     asm volatile ( "wrfsbase %0" :: "r" (base) );
@@ -42,6 +53,14 @@ static inline void __wrgsbase(unsigned long base)
     asm volatile ( "wrgsbase %0" :: "r" (base) );
 }
 
+static inline void __wrgskern(unsigned long base)
+{
+    asm_inline volatile ( "swapgs\n\t"
+                          "wrgsbase %0\n\t"
+                          "swapgs"
+                          :: "r" (base) );
+}
+
 static inline unsigned long read_fs_base(void)
 {
     unsigned long base;
@@ -71,13 +90,9 @@ static inline unsigned long read_gs_shadow(void)
     unsigned long base;
 
     if ( read_cr4() & X86_CR4_FSGSBASE )
-    {
-        asm volatile ( "swapgs" );
-        base = __rdgsbase();
-        asm volatile ( "swapgs" );
-    }
-    else
-        rdmsrl(MSR_SHADOW_GS_BASE, base);
+        return __rdgskern();
+
+    rdmsrl(MSR_SHADOW_GS_BASE, base);
 
     return base;
 }
@@ -101,12 +116,7 @@ static inline void write_gs_base(unsigned long base)
 static inline void write_gs_shadow(unsigned long base)
 {
     if ( read_cr4() & X86_CR4_FSGSBASE )
-    {
-        asm volatile ( "swapgs\n\t"
-                       "wrgsbase %0\n\t"
-                       "swapgs"
-                       :: "r" (base) );
-    }
+        __wrgskern(base);
     else
         wrmsrl(MSR_SHADOW_GS_BASE, base);
 }
-- 
2.39.5


