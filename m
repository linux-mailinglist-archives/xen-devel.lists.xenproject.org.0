Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEE2337FA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CjH-0008AQ-UY; Thu, 30 Jul 2020 17:52:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1CjF-00089P-WB
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:52:30 +0000
X-Inumbo-ID: 6a6afc82-d28d-11ea-aaff-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6afc82-d28d-11ea-aaff-12813bfff9fa;
 Thu, 30 Jul 2020 17:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YMp6yPrLfWKrTtFlQljFXWPvFCrq7jJMWfWyLnEct0g=; b=dFsiwvxroEX580uHUCUg7Aoyyg
 ViSgZYMP4Yd22r4r5I/adNrFQV99Z7R7hPdhrPN3XJi3b1PXMdebgY2LMz54V5M4fZpKqTmAsQ3Fd
 btY1QUvSzlC2TdVqy6APhnbrGt8BP+f095I/dfQzVmeeG+vMOZCS29arIJB06MLpTDkc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj6-00079I-2x; Thu, 30 Jul 2020 17:52:20 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj5-0004nV-PA; Thu, 30 Jul 2020 17:52:20 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/7] xen/guest_access: Add emacs magics
Date: Thu, 30 Jul 2020 18:52:02 +0100
Message-Id: <20200730175213.30679-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
References: <20200730175213.30679-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Add emacs magics for xen/guest_access.h and
asm-x86/guest_access.h.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
    Changes in v2:
        - Remove the word "missing"
---
 xen/include/asm-x86/guest_access.h | 8 ++++++++
 xen/include/xen/guest_access.h     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index 2be3577bd340..3ffde205f6a1 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -160,3 +160,11 @@
 })
 
 #endif /* __ASM_X86_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 09989df819ce..ef9aaa3efcfe 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -33,3 +33,11 @@ char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
                                   size_t size, size_t max_size);
 
 #endif /* __XEN_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


