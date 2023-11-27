Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF07F9DCB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641906.1000925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2K-0005aT-73; Mon, 27 Nov 2023 10:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641906.1000925; Mon, 27 Nov 2023 10:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2K-0005Wx-3w; Mon, 27 Nov 2023 10:40:20 +0000
Received: by outflank-mailman (input) for mailman id 641906;
 Mon, 27 Nov 2023 10:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YqM-0004NR-OZ
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06271ea-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:27:55 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6769202A8;
 Mon, 27 Nov 2023 10:27:54 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B9D7132A6;
 Mon, 27 Nov 2023 10:27:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id rj2uJCpvZGUufwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:54 +0000
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
X-Inumbo-ID: a06271ea-8d0f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8H+CSjoaNbzZijd2tLFpL6ZuHjupFKRJ6T0BDc7jy0=;
	b=MiraO6Du6oOChuFu+ZcXdUcPdlEOAGriPvPSPXUfvExiIuM/sn4XO6OLzDuvIMvf+WBdBe
	BGgvuGn+bIff4xKUUEbfwG7GOzOLGZpz8JNvdL64ZgOdso+6scg9o4Pvpxq8nLfQwzhTei
	eG2jnOld468dRzseHQIgLRsFjINuRzU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 27/32] Mini-OS: add EXPORT_SYMBOL() instances to pcifront.c
Date: Mon, 27 Nov 2023 11:25:18 +0100
Message-Id: <20231127102523.28003-28-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Flag: NO
X-Spam-Score: 3.76
X-Spamd-Result: default: False [3.76 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.06)[57.24%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Add the needed instances of EXPORT_SYMBOL() to pcifront.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 pcifront.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/pcifront.c b/pcifront.c
index 56423562..f1d69396 100644
--- a/pcifront.c
+++ b/pcifront.c
@@ -278,6 +278,7 @@ error:
     free_pcifront(dev);
     return NULL;
 }
+EXPORT_SYMBOL(init_pcifront);
 
 void pcifront_scan(struct pcifront_dev *dev, void (*func)(unsigned int domain, unsigned int bus, unsigned slot, unsigned int fun))
 {
@@ -319,6 +320,7 @@ void pcifront_scan(struct pcifront_dev *dev, void (*func)(unsigned int domain, u
     }
     free(path);
 }
+EXPORT_SYMBOL(pcifront_scan);
 
 void shutdown_pcifront(struct pcifront_dev *dev)
 {
@@ -377,6 +379,7 @@ close_pcifront:
     if (!err)
         free_pcifront(dev);
 }
+EXPORT_SYMBOL(shutdown_pcifront);
 
 int pcifront_physical_to_virtual (struct pcifront_dev *dev,
                                   unsigned int *dom,
@@ -451,6 +454,7 @@ void pcifront_op(struct pcifront_dev *dev, struct xen_pci_op *op)
     rmb();
     *op = dev->info->op;
 }
+EXPORT_SYMBOL(pcifront_op);
 
 int pcifront_conf_read(struct pcifront_dev *dev,
                        unsigned int dom,
@@ -481,6 +485,7 @@ int pcifront_conf_read(struct pcifront_dev *dev,
 
     return 0;
 }
+EXPORT_SYMBOL(pcifront_conf_read);
 
 int pcifront_conf_write(struct pcifront_dev *dev,
                         unsigned int dom,
@@ -508,6 +513,7 @@ int pcifront_conf_write(struct pcifront_dev *dev,
 
     return op.err;
 }
+EXPORT_SYMBOL(pcifront_conf_write);
 
 int pcifront_enable_msi(struct pcifront_dev *dev,
                         unsigned int dom,
@@ -533,6 +539,7 @@ int pcifront_enable_msi(struct pcifront_dev *dev,
     else
         return op.value;
 }
+EXPORT_SYMBOL(pcifront_enable_msi);
 
 int pcifront_disable_msi(struct pcifront_dev *dev,
                          unsigned int dom,
@@ -555,6 +562,7 @@ int pcifront_disable_msi(struct pcifront_dev *dev,
     
     return op.err;
 }
+EXPORT_SYMBOL(pcifront_disable_msi);
 
 int pcifront_enable_msix(struct pcifront_dev *dev,
                          unsigned int dom,
@@ -589,7 +597,7 @@ int pcifront_enable_msix(struct pcifront_dev *dev,
 
     return 0;
 }
-
+EXPORT_SYMBOL(pcifront_enable_msix);
 
 int pcifront_disable_msix(struct pcifront_dev *dev,
                           unsigned int dom,
@@ -612,3 +620,4 @@ int pcifront_disable_msix(struct pcifront_dev *dev,
     
     return op.err;
 }
+EXPORT_SYMBOL(pcifront_disable_msix);
-- 
2.35.3


