Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAED7E7BF0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630248.982961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pwt-0005Yz-0I; Fri, 10 Nov 2023 11:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630248.982961; Fri, 10 Nov 2023 11:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pws-0005XI-T2; Fri, 10 Nov 2023 11:45:18 +0000
Received: by outflank-mailman (input) for mailman id 630248;
 Fri, 10 Nov 2023 11:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Pn3-0007he-Do
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:35:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32192935-7fbd-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 12:35:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A2CD1F8BA;
 Fri, 10 Nov 2023 11:35:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D240B13398;
 Fri, 10 Nov 2023 11:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JNYFMmkVTmUYBAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 11:35:05 +0000
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
X-Inumbo-ID: 32192935-7fbd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699616106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEEtaKVN/DMgZvS8wiA2rruIly8+jtG6pBEpyWM89Hs=;
	b=iTkromXprVW3/nlojohrUMSkRDHKNbAXjPRqSQgXtZNtgoDrr9+z3Vs3FUuCmFlWEaWOxD
	NIKEOvNlJcgV421yMkbkpRvLV02NEins8CCiI+/mkuCA+fEg1h722mm7/EcdQlYiTcqKCH
	if+Qv8+FJKIqYgYb903VLkCAZFzBrk8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/5] Mini-OS: fix 9pfs response receiving
Date: Fri, 10 Nov 2023 12:34:35 +0100
Message-Id: <20231110113435.22609-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110113435.22609-1-jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


