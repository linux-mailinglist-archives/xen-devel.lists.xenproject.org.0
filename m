Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7E2B9B1C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 20:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31363.61704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHi-0005YL-BN; Thu, 19 Nov 2020 19:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31363.61704; Thu, 19 Nov 2020 19:07:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHi-0005Xc-5c; Thu, 19 Nov 2020 19:07:58 +0000
Received: by outflank-mailman (input) for mailman id 31363;
 Thu, 19 Nov 2020 19:07:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHh-0005X6-0z
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHg-0003Sl-LJ; Thu, 19 Nov 2020 19:07:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHg-0000TE-Ct; Thu, 19 Nov 2020 19:07:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHh-0005X6-0z
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=cmOxqGi+9sZD6PnyoF8KEWd7i5yr+UWn5KmlxEDs9uo=; b=Lb5VWktyWuxQbfI5AHpyAtvVK
	HPNbZUKsS1qxJyI+SzqO232NQnYpoo09mDrz5bqngnpw/B/4vG56k9gTPj51G+9kzsruNO0zzrElP
	Zg2FaikhScAI3HIQd8larppXIcOCHy2junX6L536ItQ1xhACDfGt8R432A9pFvCPJve7k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHg-0003Sl-LJ; Thu, 19 Nov 2020 19:07:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHg-0000TE-Ct; Thu, 19 Nov 2020 19:07:56 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFC 2/6] xen/arm: mm: Remove ; at the end of mm_printk()
Date: Thu, 19 Nov 2020 19:07:47 +0000
Message-Id: <20201119190751.22345-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The ; at the end of mm_printk() means the following code will not build
correctly:

if ( ... )
    mm_printk(...);
else
    ...

As we treat the macro as a function, we want to remove the ; at the end
of it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 4dd886f7c80d..59f8a3f15fd1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -59,7 +59,7 @@ mm_printk(const char *fmt, ...) {}
     {                                       \
         dprintk(XENLOG_ERR, fmt, ## args);  \
         WARN();                             \
-    } while (0);
+    } while (0)
 #endif
 
 /*
-- 
2.17.1


