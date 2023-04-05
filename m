Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D099C6D7E2C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518540.805216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cv-00084s-31; Wed, 05 Apr 2023 13:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518540.805216; Wed, 05 Apr 2023 13:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3cu-00082P-W1; Wed, 05 Apr 2023 13:56:40 +0000
Received: by outflank-mailman (input) for mailman id 518540;
 Wed, 05 Apr 2023 13:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pk3cs-0007mI-TH
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:56:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aebb4c0b-d3b9-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 15:56:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2780F20634;
 Wed,  5 Apr 2023 13:56:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0A4213A31;
 Wed,  5 Apr 2023 13:56:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cCeONRR+LWTSeAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 13:56:36 +0000
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
X-Inumbo-ID: aebb4c0b-d3b9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680702997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJpVodEY5mLUPTwqhB6PQxZ33ssAbKfS1kQ6CEUaSKQ=;
	b=ICMD0WG228KSxZpnbPT9WhTr77YIy+K2/4tIt2/1rxBAm33MSOIT5lZcnBXbdPAo165omS
	tibC4ydjOIu/4lEN2EmBEmqKafzYNwZ7irgtWCTYjikvA7EkRQlcS64l+jI9hR2k5+WNdS
	Xb7SGc9jYF1y4cFySy5JbUiOwPpTPmA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Date: Wed,  5 Apr 2023 15:56:28 +0200
Message-Id: <20230405135629.21829-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405135629.21829-1-jgross@suse.com>
References: <20230405135629.21829-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to support hypervisor analysis of crash dumps, xen-syms needs
to contain debug_info. It should be allowed to configure the hypervisor
to be built with CONFIG_DEBUG_INFO in non-debug builds without having
to enable EXPERT.

Using a rather oldish gcc (7.5) it was verified that code generation
doesn't really differ between CONFIG_DEBUG_INFO on or off without
CONFIG_DEBUG being set (only observed differences were slightly
different symbol addresses, verified via "objdump -d", resulting from
the different config.gz in the binary). The old gcc version selection
was based on the assumption, that newer gcc won't regress in this
regard.

So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.

It should be mentioned that there have been reports that the linking
of the xen.efi might take considerably longer with CONFIG_DEBUG_INFO
selected when using newer binutils.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- expanded commit message (Jan Beulich)
V3:
- move DEBUG_INFO block to the end of the file (Jan Beulich)
---
 xen/Kconfig.debug | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index fad3050d4f..279dbe8274 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -28,13 +28,6 @@ config GDBSX
 	  If you want to enable support for debugging guests from dom0 via
 	  gdbsx then say Y.
 
-config DEBUG_INFO
-	bool "Compile Xen with debug info"
-	default y
-	---help---
-	  If you say Y here the resulting Xen will include debugging info
-	  resulting in a larger binary image.
-
 config FRAME_POINTER
 	bool "Compile Xen with frame pointers"
 	default DEBUG
@@ -132,4 +125,11 @@ source "arch/$(SRCARCH)/Kconfig.debug"
 
 endif # DEBUG || EXPERT
 
+config DEBUG_INFO
+	bool "Compile Xen with debug info"
+	default DEBUG
+	help
+	  If you say Y here the resulting Xen will include debugging info
+	  resulting in a larger binary image.
+
 endmenu
-- 
2.35.3


