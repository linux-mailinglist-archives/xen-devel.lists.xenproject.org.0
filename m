Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31844193C38
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:48:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHP5Q-000182-4n; Thu, 26 Mar 2020 09:46:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHP5O-00017V-BT
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:46:02 +0000
X-Inumbo-ID: 99bd6db2-6f46-11ea-8790-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99bd6db2-6f46-11ea-8790-12813bfff9fa;
 Thu, 26 Mar 2020 09:46:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E1159AD1E;
 Thu, 26 Mar 2020 09:45:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 10:45:57 +0100
Message-Id: <20200326094557.13822-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools/libxl: make default of max event channels
 dependant on vcpus
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today the maximum number of event channels for a guest is defaulting
to 1023. For large guests with lots of vcpus this is not enough, as
e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
guest to about 140 vcpus.

Instead of requiring to specify the allowed number of event channels
via the "event_channels" domain config option, make the default
depend on the maximum number of vcpus of the guest.

In order not to regress current configs use 1023 as the minimum
default setting.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxl/libxl_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e7cb2dbc2b..eddd0e98e5 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
             b_info->iomem[i].gfn = b_info->iomem[i].start;
 
     if (!b_info->event_channels)
-        b_info->event_channels = 1023;
+        b_info->event_channels = min(1023, b_info->max_vcpus * 8 + 255);
 
     libxl__arch_domain_build_info_setdefault(gc, b_info);
     libxl_defbool_setdefault(&b_info->dm_restrict, false);
-- 
2.16.4


