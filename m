Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474E22ED41
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 15:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k039X-0001WL-8o; Mon, 27 Jul 2020 13:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGXS=BG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k039V-0001Vb-E5
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 13:26:49 +0000
X-Inumbo-ID: cf386830-d00c-11ea-8abe-bc764e2007e4
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf386830-d00c-11ea-8abe-bc764e2007e4;
 Mon, 27 Jul 2020 13:26:42 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id l6so15157261qkc.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2020 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=CV8gyjU9PwIWw8K/PGrpSXQm3oWpb9KSiaV2uQ4454U=;
 b=lay2kK3CCt51wkbTIp8LTo2lZhzDQnuSNFU+0RWOUNzK9LMgcSIkudUrTf9IAiY1GA
 fM9vgNgJkZRjrBny0DX0qd/5qTR2n9PkCKhfmzcBXazOhD12PgaaH4vzE/WYn2dWIGHf
 PFB3TsoOP5ItV+VnAZdkmyXToxDIHYFgdGZOQaSHWlyXNkyg+IPjqJbg1JrL6MC1qA+o
 vUEsEkGE2QX1o6s2XCuCNL3tRCABo8VQmN92QcqZwYjpM3Jn6WzYZTYrXpCuAS+Dhg5G
 ZWjwfdYxKZHXD9hQukmZTvdQyOWf7HzFNcc26yEN0c+5ozfQcc2Vrloo9WXSYz3G0CEG
 ztLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=CV8gyjU9PwIWw8K/PGrpSXQm3oWpb9KSiaV2uQ4454U=;
 b=lE3xe9zvjYEXFEgF6iYmbaL68UoRbgUmA9tB50YS5OrVwCNDezBu4nHN4cfK4U0ANQ
 hBgcdEeJlXt4emztcdL5NopXprtgpA6ol42EpB6TFofksX7YcSwmXfaF4WhSnp8PCxC0
 AS8HGn6Z5Em6RplgWcPb4g/zaUWIEbf0UAknQeUBoxWoSYhTTj3sYTsBOo9pw/4OlArN
 t/zsplJNSo4ZRu4O2eLDspnrLa0KKOOy/UMyGL/iMNplXCjetq4seKYkHfqCNRzJFtCR
 OyJKJ5eZLIqRHkZBAiC6nq2KWE0XJ7Hg6Peu554G0w1QGRzBSJKQRfsM8NOjrheCqx9I
 dPUg==
X-Gm-Message-State: AOAM530ebiFQYTrPV5PHbph8c0/rh5kiQ2dKJ+FwnDR6eViXEnw1D/6m
 UWHGnnH5cfm1BJyyBYGZqPrWA8P/n6Q=
X-Google-Smtp-Source: ABdhPJwHEgYH4RxJ65dlOvT3skSegMWUJKq1BEmSOXGP8QWPnZMs5dxi3yTrOWud3p4+upZklo4niA==
X-Received: by 2002:a37:a503:: with SMTP id o3mr22160178qke.162.1595856401512; 
 Mon, 27 Jul 2020 06:26:41 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id t8sm11828003qtc.50.2020.07.27.06.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:26:40 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH 2/2] libxl: prototype libxl_device_nic_add/remove with IDL
Date: Mon, 27 Jul 2020 09:26:33 -0400
Message-Id: <b7313e96b6865bb13b221720a437c6e2ac57140c.1595854292.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595854292.git.rosbrookn@ainfosec.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1595854292.git.rosbrookn@ainfosec.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a DeviceFunction class and describe prototypes for
libxl_device_nic_add/remove in libxl_types.idl.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
--
This is mostly to serve as an example of how the first patch would be
used for function support in the IDL.
---
 tools/libxl/idl.py          | 8 ++++++++
 tools/libxl/libxl_types.idl | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/tools/libxl/idl.py b/tools/libxl/idl.py
index 1839871f86..15085af8c7 100644
--- a/tools/libxl/idl.py
+++ b/tools/libxl/idl.py
@@ -386,6 +386,14 @@ class CtxFunction(Function):
 
         Function.__init__(self, name, params, return_type, return_is_status)
 
+class DeviceFunction(CtxFunction):
+    """ A function that modifies a device. """
+    def __init__(self, name=None, device_param=None):
+        params = [ ("domid", uint32), device_param ]
+
+        CtxFunction.__init__(self, name=name, params=params, return_type=integer,
+                             return_is_status=True, is_asyncop=True)
+
 def parse(f):
     print("Parsing %s" % f, file=sys.stderr)
 
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..22ba93ee4b 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -769,6 +769,12 @@ libxl_device_nic = Struct("device_nic", [
     ("colo_checkpoint_port", string)
     ])
 
+libxl_device_nic_add = DeviceFunction("device_nic_add",
+    ("nic", libxl_device_nic))
+
+libxl_device_nic_remove = DeviceFunction("device_nic_remove",
+    ("nic", libxl_device_nic))
+
 libxl_device_pci = Struct("device_pci", [
     ("func",      uint8),
     ("dev",       uint8),
-- 
2.17.1


