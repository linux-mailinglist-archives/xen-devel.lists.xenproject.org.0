Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5259D845E0C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674569.1049645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSC-0007sq-KA; Thu, 01 Feb 2024 17:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674569.1049645; Thu, 01 Feb 2024 17:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSC-0007gf-E3; Thu, 01 Feb 2024 17:02:20 +0000
Received: by outflank-mailman (input) for mailman id 674569;
 Thu, 01 Feb 2024 17:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaSA-0006n8-Nk
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:18 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7ed1163-c123-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 18:02:18 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a359e6fde44so123351766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:18 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 cu10-20020a170906ba8a00b00a36a94ecf9dsm1031214ejd.175.2024.02.01.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:02:17 -0800 (PST)
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
X-Inumbo-ID: a7ed1163-c123-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706806937; x=1707411737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrhtNQnEdn9vrYvKxplKdOmWw8AltePzlQHZOnCcYkE=;
        b=TREy726yqQyCNCvxbN4sQq49dv4v/hR85PC4SXyzmDbx1h2mFnLOECrsNCDdiUhhmA
         Ld82CPHRMEHkuQ/KXqx5wHuWO34L8VdvELZYW0kE0uU5eC+zvBcj6O7HEv3RUcfyTen0
         ygEamOCONVXjYDzw4zJVfMpKvC/jhgpXEzVOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806937; x=1707411737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrhtNQnEdn9vrYvKxplKdOmWw8AltePzlQHZOnCcYkE=;
        b=NOdHIKklLmsUQEAdrffdW3Np4z0Z5HI7AW1xc5EDJ4Cotu+Nc3BNl7K4xOL8gxmRK2
         gZtkq7C8N19sVf5PSJjnb88oHGSczinMOQGIj9IffGuJliVhnx16Jh6ATP5LX0adNyzA
         d9rmYZDMc+ao+eCpcGIiFO4N6FYeUw4gcCI/iwbochqGOBKQoIBfRbCUlzGHbKkw6hBE
         rXZVhDxTQhGtSaXgw1VjV1pR+xd6TzT+QuFnBXTJoz7/+NUCN7KkwxfucYk0FhY6asps
         7C8gDHVwW9I6nJnOka95DYwDov6w+qo9SSeRp74Oe0lqLhefqlAQ6i4pVaaAK7dWlJxU
         MQiA==
X-Gm-Message-State: AOJu0YxMKqYGTxHH1nPvzYQQxcwu3tFp3CEmaxX4VSrwQ9voInO55Sc+
	7VXj4NBEd9ENXor97/Jz67XFmxKP9BlApqhM88vfIOPZwAoe6RffUfNH6Tw2h46zk1YKwhGqMHz
	Z
X-Google-Smtp-Source: AGHT+IGc7i6430H4QaIi3+LxQD/GqTuUYou2Jbiu1ErGblVAr8z1YC/aUC4MxNi18CobbC4sV1WzTA==
X-Received: by 2002:a17:906:5f96:b0:a35:b7e6:1c44 with SMTP id a22-20020a1709065f9600b00a35b7e61c44mr4170204eju.75.1706806937437;
        Thu, 01 Feb 2024 09:02:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWf11yDgkYofRYjl5BKyx2LV56+rtBBpdJEdCgo5EHCP2ZvruGsNYEccw5XEHxjhlu/nPxBONNJtNXsvcabLciBZDfjnbZ8t8I6raIVlOXf
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 4/4] iommu/x86: make unity range checking more strict
Date: Thu,  1 Feb 2024 18:01:59 +0100
Message-ID: <20240201170159.66330-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201170159.66330-1-roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently when a unity range overlaps with memory being used as RAM by the
hypervisor the result would be that the IOMMU gets disabled.  However that's
not enough, as even with the IOMMU disabled the device will still access the
affected RAM areas.

Note that IVMD or RMRR ranges being placed over RAM is a firmware bug.

Doing so also allows to simplify the code and use a switch over the reported
memory type(s).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 63d4cb898218..9b977f84582f 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -806,10 +806,14 @@ bool __init iommu_unity_region_ok(mfn_t start, mfn_t end)
 
     for ( addr = start; !mfn_eq(addr, end); mfn_add(addr, 1) )
     {
-        unsigned int type = page_get_ram_type(addr);
-
-        if ( type == RAM_TYPE_UNKNOWN )
+        /*
+         * Any page that's at least partially of type RESERVED, UNUSABLE or
+         * ACPI will be considered by Xen of being all of that type, and hence
+         * the problematic pages are those that are fully holes or RAM.
+         */
+        switch ( page_get_ram_type(addr) )
         {
+        case RAM_TYPE_UNKNOWN:
             if ( e820_add_range(mfn_to_maddr(addr),
                                 mfn_to_maddr(addr) + PAGE_SIZE, E820_RESERVED) )
                 continue;
@@ -817,7 +821,10 @@ bool __init iommu_unity_region_ok(mfn_t start, mfn_t end)
                    "IOMMU: page at %#" PRI_mfn " couldn't be reserved\n",
                    mfn_x(addr));
             return false;
-        }
+
+        case RAM_TYPE_CONVENTIONAL:
+            panic("IOMMU: page at %#" PRI_mfn " overlaps RAM range\n",
+                  mfn_x(addr));
 
         /*
          * Types which aren't RAM are considered good enough.
@@ -825,14 +832,7 @@ bool __init iommu_unity_region_ok(mfn_t start, mfn_t end)
          * force Xen into assuming the whole page as having that type in
          * practice.
          */
-        if ( type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
-                     RAM_TYPE_UNUSABLE) )
-            continue;
-
-        printk(XENLOG_WARNING
-               "IOMMU: page at %#" PRI_mfn " can't be converted\n",
-               mfn_x(addr));
-        return false;
+        }
     }
 
     return true;
-- 
2.43.0


