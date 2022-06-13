Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398B5484EB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347983.574400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNm-0006uZ-Kz; Mon, 13 Jun 2022 11:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347983.574400; Mon, 13 Jun 2022 11:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNl-0006cd-Bh; Mon, 13 Jun 2022 11:37:21 +0000
Received: by outflank-mailman (input) for mailman id 347983;
 Mon, 13 Jun 2022 11:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNf-0003eX-7l
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b61a9a0-eb0d-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 13:37:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-QhGqS3mJPgWJlaJrwV9AAQ-1; Mon, 13 Jun 2022 07:37:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6085A29ABA0C;
 Mon, 13 Jun 2022 11:37:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69AC61415103;
 Mon, 13 Jun 2022 11:37:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7D149180098C; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 2b61a9a0-eb0d-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZStqjDDMtLMpDsz58F8O29JWAJ6F3RkNGXfWxICk7zU=;
	b=fCm3a/3IykoUiHzE8p7cym22MSTvpjCjvtz9Jm8n7LzbXOuxETVo4e1dvHul2bGb6VkeKS
	vM5wQ6r7aoIMCCPxArUzwz3bgagEE+F9OQIwW7LTh6Bz2GVTBGQO48Krlg3rDJZ1WpVlnj
	Xg61MGlpmZJKDvOfzO4O8yGv7AcF0l0=
X-MC-Unique: QhGqS3mJPgWJlaJrwV9AAQ-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Joelle van Dyne <j@getutm.app>
Subject: [PULL 11/16] usbredir: avoid queuing hello packet on snapshot restore
Date: Mon, 13 Jun 2022 13:36:50 +0200
Message-Id: <20220613113655.3693872-12-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

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


