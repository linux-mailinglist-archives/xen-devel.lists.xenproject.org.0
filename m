Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080258B5E1F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714284.1115454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1THe-0007O3-Qg; Mon, 29 Apr 2024 15:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714284.1115454; Mon, 29 Apr 2024 15:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1THe-0007M2-O6; Mon, 29 Apr 2024 15:51:14 +0000
Received: by outflank-mailman (input) for mailman id 714284;
 Mon, 29 Apr 2024 15:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1THd-0007Lu-AZ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:51:13 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b24e76f-0640-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:51:08 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3c84bb69c6fso2476638b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:51:08 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 bz4-20020ad44c04000000b006a067efb28fsm9221277qvb.43.2024.04.29.08.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:51:07 -0700 (PDT)
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
X-Inumbo-ID: 4b24e76f-0640-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714405867; x=1715010667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ed9b0C/5Kj3ZHFxbEvye8lhJMXnRT844TUGU67xG3Zg=;
        b=YBF8LN7kbrvW7iFi7bpB0STnmHexPLPIHlfC6ubHkIKUJqaNXzWsNj0rtvug3uUDBi
         iyJZBoSd+PgM/Wnh21IxTbb8JKK2dbAnxk5vZI1ZJxqSVVA4fOFyLLYTgCJYht+m4+2f
         sOWiFjCHEVGkuP3ikFmrpvKuCJFswXnkpNksQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714405867; x=1715010667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ed9b0C/5Kj3ZHFxbEvye8lhJMXnRT844TUGU67xG3Zg=;
        b=NAhjH58UXXKDk7gXUcSUXjSBRq+6hWX5++qtetrfU4ABTOv1KXDPbdR1+0ytURMzRZ
         kFpyj+szaAOyyNDAn/l8/YQdiIe7XOAQN+PrnSVC7JSW3/biqse+9LP4IwPcJxrQpDr+
         lnxh1c5xJnVOY/QnRGPdrpocuJH0QCzi2nvD6aymHcCHC6U+4bFeP9LfjCqx6yFmnSby
         9/d0Bc3yVPFZI3gL03jwgVZhDDdUcMBzRLwVLdO9Q8Cb3sq0u0X1lJOnr1bx/QxWwq+r
         KTrYbwcWkBglZHAaIaBU7kVcR3Piwr5VbEXb3G0kcWTpWL1OGUIZm7y7uRr49UWmy4td
         wuTA==
X-Forwarded-Encrypted: i=1; AJvYcCWYa8a/laTbJFLK2o21gdW9b8gIsUx0+0el9sxsbbSYrWhGd32hdYC8V1HGeh1cmtOCVFUT6gIvR5PiLxAYlyFST8yRmbAMV95wbACszZs=
X-Gm-Message-State: AOJu0YxZw4dt9wdbkJB5F54gv1uRwAzjv5n0Wrt658DbNK0LLn/XOE8b
	peZKx+nE15YuYNAz/KuZF4a2E5Xrz3zwHXW2Iez2lyrugyyvuQ8FcTBvcdqXYLU=
X-Google-Smtp-Source: AGHT+IHivBVkXz7CXEUnqa3U7gqZFVhDdfCDt22I/t+pgSq1wOaDjqNoi5HvY/E/+iUDYuSA4jJq8g==
X-Received: by 2002:a05:6808:f86:b0:3c7:ef1:483e with SMTP id o6-20020a0568080f8600b003c70ef1483emr251037oiw.39.1714405867438;
        Mon, 29 Apr 2024 08:51:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] xen/x86: add extra pages to unpopulated-alloc if available
Date: Mon, 29 Apr 2024 17:50:53 +0200
Message-ID: <20240429155053.72509-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 262fc47ac174 ('xen/balloon: don't use PV mode extra memory for zone
device allocations') removed the addition of the extra memory ranges to the
unpopulated range allocator, using those only for the balloon driver.

This forces the unpopulated allocator to attach hotplug ranges even when spare
memory (as part of the extra memory ranges) is available.  Furthermore, on PVH
domains it defeats the purpose of commit 38620fc4e893 ('x86/xen: attempt to
inflate the memory balloon on PVH'), as extra memory ranges would only be
used to map foreign memory if the kernel is built without XEN_UNPOPULATED_ALLOC
support.

Fix this by adding a helpers that adds the extra memory ranges to the list of
unpopulated pages, and zeroes the ranges so they are not also consumed by the
balloon driver.

This should have been part of 38620fc4e893, hence the fixes tag.

Note the current logic relies on unpopulated_init() (and hence
arch_xen_unpopulated_init()) always being called ahead of balloon_init(), so
that the extra memory regions are consumed by arch_xen_unpopulated_init().

Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's a lot of duplication between the unpopulated allocator and the balloon
driver.  I feel like the balloon driver should request any extra memory it
needs to the unpopulated allocator, so that the current helpers provided by the
XEN_BALLOON_MEMORY_HOTPLUG option could be replaced with wrappers around the
unpopulated handlers.

However this is much more work than strictly required here, and won't be
suitable for backport IMO.  Hence the more contained fix presented in this
patch.
---
 arch/x86/xen/enlighten.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index a01ca255b0c6..b88722dfc4f8 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -382,3 +382,36 @@ void __init xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns)
 
 	memblock_reserve(PFN_PHYS(start_pfn), PFN_PHYS(n_pfns));
 }
+
+#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
+int __init arch_xen_unpopulated_init(struct resource **res)
+{
+	unsigned int i;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* Must be set strictly before calling xen_free_unpopulated_pages(). */
+	*res = &iomem_resource;
+
+	/*
+	 * Initialize with pages from the extra memory regions (see
+	 * arch/x86/xen/setup.c).
+	 */
+	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
+		unsigned int j;
+
+		for (j = 0; j < xen_extra_mem[i].n_pfns; j++) {
+			struct page *pg =
+				pfn_to_page(xen_extra_mem[i].start_pfn + j);
+
+			xen_free_unpopulated_pages(1, &pg);
+		}
+
+		/* Zero so region is not also added to the balloon driver. */
+		xen_extra_mem[i].n_pfns = 0;
+	}
+
+	return 0;
+}
+#endif
-- 
2.44.0


