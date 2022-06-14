Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD954B066
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348956.575229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15Vd-0000CY-1c; Tue, 14 Jun 2022 12:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348956.575229; Tue, 14 Jun 2022 12:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15Vc-000088-TE; Tue, 14 Jun 2022 12:19:00 +0000
Received: by outflank-mailman (input) for mailman id 348956;
 Tue, 14 Jun 2022 12:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15TK-0008Ek-4I
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d533a08d-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-iSDuPmZxN-GLRmezrfI0Zg-1; Tue, 14 Jun 2022 08:16:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25D9B3C025C4;
 Tue, 14 Jun 2022 12:16:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD2C09D7F;
 Tue, 14 Jun 2022 12:16:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 870F21800630; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: d533a08d-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZStqjDDMtLMpDsz58F8O29JWAJ6F3RkNGXfWxICk7zU=;
	b=RpJLr7OezkVjRLe+lbEbgutREiOb2/wEzx21PzzEhJFGnnCkIYQORXDLX15IdUpWkdDG0e
	1mI5ho30CUVUeU+u+xmMBF3NQS2+WRrqcn2Ga05FO3isvkyvKVL4theqblcu/TB1fMpt/e
	yX0CD2kC5AWFnp2efzAYtSIUg+Kvcuk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZStqjDDMtLMpDsz58F8O29JWAJ6F3RkNGXfWxICk7zU=;
	b=RpJLr7OezkVjRLe+lbEbgutREiOb2/wEzx21PzzEhJFGnnCkIYQORXDLX15IdUpWkdDG0e
	1mI5ho30CUVUeU+u+xmMBF3NQS2+WRrqcn2Ga05FO3isvkyvKVL4theqblcu/TB1fMpt/e
	yX0CD2kC5AWFnp2efzAYtSIUg+Kvcuk=
X-MC-Unique: iSDuPmZxN-GLRmezrfI0Zg-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Joelle van Dyne <j@getutm.app>
Subject: [PULL 11/15] usbredir: avoid queuing hello packet on snapshot restore
Date: Tue, 14 Jun 2022 14:16:06 +0200
Message-Id: <20220614121610.508356-12-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

From: Joelle van Dyne <j@getutm.app>

When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
setting up the hello packet (just as with "-incoming". On the latest version
of libusbredir, usbredirparser_unserialize() will return error if the parser
is not "pristine."

Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20220507041850.98716-1-j@getutm.app>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index fd7df599bc0b..1bd30efc3ef0 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
     }
 #endif
 
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
+    if (runstate_check(RUN_STATE_INMIGRATE) ||
+        runstate_check(RUN_STATE_PRELAUNCH)) {
         flags |= usbredirparser_fl_no_hello;
     }
     usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
-- 
2.36.1


