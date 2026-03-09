Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC9gORsTr2kiNgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FBD23EA8B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249626.1547101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSU-0008DA-QO; Mon, 09 Mar 2026 18:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249626.1547101; Mon, 09 Mar 2026 18:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSU-0008BK-Lr; Mon, 09 Mar 2026 18:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1249626;
 Mon, 09 Mar 2026 18:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzfST-0007JG-SA
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:36:01 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d23a8f3a-1be6-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 19:36:01 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso28017405e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:36:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad977f8sm28487057f8f.9.2026.03.09.11.35.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 11:35:59 -0700 (PDT)
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
X-Inumbo-ID: d23a8f3a-1be6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081360; x=1773686160; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frENE9FJEJIJp1aKXCLyQE1na5fHvR5E0RLXQsidK/I=;
        b=os2dCYM2iWuRmBmvtuR6wM13CdxyRW3KIePfht+f1sk+yiLI56doQBPzj4ypfiDw64
         WPcYrFF6zb8b8aGH3dvw17K0Acu/JV0oBdhiWpDkslu9FS7NmyD40wdhme3M1Y3qgq3j
         2g08aNgFkuW5W/47CiDKxSwaHy9gCSQSmH6W3xbJpPaovvFLzlX4MxsuZf6d9cgefu3f
         QcL9pzdOVxHTZdN3wvdUBBHbNZ14kolnEzDsPSkjwWdGkBN2/oTmZJdv7YOkxtZHIFL8
         fVYQ3tEcYxhRrwxlg+UsD7N4frQ1KtFPv9pj3IciXXkz/yseuNulVNnpXBQPwko1PAQF
         Rf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081360; x=1773686160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frENE9FJEJIJp1aKXCLyQE1na5fHvR5E0RLXQsidK/I=;
        b=hDgi6V2WqLex5z+mCq2HIC4UqaoMEbBTSQGPgFqirdQ2iL06r+yDpsmhwVJlPXSsxD
         nldTNBxYQKzNZWjtryd99PjYA7rd/JBnD85rkfDHoomnGygHjw88mm4NSv0NNp8ACM4T
         J+axL2A1IodAj2roe8CnoCUYNWUyuq/O22COsPxInvDaF8qo3/7iFfl3p25/iiyYHY+8
         tb4CaiAr/1A1N7z6JLR8r6wQM4doYSYKd41EoorzVKT8lv1oMXF5UoTerWJkI+oh2nWa
         AQ9vcc+9Zs/W5bREA7/xDDE38IgQ/dM24lkR8n/yt9IG+sQAg+C6hhNu+GJVtK8Llxet
         zBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPZ1CdnEN7/jcPMY71qqDgwjQfEpRLJ2t3AZgIuHOzQboRLT292qHLbKn3//3ezjLnOJFxomkxcsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIqN84mLl532odponTioOswoDGM9dpz1D/gdFBcUC6wa9Mlxpr
	+w9iBFf73L4RHjSfDqIBIuxwty3NZ9CzkBTlRMtAy34WyMKA0IuqhxY1UeWC4qgBJZ8=
X-Gm-Gg: ATEYQzxrVAS7jPaNI7KyP8iKbxfbxXY8ckqudVHh4HU/grU28WaXHeuJGpDDMImrNGy
	Pez1PHz4TRGrg4ZF0EIwGDXqrWlybew1ykjKOabgvWg16NjyhoSQmq0M6tp98RU26PPosMLbp5s
	Zl8uvJRRTilXuHMilQOgCUzyZTQEBpu3dYX9zcHvuJ01HP092MxvYcs6QwCvTNnaUwCG54uLLja
	DFO99wAuc1s9xYAjkUwE5OkwcghagyRk/LFfF1mqksvIZUTiFk0iRNMgG65sghDByx/+iaX6tfY
	vUIQ5xGiY8Q/zOmpHWz1kq6aEtE79HZeZtivyd9VHLpzWeoYYUS/UBW3GJOLMpzW1QvagvAgoU2
	GrCcMbWpdP35G4EhqySPIsGiDeM4jk+LWzAbYCzXYC1+7kdrUQHR0H2T7PQQPX6lg0j4znAPn0W
	fRE046Zk0Q6qhsgumo8TnBk87PenROxv/rHdLMwP4z/oIBr2lLjY5oyHouLVloSROI9OU/eMbE
X-Received: by 2002:a05:6000:2681:b0:439:be4e:6e58 with SMTP id ffacd0b85a97d-439da891d17mr20945001f8f.47.1773081360467;
        Mon, 09 Mar 2026 11:36:00 -0700 (PDT)
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
Subject: [PATCH v2 3/4] system/xen: Constify various MemoryRegion arguments
Date: Mon,  9 Mar 2026 19:35:34 +0100
Message-ID: <20260309183536.88976-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309183536.88976-1-philmd@linaro.org>
References: <20260309183536.88976-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A0FBD23EA8B
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
---
 include/system/xen-mapcache.h | 2 +-
 include/system/xen.h          | 6 +++---
 hw/xen/xen-hvm-common.c       | 8 ++++----
 hw/xen/xen-mapcache.c         | 2 +-
 hw/xen/xen_stubs.c            | 6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/system/xen-mapcache.h b/include/system/xen-mapcache.h
index c46190dd0ce..114d1929c80 100644
--- a/include/system/xen-mapcache.h
+++ b/include/system/xen-mapcache.h
@@ -16,7 +16,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
 bool xen_map_cache_enabled(void);
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
+uint8_t *xen_map_cache(const MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
                        ram_addr_t ram_addr_offset,
                        uint8_t lock, bool dma,
                        bool is_write);
diff --git a/include/system/xen.h b/include/system/xen.h
index 9a7c53f2838..43b857e4d15 100644
--- a/include/system/xen.h
+++ b/include/system/xen.h
@@ -30,7 +30,7 @@ extern bool xen_allowed;
 
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
-bool xen_mr_is_memory(MemoryRegion *mr);
-bool xen_mr_is_grants(MemoryRegion *mr);
+                   const MemoryRegion *mr, Error **errp);
+bool xen_mr_is_memory(const MemoryRegion *mr);
+bool xen_mr_is_grants(const MemoryRegion *mr);
 #endif
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index eb7f6270a0d..62d88804c43 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -23,19 +23,19 @@
 MemoryRegion xen_memory, xen_grants;
 
 /* Check for any kind of xen memory, foreign mappings or grants.  */
-bool xen_mr_is_memory(MemoryRegion *mr)
+bool xen_mr_is_memory(const MemoryRegion *mr)
 {
     return mr == &xen_memory || mr == &xen_grants;
 }
 
 /* Check specifically for grants.  */
-bool xen_mr_is_grants(MemoryRegion *mr)
+bool xen_mr_is_grants(const MemoryRegion *mr)
 {
     return mr == &xen_grants;
 }
 
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
-                   Error **errp)
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   const MemoryRegion *mr, Error **errp)
 {
     unsigned target_page_bits = qemu_target_page_bits();
     unsigned long nr_pfn;
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index a3c162cd4c6..85cf0cf359c 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -460,7 +460,7 @@ tryagain:
     return mc->last_entry->vaddr_base + address_offset;
 }
 
-uint8_t *xen_map_cache(MemoryRegion *mr,
+uint8_t *xen_map_cache(const MemoryRegion *mr,
                        hwaddr phys_addr, hwaddr size,
                        ram_addr_t ram_addr_offset,
                        uint8_t lock, bool dma,
diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
index a39efb5062d..f830768d998 100644
--- a/hw/xen/xen_stubs.c
+++ b/hw/xen/xen_stubs.c
@@ -19,12 +19,12 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 }
 
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp)
+                   const MemoryRegion *mr, Error **errp)
 {
     g_assert_not_reached();
 }
 
-bool xen_mr_is_memory(MemoryRegion *mr)
+bool xen_mr_is_memory(const MemoryRegion *mr)
 {
     g_assert_not_reached();
 }
@@ -44,7 +44,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
     g_assert_not_reached();
 }
 
-uint8_t *xen_map_cache(MemoryRegion *mr,
+uint8_t *xen_map_cache(const MemoryRegion *mr,
                        hwaddr phys_addr,
                        hwaddr size,
                        ram_addr_t ram_addr_offset,
-- 
2.53.0


