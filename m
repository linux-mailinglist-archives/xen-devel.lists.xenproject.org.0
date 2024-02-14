Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7B8548A2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680620.1058667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeN-0006Gj-Ry; Wed, 14 Feb 2024 11:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680620.1058667; Wed, 14 Feb 2024 11:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeN-0006DK-NS; Wed, 14 Feb 2024 11:42:03 +0000
Received: by outflank-mailman (input) for mailman id 680620;
 Wed, 14 Feb 2024 11:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeM-0006Bc-Jn
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:42:02 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10b392fe-cb2e-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:42:00 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d0fd07ba8bso35152041fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:42:00 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bi38-20020a05620a31a600b007872ed24739sm180347qkb.31.2024.02.14.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:41:59 -0800 (PST)
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
X-Inumbo-ID: 10b392fe-cb2e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910919; x=1708515719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKL9Cv8WHcDaH4CP4Lonu8yBimilzz26H15juTt/ZxA=;
        b=nEe4aLtez9IXm9cX4kSlhp+yFykMDFn90VDMvr6IQYhSFu7r4oYvd8Gr5PBSRrD4J6
         nbXzmt2sasTjduN8+bY2oS03WoEHuz7nVCXV9EYgrRMF9vXAD/7py+ZJk03Umc60trLp
         TxhHGiRAphBwZSVlHTFC658VQaB24Agv9yepY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910919; x=1708515719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKL9Cv8WHcDaH4CP4Lonu8yBimilzz26H15juTt/ZxA=;
        b=wId2IcD2gy8n4kVxlDO9PM2YrmO14VGM/Y70zTtxK/rdVAR8wW01ypWXNy+RpIErj3
         4UxMJ422hImjkY6jtDjg5SpCg2vZ3xmrMoXIaC3gOOvItrrtZJNiyQoNomu3DO39wrni
         xVpwx0oJxFIMkZmiGXn7B17GujxouVHdBE50dn2gx0dBxaLFu9M8gkH7tBV1SOW0SZd9
         pwt7OSsudSAaTCj6ZunBNPDWjVpPhjGKd4VDuKI+c/p9ZFbkoCYH93I7P+HQoCeYVDeP
         BmPWR4gcLAfSXnEvLNLbhoFjrumWxLuOYEwP28N3+m3oUCUI/sQfrhO7bcNhK3D2TXnF
         Nixw==
X-Gm-Message-State: AOJu0YyVgWot4iQhzV/4/w5tjh9qvkeXhjPzBuRQuX9Ivc/VLDXNDus/
	VjgMuUXC3VfqSGiCVYicTb3IUyOk8gbExgw2TxEBkOktENOEk5h7cRv1jR70WtqK+oQ6NC6WhcR
	o
X-Google-Smtp-Source: AGHT+IHUsXy8zpz6Pkru0Y+FJ4gDPCuKjJ3J88fc19kB1QXCFNBgs5JRwin6PaWa+OJZ0ev+OgzL6g==
X-Received: by 2002:a2e:9bd7:0:b0:2d0:b464:a9b1 with SMTP id w23-20020a2e9bd7000000b002d0b464a9b1mr1782333ljj.4.1707910919383;
        Wed, 14 Feb 2024 03:41:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoumRfLLegYsfIk0OlRRhL1cxE/bp5SDNpmxtiua8EizwJKwUX8BArraMIUl0wj0hJ2jKP0AtR05o5kO9FmvnRBd9+V+rSutBzGOkNv+cfPzEtV1HNQV1uxM2VRTQllPnC+ZptTBTenXNm
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/5] iommu/x86: use full addresses internally for the IVMD/RMRR range checks
Date: Wed, 14 Feb 2024 11:37:39 +0100
Message-ID: <20240214103741.16189-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-1-roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust the code in the checker to use full addresses rather than frame numbers,
as it's only page_get_ram_type() that requires an mfn parameter.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 304a2f5480c7..e713cf803e8a 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -794,28 +794,26 @@ __initcall(adjust_irq_affinities);
 
 bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
 {
-    mfn_t addr;
+    paddr_t s = mfn_to_maddr(start), e = mfn_to_maddr(end);
 
-    if ( e820_all_mapped(mfn_to_maddr(start), mfn_to_maddr(end) + PAGE_SIZE,
-                         E820_RESERVED) )
+    if ( e820_all_mapped(s, e + PAGE_SIZE, E820_RESERVED) )
         return true;
 
     printk(XENLOG_WARNING
            "%s: [%#lx, %#lx] is not (entirely) in reserved memory\n",
-           prefix, mfn_to_maddr(start), mfn_to_maddr(end));
+           prefix, s, e);
 
-    for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
+    for ( paddr_t addr = s; addr <= e; addr += PAGE_SIZE )
     {
-        unsigned int type = page_get_ram_type(addr);
+        unsigned int type = page_get_ram_type(maddr_to_mfn(addr));
 
         if ( type == RAM_TYPE_UNKNOWN )
         {
-            if ( e820_add_range(mfn_to_maddr(addr),
-                                mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
+            if ( e820_add_range(addr, addr + PAGE_SIZE, E820_RESERVED) )
                 continue;
             printk(XENLOG_ERR
-                   "%s: page at %#" PRI_mfn " couldn't be reserved\n",
-                   prefix, mfn_x(addr));
+                   "%s: page at %#lx couldn't be reserved\n",
+                   prefix, paddr_to_pfn(addr));
             return false;
         }
 
@@ -829,9 +827,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
                      RAM_TYPE_UNUSABLE) )
             continue;
 
-        printk(XENLOG_ERR
-               "%s: page at %#" PRI_mfn " can't be converted\n",
-               prefix, mfn_x(addr));
+        printk(XENLOG_ERR "%s: page at %#lx can't be converted\n",
+               prefix, paddr_to_pfn(addr));
         return false;
     }
 
-- 
2.43.0


