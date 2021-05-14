Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E8380155
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 02:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127118.238849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM94-0005Rt-5e; Fri, 14 May 2021 00:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127118.238849; Fri, 14 May 2021 00:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM94-0005Pw-2N; Fri, 14 May 2021 00:57:38 +0000
Received: by outflank-mailman (input) for mailman id 127118;
 Fri, 14 May 2021 00:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhM92-0004or-7V
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 00:57:36 +0000
Received: from mail-il1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e29672f-6039-4915-8178-e9f5cbd9e28c;
 Fri, 14 May 2021 00:57:30 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id j20so24501126ilo.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 17:57:30 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g25sm1981538ion.32.2021.05.13.17.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 17:57:29 -0700 (PDT)
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
X-Inumbo-ID: 1e29672f-6039-4915-8178-e9f5cbd9e28c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z8NQKucDlsKkxpg+tgse/goMcErijkf42rV8EohDD7E=;
        b=XPPSHBsT1q8Fxl+w7tsnDyetbBVg32loktCtiMutZPMZIISb8G6/GOpGW/bBxc7Fyk
         ovDFeN8lUi41edNc42vxwYIpcbQSWxIimpk/T9X4PdIro4BqkmTQEQIl2BRbrflIHNtL
         FR32/T6odk0CN7rtrJxiT9yaelI1GYH8zx7ipxdWXMtE3dENIKAEQcir1Y6jXo62X44O
         2B0r5QCCaySuiDu1AOCDk3UAYtbNJqNq9GXDlgLfPkJIWZ+NDzqKYJ/x80gq7GyD3zd4
         wecV1mmOxov5sOzjwH4D3cMXaUlU/PFSBZ3xaqkdtbKrJH7k5MiA/gs3wQ4kGBXtlwyq
         LHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z8NQKucDlsKkxpg+tgse/goMcErijkf42rV8EohDD7E=;
        b=R8Y7GddajITsVjQLPfLqwv+i1AF61nyYKb4FxtawEuCUuria3amPeKvc48R0Lj+iO8
         5Cr78oLqmOERKC3WsQTJxQXmsa50MAh+YU5aJfZj4Y6idznAOJa4W/B00QhWYKpvCWh0
         mqC6wyDJEZ4Yyg36Nh8G2UbYjw/0skz9w6mQUYLhP0UgS0NkBYkhMqkcWgUXBuotUh4i
         CfEgiJ+hGFGezW3S8uJN1dlzsLlynxSm/93tm6ERHWBYAqi66qRqe33dFzUTE2Bngb7N
         VP+PuozukEAhah/gV4foh/SLvJkXB6H7sOsiMZwnkBk0WdzbulqbbYSOPoYuod1fakEw
         hn7A==
X-Gm-Message-State: AOAM533wCMvCvXnxYqsrW1slfd7X00En98Ur2LTXjWpGN9KhY84E1o3E
	3xSlFxLG+cyvEMppOZO/czA=
X-Google-Smtp-Source: ABdhPJz55umq4EwDtw961MeN5IVmysZGtNDtXlv5xDHKKiDYO8Bs+8fzkkIvkTpg7mxfFPiPP4ae6A==
X-Received: by 2002:a92:b751:: with SMTP id c17mr39545880ilm.121.1620953849854;
        Thu, 13 May 2021 17:57:29 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] xen: Export dbgp functions when CONFIG_XEN_DOM0 is enabled
Date: Thu, 13 May 2021 18:56:49 -0600
Message-Id: <291659390aff63df7c071367ad4932bf41e11aef.1620952511.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
References: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export xen_dbgp_reset_prep and xen_dbgp_external_startup
when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
even if CONFIG_EARLY_PRINK_DBGP is defined.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
Acked-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/dbgp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/dbgp.c b/drivers/xen/dbgp.c
index cfb5de31d860..fef32dd1a5dc 100644
--- a/drivers/xen/dbgp.c
+++ b/drivers/xen/dbgp.c
@@ -44,7 +44,7 @@ int xen_dbgp_external_startup(struct usb_hcd *hcd)
 	return xen_dbgp_op(hcd, PHYSDEVOP_DBGP_RESET_DONE);
 }
 
-#ifndef CONFIG_EARLY_PRINTK_DBGP
+#if defined(CONFIG_XEN_DOM0) || !defined(CONFIG_EARLY_PRINTK_DBGP)
 #include <linux/export.h>
 EXPORT_SYMBOL_GPL(xen_dbgp_reset_prep);
 EXPORT_SYMBOL_GPL(xen_dbgp_external_startup);
-- 
2.31.1


