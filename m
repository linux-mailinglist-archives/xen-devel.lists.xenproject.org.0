Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BF43510E7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104158.198876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRslz-0004vt-ID; Thu, 01 Apr 2021 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104158.198876; Thu, 01 Apr 2021 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRslz-0004vX-F5; Thu, 01 Apr 2021 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 104158;
 Thu, 01 Apr 2021 08:33:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsly-0004vR-42
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:33:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f079bd8c-45a0-4c0c-bd77-ebbedea5e2eb;
 Thu, 01 Apr 2021 08:33:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1A48AE92;
 Thu,  1 Apr 2021 08:33:47 +0000 (UTC)
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
X-Inumbo-ID: f079bd8c-45a0-4c0c-bd77-ebbedea5e2eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RF79SsoAyFEuhqGnkFY5BlU6Era99vx8Fr7JdyqLln8=;
	b=aaybsiO9FjCfGOPDQXFbzYpZXZcfKQAOxhR8gOBWlxfEOAAuEAHR7rIIaOoR50dK/Kb1pw
	/KqC+eto5/tezWUDsCBVWzWue53QSjcyzEpiLVRjTZhY/5ceBiN2xkb4GjEf/owCIhncxS
	fdqQWsTpNAItkaah+lJEu0xNhau+VD0=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: centralize / unify asm-offsets generation
Message-ID: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
Date: Thu, 1 Apr 2021 10:33:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Except for an additional prereq Arm and x86 have the same needs here,
and Arm can also benefit from the recent x86 side improvement. Recurse
into arch/*/ only for a phony include target (doing nothing on Arm),
and handle asm-offsets itself entirely locally to xen/Makefile.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/.gitignore
+++ b/.gitignore
@@ -318,7 +318,6 @@
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
 xen/arch/*/xen.lds
-xen/arch/*/asm-offsets.s
 xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
 xen/arch/*/efi/ebmalloc.c
@@ -325,6 +324,7 @@
 xen/arch/*/efi/efi.h
 xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
+xen/asm-offsets.s
 xen/common/config_data.S
 xen/common/config.gz
 xen/include/headers*.chk
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -341,7 +341,7 @@ _clean: delete-unfresh-files
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
-	rm -f include/asm-*/asm-offsets.h
+	rm -f asm-offsets.s include/asm-*/asm-offsets.h
 	rm -f .banner
 
 .PHONY: _distclean
@@ -362,7 +362,7 @@ $(TARGET): delete-unfresh-files
 		done; \
 		true
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) asm-offsets.s
+	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
@@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
 	@sed -rf tools/process-banner.sed < .banner >> $@.new
 	@mv -f $@.new $@
 
-include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
+asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
+	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
+	$(call move-if-changed,$@.new,$@)
+
+include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
 	@(set -e; \
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -131,8 +131,8 @@ $(TARGET)-syms: prelink.o xen.lds
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]*
 
-asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
-	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
+.PHONY: include
+include:
 
 xen.lds: xen.lds.S
 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
@@ -141,6 +141,6 @@ dtb.o: $(CONFIG_DTB_FILE)
 
 .PHONY: clean
 clean::
-	rm -f asm-offsets.s xen.lds
+	rm -f xen.lds
 	rm -f $(BASEDIR)/.xen-syms.[0-9]*
 	rm -f $(TARGET).efi
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -244,9 +244,8 @@ endif
 efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
 efi/buildid.o efi/relocs-dummy.o: ;
 
-asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
-	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
-	$(call move-if-changed,$@.new,$@)
+.PHONY: include
+include: $(BASEDIR)/include/asm-x86/asm-macros.h
 
 asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
@@ -276,7 +275,7 @@ hweight.o: CFLAGS-y += $(foreach reg,cx
 
 .PHONY: clean
 clean::
-	rm -f asm-offsets.s *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/include/asm-x86/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc

