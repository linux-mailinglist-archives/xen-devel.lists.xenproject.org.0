Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DC233761
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:08:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1C1i-0003Un-2m; Thu, 30 Jul 2020 17:07:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1C1g-0003Ui-GY
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:07:28 +0000
X-Inumbo-ID: 25161424-d287-11ea-aaf6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25161424-d287-11ea-aaf6-12813bfff9fa;
 Thu, 30 Jul 2020 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0zBWlFRrrkUpoa8qvY/9++vofGF25KtTzc2Y4E7dkU=; b=BrkwV+KkCZPJ9e0pbzZAHuD6l/
 WscBnrngt7t03XBAw4v16wIZj2MVbckFpiOQnr3gaOWqYkAotQ3sK/GHPNrSXIAdEV9UXgbsAIIxJ
 MFOAwfkvhYlk2jEGwVFt/azbUrQyWIk/Sv0cEnFT/xxKO0jHvNe9hcCtiSNot6ZNumIU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1C1e-0006Eg-Pc; Thu, 30 Jul 2020 17:07:26 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1C1e-0002Kp-Ei; Thu, 30 Jul 2020 17:07:26 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: cmpxchg: Add missing memory barriers in
 __cmpxchg_mb_timeout()
Date: Thu, 30 Jul 2020 18:07:21 +0100
Message-Id: <20200730170721.23393-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The function __cmpxchg_mb_timeout() was intended to have the same
semantics as __cmpxchg_mb(). Unfortunately, the memory barriers were
not added when first implemented.

There is no known issue with the existing callers, but the barriers are
added given this is the expected semantics in Xen.

The issue was introduced by XSA-295.

Backport: 4.8+
Fixes: 86b0bc958373 ("xen/arm: cmpxchg: Provide a new helper that can timeout")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-arm/arm32/cmpxchg.h | 8 +++++++-
 xen/include/asm-arm/arm64/cmpxchg.h | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
index 49ca2a0d7ab1..0770f272ee99 100644
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -147,7 +147,13 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
 					       int size,
 					       unsigned int max_try)
 {
-	return __int_cmpxchg(ptr, old, new, size, true, max_try);
+	bool ret;
+
+	smp_mb();
+	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
+	smp_mb();
+
+	return ret;
 }
 
 #define cmpxchg(ptr,o,n)						\
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
index 5bc2e1f78674..fc5c60f0bd74 100644
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -160,7 +160,13 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
 					       int size,
 					       unsigned int max_try)
 {
-	return __int_cmpxchg(ptr, old, new, size, true, max_try);
+	bool ret;
+
+	smp_mb();
+	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
+	smp_mb();
+
+	return ret;
 }
 
 #define cmpxchg(ptr, o, n) \
-- 
2.17.1


