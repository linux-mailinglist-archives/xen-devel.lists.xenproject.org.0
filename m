Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WECEJIOQp2lqiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B31F9B58
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245074.1544453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPg-0006d0-5J; Wed, 04 Mar 2026 01:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245074.1544453; Wed, 04 Mar 2026 01:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPg-0006ai-0v; Wed, 04 Mar 2026 01:52:36 +0000
Received: by outflank-mailman (input) for mailman id 1245074;
 Wed, 04 Mar 2026 01:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPe-0006Zx-QV
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:34 +0000
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [2607:f8b0:4864:20::a31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8e1000-176c-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 02:52:32 +0100 (CET)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-56a94923c0aso2075402e0c.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:32 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56adfad07f5sm2726919e0c.10.2026.03.03.17.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:29 -0800 (PST)
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
X-Inumbo-ID: ce8e1000-176c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589151; x=1773193951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0UYcKwpR4k449Oah1OUraSH63dKX72hrhhrlbQ1drM=;
        b=kiWJ6KCmTQu5frxZQkpJaNaIm7o+k+OMHly41K58/K2HWUtBNFu+MrqgeIHz5iq7uY
         RucuE9palIbk7iHreLeSTlZYMDDsgqmUCb051qmcRjwinuNGqm3Hh0QhQxLK0Dza6qmN
         1fu8fyWymUnu86tm0d8NVJnmiiyDP1i2OBf9sY5PSbH919i6ni0bGGCBEPCUino1vGZf
         duXaqwjXi2EDaqJan3XCIFQqsX/d99RroEbLNtnlvWtBbV5PECpjjD4rVyeOKbPsHsP6
         0Bix8RvTpR6swKf8eRd+1cpUmQGEVoH1mtOfLtPy1kTKOArL54HNfLCrudTfWHLy73vE
         h+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589151; x=1773193951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N0UYcKwpR4k449Oah1OUraSH63dKX72hrhhrlbQ1drM=;
        b=Lhb+WXleCDgVJYxh+pzRXa0GS+Ms4cImq6oLOS5vnMwBxnrj4JqeKxAIskssYRWEZL
         nnTL/HrBS5lVmJCo7JzkZypYGP9W/UgPIf/6L6zkDhaS+uALc3cebcp29koV2sxBkcPF
         lWeC82rbPfLBTCq3nt/+BzjuzvSTVm370fNdROoavFMFCjblXNQxRDXb2ONVs0myyjhL
         EdmnxYcX6m+d145vtUJjAoSSNYDlqs+w4L2ILkw9Q+mFXB1YTA0omMy0zKTwUEGvCsXg
         BDrqEcVGJKz+FomTzy8xw2mCVPVywUpR1HAzxt17QzMN5q1u6Pyn7ojgQD6VA1WnA+As
         ZBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEqpOVu4vEbA4iNDcd3QNnvvaSH3TDAkib6pMQ8Y3HkTZImXyv+RY2BA6HuaM6fT4U/pQoN+DqbgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVmGOzZQ1M6FQM8TERPGMWy3SeBfVEbsRRmt5kAcZ4hyaGxfr/
	fjvRU1RBn/2vWVOtGXdNW632h3Dgqtp/l1+cbINZ+adf+4kKBQ2HTpn6rbvRcw9U
X-Gm-Gg: ATEYQzzYKXsvwy0/CSXqF7bIGgM+yi77xUXuBXFYaElNvfCmaBXXZxZFjy+Xx17sz4o
	rBYBt7sQXWfrMn2VmxqTxYJHr/iTg0i50AHIwICHsXLFgA8ZLZ8V4gxLFOn1HheDja06chkkLWQ
	WD/qQzisofSzdkl0TIqASI/jLAh9K96tjyRpRjW2t4+avHJ3lTcb6l+g7QHwdqE2wcCy3RbeAiJ
	D6yckUVrqp1Vl/EeCn6ThNMRiSOdZR7YLzBJQyq1IrlIDvz/cgTZI8FOi1vHE+b1fBD89JYPgM1
	NHyFoZHVyWSPsrz+CXLlJyX3fXuQGp4xkfH76i4BsnkCaVxdjDIZaEAMwz/LhYjdOjP+xOtWn78
	LPJh6Z9tUvc8EX0zVRYAApf8hcS9Yqp+enoBXqaFNmjLpxnC9oylrqCErKXPHJQsWmf2K5mHZjG
	NymRRnU5YG8YYfXNKWaIN6aAVH/t/Um5LITa2Rt6nYMxInlqnUUOtrrflXuQ==
X-Received: by 2002:a05:6122:4b83:b0:566:453e:37ae with SMTP id 71dfb90a1353d-56ae778ca3emr237936e0c.13.1772589150849;
        Tue, 03 Mar 2026 17:52:30 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 2/5] xen: mapcache: Add function to check if the mapcache is enabled
Date: Wed,  4 Mar 2026 02:52:18 +0100
Message-ID: <20260304015222.979224-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304015222.979224-1-edgar.iglesias@gmail.com>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8B6B31F9B58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,xen.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:paul@xen.org,m:edgar.iglesias@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add function to check if the mapcache is enabled.
No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c         | 6 ++++++
 hw/xen/xen_stubs.c            | 5 +++++
 include/system/xen-mapcache.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 517e5171b7..a3c162cd4c 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -80,6 +80,12 @@ static MapCache *mapcache_grants_ro;
 static MapCache *mapcache_grants_rw;
 static xengnttab_handle *xen_region_gnttabdev;
 
+bool xen_map_cache_enabled(void)
+{
+    /* Map cache enabled implies xen_enabled().  */
+    return xen_enabled() && mapcache;
+}
+
 static inline void mapcache_lock(MapCache *mc)
 {
     qemu_mutex_lock(&mc->lock);
diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
index 5e565df392..a39efb5062 100644
--- a/hw/xen/xen_stubs.c
+++ b/hw/xen/xen_stubs.c
@@ -29,6 +29,11 @@ bool xen_mr_is_memory(MemoryRegion *mr)
     g_assert_not_reached();
 }
 
+bool xen_map_cache_enabled(void)
+{
+    return false;
+}
+
 void xen_invalidate_map_cache_entry(uint8_t *buffer)
 {
     g_assert_not_reached();
diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
index fa2cff38d1..c46190dd0c 100644
--- a/include/system/xen-mapcache.h
+++ b/include/system/xen-mapcache.h
@@ -13,6 +13,7 @@
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
+bool xen_map_cache_enabled(void);
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
 uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
-- 
2.43.0


