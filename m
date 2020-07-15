Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9D22123C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkEI-0002fY-GI; Wed, 15 Jul 2020 16:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkEH-0002Yi-AT
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:25:57 +0000
X-Inumbo-ID: d0b03a0c-c6b7-11ea-bb8b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b03a0c-c6b7-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:37 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDw-0001sU-Gu; Wed, 15 Jul 2020 17:25:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 04/12] tools: don't call make recursively from libs.mk
Date: Wed, 15 Jul 2020 17:25:03 +0100
Message-Id: <20200715162511.5941-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
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
Reply-To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

During build of a xen library make is called again via libs.mk. This is
not necessary as the same can be achieved by a simple dependency.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 8045c00e9a..764f5441e2 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -45,8 +45,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build:
-	$(MAKE) libs
+build: libs
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-- 
2.20.1


