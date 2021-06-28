Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E613B5BF4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 12:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147771.272718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo68-000647-4C; Mon, 28 Jun 2021 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147771.272718; Mon, 28 Jun 2021 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxo68-00061j-0x; Mon, 28 Jun 2021 10:02:36 +0000
Received: by outflank-mailman (input) for mailman id 147771;
 Mon, 28 Jun 2021 10:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPZa=LW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lxo66-0005wp-Gw
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 10:02:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09cc351c-5b7e-4cef-bfed-25fc7fb7c0d6;
 Mon, 28 Jun 2021 10:02:31 +0000 (UTC)
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
X-Inumbo-ID: 09cc351c-5b7e-4cef-bfed-25fc7fb7c0d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624874551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zX7r6xlS7TNdyxVtVDnfSmlYIWmjPsGRxGAv5/JWNnQ=;
  b=FQwU2ap1wo1uKbFhE/luE3zbRumfwRGYdMT7OW85PR5BK7dY2k8TSfqn
   fGGFPTbVGr3aNICDrsEtUQjh3lX3Wd3bq84oJfqlKXEZpbZXxO8Y6u4EX
   JBsyWgz+Tl4ubkzm/3IHSVCu0+r1hM8D7fUg1ChCVzLzE/5GwXvILpp8q
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n5gxZFmaZzav9i0hIZl6nPfPEGi8RDin+0d1osdGIO9tE8G3j0M9He1JPF7G9H2IvGPKw83T1U
 A6UH24O+f00PcCPWCc6sZeX1iVp59pZhUk/3NwXrwYdbKlOJZu4szhcH7VfzHzeww7u5OFJtk+
 4JXUpikLrykFlgjnTYTNQfMCQt3d2Ps1kSuR2JI/WYhLWiK9BbwAu3WRhWhWmpFW2iUHwnv+lR
 eYPVrJG+V20/qqWc2c5qsn20oEhkdasNJ/iaB2PWio9UcyZJ0qTlvXrEViRrUCEpNpp3LZf7c7
 4r4=
X-SBRS: 5.1
X-MesageID: 46798712
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LM1oV6uo0TSbWDEt5CaUj1xL7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.83,305,1616472000"; 
   d="scan'208";a="46798712"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 1/2] libxl: Replace short-form boolean for QEMU's -vnc
Date: Mon, 28 Jun 2021 11:01:56 +0100
Message-ID: <20210628100157.5010-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628100157.5010-1-anthony.perard@citrix.com>
References: <20210628100157.5010-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

f3f778c81769 forgot one boolean parameter.

Fixes: f3f778c81769 ("libxl: Replace QEMU's command line short-form boolean option")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 5b01cf284163..7670e403a90f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1324,7 +1324,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             vncarg = GCSPRINTF("127.0.0.1:%d", vnc->display);
 
         if (vnc->passwd && vnc->passwd[0]) {
-            vncarg = GCSPRINTF("%s,password", vncarg);
+            vncarg = GCSPRINTF("%s,password=on", vncarg);
         }
 
         if (libxl_defbool_val(vnc->findunused)) {
-- 
Anthony PERARD


