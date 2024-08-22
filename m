Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC495BE1A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 20:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781963.1191439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shCP9-0001ET-Ve; Thu, 22 Aug 2024 18:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781963.1191439; Thu, 22 Aug 2024 18:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shCP9-0001Cl-Sg; Thu, 22 Aug 2024 18:19:27 +0000
Received: by outflank-mailman (input) for mailman id 781963;
 Thu, 22 Aug 2024 18:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=90+L=PV=gmail.com=aha310510@srs-se1.protection.inumbo.net>)
 id 1shCHf-0000Z4-4W
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 18:11:43 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa872f73-60b1-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 20:11:41 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-201fbd0d7c2so11091805ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 11:11:40 -0700 (PDT)
Received: from kernelexploit-virtual-machine.localdomain ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385580831sm15450765ad.76.2024.08.22.11.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 11:11:38 -0700 (PDT)
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
X-Inumbo-ID: fa872f73-60b1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724350299; x=1724955099; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNG67etRpmbFoR543m1YIG0LZE60EP8XIWtrKthQBgo=;
        b=NiK8StwncW8vPAvd6j4jNsgtJ8Iw313Ba5rB+MduNWB9PvACDwmJ/AQZh/dtwvos70
         Wpl+TdFfY0fBd3FX8GTgIGTWOMm3sxe9UbXgg65rz41A8tw41VMtoMardwag+QoP+qpw
         ILwVOWGDWaa2A095BaywshR3UnTsCXbvZXFKzd61hvZJR1M1QDV1haT+sdZkzy4vmEvY
         4coxXXajzqcLFcvvqlyCpuPDGwTB61id84+j8y99MSpJPBm+pE7LRnh0SPPfQyWeoGdr
         41hAfWIf+qK7VNlLQ/4yvv4pOroJktgkZAvmrVlFa1voUJdkTVAV2LGPnll1AorNT7DD
         MaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724350299; x=1724955099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNG67etRpmbFoR543m1YIG0LZE60EP8XIWtrKthQBgo=;
        b=SzayclWg/rFN2UR4TKhSn2WhcuLkptxaaiwx6HePNJiCHqHK+NL7qY1Ef14B0N9yh7
         Wbjtp0zakda2f7YKS0qRJiH999qMxoxpa/FO6rCekqP7WLgkbCfMcAITmL+saSASnwVM
         pVuQZ9AOe5/Pn9KdTcujaX7wEIlzya8mTABAYPN2FXCgISZpOE64iDaER416Uwxx6CJV
         eGMH19AWnmAVanWV8nea/eITCuFCvTIExdC+E0R+roKT+pOCMxt9IJoImfjhkbsMqTuM
         PTHW9XsBVUvJhO6+tsHm7Rr4d2vIlpPfTPWRk1Cq6BheeWSrpPJhhVc4PLvkbpPgit9R
         t26w==
X-Forwarded-Encrypted: i=1; AJvYcCXqdsECazxI241YL8TR9hnJL075pZwOz8hfMR6yw+SBpHfnQvBR+n7CQHIUB44rujhlBT2c+1DQGq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhRj6Z6+upMt3kK5bt2QwKwXZlv9j1llowkrgIMl/FITTo4qjR
	N3zYmvza6ADSLzceQnJhs8KonD3ytvZZuIRzZaI1CwVW6LVnyKHl
X-Google-Smtp-Source: AGHT+IEsv5bpxwIHa8vqXEhWiIUlfLxE0wILbUZew8Lm3s6hLcp/D+7eE72ll9aRakt9he4VallMUg==
X-Received: by 2002:a17:902:f98b:b0:1fd:9105:7dd3 with SMTP id d9443c01a7336-203681d8e0emr53955695ad.64.1724350299146;
        Thu, 22 Aug 2024 11:11:39 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: wei.liu@kernel.org,
	paul@xen.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	madhuparnabhowmik04@gmail.com,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
Date: Fri, 23 Aug 2024 03:11:09 +0900
Message-Id: <20240822181109.2577354-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the list_for_each_entry_rcu iteration call of xenvif_flush_hash, 
kfree_rcu does not exist inside the rcu read critical section, so if 
kfree_rcu is called when the rcu grace period ends during the iteration, 
UAF occurs when accessing head->next after the entry becomes free.

Therefore, to solve this, you need to change it to list_for_each_entry_safe.

Fixes: f3265971ded9 ("net: xen-netback: hash.c: Use built-in RCU list checking")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/net/xen-netback/hash.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
index ff96f22648ef..45ddce35f6d2 100644
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

