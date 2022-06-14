Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1254B040
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348872.575138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15TC-00024w-Rp; Tue, 14 Jun 2022 12:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348872.575138; Tue, 14 Jun 2022 12:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15TC-0001vn-DN; Tue, 14 Jun 2022 12:16:30 +0000
Received: by outflank-mailman (input) for mailman id 348872;
 Tue, 14 Jun 2022 12:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15T9-0008Ek-VW
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cecb6f1b-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-j3ECH_JHNIaqhgvfOeUaig-1; Tue, 14 Jun 2022 08:16:20 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A513085A580;
 Tue, 14 Jun 2022 12:16:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA1A492CA2;
 Tue, 14 Jun 2022 12:16:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F585180062D; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: cecb6f1b-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVva2fRC3vGqvRDPoZrUChjHwOIX197Reg0ezh6aFRw=;
	b=hGTCtB7IjZbhA0aoXp8rLCQNRfd8XQ90ulnxua1YeNj3lyu1RUt/ESBjnwxL73yo3NsDXL
	wN5Q3YlYxOHwVwMLNczsQI1/gxmXB+fJEoG8o/Iy4pnQnqoWY+uWE40DyRmzDOI+idAGph
	bRAN8e341aQij1VMGxRlb1oQVRsXeO8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVva2fRC3vGqvRDPoZrUChjHwOIX197Reg0ezh6aFRw=;
	b=hGTCtB7IjZbhA0aoXp8rLCQNRfd8XQ90ulnxua1YeNj3lyu1RUt/ESBjnwxL73yo3NsDXL
	wN5Q3YlYxOHwVwMLNczsQI1/gxmXB+fJEoG8o/Iy4pnQnqoWY+uWE40DyRmzDOI+idAGph
	bRAN8e341aQij1VMGxRlb1oQVRsXeO8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVva2fRC3vGqvRDPoZrUChjHwOIX197Reg0ezh6aFRw=;
	b=hGTCtB7IjZbhA0aoXp8rLCQNRfd8XQ90ulnxua1YeNj3lyu1RUt/ESBjnwxL73yo3NsDXL
	wN5Q3YlYxOHwVwMLNczsQI1/gxmXB+fJEoG8o/Iy4pnQnqoWY+uWE40DyRmzDOI+idAGph
	bRAN8e341aQij1VMGxRlb1oQVRsXeO8=
X-MC-Unique: j3ECH_JHNIaqhgvfOeUaig-1
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
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 09/15] MAINTAINERS: add myself as CanoKey maintainer
Date: Tue, 14 Jun 2022 14:16:04 +0200
Message-Id: <20220614121610.508356-10-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY61xI0IcFT1fOP@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0df25ed4b0a3..4cf6174f9f37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2427,6 +2427,14 @@ F: hw/intc/s390_flic*.c
 F: include/hw/s390x/s390_flic.h
 L: qemu-s390x@nongnu.org
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/system/devices/canokey.rst
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.36.1


