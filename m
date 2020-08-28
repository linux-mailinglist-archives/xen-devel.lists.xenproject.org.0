Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80931255D71
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfzc-0005HT-6X; Fri, 28 Aug 2020 15:08:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfza-0004eG-67
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:38 +0000
X-Inumbo-ID: a68b3ea3-7d24-4117-b402-9b7a2bdbcb47
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a68b3ea3-7d24-4117-b402-9b7a2bdbcb47;
 Fri, 28 Aug 2020 15:07:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21113AFB2;
 Fri, 28 Aug 2020 15:08:27 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 23/31] tools/libxl: fix dependencies of libxl tests
Date: Fri, 28 Aug 2020 17:07:39 +0200
Message-Id: <20200828150747.25305-24-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

Today building the libxl internal tests depends on libxlutil having
been built, in spite of the tests not using any functionality of
libxlutil. Fix this by dropping the dependency.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxl/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index b815c548de..d3dd9efadf 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -339,14 +339,14 @@ libxlutil.so.$(XLUMAJOR).$(XLUMINOR): $(LIBXLU_OBJS) libxenlight.so
 libxlutil.a: $(LIBXLU_OBJS)
 	$(AR) rcs libxlutil.a $^
 
-test_%: test_%.o test_common.o libxlutil.so libxenlight_test.so
+test_%: test_%.o test_common.o libxenlight_test.so
 	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
-testidl: testidl.o libxlutil.so libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ testidl.o libxlutil.so $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+testidl: testidl.o libxenlight.so
+	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.26.2


