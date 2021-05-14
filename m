Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FD380158
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 02:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127119.238862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM99-0005oy-Ie; Fri, 14 May 2021 00:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127119.238862; Fri, 14 May 2021 00:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM99-0005nD-DD; Fri, 14 May 2021 00:57:43 +0000
Received: by outflank-mailman (input) for mailman id 127119;
 Fri, 14 May 2021 00:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhM97-0004or-7a
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 00:57:41 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44082472-4656-4a6d-84d0-b4f193f1ea8e;
 Fri, 14 May 2021 00:57:31 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d11so6153836iod.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 17:57:31 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g25sm1981538ion.32.2021.05.13.17.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 17:57:31 -0700 (PDT)
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
X-Inumbo-ID: 44082472-4656-4a6d-84d0-b4f193f1ea8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kaolo11x7BDn/0QfbTzKyesjjtUEBXBeIP8y1OlvuS8=;
        b=oNgcz//ZDfFesKvkG1DPiB9mV5Cjp3q09B7rZg/T1l5DnxEicJF0uHcIatOkszgULL
         SQEJkOvXso5TLe2DSdp1mnCW64dlGG6ReyWh0c7IIHMw9cwQsc362Qp27R2rjjO8CVQd
         Hsw6El7hP5PO+qzVt53ggMKbyvifV+phwY4TkxOVrtqS6hgLNDvZV6mBSbUARwiLfufR
         Ly6yjfKaiELXc2e4+vGzFYHJ0ZIMTafqZLtowv+yMlm4zsWPw3g2DEpcIKeDfUdmlAhM
         CdJOXn8FA9S3rpcCWGZkKyU4k5ld6wYJ5P997dkD5hYRHf17+oUiV7WuTWVcVh/IGXQM
         RjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kaolo11x7BDn/0QfbTzKyesjjtUEBXBeIP8y1OlvuS8=;
        b=pe2bZeeiyWKawuIFSeIHAhu/NIyhFPeWGdoF4B/vDbL6TyYiCzyC88iWqhc45koHAa
         6Km9gyKoPnEcu2jYOLDdlZduvi3kBGH8xyUjLzkA29LlFwdiFZl3AUxPHCUQSK6pTnG2
         nd/lQEddadNF+Le/BM9VAzF/+2nSfL4Zd+mjBOdl8HAiZ8rJ7wlddMT6moFlK1hxJef2
         HzNGvFxq8IhGjo1DaRKGw+WDp7H7LsHLD6b1svshqDVhjn8NIuxLiuFHHHLXO3lUAwgE
         HyVjkVjgVxiYVjZBx2G4mfDaGCsC4NHD6G7V0bEH37Aks/5/4m+Zq56CHeU9wwa7zELf
         y9HA==
X-Gm-Message-State: AOAM531IYC2JZBZg/75ciyR6SSa+YUAHkMxCycwzJXG2/fPDMjtVc5Mq
	PhlLz3qvEDqUMJHH+RJ7/IY=
X-Google-Smtp-Source: ABdhPJygkbUw3fnDxhQdUp2/4URvzqUJF2PZVWTCLi/wLAoCtayuWSrLwm2fsyOwJJpdijs/Hs4iAg==
X-Received: by 2002:a05:6638:3013:: with SMTP id r19mr41336649jak.36.1620953851491;
        Thu, 13 May 2021 17:57:31 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Connor Davis <connojdavis@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Petr Mladek <pmladek@suse.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Lee Jones <lee.jones@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/4] usb: dbgp: Fix return values for reset prep and startup
Date: Thu, 13 May 2021 18:56:50 -0600
Message-Id: <0010a6165f3560f16123a142d297276e7d6c2087.1620952511.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
References: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Callers of dbgp_reset_prep treat a 0 return value as "stop using
the debug port", which means they don't make any subsequent calls to
dbgp_reset_prep or dbgp_external_startup.

To ensure the callers' interpretation is correct, first return -EPERM
from xen_dbgp_op if !xen_initial_domain(). This ensures that
both xen_dbgp_reset_prep and xen_dbgp_external_startup return 0
iff the PHYSDEVOP_DBGP_RESET_{PREPARE,DONE} hypercalls succeed. Also
update xen_dbgp_reset_prep and xen_dbgp_external_startup to return
-EPERM when !CONFIG_XEN_DOM0 for consistency.

Next, return nonzero from dbgp_reset_prep if xen_dbgp_reset_prep returns
0. The nonzero value ensures that callers of dbgp_reset_prep will
subsequently call dbgp_external_startup when it is safe to do so.

Also invert the return values from dbgp_external_startup for
consistency with dbgp_reset_prep (this inversion has no functional
change since no callers actually check the value).

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 drivers/usb/early/ehci-dbgp.c |  9 ++++++---
 drivers/xen/dbgp.c            |  2 +-
 include/linux/usb/ehci-dbgp.h | 14 +++++++++-----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index 45b42d8f6453..ff993d330c01 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -970,8 +970,8 @@ int dbgp_reset_prep(struct usb_hcd *hcd)
 	int ret = xen_dbgp_reset_prep(hcd);
 	u32 ctrl;
 
-	if (ret)
-		return ret;
+	if (!ret)
+		return 1;
 
 	dbgp_not_safe = 1;
 	if (!ehci_debug)
@@ -995,7 +995,10 @@ EXPORT_SYMBOL_GPL(dbgp_reset_prep);
 
 int dbgp_external_startup(struct usb_hcd *hcd)
 {
-	return xen_dbgp_external_startup(hcd) ?: _dbgp_external_startup();
+	if (!xen_dbgp_external_startup(hcd))
+		return 1;
+
+	return !_dbgp_external_startup();
 }
 EXPORT_SYMBOL_GPL(dbgp_external_startup);
 #endif /* USB */
diff --git a/drivers/xen/dbgp.c b/drivers/xen/dbgp.c
index fef32dd1a5dc..d54f98380e6f 100644
--- a/drivers/xen/dbgp.c
+++ b/drivers/xen/dbgp.c
@@ -15,7 +15,7 @@ static int xen_dbgp_op(struct usb_hcd *hcd, int op)
 	struct physdev_dbgp_op dbgp;
 
 	if (!xen_initial_domain())
-		return 0;
+		return -EPERM;
 
 	dbgp.op = op;
 
diff --git a/include/linux/usb/ehci-dbgp.h b/include/linux/usb/ehci-dbgp.h
index 62ab3805172d..c0e98557efc0 100644
--- a/include/linux/usb/ehci-dbgp.h
+++ b/include/linux/usb/ehci-dbgp.h
@@ -56,28 +56,32 @@ extern int xen_dbgp_external_startup(struct usb_hcd *);
 #else
 static inline int xen_dbgp_reset_prep(struct usb_hcd *hcd)
 {
-	return 1; /* Shouldn't this be 0? */
+	return -EPERM;
 }
 
 static inline int xen_dbgp_external_startup(struct usb_hcd *hcd)
 {
-	return -1;
+	return -EPERM;
 }
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK_DBGP
-/* Call backs from ehci host driver to ehci debug driver */
+/*
+ * Call backs from ehci host driver to ehci debug driver.
+ * Returns 0 if the debug port should stopped being used,
+ * nonzero otherwise.
+ */
 extern int dbgp_external_startup(struct usb_hcd *);
 extern int dbgp_reset_prep(struct usb_hcd *);
 #else
 static inline int dbgp_reset_prep(struct usb_hcd *hcd)
 {
-	return xen_dbgp_reset_prep(hcd);
+	return !xen_dbgp_reset_prep(hcd);
 }
 
 static inline int dbgp_external_startup(struct usb_hcd *hcd)
 {
-	return xen_dbgp_external_startup(hcd);
+	return !xen_dbgp_external_startup(hcd);
 }
 #endif
 
-- 
2.31.1


