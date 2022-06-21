Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4E552BC3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 09:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353000.579909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEL-00029r-QR; Tue, 21 Jun 2022 07:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353000.579909; Tue, 21 Jun 2022 07:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEL-00024v-KQ; Tue, 21 Jun 2022 07:23:21 +0000
Received: by outflank-mailman (input) for mailman id 353000;
 Tue, 21 Jun 2022 07:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3YEJ-0001Tw-E4
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 07:23:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e57763-f133-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 09:23:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D95C81FDE8;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD8C613A8F;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KJkaKeRxsWLDYwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Jun 2022 07:23:16 +0000
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
X-Inumbo-ID: 04e57763-f133-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655796196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iK4xpyO/24q/Du+ofA9DMrmGHYHqE1QdZ+2SGjY3+1E=;
	b=TLm0LLGu8RVX2fv2/nucY1GzNv04PipwpCSX20R8nj8u2d2/GfARxKo3E3i12mBoX3C118
	AJo8fKEsKkVQ/dzJsvG2yVV2e85TyQydpxL8HBcVMQ4Ay2tzCscsIf0usqacKMU8nnkGoz
	/1lCFwCJKeqkZ4qT7cwGYYBMhQVlchE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 4/4] mini-os: fix bug in ballooning on PVH
Date: Tue, 21 Jun 2022 09:23:14 +0200
Message-Id: <20220621072314.16382-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621072314.16382-1-jgross@suse.com>
References: <20220621072314.16382-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a subtle bug in ballooning code for PVH: in case ballooning
extends above a non-RAM area of the memory map, wrong pages will be
used.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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


