Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF629859C4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803897.1214757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQff-0001Pd-6l; Wed, 25 Sep 2024 11:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803897.1214757; Wed, 25 Sep 2024 11:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQff-0001Mo-4B; Wed, 25 Sep 2024 11:59:03 +0000
Received: by outflank-mailman (input) for mailman id 803897;
 Wed, 25 Sep 2024 11:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=If8o=QX=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1stQfd-0001Mi-4m
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:59:01 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b32ca98-7b35-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 13:58:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BF0BA440C4;
 Wed, 25 Sep 2024 11:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48799C4CEC3;
 Wed, 25 Sep 2024 11:58:54 +0000 (UTC)
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
X-Inumbo-ID: 8b32ca98-7b35-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265536;
	bh=9lBC4d65KKRSmO1eJbpsc08w5T/98CswSFBKhln48QA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LIm3c006HRF7lnnZEgJnZVzFB23p8wxIO3d/+KDjoNwtLBn+OQKGIkz2l+GcRENI2
	 3R2y8twPAt0SapOQYT8t6XSxYyZ72Sh1GX7SLH/LMoPiB9J5M8LHs++Rpy5fPQaJFa
	 p/rwh3MO9G2Y49+x9oz3A4j3pH5ZbNEhP+OIkkywsLSO33OhxTPqJJ1vvORVuKdGot
	 Fd06Qj6Sy0ZIcKdu/dCPpYQeBLiFWPCO+j+r36XjmXAGFHc3KZDcfW6Skoqo9CtsKg
	 MYSPLiEk+mhuRfIfFFMaUFBZN0bpx1Q0VDOgH+TrgIl399GUsoHHhDueagWwUyHRtt
	 lYtFXo8TLRwXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeongjun Park <aha310510@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	wei.liu@kernel.org,
	paul@xen.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 011/197] net/xen-netback: prevent UAF in xenvif_flush_hash()
Date: Wed, 25 Sep 2024 07:50:30 -0400
Message-ID: <20240925115823.1303019-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit

From: Jeongjun Park <aha310510@gmail.com>

[ Upstream commit 0fa5e94a1811d68fbffa0725efe6d4ca62c03d12 ]

During the list_for_each_entry_rcu iteration call of xenvif_flush_hash,
kfree_rcu does not exist inside the rcu read critical section, so if
kfree_rcu is called when the rcu grace period ends during the iteration,
UAF occurs when accessing head->next after the entry becomes free.

Therefore, to solve this, you need to change it to list_for_each_entry_safe.

Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Link: https://patch.msgid.link/20240822181109.2577354-1-aha310510@gmail.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/xen-netback/hash.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
index ff96f22648efd..45ddce35f6d2c 100644
--- a/drivers/net/xen-netback/hash.c
+++ b/drivers/net/xen-netback/hash.c
@@ -95,7 +95,7 @@ static u32 xenvif_new_hash(struct xenvif *vif, const u8 *data,
 
 static void xenvif_flush_hash(struct xenvif *vif)
 {
-	struct xenvif_hash_cache_entry *entry;
+	struct xenvif_hash_cache_entry *entry, *n;
 	unsigned long flags;
 
 	if (xenvif_hash_cache_size == 0)
@@ -103,8 +103,7 @@ static void xenvif_flush_hash(struct xenvif *vif)
 
 	spin_lock_irqsave(&vif->hash.cache.lock, flags);
 
-	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
-				lockdep_is_held(&vif->hash.cache.lock)) {
+	list_for_each_entry_safe(entry, n, &vif->hash.cache.list, link) {
 		list_del_rcu(&entry->link);
 		vif->hash.cache.count--;
 		kfree_rcu(entry, rcu);
-- 
2.43.0


