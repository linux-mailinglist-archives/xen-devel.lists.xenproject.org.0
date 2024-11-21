Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1AB9D4B55
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841365.1256851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE57E-0003Zf-99; Thu, 21 Nov 2024 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841365.1256851; Thu, 21 Nov 2024 11:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE57E-0003Vp-5x; Thu, 21 Nov 2024 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 841365;
 Thu, 21 Nov 2024 11:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE57C-0003Vj-1i
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:12:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895967f3-a7f9-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:12:46 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso143634766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:12:46 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4152b6dsm68468266b.7.2024.11.21.03.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 03:12:45 -0800 (PST)
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
X-Inumbo-ID: 895967f3-a7f9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg5NTk2N2YzLWE3ZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg3NTY2LjY4ODI1Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732187566; x=1732792366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfW8sK5CwWflaMl6LKuOhOmD5Yp50rt2vxii7w2V5/s=;
        b=LyIzyMUXPNryhXfA9HK5pJeZ9WH62VUaOYi6PzCWVK+2KvlEhKrHcwufWnUwhgnOAp
         xFApZhvcH7ufSD9JrsG+YFBRV7xA7L154XRuNX/ydgv1NKVeWzeO72ALoKDdCFLCAKuS
         +WicH/FkU2iFlnp1WJSJV/e4C9LzfD0sfkshU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732187566; x=1732792366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfW8sK5CwWflaMl6LKuOhOmD5Yp50rt2vxii7w2V5/s=;
        b=D161E69t2SfJnaNHe+4I77XL8GcHVQcmna0vS78qOOz67XBDeLpo1VQSiFKy9kPMwq
         HTcNRCpoyTieUw7AhGjMla7C6mxCiWf6K+ZBawljWndF4M42xREzD522fvZ3/vb3kK9O
         7bqTuoPEFGg+X4dbTzXu4hgx0BT3zyQAxI3qbg9XcJtw9Oj4Qm8su7dD6hsVJv28hTHf
         9KDtAv01VfgmyRQQb+LDyYHtsbINk2/Ao+SCC6T5TPokl0e3+sn+wIDUCjR5w/1D1oH7
         7zacdzfdOgDEaPdRH87g9VFX2CoRqCNg4FVNsUnI8PMvij2WSf6aG0+JlbyRAnLfGyf8
         CUZA==
X-Gm-Message-State: AOJu0Yw/FtfFBjSJRTr1PRNHX5NlEeioOP8xO9mjNXLr5JswKN6m+DFk
	MLJeihe/oFF1qqgSNlEv/J0thZv2PswuJBOG67C8IFNFX9S034X40tNT4PoeLhQm4t74iJErimR
	n
X-Gm-Gg: ASbGncujHJ5qGQ5GoVTzJ+Je0dK76FIRQCV3MszmUkDN7tW6lD4IapgNPvuAN2yhncl
	X32Y0GCYh3GXuFtCkEitekCpY1vQN8KWpcX5xFyGHNzpcOSQWItG8FwIjbttOQNV0hHAVF3qVHT
	FLc1Uqou+eupiJILR4s6x9SoI0lcdoqMmvAMcK0HZCH8aQtRzbUxxYwNzns2v7sPMSoi7/83ad6
	w4ZWSHPvktiQBxYxLkp3H4LDTLzuojbgtGMRgIeTmVWPTBIvWxC/ur7wkY=
X-Google-Smtp-Source: AGHT+IHRF2CXIiAi+N3StihUf8aAGLidqvRRyY5TSCgv/k5EI2l7sqT6fWhj+z6oIsvRZ6wA5qyPkw==
X-Received: by 2002:a17:907:2cc2:b0:a9a:bbcd:e63 with SMTP id a640c23a62f3a-aa4dd54842cmr620018666b.14.1732187565771;
        Thu, 21 Nov 2024 03:12:45 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number of vCPUs
Date: Thu, 21 Nov 2024 12:12:18 +0100
Message-ID: <20241121111218.50984-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The allocation of the paging structures in the per-domain area for mapping the
guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
have.  The maximum number of vCPUs is available at domain creation since commit
4737fa52ce86.

Limiting to the actual number of vCPUs avoids wasting memory for paging
structures that will never be used.  Current logic unconditionally uses 513
pages, one page for the L3, plus 512 L1 pages.  For guests with equal or less
than 16 vCPUs only 2 pages are used (each guest vCPU GDT/LDT can only consume
32 L1 slots).

No functional change intended, all possible domain vCPUs should have the GDT
and LDT paging structures allocated and setup at domain creation, just like
before the change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index d5a8564c1cbe..e861e3ce71d9 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -346,7 +346,7 @@ void pv_domain_destroy(struct domain *d)
     pv_l1tf_domain_destroy(d);
 
     destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
+                              d->max_vcpus << GDT_LDT_VCPU_SHIFT);
 
     XFREE(d->arch.pv.cpuidmasks);
 
@@ -377,7 +377,7 @@ int pv_domain_initialise(struct domain *d)
         goto fail;
 
     rc = create_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                                  GDT_LDT_MBYTES << (20 - PAGE_SHIFT),
+                                  d->max_vcpus << GDT_LDT_VCPU_SHIFT,
                                   NULL, NULL);
     if ( rc )
         goto fail;
-- 
2.46.0


