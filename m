Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C81E7A9B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecH3-0007ui-Ml; Fri, 29 May 2020 10:30:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jecH1-0007sh-V7
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:29:59 +0000
X-Inumbo-ID: 572bcec0-a197-11ea-a88b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 572bcec0-a197-11ea-a88b-12813bfff9fa;
 Fri, 29 May 2020 10:29:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DBD3AC2C;
 Fri, 29 May 2020 10:29:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] tools: fix Rules.mk library make variables
Date: Fri, 29 May 2020 12:29:53 +0200
Message-Id: <20200529102953.12714-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both SHDEPS_libxendevicemodel and SHDEPS_libxenhypfs have a bug by
adding $(SHLIB_xencall) instead of $(SHLIB_libxencall).

The former seems not to have any negative impact, probably because
it is not used anywhere in Xen without the correct $(SHLIB_libxencall)
being used, too.

Fixes: 86234eafb95295 ("libs: add libxenhypfs")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 518bb5660a..936fb83fa4 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -128,12 +128,12 @@ LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory) $(XEN_LIBXENFOREIGNME
 SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory) -Wl,-rpath-link=$(XEN_LIBXENFOREIGNMEMORY)
 
 CFLAGS_libxendevicemodel = -I$(XEN_LIBXENDEVICEMODEL)/include $(CFLAGS_xeninclude)
-SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_xencall)
+SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
 LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_LIBXENDEVICEMODEL)/libxendevicemodel$(libextension)
 SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_LIBXENDEVICEMODEL)
 
 CFLAGS_libxenhypfs = -I$(XEN_LIBXENHYPFS)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_xencall)
+SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
 LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_LIBXENHYPFS)/libxenhypfs$(libextension)
 SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_LIBXENHYPFS)
 
-- 
2.26.2


