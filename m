Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E96D4DAF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 18:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517536.803012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2o-0007cz-V5; Mon, 03 Apr 2023 16:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517536.803012; Mon, 03 Apr 2023 16:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjN2o-0007Zz-Rz; Mon, 03 Apr 2023 16:28:34 +0000
Received: by outflank-mailman (input) for mailman id 517536;
 Mon, 03 Apr 2023 16:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L93W=72=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjN2o-0007Zc-6r
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 16:28:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9272d6a0-d23c-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 18:28:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64B821FE73;
 Mon,  3 Apr 2023 16:28:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2652A13416;
 Mon,  3 Apr 2023 16:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S5DsB6/+KmS7XgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 03 Apr 2023 16:28:31 +0000
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
X-Inumbo-ID: 9272d6a0-d23c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680539311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51wZc2vktLAGkJYuxQvGjNEZLX6vduj0/qi4N/4LX8o=;
	b=sRrt0UANSYHctURzJeHSOgf3dlCzRjDQ92tgQODJD6alTJAPtn1UxexgDFEfzy2T8gmn/8
	ruCf7Gnuto4HknA4fzPaDAGuYOlM4fTyuYT728oRKQCTumjkruhJW9/pnLKwjVbmv0iSKY
	d5TR+k960biF2bUT+SQZOsQmWyrAR6s=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Date: Mon,  3 Apr 2023 18:28:22 +0200
Message-Id: <20230403162823.30681-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230403162823.30681-1-jgross@suse.com>
References: <20230403162823.30681-1-jgross@suse.com>
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
---
 xen/Kconfig.debug | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index fad3050d4f..e0d773d347 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -11,6 +11,13 @@ config DEBUG
 
 	  You probably want to say 'N' here.
 
+config DEBUG_INFO
+	bool "Compile Xen with debug info"
+	default DEBUG
+	help
+	  If you say Y here the resulting Xen will include debugging info
+	  resulting in a larger binary image.
+
 if DEBUG || EXPERT
 
 config CRASH_DEBUG
@@ -28,13 +35,6 @@ config GDBSX
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
-- 
2.35.3


