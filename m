Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3177F71AB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640436.998676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbF-0006ci-Fa; Fri, 24 Nov 2023 10:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640436.998676; Fri, 24 Nov 2023 10:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbF-0006Yi-B1; Fri, 24 Nov 2023 10:39:53 +0000
Received: by outflank-mailman (input) for mailman id 640436;
 Fri, 24 Nov 2023 10:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTT-0006hy-M8
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:51 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac53029a-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:48 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a03a9009572so237670466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:47 -0800 (PST)
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
X-Inumbo-ID: ac53029a-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821908; x=1701426708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1w34BSjUAi4k8RmSoj0kwk7zKOzvOqC/Wauz6/CNUk=;
        b=P0uy1NiUvsDK9vbmEO3yYsx/EH8fuP7NmSmM8Hnys5cgAHqQ9cZ/xJONb+D8Q3Zpy6
         wkHSSBtEHQp3IEM8vXpC5QwYMv3AMB3KU9xzfMv82Iu/Dgg290jSEppctQguyF5KLlll
         JCrbUIe61QA+ITrFR46z+t+S9yrXVnIBTYcayMgip4EMxnRhXTTdrWnqCUcfg3Zdzrn4
         6yaHpI55qce7O1GeLskxO9emNqjbZimrTDhL4ZVEiqBBMgWJe0t9LJG/Rel2s3z51C+K
         bOATyM0hqndPosPGjfsG3DI5U9Wehm4zhR9IVz5EOPMZmcrQ/pINyuqZtDqp+65vC7Kt
         u/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821908; x=1701426708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1w34BSjUAi4k8RmSoj0kwk7zKOzvOqC/Wauz6/CNUk=;
        b=n3Hdy/MwLv7tB+6foZ2a5LpP1AJ95wJe8LWQi6SdKbok9KDWVqT/QRUcZN4HnY5mAn
         8ZVxXIl/eO4JkwrvjH3dVSKjG8kyQwJ8dXz+Ts1IPVWJYp7pNidmo52tkk0LWK+Zv4Gc
         vlflTRZ7HXNdQuU2+aytW5+fon83o3tZ6N+lFn5nyb2ehVyooGPz1velK+WXSKuz3nOh
         PHH6HBX+62k2k8euJ0Z7kpqtPeUZ69k2tG0XBq39jGQqN7cFKf5FDSUyMyyfo9erUvrf
         RThT9y8KGo9noM/nevEKvon+HRSW2wHH5eDl57OHpy8YrH84PxRPntCmYyVdccHdUyLI
         lNHA==
X-Gm-Message-State: AOJu0Yxi2kRLlxMhlPSPzp+lA2EgRUjNfe6p+cdFIivVfY6iSt/afI6q
	8sQfBRLssJEKJ6F8KvvoeszkluuZ7ZtxUQ==
X-Google-Smtp-Source: AGHT+IHegBpC6Wr4W+8DeWaJJI/TRZ9D6YPDNiX62BYLTVqZPon3+2DL1aWyhBud5bWTm/eTPo6CBA==
X-Received: by 2002:a17:906:c351:b0:a08:1ea3:e65a with SMTP id ci17-20020a170906c35100b00a081ea3e65amr1724981ejb.30.1700821907858;
        Fri, 24 Nov 2023 02:31:47 -0800 (PST)
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
Subject: [PATCH v2 38/39] xen/riscv: enable full Xen build
Date: Fri, 24 Nov 2023 12:30:58 +0200
Message-ID: <c56be97d180b996d431eb97e7b0a23ac28798996.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/Makefile                 | 16 +++++++++++++++-
 xen/arch/riscv/arch.mk                  |  4 ----
 xen/arch/riscv/configs/tiny64_defconfig |  1 -
 3 files changed, 15 insertions(+), 6 deletions(-)

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
index ce37c5ae00..4b488180ae 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -24,7 +24,6 @@
 # CONFIG_COVERAGE is not set
 # CONFIG_UBSAN is not set
 # CONFIG_NEEDS_LIBELF is not set
-
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
-- 
2.42.0


