Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6DF44647D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222344.384481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhb-000665-4K; Fri, 05 Nov 2021 13:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222344.384481; Fri, 05 Nov 2021 13:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhb-00063r-0t; Fri, 05 Nov 2021 13:56:19 +0000
Received: by outflank-mailman (input) for mailman id 222344;
 Fri, 05 Nov 2021 13:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizhZ-00063k-Vo
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e943a8-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:16 +0100 (CET)
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
X-Inumbo-ID: 23e943a8-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Z0Fb+9kkOYecGzb6U/s5TW2X9lK58LRjbXJhRNnGzwg=;
  b=IIu/Z/aWUxq4+caaASqLOp2M3uIioZPZpiAG2LagRmDO35WnDZh//FrG
   1fd6msg/SU7EyyMybtic3H3NHMFc8ruT0zQwY/RXcqHlNKlp7z1Z3vUGY
   7UP0v1g2vR9Gc6xDz+gGIxyfbNji/OCm8hvi3CFUc384hV1THXvkJMdv3
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MLiHBsRH6c7KuqnbWbxgoNIzmyHYLZOhG4NGjVXV2hz8jG3ktzg4koUXly4UCZSo+2WSOukyxo
 /ajic0xUicILEFZ1eV399eRn0Varr8pJyd8UGofV2cA+Ybo+DraGF3zkSVC8Rg2CKAn3wwZzuI
 ck2MgSnEUkawRP86RW23630j7MbWKAPIxNBD+JZiAnUASZY2sMF0/9USvA7YrHkxWWBxXand1E
 IFYGxp89vHjXpvSfnbSa+ULPcCJa+Dq15pUAgZsRwvtXYd7qvgJ0ldwCYcfv0phxEdeYfa2Ymz
 tTGV+9JbF8GAFCPig977luWC
X-SBRS: 5.1
X-MesageID: 56699459
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:watG/qIZ4Q/hkhg8FE+RCZIlxSXFcZb7ZxGr2PjKsXjdYENS0GcGm
 2MbWGuOPa2PYWL2LdgkYI+x9htS7cDUy4NgQQVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es7xrZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2An9Fq8
 etkraCCSDgxNb3WwuE4bjxXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpu2JEfQauPD
 yYfQTtRYj79UjQSAFsON7c4jqSwmEigIjIN/Tp5ooJoujOOnWSdyoPFPMLOf92WRe1chkuCu
 n/d5GP9Hw0bM9qEjzGC9xqEiuDDkCzhUaoOBba48bhsm1TVyWsNYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZjdBaccfiuYueQ4r6
 UeCj8mzABlSlbLAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
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
IronPort-HdrOrdr: A9a23:GtMINK6Ua+lE6zHBAwPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,212,1631592000"; 
   d="scan'208";a="56699459"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 2/5] xen/xsm: Complete altcall conversion of xsm interface
Date: Fri, 5 Nov 2021 13:55:52 +0000
Message-ID: <20211105135555.24261-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211105135555.24261-1-andrew.cooper3@citrix.com>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

With alternative_call() capable of handling compound types, the three
remaining hooks can be optimised at boot time too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>

I'm on the fence as to whether to declare this as fixing "xsm: convert xsm_ops
hook calls to alternative call"
---
 xen/include/xsm/xsm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 0b360e1a3553..82458066f625 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -579,13 +579,13 @@ static inline int xsm_hypfs_op(xsm_default_t def)
 
 static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_ops.do_xsm_op(op);
+    return alternative_call(xsm_ops.do_xsm_op, op);
 }
 
 #ifdef CONFIG_COMPAT
 static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-    return xsm_ops.do_compat_op(op);
+    return alternative_call(xsm_ops.do_compat_op, op);
 }
 #endif
 
@@ -698,7 +698,7 @@ static inline int xsm_mmuext_op(
 static inline int xsm_update_va_mapping(
     xsm_default_t def, struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
-    return xsm_ops.update_va_mapping(d, f, pte);
+    return alternative_call(xsm_ops.update_va_mapping, d, f, pte);
 }
 
 static inline int xsm_priv_mapping(
-- 
2.11.0


