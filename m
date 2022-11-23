Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CB636080
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 14:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447588.703997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxqAr-00012Y-Uy; Wed, 23 Nov 2022 13:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447588.703997; Wed, 23 Nov 2022 13:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxqAr-00010S-S6; Wed, 23 Nov 2022 13:52:25 +0000
Received: by outflank-mailman (input) for mailman id 447588;
 Wed, 23 Nov 2022 13:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MTeW=3X=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1oxpX9-0005Cy-9c
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 13:11:23 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 506acdef-6b30-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 14:11:19 +0100 (CET)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:11:03 -0800
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:11:00 -0800
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
X-Inumbo-ID: 506acdef-6b30-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669209079; x=1700745079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9gwcGwK6aoR5XOXZTGRjJPQ6fKbr/kvLd/b/MtJuVvA=;
  b=MyfnaHdyl7VAG+l+GdJpYdOCkWYheaGvmxRkkq9hLcwaOiOt3vTHau5M
   8GgWs4OuhkFi29CJB0GXfV6YfyzC0Urj2W/4S8knr78XZvRqzseXipr+U
   aFanTBjZp9uVJgQhh8E4Iwf8fjWgx7pNwJL2YYRWqaixIE980wG3N7oo0
   lAUmgJmmmDlJnIWQS4yeiNewOkNHoCpNPdvfjjlk53W72AqyDKLvkUx85
   UExOZRQ6bogrHPe3tx3cmACwHf+/cAs+mJlJqKgGPdvxH88dAbdziGTD6
   F3lc/I/OI/o5E/sq+u5Dyzp4PGMPcRp4cQOXrI+5ExnK044bY4lWjg17r
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="378319915"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="378319915"
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="674722512"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="674722512"
From: Jani Nikula <jani.nikula@intel.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: jani.nikula@intel.com
Subject: [PATCH] xen: fix xen.h build for CONFIG_XEN_PVH=y
Date: Wed, 23 Nov 2022 15:10:56 +0200
Message-Id: <20221123131057.3864183-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

For CONFIG_XEN_PVH=y, xen.h uses bool before the type is known. Include
<linux/types.h> earlier.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/xen/xen.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/xen/xen.h b/include/xen/xen.h
index a99bab817523..7adf59837c25 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -2,6 +2,8 @@
 #ifndef _XEN_XEN_H
 #define _XEN_XEN_H
 
+#include <linux/types.h>
+
 enum xen_domain_type {
 	XEN_NATIVE,		/* running on bare hardware    */
 	XEN_PV_DOMAIN,		/* running in a PV domain      */
@@ -25,8 +27,6 @@ extern bool xen_pvh;
 #define xen_hvm_domain()	(xen_domain_type == XEN_HVM_DOMAIN)
 #define xen_pvh_domain()	(xen_pvh)
 
-#include <linux/types.h>
-
 extern uint32_t xen_start_flags;
 
 #include <xen/interface/hvm/start_info.h>
-- 
2.34.1


