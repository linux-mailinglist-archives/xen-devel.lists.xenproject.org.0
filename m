Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C96F5ABC
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529289.823539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEBt-0002LR-B8; Wed, 03 May 2023 15:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529289.823539; Wed, 03 May 2023 15:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEBt-0002Ix-7j; Wed, 03 May 2023 15:14:49 +0000
Received: by outflank-mailman (input) for mailman id 529289;
 Wed, 03 May 2023 15:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDRO=AY=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1puE8t-0001rK-Ob
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:11:43 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf90cd04-e9c4-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:11:42 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso33825995e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 08:11:42 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 d15-20020adfe84f000000b002fb60c7995esm34427038wrn.8.2023.05.03.08.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:11:40 -0700 (PDT)
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
X-Inumbo-ID: cf90cd04-e9c4-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126702; x=1685718702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omxGsHaKkcGC+xqSddM+y0Rv4lJTnT54/CknYbjXVhY=;
        b=YfDzGylBhlR3CVxpMMI4acCmCfqTfHfM5iBfgOCW6OyIloOXcvH8dEmNrR80OObTjK
         IwiUIcA3EAalQUC1fcg6MNtj8x4BJYd3sJPyd1U6v+NcbtOe5wHOosZpqzvgGp8d60s/
         GEuDIhroTKLKU3RLl3Q1FYflOwqkteq5501Hv7jKKV+O+4lgokZlz6LlAf+t4oJvNHp0
         ZWyt5MEIYS7GLmms+q9eXjK+KzyG/JMYwSlML9xXTrZnmx3fQyKd5U046ZCENMYczcQL
         jcsxZ8mDjvZC0tP1ENbJbTfiTKJKjO/AZbTZ0Prl4nDNDNwD+/yjN0s7b2KBvKuTLtdC
         JPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126702; x=1685718702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omxGsHaKkcGC+xqSddM+y0Rv4lJTnT54/CknYbjXVhY=;
        b=RmCb0C9AyrlrhUXPumuOMPebQTYtdtXm62T9O1nJYIH2SkJxLep/u7zTMj5A5jDJlC
         6+oRe7WVe7JYp+r37ZTzFSRSNOZZk2giURZ2kOQTJ4p2honMbO2au+Jz5jNXN6U5Xc8Y
         IpYNFndVbQPy1DsugbWHsYPO4ThMqAjj4LvnC/iFXcmUBLvpNq0QeEZJWNn19bF1Vt9I
         iTEEo/yog2kjOKTBPmDhAduEqI9DAcnT62mCXfju4/EG9J9LmU5aWxxBN+of6mlcKfiM
         WGVQYkNJNDt4lPRp+7vqKeCUk/l1q+GDzQG1gqSCxCJm+3o7p3YoDEFf9B5mbDJfZSSt
         Mheg==
X-Gm-Message-State: AC+VfDy2HybHgahXaThD4ADmZOxYn8j6YW7nyc5g34HbztCHBV+sKcgf
	hhgugVTsbrAn7SeoDAaeUsS2fw==
X-Google-Smtp-Source: ACHHUZ5OZVQBtqAWZgaLWLuVjAfGEiqAlM8i3902hJEurNrW2MxWTzUvvq1ZwT17Z0WElKBzUOcmHw==
X-Received: by 2002:adf:dd4c:0:b0:2f6:8834:5952 with SMTP id u12-20020adfdd4c000000b002f688345952mr361499wrm.8.1683126701992;
        Wed, 03 May 2023 08:11:41 -0700 (PDT)
Date: Wed, 3 May 2023 18:11:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/pvcalls-back: fix double frees with
 pvcalls_new_active_socket()
Message-ID: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In the pvcalls_new_active_socket() function, most error paths call
pvcalls_back_release_active(fedata->dev, fedata, map) which calls
sock_release() on "sock".  The bug is that the caller also frees sock.

Fix this by making every error path in pvcalls_new_active_socket()
release the sock, and don't free it in the caller.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/xen/pvcalls-back.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index 1f5219e12cc3..7beaf2c41fbb 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -325,8 +325,10 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	void *page;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
-	if (map == NULL)
+	if (map == NULL) {
+		sock_release(sock);
 		return NULL;
+	}
 
 	map->fedata = fedata;
 	map->sock = sock;
@@ -418,10 +420,8 @@ static int pvcalls_back_connect(struct xenbus_device *dev,
 					req->u.connect.ref,
 					req->u.connect.evtchn,
 					sock);
-	if (!map) {
+	if (!map)
 		ret = -EFAULT;
-		sock_release(sock);
-	}
 
 out:
 	rsp = RING_GET_RESPONSE(&fedata->ring, fedata->ring.rsp_prod_pvt++);
@@ -561,7 +561,6 @@ static void __pvcalls_back_accept(struct work_struct *work)
 					sock);
 	if (!map) {
 		ret = -EFAULT;
-		sock_release(sock);
 		goto out_error;
 	}
 
-- 
2.39.2


