Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697E2F9F10
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 13:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69649.124813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1TIm-0007O7-VN; Mon, 18 Jan 2021 12:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69649.124813; Mon, 18 Jan 2021 12:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1TIm-0007Ni-SI; Mon, 18 Jan 2021 12:06:32 +0000
Received: by outflank-mailman (input) for mailman id 69649;
 Mon, 18 Jan 2021 12:06:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1TIm-0007Nd-2v
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 12:06:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efafc66e-d45f-4b45-9678-3dcf42af7a42;
 Mon, 18 Jan 2021 12:06:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0ADB7ACBA;
 Mon, 18 Jan 2021 12:06:30 +0000 (UTC)
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
X-Inumbo-ID: efafc66e-d45f-4b45-9678-3dcf42af7a42
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610971590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6iNcyN7Kl6HeAw7fac0bU7X1mnM+1Tg2kyUNpDkinEE=;
	b=rA0rkQIbp6w+ujm0yK4lXFdx1Gscaouzl4juZ+7IiMQ4cIm6B3YPT8dCqO0eQmV11M+wie
	0j4YF70Wd71yPPkR42yRK+pf4cG7Q2bahGEp+Sy4Qyn/B3NpM4QuoTS99FaTKrSDb5+j4P
	6ZR8xik9P7Bpg4yLw40wxRLZ4WEe9Cs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libxenhypfs: fix reading of gzipped string
Date: Mon, 18 Jan 2021 13:06:28 +0100
Message-Id: <20210118120628.11722-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a gzipped string value from hypfs doesn't add a 0 byte at the
end. Fix that.

Fixes: 86234eafb95295 ("libs: add libxenhypfs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/hypfs/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index f94c5ea1e2..52b30db8d7 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -146,12 +146,13 @@ static void *xenhypfs_inflate(void *in_data, size_t *sz)
             break;
 
         out_sz = z.next_out - workbuf;
-        content = realloc(content, *sz + out_sz);
+        content = realloc(content, *sz + out_sz + 1);
         if (!content) {
             ret = Z_MEM_ERROR;
             break;
         }
         memcpy(content + *sz, workbuf, out_sz);
+        *(char *)(content + *sz + out_sz) = 0;
     }
 
     inflateEnd(&z);
-- 
2.26.2


