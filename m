Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B367F3F5C5F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170893.311891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU14-0000zR-MT; Tue, 24 Aug 2021 10:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170893.311891; Tue, 24 Aug 2021 10:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU14-0000wg-Iz; Tue, 24 Aug 2021 10:50:50 +0000
Received: by outflank-mailman (input) for mailman id 170893;
 Tue, 24 Aug 2021 10:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU13-0000wa-1d
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:50:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2391e626-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:50:47 +0000 (UTC)
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
X-Inumbo-ID: 2391e626-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZLzfpeVcbnlSXaU/oXQHrIyxhVmhoG8fkFq0zEl5QGU=;
  b=gjoPltIOWDehLMSsFBmNhkLwLLqm8lTkwHkPwxNG+BuhodSC8UVINA1l
   6kakporpfQ3rlMnYOLDXaVER2ir8+GynUO8VqxeFB0dXgp1ODios5Mnls
   5NGIq1CelCmii2eU3IyVFwLUc74xLRKC45ZLJejRZKiMwcHT++5vgvdOg
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AVNnb+JEY8R2ArffvvoKtbGZfLWQxKGZG0eMLt1JTgyyKgl89dBSLjybw6iU/yluRcxPR7vZPc
 GxlVN555aMZ+sRSbJmXhk3gbOT5VkoVvEZhkni4hFF7oTYFZAZysAs1jqe4abK6kVohpIKqTmf
 Gy7ttY1f9rnIzobVeyq6DLK7QCGKyzRtASghstnSgH51Ak3jmvB55Wxk6yXWZQjBSu2vCUUxm4
 YzPbApUlbkAWrg+4HqxbNdFDwvQ9AT6qTrXGF0SuDkoGrVsCNLYO3ulctltfA5DiCzETKryOy9
 eUS4q1EoiN9bTUvz87uz2yhs
X-SBRS: 5.1
X-MesageID: 52875421
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ydPET60cHRfX5uAW14LdXgqjBQ5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ/+xpOMG7IU80hqQFmLX5XI3SFzUO11HYSL2KgbGN/9SCIVy1ygc+79
 YGT0EWMrSZYTdHZK3BkWqF+qMbsby6GdeT9IXjJhlWLD1CWuVF1UNUGwybGkp5SE1tHpwiDq
 eR4cJBun6JZWkXRt7TPAhIY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJ0x6s4+2
 StqX232kzjiYD09vbv7R6S031koqqj9jKFPr3PtiEhEESstu9vXvUlZ1TNhkFwnAjl0idTrD
 CFmWZaAy000QKdQoj9m2qW5yDwlDkp8HPs0lmenD/qptH4XiszD45biZteaQax0TtXgDhQ6t
 M+44uijeshMfoAplWN2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 gnMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849VcegM28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBQnBNWqDSG6XYZ3v+0i92aIfxY9Fmt1CVKZ4sKfaqa
 6xI2+w71RCBn4GIff+o6Fj41TXRnmhUXD31sRTjqIJyoHBeA==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875421"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [XEN PATCH v7 01/51] build: introduce cpp_flags macro
Date: Tue, 24 Aug 2021 11:49:48 +0100
Message-ID: <20210824105038.1257926-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - also filter -flto
    - and convert "asm-offsets.s" and "xen/x86/%.lds" to use cpp_flags as
      well.
    
    v6:
    - switch to a macro as suggested
      which allows to be used with both a_flags and c_flags
    
    v5:
    - new patch

 xen/Makefile                    | 2 +-
 xen/Rules.mk                    | 7 +++++--
 xen/arch/x86/Makefile           | 2 +-
 xen/arch/x86/mm/Makefile        | 2 +-
 xen/arch/x86/mm/hap/Makefile    | 2 +-
 xen/arch/x86/mm/shadow/Makefile | 2 +-
 6 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 94e837182615..4ceb02d37441 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -410,7 +410,7 @@ include/xen/compile.h: include/xen/compile.h.in .banner
 	@mv -f $@.new $@
 
 asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
-	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
+	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
 include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
diff --git a/xen/Rules.mk b/xen/Rules.mk
index d65d6a48993b..c99c4a9475c9 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -133,6 +133,9 @@ endif
 # Always build obj-bin files as binary even if they come from C source. 
 $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
 
+# To be use with $(a_flags) or $(c_flags) to produce CPP flags
+cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
+
 # Calculation of flags, first the generic flags, then the arch specific flags,
 # and last the flags modified for a target or a directory.
 
@@ -222,13 +225,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
+cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
 
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 quiet_cmd_cpp_s_S = CPP     $@
-cmd_cpp_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
+cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fe38cfd54421..462472215c91 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -292,7 +292,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 
 efi.lds: AFLAGS-y += -DEFI
 xen.lds efi.lds: xen.lds.S
-	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
+	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index b31041644fe8..2818c066f76a 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -15,7 +15,7 @@ guest_walk_%.o: guest_walk.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.s: guest_walk.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 22e7ad54bd33..c6d296b51720 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -9,7 +9,7 @@ guest_walk_%level.o: guest_walk.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.s: guest_walk.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index 770213fe9d84..fd64b4dda925 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -10,7 +10,7 @@ guest_%.o: multi.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.i: multi.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.s: multi.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
-- 
Anthony PERARD


