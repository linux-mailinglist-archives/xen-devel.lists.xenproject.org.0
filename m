Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0BAE1074
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 02:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020470.1396684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSPpX-00032X-UR; Fri, 20 Jun 2025 00:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020470.1396684; Fri, 20 Jun 2025 00:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSPpX-00030u-QM; Fri, 20 Jun 2025 00:42:07 +0000
Received: by outflank-mailman (input) for mailman id 1020470;
 Fri, 20 Jun 2025 00:42:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4/x=ZD=zte.com.cn=jiang.peng9@srs-se1.protection.inumbo.net>)
 id 1uSPpW-00030o-BB
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 00:42:06 +0000
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617035be-4d6f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 02:42:04 +0200 (CEST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bNdw70kn4z5DXWg;
 Fri, 20 Jun 2025 08:41:59 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 55K0f4Ic094365;
 Fri, 20 Jun 2025 08:41:04 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 20 Jun 2025 08:41:04 +0800 (CST)
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
X-Inumbo-ID: 617035be-4d6f-11f0-b894-0df219b8e170
Date: Fri, 20 Jun 2025 08:41:04 +0800 (CST)
X-Zmail-TransId: 2afc6854ae20ffffffffd83-7c389
X-Mailer: Zmail v1.0
Message-ID: <20250620084104786r5xoR16_AmYZMJLnno3_Q@zte.com.cn>
In-Reply-To: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
References: 20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn,0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55K0f4Ic094365
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6854AE57.000/4bNdw70kn4z5DXWg

From: Peng Jiang <jiang.peng9@zte.com.cn>

This patch fixes a W=1 format-string warning reported by GCC 12.3.0
by annotating xenbus_switch_fatal() and xenbus_va_dev_error()
with the __printf attribute. The attribute enables compile-time
validation of printf-style format strings in these functions.

The original warning trace:
drivers/xen/xenbus/xenbus_client.c:304:9: warning: function 'xenbus_va_dev_error' might be
a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]

Signed-off-by: Peng Jiang <jiang.peng9@zte.com.cn>
---
 drivers/xen/xenbus/xenbus_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 51b3124b0d56..e73ec225d4a6 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -202,6 +202,7 @@ int xenbus_watch_pathfmt(struct xenbus_device *dev,
 }
 EXPORT_SYMBOL_GPL(xenbus_watch_pathfmt);

+__printf(4, 5)
 static void xenbus_switch_fatal(struct xenbus_device *, int, int,
                                const char *, ...);

@@ -287,6 +288,7 @@ int xenbus_frontend_closed(struct xenbus_device *dev)
 }
 EXPORT_SYMBOL_GPL(xenbus_frontend_closed);

+__printf(3, 0)
 static void xenbus_va_dev_error(struct xenbus_device *dev, int err,
                                const char *fmt, va_list ap)
 {
-- 
2.25.1

