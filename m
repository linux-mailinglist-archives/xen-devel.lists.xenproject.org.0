Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B665AD5D20
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011972.1390539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAE-0004A1-1s; Wed, 11 Jun 2025 17:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011972.1390539; Wed, 11 Jun 2025 17:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAD-00045y-Sl; Wed, 11 Jun 2025 17:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1011972;
 Wed, 11 Jun 2025 17:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPAB-0002dK-Kl
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b896f9b6-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:59 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450d668c2a1so9006095e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53229e014sm15847938f8f.3.2025.06.11.10.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:58 -0700 (PDT)
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
X-Inumbo-ID: b896f9b6-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662578; x=1750267378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erB+0/PVXEUr1Y3mUBtzWwV6l1V3EbOGOg7XHwfxeDw=;
        b=usWatrAY9T/jVNJI4L1U18ZfEOtP3XTIx6a2dfbWhCXNz5TEXNaR5BvwdJ+oT/J8KS
         DRdFLhMnaXMC0TgTYGWSH1hMj/p5StbpEz6FzCG1ut0dzZkvNUSFA3Vf9VbbXv7b0GYC
         nYgduTmmdqgZTmHA1ci3gfNt7ue2JKCz///tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662578; x=1750267378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erB+0/PVXEUr1Y3mUBtzWwV6l1V3EbOGOg7XHwfxeDw=;
        b=ZyTI1SMr5P/Gw00XXP4GbFjVBsjr3lJTRoRPZx1/sRck377X9uYPJjLTuhanaDngoF
         Bi+ros/RtWkpRpOI0r66ffl/tJJ2UgNT0LzccqSoQlNUuOmuQ94CnbvK1hlZ7wahIyG8
         NnUsi7OYJ49DxuF+Dfdl/fNA6tMhiBYYR7/qtujS45r7TpmOQAS1x851/fP+vWKQPaSE
         pENIqvxy2PNb/jQ2ffzu/iiLOFNmAvA6H5k52KlucLzExElaZn3XGdCgVjAO1Nm+J7gJ
         m3A5A9DWtVc1uBRPoTyM5k42nW3l8RsPd1EJ6iQgRTBtORpzI7oCvQ92e6EV3gGnVYs3
         Cbbw==
X-Gm-Message-State: AOJu0YxH/SEvVRpHN1EcBJCDJeIdWbUNy4vDoHKRo44Zvtt6zWEHIrOU
	BDxg43hxEb4sVBTu7VtKcIxDe6uRPRMuu7sCM6b+cSz8o47Tkx+XVOc4E3yhjExp24y+9/3RF1m
	FuwFW
X-Gm-Gg: ASbGncvO4wVWMwWOmsWOxAcJFn/cWnasHcuMM7KV2TXcGEyqgbbtU3RXa4QBV0fqtKG
	9YYu1xe0qRXTb7eZ2CGe0jF77SYZOn2noSIkqi+tmH7lKaUK16/QRcy3pogN2WMgCT1PPIsTlNe
	GAaBY3k5MF8G14YAnoGI8CRISSkof9r5yRKJRYq8lC4LPxroSAWD799NjtgqTT3TYUtdcS/1g5l
	EYbpLq7EQroLzw4Te5HnEFKGGwAJa3r4aO0n8TDb0OldnGC2nl7RWGUqId8aOXZueS7Lm+pZJ5q
	iU7GJR5KmtSBV32rHZluZyTYj14LuftLf15Jq87vEEhA3Ko8c3L3bc779lWLLt2qZ9p563e0hpY
	IDXwL6ID6eY9Q8JcBfSefQuRD6CNqIivpRpk=
X-Google-Smtp-Source: AGHT+IFOh+vGQIbcfaAJyeyfLZqFKbGVoqo9AOb2DRYEWGmD4FX/+j7PzQL+TQgwZj5BOs8rUzzJWg==
X-Received: by 2002:a05:600c:3484:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4532c2b3123mr2844535e9.14.1749662578442;
        Wed, 11 Jun 2025 10:22:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/8] pdx: introduce translation helpers for offset compression
Date: Wed, 11 Jun 2025 19:16:35 +0200
Message-ID: <20250611171636.5674-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement the helpers to translate from pfns or physical addresses into the
offset compressed index space.  Add a further check in the PDX testing to
ensure conversion resulting from the added functions is bi-directional.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/pdx/test-pdx-offset.c | 10 +++++++++
 xen/common/pdx.c                  | 10 +++++++++
 xen/include/xen/pdx.h             | 35 +++++++++++++++++++++++++------
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/tools/tests/pdx/test-pdx-offset.c b/tools/tests/pdx/test-pdx-offset.c
index 0a561f02d197..a3507c36deb7 100644
--- a/tools/tests/pdx/test-pdx-offset.c
+++ b/tools/tests/pdx/test-pdx-offset.c
@@ -293,6 +293,16 @@ int main(int argc, char **argv)
                     print_ranges(tests[i].ranges);
                     ret_code = EXIT_FAILURE;
                 }
+
+                if ( start != pdx_to_pfn(pfn_to_pdx(start)) ||
+                     end - 1 != pdx_to_pfn(pfn_to_pdx(end - 1)) )
+                {
+                    printf(
+    "PDX %s compression invalid, conversion of %#lx or %#lx is not bidirectional\n",
+                           use_slow ? "slow" : "fast", start, end - 1);
+                    print_ranges(tests[i].ranges);
+                    ret_code = EXIT_FAILURE;
+                }
             }
         }
     }
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index f2cf60bbc3f8..feabdcded804 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -46,6 +46,8 @@ bool __mfn_valid(unsigned long mfn)
 
 #ifdef CONFIG_PDX_MASK_COMPRESSION
     invalid |= mfn & pfn_hole_mask;
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
+    invalid |= (mfn % pdx_offset) >= pdx_size;
 #endif
 
     if ( unlikely(evaluate_nospec(invalid)) )
@@ -314,6 +316,9 @@ void __init pfn_pdx_compression_reset(void)
 unsigned long __ro_after_init pdx_offset = ~0UL;
 unsigned long __ro_after_init pdx_size = ~0UL;
 
+paddr_t __ro_after_init pdx_paddr_offset = ~0UL;
+paddr_t __ro_after_init pdx_paddr_size = ~0UL;
+
 static unsigned long __initdata top_pfn;
 
 bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
@@ -513,6 +518,9 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
     printk(XENLOG_INFO "PFN compression using offset %#lx size %#lx (%lu%%)\n",
            pdx_offset, pdx_size, ((pdx_offset - pdx_size) * 100) / pdx_offset);
 
+    pdx_paddr_offset = (paddr_t)pdx_offset << PAGE_SHIFT;
+    pdx_paddr_size = (paddr_t)pdx_size << PAGE_SHIFT;
+
     return true;
 }
 #endif /* __XEN__ */
@@ -520,7 +528,9 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
 void __init pfn_pdx_compression_reset(void)
 {
     pdx_size = ~0UL;
+    pdx_paddr_size = ~(paddr_t)0;
     pdx_offset = ~0UL;
+    pdx_paddr_offset = ~(paddr_t)0;
     nr = 0;
     top_pfn = 0;
 }
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 88f446f4ddd9..5f9e5bc7ab62 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -217,14 +217,37 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
 
 extern unsigned long pdx_offset;
 extern unsigned long pdx_size;
+extern paddr_t pdx_paddr_offset;
+extern paddr_t pdx_paddr_size;
 
-/* pdx<->pfn == identity */
-#define pdx_to_pfn(x) (x)
-#define pfn_to_pdx(x) (x)
+void pdx_region_offset(unsigned long base, unsigned long size);
+bool pfn_pdx_offset_setup(void);
 
-/* directmap is indexed by maddr */
-#define maddr_to_directmapoff(x) (x)
-#define directmapoff_to_maddr(x) (x)
+static inline unsigned long pdx_to_pfn(unsigned long pdx)
+{
+    OPTIMIZE_PDX((pdx % pdx_size) + ((pdx / pdx_size) * pdx_offset),
+                 pdx);
+}
+
+static inline unsigned long pfn_to_pdx(unsigned long pfn)
+{
+    OPTIMIZE_PDX((pfn % pdx_offset) + ((pfn / pdx_offset) * pdx_size),
+                 pfn);
+}
+
+static inline unsigned long maddr_to_directmapoff(paddr_t ma)
+{
+    OPTIMIZE_PDX((ma % pdx_paddr_offset) +
+                 ((ma / pdx_paddr_offset) * pdx_paddr_size),
+                 ma);
+}
+
+static inline paddr_t directmapoff_to_maddr(unsigned long off)
+{
+    OPTIMIZE_PDX((off % pdx_paddr_size) +
+                 ((off / pdx_paddr_size) * pdx_paddr_offset),
+                 off);
+}
 
 #endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
-- 
2.49.0


