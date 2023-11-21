Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA957F2957
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637639.993669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOm-0002bp-Cu; Tue, 21 Nov 2023 09:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637639.993669; Tue, 21 Nov 2023 09:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NOm-0002Zk-8S; Tue, 21 Nov 2023 09:50:28 +0000
Received: by outflank-mailman (input) for mailman id 637639;
 Tue, 21 Nov 2023 09:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5NOl-0007zB-4D
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:50:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646fbeb5-8853-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 10:50:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E93521979;
 Tue, 21 Nov 2023 09:50:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17BA9138E3;
 Tue, 21 Nov 2023 09:50:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K/VuBGB9XGWhNQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 09:50:24 +0000
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
X-Inumbo-ID: 646fbeb5-8853-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700560224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEEtaKVN/DMgZvS8wiA2rruIly8+jtG6pBEpyWM89Hs=;
	b=RwGWhfyB9qHCNw/w/9VaTGkxHfDfaHsS9buPKleCEVZxZFi6Of4UNX9lKsw7wtebD8ospa
	sPio5H9udGcRmQPzsPlHFoMbKot97nyE9JkTbAyU0kblakLFSPb6gGkxSwOQcd1fJgvbP+
	RBdGieVswBdRpuWvN5xeye5Od5pkF8U=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 5/5] Mini-OS: fix 9pfs response receiving
Date: Tue, 21 Nov 2023 10:49:53 +0100
Message-Id: <20231121094953.22430-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231121094953.22430-1-jgross@suse.com>
References: <20231121094953.22430-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.89
X-Spamd-Result: default: False [-2.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.59)[98.19%]
X-Spam-Flag: NO

When copying a 9pfs response chunk from the ring buffer across the
ring end, the local ring pointer and length field are not updated
correctly. Fix that.

Fixes: 0924fec1de58 ("Mini-OS: add 9pfs transport layer")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 9pfront.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/9pfront.c b/9pfront.c
index 43c7409f..35c5552b 100644
--- a/9pfront.c
+++ b/9pfront.c
@@ -386,7 +386,9 @@ static void copy_bufs(unsigned char **buf1, unsigned char **buf2,
             printk("9pfs: short copy (dropping %u bytes)\n", len - *len1);
             len = *len1;
         }
-        memcpy(target, *buf1, *len1);
+        memcpy(target, *buf1, len);
+        *buf1 += len;
+        *len1 -= len;
     }
 }
 
-- 
2.35.3


