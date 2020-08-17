Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D557A2463B7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bll-00048D-Mh; Mon, 17 Aug 2020 09:49:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7blj-00046j-WD
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:32 +0000
X-Inumbo-ID: 29b05635-06e4-4b40-b5af-d39399d8bad3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b05635-06e4-4b40-b5af-d39399d8bad3;
 Mon, 17 Aug 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A44D2AE63;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH II v2 04/17] tools/python: drop libxenguest from setup.py
Date: Mon, 17 Aug 2020 11:49:09 +0200
Message-Id: <20200817094922.15768-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There is not a single wrapper for a libxenguest function defined.
So drop libxenguest from tools/python/setup.py.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/python/setup.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8faf1c0ddc..44696b3998 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -21,8 +21,8 @@ xc = Extension("xc",
                                       PATH_LIBXC + "/include",
                                       "xen/lowlevel/xc" ],
                library_dirs       = [ PATH_LIBXC ],
-               libraries          = [ "xenctrl", "xenguest" ],
-               depends            = [ PATH_LIBXC + "/libxenctrl.so", PATH_LIBXC + "/libxenguest.so" ],
+               libraries          = [ "xenctrl" ],
+               depends            = [ PATH_LIBXC + "/libxenctrl.so" ],
                extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
                sources            = [ "xen/lowlevel/xc/xc.c" ])
 
-- 
2.26.2


