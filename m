Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9249F971E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 17:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861887.1273935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOgLQ-0000Ox-51; Fri, 20 Dec 2024 16:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861887.1273935; Fri, 20 Dec 2024 16:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOgLQ-0000Mw-26; Fri, 20 Dec 2024 16:59:20 +0000
Received: by outflank-mailman (input) for mailman id 861887;
 Fri, 20 Dec 2024 16:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOgLP-0008Bw-AQ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 16:59:19 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb58e36-bef3-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 17:59:17 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 17:59:17 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 2BD21249D;
 Fri, 20 Dec 2024 17:59:17 +0100 (CET)
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
X-Inumbo-ID: bfb58e36-bef3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734713957; x=1766249957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zjQnlMsaSGWfGsQEe6M09GEFyw9td1gDFl+U5txZ89s=;
  b=QNQl3IpmWOzv3WWYmpsaaSdWT+2j/hiYC/YrZt4bDwYQU26+zNXAoQ1T
   /u1baMrzmM+giPrR4waWhw75hM9tjmWhHEEnm9BpCDzNZ5cCuSzfQT/Zf
   btRZZOpFQUq0Rcq9C/Li4z2FBeKkeYte6Gz4eXGxk1T+lWu/S5ZGhpsNJ
   I=;
X-CSE-ConnectionGUID: QKe6ummCS/WzZkNaNCWGTQ==
X-CSE-MsgGUID: +PZQN/0yRXq89cbRwlaFoQ==
X-IronPort-AV: E=Sophos;i="6.12,251,1728943200"; 
   d="scan'208";a="28280241"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/2] xen/tools: remove dead code
Date: Fri, 20 Dec 2024 17:55:02 +0100
Message-ID: <20241220165837.937976-3-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Default switch case exits directly; these instructions are never reached.

The file was taken from Linux; the copies have diverged a lot since:

```
$ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c | wc -l
984
```

Therefore the change is only applied locally.

Coverity-ID: 1458052
Fixes: 8c271b7584 ("build: import Kbuild/Kconfig from Linux 4.3")
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
--
Cc: Doug Goldstein <cardoe@cardoe.com>
---
 xen/tools/kconfig/expr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/tools/kconfig/expr.c b/xen/tools/kconfig/expr.c
index 77ffff3a05..be1400cdaf 100644
--- a/xen/tools/kconfig/expr.c
+++ b/xen/tools/kconfig/expr.c
@@ -1125,8 +1125,6 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	default:
 		return -1;
 	}
-	printf("[%dgt%d?]", t1, t2);
-	return 0;
 }
 
 void expr_print(struct expr *e,
-- 
2.47.1


