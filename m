Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1FE32EB9B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 13:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93672.176719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9um-00037w-Pg; Fri, 05 Mar 2021 12:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93672.176719; Fri, 05 Mar 2021 12:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9um-00037X-MR; Fri, 05 Mar 2021 12:50:44 +0000
Received: by outflank-mailman (input) for mailman id 93672;
 Fri, 05 Mar 2021 12:50:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lI9ul-00034k-Nq
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:50:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c69cd3e-2afb-40fd-92b6-c28aaf925f35;
 Fri, 05 Mar 2021 12:50:35 +0000 (UTC)
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
X-Inumbo-ID: 8c69cd3e-2afb-40fd-92b6-c28aaf925f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614948635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bjbbijXY3Quk6aaO7tZzhGLPPA5Tof1s8Ux56AsuWVA=;
  b=ER4qGNg49UkbY5BceFcgoznZcnQoae8bsmgTqZEcFqElnpb0lIM1svAZ
   IgIv/yRIh0tEVQBCWAKrSfoHn5gzda7BJUqEtwIju5hUlD7z2IO508g2Z
   kh/5HAoHBIGbgLqD4ssshJNex31hBuDC3OCcYR2tY7erp5rZziTGOAyY/
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BF4f4GdbBtHTAFCGu3ev5zVe1heqgu4zA3pccQd8JISXJwWZyO7Wcdh+0h4wS1Q+yg+ZwExZlm
 ZEgjy4/xPiyWNtmEEER15vEGhx0iY3ZKMo5P1P00HFTcFWCDne7hVtp+1yuNXvEOvwpN1d28+f
 xYgkN2ib0XmuIBDSogoSQUhPfkrztjkHdKIG/AxeDXO1aUthThE6URm1CIhT4bDm071MYhI2VT
 mtb0I8aHBihjdoTKZs2tRAxJfh07uFxoGX64iHZ9MN1tyyfjW9gc1xZDMbkZnSlcj/gRn5j94E
 GXU=
X-SBRS: 5.1
X-MesageID: 38643897
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38643897"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from public API
Date: Fri, 5 Mar 2021 12:49:48 +0000
Message-ID: <20210305124949.6719-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210305124949.6719-1-andrew.cooper3@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.

That change actually broke the build with:

  include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
       ioservid_t *id);
       ^

as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
nothing noticed because the header.chk logic is also broken (fixed
subsequently).

Strip the guard from the public header, and remove compensation from
devicemodel's private.h

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  This is a build fix, even if current staging can't spot the
breakage.

These two issues highlight that libxendevcemodel.h has never been checked
since its introduction, because the checking logic only saw an empty file.
---
 tools/libs/devicemodel/private.h | 2 --
 xen/include/public/hvm/dm_op.h   | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/tools/libs/devicemodel/private.h b/tools/libs/devicemodel/private.h
index c4a225f8af..c24f3396bb 100644
--- a/tools/libs/devicemodel/private.h
+++ b/tools/libs/devicemodel/private.h
@@ -1,8 +1,6 @@
 #ifndef XENDEVICEMODEL_PRIVATE_H
 #define XENDEVICEMODEL_PRIVATE_H
 
-#define __XEN_TOOLS__ 1
-
 #include <xentoollog.h>
 #include <xendevicemodel.h>
 #include <xencall.h>
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index ef7fbc0d3d..fa3f083fed 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -25,9 +25,6 @@
 #define __XEN_PUBLIC_HVM_DM_OP_H__
 
 #include "../xen.h"
-
-#if defined(__XEN__) || defined(__XEN_TOOLS__)
-
 #include "../event_channel.h"
 
 #ifndef uint64_aligned_t
@@ -491,8 +488,6 @@ struct xen_dm_op {
     } u;
 };
 
-#endif /* __XEN__ || __XEN_TOOLS__ */
-
 struct xen_dm_op_buf {
     XEN_GUEST_HANDLE(void) h;
     xen_ulong_t size;
-- 
2.11.0


