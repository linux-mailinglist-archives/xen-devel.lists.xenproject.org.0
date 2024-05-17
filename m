Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449638C8797
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724192.1129473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3R-0004xE-MN; Fri, 17 May 2024 13:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724192.1129473; Fri, 17 May 2024 13:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3R-0004h1-4U; Fri, 17 May 2024 13:55:25 +0000
Received: by outflank-mailman (input) for mailman id 724192;
 Fri, 17 May 2024 13:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3N-0001sq-KR
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:21 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1913a501-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:19 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so5469260a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:18 -0700 (PDT)
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
X-Inumbo-ID: 1913a501-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954119; x=1716558919; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdmrjijEC2ETr1rKEtwKxNjLUtWchNNAW7Shb3Uh3Pk=;
        b=FmfbrQDOXUAVP205ADDm0zHkwd0z1HGKQll7Fmt+CrBCNFCy0JJx4LDRcR/2hWmvSe
         4GDemVEUSfzoXCRg01fIZi2LieS36UjI8koO6zX9Acv0nJz7prdQAbkhqyCUoEEehi/f
         t/XopJz2y/89mncWwwYPy88IAJhm02onNvMXzGQddJ+Wg5pD9q/uxC3epkhdSgkiJ1NK
         xKgB3IA2ONN86sgc0o4KWtPh050/R2lknrLarGguzDoephZbHCjLa9nPPl8vS/8kBms5
         6m4RV9l0CN91BSkphw7HYRP+as28kBpmQWiMjqh9Fhfi7NUYbqWUXs/IKQiw0EQaDp8a
         bn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954119; x=1716558919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdmrjijEC2ETr1rKEtwKxNjLUtWchNNAW7Shb3Uh3Pk=;
        b=LkBqNyLsUqhzUO9y64Zro+jhwwMMcnct/ajuy9xSrHx1Dn9LqZB+ESJ6dmUQvakX9k
         jc724cRa1n+sYt1zVV6KXvh/xAyHlaiQJfmVFIW1D4L8jfGg58w4UXvTbjwCqqN4WPgJ
         bF/ZYZXW0Xu9vi3QoS8iTSFDOaOdP2xu1dBAWqdrdW+M5rclCys5zxiZ9c1ESldC8spF
         no1H/s3E0i1X8SvsjYlvOEeVEl1z8gvU2QflBGrvxYSxVdgMGRrt0zSqroJLJNVQssWk
         CtfnS0dl3lZmvL2GBCsgOLwLmDkMGJIBn88sF0wWZF9IsdxQe0lsf+cZiE3JmlDoNxxf
         0cog==
X-Gm-Message-State: AOJu0Yx8TckBoUErKjNe2vST6/zvFcLCALGw/fQ2BzCqqGYSLzYGzA5T
	Ar1iXzlumTDPG+Kpvk5/6XBaZMseVtbLqL+YV9VOoGrqHCW4NtrERE+DTSu9
X-Google-Smtp-Source: AGHT+IHq3shkhryXGz9XXJbte1obJO0HoEvZW7GV+zdjdgt1z8nh7+hS9zDS82ax8/7rp4mc1dsXZQ==
X-Received: by 2002:a17:906:9e08:b0:a5a:8b17:d851 with SMTP id a640c23a62f3a-a5a8b17db00mr585229966b.20.1715954119103;
        Fri, 17 May 2024 06:55:19 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 13/14] xen/riscv: enable full Xen build
Date: Fri, 17 May 2024 15:55:02 +0200
Message-ID: <a406b22d3d53167c22e5fe607c4defb71b4ce1d5.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V10:
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
 xen/arch/riscv/stubs.c        |  24 -----
 4 files changed, 15 insertions(+), 197 deletions(-)

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
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 8285bcffef..bda35fc347 100644
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
@@ -419,21 +413,3 @@ void __cpu_die(unsigned int cpu)
 {
     BUG_ON("unimplemented");
 }
-
-/*
- * The following functions are defined in common/irq.c, but common/irq.c isn't
- * built for now. These changes will be removed there when common/irq.c is
- * ready.
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
2.45.0


