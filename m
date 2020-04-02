Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D954F19C681
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:53:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK29s-0005fx-Dz; Thu, 02 Apr 2020 15:53:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hi7f=5S=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jK29q-0005fs-9z
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:53:30 +0000
X-Inumbo-ID: 18b3aa10-74fa-11ea-83d8-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18b3aa10-74fa-11ea-83d8-bc764e2007e4;
 Thu, 02 Apr 2020 15:53:29 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id jz1so3395915pjb.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=AVEvemLr4Biqm7wYYR5hPV0RkS9Fxm05rC7rAzhCIwQ=;
 b=ZLl2QTd/xaZzRVjyC9vExivmHH1lBIFoSMe2+9NiNZcGk6mUXIdZJNRBV/J6SbcvAY
 loL72/0S0cUM10GrEyE9QnlGvc3+ooANgqAkR4U8M5mbYVKxx4EC03ttBa4dPc9IKbmK
 l/4GcGtsrdNSy0l2WIK0C1C5W4Awvqb1vFllE+VwjkMX2fINM0f0Pu8alSAEeaYhsn2m
 ylj7GWFxXmZFVkxhox9xYc90Cu2aebndiZaCeuEMIHrFIDYoS748b2ToQhQvHJmWqvta
 64nPrvhJ+2YzNOD5/Xe0Jzb0WDfetkAu7dMwZD8ncrOiJYtommtPQuMj4JdwQTkZaoRs
 yHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=AVEvemLr4Biqm7wYYR5hPV0RkS9Fxm05rC7rAzhCIwQ=;
 b=KMIOMvpQlkOyttgC/PvHm7kRrWOrqM5uC4+B4QGdYoCdndfAh7pkNyEYnjAqluXcox
 syKWW3hfo14TyKuRsAAbj96M8JTwGSUL/y3D9nS1mEth0iHuDF7yMMW1sPNYT8wb1P/m
 3hZY55MOrE97AzCS6I58WMaEUSaQ8hUwwnXEhWctoxpFhyGzrDi/x7r3DLD4dzN6F0ta
 bM+sd5JUAKurePVwnT8ZensGmqrpOzLQ+oZeFpriRHyFbCWNVC78Bsn/uV/X4EH/B+74
 NOq9VLPzEBL6Z+ey3WhyuOArmU8rNCr/2yrhpG+/yXCGuZdJx67J+2RwQCFv7xJ3mUN8
 hz7A==
X-Gm-Message-State: AGi0PuZgIjhhS8merHrC9uaGhJTBvhZQNHnoe8FF1D6nJu/uJyQ3Vm0q
 J8XjGtj62/Fx+yssJWIDjS4=
X-Google-Smtp-Source: APiQypIxcMHBSPBknzSwpX6D0tejjsPsEQ3W6AoctFC+0tKCqkvuEbY+lL4K6hMnc6EYa0gcZhUB9w==
X-Received: by 2002:a17:90a:34e:: with SMTP id 14mr4617074pjf.32.1585842808812; 
 Thu, 02 Apr 2020 08:53:28 -0700 (PDT)
Received: from simran-Inspiron-5558 ([2409:4052:99d:cf8:4926:6e0b:60ca:635c])
 by smtp.gmail.com with ESMTPSA id
 x188sm4075889pfx.198.2020.04.02.08.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 08:53:28 -0700 (PDT)
Date: Thu, 2 Apr 2020 21:23:22 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/x86: Use macro DIV_ROUND_UP
Message-ID: <20200402155322.GA16696@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use the DIV_ROUND_UP macro to replace open-coded divisor calculation
(((n) + (d) - 1) /(d)) to improve readability.

Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
---
 xen/arch/x86/mm.c        | 2 +-
 xen/arch/x86/tboot.c     | 2 +-
 xen/arch/x86/x86_64/mm.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c7617f80e8..a381eac81c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -240,7 +240,7 @@ static void __init init_frametable_chunk(void *start, void *end)
 void __init init_frametable(void)
 {
     unsigned int sidx, eidx, nidx;
-    unsigned int max_idx = (max_pdx + PDX_GROUP_COUNT - 1) / PDX_GROUP_COUNT;
+    unsigned int max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
     struct page_info *end_pg, *top_pg;
 
     BUILD_BUG_ON(XEN_VIRT_END > FRAMETABLE_VIRT_START);
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 102c3cd203..320e06f129 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -310,7 +310,7 @@ static void tboot_gen_frametable_integrity(const uint8_t key[TB_KEY_SIZE],
                                            vmac_t *mac)
 {
     unsigned int sidx, eidx, nidx;
-    unsigned int max_idx = (max_pdx + PDX_GROUP_COUNT - 1)/PDX_GROUP_COUNT;
+    unsigned int max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
     uint8_t nonce[16] = {};
     vmac_ctx_t ctx;
 
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b7ce833ffc..cee836ec37 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -801,7 +801,7 @@ static int extend_frame_table(struct mem_hotadd_info *info)
     spfn = _mfn(info->spfn);
     epfn = _mfn(info->epfn);
 
-    eidx = (mfn_to_pdx(epfn) + PDX_GROUP_COUNT - 1) / PDX_GROUP_COUNT;
+    eidx = DIV_ROUND_UP(mfn_to_pdx(epfn), PDX_GROUP_COUNT);
     nidx = cidx = mfn_to_pdx(spfn)/PDX_GROUP_COUNT;
 
     ASSERT( mfn_to_pdx(epfn) <= (DIRECTMAP_SIZE >> PAGE_SHIFT) &&
-- 
2.17.1


