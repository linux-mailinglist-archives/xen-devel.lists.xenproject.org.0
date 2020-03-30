Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5A198464
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzK-0005zI-GL; Mon, 30 Mar 2020 19:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzI-0005yY-6q
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:20 +0000
X-Inumbo-ID: c14e495c-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c14e495c-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=peJcPgQ/w5GYJTqL3knAugPTmzSwJ80t6fz1TAFDEK0=; b=En/uO1WbEIm4lGhBErwCW2lV6A
 brHekkrx6Xl/3KGnU6ngnnWrHOwZr8X4rUozTWdNySK9YDaFHYXIqApXOqU22jgsaGTF0898Hssvi
 M81Ir5RC/ekjJnZL2zIeyicc7jWpEHbtvj1vdy2+4AA8IJbqctbW1GKpoNUIGfSByrbY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz9-0003lS-Dv; Mon, 30 Mar 2020 19:22:11 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz9-0007AJ-50; Mon, 30 Mar 2020 19:22:11 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:53 +0100
Message-Id: <20200330192157.1335-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 4/8] tools/libxc: misc: Mark const the parameter
 'params' of xc_set_parameters()
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
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, dfaggioli@suse.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The parameter 'params' of xc_set_parameters() should never be modified.
So mark it as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/libxc/include/xenctrl.h | 2 +-
 tools/libxc/xc_misc.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index d8874eb846..58fa931de1 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1226,7 +1226,7 @@ int xc_readconsolering(xc_interface *xch,
                        int clear, int incremental, uint32_t *pindex);
 
 int xc_send_debug_keys(xc_interface *xch, const char *keys);
-int xc_set_parameters(xc_interface *xch, char *params);
+int xc_set_parameters(xc_interface *xch, const char *params);
 
 typedef struct xen_sysctl_physinfo xc_physinfo_t;
 typedef struct xen_sysctl_cputopo xc_cputopo_t;
diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
index 957c03415c..fe477bf344 100644
--- a/tools/libxc/xc_misc.c
+++ b/tools/libxc/xc_misc.c
@@ -187,11 +187,11 @@ int xc_send_debug_keys(xc_interface *xch, const char *keys)
     return ret;
 }
 
-int xc_set_parameters(xc_interface *xch, char *params)
+int xc_set_parameters(xc_interface *xch, const char *params)
 {
     int ret, len = strlen(params);
     DECLARE_SYSCTL;
-    DECLARE_HYPERCALL_BOUNCE(params, len, XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    DECLARE_HYPERCALL_BOUNCE_IN(params, len);
 
     if ( xc_hypercall_bounce_pre(xch, params) )
         return -1;
-- 
2.17.1


