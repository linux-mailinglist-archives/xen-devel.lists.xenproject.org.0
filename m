Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C55BB85C4
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136890.1473339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oer-0005XH-52; Fri, 03 Oct 2025 22:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136890.1473339; Fri, 03 Oct 2025 22:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oeq-0005Tw-Ua; Fri, 03 Oct 2025 22:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1136890;
 Fri, 03 Oct 2025 22:53:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oep-0004mK-0D
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:47 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0a1cdb9-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:45 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-421851bca51so1799674f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:43 -0700 (PDT)
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
X-Inumbo-ID: d0a1cdb9-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532024; x=1760136824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJgRuOTIVNW6wDEOmf6Heo5+NbgUqsHIo8qCR4ngeB0=;
        b=wRhTZlM3Khw5QSGAtaOj564mhrybBqWxRoBuomu8ZfDoCf8XUEAF30So7QWCgUJVKR
         gQJoJ6SnDE0LFlW7lexfj/OXeLDh7ECqYEslh877VIQBP5+hyvSmRAFG/WJKJPmTkBj1
         LltyfUdf2dXgzIqbAU+dRRIBJ5k9QtJHfk/hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532024; x=1760136824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJgRuOTIVNW6wDEOmf6Heo5+NbgUqsHIo8qCR4ngeB0=;
        b=YM3vxxhwEAnzTyQxyfKypVhXu/ctkjpD4VaCf8M1JF8JMrWwDVn1jCFDGTWxvfHC7u
         Z+piR/A5P4xK7IJfgTfPQfxTOZlOXGuFPvdd7Tn/iwkBVqjFrKZcHqGkRzNGF0nrMwBa
         zY2ofXxJby/UARv36KU44AkHX/ySXU4B+ODGr0/r89ToMnqnQFjwdI4eIHhEMjSGti5x
         NgwDxl77z1HhlwXYgrQJx2sORfDuGuVXDOOoBIejkiSX4tKp9SqMf9Mj3KvvVIf5znu+
         sxEOWNq0itbkodHOenyl8sONXWIUclhTuoU8cDMDLpdZLKSbZ/rgXxB2JlT0BsS4PPNY
         Xqmg==
X-Gm-Message-State: AOJu0Ywdh03kxsDhZlcxJ+a7ye7AfWShbpbQeMS5BCdzKXQ4cHTkoF0W
	W3LBo+4RfG2n06kufDX5qMIvqYeCqj69zt32WPSC0yErMDosNHOx//QWE5iyIJvkp5t6xYc0hVO
	YfrYFlUh3Rw==
X-Gm-Gg: ASbGncsvqlzylsBT2taeOtbnUdkg07mRvte0ygfEe6aRP1TRQO07FfIfNmHMDNI+RV9
	UtsLlN7ONe4Rz2ehgsWz4DByKUZzeAIuM0Ia1zZkUXy0pYGasH5YXW3NIBulA9rehmbbEl9KxUb
	0wFPoPOV/vP8rn0gX8dXiBq/5hj2erfSOZJaXBmAQFUxpH9bGIUg+HIKHkpB3O0ejNKjyNzJJ3p
	b3wrGreAR/2vWe3Zx0M81/noH6ClIeIq3AG/Y3A8p1XxP2DMhtEkaIW9UfFoZup/+W6EtW9j7Pb
	vR5CHBGCxv+NcNdZUekl1dhMuiCleQru9lazkEvLyukONYr6btrLMoAc6IeKrcujWz4O9IvLp23
	v3B9bwscNncLuragn5cQpyAimGYj/gr3C+Tw0N3pr+q5VYxBdCSjv0FTo7JpGQb5kKYAA8b8C4g
	92WMZ/pjn0N2GzX/oh25CkqgrtBXVv/ts=
X-Google-Smtp-Source: AGHT+IFqTQEWOz7mRrwudCzSnWkTI1QqUVdMs3PrrnKfBiD2fX3apMHX8+ej9IICiqFHzvdmEAGjQQ==
X-Received: by 2002:a05:6000:2386:b0:3ee:1357:e191 with SMTP id ffacd0b85a97d-425671a92f2mr2275302f8f.30.1759532024160;
        Fri, 03 Oct 2025 15:53:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 03/22] x86/fsgsbase: Split out __{rd,wr}gs_shadow() helpers
Date: Fri,  3 Oct 2025 23:53:15 +0100
Message-Id: <20251003225334.2123667-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

v3:
 * Rename to __{rd,wr}gs_shadow()
---
 xen/arch/x86/include/asm/fsgsbase.h | 36 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/fsgsbase.h b/xen/arch/x86/include/asm/fsgsbase.h
index 03e6a85d31ce..557703842691 100644
--- a/xen/arch/x86/include/asm/fsgsbase.h
+++ b/xen/arch/x86/include/asm/fsgsbase.h
@@ -32,6 +32,17 @@ static inline unsigned long __rdgsbase(void)
     return base;
 }
 
+static inline unsigned long __rdgs_shadow(void)
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
 
+static inline void __wrgs_shadow(unsigned long base)
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
+        return __rdgs_shadow();
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
+        __wrgs_shadow(base);
     else
         wrmsrl(MSR_SHADOW_GS_BASE, base);
 }
-- 
2.39.5


