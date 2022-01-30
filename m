Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399F4A3532
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 09:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262419.454649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5oL-0007Mx-VH; Sun, 30 Jan 2022 08:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262419.454649; Sun, 30 Jan 2022 08:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5oL-0007Ko-Qf; Sun, 30 Jan 2022 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 262419;
 Sun, 30 Jan 2022 08:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KjUP=SO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nE5oJ-00074R-Ug
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 08:43:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcffdc11-81a8-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 09:43:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 918A11F38D;
 Sun, 30 Jan 2022 08:43:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52CA313AD5;
 Sun, 30 Jan 2022 08:43:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFgIE8JP9mHCRAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 30 Jan 2022 08:43:46 +0000
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
X-Inumbo-ID: bcffdc11-81a8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643532226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPRyPJdmoL/IpCVfXAjgQmnKBF7umHDcVs/C1j00ZPk=;
	b=J9riLkTIfwn0L3O8g4xQgY65dfRAVHlfpCmm5VHb+VylOC0FiAflLkKx97zndMKsmKeG6U
	ktTRL4iDpExxYlutUpmqytGkhjI1aut9i9yjnpy+kjAYRVs5c4YWXZVudBbj+n5xlKGQZh
	8winziOx1G2Zc0zgRmWKW0ggLk4RAXQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/5] tools/libs/toolcore: replace _xentoolcore_list.h with _xen_list.h
Date: Sun, 30 Jan 2022 09:43:41 +0100
Message-Id: <20220130084343.19070-4-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220130084343.19070-1-jgross@suse.com>
References: <20220130084343.19070-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove generating _xentoolcore_list.h and use the common _xen_list.h
instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                           | 1 -
 tools/include/xentoolcore_internal.h | 4 ++--
 tools/libs/toolcore/Makefile         | 8 --------
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3f9d55ba87..afe78c787c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -227,7 +227,6 @@ tools/hotplug/NetBSD/rc.d/xencommons
 tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
 tools/include/_libxl*.h
-tools/include/_xentoolcore_list.h
 tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
diff --git a/tools/include/xentoolcore_internal.h b/tools/include/xentoolcore_internal.h
index 04f5848f09..deccefd612 100644
--- a/tools/include/xentoolcore_internal.h
+++ b/tools/include/xentoolcore_internal.h
@@ -27,7 +27,7 @@
 #include <stddef.h>
 
 #include "xentoolcore.h"
-#include "_xentoolcore_list.h"
+#include "_xen_list.h"
 
 /*---------- active handle registration ----------*/
 
@@ -87,7 +87,7 @@ typedef int Xentoolcore__Restrict_Callback(Xentoolcore__Active_Handle*,
 
 struct Xentoolcore__Active_Handle {
     Xentoolcore__Restrict_Callback *restrict_callback;
-    XENTOOLCORE_LIST_ENTRY(Xentoolcore__Active_Handle) entry;
+    XEN_LIST_ENTRY(Xentoolcore__Active_Handle) entry;
 };
 
 void xentoolcore__register_active_handle(Xentoolcore__Active_Handle*);
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index ed4ae00694..9c013b2879 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
-AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
 LIBHEADER := xentoolcore.h
 
@@ -12,10 +11,3 @@ SRCS-y	+= handlereg.c
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 PKG_CONFIG_DESC := Central support for Xen Hypervisor userland libraries
-
-$(LIB_OBJS): $(AUTOINCS)
-$(PIC_OBJS): $(AUTOINCS)
-
-$(XEN_INCLUDE)/_xentoolcore_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=xentoolcore >$(notdir $@).new
-	$(call move-if-changed,$(notdir $@).new,$@)
-- 
2.31.1


