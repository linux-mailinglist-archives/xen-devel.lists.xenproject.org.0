Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLUnFhkTr2nJNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB2823EA7A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249622.1547092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSR-0007ts-ID; Mon, 09 Mar 2026 18:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249622.1547092; Mon, 09 Mar 2026 18:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSR-0007ro-Ev; Mon, 09 Mar 2026 18:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1249622;
 Mon, 09 Mar 2026 18:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzfSP-0007ml-KH
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:35:57 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce1be43b-1be6-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 19:35:54 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so8685701f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:35:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae3a20fsm28028805f8f.28.2026.03.09.11.35.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 11:35:52 -0700 (PDT)
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
X-Inumbo-ID: ce1be43b-1be6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081353; x=1773686153; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNqLEUifsz1cpFVFbx5viMkbYuuKYfbDoeHlGj5zHNY=;
        b=bV+nNqVTnq6M8SC1jLgNDzkojYaMysQ4LhdKodcI3jGmCi+c1v+xGzpHsTNxzSX6sJ
         X9E+WDgLrY5biFmthQJsJ+mDr66MuEgaM5XSiri/PEfE3lznNfTds2eB0Z9JW2CoWjUl
         l9b0vFCT8Lzg0EmhCBM/y+mrTgiOEXN4gR3w7ZgRk0aUAYitvkGlkr+d9rJwGW9BDvgx
         wau7rlAMb5drBh/OmUkLgzEfdoMt44Hxc4M2huGWyAt/aARewi65adJ7gq/ymx8H7v4J
         Yrboh6izOg1MhJe3oM5VNDrwSFItgJmWzBffEEPkYgI8NtbXxK4eFCrmGnXpQTP7gjnG
         X+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081353; x=1773686153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNqLEUifsz1cpFVFbx5viMkbYuuKYfbDoeHlGj5zHNY=;
        b=h/urbMSXlmG9Z9dreHHPm/yWGEZP0o5bK/Ba2jAInOzFHDqRgLTkeV0zhZ8zJvVgXz
         qnQyl3AdudrhiTxRnbgVbWJDgL9obn7fbH5m1tTWFZESMj9J4z/5xfGlfss5PQAmWJ+a
         pGxjHhh7PTLhWNgoVWDcGGVhQZVbctv+M6WdIgmoTmeFiac1v4AWTXIT9B/vFIwZZXg6
         uQICshlFWbQ4se6/kHw1+8gvyXpBptCNs8uNmiI7yWZA531rPOL1BlblEOhx9okbazC/
         mlZV7LZvNdb+sMg9ThEL8BLKbS01rEqWufxpd3udsCaC5N7Spt4yQIld84qzN7Fc7B3z
         QN1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvrz+u8zXQ3XUW1yJUuWI6D4dz+0g1WpGlg/ckVRvneEz9pRX/jThOiPHO6B2EsDA2lRYJUCUq8/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2kn0/z/pH0OPSzL5EFFztLsg8amCFUZ+Rxgs1m8fENpK1z4k6
	/rpgrxQRk3sZttyl14o1hw3NUJW1DbG3tJb7wwS1Gr0R8cta9IDUojZcFG/v/dWR85M=
X-Gm-Gg: ATEYQzxa+TtGequ+onEjjhywkVnTEpC2wJxwoUBjNr8DdUiZXc2zmvI2djaklTRx699
	k/l2MtNriQ9/a9NPsjthGNXkoEHHbpWfmU238APbKpLopUa/B77QDsiBSRZEiUlsxfQ4NXtelHB
	/aBMHwaBxVD2HAvjhR0Z5MwMDmxRMuREK+AGAQYh/FjNQ2s21rApcgobpp/wdObrjMMmkOrKkue
	9wreQPw3No6BXh14StgfRap5gGduMh8vZ79W3keIKdcZrY3ID3DoEzRjFsBzc5jJadZVKl5wC51
	+794N1+J/Dah4wgIJfWT/qSnUv78qIeOCUYr4k2vHW3lyZa4kTf1b83nC+7TRHgy6YoXFJ2AeHu
	0wypLVvBSflKBkyet70joI5MxAaidOuOL5XXJgG6K8xsz6cmvqK0003Dzi//4R3UHU96N1i5Lhb
	s8iIaXBs0dB7mrfLAEi83zIHVVuh/HMG8+l3G8xjx8DIG5c/YGxdz5trZcdtT/acfubLXXnj2X
X-Received: by 2002:a05:6000:704:b0:439:df5f:4220 with SMTP id ffacd0b85a97d-439df5f42f8mr17289075f8f.18.1773081353315;
        Mon, 09 Mar 2026 11:35:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: [PATCH v2 2/4] system/memory: Constify various MemoryRegion arguments
Date: Mon,  9 Mar 2026 19:35:33 +0100
Message-ID: <20260309183536.88976-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309183536.88976-1-philmd@linaro.org>
References: <20260309183536.88976-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EEB2823EA7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[unpredictable.fr,xenproject.org,lists.xenproject.org,nutanix.com,redhat.com,linaro.org,gmail.com,kernel.org,rsg.ci.i.u-tokyo.ac.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mohamed@unpredictable.fr,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:mark.caveayland@nutanix.com,m:peterx@redhat.com,m:richard.henderson@linaro.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:edgar.iglesias@gmail.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Mark the MemoryRegion structure const when is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/system/memory.h | 38 +++++++++++++++++++-------------------
 system/memory.c         | 38 ++++++++++++++++++++------------------
 system/physmem.c        |  2 +-
 3 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index 0562af31361..6a04c46db37 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -1749,14 +1749,14 @@ bool memory_region_init_rom_device(MemoryRegion *mr,
  *
  * @mr: the memory region being queried.
  */
-Object *memory_region_owner(MemoryRegion *mr);
+Object *memory_region_owner(const MemoryRegion *mr);
 
 /**
  * memory_region_size: get a memory region's size.
  *
  * @mr: the memory region being queried.
  */
-uint64_t memory_region_size(MemoryRegion *mr);
+uint64_t memory_region_size(const MemoryRegion *mr);
 
 /**
  * memory_region_is_ram: check whether a memory region is random access
@@ -1765,7 +1765,7 @@ uint64_t memory_region_size(MemoryRegion *mr);
  *
  * @mr: the memory region being queried
  */
-static inline bool memory_region_is_ram(MemoryRegion *mr)
+static inline bool memory_region_is_ram(const MemoryRegion *mr)
 {
     return mr->ram;
 }
@@ -1777,7 +1777,7 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
  *
  * @mr: the memory region being queried
  */
-bool memory_region_is_ram_device(MemoryRegion *mr);
+bool memory_region_is_ram_device(const MemoryRegion *mr);
 
 /**
  * memory_region_is_romd: check whether a memory region is in ROMD mode
@@ -1787,7 +1787,7 @@ bool memory_region_is_ram_device(MemoryRegion *mr);
  *
  * @mr: the memory region being queried
  */
-static inline bool memory_region_is_romd(MemoryRegion *mr)
+static inline bool memory_region_is_romd(const MemoryRegion *mr)
 {
     return mr->rom_device && mr->romd_mode;
 }
@@ -1800,7 +1800,7 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
  *
  * @mr: the memory region being queried
  */
-bool memory_region_is_protected(MemoryRegion *mr);
+bool memory_region_is_protected(const MemoryRegion *mr);
 
 /**
  * memory_region_has_guest_memfd: check whether a memory region has guest_memfd
@@ -1810,7 +1810,7 @@ bool memory_region_is_protected(MemoryRegion *mr);
  *
  * @mr: the memory region being queried
  */
-bool memory_region_has_guest_memfd(MemoryRegion *mr);
+bool memory_region_has_guest_memfd(const MemoryRegion *mr);
 
 /**
  * memory_region_get_iommu: check whether a memory region is an iommu
@@ -1820,7 +1820,7 @@ bool memory_region_has_guest_memfd(MemoryRegion *mr);
  *
  * @mr: the memory region being queried
  */
-static inline IOMMUMemoryRegion *memory_region_get_iommu(MemoryRegion *mr)
+static inline IOMMUMemoryRegion *memory_region_get_iommu(const MemoryRegion *mr)
 {
     if (mr->alias) {
         return memory_region_get_iommu(mr->alias);
@@ -1991,7 +1991,7 @@ const char *memory_region_name(const MemoryRegion *mr);
  * @mr: the memory region being queried
  * @client: the client being queried
  */
-bool memory_region_is_logging(MemoryRegion *mr, uint8_t client);
+bool memory_region_is_logging(const MemoryRegion *mr, uint8_t client);
 
 /**
  * memory_region_get_dirty_log_mask: return the clients for which a
@@ -2002,7 +2002,7 @@ bool memory_region_is_logging(MemoryRegion *mr, uint8_t client);
  *
  * @mr: the memory region being queried
  */
-uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr);
+uint8_t memory_region_get_dirty_log_mask(const MemoryRegion *mr);
 
 /**
  * memory_region_is_rom: check whether a memory region is ROM
@@ -2011,7 +2011,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr);
  *
  * @mr: the memory region being queried
  */
-static inline bool memory_region_is_rom(MemoryRegion *mr)
+static inline bool memory_region_is_rom(const MemoryRegion *mr)
 {
     return mr->ram && mr->readonly;
 }
@@ -2023,7 +2023,7 @@ static inline bool memory_region_is_rom(MemoryRegion *mr)
  *
  * @mr: the memory region being queried
  */
-static inline bool memory_region_is_nonvolatile(MemoryRegion *mr)
+static inline bool memory_region_is_nonvolatile(const MemoryRegion *mr)
 {
     return mr->nonvolatile;
 }
@@ -2036,7 +2036,7 @@ static inline bool memory_region_is_nonvolatile(MemoryRegion *mr)
  *
  * @mr: the RAM or alias memory region being queried.
  */
-int memory_region_get_fd(MemoryRegion *mr);
+int memory_region_get_fd(const MemoryRegion *mr);
 
 /**
  * memory_region_from_host: Convert a pointer into a RAM memory region
@@ -2071,7 +2071,7 @@ MemoryRegion *memory_region_from_host(void *ptr, ram_addr_t *offset);
  *
  * @mr: the memory region being queried.
  */
-void *memory_region_get_ram_ptr(MemoryRegion *mr);
+void *memory_region_get_ram_ptr(const MemoryRegion *mr);
 
 /* memory_region_ram_resize: Resize a RAM region.
  *
@@ -2421,7 +2421,7 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
  *
  * @mr: the region to be queried
  */
-ram_addr_t memory_region_get_ram_addr(MemoryRegion *mr);
+ram_addr_t memory_region_get_ram_addr(const MemoryRegion *mr);
 
 uint64_t memory_region_get_alignment(const MemoryRegion *mr);
 /**
@@ -2521,7 +2521,7 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
  *
  * @mr: a #MemoryRegion which should be checked if it's mapped
  */
-bool memory_region_is_mapped(MemoryRegion *mr);
+bool memory_region_is_mapped(const MemoryRegion *mr);
 
 /**
  * memory_region_get_ram_discard_manager: get the #RamDiscardManager for a
@@ -2967,7 +2967,7 @@ void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
 int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
 bool prepare_mmio_access(MemoryRegion *mr);
 
-static inline bool memory_region_supports_direct_access(MemoryRegion *mr)
+static inline bool memory_region_supports_direct_access(const MemoryRegion *mr)
 {
     /* ROM DEVICE regions only allow direct access if in ROMD mode. */
     if (memory_region_is_romd(mr)) {
@@ -2984,8 +2984,8 @@ static inline bool memory_region_supports_direct_access(MemoryRegion *mr)
     return !memory_region_is_ram_device(mr);
 }
 
-static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write,
-                                           MemTxAttrs attrs)
+static inline bool memory_access_is_direct(const MemoryRegion *mr,
+                                           bool is_write, MemTxAttrs attrs)
 {
     if (!memory_region_supports_direct_access(mr)) {
         return false;
diff --git a/system/memory.c b/system/memory.c
index c51d0798a84..b130d956d4e 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1819,9 +1819,9 @@ static void memory_region_finalize(Object *obj)
     g_free(mr->ioeventfds);
 }
 
-Object *memory_region_owner(MemoryRegion *mr)
+Object *memory_region_owner(const MemoryRegion *mr)
 {
-    Object *obj = OBJECT(mr);
+    const Object *obj = OBJECT(mr);
     return obj->parent;
 }
 
@@ -1849,7 +1849,7 @@ void memory_region_unref(MemoryRegion *mr)
     }
 }
 
-uint64_t memory_region_size(MemoryRegion *mr)
+uint64_t memory_region_size(const MemoryRegion *mr)
 {
     if (int128_eq(mr->size, int128_2_64())) {
         return UINT64_MAX;
@@ -1866,25 +1866,25 @@ const char *memory_region_name(const MemoryRegion *mr)
     return mr->name;
 }
 
-bool memory_region_is_ram_device(MemoryRegion *mr)
+bool memory_region_is_ram_device(const MemoryRegion *mr)
 {
     return mr->ram_device;
 }
 
-bool memory_region_is_protected(MemoryRegion *mr)
+bool memory_region_is_protected(const MemoryRegion *mr)
 {
     return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
 }
 
-bool memory_region_has_guest_memfd(MemoryRegion *mr)
+bool memory_region_has_guest_memfd(const MemoryRegion *mr)
 {
     return mr->ram_block && mr->ram_block->guest_memfd >= 0;
 }
 
-uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
+uint8_t memory_region_get_dirty_log_mask(const MemoryRegion *mr)
 {
     uint8_t mask = mr->dirty_log_mask;
-    RAMBlock *rb = mr->ram_block;
+    const RAMBlock *rb = mr->ram_block;
 
     if (global_dirty_tracking && ((rb && qemu_ram_is_migratable(rb)) ||
                              memory_region_is_iommu(mr))) {
@@ -1898,7 +1898,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
     return mask;
 }
 
-bool memory_region_is_logging(MemoryRegion *mr, uint8_t client)
+bool memory_region_is_logging(const MemoryRegion *mr, uint8_t client)
 {
     return memory_region_get_dirty_log_mask(mr) & (1 << client);
 }
@@ -2406,7 +2406,7 @@ void memory_region_reset_dirty(MemoryRegion *mr, hwaddr addr,
         memory_region_get_ram_addr(mr) + addr, size, client, NULL);
 }
 
-int memory_region_get_fd(MemoryRegion *mr)
+int memory_region_get_fd(const MemoryRegion *mr)
 {
     RCU_READ_LOCK_GUARD();
     while (mr->alias) {
@@ -2415,7 +2415,7 @@ int memory_region_get_fd(MemoryRegion *mr)
     return mr->ram_block->fd;
 }
 
-void *memory_region_get_ram_ptr(MemoryRegion *mr)
+void *memory_region_get_ram_ptr(const MemoryRegion *mr)
 {
     uint64_t offset = 0;
 
@@ -2440,7 +2440,7 @@ MemoryRegion *memory_region_from_host(void *ptr, ram_addr_t *offset)
     return block->mr;
 }
 
-ram_addr_t memory_region_get_ram_addr(MemoryRegion *mr)
+ram_addr_t memory_region_get_ram_addr(const MemoryRegion *mr)
 {
     return mr->ram_block ? mr->ram_block->offset : RAM_ADDR_INVALID;
 }
@@ -2806,7 +2806,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
                    sizeof(FlatRange), cmp_flatrange_addr);
 }
 
-bool memory_region_is_mapped(MemoryRegion *mr)
+bool memory_region_is_mapped(const MemoryRegion *mr)
 {
     return !!mr->container || mr->mapped_via_alias;
 }
@@ -3290,7 +3290,7 @@ void address_space_destroy_free(AddressSpace *as)
     call_rcu(as, do_address_space_destroy_free, rcu);
 }
 
-static const char *memory_region_type(MemoryRegion *mr)
+static const char *memory_region_type(const MemoryRegion *mr)
 {
     if (mr->alias) {
         return memory_region_type(mr->alias);
@@ -3483,7 +3483,6 @@ static void mtree_print_flatview(gpointer key, gpointer value,
     GArray *fv_address_spaces = value;
     struct FlatViewInfo *fvi = user_data;
     FlatRange *range = &view->ranges[0];
-    MemoryRegion *mr;
     int n = view->nr;
     int i;
     AddressSpace *as;
@@ -3510,7 +3509,8 @@ static void mtree_print_flatview(gpointer key, gpointer value,
     }
 
     while (n--) {
-        mr = range->mr;
+        const MemoryRegion *mr = range->mr;
+
         if (range->offset_in_region) {
             qemu_printf(MTREE_INDENT HWADDR_FMT_plx "-" HWADDR_FMT_plx
                         " (prio %d, %s%s): %s @" HWADDR_FMT_plx,
@@ -3683,8 +3683,10 @@ static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
 
     /* print aliased regions */
     QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
-        qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
-        mtree_print_mr(ml->mr, 1, 0, &ml_head, owner, disabled);
+        const MemoryRegion *mr = ml->mr;
+
+        qemu_printf("memory-region: %s\n", memory_region_name(mr));
+        mtree_print_mr(mr, 1, 0, &ml_head, owner, disabled);
         qemu_printf("\n");
     }
 
diff --git a/system/physmem.c b/system/physmem.c
index e5390d09bef..4a9e0760045 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1975,7 +1975,7 @@ void qemu_ram_unset_idstr(RAMBlock *block)
     }
 }
 
-static char *cpr_name(MemoryRegion *mr)
+static char *cpr_name(const MemoryRegion *mr)
 {
     const char *mr_name = memory_region_name(mr);
     g_autofree char *id = mr->dev ? qdev_get_dev_path(mr->dev) : NULL;
-- 
2.53.0


