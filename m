Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DB867F62
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685766.1067052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1refBu-0008Tc-E2; Mon, 26 Feb 2024 17:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685766.1067052; Mon, 26 Feb 2024 17:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1refBu-0008RG-BJ; Mon, 26 Feb 2024 17:55:02 +0000
Received: by outflank-mailman (input) for mailman id 685766;
 Mon, 26 Feb 2024 17:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reex1-0007o5-HT
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:39 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 032d632f-d4ce-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:37 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d208be133bso52656281fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:37 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:36 -0800 (PST)
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
X-Inumbo-ID: 032d632f-d4ce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969177; x=1709573977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQrmbyqRAD9OqhWHU9VBJdf59WULWSiYOjY5GOmOiP8=;
        b=MrS8Ph52DBAHpkf+7+utIfKTV58otVKRrSZHxS49lTkpSNTTdxeW2qoH4olBwOsMab
         4HrQUKef6xImykIcMQlhsnwC4h3Ic8hx8UJB1AHe5T6usge16/XW2N5B096FHLAju5Qk
         FLAUJLR83WgbNCNzVbHxmysXBG71VyLW7YPcUk1BrESAx2SOr+0wa+wj4Q5JDYQoQhGd
         N4emcrTLXgyebyhUualV3a8af94uyu3h8FlAalvEclgB9w44WBUwEB/wkkwBx/aEbhXL
         /RrMKrF3o6riZ6ryiM82XjGhr6nvK7S3t3av9kp+6E2CaRNiT3MPBSOufxL+W35lXrmq
         gyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969177; x=1709573977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQrmbyqRAD9OqhWHU9VBJdf59WULWSiYOjY5GOmOiP8=;
        b=Cbq7ToOuU/+byghycJmiLCvFlt6pFhrymPNQzsu4wT/8+vOldeUbico4/+d8XG84ef
         Vz0JXcErYzRzswF5W8T9RJZ8Dh1kIkXopqg5Xz8tVQWguYxqRyt3dIUVpOk0iR65MsET
         2x13ZtXSLc/BOJP80kw+8NwE2Jn7U2paIA3yD4eCphAWpjYVhRrcAR5+HIbqODNH9m1F
         GumEB9/zHWGpQYwZYawa6Wh7t6cUqdEyISMR/o26M40MT2/VLl+vcXF9Ojhtkk8P5hxb
         +02c1/r5FjoSTTcY+Tut9DxTQJOebi2JgRc6vyLOwTmf/kESbZ7pE0YrgR+BmzO88R64
         qA+w==
X-Gm-Message-State: AOJu0YzApondEHlW4GzpKZ8LWBCvwLj/08Hhl+uBpLn34PBBc/5dvMIL
	B5+zoWBiuCjuf7O9Y76AHPLgTUSxfSGkueLOIkeaqZMe2F/4tm7+CvBhxMD9
X-Google-Smtp-Source: AGHT+IF/tg5wpS5mpbCbON3DvBO+MEIBxev4Pe1ujGURD/7Ny4Hgny6UeixhjDTHKwLHMISElxqFzg==
X-Received: by 2002:a2e:9010:0:b0:2d2:8fc7:aa2d with SMTP id h16-20020a2e9010000000b002d28fc7aa2dmr1368651ljg.47.1708969176944;
        Mon, 26 Feb 2024 09:39:36 -0800 (PST)
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
Subject: [PATCH v5 22/23] xen/riscv: enable full Xen build
Date: Mon, 26 Feb 2024 18:39:04 +0100
Message-ID: <4ee60959772504f7bfaad5e1d5d504e1346bf217.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Nothing changed. Only rebase.
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
 xen/arch/riscv/stubs.c        |  23 -----
 4 files changed, 15 insertions(+), 196 deletions(-)

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
index fabe323ec5..197d5e1893 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -19,7 +19,3 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y)$(has_zihintpause) -mstrict-align -mcmodel=medany
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


