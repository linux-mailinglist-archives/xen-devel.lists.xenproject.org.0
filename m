Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2240D657
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 11:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188283.337403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnn7-0005fZ-Bn; Thu, 16 Sep 2021 09:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188283.337403; Thu, 16 Sep 2021 09:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQnn7-0005cu-7O; Thu, 16 Sep 2021 09:34:49 +0000
Received: by outflank-mailman (input) for mailman id 188283;
 Thu, 16 Sep 2021 09:34:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20iF=OG=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mQnn4-0005co-S4
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 09:34:47 +0000
Received: from forward102o.mail.yandex.net (unknown [37.140.190.182])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cfc301c-fe41-4a0e-88ae-4e046f7aaba5;
 Thu, 16 Sep 2021 09:34:43 +0000 (UTC)
Received: from myt4-5dd3963c4bb1.qloud-c.yandex.net
 (myt4-5dd3963c4bb1.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:525:0:640:5dd3:963c])
 by forward102o.mail.yandex.net (Yandex) with ESMTP id 085ED6FFAE38;
 Thu, 16 Sep 2021 12:34:21 +0300 (MSK)
Received: from myt6-016ca1315a73.qloud-c.yandex.net
 (myt6-016ca1315a73.qloud-c.yandex.net [2a02:6b8:c12:4e0e:0:640:16c:a131])
 by myt4-5dd3963c4bb1.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 EBAyEc8Chw-YKE8rcCd; Thu, 16 Sep 2021 12:34:20 +0300
Received: by myt6-016ca1315a73.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id LLaIuIUSvU-YINeeR6k; Thu, 16 Sep 2021 12:34:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
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
X-Inumbo-ID: 8cfc301c-fe41-4a0e-88ae-4e046f7aaba5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631784860;
	bh=C58Nyuu69+QXNydcYAmmqxNxFseKKbI9nuzRv/qU388=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=hosA1EL9TtCwvILAPgrnm0pzj3hRubo4yXDkY0oYCpJFT7x3pFvzQZug4p/IlnOxL
	 2tysvuFRPovk0BYu8R0YXdWwXbEl8Ft12ZHDhqjN5KJgr8wuyiVZwiBSN0DZmCcK+1
	 MSwF32FmkXYsiqiU10ybfBIiXcoRoqqgPkwbGBkM=
Authentication-Results: myt4-5dd3963c4bb1.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/xl: fix autoballoon regex
Date: Thu, 16 Sep 2021 12:34:14 +0300
Message-Id: <6be4aba579bda042bef4cf0991a92444d0c3f05e.1631781599.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>

This regex is used for auto-balloon mode detection based on Xen command line.

The case of specifying a negative size was handled incorrectly.
From misc/xen-command-line documentation:

    dom0_mem (x86)
    = List of ( min:<sz> | max:<sz> | <sz> )

    If a size is positive, it represents an absolute value.
    If a size is negative, it is subtracted from the total available memory.

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
---
Changes in v2:
- add missing Signed-off-by tag
---
 tools/xl/xl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..a9f7e769fd 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -81,7 +81,7 @@ static int auto_autoballoon(void)
         return 1; /* default to on */
 
     ret = regcomp(&regex,
-                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
+                  "(^| )dom0_mem=((|min:|max:)-?[0-9]+[bBkKmMgG]?,?)+($| )",
                   REG_NOSUB | REG_EXTENDED);
     if (ret)
         return 1;
-- 
2.33.0


