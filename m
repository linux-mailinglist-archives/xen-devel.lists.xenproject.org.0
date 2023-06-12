Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7772BE8D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546952.854073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eYB-0005mw-MJ; Mon, 12 Jun 2023 10:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546952.854073; Mon, 12 Jun 2023 10:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8eYB-0005kR-J2; Mon, 12 Jun 2023 10:13:27 +0000
Received: by outflank-mailman (input) for mailman id 546952;
 Mon, 12 Jun 2023 10:13:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q8eYA-0005kL-DG
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:13:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8eY9-0003TB-RS; Mon, 12 Jun 2023 10:13:25 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8eY9-0005dS-Ie; Mon, 12 Jun 2023 10:13:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=GWbKTNtWba0nO8WoBj1n3aut1pwqhTCugtQVCTJNftI=; b=3xi5ba
	VMHx1q48uNZk0YvNrQrmeJPFYVCs2XiOSgSjYUmnAnl90fGbHNhlPmRZdBjMoQ3GqwD6Z3wYYRZFh
	nDGNTxMDfPGRebJicSo4gc6RkM77cUxextinor+mXtGMkNjaNB32uVnGhCW2UduSmNTY57DO3V4cs
	stfxuF5UqZY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstored: Correct the prototype of domain_max_chk()
Date: Mon, 12 Jun 2023 11:13:19 +0100
Message-Id: <20230612101319.29842-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Some version of GCC will complain because the prototype and the
declaration of domain_max_chk() don't match:

xenstored_domain.c:1503:6: error: conflicting types for 'domain_max_chk' due to enum/integer mismatch; have '_Bool(const struct connection *, enum accitem,  unsigned int)' [-Werror=enum-int-mismatch]
 1503 | bool domain_max_chk(const struct connection *conn, enum accitem what,
      |      ^~~~~~~~~~~~~~
In file included from xenstored_domain.c:31:
xenstored_domain.h:146:6: note: previous declaration of 'domain_max_chk' with type '_Bool(const struct connection *, unsigned int,  unsigned int)'
  146 | bool domain_max_chk(const struct connection *conn, unsigned int what,
      |      ^~~~~~~~~~~~~~

Update the prototype to match the declaration.

This was spotted by Gitlab CI with the job opensuse-tumbleweed-gcc.

Fixes: 685048441e1c ("tools/xenstore: switch quota management to be table based")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_domain.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index bf63f3fcc667..4950b00aee54 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -143,7 +143,7 @@ void acc_drop(struct connection *conn);
 void acc_commit(struct connection *conn);
 int domain_max_global_acc(const void *ctx, struct connection *conn);
 void domain_reset_global_acc(void);
-bool domain_max_chk(const struct connection *conn, unsigned int what,
+bool domain_max_chk(const struct connection *conn, enum accitem what,
 		    unsigned int val);
 
 extern long wrl_ntransactions;
-- 
2.40.1


