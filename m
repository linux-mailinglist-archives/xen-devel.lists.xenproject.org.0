Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF8258DC0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4vf-000557-7d; Tue, 01 Sep 2020 11:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v4C0=CK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kD4vd-000552-Fx
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:58:21 +0000
X-Inumbo-ID: 703913d2-0e5d-4e13-9702-45fee4bb0533
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 703913d2-0e5d-4e13-9702-45fee4bb0533;
 Tue, 01 Sep 2020 11:58:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C25FB76E;
 Tue,  1 Sep 2020 11:58:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] fix build with make 3.81
Date: Tue,  1 Sep 2020 13:58:16 +0200
Message-Id: <20200901115816.16672-1-jgross@suse.com>
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

make 3.81 doesn't support multiline variables defined with

 define var =
 ...
 endef

Dropping the "=" in the first line will fix the issue.

Fixes: ded08cdfa72bb ("tools: generate most contents of library make variables")
Fixes: ddb2934a914df ("stubdom: add correct dependencies for Xen libraries")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 2 +-
 tools/Rules.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 4fd86dd44b..98eba8efe3 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -25,7 +25,7 @@ endif
 
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
-define LIB_deps =
+define LIB_deps
  LIBDEPS_$(1) = $$(foreach use,$$(USELIBS_$(1)),libxen$$(use))
 endef
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_deps,$(lib))))
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 7e019a8a65..385807a71c 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -94,7 +94,7 @@ endif
 # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
 # $(SHLIB_libfoo)
 
-define LIB_defs =
+define LIB_defs
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
  SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
-- 
2.26.2


