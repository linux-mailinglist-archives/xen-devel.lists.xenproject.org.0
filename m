Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA837B2EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 02:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126088.237358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca6-00015o-FV; Wed, 12 May 2021 00:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126088.237358; Wed, 12 May 2021 00:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca6-000139-Br; Wed, 12 May 2021 00:18:30 +0000
Received: by outflank-mailman (input) for mailman id 126088;
 Wed, 12 May 2021 00:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgca4-0000kd-C8
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 00:18:28 +0000
Received: from mail-il1-x133.google.com (unknown [2607:f8b0:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e7ffde7-960e-4ccf-ba48-8aeda0aaa6ca;
 Wed, 12 May 2021 00:18:27 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z1so10881633ils.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 17:18:27 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id v4sm8241490iol.3.2021.05.11.17.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 17:18:27 -0700 (PDT)
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
X-Inumbo-ID: 5e7ffde7-960e-4ccf-ba48-8aeda0aaa6ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=puac9P/1pH2gTjwWoFDjpCGPhH1RSMCtsgJsRORZsps=;
        b=KVnhpxSKSgjxFKZXFSiHszto+jk1TG6dHF6KfPOJDxdnW5ABx+HpY3LPhsV0oNEYdU
         oOY2KZnnEdfwyeoTn19rO/DWpWf0O3blIvpZ0JPdzTmItMYHWDFp4hP9TX8JFPXxs8t6
         OEOQhUyyUCvwrEwL+kXIgkSEVJBz+mIgiLVe1X9ca0uYQWF5H9EbzFZ77PHOPnKfdS2Z
         V76FL/tX9xIwhDf+ym/LTIwmGVj2VeuWwJyy+uEOBU9ZlksbvAQo4MmOawNclyzLEnpa
         IjYwCl2dc5uthpQGF5HR1mj1jfG5xvg1/BdoGsFLLYXQzg9LYFdfSxy7fb2uZpVBkOG4
         jyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=puac9P/1pH2gTjwWoFDjpCGPhH1RSMCtsgJsRORZsps=;
        b=CTxA60GRD+3ZVIgO6cAc809/V0mnUqiqUfacE1BYLVqxD36DeKF3tSAZQ2A0aRSfks
         j60H0A69IkC6k2Zyeo1jM7rmyHpB//spmOfV9moIiTYc8KHQdMYRYShX/6rMJZncr6rN
         bW7csdExThQ7UzBsD0XtnUrfkLbnmZHOR7p7P0VJCVHtM7Ur/su1jyPAb06N5/9CulTf
         /osvFTQBWH+hlBDGfR3CW3v82+URdc2Iihuq8J4wz7LlNhTP/vokqH9G0ee7I6Ixp9VQ
         QJby1vd6iJK9V9XzNT0sJ5KNjmMknYAhHqy3LMxZaYrouqCFHAa8decDJ8S4WttIuMcG
         IhnA==
X-Gm-Message-State: AOAM532XxP7sFdpLyDyop+YvgYSXZ0qydbNWFi0fN1qtARW4KR2qPE5T
	DA8NkrU9SWu4zh9z6AehSmM=
X-Google-Smtp-Source: ABdhPJxwBLia0GULiakrQ/ChbOUlE5Y7VdEixYIKRKbmd5BUsUIAgrVrusZYIWrKZfjHhsy2cqSD6Q==
X-Received: by 2002:a05:6e02:20c5:: with SMTP id 5mr28877967ilq.14.1620778707477;
        Tue, 11 May 2021 17:18:27 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Connor Davis <connojdavis@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Jann Horn <jannh@google.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: early: Avoid using DbC if already enabled
Date: Tue, 11 May 2021 18:18:19 -0600
Message-Id: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620776161.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620776161.git.connojdavis@gmail.com>
References: <cover.1620776161.git.connojdavis@gmail.com>
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


