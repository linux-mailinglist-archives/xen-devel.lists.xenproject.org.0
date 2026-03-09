Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEOAJpBsrml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A7234582
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249074.1546603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMF-00060X-MP; Mon, 09 Mar 2026 06:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249074.1546603; Mon, 09 Mar 2026 06:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMF-0005yt-JO; Mon, 09 Mar 2026 06:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1249074;
 Mon, 09 Mar 2026 06:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUME-0005KI-QK
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:50 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7811c53a-1b83-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 07:44:50 +0100 (CET)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-56affe9f4c4so1330781e0c.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:50 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56b09a2614fsm9529782e0c.7.2026.03.08.23.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:47 -0700 (PDT)
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
X-Inumbo-ID: 7811c53a-1b83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038689; x=1773643489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2tMEsPmEaiHyXknwk29SjcZVAaayzKi1p57s2lEHB0=;
        b=mW5Pe+2jWCfCSoNVatxLSZaJ4edjNDz9JE8VMdeodAgPrMiiGgrpOGwnVkBHtJfhGn
         salNlGFW3yF8gOnoJG03fXmP/n16y63jTxl5qPeQLYqoVRFlM3TblWZvCCB+owUz563E
         atgBH9HmnhY9WYHvSIwOYQlPSsXCxv1EkOIj/z14laDo2Eh7vtjXECO3hQPe0zgchsK0
         JSyxjMCEU0KPn+dDMhjvqYuywFElO68PmLnkBW6OM073Ab41mwAC+Dq6TTZtKZ5bNbrE
         xuG6vM+rFn3kbnZdxiyofHN80aQPFhTGD7qwjgMCH56CvJJ0p8Adm5tHnizITFmuIA77
         s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038689; x=1773643489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2tMEsPmEaiHyXknwk29SjcZVAaayzKi1p57s2lEHB0=;
        b=D0pWStxgUu9g+wry4OsbfrP8BCaHNt+oTKB7phyWzKVeMOis0FRCgC/5H1VRiw+mjd
         ZiWlNtleV7xqXINxn3DTf+cjVbDJvVok8IROvG+gH00vRRa0HqX0Fh5hv8H8iX4yY6Rc
         KdRCUG5i2x0UJnlcdRtQnHtztSJjC41F/2EvcsHfAcHFM8wmmTHUk9sUDEL/+672ayNb
         mnJ54OdQKLk5IHr/berroeJDsq9l0pUGJtmJM1Ae/KL7R8wWs3RrIPPgNaHWk8bSIJwd
         rG7MrjTLIMFBbh8pIRTFMHQTxBT3elWQwrYgQCcK9ftL6xrv4Kho8diUEbQ4IvG0eVtr
         +syw==
X-Forwarded-Encrypted: i=1; AJvYcCXq/OYY8LNVgV8zHWXZvU01H0A0b4LvG6Tb56MDHL8bdlGQgpJI6zhjfriO6DRX96RIan3xTXzmcyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN8uKH6bQhTNnC1L2+ht0JXPZSm9Kq64WBemGznABQfmVUWgPz
	KgvV5a3DsuVsb7pRamhjNyFIV/XDt7smT/e8hYwRv13eG7pAD7o/Wssd
X-Gm-Gg: ATEYQzzi66KKtoVwWhmVLr9c4hDa7Bw2YM9ccz3VWtKLBcXGgnbHZDCaeBu+2Xr6nhn
	Pw/AD9WK+MFUq+arl2sfPIio3MwYECt8D+zsWNbCM8EvrIMOdmVw4og8YzYGZFGyLAyLaM+0Xp4
	ZUPOFuK8xfQKUjEPj7SWsKGxupqjjoqr+HEYXugYA1pNXdZsY9yfYJFZ+tkVEMO78BmTE+QSyGV
	5Ah638bOSOZh2X0qK07auFzXa4ekw7+NE/77s6MMbWuaf3etwTPlHbtJcBz2e6q0aiNIDUFJqAD
	7d9cF4pzGnDRrTLEDXfowfuWDFGCdDU9wk0Dm5EfaNx1/1ch7CME+kdDwiSYUVPM9IDeCwdkqoV
	GVLXQINlRsJ+d2lxSqBEGb3qXhm088WYRi8mTchBsVRstdM5K4VaH30bYG6tKwYG7GZEaiWE/3y
	AqcZpPRvgvlAiyTmTbPyP3fbU22nfpNnJoFz7ZYeX6Oqt44+uDgjbt1OXISg==
X-Received: by 2002:a05:6122:1350:b0:566:36e7:8934 with SMTP id 71dfb90a1353d-56b07e8b7dcmr3378593e0c.16.1773038688827;
        Sun, 08 Mar 2026 23:44:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 3/5] physmem: xen: Conditionalize use of the mapcache
Date: Mon,  9 Mar 2026 07:44:33 +0100
Message-ID: <20260309064436.51860-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 514A7234582
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:peterx@redhat.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Conditionalize use of the mapcache. This is in preparation
to optionally disable the mapcache at runtime.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 system/physmem.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index e5ff26acec..7eecd81877 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -578,7 +578,9 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
                                     is_write, true, &as, attrs);
     mr = section.mr;
 
-    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
+    if (xen_map_cache_enabled() &&
+        memory_access_is_direct(mr, is_write, attrs)) {
+        /* mapcache: Next page may be unmapped or in a different bucket/VA. */
         hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
         *plen = MIN(page, *plen);
     }
@@ -2577,7 +2579,7 @@ static void reclaim_ramblock(RAMBlock *block)
 {
     if (block->flags & RAM_PREALLOC) {
         ;
-    } else if (xen_enabled()) {
+    } else if (xen_map_cache_enabled()) {
         xen_invalidate_map_cache_entry(block->host);
 #if !defined(_WIN32) && !defined(EMSCRIPTEN)
     } else if (block->fd >= 0) {
@@ -2736,7 +2738,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
         len = *size;
     }
 
-    if (xen_enabled() && block->host == NULL) {
+    if (xen_map_cache_enabled() && block->host == NULL) {
         /* We need to check if the requested address is in the RAM
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
@@ -2785,7 +2787,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
     RAMBlock *block;
     uint8_t *host = ptr;
 
-    if (xen_enabled()) {
+    if (xen_map_cache_enabled()) {
         ram_addr_t ram_addr;
         RCU_READ_LOCK_GUARD();
         ram_addr = xen_ram_addr_from_mapcache(ptr);
@@ -3787,7 +3789,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
         if (is_write) {
             invalidate_and_set_dirty(mr, addr1, access_len);
         }
-        if (xen_enabled()) {
+        if (xen_map_cache_enabled()) {
             xen_invalidate_map_cache_entry(buffer);
         }
         memory_region_unref(mr);
@@ -3898,7 +3900,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache)
         return;
     }
 
-    if (xen_enabled()) {
+    if (xen_map_cache_enabled()) {
         xen_invalidate_map_cache_entry(cache->ptr);
     }
     memory_region_unref(cache->mrs.mr);
-- 
2.43.0


