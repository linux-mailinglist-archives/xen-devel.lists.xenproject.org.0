Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A65511A5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352533.579371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bze-0003sJ-Se; Mon, 20 Jun 2022 07:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352533.579371; Mon, 20 Jun 2022 07:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bze-0003o4-Jc; Mon, 20 Jun 2022 07:38:42 +0000
Received: by outflank-mailman (input) for mailman id 352533;
 Mon, 20 Jun 2022 07:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bzc-0002ZD-Bd
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0b9888-f06b-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:38:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0014521BB8;
 Mon, 20 Jun 2022 07:38:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6946134CA;
 Mon, 20 Jun 2022 07:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IP0rL/gjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:32 +0000
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
X-Inumbo-ID: fc0b9888-f06b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUmUwfIlKzy4uayyFfnh4ZN+f1gTP+njO8tkwccWoP4=;
	b=MAKOBlsmDx/DpF2gfo0e6hjRB0chjmo+Fm8UcxMU7vC87txTwbnVPqFXpXstAKKwvpkldD
	b7IAcsjIzqCzfR/z9CJrG7kITaSInvFuo0tp/1bP4wfm7sTOMFAM1FSIEC0317AAUMLMSe
	+TO+qjXbqxbzUXKCrklkUqixCFUPueo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/8] mini-os: drop xenbus directory
Date: Mon, 20 Jun 2022 09:38:13 +0200
Message-Id: <20220620073820.9336-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xenbus directory contains only a single source. Move this source
up and remove the xenbus directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile                    | 3 +--
 xenbus/xenbus.c => xenbus.c | 0
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename xenbus/xenbus.c => xenbus.c (100%)

diff --git a/Makefile b/Makefile
index 9f95d197..16d1f5d6 100644
--- a/Makefile
+++ b/Makefile
@@ -57,6 +57,7 @@ src-y += sched.c
 src-y += shutdown.c
 src-$(CONFIG_TEST) += test.c
 src-$(CONFIG_BALLOON) += balloon.c
+src-$(CONFIG_XENBUS) += xenbus.c
 
 src-y += lib/ctype.c
 src-y += lib/math.c
@@ -67,8 +68,6 @@ src-y += lib/sys.c
 src-y += lib/xmalloc.c
 src-$(CONFIG_LIBXS) += lib/xs.c
 
-src-$(CONFIG_XENBUS) += xenbus/xenbus.c
-
 src-y += console/console.c
 src-y += console/xencons_ring.c
 src-$(CONFIG_CONSFRONT) += console/xenbus.c
diff --git a/xenbus/xenbus.c b/xenbus.c
similarity index 100%
rename from xenbus/xenbus.c
rename to xenbus.c
-- 
2.35.3


