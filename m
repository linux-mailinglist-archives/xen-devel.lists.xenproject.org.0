Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D819A896EA0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700511.1093767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzL0-0006UN-9v; Wed, 03 Apr 2024 12:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700511.1093767; Wed, 03 Apr 2024 12:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzL0-0006Rr-79; Wed, 03 Apr 2024 12:03:30 +0000
Received: by outflank-mailman (input) for mailman id 700511;
 Wed, 03 Apr 2024 12:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Pv4=LI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rrzKz-0006QS-25
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:03:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db74c70-f1b2-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 14:03:27 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BAC6352EB;
 Wed,  3 Apr 2024 12:03:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 391961331E;
 Wed,  3 Apr 2024 12:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id /002DI5FDWYaLgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 03 Apr 2024 12:03:26 +0000
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
X-Inumbo-ID: 2db74c70-f1b2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712145806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ALBXX2h29kaal0zut6fsz331fhTeZZzw/PmHUZrSAKw=;
	b=NudtQZM+Bqm4jkrmH+0SnhqqmSkvRHR/+8eZWk29OGAZnldGKMWMGBdfpdO+j6hr0iGVwc
	6jHnUDlOFrHBHUDPfQZZ+IIiE0FXtFgtCH3rZe93u/LK/OHTmRau4dD2/PqEabAvQZJC4k
	80rQE2eqzVGqjbC1Biis9k662plI60E=
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/include: move definition of ASM_INT() to xen/linkage.h
Date: Wed,  3 Apr 2024 14:03:23 +0200
Message-Id: <20240403120323.18433-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
exactly the same way. Instead of replicating this definition for riscv
and ppc, move it to include/xen/linkage.h, where other arch agnostic
definitions for assembler code are living already.

Adapt the generation of assembler sources via tools/binfile to include
the new home of ASM_INT().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/include/asm/asm_defns.h | 3 ---
 xen/arch/x86/include/asm/asm_defns.h | 3 ---
 xen/include/xen/linkage.h            | 2 ++
 xen/tools/binfile                    | 2 +-
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
index c489547d29..47efdf5234 100644
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -28,9 +28,6 @@
 label:  .asciz msg;                             \
 .popsection
 
-#define ASM_INT(label, val)                 \
-    DATA(label, 4) .long (val); END(label)
-
 #endif /* __ARM_ASM_DEFNS_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index a69fae78b1..0a3ff70566 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -351,9 +351,6 @@ static always_inline void stac(void)
 4:  .p2align 2                            ; \
     .popsection
 
-#define ASM_INT(label, val)                 \
-    DATA(label, 4) .long (val); END(label)
-
 #define ASM_CONSTANT(name, value)                \
     asm ( ".equ " #name ", %P0; .global " #name  \
           :: "i" ((value)) );
diff --git a/xen/include/xen/linkage.h b/xen/include/xen/linkage.h
index 478b1d7287..3d401b88c1 100644
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -60,6 +60,8 @@
 #define DATA_LOCAL(name, align...) \
         SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
 
+#define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)
+
 #endif /*  __ASSEMBLY__ */
 
 #endif /* __LINKAGE_H__ */
diff --git a/xen/tools/binfile b/xen/tools/binfile
index 099d7eda9a..0299326ccc 100755
--- a/xen/tools/binfile
+++ b/xen/tools/binfile
@@ -25,7 +25,7 @@ binsource=$2
 varname=$3
 
 cat <<EOF >$target
-#include <asm/asm_defns.h>
+#include <xen/linkage.h>
 
         .section $section.rodata, "a", %progbits
 
-- 
2.35.3


