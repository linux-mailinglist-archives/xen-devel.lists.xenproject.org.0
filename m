Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABE24EC8F
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maE-0008Ah-G3; Sun, 23 Aug 2020 09:46:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQt-0004sy-HP
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:59 +0000
X-Inumbo-ID: d1a48996-de82-4357-97b1-82a97f12588a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1a48996-de82-4357-97b1-82a97f12588a;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34C2CB7D0;
 Sun, 23 Aug 2020 09:35:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 35/38] tools/xl: don't assume libxl and libxlutil are in
 one directory
Date: Sun, 23 Aug 2020 11:35:16 +0200
Message-Id: <20200823093519.18386-36-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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

Add the correct flags for both, libxenlight and libxlutil, when
building xl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xl/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index af4912e67a..407dd7554c 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -13,6 +13,7 @@ CFLAGS += $(PTHREAD_CFLAGS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
 CFLAGS_XL += $(CFLAGS_libxenlight)
+CFLAGS_XL += $(CFLAGS_libxlutil)
 CFLAGS_XL += -Wshadow
 
 XL_OBJS-$(CONFIG_X86) = xl_psr.o
-- 
2.26.2


