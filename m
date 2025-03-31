Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F753A76848
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932696.1334790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGKK-0001JP-2d; Mon, 31 Mar 2025 14:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932696.1334790; Mon, 31 Mar 2025 14:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGKJ-0001HQ-Ua; Mon, 31 Mar 2025 14:41:23 +0000
Received: by outflank-mailman (input) for mailman id 932696;
 Mon, 31 Mar 2025 14:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8cRO=WS=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1tzGGV-0004lD-Hc
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:37:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9561413-0e3d-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 16:37:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1ED344CAB;
 Mon, 31 Mar 2025 14:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B6AC4CEE3;
 Mon, 31 Mar 2025 14:37:23 +0000 (UTC)
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
X-Inumbo-ID: a9561413-0e3d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431844;
	bh=nel+CNbtIcIbXhGVRK9Wmqiu+JKidiJ+yS/1506Ry7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J0IoV8ebfn91I62ieFegKX7b7/n0ECabbVHdq5Yq3oeNdgm4G63YuXDhZ7CXPRg7H
	 YaQ9EjU2h+ZOU9Vc471/lPYDXcJTsCnFurjf08WEasbfAX+hBi0k9fJwsjsnPx/Qf/
	 H6maW8aNCs5gs1QT+u+irPbrKuhLMW1/EKUYbUdjEVW8UFVVf/Nin4Eg3OPyKELh0K
	 A5EWXbpb2GxoY0FtyMQy+zfjmFNZzh9nsNh9FxY0HjfwCMD7mmcBJaDT8FPgMWC+DR
	 VmwclqxLN/Arnb94caQzYVJ27tN0FkECNnf70p7r3lIQxxIrD61bS6wM2lD6zXzS/N
	 vLOtH15Ah2Gmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.10 5/6] xen/mcelog: Add __nonstring annotations for unterminated strings
Date: Mon, 31 Mar 2025 10:37:07 -0400
Message-Id: <20250331143710.1686600-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143710.1686600-1-sashal@kernel.org>
References: <20250331143710.1686600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
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
index 7483a78d24251..20a3b320d1a58 100644
--- a/include/xen/interface/xen-mca.h
+++ b/include/xen/interface/xen-mca.h
@@ -371,7 +371,7 @@ struct xen_mce {
 #define XEN_MCE_LOG_LEN 32
 
 struct xen_mce_log {
-	char signature[12]; /* "MACHINECHECK" */
+	char signature[12] __nonstring; /* "MACHINECHECK" */
 	unsigned len;	    /* = XEN_MCE_LOG_LEN */
 	unsigned next;
 	unsigned flags;
-- 
2.39.5


