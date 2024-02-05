Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B7849EAE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676329.1052452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1BV-00016M-Aa; Mon, 05 Feb 2024 15:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676329.1052452; Mon, 05 Feb 2024 15:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1BV-00014O-5u; Mon, 05 Feb 2024 15:47:01 +0000
Received: by outflank-mailman (input) for mailman id 676329;
 Mon, 05 Feb 2024 15:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0yA-0007I6-7Y
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:14 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df504564-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:33:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-511234430a4so7878640e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:10 -0800 (PST)
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
X-Inumbo-ID: df504564-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147192; x=1707751992; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLI6lq0SpNz5bYmO78wLTxQzJ8VUm+LfbX77KEtwseM=;
        b=HxrMOziOIG+6vcHhtWubY3qojyZZNml1R8svnnRFQgb/sKWu6RvIAZFYWG6qFBMB0K
         +atOewezyNbR8dLbiftU02MOkVcdXVHtMJkGKDFVcjd+9EJ8UCcuOvg5Wt6ppsNyfxsc
         UbBDmodW/cZRfa4SIVkDdUq99aYZiXM4yFZfq/T6ZFBus2ICPE1PTaMqTr/nzSSAW8qc
         /NoqZ8WzK1ZOXJJRtDvUy8CntuIBAS24H629ZX7QiK9aSWPSTDus1UIinYLAE4W7bVa/
         TqP8gY7ajTNcDbM9X46HNITDwwP1gj8VUuKXFDTLAvbRjd/EZqJX9S+UKvpt8NaJ7IMD
         fR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147192; x=1707751992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLI6lq0SpNz5bYmO78wLTxQzJ8VUm+LfbX77KEtwseM=;
        b=k2ePvIpZ18uDLUGG7X7VHCwkIWljQ5MWxSyBTqFnHttMaH5JMFib+PLouLvEwbtgqo
         qG1ajF3cOR//ZTyP15Je2FYA8Ryv6TiZ5/70NBSU7zNXzkceItGEcbi9seUEsalmkQl1
         r4nNFtdu/JqkyQhysJrO5otdLJY9nNa1eUISoOQuL4YBSuvtjM8z41QasmD4BwyNykrL
         vvqvb+hgghGyEph0pNS9aAKQ7Fu4NK8sgTdw3S6+X+7eySMd6U50LSjBi87u4ymwaTtO
         slmzncNqm3cbgaqWbDTszHgb94bct4sesB12H+NjMXON0f10Sa6Aiql7tHyr+biNaQ35
         JYkg==
X-Gm-Message-State: AOJu0YyvaVosvlX1kOgnjMA4l6wN9lJ/nzOGUjANF4zi5dFAnVFSTcFN
	JtWlL/rvhFtiCJb0Yz7dL/4+7Bcwj4nMES7C7ZDSim4s8z+OAa49MxV46bms
X-Google-Smtp-Source: AGHT+IFe+rCHqFGFufnLMYqzBmwcYvZ3as2LZcsD4SBHiavybweYKVNV0Gd4IQd37KKs7FtMGKI18w==
X-Received: by 2002:a05:6512:31d6:b0:511:4e8c:7d02 with SMTP id j22-20020a05651231d600b005114e8c7d02mr3100104lfe.48.1707147191667;
        Mon, 05 Feb 2024 07:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV44fS1p5IRnq3YdTpz528fwm22m9il8nSvpX86/u1ORmJapFDJa3Ei6vxJ3G8nyoElin9ketatL7ORP/k1bUl85YvNV6AHRxFVMBRpxBYiXDgB11mEmoTXFozZ/o7SQQQvAMN2bzeV7yEE9qjkhjgNEesw8HiOiBcLTnXJEDkLYEzXMKQyFhnIpPYGsKU3uZtjPe2rJ4C4MR1nJ9lxsr5v58zxRt+ZlVDTFp9BsVe5YmhGAgjEglgZ7cWvzPGPZEbkryf+BfTXEXUo2TkUksUPSSfUbz+jfSl4PtwrkJyzU+huOX/FO1nTVk27NiZadrkUHoAI
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 29/30] xen/riscv: enable full Xen build
Date: Mon,  5 Feb 2024 16:32:36 +0100
Message-ID: <153f9404c8afdfa4b3f91cdfabe1ffaf6e5c851b.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 xen/arch/riscv/early_printk.c | 167 ----------------------------------
 xen/arch/riscv/stubs.c        |  23 -----
 4 files changed, 15 insertions(+), 195 deletions(-)

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
index a4b53adaf7..4363776f34 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -14,7 +14,3 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
-override ALL_LIBS-y =
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 6d0911659d..610c814f54 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -40,170 +40,3 @@ void early_printk(const char *str)
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
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 529f1dbe52..bda35fc347 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -24,12 +24,6 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
 
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
-/*
- * max_page is defined in page_alloc.c which isn't complied for now.
- * definition of max_page will be remove as soon as page_alloc is built.
- */
-unsigned long __read_mostly max_page;
-
 /* time.c */
 
 unsigned long __ro_after_init cpu_khz;  /* CPU clock frequency in kHz. */
@@ -419,20 +413,3 @@ void __cpu_die(unsigned int cpu)
 {
     BUG_ON("unimplemented");
 }
-
-/*
- * The following functions are defined in common/irq.c, which will be built in
- * the next commit, so these changes will be removed there.
- */
-
-void cf_check irq_actor_none(struct irq_desc *desc)
-{
-    BUG_ON("unimplemented");
-}
-
-unsigned int cf_check irq_startup_none(struct irq_desc *desc)
-{
-    BUG_ON("unimplemented");
-
-    return 0;
-}
-- 
2.43.0


