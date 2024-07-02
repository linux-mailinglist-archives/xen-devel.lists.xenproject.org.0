Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA2923BF1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752286.1160509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGh-0001mU-Ng; Tue, 02 Jul 2024 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752286.1160509; Tue, 02 Jul 2024 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGh-0001gg-Hs; Tue, 02 Jul 2024 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 752286;
 Tue, 02 Jul 2024 11:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGf-0000Yl-Op
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a28d4cc-3862-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 13:01:48 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso604803a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:46 -0700 (PDT)
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
X-Inumbo-ID: 7a28d4cc-3862-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918107; x=1720522907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRZ/nCXNdfp/8aMKgDc8v2QqVIkEno6CGrBauxQBWcg=;
        b=BR/DC2Ss5mz5K27Vs85C/uhuitBeB5v1lkG8+j3XJ2iNMdUNkUvZ30jCukqpc5gzTU
         K82DN3F+fhruuDK55ye9z/b6N+FVDikUqR6EgPVsTtfpBa/d5W5QVMVN6+XWFM/XmAW+
         BzWFko2OBYz5hyu4exmNu9/ByNIPVHk2pUECTIfrFuDiOkEPiclwnQ8MRgLVuzhu/Dke
         VlrLClFm6AoCIuGYZlwWkKPlJnMJNg5BYj03wfrUOQIH23b4hw6/MLEJoMYB4BERTeqX
         b8tIZOTqMszL0TlXiVM9gy6uvZvg9USSWV4afefaT78GtAkaD2Qj8YiFEdhvlgMfsaBU
         3Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918107; x=1720522907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRZ/nCXNdfp/8aMKgDc8v2QqVIkEno6CGrBauxQBWcg=;
        b=oPa+5nWgAIXyp9Ywu7kTIeYv980Iomb5FKkn6zZPgS6IDXoWKRLYm0wF/nepZNrgtj
         QumsdgG2q4BNiYosBuUB9nekuC9iIkkJH+7hEwt7S75BEBru0C0ys732bdUFvmA7iRaR
         uhq9R5EVSKSIauFRSe4kLYLI/hZCKSJttBEJ+ObUrxL5BZkJTg+AvMSH52dX3B9LJtqS
         LiA6zZiBNi0WvJxKjxN4YTu2IuePCb4FrSbN+FnvzrIsZybvmGS5zaaSRQ04ndVFVeZb
         mx1qeo1SRGT+kMNEToFbVwohgSd6ia4GmJUpBa6yacIMedWcPVt/xGB6auLSksRr/8LC
         x7zQ==
X-Gm-Message-State: AOJu0Yz00W07d5Nza8IDJNP5QceOwfMB9AeecLehpQ/exkKTONGnTxgq
	uXt/K/SKGOnHfjAGX2PBigfD/rKwU9MNlXoD8QmLg+mWMWxJnepTzpCztffG
X-Google-Smtp-Source: AGHT+IHgB0ui/z2qNpGq1fKiW1kds1/IGj/CXbe3pmIU4fz2WLFDhTQqnaFaYqjXub3fD1kQcSrP2w==
X-Received: by 2002:a17:906:6a1a:b0:a72:4c32:7d89 with SMTP id a640c23a62f3a-a7514440048mr691387966b.54.1719918106508;
        Tue, 02 Jul 2024 04:01:46 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 5/9] xen/riscv: enable full Xen build
Date: Tue,  2 Jul 2024 13:01:32 +0200
Message-ID: <8ea6ebdeb3df9332f95f4ccfe42d9e439d674ae3.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V14:
 - Nothing changed. Only rebase.
 - Update the the text in "changes in v13" by dropping some changes as they were done in
   different patch
---
 Changes in V13:
  - drop the footer after R-by as Andrews patch series were merged to staging.
---
Changes in V5-V12:
 - Nothing changed. Only rebase.
 - Add the footer after Signed-off section.
---
Changes in V4:
 - drop stubs for irq_actor_none() and irq_actor_none() as common/irq.c is compiled now.
 - drop defintion of max_page in stubs.c as common/page_alloc.c is compiled now.
 - drop printk() related changes in riscv/early_printk.c as common version will be used.
---
Changes in V3:
 - Reviewed-by: Jan Beulich <jbeulich@suse.com>
 - unrealted change dropped in tiny64_defconfig
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/Makefile       |  16 +++-
 xen/arch/riscv/arch.mk        |   4 -
 xen/arch/riscv/early_printk.c | 168 ----------------------------------
 3 files changed, 15 insertions(+), 173 deletions(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 60afbc0ad9..81b77b13d6 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -12,10 +12,24 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(NM) -pa --format=sysv $(dot-target).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
+	    $(dot-target).0.o -o $(dot-target).1
+	$(NM) -pa --format=sysv $(dot-target).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
+	rm -f $(@D)/.$(@F).[0-9]*
 
 $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 8c071aff65..17827c302c 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -38,7 +38,3 @@ extensions := $(subst $(space),,$(extensions))
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += $(riscv-generic-flags)$(extensions) -mstrict-align -mcmodel=medany
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
-override ALL_LIBS-y =
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 60742a042d..610c814f54 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -40,171 +40,3 @@ void early_printk(const char *str)
         str++;
     }
 }
-
-/*
- * The following #if 1 ... #endif should be removed after printk
- * and related stuff are ready.
- */
-#if 1
-
-#include <xen/stdarg.h>
-#include <xen/string.h>
-
-/**
- * strlen - Find the length of a string
- * @s: The string to be sized
- */
-size_t (strlen)(const char * s)
-{
-    const char *sc;
-
-    for (sc = s; *sc != '\0'; ++sc)
-        /* nothing */;
-    return sc - s;
-}
-
-/**
- * memcpy - Copy one area of memory to another
- * @dest: Where to copy to
- * @src: Where to copy from
- * @count: The size of the area.
- *
- * You should not use this function to access IO space, use memcpy_toio()
- * or memcpy_fromio() instead.
- */
-void *(memcpy)(void *dest, const void *src, size_t count)
-{
-    char *tmp = (char *) dest, *s = (char *) src;
-
-    while (count--)
-        *tmp++ = *s++;
-
-    return dest;
-}
-
-int vsnprintf(char* str, size_t size, const char* format, va_list args)
-{
-    size_t i = 0; /* Current position in the output string */
-    size_t written = 0; /* Total number of characters written */
-    char* dest = str;
-
-    while ( format[i] != '\0' && written < size - 1 )
-    {
-        if ( format[i] == '%' )
-        {
-            i++;
-
-            if ( format[i] == '\0' )
-                break;
-
-            if ( format[i] == '%' )
-            {
-                if ( written < size - 1 )
-                {
-                    dest[written] = '%';
-                    written++;
-                }
-                i++;
-                continue;
-            }
-
-            /*
-             * Handle format specifiers.
-             * For simplicity, only %s and %d are implemented here.
-             */
-
-            if ( format[i] == 's' )
-            {
-                char* arg = va_arg(args, char*);
-                size_t arglen = strlen(arg);
-
-                size_t remaining = size - written - 1;
-
-                if ( arglen > remaining )
-                    arglen = remaining;
-
-                memcpy(dest + written, arg, arglen);
-
-                written += arglen;
-                i++;
-            }
-            else if ( format[i] == 'd' )
-            {
-                int arg = va_arg(args, int);
-
-                /* Convert the integer to string representation */
-                char numstr[32]; /* Assumes a maximum of 32 digits */
-                int numlen = 0;
-                int num = arg;
-                size_t remaining;
-
-                if ( arg < 0 )
-                {
-                    if ( written < size - 1 )
-                    {
-                        dest[written] = '-';
-                        written++;
-                    }
-
-                    num = -arg;
-                }
-
-                do
-                {
-                    numstr[numlen] = '0' + num % 10;
-                    num = num / 10;
-                    numlen++;
-                } while ( num > 0 );
-
-                /* Reverse the string */
-                for (int j = 0; j < numlen / 2; j++)
-                {
-                    char tmp = numstr[j];
-                    numstr[j] = numstr[numlen - 1 - j];
-                    numstr[numlen - 1 - j] = tmp;
-                }
-
-                remaining = size - written - 1;
-
-                if ( numlen > remaining )
-                    numlen = remaining;
-
-                memcpy(dest + written, numstr, numlen);
-
-                written += numlen;
-                i++;
-            }
-        }
-        else
-        {
-            if ( written < size - 1 )
-            {
-                dest[written] = format[i];
-                written++;
-            }
-            i++;
-        }
-    }
-
-    if ( size > 0 )
-        dest[written] = '\0';
-
-    return written;
-}
-
-void printk(const char *format, ...)
-{
-    static char buf[1024];
-
-    va_list args;
-    va_start(args, format);
-
-    (void)vsnprintf(buf, sizeof(buf), format, args);
-
-    early_printk(buf);
-
-    va_end(args);
-}
-
-#endif
-
-- 
2.45.2


