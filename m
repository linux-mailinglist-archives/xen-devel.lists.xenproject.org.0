Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F6BB33CE
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135406.1472540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtY-0001Ag-5b; Thu, 02 Oct 2025 08:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135406.1472540; Thu, 02 Oct 2025 08:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4EtY-00018U-23; Thu, 02 Oct 2025 08:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1135406;
 Thu, 02 Oct 2025 08:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4EtW-000821-N4
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdaa504c-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:42:34 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso6166885e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d869d50sm2773210f8f.0.2025.10.02.01.42.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:33 -0700 (PDT)
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
X-Inumbo-ID: bdaa504c-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394554; x=1759999354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q36ac4tAhT01s84agsdvLvLQt0ctAJzIb51YlTVbcXM=;
        b=J5E/dVbM32FM5Py0Mw8G6vIgPou/sYSbJr6oVw1Js4AQsZi9zomVxCvdOlkNblAEbS
         LevBGWC5c2iqlJMT2d7nzbGvRllKfT3Z7RVsO4Ff+dgbbMYZP2Rl9wOIhgX6cCM0wtmq
         k1ZLQAel5ZEXODc+ASJ9OBp27whWzhlImCpbXdwlmEDsb3x5vg2K++s+Ul5fyrOfhsf8
         +T2kJS3nreQ5mA9AEgNgsSmg2G66HUDvzKt3xzlyT+CHNCy0moB+qE37rf2IrR5OTNvr
         Z8wJWp+XIn8vqUXn1FPTFIDUZkJKozzHiojsDBpm4mO4M2l7LJekYRmr6+6hvaw+mMYx
         VhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394554; x=1759999354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q36ac4tAhT01s84agsdvLvLQt0ctAJzIb51YlTVbcXM=;
        b=V71wSpNp8lSpYy9bM/UJRnnWCXAGykyKsnAJh6zi+mkzXTO2SSdBne/HaKzGSpjHG9
         I6Cx/QgMieumEWj/M9ck7ionKjURGkuJABbGbiS5NJBLG6wTsNRRJW5yVdWkCYIot6ih
         Jyuk2F4z39EYplX19czPwo9X0bNqRiE/qL7F9VBGveHzKHxR3xLRUnZIZkHxfsW9Itri
         7AIlGXbBJh7QSdarjMDRcGyailNfr0V2uPusdf5HL3IDDR28Xjj9Ml0qSaAAHfAd2FkC
         TrZJISLIhE9Slwdrux9+/w16U7i2GqzNap5XLdPGkr4HGTqlcRnyteKKIbmbsTpl104N
         F9nw==
X-Forwarded-Encrypted: i=1; AJvYcCVWjLSWfeqfDe7/t0i3x5z+1/pTYjhmKY71MjTd3/gy+WPNexXOaDwK/S2SxK2JvZePwb1M9+8cYPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdmv/4hXs/weY216N1pqa6v4ROiMDrnF+MAD7x5h4zzMWmjmOg
	NLNZA6YG1hLV0kdX0l/jE58/g0Ll35SRquQkaLv/bNKXWyvv6S2KuZqHxhzVKLzp8QU=
X-Gm-Gg: ASbGncshFwGnGty49AkMScrrow46mVu1rHGQFjmhmSuz4nUOYZkxnzhWiwsQqyLdwxR
	QtuQXhHVAvpoA+eMrGyZH8mlGsJR7LdJqKCK3zAomHZF5xNO+DQPz2OHXzVMtZUKq2TnkBWyUuF
	wnT2EM8FDoY54DQuYgoMo8nMZ4SNHfKEFWMnfxxCIsW2lV3QQhLLoi1gyu/R5bLWKldG+Nug0ys
	jLSwB9baNhy+llZN/wC2GXwN/rHfypeW4fznUI8XRqmgAzH3byEhPIlkeokKHnPZEt5tAjOI7LG
	VrT6hD0/DVxJUfMSXaDIykC2IXk107jlkJfCg23C+BiduoVzMGQYSgHYg1E+s1qxw7bqUYlJXP4
	ZS35Bl98+5Uyo4OfnBsvuC0ZmG1A5zbyVkjvWOZ4+7Raa4m8xDqpiEdQcplzfwjjDaF6Za3IYHU
	dOU4TPFuYXm9xWHGB7NmFl/buMb7Xrg8U0VlxIMMZj
X-Google-Smtp-Source: AGHT+IGvW2QY4XT4rE3gnCvd4C2svQ9D2UQ58ymAoAfIs0dUKEvFj1XA9d+49KzTkmba3O5b3qx94Q==
X-Received: by 2002:a05:600c:524f:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-46e61267b13mr46680795e9.21.1759394553640;
        Thu, 02 Oct 2025 01:42:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 06/17] system/physmem: Pass address space argument to cpu_flush_icache_range()
Date: Thu,  2 Oct 2025 10:41:51 +0200
Message-ID: <20251002084203.63899-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename cpu_flush_icache_range() as address_space_flush_icache_range(),
passing an address space by argument. The single caller, rom_reset(),
already operates on an address space. Use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h | 2 --
 include/system/memory.h   | 2 ++
 hw/core/loader.c          | 2 +-
 system/physmem.c          | 5 ++---
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index a73463a7038..6c7d84aacb4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -156,8 +156,6 @@ void cpu_physical_memory_unmap(void *buffer, hwaddr len,
  */
 void qemu_flush_coalesced_mmio_buffer(void);
 
-void cpu_flush_icache_range(hwaddr start, hwaddr len);
-
 typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
diff --git a/include/system/memory.h b/include/system/memory.h
index 1b2b0e5ce1e..19c7ff393c4 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2977,6 +2977,8 @@ void address_space_cache_invalidate(MemoryRegionCache *cache,
  */
 void address_space_cache_destroy(MemoryRegionCache *cache);
 
+void address_space_flush_icache_range(AddressSpace *as, hwaddr addr, hwaddr len);
+
 /* address_space_get_iotlb_entry: translate an address into an IOTLB
  * entry. Should be called from an RCU critical section.
  */
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 524af6f14a0..477661a0255 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1242,7 +1242,7 @@ static void rom_reset(void *unused)
          * that the instruction cache for that new region is clear, so that the
          * CPU definitely fetches its instructions from the just written data.
          */
-        cpu_flush_icache_range(rom->addr, rom->datasize);
+        address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
 
         trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
     }
diff --git a/system/physmem.c b/system/physmem.c
index 4745aaacd8f..29ac80af887 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3214,7 +3214,7 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
     return MEMTX_OK;
 }
 
-void cpu_flush_icache_range(hwaddr addr, hwaddr len)
+void address_space_flush_icache_range(AddressSpace *as, hwaddr addr, hwaddr len)
 {
     /*
      * This function should do the same thing as an icache flush that was
@@ -3229,8 +3229,7 @@ void cpu_flush_icache_range(hwaddr addr, hwaddr len)
     RCU_READ_LOCK_GUARD();
     while (len > 0) {
         hwaddr addr1, l = len;
-        MemoryRegion *mr = address_space_translate(&address_space_memory,
-                                                   addr, &addr1, &l, true,
+        MemoryRegion *mr = address_space_translate(as, addr, &addr1, &l, true,
                                                    MEMTXATTRS_UNSPECIFIED);
 
         if (!memory_region_supports_direct_access(mr)) {
-- 
2.51.0


