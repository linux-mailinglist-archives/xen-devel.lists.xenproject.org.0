Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FakKYWQp2lKiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B31F9B6D
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 02:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245075.1544464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPh-0006sI-Ew; Wed, 04 Mar 2026 01:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245075.1544464; Wed, 04 Mar 2026 01:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPh-0006oq-BK; Wed, 04 Mar 2026 01:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1245075;
 Wed, 04 Mar 2026 01:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPf-00069T-UI
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:35 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0902bbf-176c-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 02:52:35 +0100 (CET)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-5ff0f61abd7so1565773137.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:35 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df641e133sm16763221241.5.2026.03.03.17.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:33 -0800 (PST)
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
X-Inumbo-ID: d0902bbf-176c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589154; x=1773193954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdxVAJZzyfNVW1udrhdUFVJfrw+pt2l9y2/jEQPXbUc=;
        b=Z3Wj5ZhrknfJXAYwjf/8Pg4UG03qTY63SA2f7RxeddC1UAacq5mqPz1M0ux7K8WQlh
         YP16Xf8YvXXDJL8+xpUGLMU3ygvt/VvNAaIFhSBgY5OUxiXH+AQFAHXk+gR6hW9x0sDs
         +KkCzG85kNnzJjwbo27I4mPYcImcPiNwgkerQ//MoW2h/nKGVznbnq8LtOFVPALr3sHp
         TRbSemnlsr35iAsyBvyUP5/SW4s7KLu+zNUSq1A2Ny0fI0FdFxHha0neOe/gKcOU5vYd
         NTyByVdoiPPS2TgbZve3Tb7Vfx45CSEDwN3ED2LDMSKPviwoWHQJDP3Q71Cj3H4m2oRj
         tUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589154; x=1773193954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fdxVAJZzyfNVW1udrhdUFVJfrw+pt2l9y2/jEQPXbUc=;
        b=H26ubfGcJC6yV835Ht3oZ7AR87YGXkS5x8sVfU9jUKejmNlhw97PRvdEyofN5IxNJb
         9+nYXfUCXVqaGRTbF6QjwNl++V5MKj9fW/dl1Vz+X2JnU6mRY4iHWaFARHGmAjDO3Nd3
         2gGkrP0IKpL9iMIstmvwQi8Gx//qRhbTzXLcs9NbHbD0h/c1f1Akzl92PGLWv7YNlNZY
         I2KW/Gxndp2vbd3NWm3z9hDcrBRMrmork2LXrPWdNOFhOI8Eso6VP9REy1jhi9Il6Lps
         SU9kHQzKN/RXaj/c96FUVeIZPkTEVu5vE5R0+hDAOi2K6ryr6qB5zVZtwct0TpeXWTus
         d9kA==
X-Forwarded-Encrypted: i=1; AJvYcCWz4YywgpisIVAYvz2S47Us4Omr45P7MUnwdt93OFr1BBaIYi0NU+8zk4pavCkwKIbS0iI5hHoY6yY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgnI/45vmTnlgDIvOA+p035S7l1SktuATXsovASLesiizXpYQZ
	l5AgNdFLefFp9Kmrc24r5l1Fbs1mkHh7Ts55lDCqkQyWugTEC8zd2GuM
X-Gm-Gg: ATEYQzxkeI4rF75m1OwuprwN9UQ1wWBKYS868370/9u8SJmCIbxUyD+sJK7P/ZT5EF8
	eif9vpjh5l1/gDTbUvlmgU7YUpxX/zdl/VwQ2fsTb/dpC5RwMXe89j5Jh63KNyrY49ZTJQMqUx2
	poJ2MJQ6Tu110biBogKMDttvmnMKVOG5OgQwoig600JFyFe3lV5EgainkG2zQHeuOk2PydUH2Jy
	L0IHNW5etPODQeYwetiFOFveQU1zQUSRgF6jRpAVOBiZm6mrXWvT46/2ITYjqNvpru11jWnVBE5
	n0/2wRIyz0UjNxNYyF5Or4AmR8TxvNzm7TsYeTg0QvNp7Xr317YI/8d/4YawvvZLh4PnzvxGtvk
	ST+YofDhBBcuz/iMjlHNSlbSgeJeu1AfN3mZAc71rXTV3VRxNtwUv94DVn3TmpOcPAIYyGr8YaC
	KL32j/eXK2w80vs50OzJEdxNGPvJVrv/+camGL9k2rraInlmqA9qedy7mEUw==
X-Received: by 2002:a05:6102:2922:b0:5fc:2b19:f7de with SMTP id ada2fe7eead31-5ffaae9984fmr215631137.25.1772589153980;
        Tue, 03 Mar 2026 17:52:33 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 3/5] physmem: xen: Conditionalize use of the mapcache
Date: Wed,  4 Mar 2026 02:52:19 +0100
Message-ID: <20260304015222.979224-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304015222.979224-1-edgar.iglesias@gmail.com>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F8B31F9B6D
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
---
 system/physmem.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index e5ff26acec..64e6d50f8f 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -578,7 +578,8 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
                                     is_write, true, &as, attrs);
     mr = section.mr;
 
-    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
+    if (xen_map_cache_enabled() &&
+        memory_access_is_direct(mr, is_write, attrs)) {
         hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
         *plen = MIN(page, *plen);
     }
@@ -2577,7 +2578,7 @@ static void reclaim_ramblock(RAMBlock *block)
 {
     if (block->flags & RAM_PREALLOC) {
         ;
-    } else if (xen_enabled()) {
+    } else if (xen_map_cache_enabled()) {
         xen_invalidate_map_cache_entry(block->host);
 #if !defined(_WIN32) && !defined(EMSCRIPTEN)
     } else if (block->fd >= 0) {
@@ -2736,7 +2737,7 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
         len = *size;
     }
 
-    if (xen_enabled() && block->host == NULL) {
+    if (xen_map_cache_enabled() && block->host == NULL) {
         /* We need to check if the requested address is in the RAM
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
@@ -2785,7 +2786,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
     RAMBlock *block;
     uint8_t *host = ptr;
 
-    if (xen_enabled()) {
+    if (xen_map_cache_enabled()) {
         ram_addr_t ram_addr;
         RCU_READ_LOCK_GUARD();
         ram_addr = xen_ram_addr_from_mapcache(ptr);
@@ -3787,7 +3788,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
         if (is_write) {
             invalidate_and_set_dirty(mr, addr1, access_len);
         }
-        if (xen_enabled()) {
+        if (xen_map_cache_enabled()) {
             xen_invalidate_map_cache_entry(buffer);
         }
         memory_region_unref(mr);
@@ -3898,7 +3899,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache)
         return;
     }
 
-    if (xen_enabled()) {
+    if (xen_map_cache_enabled()) {
         xen_invalidate_map_cache_entry(cache->ptr);
     }
     memory_region_unref(cache->mrs.mr);
-- 
2.43.0


