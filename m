Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE7JHVGqd2kZkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F28BC4F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213828.1524267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmg-0004Ir-TT; Mon, 26 Jan 2026 17:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213828.1524267; Mon, 26 Jan 2026 17:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmg-0004Hw-Pd; Mon, 26 Jan 2026 17:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1213828;
 Mon, 26 Jan 2026 17:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQme-0004HW-Uq
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f91711f2-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:51 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so70423015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:51 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:49 -0800 (PST)
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
X-Inumbo-ID: f91711f2-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450030; x=1770054830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xq1gxDlmDZY+78ggsqSHcLd3bC7dQoTKGaHnAMx1Ws=;
        b=PfisyyokdKc3ZaO2tC/0omKdYFa2G0kjAUIgx1c76VumZt1OxLX/OlOJiqmIS+QFbb
         6GuJvf3NSkaLz8kJXkY1JJOq7+qGing23xT4/8X8dKeBopp1LkqSwS/XJwctE0QcjXDj
         gKa4I4Rge1582jpjC6VEywT6bqgxnW6zYjS2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450030; x=1770054830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0xq1gxDlmDZY+78ggsqSHcLd3bC7dQoTKGaHnAMx1Ws=;
        b=CDe30j+cAJ5ZhM9h/AwnmafSbCHPKDuyhW7LkF8+qSk25LMlGxwSdqxWpEK83TdNDu
         scpC5YMXYOmLIzns550sE0VRiiqqPeq9QQuZusxqZ0ciH5kxtWDznHjAB+VTUoNYxep3
         KCPbEaA5QJ7UaQLdT+m/l1hZkAs91MehcGE1duUjwFijknjlYGgZCqkKWHFxTitw0Fdn
         kedq3itj7adE3NaocxfwIfhlocnmTvN76aIpqzaPSS5HA/M7BhTg+Q0cm3QzONocL86s
         6JhmMeUT89DLqr6R6MOzOtuliGxbmTMymRYSbjV7o0rFKwnpjJTFJL3n69YREbkUGmg9
         DAAw==
X-Gm-Message-State: AOJu0YwtwcGsQwBf2IQyAesMrFxcKt1g+OP+M1HTJq8o5nUNZxS6Sx/m
	My2VoFEFSGLXvkbSKr7gFbPcgBjImNL8+of170bdvKvJUXsloYWUhU2ukgsgMaaTMWtCY5vzE9o
	ccgCF
X-Gm-Gg: AZuq6aJoEWn49qyku+sHuOOok/XvSp+XzSvIHYWZ58Z6aXLIwQnChlYnrc6pYs6kfDM
	2Np6sy4WT+lHGYOGNYzjIlMgQA30FEzlSTNRDI1rADQ/By13KxiP7F5inihMeydnA8daf5YKSJz
	SB5bW+4BSr0FD7Ck448BeruZKHaUxDcvb0muL6AxQ93UOjqaRdX3oo9ztrf3HyG32pxikH2ACcf
	uLkWd/bsigpUxTOUktkHJhsRR8GWyT+IRST/Q28ROnKJ5j5120qkhpkz1/YelvAZytX0tw7b2eV
	EkolpHzPs9r0Y2XKjpbsWAfp1jNK6q8yGE9DxgshsZjDm5xRNU0h1wBVWUhIMmpZ0TbfG6UJCKo
	Y3/0r1hlqWQM3ji1QOwL0ktK2cHYA5XMPZpbGC9cwPIOCjC55zq8I8sSXn4cT4yUYGGj+ehq/Z8
	kVkNIgwb35tTLSUzSdkaPbpo/DiW3WtJyC6j5o3afy+GgxXrQdimAeTsMDakmgjQ==
X-Received: by 2002:a05:600c:1993:b0:47e:e076:c7a2 with SMTP id 5b1f17b1804b1-4805ce4dd37mr88984935e9.15.1769450029713;
        Mon, 26 Jan 2026 09:53:49 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 01/16] x86/cpu: Fix boot time cache flushing
Date: Mon, 26 Jan 2026 17:53:30 +0000
Message-Id: <20260126175345.2078371-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1A5F28BC4F
X-Rspamd-Action: no action

All 64-bit CPUs have CLFLUSH.  AMD introduced it in the K8, Intel in the P4
Willamette core prior to 64-bit support, and VIA/Centaur in the Isaiah.
Furthermore, the reported cacheline size is 64 on all CPUs to date.

Arguably changeset 19435c10abf7 ("x86: consolidate/enhance TLB flushing
interface", 2007) should have initialised c->x86_clflush_size earlier, but
even at the time of changeset 3330013e6739 ("VT-d / x86: re-arrange cache
syncing", 2022), early_cpu_init() had CLFLUSH-parsing logic but simply failed
to record the size.

By removing get_cache_line_size() and assuming 16 bytes, the practical
consequence for early IOMMU initialisation of SandyBridge era systems is to
flush every cacheline 4 times (a pipeline stall too, as those CPUs could only
have one flush in flight at a single time).

Record c->x86_clflush_size in early_cpu_init(), and panic() if CLFLUSH isn't
found.  Drop the redundant initialisation of c->x86_cache_alignment.

Remove the fallback to 16 bytes in cache_{flush,writeback}(), opting instead
for an ASSERT() to confirm that the logic hasn't been re-arranged too early.

Fixes: 3330013e6739 ("VT-d / x86: re-arrange cache syncing")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c |  7 ++++---
 xen/arch/x86/flushtlb.c   | 19 +++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ebe2baf8b98a..f8c80db6eb1d 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -319,8 +319,6 @@ void __init early_cpu_init(bool verbose)
 	uint64_t val;
 	u32 eax, ebx, ecx, edx;
 
-	c->x86_cache_alignment = 32;
-
 	/* Get vendor name */
 	cpuid(0x00000000, &c->cpuid_level, &ebx, &ecx, &edx);
 	*(u32 *)&c->x86_vendor_id[0] = ebx;
@@ -352,6 +350,7 @@ void __init early_cpu_init(bool verbose)
 	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
 		unsigned int size = ((ebx >> 8) & 0xff) * 8;
 
+		c->x86_clflush_size = size;
 		c->x86_cache_alignment = size;
 
 		/*
@@ -380,7 +379,9 @@ void __init early_cpu_init(bool verbose)
 		}
 		else
 			setup_clear_cpu_cap(X86_FEATURE_CLZERO);
-	}
+	} else
+		panic("CLFLUSH information not available\n");
+
 	/* Leaf 0x1 capabilities filled in early for Xen. */
 	c->x86_capability[FEATURESET_1d] = edx;
 	c->x86_capability[FEATURESET_1c] = ecx;
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 23721bb52c90..1f8877dcab23 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -234,8 +234,7 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
 
         if ( (!(flags & (FLUSH_TLB|FLUSH_TLB_GLOBAL)) ||
               (flags & FLUSH_VA_VALID)) &&
-             c->x86_clflush_size && c->x86_cache_size && sz &&
-             ((sz >> 10) < c->x86_cache_size) )
+             c->x86_cache_size && sz && ((sz >> 10) < c->x86_cache_size) )
         {
             if ( flags & FLUSH_CACHE_EVICT )
                 cache_flush(va, sz);
@@ -264,13 +263,11 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
  */
 void cache_flush(const void *addr, unsigned int size)
 {
-    /*
-     * This function may be called before current_cpu_data is established.
-     * Hence a fallback is needed to prevent the loop below becoming infinite.
-     */
-    unsigned int clflush_size = current_cpu_data.x86_clflush_size ?: 16;
+    unsigned int clflush_size = current_cpu_data.x86_clflush_size;
     const void *end = addr + size;
 
+    ASSERT(clflush_size);
+
     alternative("", "mfence", X86_BUG_CLFLUSH_MFENCE);
 
     addr -= (unsigned long)addr & (clflush_size - 1);
@@ -301,11 +298,9 @@ void cache_writeback(const void *addr, unsigned int size)
     if ( !boot_cpu_has(X86_FEATURE_CLWB) )
         return cache_flush(addr, size);
 
-    /*
-     * This function may be called before current_cpu_data is established.
-     * Hence a fallback is needed to prevent the loop below becoming infinite.
-     */
-    clflush_size = current_cpu_data.x86_clflush_size ?: 16;
+    clflush_size = current_cpu_data.x86_clflush_size;
+    ASSERT(clflush_size);
+
     addr -= (unsigned long)addr & (clflush_size - 1);
     for ( ; addr < end; addr += clflush_size )
         clwb(addr);
-- 
2.39.5


