Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E94041AE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182408.329969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6s5-00064D-FF; Wed, 08 Sep 2021 23:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182408.329969; Wed, 08 Sep 2021 23:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6s5-00061L-8h; Wed, 08 Sep 2021 23:20:49 +0000
Received: by outflank-mailman (input) for mailman id 182408;
 Wed, 08 Sep 2021 23:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6s3-0005H5-3u
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:20:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8209b610-f9ec-45d7-bcba-940fde5c21dd;
 Wed, 08 Sep 2021 23:20:43 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-sjj3yeEOOUaRxEH5KLTLSw-1; Wed, 08 Sep 2021 19:20:42 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so43144wmg.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:42 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u8sm3407763wmq.45.2021.09.08.16.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:40 -0700 (PDT)
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
X-Inumbo-ID: 8209b610-f9ec-45d7-bcba-940fde5c21dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AztXDO9JQH0V78yza1WhT6PPCcwDZClDQJU1AbRxT1E=;
	b=DzNscKHD3B+rraynLTiG6CcFw3GBOY0qxjYVo/6Orqx2lRKrTmHUdjS8qLxwmpQcj7StRN
	Mykf0lwDYaebs39zHs5SnQpcb9VgCmEOSsSQ8VtDZoP1M16PR3lxxWqBDQNoTCfYQwlhAW
	wdLaQ24zI0jb7CYEshHXMM+oVlnWEZo=
X-MC-Unique: sjj3yeEOOUaRxEH5KLTLSw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AztXDO9JQH0V78yza1WhT6PPCcwDZClDQJU1AbRxT1E=;
        b=MOOYlBQB7VUncjPvHrY9A58y11LIRsd18zsn5d/ixPQSNRlXNlXq+5+a6hox/755LX
         inmYWNWYojUpOLganr1IVzHI62giFbvp2OTJuPZCViPNIsR2wMxIOBtu1GYL/lW4AqN7
         QyolSkjUQMHUYy1VVeJexdx9O3eg0+meXSz6UjIBEMyrzLpDpn8Wn6QGJmnsEUYwmErZ
         9zMwJcAbXcp6ahn1lJXu1CrcNydWCj+ySTf0KVzJGVDyOOBhajrIkVi6iX5sUzXtq+28
         HpMIrvFxooe5Z5GNgZ/dFKYfOyZHWo/gpI1WrYyEm8hFe4wmptkMyFjyHnsycjXVJl0I
         iksw==
X-Gm-Message-State: AOAM532nFPnv2t/J71ziI8G0D0p0guTYtbAOpUdizLYOjfjU+KaHfjPM
	1VqhK+PXyPsI2/aIYfpQkdi7EKXZWDiLNNcJxdhujiMPwZJmDHlzy0aSxBRWuSa2uuvc2FDeoGF
	XtMI34D59poA8m/mREwgJf7ppTJ0=
X-Received: by 2002:adf:cd92:: with SMTP id q18mr84501wrj.211.1631143241058;
        Wed, 08 Sep 2021 16:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXGBcGkm4TBFmSADncXUcjFYrWCY3XIJ3gTrnp0jPkA2D2pCoYXECv5ulk3hjXuxgjKt0f9A==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr84482wrj.211.1631143240917;
        Wed, 08 Sep 2021 16:20:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:17 +0200
Message-Id: <20210908232024.2399215-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the BlockDriver::bdrv_taints_security_policy() handler.
Drivers implementing it might taint the global QEMU security
policy.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/block/block_int.h | 6 +++++-
 block.c                   | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8c..0ec0a5c06e9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -169,7 +169,11 @@ struct BlockDriver {
     int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
-
+    /*
+     * Return %true if the driver is withing QEMU security policy boundary,
+     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
+     */
+    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
 
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
                                        Error **errp);
diff --git a/block.c b/block.c
index b2b66263f9a..696ba486001 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu-common.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         }
     }
 
+    if (drv->bdrv_taints_security_policy) {
+        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
+                                   "Block protocol '%s'", drv->format_name);
+    }
+
     return 0;
 open_failed:
     bs->drv = NULL;
-- 
2.31.1


