Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4A507215
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308310.523995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq3f-0005ce-K8; Tue, 19 Apr 2022 15:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308310.523995; Tue, 19 Apr 2022 15:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq3f-0005Ze-Gs; Tue, 19 Apr 2022 15:46:27 +0000
Received: by outflank-mailman (input) for mailman id 308310;
 Tue, 19 Apr 2022 15:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hN/8=U5=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1ngq3d-0005ZY-7U
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:46:25 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd35f2ab-bff7-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:46:24 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id h5so24434302pgc.7
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:46:24 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 d139-20020a621d91000000b00505aa0d10desm17001194pfd.0.2022.04.19.08.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:46:22 -0700 (PDT)
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
X-Inumbo-ID: dd35f2ab-bff7-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=6BG+RIksgbZTEj/9zUG9lgF5QU8jZwsywEaD/+BOtvM=;
        b=FzWAF9GgsnGSSbOr3x4q7dLveuqFq9PvQdzhBro+/ZYJJ5ro1rUdgNPd63IusHP1vj
         V3wj9BBNC4CDwBdkEORDcUsbwos06DjcGku8h2FoXdKNJUGOL0D8kFAQsGQ9qjE81/B3
         iunuVO8HFB/X7IzDWM+ZHiGlnrjFdGyvDtZOKaCeTMRBzZbV0WuXyMyY7hf4QdXfnghy
         wdN1O06IGw/LY+I6mPmgpgCzf2hxM6eLRZhTv2G0n4aKOBUybX89Fw2Bd7dnM0GNqg22
         bMp+IjC4mda6R9GSZvMGqAvJYgOR1QaOvbI01lBbUcrefYk4UDHxFHHKANpeUbvtlVVq
         D6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=6BG+RIksgbZTEj/9zUG9lgF5QU8jZwsywEaD/+BOtvM=;
        b=Wbkki+9ONeoQ0ZgI0EKC/DX7i9LtSf/iUf+yockAp+gIqkptgQoyde489hzWCJ3zJ6
         Uzg26XbYRG5YgS0jHr50hrs5P+Lb4surLGYBeALEsJs9Wd/oPDsffYYQnnabl+cK2+s1
         GOfXAUb/4bnpJiDWpnsHGhWIT1gUuOxVOFzAzqpyB3xX20FrjdMlhzT5sTBtF4c2rUIG
         F4fPyvAb68wjQnxZp7JK/Pbqlh121t9JpXNuPz3v2ASiDRD8W7eJCHUrhYc53f/fxAdT
         kRiPhgFjO0A4bpOcBa1CrTeOkr4jgvhPR2ZmSw6UvxlDqozKzZqnBLGcFrvHbBSX4jtP
         1l8g==
X-Gm-Message-State: AOAM533tRBpl0KeAbeZBYWevWTaQ74xkeDf8lqOPUAkQ3xv3N06zUBVp
	b8Ej7lKYikgBfSEiy7RShyg=
X-Google-Smtp-Source: ABdhPJzcbmbLOeCiojnBYy2e5lIdM8/t9skNUIJFGVWqAiWoyTyedrtKtdqxUIHVJXv1iXGShWDeVw==
X-Received: by 2002:a62:5287:0:b0:505:651c:ffae with SMTP id g129-20020a625287000000b00505651cffaemr18171393pfb.13.1650383182481;
        Tue, 19 Apr 2022 08:46:22 -0700 (PDT)
Date: Wed, 20 Apr 2022 00:46:19 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/device_tree: silence ambiguous integer casting warning
 error
Message-ID: <20220419154619.GA3136@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

GCC with "-g -Wall -Wextra" option throws warning message as below:

error: comparison of integer expressions of different signedness:
 ‘int’ and ‘unsigned int’ [-Werror=sign-compare]

Silence the warning by correcting the integer type.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/common/device_tree.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 4aae281e89..402e465c7a 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -79,7 +79,7 @@ struct dt_bus
     const char *addresses;
     bool_t (*match)(const struct dt_device_node *node);
     void (*count_cells)(const struct dt_device_node *child,
-                        int *addrc, int *sizec);
+                        unsigned int *addrc, unsigned int *sizec);
     u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
     int (*translate)(__be32 *addr, u64 offset, int na);
     unsigned int (*get_flags)(const __be32 *addr);
@@ -569,7 +569,7 @@ static bool_t dt_bus_default_match(const struct dt_device_node *node)
 }
 
 static void dt_bus_default_count_cells(const struct dt_device_node *dev,
-                                int *addrc, int *sizec)
+                                       unsigned int *addrc, unsigned int *sizec)
 {
     if ( addrc )
         *addrc = dt_n_addr_cells(dev);
@@ -649,7 +649,7 @@ static bool_t dt_bus_pci_match(const struct dt_device_node *np)
 }
 
 static void dt_bus_pci_count_cells(const struct dt_device_node *np,
-				   int *addrc, int *sizec)
+				   unsigned int *addrc, unsigned int *sizec)
 {
     if (addrc)
         *addrc = 3;
@@ -737,7 +737,7 @@ static const struct dt_bus dt_busses[] =
 
 static const struct dt_bus *dt_match_bus(const struct dt_device_node *np)
 {
-    int i;
+    long unsigned int i;
 
     for ( i = 0; i < ARRAY_SIZE(dt_busses); i++ )
         if ( !dt_busses[i].match || dt_busses[i].match(np) )
@@ -754,7 +754,8 @@ static const __be32 *dt_get_address(const struct dt_device_node *dev,
     u32 psize;
     const struct dt_device_node *parent;
     const struct dt_bus *bus;
-    int onesize, i, na, ns;
+    unsigned int i;
+    unsigned int onesize, na, ns;
 
     /* Get parent & match bus type */
     parent = dt_get_parent(dev);
@@ -797,8 +798,7 @@ static int dt_translate_one(const struct dt_device_node *parent,
                             int pna, const char *rprop)
 {
     const __be32 *ranges;
-    unsigned int rlen;
-    int rone;
+    unsigned int rlen, rone;
     u64 offset = DT_BAD_ADDR;
 
     ranges = dt_get_property(parent, rprop, &rlen);
@@ -857,7 +857,7 @@ static u64 __dt_translate_address(const struct dt_device_node *dev,
     const struct dt_device_node *parent = NULL;
     const struct dt_bus *bus, *pbus;
     __be32 addr[DT_MAX_ADDR_CELLS];
-    int na, ns, pna, pns;
+    unsigned int na, ns, pna, pns;
     u64 result = DT_BAD_ADDR;
 
     dt_dprintk("DT: ** translation for device %s **\n", dev->full_name);
@@ -966,8 +966,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
     const struct dt_bus *bus, *pbus;
     const __be32 *ranges;
     __be32 addr[DT_MAX_ADDR_CELLS];
-    unsigned int rlen;
-    int na, ns, pna, pns, rone;
+    unsigned int rlen, na, ns, pna, pns, rone;
 
     bus = dt_match_bus(dev);
     if ( !bus )
@@ -1134,7 +1133,7 @@ unsigned int dt_number_of_address(const struct dt_device_node *dev)
     u32 psize;
     const struct dt_device_node *parent;
     const struct dt_bus *bus;
-    int onesize, na, ns;
+    unsigned int onesize, na, ns;
 
     /* Get parent & match bus type */
     parent = dt_get_parent(dev);
@@ -1169,8 +1168,8 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
     const struct dt_device_node *ipar, *tnode, *old = NULL;
     const __be32 *tmp, *imap;
     u32 intsize = 1, addrsize, pintsize = 0, paddrsize = 0;
-    u32 imaplen;
-    int i, ret;
+    u32 i, imaplen;
+    int ret;
 
     struct dt_raw_irq dt_raw_irq;
     struct dt_irq dt_irq;
@@ -1354,8 +1353,8 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
     const struct dt_device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
     const __be32 *tmp, *imap, *imask;
     u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
-    u32 imaplen;
-    int match, i;
+    u32 i, imaplen;
+    int match;
 
     dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
                parent->full_name, be32_to_cpup(intspec),
@@ -1737,7 +1736,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
 
             if ( out_args )
             {
-                int i;
+                u32 i;
 
                 WARN_ON(count > MAX_PHANDLE_ARGS);
                 if (count > MAX_PHANDLE_ARGS)
-- 
2.25.1


