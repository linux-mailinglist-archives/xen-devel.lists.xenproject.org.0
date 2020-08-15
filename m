Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A6245104
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 15:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6vqu-0006Sg-1U; Sat, 15 Aug 2020 13:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6vqs-0006Qw-Lw
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 13:04:02 +0000
X-Inumbo-ID: 232fd730-ea1d-432d-a5ad-a8cbac3ec27c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 232fd730-ea1d-432d-a5ad-a8cbac3ec27c;
 Sat, 15 Aug 2020 13:03:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D35EB57F;
 Sat, 15 Aug 2020 13:04:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH I v2 4/6] tools: don't call make recursively from libs.mk
Date: Sat, 15 Aug 2020 15:03:39 +0200
Message-Id: <20200815130341.27147-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815130341.27147-1-jgross@suse.com>
References: <20200815130341.27147-1-jgross@suse.com>
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

During build of a xen library make is called again via libs.mk. This is
not necessary as the same can be achieved by a simple dependency.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
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
2.26.2


