Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3A1E42BF
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 14:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvXj-0001T5-Qa; Wed, 27 May 2020 12:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVnz=7J=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jdvRL-0000gl-Nl
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 12:45:47 +0000
X-Inumbo-ID: f91d9b40-a017-11ea-8993-bc764e2007e4
Received: from forwardcorp1p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b6:217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f91d9b40-a017-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 12:45:42 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 05C1E2E15A3;
 Wed, 27 May 2020 15:45:41 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 nqQj86Bk57-jbfq4Pkl; Wed, 27 May 2020 15:45:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590583540; bh=5vTc+cYwJ0Yp/qYZkQZ2K2YBz+RbUpeML72x3NJFPMc=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=M8ZuAGhMsx+thLLDbKB6QLd0xI3uJHv/67y4TKRY/bZ+ez9EboHcOgdO7FSZX/7gx
 xj/pb4AGN2vS4pgcLBcJJgBd6ZYem3Hkwx03tMjUZRDlse10PYNpKpubdCsW5rUtkS
 Y0DVCZz3xDn0rgPyU2RF91ofdnmEY3eHdmqMoygs=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:12])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bzO5qPtczO-jbWOOqOL; Wed, 27 May 2020 15:45:37 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/5] block: lift blocksize property limit to 2 MiB
Date: Wed, 27 May 2020 15:45:11 +0300
Message-Id: <20200527124511.986099-6-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527124511.986099-1-rvkagan@yandex-team.ru>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 May 2020 12:52:22 +0000
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Logical and physical block sizes in QEMU are limited to 32 KiB.

This appears unnecessary tight, and we've seen bigger block sizes handy
at times.

Lift the limitation up to 2 MiB which appears to be good enough for
everybody, and matches the qcow2 cluster size limit.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
v4 -> v5:
- split out into separate patch [Philippe]
- as this patch has changed significantly lose Eric's r-b

 hw/core/qdev-properties.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index e7ccd4d276..ecd84262a9 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -784,9 +784,12 @@ const PropertyInfo qdev_prop_size32 = {
 /* lower limit is sector size */
 #define MIN_BLOCK_SIZE          512
 #define MIN_BLOCK_SIZE_STR      stringify(MIN_BLOCK_SIZE)
-/* upper limit is the max power of 2 that fits in uint16_t */
-#define MAX_BLOCK_SIZE          32768
-#define MAX_BLOCK_SIZE_STR      stringify(MAX_BLOCK_SIZE)
+/*
+ * upper limit is arbitrary, 2 MiB looks sufficient for all sensible uses, and
+ * matches qcow2 cluster size limit
+ */
+#define MAX_BLOCK_SIZE          (2 * MiB)
+#define MAX_BLOCK_SIZE_STR      "2 MiB"
 
 static void set_blocksize(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
-- 
2.26.2


