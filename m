Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B23B3511
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 19:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146975.270626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwTZd-0003EH-5X; Thu, 24 Jun 2021 17:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146975.270626; Thu, 24 Jun 2021 17:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwTZd-0003Bf-1x; Thu, 24 Jun 2021 17:55:33 +0000
Received: by outflank-mailman (input) for mailman id 146975;
 Thu, 24 Jun 2021 17:55:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FtQU=LS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwTZb-0003BZ-Gc
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 17:55:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e28414a2-d889-4f64-b750-7b2543be8634;
 Thu, 24 Jun 2021 17:55:30 +0000 (UTC)
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
X-Inumbo-ID: e28414a2-d889-4f64-b750-7b2543be8634
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624557330;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ogUaIKbs5coINxSaMaKMVcF0Kshm2XAUnp4DjMJwo9k=;
  b=ZSsDojara9Z6+k+97+wLvUZBaEfJm9cjuQSIBiFnug3ZCes8lWY1ocwZ
   omKsZo2VkysX8nxBEJ4Kvor0p5jZxJuy3a7ZXlpwf5pQx35N4wrTw5FE9
   +Sx45YQImJF7jq7piifZXl1+zJjYsbDA5hjahJM8zQPxJ1My5Q8GzmMs8
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: opHXM5QDPFO/hMNCKQdmxOSkEzlU5/iRC67EuZhTvvQbEYcaI8vFGogf8EUwdTNphjOBp7s/AV
 bza+zsxaX29pGCGgDvma2zgkA5c2O5MLM0meD0LWfRXhVY+CGv5rO/G2x4+2SJNFBGskc9kgXs
 tRYuoKTw0EyXm84WATjsI47p0XMk0i+7J4yYat3XJgyMesIcq8G7BMx3nBDBOFsa5R9NsbMUIX
 Eu6uk0RGBHbTKuRNmYkWyIEE6TjhCELuo3pvdPwQEz1qqfmhaeUP357tfu7BN7fjVfftfbOXB1
 e94=
X-SBRS: 5.1
X-MesageID: 46627713
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FXStjaxktl6rqqpBPTbBKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.83,296,1616472000"; 
   d="scan'208";a="46627713"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] libxencall: Bump SONAME following new functionality
Date: Thu, 24 Jun 2021 18:55:21 +0100
Message-ID: <20210624175521.20843-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() returning long")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/call/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 4ed201b3b3..93d404b79e 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 2
+MINOR    = 3
 
 SRCS-y                 += core.c buffer.c
 SRCS-$(CONFIG_Linux)   += linux.c
-- 
2.11.0


