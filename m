Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BC5511A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352529.579338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzb-00032o-QB; Mon, 20 Jun 2022 07:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352529.579338; Mon, 20 Jun 2022 07:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzb-0002wp-DA; Mon, 20 Jun 2022 07:38:39 +0000
Received: by outflank-mailman (input) for mailman id 352529;
 Mon, 20 Jun 2022 07:38:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bza-0002ZD-BS
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc6d24bb-f06b-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:38:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9F1A1F383;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BC73134CA;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aAbZHPkjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:33 +0000
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
X-Inumbo-ID: fc6d24bb-f06b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnPzvgMWe8RIRQajkOAJiVhJlYFwWqqQzJSgyQ7guJk=;
	b=CzZNsrKQQhGFss+TpjyunC4m5576B69vSH9hfI+3uRjliaCOAI0gFyhtNBlW0XHgOzp7uT
	9pRjAc041oQJ5rsL3/RqoCmPvC6Yk3vYPH9beMMJHA6MFgwPxlTxqexwQv/xK6KM67Sf1N
	IiAm934tudtI2+QIdwABW85FwF0cA6Q=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/8] mini-os: rename console/xenbus.c to consfront.c
Date: Mon, 20 Jun 2022 09:38:16 +0200
Message-Id: <20220620073820.9336-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move console/xenbus.c into the main directory and rename it to
consfront.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile                        | 2 +-
 console/xenbus.c => consfront.c | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename console/xenbus.c => consfront.c (100%)

diff --git a/Makefile b/Makefile
index 16d1f5d6..509d927b 100644
--- a/Makefile
+++ b/Makefile
@@ -37,6 +37,7 @@ TARGET := mini-os
 SUBDIRS := lib xenbus console
 
 src-$(CONFIG_BLKFRONT) += blkfront.c
+src-$(CONFIG_CONSFRONT) += consfront.c
 src-$(CONFIG_TPMFRONT) += tpmfront.c
 src-$(CONFIG_TPM_TIS) += tpm_tis.c
 src-$(CONFIG_TPMBACK) += tpmback.c
@@ -70,7 +71,6 @@ src-$(CONFIG_LIBXS) += lib/xs.c
 
 src-y += console/console.c
 src-y += console/xencons_ring.c
-src-$(CONFIG_CONSFRONT) += console/xenbus.c
 
 # The common mini-os objects to build.
 APP_OBJS :=
diff --git a/console/xenbus.c b/consfront.c
similarity index 100%
rename from console/xenbus.c
rename to consfront.c
-- 
2.35.3


