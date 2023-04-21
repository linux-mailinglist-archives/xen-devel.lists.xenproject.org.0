Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76196EAC2F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 16:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524593.815650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprIa-0007QU-1Y; Fri, 21 Apr 2023 13:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524593.815650; Fri, 21 Apr 2023 13:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprIZ-0007Nf-UT; Fri, 21 Apr 2023 13:59:39 +0000
Received: by outflank-mailman (input) for mailman id 524593;
 Fri, 21 Apr 2023 13:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pprIY-0007NZ-FL
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 13:59:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc732cb-e04c-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 15:59:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6EFD51FDDE;
 Fri, 21 Apr 2023 13:59:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2495713456;
 Fri, 21 Apr 2023 13:59:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HPgBseWQmSQagAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Apr 2023 13:59:35 +0000
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
X-Inumbo-ID: bfc732cb-e04c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682085575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z3rqDaYulloCqtPf8pm8IonGBjyS5zgzvmhN92oY7X0=;
	b=o8WZjHjronVBnkm2O01CKXgMdycbsVs0VjHzRblJ/n62Fb1dXqLcv6+bF5y/rdNvxsAjK5
	DEL8knwySxiEz7JiizC/MqdHYVf1B9lKY06AmIoH0l2ar/Q0oY8TONdbkzdgXlETUkXzgw
	BllkRlTqNE/yPN55ZlqDmVvrZGlIWIw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: add support for crash dump analysis with xen.efi
Date: Fri, 21 Apr 2023 15:59:33 +0200
Message-Id: <20230421135933.23353-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today it is not possible to analyse crash dumps of a system in
hypervisor mode when it had been booted via EFI, as the crash utility
doesn't understand the file format of xen.efi.

This can easily be solved by creating an ELF file from xen.efi via
objcopy. Using that file as name list for crash enables the user to
analyse the dump in hypervisor mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/Kconfig.debug     | 5 ++++-
 xen/Makefile          | 4 ++++
 xen/arch/x86/Makefile | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 94e818ee09..4aec0fd3aa 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -138,6 +138,9 @@ config DEBUG_INFO
 	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
 	  docs/misc/efi.pandoc for more information - when not using
 	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  done outside the Xen build environment). Note that stripping
+	  xen.efi using "INSTALL_EFI_STRIP" will disable the building of
+	  xen.efi.elf, which is needed for "crash" dump analysis of systems
+	  booted via EFI.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index 2710d7327e..db50dcb502 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -505,6 +505,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 		if [ -e $(TARGET).efi.map ]; then \
 			$(INSTALL_DATA) $(TARGET).efi.map $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map; \
 		fi; \
+		if [ -e $(TARGET).efi.elf ]; then \
+			$(INSTALL_DATA) $(TARGET).efi.elf $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.elf; \
+		fi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
@@ -539,6 +542,7 @@ _uninstall:
 	rm -f $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION).map
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi
+	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.elf
 	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi
 	rm -f $(D)$(EFI_DIR)/$(T).efi
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fc9487aa40..87ce00addf 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -224,6 +224,9 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
+ifeq ($(CONFIG_DEBUG_INFO),y)
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),,$(OBJCOPY) -O elf64-x86-64 $@ $@.elf)
+endif
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
-- 
2.35.3


