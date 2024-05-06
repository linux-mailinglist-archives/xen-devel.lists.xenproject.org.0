Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC028BCBFC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717487.1119814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vXc-0004wq-H8; Mon, 06 May 2024 10:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717487.1119814; Mon, 06 May 2024 10:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vXc-0004uC-Dz; Mon, 06 May 2024 10:25:52 +0000
Received: by outflank-mailman (input) for mailman id 717487;
 Mon, 06 May 2024 10:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNn-0001cU-O4
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9887fea6-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so386281166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:43 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:42 -0700 (PDT)
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
X-Inumbo-ID: 9887fea6-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990542; x=1715595342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grm55+UlLdSg8iPa212zyFukbCQoJ6LukCxV4Nbb5CQ=;
        b=D9VF19e1MOcpVmsMRYzgRFRHCFuaMhf8deUyMK2awQfz7pNCYHBbTwdvJ1hU/dqWMM
         tgY90nEPSag52qpdBecUjmOZhyBAIpgvlLLMP3L21ajJywVYvgkClhIjb8/v6Mf8DDcl
         PtMtaIr1DqLQJb77haedvJeZ5QQ9/OyCUQZByYbzmDmUBM3a0nd82Dssg10un4xGDA+L
         znR3R7mKZRnTOBpPNZj68I7NchTXevxoQ4q5djcz4JtOM2wfb7fFDNITQTQ8bd1JDAm5
         dhDbtnTnwyPaDo+255cwAwDXEXXHewcZVdcKKBtBkE21ql9DkBjVpPXkuLLQcpKb0YbM
         zNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990542; x=1715595342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Grm55+UlLdSg8iPa212zyFukbCQoJ6LukCxV4Nbb5CQ=;
        b=Wat/MdCpwzz/xAOx00SMKO36wmkE1Xk+/pIfpC97PkPhPoCpctj7kHEH+hsqWDaUuz
         xsPHzJIfzhdEluFfLjA1sEP4n+A1aaVaCCqeyQ6/vgqx0NXvmHuPFo/LjdzFEOXZcXTq
         VwHLcOgIHWMvTdgA3SVWeqGw7ImVf3FMho/87aGmZFKZSPf6iUbUdrDtibFu6e0k98tp
         fEhCoLzoaRgXJJcOR2xXhWT4DZhY1fxmKjSVthL3XtU5bUXIXIbeTnUOn5W8R5sBUdIY
         QDaZMrUCxitTDpyHzkYzvtjV9Bw6gEduuAI4aD68HETMZo3yymJSVEBVfLumSipJ4qbc
         Rq8Q==
X-Gm-Message-State: AOJu0YyMxpHZqGWpIqJAGHGQNAe8DjdO5tY85/W1DkOWqLPSPluyqaQ7
	SAsG/fsavmoKjiUkZdK9uRWZY1DrwcgRUgyNAJt1iV8joO56pLRzZPVDXg==
X-Google-Smtp-Source: AGHT+IFzLEClSBkXx/oT/A66IDhMwEWVcF6ooUAuAGhrfaOkibPNXs3ZkwMN612FgS3zhQbb1fHJCg==
X-Received: by 2002:a17:907:9493:b0:a59:bae0:b12a with SMTP id dm19-20020a170907949300b00a59bae0b12amr2994421ejc.63.1714990542252;
        Mon, 06 May 2024 03:15:42 -0700 (PDT)
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
Subject: [PATCH v9 14/15] xen/riscv: enable full Xen build
Date: Mon,  6 May 2024 12:15:23 +0200
Message-ID: <c6c40f3149c0f07d7fb4ba2aa481c6a489f4a2f0.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V9:
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


