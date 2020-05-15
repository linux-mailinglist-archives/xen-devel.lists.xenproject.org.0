Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1161D4D29
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 13:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZYzx-0004vt-EN; Fri, 15 May 2020 11:59:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yAEg=65=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZYzw-0004vB-5e
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 11:59:28 +0000
X-Inumbo-ID: 787698b7-96a3-11ea-a554-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 787698b7-96a3-11ea-a554-12813bfff9fa;
 Fri, 15 May 2020 11:59:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 115E0AE2A;
 Fri, 15 May 2020 11:59:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v9 11/12] tools/libxc: remove xc_set_parameters()
Date: Fri, 15 May 2020 13:58:55 +0200
Message-Id: <20200515115856.11965-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200515115856.11965-1-jgross@suse.com>
References: <20200515115856.11965-1-jgross@suse.com>
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

There is no user of xc_set_parameters() left, so remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
---
 tools/libxc/include/xenctrl.h |  1 -
 tools/libxc/xc_misc.c         | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 45ff7db1e8..f9e17ae424 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1226,7 +1226,6 @@ int xc_readconsolering(xc_interface *xch,
                        int clear, int incremental, uint32_t *pindex);
 
 int xc_send_debug_keys(xc_interface *xch, const char *keys);
-int xc_set_parameters(xc_interface *xch, const char *params);
 
 typedef struct xen_sysctl_physinfo xc_physinfo_t;
 typedef struct xen_sysctl_cputopo xc_cputopo_t;
diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
index fe477bf344..3820394413 100644
--- a/tools/libxc/xc_misc.c
+++ b/tools/libxc/xc_misc.c
@@ -187,27 +187,6 @@ int xc_send_debug_keys(xc_interface *xch, const char *keys)
     return ret;
 }
 
-int xc_set_parameters(xc_interface *xch, const char *params)
-{
-    int ret, len = strlen(params);
-    DECLARE_SYSCTL;
-    DECLARE_HYPERCALL_BOUNCE_IN(params, len);
-
-    if ( xc_hypercall_bounce_pre(xch, params) )
-        return -1;
-
-    sysctl.cmd = XEN_SYSCTL_set_parameter;
-    set_xen_guest_handle(sysctl.u.set_parameter.params, params);
-    sysctl.u.set_parameter.size = len;
-    memset(sysctl.u.set_parameter.pad, 0, sizeof(sysctl.u.set_parameter.pad));
-
-    ret = do_sysctl(xch, &sysctl);
-
-    xc_hypercall_bounce_post(xch, params);
-
-    return ret;
-}
-
 int xc_physinfo(xc_interface *xch,
                 xc_physinfo_t *put_info)
 {
-- 
2.26.1


