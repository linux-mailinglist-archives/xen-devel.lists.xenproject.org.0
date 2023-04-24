Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC446ED05C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525451.816660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxDa-00046p-Pp; Mon, 24 Apr 2023 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525451.816660; Mon, 24 Apr 2023 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxDa-00044x-Ms; Mon, 24 Apr 2023 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 525451;
 Mon, 24 Apr 2023 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ydgZ=AP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pqxDZ-00044p-Rh
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:31:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f24b0e-e2ac-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:30:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D2841FD86;
 Mon, 24 Apr 2023 14:30:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47C451390E;
 Mon, 24 Apr 2023 14:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NvvfD6OSRmTWQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Apr 2023 14:30:59 +0000
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
X-Inumbo-ID: a1f24b0e-e2ac-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682346659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Fp5bxPwAYsX9cD2vOMsJUNZN2q/TS9Vqo0R+NK1jCA0=;
	b=PSNSfB9we60DTmsjy6sw5pVA6nEkHEL77NngDgQazMpG8WfFtKaYDpbq0aktA+u+MljiP6
	1BXNKKk+CvboPRlSLQbrvxSc8IeUGITKKw52TCPGMXQ0oaq429YB2VgzX1X9HdRYk9AZhM
	+xs9K+Vafq9WdojaIxBm80BamnAEYQ8=
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
Subject: [PATCH v2] xen: add support for crash dump analysis with xen.efi
Date: Mon, 24 Apr 2023 16:30:57 +0200
Message-Id: <20230424143057.27469-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today it is not possible to analyse crash dumps of a system in
hypervisor mode when it had been booted via EFI, as the crash utility
doesn't understand the file format of xen.efi.

This can easily be solved by creating an ELF file from xen.efi via
objcopy. Using that file as name list for crash enables the user to
analyse the dump in hypervisor mode. Note that crash isn't happy with
a file containing no text and data, so using --only-keep-debug is not
an option.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- drop Kconfig help text changes (Jan Beulich)
- apply some Makefile changes (Jan Beulich)
- add xen.efi.elf removal to _clean target
---
 xen/Makefile          | 11 +++++++----
 xen/arch/x86/Makefile |  3 +++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 2710d7327e..5166403cff 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -502,9 +502,11 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
 		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
 		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
-		if [ -e $(TARGET).efi.map ]; then \
-			$(INSTALL_DATA) $(TARGET).efi.map $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map; \
-		fi; \
+		for x in map elf; do \
+			if [ -e $(TARGET).efi.$$x ]; then \
+				$(INSTALL_DATA) $(TARGET).efi.$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.$$x; \
+			fi; \
+		done; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
@@ -539,6 +541,7 @@ _uninstall:
 	rm -f $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION).map
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi
+	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.elf
 	rm -f $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map
 	rm -f $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi
 	rm -f $(D)$(EFI_DIR)/$(T).efi
@@ -569,7 +572,7 @@ _clean:
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' -o -name "*.gcno" \
 		-o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)-syms $(TARGET)-syms.map
-	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.stripped
+	rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.stripped
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fc9487aa40..0c66ba9086 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -226,6 +226,9 @@ endif
 	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+ifeq ($(CONFIG_DEBUG_INFO),y)
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:,$(OBJCOPY) -O elf64-x86-64 $@ $@.elf)
+endif
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
-- 
2.35.3


