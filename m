Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90544647C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222346.384503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhd-0006co-Kc; Fri, 05 Nov 2021 13:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222346.384503; Fri, 05 Nov 2021 13:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhd-0006a3-Fe; Fri, 05 Nov 2021 13:56:21 +0000
Received: by outflank-mailman (input) for mailman id 222346;
 Fri, 05 Nov 2021 13:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizhb-00063k-Nl
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25162320-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:17 +0100 (CET)
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
X-Inumbo-ID: 25162320-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=73dQ75yd67p2Kv9Z6qIaurf9n5YwDjcozGH/T+POHx8=;
  b=edcdlVkGD58YbTJxZvYikkfmYw+N2wqYtgMm3qLD2cAVQ6RZPr383AYO
   qT9oT4jnHp5cCYtpghCSpoSYo6zHfUPfO+PeuKNu2PmS/BOthE8zdl5SY
   ATcfzvxUYyJwXBzYzNgt19ZwYwHql2Fycg0HKtISR7VLJhAK1yW6J9yTh
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zPkwD9+bTi71w9vwU7TMWjRFRkPZQkquaaBfjLYiOd1zeD6ibayESVTxgxbr1IL4knvEU+6WN+
 YokxvY3P6PcRmPjC/ejcQNBfjff0H+a4oG2CpmGtA/O+BIL64buZTvfFj5qwUTf67plgGT/B2a
 OzN2KqYFD75O6MflfVpTiFWExIK6hHwshRE2NxjcU4e6iJdLtxZv/LylHS7oelo0pZwDSro6qq
 X7Zr0GfgEkquBJzvZKbeKzpKgPK0YOanNPR9IaNQvVEIZ6Lrzo5eOZ8+Ffx2fTRtwaJgnKv1EH
 AF7IY33V3xCEEKOus+CAsJWI
X-SBRS: 5.1
X-MesageID: 57137739
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pwFVBKLUqLteUOw0FE+RCZIlxSXFcZb7ZxGr2PjKsXjdYENSgj1Vn
 GEcXWHSPPeLYDP0Ktl2Pom19EJV68PXn9Q1TwtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es7xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB24pfct4
 tcWuqbodl55O4/LqaM5eSBHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpv35sRQq2PD
 yYfQRpmaTuZRSdeA3ZJUosDtcCKxUnvahQN/Tp5ooJoujOOnWSdyoPFPMLOf92WRe1chkuCu
 n/d5GP9Hw0bM9qEjzGC9xqEiuDDkCzhUaoOBba48bhsm1TVyWsNYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZg97T4AMtpQ5f2QVj
 w+MvdTYQhhFiaLAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TBhAztJcvU/MBofAnrNOv0jxpiGGeN6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyXyMPYsPtzuU5VCIU3c+TLNDK28gj1mOMkZSeN61Hs2OR74M57FyRBEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrXYflU6QTh5YxITqJt4E7FYc21uvr+g1
 hmAtoVwkjITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:WOACbK5NPPlqa/p3fgPXwf2CI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhI03Jmbi7Scy9qADnhORICOgqTPmftWzd0ldAQ7sSlLcKrweQeBEWldQtlJ
 uIEZIOcOEYZGIS5a2WgWmF+r0bsb26GdWT9IHjJgBWPGZXgs9bnmVEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue7167OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLiCM0llWjqqi+quGRjeerN/b8zPT97Q+c0zpAUb4RH4FqegpF+N1Hpmxay+
 Uk6C1QQvibo0mhAl1d5yGdmzXI4XIW8HnlxkafgXz/5eLEZB9SMbsduatpNiLD7Uwupdd917
 8O+Vm4md54MTPs9R6NveQhcXlR5xWJSL4Z4LIuZjVkIPUjQa4UoooF8ExPFpAcWCr89YA8Ce
 FrSNrR/fBMbDqhHj3kl3gqwselUWkzEheAUQwFptGf1SRQkRlCvjwlLWMk7wI9Hb8GOtJ5Dt
 7/Q+5VfXB1P7srRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCP37WsZb47Lg8+envIfUzvdQPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5Trv2Ni+ITkwojqKb0rkiK9yeX+
 z2NINdAvflI2erEYFV3xfmU50XMnUaWN19gKdyZ3ue5sbQboH6vO3Sd/jeYLDkFDoiV2vlRm
 EORzj+PoFB6Vq3UnjzjFzQVhrWCzzCFbkZKtmqwwHS8vlFCmRhiHlntb2J3LD8FdQZiN1IQK
 JXGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.87,211,1631592000"; 
   d="scan'208";a="57137739"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 3/5] xen/xsm: Drop xsm_hvm_control() hook
Date: Fri, 5 Nov 2021 13:55:53 +0000
Message-ID: <20211105135555.24261-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211105135555.24261-1-andrew.cooper3@citrix.com>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

The final caller was dropped by c/s 58cbc034dc62 "dm_op: convert
HVMOP_inject_trap and HVMOP_inject_msi"

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h | 7 -------
 xen/include/xsm/xsm.h   | 7 -------
 xen/xsm/dummy.c         | 1 -
 xen/xsm/flask/hooks.c   | 1 -
 4 files changed, 16 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 3b1b378b5899..b024119896e6 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -580,13 +580,6 @@ static XSM_INLINE int xsm_hvm_param(
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_control(
-    XSM_DEFAULT_ARG struct domain *d, unsigned long op)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
 static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 82458066f625..c5bd4213490a 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -138,7 +138,6 @@ struct xsm_ops {
 #endif
 
     int (*hvm_param)(struct domain *d, unsigned long op);
-    int (*hvm_control)(struct domain *d, unsigned long op);
     int (*hvm_param_altp2mhvm)(struct domain *d);
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
     int (*get_vnumainfo)(struct domain *d);
@@ -595,12 +594,6 @@ static inline int xsm_hvm_param(
     return alternative_call(xsm_ops.hvm_param, d, op);
 }
 
-static inline int xsm_hvm_control(
-    xsm_default_t def, struct domain *d, unsigned long op)
-{
-    return alternative_call(xsm_ops.hvm_control, d, op);
-}
-
 static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d8c935328e67..041f59fdf4ad 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -103,7 +103,6 @@ void __init xsm_fixup_ops (struct xsm_ops *ops)
     set_to_dummy_if_null(ops, page_offline);
     set_to_dummy_if_null(ops, hypfs_op);
     set_to_dummy_if_null(ops, hvm_param);
-    set_to_dummy_if_null(ops, hvm_control);
     set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
     set_to_dummy_if_null(ops, hvm_altp2mhvm_op);
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index ea9a12bd7121..3b29f7fde372 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1816,7 +1816,6 @@ static const struct xsm_ops __initconstrel flask_ops = {
     .page_offline = flask_page_offline,
     .hypfs_op = flask_hypfs_op,
     .hvm_param = flask_hvm_param,
-    .hvm_control = flask_hvm_param,
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
     .hvm_altp2mhvm_op = flask_hvm_altp2mhvm_op,
 
-- 
2.11.0


