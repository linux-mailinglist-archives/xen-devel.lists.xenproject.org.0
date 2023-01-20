Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE626757F2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481857.747064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssH-0007Tc-8v; Fri, 20 Jan 2023 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481857.747064; Fri, 20 Jan 2023 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssG-0007Mq-VG; Fri, 20 Jan 2023 15:00:12 +0000
Received: by outflank-mailman (input) for mailman id 481857;
 Fri, 20 Jan 2023 15:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssF-0006SQ-Ir
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:11 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217d729b-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:08 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id t5so5117397wrq.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:08 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:07 -0800 (PST)
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
X-Inumbo-ID: 217d729b-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peTzxyrEbjxaYuy2YOboW/eTigzM3d5RhpXU1HhKiX8=;
        b=Jd7hpmTwX5oJ/BKdTyLWb0yBlwZ8F7pujCsWNO9JiHgCZxJlWyUyeDePAwa2XY3+vu
         STwpHsSNWcQGklILTZCdj55xHBZX6/nZ2zL5+GZ/hpGhueB/PJRBSfUdEOIKSA11/omL
         K9p5u2cVOPc4M2R30GlhGmMCBjeZa/eoXS9bQsK5H0LgpirergUc6ohYFhAR1c4m0vOo
         AEHtIeoU+4JoX/vyK9Kz1kNWnh7qp6CRLpb+y3Kt4rOPP/J0JogAFBEGYFhE7eZNOawG
         Hi1B/a3jjmwUEaO9MH+Uykd9ftDt/sv/aFEgBboCgH47qONf7ye2ccvluvQ3MWB3z0vZ
         KtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peTzxyrEbjxaYuy2YOboW/eTigzM3d5RhpXU1HhKiX8=;
        b=MAVAWAkscLRMKjLA8sOfys0jPE8gC9cjAHoyPEOmp/XV5XrTwzdcLzxTjXwzROYcTy
         zM8LL16UeQqHsfbZHr2OaMizGU17DikLySuFEpxKLHsdMj4+1tJ+Clo+Koc8zW7yUd8W
         jR//immoqf3DpErQtrIwfd0A4ICwSqircPBTQTKuh96EQ0Ch4h1/TROEUipWG6nSytEg
         bHEGAEixQ4B6vkrRoutnezNY7hmLu9G7cOn3RtciAF4D02fXrrrgvhxqt5d8mQQ67hUf
         kxgWPzWEar8ucrjVm3MaG1Vd39d5L8OPnmo1U88Fw/XNGqvNav5Z/XJyq8HtE/Az/CCZ
         rc8A==
X-Gm-Message-State: AFqh2krFUFZV1Gr43LPojNpkqaw6xwBIWLgXH7CZ+AF38bicQ62LRu/m
	VHhJ00rlwCBEA9DMfQk6XAXXg1sEIIxNSg==
X-Google-Smtp-Source: AMrXdXtGbMAHhAk14XqQ7Ux7P65mZKKBUsGBFWK80ms59XKwMpAQY3POn4NprlX0ImLXn6DEHIgMhA==
X-Received: by 2002:adf:f18e:0:b0:2bd:e8bd:79ce with SMTP id h14-20020adff18e000000b002bde8bd79cemr12731524wro.20.1674226808038;
        Fri, 20 Jan 2023 07:00:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 05/14] xen/riscv: add early_printk_hnum() function
Date: Fri, 20 Jan 2023 16:59:45 +0200
Message-Id: <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ability to print hex number.
It might be useful to print register value as debug information
in BUG(), WARN(), etc...

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/early_printk.c             | 39 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 6f590e712b..876d022dd6 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -43,3 +43,42 @@ void early_printk(const char *str)
         str++;
     }
 }
+
+static void reverse(char *s, int length)
+{
+    int c;
+    char *begin, *end, temp;
+
+    begin  = s;
+    end    = s + length - 1;
+
+    for ( c = 0; c < length/2; c++ )
+    {
+        temp   = *end;
+        *end   = *begin;
+        *begin = temp;
+
+        begin++;
+        end--;
+    }
+}
+
+void early_printk_hnum(const register_t reg_val)
+{
+    char hex[] = "0123456789ABCDEF";
+    char buf[17] = {0};
+
+    register_t num = reg_val;
+    unsigned int count = 0;
+
+    for ( count = 0; num != 0; count++, num >>= 4 )
+        buf[count] = hex[num & 0x0000000f];
+
+    buf[count] = '\0';
+
+    reverse(buf, count);
+
+    early_printk("0x");
+    early_printk(buf);
+    early_printk("\n");
+}
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 05106e160d..f6d7580eb0 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -5,8 +5,10 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 void early_printk(const char *str);
+void early_printk_hnum(const register_t reg_val);
 #else
 static inline void early_printk(const char *s) {};
+static inline void early_printk_hnum(const register_t reg_val) {};
 #endif
 
 #endif /* __EARLY_PRINTK_H__ */
-- 
2.39.0


