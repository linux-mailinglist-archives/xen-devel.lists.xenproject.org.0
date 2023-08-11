Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2C7791EE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582503.912305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCH-000539-Eb; Fri, 11 Aug 2023 14:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582503.912305; Fri, 11 Aug 2023 14:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCH-00050g-Bh; Fri, 11 Aug 2023 14:33:01 +0000
Received: by outflank-mailman (input) for mailman id 582503;
 Fri, 11 Aug 2023 14:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCF-00049h-V0
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:00 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8364630-3853-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 16:32:59 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe28e4671dso3281410e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:32:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:32:58 -0700 (PDT)
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
X-Inumbo-ID: f8364630-3853-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764379; x=1692369179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8jHaMKqz0HfbXk2J9EkqrL9mGdPZo33L8RyKFfrtek=;
        b=fdlqZrbaH0gKi00KzPG9s/IrK3X7nR8PjPZvg2UWwNEUsT70z2RhysrSdXrWXwHzw+
         zLVxLb9JY6UBPReG8thCEa7lNhoAy1cwBsWda5bT2ggPkTcttMeAY0bUfmxhdU70kMnt
         Y96CV9RZeCjJbjbbWxI96Oh5RYi5Z8kITenQUWJkWhnqTUZefiZ6C4InM/3plcDSns8H
         VkJzkTAW/k0PTT4hul0ACb3wmmAVQd9O6E8rF/w4JkrxOy+B9Y/jgUQyEg6gY9eO7SvH
         RniFpvyyR2p9g3jBiur901Woy5Vpm7YiomceKi3cCa3PvmjQKwGzrPQWl/vAd8WbBygc
         iprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764379; x=1692369179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8jHaMKqz0HfbXk2J9EkqrL9mGdPZo33L8RyKFfrtek=;
        b=W/Lt7dxdGCHvdjra5erdt07ycBdwHJZj3kQSDltbluWXH/Nbut6zgG+BGAwgx8M0I0
         ZJdCxQfaSq4qRfgzpYLiEQc+0xMCt7mNcnbaAPrgOKdbbd4LKv1FfVBYkUDz4FIm/WpA
         KjEDf55hfrlmEjoWdiXrgNw+XRlEeU1Jslx7DLpfMY0V29bGzhLsmkA1QmrfEznHdNbN
         FWUsTcS5cGIIQ1tCv4iPQD7BfmH1OyOdxFAiZ+naEr2BPxO6vSf9+F5fuvNQNFw96ct8
         63foEpPSaXSXOfhd6AujIJH7E2+dX3ThOOIA0AKwuNglyinkMrFnyTycWY0zKyACQlUd
         +pKg==
X-Gm-Message-State: AOJu0YxTRPnVxaWv11B7V7NlOdJfW7kZclmNpxZwMn04PHLOuY7jRl5c
	sSqtBv08cHk4shmb2cwaZzifIsafKnU=
X-Google-Smtp-Source: AGHT+IF1Q8q72UIc0xVO9V0e4F5v7jMaTT86mWd5rfbSM2zcPNlU9v2BoTXjhKKgMx9lbGjS/2wKeA==
X-Received: by 2002:a19:9148:0:b0:4fb:978e:95b8 with SMTP id y8-20020a199148000000b004fb978e95b8mr1523531lfj.59.1691764378388;
        Fri, 11 Aug 2023 07:32:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 1/6] xen/riscv: introduce temporary printk stuff
Date: Fri, 11 Aug 2023 17:32:50 +0300
Message-ID: <4d986a1083f35ab66eba6ffde964af3b4453b216.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introdcuces printk related stuff which should be deleted
after Xen common code will be available.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - only rebase was done.
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


