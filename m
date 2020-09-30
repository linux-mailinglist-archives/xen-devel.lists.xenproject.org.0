Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D127EA23
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709.2383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcO2-0004MO-OX; Wed, 30 Sep 2020 13:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709.2383; Wed, 30 Sep 2020 13:43:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcO2-0004Lq-KK; Wed, 30 Sep 2020 13:43:14 +0000
Received: by outflank-mailman (input) for mailman id 709;
 Wed, 30 Sep 2020 13:43:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcO1-0004Jq-Js
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:43:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be0b216d-03f7-43c9-984c-37fc38ec7a78;
 Wed, 30 Sep 2020 13:43:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcO1-0004Jq-Js
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:43:13 +0000
X-Inumbo-ID: be0b216d-03f7-43c9-984c-37fc38ec7a78
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id be0b216d-03f7-43c9-984c-37fc38ec7a78;
	Wed, 30 Sep 2020 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pfaebICHsT9Xpl+dEptwfDkHBqyC5sZfCXsNsPLhVsc=;
  b=bAVuFgzfeTaU/htJWNkNIaMmB3gxGcjMxJB49Jn2HCeFT+EIXBjsTdE0
   JYxYg1/inJmeNOYWbdOzwERxeaLdJPad91JMJhhyh7tcFV7fAENEnicFe
   KP0ghHBscf/PlSuH1NHtEZcqtMgvyJxPZs+JIQkBQ8k3lqWtOB4pgWp0U
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: boXrHQnCsD1fTNyo2vlXTroxje/blgHgumD2CZjzJ/6ZfjxImnSHpDDeDsoBoeHwp7525KHynV
 N4iYRSGVlrvjaZC1ggojIqxQltUc8VQPZuvvd3RDumLfBodPXY2eyB1hyD5lldgBVHLtKRK1dd
 VQaD67CYazYcD+Dh8nBVOEB7ZaLvWTAszq95aioLgI5B2Wm0DBOM/0xsdk2vA3OhJvjbC4oEKr
 ktrcb0lwp4O7Q6BccnJqwjcAYxCYfdnwWFbnzEHJVJExxo6emriCXSIUo44QHvSCncMTCr5Z8k
 ZXI=
X-SBRS: None
X-MesageID: 27971143
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27971143"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/8] xen/xsm: Drop xsm_hvm_param_nested()
Date: Wed, 30 Sep 2020 14:42:46 +0100
Message-ID: <20200930134248.4918-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The sole caller has been removed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/flask/policy/modules/xen.if   | 2 +-
 xen/include/xsm/dummy.h             | 6 ------
 xen/include/xsm/xsm.h               | 6 ------
 xen/xsm/dummy.c                     | 1 -
 xen/xsm/flask/hooks.c               | 6 ------
 xen/xsm/flask/policy/access_vectors | 2 --
 6 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 8eb2293a52..5e2aa472b6 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -59,7 +59,7 @@ define(`create_domain_common', `
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
 	allow $1 $2:grant setup;
 	allow $1 $2:hvm { getparam hvmctl sethvmc
-			setparam nested altp2mhvm altp2mhvm_op dm };
+			setparam altp2mhvm altp2mhvm_op dm };
 ')
 
 # create_domain(priv, target)
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 2368acebed..7ae3c40eb5 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -551,12 +551,6 @@ static XSM_INLINE int xsm_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_param_nested(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
 static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index a80bcf3e42..7bd03d8817 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -136,7 +136,6 @@ struct xsm_operations {
 
     int (*hvm_param) (struct domain *d, unsigned long op);
     int (*hvm_control) (struct domain *d, unsigned long op);
-    int (*hvm_param_nested) (struct domain *d);
     int (*hvm_param_altp2mhvm) (struct domain *d);
     int (*hvm_altp2mhvm_op) (struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo) (struct domain *d);
@@ -564,11 +563,6 @@ static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned
     return xsm_ops->hvm_control(d, op);
 }
 
-static inline int xsm_hvm_param_nested (xsm_default_t def, struct domain *d)
-{
-    return xsm_ops->hvm_param_nested(d);
-}
-
 static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
 {
     return xsm_ops->hvm_param_altp2mhvm(d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d4cce68089..9e09512144 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -106,7 +106,6 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, hypfs_op);
     set_to_dummy_if_null(ops, hvm_param);
     set_to_dummy_if_null(ops, hvm_control);
-    set_to_dummy_if_null(ops, hvm_param_nested);
     set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
     set_to_dummy_if_null(ops, hvm_altp2mhvm_op);
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index fab5d30c3a..19b0d9e3eb 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1208,11 +1208,6 @@ static int flask_hvm_param(struct domain *d, unsigned long op)
     return current_has_perm(d, SECCLASS_HVM, perm);
 }
 
-static int flask_hvm_param_nested(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_HVM, HVM__NESTED);
-}
-
 static int flask_hvm_param_altp2mhvm(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__ALTP2MHVM);
@@ -1816,7 +1811,6 @@ static struct xsm_operations flask_ops = {
     .hypfs_op = flask_hypfs_op,
     .hvm_param = flask_hvm_param,
     .hvm_control = flask_hvm_param,
-    .hvm_param_nested = flask_hvm_param_nested,
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
     .hvm_altp2mhvm_op = flask_hvm_altp2mhvm_op,
 
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index fde5162c7e..1aa0bb501c 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -272,8 +272,6 @@ class hvm
 #  source = domain whose memory is being shared
 #  target = client domain
     share_mem
-# HVMOP_set_param setting HVM_PARAM_NESTEDHVM
-    nested
 # HVMOP_set_param setting HVM_PARAM_ALTP2MHVM
     altp2mhvm
 # HVMOP_altp2m_set_domain_state HVMOP_altp2m_get_domain_state
-- 
2.11.0


