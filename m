Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011E352BB7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Apr 2021 17:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104888.200891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbk-0004TA-02; Fri, 02 Apr 2021 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104888.200891; Fri, 02 Apr 2021 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbj-0004Sl-SY; Fri, 02 Apr 2021 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 104888;
 Fri, 02 Apr 2021 15:21:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lSLbi-0004Sb-Hy
 for xen-devel@lists.xenproject.org; Fri, 02 Apr 2021 15:21:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbi-00009f-3w; Fri, 02 Apr 2021 15:21:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbh-00050B-Qp; Fri, 02 Apr 2021 15:21:10 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=8l2SWhRF4hXjT/n8ib3kpA3rAz6cYAQdMNmVVhQCfJc=; b=sZgkbqyKP4h660FFtsmJw+U7d
	uaIGvr6cJxJHac3CJ7UWPOxUrkgFZx9cJLjwUMP05gOTM4RpUSF92RdZB2tKqWCZev1SdMqOuhUj5
	ugMJhLkS52TzXfkeCIviCGmyFyEb/7PQ0l93y2sgniwl8KgThtDnO6trrZGAwSlv/VIKU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: kernel: Propagate the error if we fail to decompress the kernel
Date: Fri,  2 Apr 2021 16:21:04 +0100
Message-Id: <20210402152105.29387-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402152105.29387-1-julien@xen.org>
References: <20210402152105.29387-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, we are ignoring any error from perform_gunzip() and replacing
the compressed kernel with the "uncompressed" kernel.

If there is a gzip failure, then it means that the output buffer may
contain garbagge. So it can result to various sort of behavior that may
be difficult to root cause.

In case of failure, free the output buffer and propagate the error.
We also need to adjust the return check for kernel_compress() as
perform_gunzip() may return a positive value.

Take the opportunity to adjust the code style for the check.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/kernel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index ab78689ed2a6..f6b60ab77355 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -292,6 +292,12 @@ static __init int kernel_decompress(struct bootmodule *mod)
     iounmap(input);
     vunmap(output);
 
+    if ( rc )
+    {
+        free_domheap_pages(pages);
+        return rc;
+    }
+
     mod->start = page_to_maddr(pages);
     mod->size = output_size;
 
@@ -503,7 +509,7 @@ int __init kernel_probe(struct kernel_info *info,
 
     /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
     rc = kernel_decompress(mod);
-    if (rc < 0 && rc != -EINVAL)
+    if ( rc && rc != -EINVAL )
         return rc;
 
 #ifdef CONFIG_ARM_64
-- 
2.17.1


