Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A72453444
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226315.391039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzWb-0001nx-Iy; Tue, 16 Nov 2021 14:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226315.391039; Tue, 16 Nov 2021 14:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzWb-0001lW-Ft; Tue, 16 Nov 2021 14:33:29 +0000
Received: by outflank-mailman (input) for mailman id 226315;
 Tue, 16 Nov 2021 14:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Wk1=QD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mmzWZ-0001lN-K5
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:33:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28086a12-46ea-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 15:33:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C61B2193C;
 Tue, 16 Nov 2021 14:33:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EF2B13BAE;
 Tue, 16 Nov 2021 14:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1sJ0AjXBk2EEGwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Nov 2021 14:33:25 +0000
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
X-Inumbo-ID: 28086a12-46ea-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637073205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RN73WCaI8ljpUhVqo26XGliZVk9RTxTm02hvTAgXtAg=;
	b=Ix/M4CSo6AbjQJA+iGmiKSfudM/ceqO3tzFqj3tSGY7C84To/aSMZ2FE3CJ85liPpG1b9d
	B0hCRJnX+ZwBzfPtQHPYwSiY/fCInxhcmeF6PrkBjqq/Iz/UgExjVMGbBW1GRJgnpTnzse
	91OKAXqBVyFgGVjSljDQ+aK/jWSlC88=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: linux@weissschuh.net,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/privcmd: make option visible in Kconfig
Date: Tue, 16 Nov 2021 15:33:23 +0100
Message-Id: <20211116143323.18866-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This configuration option provides a misc device as an API to userspace.
Make this API usable without having to select the module as a transitive
dependency.

This also fixes an issue where localyesconfig would select
CONFIG_XEN_PRIVCMD=m because it was not visible and defaulted to
building as module.

Based-on-patch-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index a1b11c62da9e..a2e91d3ca372 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -259,9 +259,14 @@ config XEN_SCSI_BACKEND
 	  if guests need generic access to SCSI devices.
 
 config XEN_PRIVCMD
-	tristate
+	tristate "Xen hypercall passthrough driver"
 	depends on XEN
 	default m
+	help
+	  The hypercall passthrough driver allows user land programs to perform
+	  Xen hypercalls. This driver is normally required for systems running
+	  as Dom0 to perform privileged operations, but in some disaggregated
+	  Xen setups this driver might be needed for other domains, too.
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-- 
2.26.2


