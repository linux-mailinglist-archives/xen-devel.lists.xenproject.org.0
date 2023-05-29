Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C980E71492B
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540605.842470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkf-0005bm-NV; Mon, 29 May 2023 12:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540605.842470; Mon, 29 May 2023 12:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkf-0005VS-HE; Mon, 29 May 2023 12:13:29 +0000
Received: by outflank-mailman (input) for mailman id 540605;
 Mon, 29 May 2023 12:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bke-0005DI-5h
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:28 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35be092a-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:24 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2af189d323fso48962231fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:23 -0700 (PDT)
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
X-Inumbo-ID: 35be092a-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362403; x=1687954403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C052OVgKf2/+kQyjQaALA5nb1G75JwZbX4aVlgaqOA=;
        b=VNtgcoWpnSU3L62BC1zjb8x+g1k92ZREVQ2sFWV0gKoTLZkqrSmvRezX6zNPMdy89n
         P/KxOIkgrwgdu606XaKgCeDWNNHro4WpxMJsPOH+nw0DLFxOiBSgK4MME7eafqAtubYF
         LIu4ySxhet2MWQrU8I9DpuRQuDM66qgl4WrYR1w8ajBnYP6dNp1ZZhlkbkL40pGBoIKa
         oiwIx/dYzIdA/p9rDDAJMvH48rlhZ0wMpqQeVY/cl1HA4dPEc8PAQDtCpxpTZXrfNfYk
         fS0tYDLDOfD9fCIdl6T2FGhybdO6eVoF4cgHCfkl7NpoqvTMz32KbN5Yi86Sb4wrPOY+
         jCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362403; x=1687954403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/C052OVgKf2/+kQyjQaALA5nb1G75JwZbX4aVlgaqOA=;
        b=aHtuGAUjwJWGy95Q7u3juqRWBFfqYz1YNAsIdwysYlXwS69NiccELaTwSxYtc2lWf1
         IUzxKsPcOGB2v/rRyU6cC6IfgwEYKC3yj0vjrifoc2x+Hk+XwypwDo2BXuL133rIr3Hn
         1CGMEZkKgXMAfyBjwmY3F3L6OOGbsQ9pbvnspx2v3J2nFuLh/MoYvGcLAPV8wGaOamsC
         EA8c3NJwGXzDW2oqxrcRWQg2b5RBlTeD1f9xvUXcrvxJw3C8w2Ep3M1nObUEZ1FERU3t
         KSS2AcNUpidtVQB17Xm9flN5iwoDbTTe+xZXUnan8asHUh/lX5YySEZuwx5obY9ITx4C
         nzWQ==
X-Gm-Message-State: AC+VfDzU38Vd0Lg/m9oUfStx2GxDUSFPpAIl8zaRWTlcqLdNn9tBAJf2
	g9ybcKbe/lBV5LzfrioInLXZAgU6wJo=
X-Google-Smtp-Source: ACHHUZ4KpIiE+T3YC+yLia9p7gQBArv3+/5DXIUwucKoZGsfb2YMWCRkXG+rsinXEzmUEgPso8B6ug==
X-Received: by 2002:a05:6512:10cc:b0:4f2:47ea:2f32 with SMTP id k12-20020a05651210cc00b004f247ea2f32mr2439587lfg.23.1685362403464;
        Mon, 29 May 2023 05:13:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 1/6] xen/riscv: introduce temporary printk stuff
Date: Mon, 29 May 2023 15:13:14 +0300
Message-Id: <2a43fd49b34ff2e3e8e3c35e9cf0bdd72ad63f91.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685359848.git.oleksii.kurochko@gmail.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introdcuces printk related stuff which should be deleted
after Xen common code will be available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - the patch was introduced in the current patch series (V6)
---
 xen/arch/riscv/early_printk.c | 168 ++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 610c814f54..7d24932a35 100644
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
2.40.1


