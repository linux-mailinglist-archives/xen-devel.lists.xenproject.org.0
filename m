Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE181CC19
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659496.1029192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJD-0001dy-S9; Fri, 22 Dec 2023 15:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659496.1029192; Fri, 22 Dec 2023 15:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJD-0001cF-Od; Fri, 22 Dec 2023 15:19:31 +0000
Received: by outflank-mailman (input) for mailman id 659496;
 Fri, 22 Dec 2023 15:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDr-0007Ie-JZ
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba924920-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:57 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e62c1245eso1805049e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:56 -0800 (PST)
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
X-Inumbo-ID: ba924920-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258037; x=1703862837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NW4PP+xPCMRJ4FuaFoJrjezV0TKnIJLshslvX7panQ=;
        b=m2zyDF7WCk/RR1P1nHCOsqWyPd/3v27oJ0hCZfyTMiowCcGAFhagPSykvxbJS8Q9Za
         8yTeS90AMI2z09lDXQOuzBcXvSQxPxH/lthmrc2Vfn0rVRAL2s+ZpvMQBQPJ+8ksfPTl
         Ij/Nuop/bjOtovER9ILAoDVzzkaTe3ZK9KvLxi470Ebl0t0ksn1AFyG2sQKgMjsWduMi
         6ZW4v9VZDTqYHcEk1aIdS4IfRZNzuanrJO4Xl1ZMK2lFUSEhUvxCh8+39IJzshqj/BTY
         k4PiFNxT/LUp1ZB2FkPSAU4eCvwPLFdt2iOMgQYv4lvyblmh75wfPHAYQvXywmB77QY4
         9QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258037; x=1703862837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NW4PP+xPCMRJ4FuaFoJrjezV0TKnIJLshslvX7panQ=;
        b=OnzptD7bwdNOPmarbUkgF8BRGGhZTeBH4oHATDEiUfzw7e9YKNoAl59R2Fr6nGYr/y
         jfEXxDg/UVXrKf3lI5ZZfTphO9HdyNNKxFzeUGXT+mTwd4bnjLMDyps7oQK/KJ+/e0l8
         juCVOdHfaaGyXQnvoilz1dvi4bMFwWPi6mWFWqX/5cgoq/rHcoY1xj9utqhYx/esV3/y
         B3H1moDl1QtsxUR0oHwfX9X4hI6N1gjtAeB4n6aZ+baQsuAciX9IP7I0aPehZX6i5+af
         m6yemzsfM7AxomEMruIykd+mxJqBgiSaIb7dYjaq+DCqqSJG84wIwQ4eO8JJljoDrnUu
         rs7w==
X-Gm-Message-State: AOJu0Yxg4cY399fo31Sk31FqW7lK3IotiJJ5Jsitkk3rK02mCarqS92P
	kxKGMgDcuKA8guESd9CkkWwgRuCTsno=
X-Google-Smtp-Source: AGHT+IGfSQcAwFKGAgxwIoRm6aEPBfs2H1i+KvqqdiT1wZX7GIlLMfsZcM7TsXl/53HMrWbNoNBvdw==
X-Received: by 2002:a05:6512:36d0:b0:50e:6d47:11dc with SMTP id e16-20020a05651236d000b0050e6d4711dcmr244252lfs.4.1703258037196;
        Fri, 22 Dec 2023 07:13:57 -0800 (PST)
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
Subject: [PATCH v3 33/34] xen/riscv: enable full Xen build
Date: Fri, 22 Dec 2023 17:13:17 +0200
Message-ID: <160c29e5733ac52965b29f52bc21774710a69816.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Reviewed-by: Jan Beulich <jbeulich@suse.com>
 - unrealted change dropped in tiny64_defconfig
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/Makefile | 16 +++++++++++++++-
 xen/arch/riscv/arch.mk  |  4 ----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5523191bb7..c10d43c7e5 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -11,10 +11,24 @@ $(TARGET): $(TARGET)-syms
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
-- 
2.43.0


