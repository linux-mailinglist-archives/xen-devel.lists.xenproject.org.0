Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E876E7CC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576305.902287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX59-0003IF-3A; Thu, 03 Aug 2023 12:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576305.902287; Thu, 03 Aug 2023 12:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX58-0003B0-T7; Thu, 03 Aug 2023 12:05:30 +0000
Received: by outflank-mailman (input) for mailman id 576305;
 Thu, 03 Aug 2023 12:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX57-0002sc-36
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:29 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084ba611-31f6-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 14:05:26 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so1579671e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:25 -0700 (PDT)
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
X-Inumbo-ID: 084ba611-31f6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064326; x=1691669126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJtJCMw7fy83NnUSxcXJn4fOwoFlzc9n7K+NQt3JNLk=;
        b=RNWNGd0waEqqsrrlGRF6VMWNTiCqywapKS5vo7BDm/+3b5nQYmkZLLkCFu+QhGUnCI
         A3mkbvy/dM7C31HgETx5n8dfAM2ieUsPJ75KPDq34gzwYkKpibRifIyqzKh9tbAcC2wb
         FzLAgrAq0BSwkJAGEgh/krJdAZ53EqRqQfki7kt9+MdkNdyy0jFqbzGJ4PNJPoDCioFV
         ZWvzf6YQxuqJ+A6s6+uDZFIlrFYSODlraxDAa7vJZGVNttm5r54eJMASsoCKj0uvtbFC
         8TxuzXpx7a8n5/aUv94EYHpsxqQDES986incGMJPV9DnoPFDLIwflke/HNChmXsyeM8N
         know==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064326; x=1691669126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJtJCMw7fy83NnUSxcXJn4fOwoFlzc9n7K+NQt3JNLk=;
        b=UXE2H3ruglHdDd2KB9wyZ54dxrHlikIDOBZR4VpyciFgzMaa/Q6cvTQTMJOtSZxiW8
         rl0OLkrVGcHRyC05bXf40MWRa299S8/5VekpHIGfQ9Du6QxeFyJ/JKk94W4Dpd6pDagT
         68kWtCqygGNRqqmo5m7I1yNHxdemlRjela4Woouy++lOqTfLI23jsHmU3RIAVW929uM5
         Z8hBOhrCGwOCZqDxtRHnM/vloCSLDtJaOx9yXZzePNBoP9zAFp2ml/MLWuwHuP7sESGZ
         lUgfZEioTlmQBWOF4DIXyl02I7NNLjVpXxe0kJ+Oojvvz70Z4llJGXJ0uFi97CSD41gF
         hAyA==
X-Gm-Message-State: ABy/qLa9TdQ2Zh+DrG5UaRgNCdd1+iLzcCbNLdBDctqikXx+15w5wXIT
	lsCjguoHr/3zVi/Do9f2rGYWZsCvW/I=
X-Google-Smtp-Source: APBJJlHetGi4rKmwdsyTXvWMkMyAuaRKX7fJZoGlpHhx8H9/f9PpXxsZXR+gKwxg7MV/tlVe56k1+g==
X-Received: by 2002:a05:6512:2009:b0:4f8:6560:6436 with SMTP id a9-20020a056512200900b004f865606436mr6501358lfb.9.1691064325827;
        Thu, 03 Aug 2023 05:05:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 1/6] xen/riscv: introduce temporary printk stuff
Date: Thu,  3 Aug 2023 15:05:17 +0300
Message-ID: <4fbdbbb3bf2bf2ebee2709bbb52be02c89a4a55a.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introdcuces printk related stuff which should be deleted
after Xen common code will be available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - only rebase was done.
---
Changes in V6:
 - the patch was introduced in the current patch series (V6)
---
 xen/arch/riscv/early_printk.c | 168 ++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 610c814f54..60742a042d 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -40,3 +40,171 @@ void early_printk(const char *str)
         str++;
     }
 }
+
+/*
+ * The following #if 1 ... #endif should be removed after printk
+ * and related stuff are ready.
+ */
+#if 1
+
+#include <xen/stdarg.h>
+#include <xen/string.h>
+
+/**
+ * strlen - Find the length of a string
+ * @s: The string to be sized
+ */
+size_t (strlen)(const char * s)
+{
+    const char *sc;
+
+    for (sc = s; *sc != '\0'; ++sc)
+        /* nothing */;
+    return sc - s;
+}
+
+/**
+ * memcpy - Copy one area of memory to another
+ * @dest: Where to copy to
+ * @src: Where to copy from
+ * @count: The size of the area.
+ *
+ * You should not use this function to access IO space, use memcpy_toio()
+ * or memcpy_fromio() instead.
+ */
+void *(memcpy)(void *dest, const void *src, size_t count)
+{
+    char *tmp = (char *) dest, *s = (char *) src;
+
+    while (count--)
+        *tmp++ = *s++;
+
+    return dest;
+}
+
+int vsnprintf(char* str, size_t size, const char* format, va_list args)
+{
+    size_t i = 0; /* Current position in the output string */
+    size_t written = 0; /* Total number of characters written */
+    char* dest = str;
+
+    while ( format[i] != '\0' && written < size - 1 )
+    {
+        if ( format[i] == '%' )
+        {
+            i++;
+
+            if ( format[i] == '\0' )
+                break;
+
+            if ( format[i] == '%' )
+            {
+                if ( written < size - 1 )
+                {
+                    dest[written] = '%';
+                    written++;
+                }
+                i++;
+                continue;
+            }
+
+            /*
+             * Handle format specifiers.
+             * For simplicity, only %s and %d are implemented here.
+             */
+
+            if ( format[i] == 's' )
+            {
+                char* arg = va_arg(args, char*);
+                size_t arglen = strlen(arg);
+
+                size_t remaining = size - written - 1;
+
+                if ( arglen > remaining )
+                    arglen = remaining;
+
+                memcpy(dest + written, arg, arglen);
+
+                written += arglen;
+                i++;
+            }
+            else if ( format[i] == 'd' )
+            {
+                int arg = va_arg(args, int);
+
+                /* Convert the integer to string representation */
+                char numstr[32]; /* Assumes a maximum of 32 digits */
+                int numlen = 0;
+                int num = arg;
+                size_t remaining;
+
+                if ( arg < 0 )
+                {
+                    if ( written < size - 1 )
+                    {
+                        dest[written] = '-';
+                        written++;
+                    }
+
+                    num = -arg;
+                }
+
+                do
+                {
+                    numstr[numlen] = '0' + num % 10;
+                    num = num / 10;
+                    numlen++;
+                } while ( num > 0 );
+
+                /* Reverse the string */
+                for (int j = 0; j < numlen / 2; j++)
+                {
+                    char tmp = numstr[j];
+                    numstr[j] = numstr[numlen - 1 - j];
+                    numstr[numlen - 1 - j] = tmp;
+                }
+
+                remaining = size - written - 1;
+
+                if ( numlen > remaining )
+                    numlen = remaining;
+
+                memcpy(dest + written, numstr, numlen);
+
+                written += numlen;
+                i++;
+            }
+        }
+        else
+        {
+            if ( written < size - 1 )
+            {
+                dest[written] = format[i];
+                written++;
+            }
+            i++;
+        }
+    }
+
+    if ( size > 0 )
+        dest[written] = '\0';
+
+    return written;
+}
+
+void printk(const char *format, ...)
+{
+    static char buf[1024];
+
+    va_list args;
+    va_start(args, format);
+
+    (void)vsnprintf(buf, sizeof(buf), format, args);
+
+    early_printk(buf);
+
+    va_end(args);
+}
+
+#endif
+
-- 
2.41.0


