Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6A9198465
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzzE-0005xh-RO; Mon, 30 Mar 2020 19:22:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzzD-0005xW-5y
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:15 +0000
X-Inumbo-ID: c0dbf5b2-72bb-11ea-b9f4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0dbf5b2-72bb-11ea-b9f4-12813bfff9fa;
 Mon, 30 Mar 2020 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cY01mY86IvlEBi9LBC0n631juFx7p42WJ2oDnAMsp50=; b=wut8A6a2aSgZO+eHz0HH0rqTy4
 rvgwJNTmIhTbrd5jDC/zDcJvGDdefAooOvvpqh+Lpp+eA4WLYBXCAN0whFWfK8h8RuvdTH/hQ4nXL
 oezV4/psEFV14HQH6fiTJg44b7opJMuv3YFyAhsI4/P3eV9jj9dpK7YLX+Gpp/+2iu2A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz8-0003lE-Bt; Mon, 30 Mar 2020 19:22:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz8-0007AJ-3D; Mon, 30 Mar 2020 19:22:10 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:52 +0100
Message-Id: <20200330192157.1335-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 3/8] tools/libxc: misc: Mark const the parameter
 'keys' of xc_send_debug_keys()
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

OCaml is using a string to describe the parameter 'keys' of
xc_send_debug_keys(). Since Ocaml 4.06.01, String_val() will return a
const char * when using -safe-string. This will result to a build
failure because xc_send_debug_keys() expects a char *.

The function should never modify the parameter 'keys' and therefore the
parameter should be const. Unfortunately, this is not directly possible
because DECLARE_HYPERCALL_BOUNCE() is expecting a non-const variable.

A new macro DECLARE_HYPERCALL_BOUNCE_IN() is introduced and will take
care of const parameter. The first user will be xc_send_debug_keys() but
this can be used in more place in the future.

Reported-by: Dario Faggioli <dfaggioli@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/libxc/include/xenctrl.h | 2 +-
 tools/libxc/xc_misc.c         | 4 ++--
 tools/libxc/xc_private.h      | 8 ++++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index fc6e57a1a0..d8874eb846 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1225,7 +1225,7 @@ int xc_readconsolering(xc_interface *xch,
                        unsigned int *pnr_chars,
                        int clear, int incremental, uint32_t *pindex);
 
-int xc_send_debug_keys(xc_interface *xch, char *keys);
+int xc_send_debug_keys(xc_interface *xch, const char *keys);
 int xc_set_parameters(xc_interface *xch, char *params);
 
 typedef struct xen_sysctl_physinfo xc_physinfo_t;
diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
index 093fa44081..957c03415c 100644
--- a/tools/libxc/xc_misc.c
+++ b/tools/libxc/xc_misc.c
@@ -167,11 +167,11 @@ int xc_readconsolering(xc_interface *xch,
     return ret;
 }
 
-int xc_send_debug_keys(xc_interface *xch, char *keys)
+int xc_send_debug_keys(xc_interface *xch, const char *keys)
 {
     int ret, len = strlen(keys);
     DECLARE_SYSCTL;
-    DECLARE_HYPERCALL_BOUNCE(keys, len, XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    DECLARE_HYPERCALL_BOUNCE_IN(keys, len);
 
     if ( xc_hypercall_bounce_pre(xch, keys) )
         return -1;
diff --git a/tools/libxc/xc_private.h b/tools/libxc/xc_private.h
index adc3b6a571..c77edb3c4c 100644
--- a/tools/libxc/xc_private.h
+++ b/tools/libxc/xc_private.h
@@ -181,6 +181,14 @@ enum {
  */
 #define DECLARE_HYPERCALL_BOUNCE(_ubuf, _sz, _dir) DECLARE_NAMED_HYPERCALL_BOUNCE(_ubuf, _ubuf, _sz, _dir)
 
+/*
+ * Declare a bounce buffer shadowing the named user data pointer that
+ * cannot be modified.
+ */
+#define DECLARE_HYPERCALL_BOUNCE_IN(_ubuf, _sz)                     \
+    DECLARE_NAMED_HYPERCALL_BOUNCE(_ubuf, (void *)(_ubuf), _sz,     \
+                                   XC_HYPERCALL_BUFFER_BOUNCE_IN)
+
 /*
  * Set the size of data to bounce. Useful when the size is not known
  * when the bounce buffer is declared.
-- 
2.17.1


