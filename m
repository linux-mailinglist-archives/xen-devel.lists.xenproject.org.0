Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0F538CEA
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339233.564082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxIz-0000px-L6; Tue, 31 May 2022 08:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339233.564082; Tue, 31 May 2022 08:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxIz-0000oJ-Hi; Tue, 31 May 2022 08:32:45 +0000
Received: by outflank-mailman (input) for mailman id 339233;
 Tue, 31 May 2022 08:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aAxz=WH=163.com=ruc_gongyuanjun@srs-se1.protection.inumbo.net>)
 id 1nvxAC-000727-Ux
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:23:42 +0000
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f6fbf7ef-e0ba-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 10:23:36 +0200 (CEST)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by smtp12 (Coremail) with SMTP id EMCowACXPLd60JVim1EkAA--.3140S4;
 Tue, 31 May 2022 16:23:35 +0800 (CST)
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
X-Inumbo-ID: f6fbf7ef-e0ba-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZG+PeFg6fhZlDO5LBF
	hyhcdyBLVHiTzJWCs/9b9ygXM=; b=Ipgx3G+B/aHp2V/YD2ixPMHClUZrZQpsSQ
	bnIbMyzAGS3XhZyzZJXg2nc/h2obIozp2WDDljlxrR/f1ZU8nvgRDn31nFwLR3IE
	zKUv1jmvSINsDjZUB9PrgoohvLfC3wZ0MGT3D7LXNb6LwzD1Fb4fS152IDShdmJT
	8EueZWjIo=
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: xen-devel@lists.xenproject.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] tools/symbols: fix memory leak in build_initial_tok_table()
Date: Tue, 31 May 2022 16:23:20 +0800
Message-Id: <20220531082320.31294-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:EMCowACXPLd60JVim1EkAA--.3140S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUUhL0UUUUU
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbB0AcS5WEsqwoTLgAAsx

Free the table[i].sym field of the invalid sym_entry since
it is malloc'ed data.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 xen/tools/symbols.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index 710e9785d3..8daa588d2f 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -422,6 +422,8 @@ static void build_initial_tok_table(void)
 				table[pos] = table[i];
 			learn_symbol(table[pos].sym, table[pos].len);
 			pos++;
+			} else {
+				free(table[i].sym);
 		}
 	}
 	table_cnt = pos;
-- 
2.17.1


