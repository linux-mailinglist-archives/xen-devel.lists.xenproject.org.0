Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBaNA4SQp2lqiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036DF1F9B5F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245073.1544439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPb-0006Dr-V6; Wed, 04 Mar 2026 01:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245073.1544439; Wed, 04 Mar 2026 01:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPb-0006B6-PE; Wed, 04 Mar 2026 01:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1245073;
 Wed, 04 Mar 2026 01:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPa-00069T-MM
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:30 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd6a365f-176c-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 02:52:30 +0100 (CET)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-94dda16ff9fso1914153241.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:29 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ff1ea1596asm18777740137.9.2026.03.03.17.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:28 -0800 (PST)
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
X-Inumbo-ID: cd6a365f-176c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589149; x=1773193949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxu4XRB4FitI2+AcQo8tLZ5+1Awl0R6238sOzIkA3R0=;
        b=UxSha2V/remXY709hVthtXxJCcOpZq/ReBQ9iYEzmAn2rzakakOt5TDONZQ/2AiGN+
         pS27vRc8zU4r+93xgjEw+lXoZENRu7W820wHsM7kDJSVgV1HITW/GD2hGUri912amZBE
         bsFQe22mp7UozRCcw3L9g5Uf0BOlOv4/qeFP7TxdZOC8plbwVo7PDWM2AIF0QZYdx9fA
         jKB9FXUyU0HZ2yyqHe19w75CRQ8CRoNUfiRTXi9kRlSYQBEwVbbZzoHc2iJZzSMlpRUP
         4AYXR4ufXYv5ZmPHx4sbIFosb8v+HFGBk7v7RLehpPtdYsrj4sMdJdmRMqQb8okcyF/5
         A18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589149; x=1773193949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxu4XRB4FitI2+AcQo8tLZ5+1Awl0R6238sOzIkA3R0=;
        b=v6sXoniYP1h0o2tKZma9Yce7oj9WPPzEQ3rJUmBimBmhrDtNlg/y76k1gzIyNiOdvy
         3bHVGTiCD/xO82OIDlycmozKK38nFiJm3SqCpqv+NExn/b/Lao38AY3/DskSOmiQUwSX
         rBDYtcprDRc8qbDQQmYhoonc+fMx4vLRHVwkos7XXYAO/CLmXoVzwQu1XrxygWRVMOhc
         a5aicooYBhYfX6iqrzffkxuK3Dzp9yutA4aEP2RfFLDqLbCW8bBUaCIerrJ9vIwhg8hV
         TG+6yTzMo3BPGhgV1/HhH1tvQFZHiQ37Xzj60wKdlgdPm9k2BdqeetDw6+lgUuXOof1z
         2RJA==
X-Forwarded-Encrypted: i=1; AJvYcCW6el+t/I2GA4Ca74BzEO48h4XxTIiFzKxp4zgmzmO0V+ed1r96DjqlrldMOmFvXo8qjnRADznY7M4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzufG5bYyido0dDj/2I+IgglkqqNqL1yYWJKOxm2Kl63gSvn5EL
	DBVg3MwHcvqqHInnqPhqVRDWXnqS+F1cb2fxItBVRoPVR0xPG4WafBbe
X-Gm-Gg: ATEYQzzkhwjVkZqhDJm0NGzYle6Qhwe/0M2JN/iKxeha0026TU3x/hGcbtrjZ8E3Wim
	Q6X9yl+A0SkbvEy+jYQNeCwwnXd+TehkLU9lWLkP1pjXCcOdz/51U4ylZil7y99jISIIte1uOcy
	WwF6U9DhZsqWtzPLLzG5TD207WHRrJu4WB9Z/qvcWlu4OZzH5Wu0X/9bNEjNUGMw1c2CrR4NaOT
	60Lbz+rj0EoLxitCA2NZuVJNWsQP8JdGXJHoI9mR7WKmDecMqB3mAuq4tjRF25MLSn2UksGJEUx
	iF3dbT4shak5uZ0u+VdQF9yRx0IIf/UWLFkb258JZO5WEm9+VkwBLkCpJybvm90qKn9YHvF2XFv
	Ff583cDyTD5zXWlDb4sGExUEl37El0sODIj/tsNdCeL9Thj9Tcd+3FILE8TQAjfrlynW0enrv3g
	hnsTyTylm2Q1MGvfEGBkep2O/DvxHAAS5YgphReL/oc9HZrIW+BdPdueKfSA==
X-Received: by 2002:a05:6102:c09:b0:5dd:f9c2:551c with SMTP id ada2fe7eead31-5ffaaf1bf2fmr242963137.27.1772589148744;
        Tue, 03 Mar 2026 17:52:28 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 1/5] xen: mapcache: Assert mapcache existance
Date: Wed,  4 Mar 2026 02:52:17 +0100
Message-ID: <20260304015222.979224-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304015222.979224-1-edgar.iglesias@gmail.com>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 036DF1F9B5F
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

Assert that the mapcache was created prior to being used.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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


