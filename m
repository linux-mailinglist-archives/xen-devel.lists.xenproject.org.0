Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C246AD773
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 07:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507206.780472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQs6-0003Ln-TM; Tue, 07 Mar 2023 06:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507206.780472; Tue, 07 Mar 2023 06:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZQs6-0003Il-Q3; Tue, 07 Mar 2023 06:32:26 +0000
Received: by outflank-mailman (input) for mailman id 507206;
 Tue, 07 Mar 2023 06:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JVyd=67=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZQs5-00033H-5e
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 06:32:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1c04761-bcb1-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 07:32:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B04E1FE0C;
 Tue,  7 Mar 2023 06:32:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E27E813440;
 Tue,  7 Mar 2023 06:32:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RnIINnbaBmSuWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Mar 2023 06:32:22 +0000
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
X-Inumbo-ID: d1c04761-bcb1-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678170743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPgjXrNLvgzUHqKwlkvV6+Y9at3ZjxhnLYmXdQafiRA=;
	b=Dn9/0C4fXmGeaorjgKHh4hH5Mf/St3fpsVufrFqico0iefQ7BOQzHnJ7tNyFlAak7qk22F
	1/GEulRvXcPQOPIBXe+wK4MJjfw1Er9T0v+QGHSJBOdmro55F7Xy9fvrqA4lttSvprkHPv
	lUaOXrEXt0pncBTKJ+xhl2APFtqrLl8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Date: Tue,  7 Mar 2023 07:32:13 +0100
Message-Id: <20230307063214.30569-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230307063214.30569-1-jgross@suse.com>
References: <20230307063214.30569-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to support hypervisor analysis of crash dumps, xen-syms needs
to contain debug_info. It should be allowed to configure the hypervisor
to be built with CONFIG_DEBUG_INFO in non-debug builds without having
to enable EXPERT.

Using a rather oldish gcc (7.5) it was verified that code generation
doesn't really differ between CONFIG_DEBUG_INFO on or off without
CONFIG_DEBUG being set (only observed differences were slightly
different symbol addresses, verified via "objdump -d"). The old gcc
version selection was based on the assumption, that newer gcc won't
regress in this regard.

So move CONFIG_DEBUG_INFO out of the section guarded by EXPERT.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/Kconfig.debug | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index fad3050d4f..a2691f4239 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -11,6 +11,13 @@ config DEBUG
 
 	  You probably want to say 'N' here.
 
+config DEBUG_INFO
+	bool "Compile Xen with debug info"
+	default DEBUG
+	---help---
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


