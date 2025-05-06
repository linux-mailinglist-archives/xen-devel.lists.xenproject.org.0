Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C809AABD58
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976750.1363925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlN-0004zU-5W; Tue, 06 May 2025 08:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976750.1363925; Tue, 06 May 2025 08:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlN-0004xw-28; Tue, 06 May 2025 08:34:53 +0000
Received: by outflank-mailman (input) for mailman id 976750;
 Tue, 06 May 2025 08:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlL-00041m-Ox
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9972bec-2a54-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 10:34:50 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so6478568f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:50 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae32fesm12669233f8f.22.2025.05.06.01.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:49 -0700 (PDT)
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
X-Inumbo-ID: f9972bec-2a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520489; x=1747125289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5UfBLcVStfB7Hed8NA5DfE3BRvsSJIoJFqhzuS6DZw=;
        b=TikPXyvOnU2anYiYC+OXdBZxH2AQ3ySb/erSnJdwqkyXrzVk2DASMhpfLD9RI78l5j
         ju/DsiLPqtCd0Aoz7QwpmyedkUsCfiC5qFGxXesV+qXxCSMu1nf8Fxe/B/Rs1emiBV+q
         gIspOu3t59yY1j3igLFGwSdv6tkzWIL6YpPaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520489; x=1747125289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5UfBLcVStfB7Hed8NA5DfE3BRvsSJIoJFqhzuS6DZw=;
        b=xUSCApvz1mT0UygWLwa/kA1V1+ftHrN9M3vtKRAKBxxBfb3JECk97YF6T1oJfDUyyT
         PkYKjMNS9paNET/x5wTkgcyNucqT3b558VBuZHq0SB4b8SkTA+QyfZhzeklcdrAmQ6wG
         nsu8P9zM3CY02dG/nZsnQRkN2SciqUaplLL7voGN5VSxmFk3Qf0MCrIX0HgJQTrpyJpS
         RNTyJDXLDlmtMWtv1iEhaT0am1VjmoHSMZGTDs+SiDb2TDfUgRX/GOdDhYT/1PeOeXwF
         +jhfLj7KdpLpDlnDb1Rd6hkMYGIZ6W9fDOEivQB1XdSUJp0Zr60jjQkhkAE6jl2pg5GQ
         UcGw==
X-Gm-Message-State: AOJu0YyVP2HFpPBFVIbqprNdg9XMNBBsZ1pX5P2MmghIznujQk8pFFCa
	2srgh9FrvpPqWBDf4wjTKlbVqnPzhWqn33/EPfC1O5UbUZbdFCWoHgimT8T0R1z9B4dD2JohxFP
	K
X-Gm-Gg: ASbGnctss8B6cNv1Xjzt9m5cnoD5mIc2fAmpV9yxKq7n8rZwBqP5HCbuF9df9yFf0Pi
	XQRLCPDbFn2V8aR8qIC8RKGsTX3uzixdwIFczCKcN+NT72Ay6RTeTccbcfPZe/vjeFLDS1u9SjQ
	WhFrqm9ev1wuYo2sauzaWqAqHfBazDACtxub6tJPrw3xwX6gMHejjlRUgFBhNWZe0rN5PVBmfZ+
	tQFHPODxr0moWu8ae65XFDSZY6Rag/yd1LZf5HFgWtF3WC9Id3GAuIPz21d5k6DTAanUtMQWSF1
	qJM+evdxP3mnTfsMfXg6j5TJeYqTCOmF0Vb0O7t2STP9sHmegB0kUL3h
X-Google-Smtp-Source: AGHT+IG8SbqAp820tgfep77WqAq8u/7HTxpv/gmNciMOaCRPklO3tPbEepKkjQU+MEYnB+mrs5NwOg==
X-Received: by 2002:a05:6000:2a3:b0:3a0:85ad:5ed9 with SMTP id ffacd0b85a97d-3a09fd7a183mr7019642f8f.4.1746520489409;
        Tue, 06 May 2025 01:34:49 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/9] x86/mtrr: use memory_type_changed() in hvm_set_mem_pinned_cacheattr()
Date: Tue,  6 May 2025 10:31:44 +0200
Message-ID: <20250506083148.34963-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic partially open-codes memory_type_changed(), but doesn't
check whether the type change or the cache flush is actually needed.
Instead switch to using memory_type_changed(), at possibly a higher expense
cost of not exclusively issuing cache flushes when limiting cacheability.

However using memory_type_changed() has the benefit of limiting
recalculations and cache flushes to strictly only when it's meaningful due
to the guest configuration, like having devices or IO regions assigned.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 797f2ae7fd3a..b88e81eb44b1 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -605,22 +605,8 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
 
                 type = range->type;
                 call_rcu(&range->rcu, free_pinned_cacheattr_entry);
-                p2m_memory_type_changed(d);
-                switch ( type )
-                {
-                case X86_MT_UCM:
-                    /*
-                     * For EPT we can also avoid the flush in this case;
-                     * see epte_get_entry_emt().
-                     */
-                    if ( hap_enabled(d) && cpu_has_vmx )
-                case X86_MT_UC:
-                        break;
-                    /* fall through */
-                default:
-                    flush_all(FLUSH_CACHE);
-                    break;
-                }
+                memory_type_changed(d);
+
                 return 0;
             }
         domain_unlock(d);
@@ -682,9 +668,7 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
 
     xfree(newr);
 
-    p2m_memory_type_changed(d);
-    if ( type != X86_MT_WB )
-        flush_all(FLUSH_CACHE);
+    memory_type_changed(d);
 
     return rc;
 }
-- 
2.48.1


