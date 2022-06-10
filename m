Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E604B5461C4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346119.571911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzarI-0002SK-U9; Fri, 10 Jun 2022 09:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346119.571911; Fri, 10 Jun 2022 09:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzarI-0002PN-Q1; Fri, 10 Jun 2022 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 346119;
 Fri, 10 Jun 2022 09:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HR3=WR=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzapn-0005HE-9H
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:21:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba6716f7-e89e-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:21:38 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-OrbZa1CaOsm0-icMqDwwwA-1; Fri, 10 Jun 2022 05:21:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17259101AA47;
 Fri, 10 Jun 2022 09:21:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6582C53360;
 Fri, 10 Jun 2022 09:21:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CCF041800634; Fri, 10 Jun 2022 11:20:44 +0200 (CEST)
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
X-Inumbo-ID: ba6716f7-e89e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654852896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6vOmc4r9ui1udWdegwNJ5alAMO2M7wcYKQqptdB7KA=;
	b=ggc3Vb20CnJEwmYZyMXpt+RhDFcZ7y7166LHQNnfbJ9/0rWwye2O+KStzjqyqQBSZfx7nB
	Nb3U4oZoeBcIVhC0+AbaR+QT1My13biDuE0CY/7KE/e9ypIxtFIl3DwUt20dWLc06Jo6hb
	fk/Mg/qFAEHf9tC+WLe7vBeJFYDq/5A=
X-MC-Unique: OrbZa1CaOsm0-icMqDwwwA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	xen-devel@lists.xenproject.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/17] MAINTAINERS: add myself as CanoKey maintainer
Date: Fri, 10 Jun 2022 11:20:36 +0200
Message-Id: <20220610092043.1874654-11-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY61xI0IcFT1fOP@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5580a36b68e1..4ae9d707d5b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2425,6 +2425,14 @@ F: hw/intc/s390_flic*.c
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


