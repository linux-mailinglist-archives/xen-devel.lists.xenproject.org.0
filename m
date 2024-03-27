Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BF88DE52
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 13:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698501.1090211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSBQ-00066x-MX; Wed, 27 Mar 2024 12:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698501.1090211; Wed, 27 Mar 2024 12:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSBQ-00064k-Jo; Wed, 27 Mar 2024 12:15:08 +0000
Received: by outflank-mailman (input) for mailman id 698501;
 Wed, 27 Mar 2024 12:15:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0gLn=LB=kernel.org=hawk@srs-se1.protection.inumbo.net>)
 id 1rpSBP-00064c-Fe
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 12:15:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a9fe4e-ec33-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 13:15:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5EA1BCE178E;
 Wed, 27 Mar 2024 12:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A77AC433F1;
 Wed, 27 Mar 2024 12:14:57 +0000 (UTC)
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
X-Inumbo-ID: a4a9fe4e-ec33-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711541700;
	bh=TGBhXpvpwt3Sy3sv2afWOztmZwM+ykD/J2PKpMOqi3Y=;
	h=Subject:From:To:Cc:Date:From;
	b=PYfnWiDT6yaDffCHSBNbxd/CZkoZKj1v7nQKhcq6vzD0VwH0OXGv5VfOGgyBD8v90
	 qPS/mJPXlpPhOIP/niHhiwqrUUuy7iFAF5tDaoxYXOqlQAxob4/po+74o3HWUt8Y6q
	 rpZKtfaNZhR4jePfk7Z36DZq7ruT8yciszVfOSFQhudT+jKvdiIIMSBfGKWcx36tys
	 F4UQDnywU4BH0/TJqSXPpVoq+rnv68d7dUgRKXCngCUEWtKswYL9GWa96/O/mRhovJ
	 zLRenmEYeFHF+yPH1saJv1oWQ75ayKDq0vRsuPhfJKf4SaPo/YiVPGXhED/aVDoEYw
	 AfISea9uz1zRg==
Subject: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
From: Jesper Dangaard Brouer <hawk@kernel.org>
To: netdev@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, arthurborsboom@gmail.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org,
 paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com,
 dkirjanov@suse.de, kernel-team@cloudflare.com, security@xenproject.org,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Date: Wed, 27 Mar 2024 13:14:56 +0100
Message-ID: <171154167446.2671062.9127105384591237363.stgit@firesoul>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Notice that skb_mark_for_recycle() is introduced later than fixes tag in
6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").

It is believed that fixes tag were missing a call to page_pool_release_page()
between v5.9 to v5.14, after which is should have used skb_mark_for_recycle().
Since v6.6 the call page_pool_release_page() were removed (in 535b9c61bdef
("net: page_pool: hide page_pool_release_page()") and remaining callers
converted (in commit 6bfef2ec0172 ("Merge branch
'net-page_pool-remove-page_pool_release_page'")).

This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool: catch
page_pool memory leaks").

Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
---
Compile tested only, can someone please test this

 drivers/net/xen-netfront.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index ad29f370034e..8d2aee88526c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -285,6 +285,7 @@ static struct sk_buff *xennet_alloc_one_rx_buffer(struct netfront_queue *queue)
 		return NULL;
 	}
 	skb_add_rx_frag(skb, 0, page, 0, 0, PAGE_SIZE);
+	skb_mark_for_recycle(skb);
 
 	/* Align ip header to a 16 bytes boundary */
 	skb_reserve(skb, NET_IP_ALIGN);



