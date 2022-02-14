Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730174B50A4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271503.465985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapf-0004ZU-62; Mon, 14 Feb 2022 12:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271503.465985; Mon, 14 Feb 2022 12:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapf-0004U6-1Y; Mon, 14 Feb 2022 12:51:55 +0000
Received: by outflank-mailman (input) for mailman id 271503;
 Mon, 14 Feb 2022 12:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapd-0003jk-Dh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:51:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e113971b-8d94-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:51:51 +0100 (CET)
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
X-Inumbo-ID: e113971b-8d94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OM1G6c/BDHwKCEjd4XaBXduFB7GfRa2QTRUE5y+VtvI=;
  b=I9b5R5jBLFqhk5tgOpGizR7lsaaH5Hbb7S5/Kgqmce23ynZTM8y2xA8b
   PnYOch9sXd5SZn0UE4Ms2T0ZavPIiDMqMCxun/WAnkTigOlgw5qvCkt2f
   GRIY3eS/0XAoqDIWz9wrzoFqfLhRAxy0tnJIq8NlDHKp3UzZCnNIkG97U
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bMVoiWl/SqiephNQZZdM0jr+KyVglX9h9DTAuRNTCIiLqueZt+NbwSDLC87RExF/DKY0E2LLi7
 VxNv0TYS77xL+lUtl9j3Y/DsmlH3DzjAJqcI0FcNBQQhZQtlKVTYqBS9B8+y7YJR2RIIiHJA/q
 mktrqta4Pj4xG51lZmNUM/ExSMtTMBbdvtGjLVx0nh63fsdOvpBE6cL6yd9iaB5c4BEf9WtDEV
 OHFI7Q+50beCDZeLXEx9+F+8cwlUdkGy5+80Y9YeYDwvc6MjDM8Uh2OBOG4LWszVFJZwM642Pp
 T9E7rXgPS10tsEwL5uUY3kZa
X-SBRS: 5.1
X-MesageID: 64148317
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HX3pta0YVdWs3LQelvbD5cx2kn2cJEfYwER7XKvMYLTBsI5bp2AGz
 jEWWGHVb/3ZYDT3e9sjPo62/EsEsZ+ByoVmGws/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhrvshx
 4tm5JyLFlkrZuqcur8SDRlVHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2pkSTa2HO
 KL1bxJJMC3nZBkfB24eUrdg29+XmXPSbR9X/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfycTjTAdxIUufir7gz3QPVljd75AAquUWTkNLphRCVCtJkd
 BIWom1+j/M9qkymQYyoN/Gnm0KsshkZUttWNuQ17gCR16bZizqk6ng4oi1pM4J/6pJvLdA+/
 hrQxo6yW2Qz2FGAYS/Frt+pQSWO1T/5xIPoTQsNVkM77tbqu+nfZTqfH484QMZZYjAYcAwcI
 gxmTgBj3d3/buZRjs1XGGwrZBr2+PD0ovYdvFm/Y45cxloRiHSZT4Kp80PHyv1LMZyUSFKM1
 FBdxZTCs7BeUMzVzXfXKAnoIF1Oz6zbWAAwfHY1R8Vxn9hT0yLLkX9sDMFWex4yb5dslc7Ba
 07PowJBjKK/z1PxBZKbl7mZUpxwpYC5TIyNfqmNMrJmP8ggHCfarXoGTRPBgAjQfL0EzPhX1
 WGzKp33Ux73yM1PkVKLegvq+eF3mH5unz6PLX05pjz+uYejiLeuYe9tGDOzgioRtctoeS3Zr
 IRSMdWk0RJaXLGsayXb69dLf1sLMWI6Fdb9rMkOLryPJQ9vGWcADf7NwOx+J9w5zvoNzuqYr
 GugXkJ4yUbkgSGVIwu9dX0+OqjkWoxyrCxnMHV0b0qowXUqfa2m8LwbK8ksZbAi+eE6lax0Q
 vAJdt+uGPNKTjibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz+
 uTy2BnaTJwPQxVZIPzXMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dTE2fKEooOuH7csF0ZWBTCGv7O/NC2c9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6Ren1ZtE3j8Zli2Dq9tfyud1s5Vu6wRnrJUtGNag
 K5UFgW27VlRBP7YLQ==
IronPort-HdrOrdr: A9a23:f2vcC66UM7Gkg5Ht3APXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148317"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 01/70] xen/domain: Improve pirq handling
Date: Mon, 14 Feb 2022 12:50:18 +0000
Message-ID: <20220214125127.17985-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

free_pirq_struct() has no external users, so shouldn't be exposed.  Making it
static necessistates moving the function as domain_destroy() uses it.

Rework pirq_get_info() to have easier-to-follow logic.  The one functional
change is to the insertion failure path; we should not be using a full
call_rcu() chain to free an otherwise local structure we failed to insert into
the radix tree to begin with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2:
 * Drop likely/unlikey
---
 xen/common/domain.c      | 62 ++++++++++++++++++++++++++----------------------
 xen/include/xen/domain.h |  1 -
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2048ebad86ff..571ef4fe615e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -365,6 +365,39 @@ static int __init parse_extra_guest_irqs(const char *s)
 }
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
+static void _free_pirq_struct(struct rcu_head *head)
+{
+    xfree(container_of(head, struct pirq, rcu_head));
+}
+
+static void free_pirq_struct(void *ptr)
+{
+    struct pirq *pirq = ptr;
+
+    call_rcu(&pirq->rcu_head, _free_pirq_struct);
+}
+
+struct pirq *pirq_get_info(struct domain *d, int pirq)
+{
+    struct pirq *info = pirq_info(d, pirq);
+
+    if ( info )
+        return info;
+
+    info = alloc_pirq_struct(d);
+    if ( !info )
+        return NULL;
+
+    info->pirq = pirq;
+    if ( radix_tree_insert(&d->pirq_tree, pirq, info) == 0 )
+        return info; /* Success. */
+
+    /* Don't use call_rcu() to free a struct we failed to insert. */
+    _free_pirq_struct(&info->rcu_head);
+
+    return NULL;
+}
+
 /*
  * Release resources held by a domain.  There may or may not be live
  * references to the domain, and it may or may not be fully constructed.
@@ -1780,35 +1813,6 @@ long do_vm_assist(unsigned int cmd, unsigned int type)
 }
 #endif
 
-struct pirq *pirq_get_info(struct domain *d, int pirq)
-{
-    struct pirq *info = pirq_info(d, pirq);
-
-    if ( !info && (info = alloc_pirq_struct(d)) != NULL )
-    {
-        info->pirq = pirq;
-        if ( radix_tree_insert(&d->pirq_tree, pirq, info) )
-        {
-            free_pirq_struct(info);
-            info = NULL;
-        }
-    }
-
-    return info;
-}
-
-static void _free_pirq_struct(struct rcu_head *head)
-{
-    xfree(container_of(head, struct pirq, rcu_head));
-}
-
-void free_pirq_struct(void *ptr)
-{
-    struct pirq *pirq = ptr;
-
-    call_rcu(&pirq->rcu_head, _free_pirq_struct);
-}
-
 struct migrate_info {
     long (*func)(void *data);
     void *data;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 160c8dbdab33..b4d202fda9fd 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -44,7 +44,6 @@ void free_vcpu_struct(struct vcpu *v);
 #ifndef alloc_pirq_struct
 struct pirq *alloc_pirq_struct(struct domain *);
 #endif
-void free_pirq_struct(void *);
 
 /*
  * Initialise/destroy arch-specific details of a VCPU.
-- 
2.11.0


