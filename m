Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5628D364E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731853.1137601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIL9-0004RX-QJ; Wed, 29 May 2024 12:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731853.1137601; Wed, 29 May 2024 12:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIL9-0004PU-Lr; Wed, 29 May 2024 12:23:35 +0000
Received: by outflank-mailman (input) for mailman id 731853;
 Wed, 29 May 2024 12:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vA4L=NA=gmail.com=yskelg@srs-se1.protection.inumbo.net>)
 id 1sCIL7-0004PK-Lj
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:23:33 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e7f4f2-1db6-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 14:23:32 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2bdd8968dabso1493451a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:23:32 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bf5f987248sm9399359a91.44.2024.05.29.05.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 05:23:30 -0700 (PDT)
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
X-Inumbo-ID: 42e7f4f2-1db6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716985411; x=1717590211; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu8X2LCUalqzu3Ya3NkSgnwgrwDIZEosx1eIzHQjc28=;
        b=TeFe4NSCMMl017y+MOfd4lylluB+eQdlE54itGLIPe7o3z0PjghW4eWZ/3QVVR08fj
         /PXZ9lKYG8yCTRARFmYTtyrC1ExWBkmaoCnI7A6bJU7QUt+oxcrgQCiOMZm/banIZReU
         57PRVDcjFDjXnCllQe6q7WeXJNJiYQbe2ShzyqeA6jWnn7f05qiNODg8HZCOd7OD3jS/
         PeVz5MS0e0nHPOr4eiOwohFq6t0BRvAGN+YZh4cTpQNeLiutBmoH3zmyqLZsH5apfK0f
         kxrQ64UFheF0b7cNSiHb8Ovnwma0P2JKWPLvc1+pJ2x45kaInahefHGuwCqiJsIXI/vW
         lMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985411; x=1717590211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bu8X2LCUalqzu3Ya3NkSgnwgrwDIZEosx1eIzHQjc28=;
        b=SC+ep7X0nHvpvs8FU8m7TLGe9zJ+WSHra7yA4YOd6U1BPGv/TyMJdVTJD5KClq2Kmz
         fU7uYkullmnXXrTAwco9LOJIDtRDMAPjD0hZhmgS1pKlrMzx+ApgDqXU1Qy4MblVHr4d
         yo0jGoB09ub8JMwkHuiOQuAksk3ti718roDJ4hfdx6/vzp4d9c3Z2s37m3AgrlBE+ciH
         VTv2wl0BKprQXfyiOwvOwDDE2TgQyIeqbqY1JpMRRAR3Fmw4o0TxKtyS/TXR6Zs/OENC
         gXvzCZ/BMb+ZMV8s+FIg2wVs7iNiysFwJ27o0EtIqu47wW6Wu9Q9hFdowWmtkPOREVkG
         HKsg==
X-Forwarded-Encrypted: i=1; AJvYcCV4IdL4m/nckulyyvcd5Tk+0m9BzP5hbC2PU4Oq04YhY0bMfJihDz4c3ED5BJbGg5EsHiCdPWrDm7Z023BYZc0fspWPr19qLx7OfvtiC8c=
X-Gm-Message-State: AOJu0YxE8SjPFNbgWmosNZPj5G3oPQPTNAzfr5vzswuAtU2YBIv/AhlT
	SrFAS2m6ZL4OswjtN4TuaoEm/ttoBWewbxJHgIhZy/5Ht3bZvt5e
X-Google-Smtp-Source: AGHT+IGpop5Rh0Gl6NPGn+yzSeNeXcyhhaZwMs48bAu4Ha451DIdYSt4ISyatz1BTqz9iqNA8XPlsg==
X-Received: by 2002:a17:90b:46d3:b0:2ae:7f27:82cd with SMTP id 98e67ed59e1d1-2bf5e171f8amr12877376a91.7.1716985411004;
        Wed, 29 May 2024 05:23:31 -0700 (PDT)
From: yskelg@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org,
	sj@kernel.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] xen/xenbus: handle potential dangling pointer issue in xen_pcibk_xenbus_probe
Date: Wed, 29 May 2024 21:22:33 +0900
Message-Id: <20240529122232.25360-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
not point to 'xdev' when 'pdev' is freed.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b11e401f1b1e..348d6803b8c0 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
 	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
 
 	if (xen_pcibk_init_devices(pdev)) {
+		pdev->xdev = NULL;
 		kfree(pdev);
 		pdev = NULL;
 	}
-- 
2.34.1


