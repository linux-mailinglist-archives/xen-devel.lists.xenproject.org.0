Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E173D1ED354
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:27:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVIP-00018y-Ac; Wed, 03 Jun 2020 15:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pc3M=7Q=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1jgVIN-00018t-3l
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:27:11 +0000
X-Inumbo-ID: b041b22b-a5ae-11ea-ad4a-12813bfff9fa
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b041b22b-a5ae-11ea-ad4a-12813bfff9fa;
 Wed, 03 Jun 2020 15:27:09 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y11so1624289ljm.9
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 08:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TI71EQkgRiykB9cwyrszJwVo6ai3Du0dG7EYNU5AcZI=;
 b=aztgwI5ND/gKIXZrIKxfgotansGLpy+RY0QTPJxtCD3DxXGAvMWu1yrNRnXZOT6DcQ
 ZGSQaCwfbHGHQ0kX+DvyAGcmxnVMvnzd5mTtOWjfstdNXUYKqhYlPIXIGiE80ksx8Q2F
 3nGMqjJ98ilqDR/F4gfML0m3xzJ5IYuJyELEt6n6je0Dj0TB4DYVcadMdvD+52UTXwE6
 QBOfH4n361svG+ZTV8XJG1J/4SSz4yrPTHQV6lIpdqUf5gZOTizwzQMh9q30pASvkPgq
 0N2a05zGyt5qAqS28cCJZfNM/1W431RReeMGxUrb5eLf3uvBMd+vGCjleDxcCQIwpGS4
 Vklw==
X-Gm-Message-State: AOAM532sEq9FNyB3V5Yqo1JxXIXHmtc5cOtHC+DfWmfOWORlloPH28Dn
 Lr8FGgUakPgNmSFQjfOimOw=
X-Google-Smtp-Source: ABdhPJwfYTS9uPM/HnqTboQLV6Ltg2RwfZqWlLMLltkoaHufYDdfd//e3kI/YThjJUvVF6uDszv/jw==
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr2196638ljp.89.1591198028574; 
 Wed, 03 Jun 2020 08:27:08 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id e21sm631714ljb.135.2020.06.03.08.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 08:27:07 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH] xen-netback: use kstrdup() in connect_data_rings()
Date: Wed,  3 Jun 2020 18:26:43 +0300
Message-Id: <20200603152643.18215-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
 linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use kstrdup() instead of opencoded alloc and copy. kzalloc() is
excessive here.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/net/xen-netback/xenbus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 286054b60d47..69352154a51b 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -839,13 +839,12 @@ static int connect_data_rings(struct backend_info *be,
 	 * queue-N.
 	 */
 	if (num_queues == 1) {
-		xspath = kzalloc(strlen(dev->otherend) + 1, GFP_KERNEL);
+		xspath = kstrdup(dev->otherend, GFP_KERNEL);
 		if (!xspath) {
 			xenbus_dev_fatal(dev, -ENOMEM,
 					 "reading ring references");
 			return -ENOMEM;
 		}
-		strcpy(xspath, dev->otherend);
 	} else {
 		xspathsize = strlen(dev->otherend) + xenstore_path_ext_size;
 		xspath = kzalloc(xspathsize, GFP_KERNEL);
-- 
2.26.2


