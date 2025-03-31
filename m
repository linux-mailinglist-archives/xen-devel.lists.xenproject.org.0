Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D1A76842
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932659.1334770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGJa-0007kC-Ib; Mon, 31 Mar 2025 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932659.1334770; Mon, 31 Mar 2025 14:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGJa-0007h9-Fa; Mon, 31 Mar 2025 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 932659;
 Mon, 31 Mar 2025 14:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8cRO=WS=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1tzGGk-0004lD-4p
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:37:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27c482f-0e3d-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 16:37:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D6FCEA41DAC;
 Mon, 31 Mar 2025 14:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737FDC4CEE9;
 Mon, 31 Mar 2025 14:37:38 +0000 (UTC)
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
X-Inumbo-ID: b27c482f-0e3d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431859;
	bh=EBUZ7/lyZdvglHul0hI2jt6KLmQWNLkkH/t966Me0jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDY6HbnyXjQoLmyZkPm2+mfwJkco58naAILC2MDsbzt8IB2BnM4aEJpsbbW2pduBX
	 21ZMwTJ8AfcHxqWxb4J7ZATNPL9Ss8xlSIT6z8KTcIqhBGaXRwXFQ0WzhJooNcl7YR
	 qGTkMfmkHWaKjJZWOOnytMB9nEJJQidfqAiQnOvIdAOBU2pmxXrQijAP2h3RlKjWc5
	 buNtXfsalOzE9fNZ8KnBaBnHY2Y4qZuWHlPgDjjlHc4euscoADPu8ZEzY6Wv6h1B37
	 fX/r6H2BUykYWFiXVOKYgFCpCLlrH3VLQkFPZQwSamjuQE5hV+VNpo6+FOHS7r3zRu
	 TBRL+UCzQyprg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 4/5] xen/mcelog: Add __nonstring annotations for unterminated strings
Date: Mon, 31 Mar 2025 10:37:25 -0400
Message-Id: <20250331143728.1686696-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143728.1686696-1-sashal@kernel.org>
References: <20250331143728.1686696-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees@kernel.org>

[ Upstream commit 1c3dfc7c6b0f551fdca3f7c1f1e4c73be8adb17d ]

When a character array without a terminating NUL character has a static
initializer, GCC 15's -Wunterminated-string-initialization will only
warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
with __nonstring to and correctly identify the char array as "not a C
string" and thereby eliminate the warning.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Kees Cook <kees@kernel.org>
Acked-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250310222234.work.473-kees@kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/xen/interface/xen-mca.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/interface/xen-mca.h b/include/xen/interface/xen-mca.h
index 73a4ea714d937..5db6116cd042c 100644
--- a/include/xen/interface/xen-mca.h
+++ b/include/xen/interface/xen-mca.h
@@ -365,7 +365,7 @@ struct xen_mce {
 #define XEN_MCE_LOG_LEN 32
 
 struct xen_mce_log {
-	char signature[12]; /* "MACHINECHECK" */
+	char signature[12] __nonstring; /* "MACHINECHECK" */
 	unsigned len;	    /* = XEN_MCE_LOG_LEN */
 	unsigned next;
 	unsigned flags;
-- 
2.39.5


