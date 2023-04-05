Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC06D7E2B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518541.805227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cz-0008Nx-G7; Wed, 05 Apr 2023 13:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518541.805227; Wed, 05 Apr 2023 13:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cz-0008KQ-D2; Wed, 05 Apr 2023 13:56:45 +0000
Received: by outflank-mailman (input) for mailman id 518541;
 Wed, 05 Apr 2023 13:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pk3cy-0007mI-Kd
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:56:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b21a5398-d3b9-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 15:56:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C81BD20634;
 Wed,  5 Apr 2023 13:56:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8864513A31;
 Wed,  5 Apr 2023 13:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aZsHIBp+LWTeeAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 13:56:42 +0000
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
X-Inumbo-ID: b21a5398-d3b9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680703002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7E8xLpIHHyBj6gOvbHVGHsCDEUl39NE+WedwK4I/34=;
	b=MxDaNNi+YFuqUHP7aB796xrZ4HmTYr/kmjo7qmjvN1Tpga2ne9dHvL83hwTuBHGVdDsq/w
	OEPIkmzi/YgnHxOG9TOPMcAeoa923Ia58r3Y3uMV0P71qbeBjCsURWOcMwHXTz9XNH3A8X
	xW0xz7fVyw2rQyr01HbJ/MM/MfsnOFI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] xen: update CONFIG_DEBUG_INFO help text
Date: Wed,  5 Apr 2023 15:56:29 +0200
Message-Id: <20230405135629.21829-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405135629.21829-1-jgross@suse.com>
References: <20230405135629.21829-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the help text of the CONFIG_DEBUG_INFO option to be a little
bit more specific.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- expand help text, especially mentioning INSTALL_EFI_STRIP
  (Jan Beulich)
V3:
- expand help text even more (Jan Beulich)
---
 xen/Kconfig.debug | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 279dbe8274..94e818ee09 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -129,7 +129,15 @@ config DEBUG_INFO
 	bool "Compile Xen with debug info"
 	default DEBUG
 	help
-	  If you say Y here the resulting Xen will include debugging info
-	  resulting in a larger binary image.
+	  Say Y here if you want to build Xen with debug information. This
+	  information is needed e.g. for doing crash dump analysis of the
+	  hypervisor via the "crash" tool.
+	  Saying Y will increase the size of the xen-syms and xen.efi
+	  binaries. In case the space on the EFI boot partition is rather
+	  limited, you may want to install a stripped variant of xen.efi in
+	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
+	  docs/misc/efi.pandoc for more information - when not using
+	  "make install-xen" for installing xen.efi, stripping needs to be
+	  done outside the Xen build environment).
 
 endmenu
-- 
2.35.3


