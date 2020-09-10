Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E82648F8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 17:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGOiL-00041z-JZ; Thu, 10 Sep 2020 15:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ajRG=CT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGOiK-00041s-QY
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 15:42:20 +0000
X-Inumbo-ID: 3dc0e17d-c5e6-426f-99d0-843dddb23dd5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dc0e17d-c5e6-426f-99d0-843dddb23dd5;
 Thu, 10 Sep 2020 15:42:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A55E9ACB5;
 Thu, 10 Sep 2020 15:42:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/guest: fix Makefile regarding zlib options
Date: Thu, 10 Sep 2020 17:42:10 +0200
Message-Id: <20200910154210.2440-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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

When renaming the libxenguest sources to xg_*.c there was an omission
in the Makefile when setting the zlib related define for the related
sources. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index e53aeabd3e..f24732fbcd 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -94,8 +94,8 @@ else
 zlib-options = $(ZLIB)
 endif
 
-xc_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
-xc_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
+xg_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
+xg_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
 
 LIBHEADER := xenguest.h
 
-- 
2.26.2


