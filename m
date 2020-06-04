Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A011EE256
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 12:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgn0v-0007vp-8n; Thu, 04 Jun 2020 10:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgn0t-0007vk-J1
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:22:19 +0000
X-Inumbo-ID: 44a9d7dc-a64d-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44a9d7dc-a64d-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 10:22:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB93BB157;
 Thu,  4 Jun 2020 10:22:20 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: fix dependency tracking for preprocessed files
Message-ID: <bb246053-f49b-58af-5381-fe0674f645de@suse.com>
Date: Thu, 4 Jun 2020 12:22:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While the issue is more general, I noticed that asm-macros.i not getting
re-generated as needed. This was due to its .*.d file mentioning
asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
dependency tracking files. While there, further avoid open-coding $(CPP)
and drop the bogus -Ui386.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
+cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@ -MQ $@
 
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 quiet_cmd_s_S = CPP     $@
-cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
+cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@ -MQ $@
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -123,9 +123,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-off
 	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
 
 xen.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
-	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
-	mv -f .xen.lds.d.new .xen.lds.d
+	$(CPP) -P $(a_flags) -o $@ -MQ $@ $<
 
 dtb.o: $(CONFIG_DTB_FILE)
 
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -244,9 +244,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 
 efi.lds: AFLAGS-y += -DEFI
 xen.lds efi.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
-	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
-	mv -f .$(@F).d.new .$(@F).d
+	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ -MQ $@ $<
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<

