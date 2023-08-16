Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B677DEBB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584459.915237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoF-00075B-2K; Wed, 16 Aug 2023 10:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584459.915237; Wed, 16 Aug 2023 10:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoE-000706-SZ; Wed, 16 Aug 2023 10:31:26 +0000
Received: by outflank-mailman (input) for mailman id 584459;
 Wed, 16 Aug 2023 10:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeG-0003R9-Lm
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9931643c-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:21:01 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso23332885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:21:01 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:21:00 -0700 (PDT)
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
X-Inumbo-ID: 9931643c-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181260; x=1692786060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7plBrwYlrmMxSQPlaLvBR29Au+PB9An3O52QlLHAxw=;
        b=K73uyRH0DFR6ZELr5ZWG4kS728ugriPKAu5SQjjN/RX48lIKPAYx+Nq3XFeW1d40yW
         tFq28BEmAW+mhrRuFBqITj14h1uCzpSdwYLlXK5jIhz1K/FljfSdefqMPH4SWbPi03ZG
         06Ub+HK1ucKQaKt07Yh8f4bNltlYhZfKW68xOJ/VKtn9aK8CNtW5tm40E2o3/Uc3K90N
         VBXlOzbg/jHjD1o12TkeuO9Wg1qEEOZdGP374KhjESSWyd1pF4wb0wC7xD0un0JHge+u
         neO+tU1Njc4VDxWDx8Wf5Nlk7UFHeeXqG57Q1TvIlQw9bqZ+K/g0W3oi9cvCJNbwTS0P
         GQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181260; x=1692786060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7plBrwYlrmMxSQPlaLvBR29Au+PB9An3O52QlLHAxw=;
        b=EpXkB0jcy/NF5mQgEaDE6zjoaLn59/iqUTbJ30mf9SyyddddMQkkYKhWi5gt3AEFSi
         ZEva08NhuiAHJfC0Vsf8Taqw8k7FhkUwjfhuD0bY6CsdNIjvMmRPDkpFotU1a0+geTBd
         swsxoAx8aytmLZTuNREaibI4knRyxvLkAboK/QUi64I2oJlhWrVS6U6uPbw72GzM6j0c
         DgIY5O5+uK1RDodQi89AiXJIWV5+viz/tEFmvQA5LBVhKHqgNAk9KzlrypeAmaqYtiqf
         gmgNtyoeVUAh+/lTlfOn3GdkbaMKFV9kt5IjVEmqyeGNfkGa3izMw042s3KxzJ4Qqpz/
         pGkg==
X-Gm-Message-State: AOJu0Yz3lDO3ENHbWfg+8c6p93lP/iQkqD84zX2xSR5CgVq8DIqqt42T
	A58i1q9crDR1oRe8Rslwy9HpryDnGIHr+5tS
X-Google-Smtp-Source: AGHT+IEHgcRu5P1lAisUIGrlaNwDTC4k/w81NPtMTQJUm72hWKT5/GoK3yHN1hYr9SbdpvYpyvYdgg==
X-Received: by 2002:adf:fd0e:0:b0:317:9537:d746 with SMTP id e14-20020adffd0e000000b003179537d746mr990558wrr.2.1692181260591;
        Wed, 16 Aug 2023 03:21:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 55/57] xen/riscv: enable full Xen build
Date: Wed, 16 Aug 2023 13:20:08 +0300
Message-ID: <97ea21fee2f343b8dd5a7926407664f9a90d2f2e.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile                 | 16 +++++++++++++++-
 xen/arch/riscv/arch.mk                  |  4 ----
 xen/arch/riscv/configs/tiny64_defconfig | 19 ++++++++++++++++++-
 xen/arch/riscv/stubs.c                  | 18 ------------------
 4 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 50c09469a0..9c02cb0ccf 100644
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
index 8403f96b6f..12b1673fae 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -13,7 +13,3 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
-
-# TODO: Drop override when more of the build is working
-override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
-override ALL_LIBS-y =
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 3c9a2ff941..4b488180ae 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -6,7 +6,24 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
-
+# CONFIG_ARGO is not set
+# CONFIG_HYPFS_CONFIG is not set
+# CONFIG_CORE_PARKING is not set
+# CONFIG_DEBUG_TRACE is not set
+# CONFIG_IOREQ_SERVER is not set
+# CONFIG_CRASH_DEBUG is not setz
+# CONFIG_KEXEC is not set
+# CONFIG_LIVEPATCH is not set
+# CONFIG_MEM_ACCESS is not set
+# CONFIG_NUMA is not set
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_HAS_PMAP is not set
+# CONFIG_TRACEBUFFER is not set
+# CONFIG_XENOPROF is not set
+# CONFIG_COMPAT is not set
+# CONFIG_COVERAGE is not set
+# CONFIG_UBSAN is not set
+# CONFIG_NEEDS_LIBELF is not set
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3232039bc2..5f3040965e 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -417,21 +417,3 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
     BUG();
 }
-
-/* need for build until common code starts be buildable */
-unsigned long __read_mostly max_page;
-
-void printk(const char *fmt, ...)
-{
-    BUG();
-}
-
-void cf_check irq_actor_none(struct irq_desc *desc)
-{
-    BUG();
-}
-
-unsigned int cf_check irq_startup_none(struct irq_desc *desc)
-{
-    return 0;
-}
\ No newline at end of file
-- 
2.41.0


