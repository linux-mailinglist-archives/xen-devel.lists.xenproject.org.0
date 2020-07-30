Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7455F23384A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D8W-0002pf-EI; Thu, 30 Jul 2020 18:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D8U-0002pV-LK
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:18:34 +0000
X-Inumbo-ID: 1423ce86-d291-11ea-8db3-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1423ce86-d291-11ea-8db3-bc764e2007e4;
 Thu, 30 Jul 2020 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YMp6yPrLfWKrTtFlQljFXWPvFCrq7jJMWfWyLnEct0g=; b=uE0pJtyWHqtPs7wVr0qkuSn8Rl
 gdYFO9uCCvn20fWlhFQT/bVKL8Mw27xfQRp8o65w1xxXk+gcYRLEmVLXofjTGmwRePRJAFze89ip6
 6M8lJO7nUzmynUrMu0GZhhYp6Rv8Ub0/Do3SkAddsGvUYwg50GvoojExthBpMlPdaimM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8T-0007p0-3b; Thu, 30 Jul 2020 18:18:33 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D8S-0006Uf-Q2; Thu, 30 Jul 2020 18:18:33 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
Date: Thu, 30 Jul 2020 19:18:21 +0100
Message-Id: <20200730181827.1670-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730181827.1670-1-julien@xen.org>
References: <20200730181827.1670-1-julien@xen.org>
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


