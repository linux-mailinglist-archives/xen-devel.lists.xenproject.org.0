Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0182380156
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 02:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127117.238837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM8y-00057S-Tz; Fri, 14 May 2021 00:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127117.238837; Fri, 14 May 2021 00:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhM8y-00055g-QW; Fri, 14 May 2021 00:57:32 +0000
Received: by outflank-mailman (input) for mailman id 127117;
 Fri, 14 May 2021 00:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhM8x-0004or-7P
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 00:57:31 +0000
Received: from mail-io1-xd34.google.com (unknown [2607:f8b0:4864:20::d34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d522bf0-32e1-4d87-8967-518a75310e3d;
 Fri, 14 May 2021 00:57:28 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id k16so12586227ios.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 17:57:28 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g25sm1981538ion.32.2021.05.13.17.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 17:57:27 -0700 (PDT)
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
X-Inumbo-ID: 0d522bf0-32e1-4d87-8967-518a75310e3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=puac9P/1pH2gTjwWoFDjpCGPhH1RSMCtsgJsRORZsps=;
        b=uleaoi7pw6pKKSvyheVtu5WrdsRZupmmjo1QujTNyVGJQ8DgVhO7y4jFYpwCkJIhy2
         68VKEMoj9rYzzCOBLGWHjXSfvisPps5OKm/Jqp9PN5IR9eHiG2WO3QCYVHXMwSzLNd9A
         O0uK2IdzmG6w6ZUgWg0XIor/h80j1JteyuNu5gj+cCHZ6YX9EGGAKryY0N7AcUPnQcIK
         vIdeab3oi0stWuXuAWdv1sQQaa2U/oM1C01bnoAVje+WPnbUZxDSwbt0jDrGDvqpwA1v
         tpqspuZUJ3yxTcLvPcN9YJEahK0dWjqgC/eQ8eTK/DAK7lEatlPwq4qb3xayS5RwgZXG
         5QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=puac9P/1pH2gTjwWoFDjpCGPhH1RSMCtsgJsRORZsps=;
        b=hGQSuS5Ya6ZXoEbsfwfVaM1JLbuomZh9lYT8NVhfgsgS9/Vrcm5EoDKGjhl7GIaHWT
         MWHP++OThP9Z4ar3ua0wVp5GSAYIKTKbfZKDs05QLlhxVd+6hhJxEswt02xi6umpbhAD
         E2wRpqVaB0VyC3Go66hcl/Y53mY1r4YmUwRWbytc8x7vcJ1kDyJZN+EujH75dtX05zz/
         VqdJYu+zWiELZf4a3aIa1VkR2StcMBpKyK8PTfJu7iB88TYORG+t6H0Sr+Cgnnq6UZ+1
         vMGjgDtf3piuV4XM1AG4kOwgMuSjN4mOS9DOm98AgLZaeR2I5pXiHd2OvlId/uFV5BX5
         Yqxg==
X-Gm-Message-State: AOAM532h/dYTJhFxoJL6Yaka0zqCbQd/9MVyBYP1m2aXMCiQaar2jFKY
	rMhqo7g8TCLMJPjrwRucMKU=
X-Google-Smtp-Source: ABdhPJwxVFI67Tc3W19dlbyZNc1e3oxlbpVUX3LqDmZg7zTCXURGdjpwQ/MpJv+vQ6Drwqm86KEn+w==
X-Received: by 2002:a6b:7413:: with SMTP id s19mr32097168iog.151.1620953848097;
        Thu, 13 May 2021 17:57:28 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Connor Davis <connojdavis@gmail.com>,
	Jann Horn <jannh@google.com>,
	Lee Jones <lee.jones@linaro.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/4] usb: early: Avoid using DbC if already enabled
Date: Thu, 13 May 2021 18:56:48 -0600
Message-Id: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620950220.git.connojdavis@gmail.com>
References: <cover.1620950220.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if the debug capability is enabled in early_xdbc_parse_parameter,
and if it is, return with an error. This avoids collisions with whatever
enabled the DbC prior to linux starting.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 drivers/usb/early/xhci-dbc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index be4ecbabdd58..ca67fddc2d36 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -642,6 +642,16 @@ int __init early_xdbc_parse_parameter(char *s)
 	}
 	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
 
+	if (readl(&xdbc.xdbc_reg->control) & CTRL_DBC_ENABLE) {
+		pr_notice("xhci debug capability already in use\n");
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		xdbc.xdbc_reg = NULL;
+		xdbc.xhci_base = NULL;
+		xdbc.xhci_length = 0;
+
+		return -ENODEV;
+	}
+
 	return 0;
 }
 
-- 
2.31.1


