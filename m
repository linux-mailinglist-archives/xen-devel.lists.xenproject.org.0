Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MDHCY5srml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8AF23456B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249072.1546585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMB-0005a6-8d; Mon, 09 Mar 2026 06:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249072.1546585; Mon, 09 Mar 2026 06:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMB-0005XV-5z; Mon, 09 Mar 2026 06:44:47 +0000
Received: by outflank-mailman (input) for mailman id 1249072;
 Mon, 09 Mar 2026 06:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUM9-0005KI-60
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:45 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 747b748a-1b83-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 07:44:44 +0100 (CET)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-56aff27dfebso2857451e0c.1
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:44 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56b0f889ed2sm7456162e0c.13.2026.03.08.23.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:41 -0700 (PDT)
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
X-Inumbo-ID: 747b748a-1b83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038683; x=1773643483; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAku/l+conV0dggG+e6fwfk6f4KYUT5yoO6o2dEMQkk=;
        b=ifaCFTUoh0bWUgGGEo59P3yNBaR0u2d9CU1x9N8zlxiBFQAyfvwmi985O6VHwJb32q
         8yxh4chSBmhgGbgGwi5GnGtI8LeDHn99VVHsUX0/jmsgPXmlKTF32OnQL2xh58G0JREX
         xYBdp4ezxsHeipxqB8usIQMK56YtoQFqTLFufREAD7Ew3mCw3qKAzxzQtsvTyxQCNsep
         NcnZ+jFrE6Szq2w4y+yEF0UERAdgCSmus7F2E0j/tGSuAYhBRWJ36jdhdqG9IJq2xSSO
         YNsfDQMUnhNUqMga14kZ4zYL3502KdiDVsIQcK9UgsKxP5eTfMzL+LiK3TdSOWdoJfZM
         n5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038683; x=1773643483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mAku/l+conV0dggG+e6fwfk6f4KYUT5yoO6o2dEMQkk=;
        b=eQqAZ+KiuTwY1uur9OqXH3uF+KBREmOTxjdgKgyxHtS6YcndQHEteFXZ8zGq+SBxRZ
         0/7U9UaFYmQEyJeLziKP+ihQA03pC7fsDMJ1zjTSHujVYzacnTtL4beqmFTkBE79xniz
         cuYndfln8znfmGyDLLEBf2DWyAdYOtjw/4NR4E9t96hTF9D9HWtU9AiotsxSY1Qrj8I8
         Yr1rVZe2sBFkjpNJ3OfME14NggB9KlG93+HaewF7J6TW+yensbWkA+t5O0e+2GhzHxx7
         ebBs88vNaw5v6JruJ4y7TFEg9t68oqv4O/7GsRXzxc3WIA5yCgWfaxb3oeuCljTWGUFu
         jRHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHggVAHUAFGnhGl7LrR2Xy0cciFFG6AQVF41frHPh1TpgwLRkhKPtNRQ9foJeQc7XWY09LmhobwBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm4GAErjMy9KNsSMRtdaQeBAG+d7EXeRiwnCC3tNtE5654bDrP
	ra9g5qhDaoOnEs+J3aV8S97lKoJkAUE0HWRvOHRAaBkwuL1ayRl2ykI8
X-Gm-Gg: ATEYQzxBNhLBscHLsZ/G5eeWI9rUoaNVzbVQs+9ZkHOWGG0cfr841DZhZmXZqaznH0x
	LggYIolVBZxO/89DMZMbhmVBeNf7ovWuG4rl81clX9FOPqlOKY+tAIfTYB/WDohKC/VAXI7iqPu
	iDQqi9rljxPAQWo11w8ANIqjFtssunB/ihJgmLvmiOqWS0gA5WTIryNIRdceVVO//RREACye1z6
	VPt/OoxHmZE0ASZhaxq+D2ziaAfrrcrZJk/5ohBEELCWEu8ll/gDQ/X6UFZ1jfP03VaJzbVsQbc
	pTY0AL0EdXKuPOQbznFNlzpQOIfiGw3Bv293OJqAWpVZGXoH+PokgEhdliYEfkpADxCH0dkduqr
	41muaSpVb6Tro0Cmmb7VqCyIa2g1sQ1b26lZiizJPunHzFdI3OyhvIIa4ZzBF4UF6qVlle+vfgp
	NsFRL74B3j5sFutLXfePz8HK03SvvH27/wSzXVKg478e/bPrwvpLWmRueGAIe/6hH/t/07
X-Received: by 2002:a05:6122:e46e:b0:567:433b:e903 with SMTP id 71dfb90a1353d-56b07d79ffcmr4232283e0c.6.1773038682868;
        Sun, 08 Mar 2026 23:44:42 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 1/5] xen: mapcache: Assert mapcache existance
Date: Mon,  9 Mar 2026 07:44:31 +0100
Message-ID: <20260309064436.51860-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1D8AF23456B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,gmail.com];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Assert that the mapcache was created prior to being used.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 11115f6084..517e5171b7 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -464,6 +464,8 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
     MapCache *mc = mapcache;
     uint8_t *p;
 
+    assert(mapcache);
+
     if (grant) {
         mc = is_write ? mapcache_grants_rw : mapcache_grants_ro;
     }
@@ -530,6 +532,8 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
 {
     ram_addr_t addr;
 
+    assert(mapcache);
+
     addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
     if (addr == RAM_ADDR_INVALID) {
         addr = xen_ram_addr_from_mapcache_single(mapcache_grants_ro, ptr);
@@ -652,6 +656,8 @@ static void xen_invalidate_map_cache_entry_bh(void *opaque)
 
 void coroutine_mixed_fn xen_invalidate_map_cache_entry(uint8_t *buffer)
 {
+    assert(mapcache);
+
     if (qemu_in_coroutine()) {
         XenMapCacheData data = {
             .co = qemu_coroutine_self(),
@@ -709,6 +715,8 @@ static void xen_invalidate_map_cache_single(MapCache *mc)
 
 void xen_invalidate_map_cache(void)
 {
+    assert(mapcache);
+
     /* Flush pending AIO before destroying the mapcache */
     bdrv_drain_all();
 
@@ -776,6 +784,8 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
 {
     uint8_t *p;
 
+    assert(mapcache);
+
     mapcache_lock(mapcache);
     p = xen_replace_cache_entry_unlocked(mapcache, old_phys_addr,
                                          new_phys_addr, size);
-- 
2.43.0


