Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B92A5F9FE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912510.1318781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY0-0000Iv-Jx; Thu, 13 Mar 2025 15:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912510.1318781; Thu, 13 Mar 2025 15:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY0-0000EF-CP; Thu, 13 Mar 2025 15:32:36 +0000
Received: by outflank-mailman (input) for mailman id 912510;
 Thu, 13 Mar 2025 15:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXy-0007tP-Qe
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:34 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626fdbc8-0020-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:32:34 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e033c2f106so1590956a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e8169b1602sm847443a12.42.2025.03.13.08.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:32 -0700 (PDT)
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
X-Inumbo-ID: 626fdbc8-0020-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879953; x=1742484753; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJiaUgbH1bb2LG+KmsUrFx4m8JkQ4L5Ijprhg1pyXDY=;
        b=R/xRJXTh+F+GDoVYqG9r3flzV5OR5bQNPxZ5DqC6HHabrrqlzGzcipVVy2W+a8uhr+
         B0kvCPyJ6Okq61scwedJnRe/Tc5qoblvNAS8R+tkG2osC1hnDrJCQ4zIw/rCUzizFTru
         ziohhKlNQMT8vREWuwUb6DMXRjT3Rs+234EEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879953; x=1742484753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJiaUgbH1bb2LG+KmsUrFx4m8JkQ4L5Ijprhg1pyXDY=;
        b=NdLpCNd6zV9X3vqALYjOQgOtmv8x8b1NqhEIuKMJGTPpMuaXcwq9iNH/PRTdXhv6G4
         VDaqDRhnlQFjXF0rIw0Wlzls4olYPmv1XPTMp69Fol3H+L8zI84JJWi9h5dEjDUtyqRj
         vCSOdERFBELYzr24eWp9/v7H2GNa403ORt72qjaGlYfiaeERVbGgZCcNaSzt37ce8QNA
         sBaxYw07u3Egk2OptI+NosYgx6ixAKmR930mTWhSTftcNB5dwHih+QCubrsiO7CIegss
         AvUuWcGgj52bhOmbHFfo/MWOyerUSnwwwiWnzKJkt6cSr/hl3LCHcDrZd7ALrFnwuiTk
         /dAg==
X-Gm-Message-State: AOJu0YxTOyRIKTRdUKl0oWEVoOSAdhutzYe/gmqyhhV0D7cY7O25dutT
	VEgzWx5fBlwPbWB1FdlJdAJ3CtVTPlT9dn/LVGp9j0VIpRJMOcM8wUXww4oIW1Fio6AulDCvJlH
	s
X-Gm-Gg: ASbGncvC9WScYKGEeTDCGV3LINzIhgQEftcrUQm+qJR7abX8b2HWuvsRg9Q1YFb4Xw0
	ExwNCbsqubFCC6sOd5ZVGT6cvQQjlReAgA7iPann18mvt2YLH7kLvoanoMDNQ4HVhJDJe/SBywc
	A80nVEnzKjXOuQc29KPPcoKI2oohRil7NOcwaBamD1arxb1o70fu6pDzOiR6pfj8iQ0VnPwCxb9
	D+v36LXJYL3NHXUbLyGW27IIr4RysX3Wc4bH0So3ureGuU9y+EhI24e7TOaGP0vrHP7CqXH1TGr
	QrnM80trwP4BqXUDlv56IggfGUGwnyoCWR4CHHzD068m6dP7kA==
X-Google-Smtp-Source: AGHT+IHze12pCIkh0Nd32znahSJbySON/JnsBZNJX5iscNiB4BYXAkwnogHpvwK6rlm7cKVbILuhbg==
X-Received: by 2002:a05:6402:518a:b0:5e5:b572:a6d7 with SMTP id 4fb4d7f45d1cf-5e5e229bc4cmr61406221a12.6.1741879953150;
        Thu, 13 Mar 2025 08:32:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/7] x86/ioremap: prevent additions against the NULL pointer
Date: Thu, 13 Mar 2025 16:30:27 +0100
Message-ID: <20250313153029.93347-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was reported by clang UBSAN as:

UBSAN: Undefined behaviour in arch/x86/mm.c:6297:40
applying zero offset to null pointer
[...]
Xen call trace:
    [<ffff82d040303662>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
    [<ffff82d040304aa3>] F __ubsan_handle_pointer_overflow+0xcb/0x100
    [<ffff82d0406ebbc0>] F ioremap_wc+0xc8/0xe0
    [<ffff82d0406c3728>] F video_init+0xd0/0x180
    [<ffff82d0406ab6f5>] F console_init_preirq+0x3d/0x220
    [<ffff82d0406f1876>] F __start_xen+0x68e/0x5530
    [<ffff82d04020482e>] F __high_start+0x8e/0x90

Fix bt_ioremap() and ioremap{,_wc}() to not add the offset if the returned
pointer from __vmap() is NULL.

Fixes: d0d4635d034f ('implement vmap()')
Fixes: f390941a92f1 ('x86/DMI: fix table mapping when one lives above 1Mb')
Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/dmi_scan.c | 7 +++++--
 xen/arch/x86/mm.c       | 6 ++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 2fcc485295eb..a05492037519 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -112,6 +112,7 @@ static const void *__init bt_ioremap(paddr_t addr, unsigned int len)
 {
     mfn_t mfn = _mfn(PFN_DOWN(addr));
     unsigned int offs = PAGE_OFFSET(addr);
+    void *va;
 
     if ( addr + len <= MB(1) )
         return __va(addr);
@@ -119,8 +120,10 @@ static const void *__init bt_ioremap(paddr_t addr, unsigned int len)
     if ( system_state < SYS_STATE_boot )
         return __acpi_map_table(addr, len);
 
-    return __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
-                  VMAP_DEFAULT) + offs;
+    va = __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
+	        VMAP_DEFAULT);
+
+    return va ? va + offs : NULL;
 }
 
 static void __init bt_iounmap(const void *ptr, unsigned int len)
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bfdc8fb01949..03b8319f7a9d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6277,7 +6277,9 @@ void __iomem *ioremap(paddr_t pa, size_t len)
         unsigned int offs = pa & (PAGE_SIZE - 1);
         unsigned int nr = PFN_UP(offs + len);
 
-        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT) + offs;
+        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
+        if ( va )
+            va += offs;
     }
 
     return (void __force __iomem *)va;
@@ -6294,7 +6296,7 @@ void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
 
     va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
 
-    return (void __force __iomem *)(va + offs);
+    return (void __force __iomem *)(va ? va + offs : NULL);
 }
 
 int create_perdomain_mapping(struct domain *d, unsigned long va,
-- 
2.48.1


