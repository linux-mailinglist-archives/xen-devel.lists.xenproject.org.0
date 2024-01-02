Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A682191E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660566.1030104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRD-0007cw-Jw; Tue, 02 Jan 2024 09:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660566.1030104; Tue, 02 Jan 2024 09:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRD-0007Uu-Ef; Tue, 02 Jan 2024 09:51:55 +0000
Received: by outflank-mailman (input) for mailman id 660566;
 Tue, 02 Jan 2024 09:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRC-00060C-4f
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e26080d-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:52 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so15741353a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:52 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:50 -0800 (PST)
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
X-Inumbo-ID: 8e26080d-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189111; x=1704793911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP9qQ4nWMhVEqh2w5k34a2KqREJgBIKIufbFzw/gkj0=;
        b=ecE6WAHRUfIqOWJvNjMbA71GLSIneRm3nz3q4CLSXM7OWfi/YYs6VGQiDVhI7iYZ80
         tBJSV0DKdGIZ2+OU3aOlkACU6XnQd6gPMK/ZeZXgc+as6kMJ+cHyGdJLEHcCo93eKDck
         /bQ5RsoXbLfPvv+jhOIs9rdaUg+cGpzhle45+9xkyBYCLEQZUD/4U3XJBLInIr26laGO
         DMMeEelxTzTOnTSCFwu5qIilzroOjh0jpHpaZ0c+wH/FNKzjwl9F5nwe1AO5/jlXFDH7
         9laCZbWKEqXlTVgdfPOJWPmg+dGSmxQ1gPZiPgi5pWtGXY8LtEewisLy2LzJxY0gHwAr
         XjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189111; x=1704793911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sP9qQ4nWMhVEqh2w5k34a2KqREJgBIKIufbFzw/gkj0=;
        b=cpWUm+Mrd8GW7FY2FZg33GuT1St6KZsGrnYTFJhAY2V54HecHAfJFeqwq8b2rIwkqD
         tZJrEb9S2PfB72UQBUbO5UlfA1MgkJoPwk5EOL/ZS04rPZ9IwmMbtO1vyUp/2TNJEfUw
         RVHF7CPoOILA7aFxhA5O3pNDAeMVMji9ddxWl6hMw4AKmltJXdRnwjrRoFKlAJbJSjgb
         F4R75nEOVKDemQK/p02kQ2e08/SICXr0I63t7awvH/IoxyzzZJPg1S+QKaR/gBJce7nx
         jWIR1PUV4K2cHXtcGiCB5ud6Oz7WyqAZkz/kmK7mVug6jdrDLkq/PCHaB/E/gOVY7rjq
         kjmA==
X-Gm-Message-State: AOJu0YyGErk2wYI6i8s8SSh39iXyY5aikUDnORP9rFXtJnMokbeGm6+6
	dCHvsKDnHGhQkkRyyICP9NzloeN/CUVLxzG95V0xB1Lkfl0=
X-Google-Smtp-Source: AGHT+IEiZwHgqGDzuq+CofvQaRdVDEsDJPXCGOUEkAORhykUWO5dX2Iao98Y4vvHu0kxk7Vf/wPajw==
X-Received: by 2002:a17:907:318c:b0:a27:a80a:917c with SMTP id xe12-20020a170907318c00b00a27a80a917cmr6506165ejb.2.1704189111430;
        Tue, 02 Jan 2024 01:51:51 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 07/13] xen/page_alloc: introduce init_free_page_fields() helper
Date: Tue,  2 Jan 2024 10:51:32 +0100
Message-Id: <20240102095138.17933-8-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new helper to initialize fields that have different uses for
free pages.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- new patch
---
 xen/common/page_alloc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index d874525916..9ee3981bb5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -928,6 +928,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     }
 }
 
+/* Initialise fields which have other uses for free pages. */
+static void init_free_page_fields(struct page_info *pg)
+{
+    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
+    page_set_owner(pg, NULL);
+}
+
 /* Allocate 2^@order contiguous pages. */
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
@@ -1036,10 +1043,7 @@ static struct page_info *alloc_heap_pages(
             accumulate_tlbflush(&need_tlbflush, &pg[i],
                                 &tlbflush_timestamp);
 
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
-
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
@@ -2802,9 +2806,7 @@ static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
          * to PGC_state_inuse.
          */
         pg[i].count_info = PGC_static | PGC_state_inuse;
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
-- 
2.34.1


