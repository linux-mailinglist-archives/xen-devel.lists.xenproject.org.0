Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3114147E8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192543.343039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0YW-0006FW-QO; Wed, 22 Sep 2021 11:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192543.343039; Wed, 22 Sep 2021 11:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0YW-0006Dc-NI; Wed, 22 Sep 2021 11:36:52 +0000
Received: by outflank-mailman (input) for mailman id 192543;
 Wed, 22 Sep 2021 11:36:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzcW=OM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mT0YV-0006DO-IG
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:36:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 60b1227e-1b99-11ec-b970-12813bfff9fa;
 Wed, 22 Sep 2021 11:36:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7895911B3;
 Wed, 22 Sep 2021 04:36:50 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7726A3F719;
 Wed, 22 Sep 2021 04:36:49 -0700 (PDT)
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
X-Inumbo-ID: 60b1227e-1b99-11ec-b970-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	andre.przywara@arm.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 04/17] xen/arm: xc_domain_ioport_permission(..) not supported on ARM.
Date: Wed, 22 Sep 2021 12:34:50 +0100
Message-Id: <e71044315a6d2a3fb127d62954579390cb837d10.1632307952.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
In-Reply-To: <cover.1632307952.git.rahul.singh@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>

ARM architecture does not implement I/O ports. Ignore this call on ARM
to avoid the overhead of making a hypercall just for Xen to return
-ENOSYS.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Change in v2:
- Instead of returning success in XEN, ignored the call in xl.
---
 tools/libs/ctrl/xc_domain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 23322b70b5..25c95f6596 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1348,6 +1348,14 @@ int xc_domain_ioport_permission(xc_interface *xch,
                                 uint32_t nr_ports,
                                 uint32_t allow_access)
 {
+#if defined(__arm__) || defined(__aarch64__)
+    /*
+     * The ARM architecture does not implement I/O ports.
+     * Avoid the overhead of making a hypercall just for Xen to return -ENOSYS.
+     * It is safe to ignore this call on ARM so we just return 0.
+     */
+    return 0;
+#else
     DECLARE_DOMCTL;
 
     domctl.cmd = XEN_DOMCTL_ioport_permission;
@@ -1357,6 +1365,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
     domctl.u.ioport_permission.allow_access = allow_access;
 
     return do_domctl(xch, &domctl);
+#endif
 }
 
 int xc_availheap(xc_interface *xch,
-- 
2.17.1


