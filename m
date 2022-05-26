Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D2534B40
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 10:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337480.562079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu8bw-0007Aj-47; Thu, 26 May 2022 08:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337480.562079; Thu, 26 May 2022 08:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu8bw-00078x-1H; Thu, 26 May 2022 08:12:48 +0000
Received: by outflank-mailman (input) for mailman id 337480;
 Thu, 26 May 2022 08:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0Dc=WC=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nu8bu-00078r-Dr
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 08:12:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9de4a670-dccb-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 10:12:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45DF21474;
 Thu, 26 May 2022 01:12:42 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89793F70D;
 Thu, 26 May 2022 01:12:40 -0700 (PDT)
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
X-Inumbo-ID: 9de4a670-dccb-11ec-837f-e5687231ffcc
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	andrew.cooper3@citrix.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: optimize domain creation skipping domain cpupool move
Date: Thu, 26 May 2022 09:12:30 +0100
Message-Id: <20220526081230.3194-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Commit 92ea9c54fc81 ("arm/dom0less: assign dom0less guests to cpupools")
introduced a way to start a domain directly on a certain cpupool,
adding a "cpupool_id" member to struct xen_domctl_createdomain.

This was done to be able to start dom0less guests in different pools than
cpupool0, but the toolstack can benefit from it because it can now use
the struct member directly instead of creating the guest in cpupool0
and then moving it to the target cpupool.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/libs/light/libxl_create.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 69ec405858a8..2339f09e95a6 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -633,6 +633,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
+            .cpupool_id = info->poolid,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
@@ -757,13 +758,6 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
      */
     assert(libxl_domid_valid_guest(*domid));
 
-    ret = xc_cpupool_movedomain(ctx->xch, info->poolid, *domid);
-    if (ret < 0) {
-        LOGED(ERROR, *domid, "domain move fail");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
     dom_path = libxl__xs_get_dompath(gc, *domid);
     if (!dom_path) {
         rc = ERROR_FAIL;
-- 
2.17.1


