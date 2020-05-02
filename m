Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCC1C26C1
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 18:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUufd-00015b-Bj; Sat, 02 May 2020 16:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUufc-00015U-9s
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 16:07:16 +0000
X-Inumbo-ID: f98e5e1c-8c8e-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f98e5e1c-8c8e-11ea-9887-bc764e2007e4;
 Sat, 02 May 2020 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wb54UEHsoeNGMmUecx4QgE7grxFabOL6fqWlr9nKSEQ=; b=U0+/ooRnDk2I96yc6AxomlNAcq
 ypC8j6cRb+EpsMAARN672EU5IsqoQ/lbfmhIdfsPtkYv+sXKZXdgJsdBVyr8HKZEMW/u/HaAJ5+El
 ADU9zLAg1VPcKOJiTeqmfHL8oAV7H2yiElJ8kKuul8GiPtaDMVOtmN3SSmq+s8oRy9UI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUufU-0000q3-7W; Sat, 02 May 2020 16:07:08 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUufT-00054b-RM; Sat, 02 May 2020 16:07:08 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 3/3] xen/x86: atomic: Don't allow to write atomically
 in a pointer to const
Date: Sat,  2 May 2020 17:07:00 +0100
Message-Id: <20200502160700.19573-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200502160700.19573-1-julien@xen.org>
References: <20200502160700.19573-1-julien@xen.org>
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, write_atomic() will happily write to a pointer to const.
While there are no use in Xen, it would be best to catch them at
compilation time.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-x86/atomic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/asm-x86/atomic.h b/xen/include/asm-x86/atomic.h
index 6b40f9c9f872..0a332b1fae18 100644
--- a/xen/include/asm-x86/atomic.h
+++ b/xen/include/asm-x86/atomic.h
@@ -63,6 +63,8 @@ void __bad_atomic_size(void);
 
 #define write_atomic(p, x) ({                             \
     typeof(*(p)) __x = (x);                               \
+    /* Check that the pointer is not const */             \
+    void *__maybe_unused p_ = &__x;                       \
     unsigned long x_ = (unsigned long)__x;                \
     switch ( sizeof(*(p)) ) {                             \
     case 1: write_u8_atomic((uint8_t *)(p), x_); break;   \
-- 
2.17.1


