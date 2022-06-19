Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6596550907
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 08:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352044.578786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2ont-0004qc-M9; Sun, 19 Jun 2022 06:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352044.578786; Sun, 19 Jun 2022 06:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2ont-0004ma-Ep; Sun, 19 Jun 2022 06:53:01 +0000
Received: by outflank-mailman (input) for mailman id 352044;
 Sun, 19 Jun 2022 06:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2onr-0004F8-Np
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 06:52:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c3744e-ef9c-11ec-b725-ed86ccbb4733;
 Sun, 19 Jun 2022 08:52:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 089FE1FD96;
 Sun, 19 Jun 2022 06:52:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBB2F13427;
 Sun, 19 Jun 2022 06:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UCh0LMfHrmJzXgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Jun 2022 06:52:55 +0000
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
X-Inumbo-ID: 72c3744e-ef9c-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655621576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmLVZAezCgzTgOsivEiAdLkZ5h3o4dxtcy7J5SE1ulo=;
	b=Nki0XgCrhrAtcSGlsxAi7Igkh5HutNGZ1se7+Qjw1BBYbqM1ZY0J1CSIw1nMGG1OpYVOiY
	+m6BU7OVZtvEUC25lBZiXcEUIOPKtCqF4yYh9bgSp+xdmgOgyw9/zMQeHmMmN65rC/rJj9
	FhKCY+x9DOhzuOKuHa//gpUF4UEX9Mw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 4/4] mini-os: fix bug in ballooning on PVH
Date: Sun, 19 Jun 2022 08:52:53 +0200
Message-Id: <20220619065253.19503-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220619065253.19503-1-jgross@suse.com>
References: <20220619065253.19503-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a subtle bug in ballooning code for PVH: in case ballooning
extends above a non-RAM area of the memory map, wrong pages will be
used.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/balloon.c b/balloon.c
index 6ad07644..55be8141 100644
--- a/balloon.c
+++ b/balloon.c
@@ -124,7 +124,7 @@ int balloon_up(unsigned long n_pages)
     for ( pfn = 0; pfn < rc; pfn++ )
     {
         arch_pfn_add(start_pfn + pfn, balloon_frames[pfn]);
-        free_page(pfn_to_virt(nr_mem_pages + pfn));
+        free_page(pfn_to_virt(start_pfn + pfn));
     }
 
     nr_mem_pages += rc;
-- 
2.35.3


