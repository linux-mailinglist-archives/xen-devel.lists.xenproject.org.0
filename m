Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D05A2804
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 14:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393758.632943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoH-0002vF-J7; Fri, 26 Aug 2022 12:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393758.632943; Fri, 26 Aug 2022 12:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRYoH-0002qw-9d; Fri, 26 Aug 2022 12:51:41 +0000
Received: by outflank-mailman (input) for mailman id 393758;
 Fri, 26 Aug 2022 12:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z28m=Y6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oRYoF-00013M-E0
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 12:51:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d36904fd-253d-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 14:51:38 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id fy31so2562260ejc.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 05:51:38 -0700 (PDT)
Received: from carlo-ubuntu.. (hipert-gw1.mat.unimo.it. [155.185.5.1])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b006ff0b457cdasm888812ejh.53.2022.08.26.05.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:51:38 -0700 (PDT)
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
X-Inumbo-ID: d36904fd-253d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8q8cSK0/ZbUuwajE+w5sunrFXcqx/YGVTD9wQaToEI0=;
        b=nbqKRXAqk2Udr8kI/SUFCexCVkpyFcD7/XcAuGIl8cue6/F+BzHuaCCJkXY4RWOYs0
         ZshlxV4FtJIKeJ9rTD+AG9T7olxSOwbPRR1Qp1okXYmUJCxous0RgjYSD6CLBmrfv+Go
         P9HVDtkKvMOtfhdbFk5Qh1Cf2CQ5VVDV4qzm/LQjNaxaAK5Glnv1Ku+UjXOlU5XC/ZWT
         3Zcv6QEBbmjf/wSbprs9Tnazd3U1wt1goOn1essPXdpbipZE9lCJIw6kVmmA9f4XivUx
         tzhUkDTCLTBFV5vXKmXUD5BeRPY83McAzK/okdxy7TYZoIRdR7Uguh//rjthiLTBdIPE
         Qoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8q8cSK0/ZbUuwajE+w5sunrFXcqx/YGVTD9wQaToEI0=;
        b=PSLRuQT+2sg8GFcPeibLTNhdQgHcvC199NT3KSNuP3HePvd6FTwX21j7FpzFEN1yIX
         1MwukTNVxd2cAI+6KF8C0bGAGDGV/JALVn7gC4RIsCEfiFTsN30Nrv8/CUwnXFoHfs11
         inVRGspGwAjeJ+khiD5+82mZPfcZuz06N0Q80jPHPvKfZW/eLhC23S4f2KUae+CP2prj
         N8zQpG2jUOp2XCaOnwmiqP3G0D0cEeozA4sChh9gCyn9Z1rbB3h44vFj5dfwEtrwCSRc
         pr7QxiLOZVh/GXyW57r7E0h3Vd5Y2jTypxet5da10gXKoI7+d9Z6LnDmym9JXjYUM3Q4
         ZIeA==
X-Gm-Message-State: ACgBeo3wpcbzgKf8Mkd3s3Qkjq1rpzM1SLj4qrbu+EnvIbcVBh7jX4yr
	OhOmdXn7kM+Vo8naTfLMfxdDFE2Cm6sZ7g==
X-Google-Smtp-Source: AA6agR5U5N1r4qkF/3vBc7BJpuniwJiwk4Drng/nfaijetjjGomI6h419PBY2XUs+KbJ4yUPlFIPgw==
X-Received: by 2002:a17:907:d08:b0:72f:b107:c07a with SMTP id gn8-20020a1709070d0800b0072fb107c07amr5492067ejc.340.1661518298352;
        Fri, 26 Aug 2022 05:51:38 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	stefano.stabellini@amd.com,
	wl@xen.org,
	marco.solieri@unimore.it,
	andrea.bastoni@minervasys.tech,
	lucmiccio@gmail.com,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH 07/12] xen/common: add colored heap info debug-key
Date: Fri, 26 Aug 2022 14:51:06 +0200
Message-Id: <20220826125111.152261-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a debug-key to let the user inspect the colored heap
information. The number of pages stored for each available color is dumped.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/common/page_alloc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 4ae3cfe9a7..be6bb2b9a1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -605,6 +605,27 @@ static struct page_info *alloc_col_domheap_page(struct domain *d,
     return pg;
 }
 
+static void dump_col_heap(unsigned char key)
+{
+    struct page_info *pg;
+    unsigned long pages;
+    unsigned int color;
+
+    printk("'%c' pressed -> dumping coloring heap info\n", key);
+
+    for ( color = 0; color < get_max_colors(); color++ )
+    {
+        printk("Heap[%u]: ", color);
+        pages = 0;
+        page_list_for_each( pg, colored_pages(color) )
+        {
+            BUG_ON(!(page_to_color(pg) == color));
+            pages++;
+        }
+        printk("%lu pages\n", pages);
+    }
+}
+
 size_param("buddy-alloc-size", buddy_alloc_size);
 #else
 static void free_col_domheap_page(struct page_info *pg)
@@ -2853,6 +2874,9 @@ static void cf_check dump_heap(unsigned char key)
 static __init int cf_check register_heap_trigger(void)
 {
     register_keyhandler('H', dump_heap, "dump heap info", 1);
+#ifdef CONFIG_CACHE_COLORING
+    register_keyhandler('k', dump_col_heap, "dump coloring heap info", 1);
+#endif
     return 0;
 }
 __initcall(register_heap_trigger);
-- 
2.34.1


