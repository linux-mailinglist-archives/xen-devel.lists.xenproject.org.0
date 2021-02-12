Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3531A1E3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84308.158054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYV-0000nd-Bl; Fri, 12 Feb 2021 15:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84308.158054; Fri, 12 Feb 2021 15:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYV-0000n7-82; Fri, 12 Feb 2021 15:40:27 +0000
Received: by outflank-mailman (input) for mailman id 84308;
 Fri, 12 Feb 2021 15:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYT-0000ix-Nr
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01228532-2bd6-448b-a830-03df601056c7;
 Fri, 12 Feb 2021 15:40:16 +0000 (UTC)
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
X-Inumbo-ID: 01228532-2bd6-448b-a830-03df601056c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AkTySBnlGFyVMAxg/gcAuosdJVnwo4RsV9buhZjnQmI=;
  b=Fto+Pz5B0Aef1KmZxa1alOzmlvDsusbB3sqf88EPWlMLjp7zLCuIso6G
   mfC/QAYmExw9rfZutIm72t1eKhfvdNwJgJT5F8u7YmVOnvNxW44AIO+c6
   GBMeoPHf+A5alb2okvxLmGfAEwIi1hN5BXTS0SzF1oQM79PEvuWbsq+IM
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HownhAwJMB882tcBvJ6G+QOZ8MyF74dHFD5WPKB4/YdYun8zrgjFznZa7eMmo3fa6yqRCEK46f
 c4CFRvhfwylaL3mc3COpuLJLVUeU7P5OkvJI9wV6troHksPpTN0Pzi1s9/ff44nmfA9bo+25Nf
 ZsGTKWfrZzgZGcZtPbpTKihFpvu9Y03/bNMaXVxR0YjKj8hzxYAJ3t6h7trMXH8etYxCBhGmYi
 JsCe0LW4lgIg8TcIcG9FrNXj6eokQGwB1VwTJdDlV0JDuXCk4din0IC+sfucPWf3j80XJbtVVH
 g08=
X-SBRS: 5.2
X-MesageID: 38508885
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="38508885"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 05/10] tools/libxl: Fix uninitialised variable in libxl__write_stub_dmargs()
Date: Fri, 12 Feb 2021 15:39:48 +0000
Message-ID: <20210212153953.4582-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various version of gcc, when compiling with -Og, complain:

  libxl_dm.c: In function ‘libxl__write_stub_dmargs’:
  libxl_dm.c:2166:16: error: ‘dmargs’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
               rc = libxl__xs_write_checked(gc, t, path, dmargs);
               ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It can't, but only because of how the is_linux_stubdom checks line up.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1ca21e4b81..7bbb8792ea 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2099,7 +2099,7 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
 {
     struct xs_permissions roperm[2];
     xs_transaction_t t = XBT_NULL;
-    char *dmargs;
+    char *dmargs = NULL;
     int rc;
 
     roperm[0].id = 0;
-- 
2.11.0


