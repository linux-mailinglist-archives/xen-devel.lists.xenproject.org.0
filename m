Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A23BFB60
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 15:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153114.282872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Tfv-0003Jt-VQ; Thu, 08 Jul 2021 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153114.282872; Thu, 08 Jul 2021 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Tfv-0003ID-Rh; Thu, 08 Jul 2021 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 153114;
 Thu, 08 Jul 2021 13:02:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1Tfu-0003I7-3t
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 13:02:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6d6e50e-dfec-11eb-856e-12813bfff9fa;
 Thu, 08 Jul 2021 13:02:41 +0000 (UTC)
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
X-Inumbo-ID: c6d6e50e-dfec-11eb-856e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625749361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lBLcg6CBnboiqdDOjgoNlM69uDiJIy0y5YoDScL5KRY=;
  b=FqtVX1lESIN2LFyScDHWXaRUHc+/yu15S+nsv8/zP+1rqeHEs/IiPJtK
   0Aj+96ZeWvqhnozvbYD7zjFB2Z9btnbmR+2qI3HflpL+x/mvWDh7nGoNb
   Ii6Ev0oXL1h9UR2rj2nDIUzQ+cYJLoz/zrvsLvdKb8oK4IG06xV29gOn3
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GM7N9kOUxuAeMpZgxkRZ+N8BQKDMekpAseiArMgFoy1j2USByBGyVHMjpVVirdKSbKhfAi7u1a
 +FLShRipoQrKwqGjE0c7MkvezUc0H1yua6NYuAhmnn4Pu2l/qAM2BTNVzlN7QOptYwnscSDCjq
 sfCCDeE6noyC75bKN78GfTR7nXK3TVfmMzxEL1xRrRVSx4yU6IBDGBJdSOTCPSoemA4jZwhe5j
 eJqDMOtomYxAIpMXtwA1c/j7+9gtivBmQlu3cKcxaUpnRtr+uV9eTQdjNlGasDLQQhBEgNCjfw
 T64=
X-SBRS: 5.1
X-MesageID: 47539781
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:T/iNT64wPocDr4ceRgPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="47539781"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] cirrus-ci: Fix FreeBSD build following QEMU update
Date: Thu, 8 Jul 2021 14:02:32 +0100
Message-ID: <20210708130232.3159-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

QEMU requires ninja and bash to build now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

https://cirrus-ci.com/build/4782098465685504 is run with the build fixed
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index fdb1c9c94d7c..b17f0b6369e1 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -4,7 +4,7 @@ freebsd_template: &FREEBSD_TEMPLATE
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
-  install_script: pkg install -y seabios gmake
+  install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf python libiconv bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git
-- 
2.11.0


