Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDphIRoTr2kiNgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DA23EA83
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 19:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249619.1547083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSH-0007bI-CY; Mon, 09 Mar 2026 18:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249619.1547083; Mon, 09 Mar 2026 18:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzfSH-0007Ya-8z; Mon, 09 Mar 2026 18:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1249619;
 Mon, 09 Mar 2026 18:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzfSF-0007JG-Hn
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 18:35:47 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a96f7e-1be6-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 19:35:46 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so12503795e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 11:35:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a6bb86sm9367755e9.1.2026.03.09.11.35.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Mar 2026 11:35:45 -0700 (PDT)
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
X-Inumbo-ID: c9a96f7e-1be6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773081346; x=1773686146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA3KiBRZDEy+tGK0VBSBg6K/vS9OJsxKrmQTjGkh/tM=;
        b=vHxbDQhCv7R2l0m7nn8ppI10Jd/khXsW9VNS7owUnYjELJP8p9FXXUZFAJO8qzhfi8
         Ss5YV05uGA/L7PlV4CUAB2psoUGlK9x2IhRzPuxagzIVfrC67UQgsUDlC+8iew/GnQNE
         bw05RPSVofq6tmTCegQw+vUq1Fg+GvrGYadn5Xam/SPwklpS+ymL5iVmxC7U8bJjQkys
         TylXDZijOTjF7bcu7+J/fMnS/ftHFsO4sVtjMgvSJx6AvyupRW+ssDM++jXK+rBJYnfg
         P3myScAacVjpluoKtrkzghoiDrfHUp91ZQzwvpwH6BcFhF414pso0Wu9Wq4KT0roPcxA
         WULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081346; x=1773686146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xA3KiBRZDEy+tGK0VBSBg6K/vS9OJsxKrmQTjGkh/tM=;
        b=fc5+B01u0CIn1N7KIQmwd3puovGFjfOBUuG5YJYTkfnAD6X8PufBq8Msud8MoFSwm7
         qLpkfWVRYrVrqEqSvJEjhRmhv5S/9kjQOOxN6hhXzrekVInFxwd2zAVKTnPOUuHrMIO0
         TsGqkqmfDDppk7QimdUF2YGckvwi51Z83vPkGJS3j2frPf98O9p693cDnaA4kwHeFNpe
         jyARv3jmujUziYOb8LBk3bfNm+SnK8ZEt+BtDzyQVeAikM29IPH4AFdcKfGSQnCjUJ2S
         PMtYhYI4p+JXaF5fQOCdeJziAApCzTZTECiOmoJiW3mvnLZGu727n717wjicXs7c7xWL
         V+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJSHVdT5pGyK1v4+rWLQ2n3o39JqCGP+XQtU/SoC8xVscYxGxO14rZU0KoEaLvCY6w8npw3AwwAbs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyH3eJiNbf7xywiJhRY80DwjRlEHNs/feEPrU/9ZTo6R5eqE1Iw
	DzyMkF94SpE5WTjZO9q3ClBDX05a5QDycXVrnGNnrcTq0NJVICjcZtkYVnLtUO8/lKPRxpzSURs
	MaUV6wOI=
X-Gm-Gg: ATEYQzw7oDthjzhXcXUX5xR263W9mMENckvqHJg69G/a1IfYs/JsesJiZbujWVYb597
	O78NbSSAa7NNsJdHji9zNtUa5NEo5fEPvTijGN5vosPG3H/Gl3F4z/Bz3TayXfTkmqpjY4hr8yU
	eOKAOAGksfnn4COHSQkVPlCfcvyN6BKU6wUn6JmJjFiPn/YAdjeK9JXgDY//LWJh5PSB8NQTFuc
	mRaLN4dGOor9DC2syZ6+5pDhGFMasMke3Q8o82iIwY+QV9yAY/EUscaSlfA6wV6rzuaJeAX2OfI
	aw6QBqIMBqBHYm/LN8ngs3GDVDl971r8u0wr+Zh147ZyvHvKwWoIzvNdtEuVmaOUNLK1ha+SunB
	kYV61aHopIH69RbtBwpPv3lQ4OWfwuZCMAqX+XeWDkNFSutcv2vibdiUYhETD1bJSdvKPKGMXLj
	tULYJO5CVwr/KLC+sAEwvMTAFrBcdMezivCkEurt4iZdeC+6wllBgVYVdGXVCnNmbEwmcum0j/
X-Received: by 2002:a05:600c:3b8e:b0:485:35a4:939c with SMTP id 5b1f17b1804b1-48535a4a188mr113829175e9.29.1773081346102;
        Mon, 09 Mar 2026 11:35:46 -0700 (PDT)
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
Subject: [PATCH v2 1/4] system/ramblock: Constify various RAMBlock arguments
Date: Mon,  9 Mar 2026 19:35:32 +0100
Message-ID: <20260309183536.88976-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309183536.88976-1-philmd@linaro.org>
References: <20260309183536.88976-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C5DA23EA83
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

Mark the RAMBlock structure const when is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/system/ramblock.h | 28 ++++++++++++++--------------
 stubs/physmem.c           |  2 +-
 stubs/ram-block.c         |  6 +++---
 system/physmem.c          | 28 ++++++++++++++--------------
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/system/ramblock.h b/include/system/ramblock.h
index e9f58ac0457..4435f8d55fe 100644
--- a/include/system/ramblock.h
+++ b/include/system/ramblock.h
@@ -154,26 +154,26 @@ RAMBlock *qemu_ram_block_by_name(const char *name);
  */
 RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
                                    ram_addr_t *offset);
-ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host);
+ram_addr_t qemu_ram_block_host_offset(const RAMBlock *rb, void *host);
 void qemu_ram_set_idstr(RAMBlock *block, const char *name, DeviceState *dev);
 void qemu_ram_unset_idstr(RAMBlock *block);
-const char *qemu_ram_get_idstr(RAMBlock *rb);
-void *qemu_ram_get_host_addr(RAMBlock *rb);
-ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
-ram_addr_t qemu_ram_get_fd_offset(RAMBlock *rb);
-ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
-ram_addr_t qemu_ram_get_max_length(RAMBlock *rb);
-bool qemu_ram_is_shared(RAMBlock *rb);
-bool qemu_ram_is_noreserve(RAMBlock *rb);
-bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
+const char *qemu_ram_get_idstr(const RAMBlock *rb);
+void *qemu_ram_get_host_addr(const RAMBlock *rb);
+ram_addr_t qemu_ram_get_offset(const RAMBlock *rb);
+ram_addr_t qemu_ram_get_fd_offset(const RAMBlock *rb);
+ram_addr_t qemu_ram_get_used_length(const RAMBlock *rb);
+ram_addr_t qemu_ram_get_max_length(const RAMBlock *rb);
+bool qemu_ram_is_shared(const RAMBlock *rb);
+bool qemu_ram_is_noreserve(const RAMBlock *rb);
+bool qemu_ram_is_uf_zeroable(const RAMBlock *rb);
 void qemu_ram_set_uf_zeroable(RAMBlock *rb);
-bool qemu_ram_is_migratable(RAMBlock *rb);
+bool qemu_ram_is_migratable(const RAMBlock *rb);
 void qemu_ram_set_migratable(RAMBlock *rb);
 void qemu_ram_unset_migratable(RAMBlock *rb);
-bool qemu_ram_is_named_file(RAMBlock *rb);
-int qemu_ram_get_fd(RAMBlock *rb);
+bool qemu_ram_is_named_file(const RAMBlock *rb);
+int qemu_ram_get_fd(const RAMBlock *rb);
 
-size_t qemu_ram_pagesize(RAMBlock *block);
+size_t qemu_ram_pagesize(const RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
 #include "exec/target_page.h"
 #include "exec/hwaddr.h"
diff --git a/stubs/physmem.c b/stubs/physmem.c
index 14667f2bd8f..2eca06ab6d6 100644
--- a/stubs/physmem.c
+++ b/stubs/physmem.c
@@ -7,7 +7,7 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
     return NULL;
 }
 
-int qemu_ram_get_fd(RAMBlock *rb)
+int qemu_ram_get_fd(const RAMBlock *rb)
 {
     return -1;
 }
diff --git a/stubs/ram-block.c b/stubs/ram-block.c
index 8790a59593e..1c79e447ff0 100644
--- a/stubs/ram-block.c
+++ b/stubs/ram-block.c
@@ -3,17 +3,17 @@
 #include "system/ramblock.h"
 #include "system/memory.h"
 
-void *qemu_ram_get_host_addr(RAMBlock *rb)
+void *qemu_ram_get_host_addr(const RAMBlock *rb)
 {
     return 0;
 }
 
-ram_addr_t qemu_ram_get_offset(RAMBlock *rb)
+ram_addr_t qemu_ram_get_offset(const RAMBlock *rb)
 {
     return 0;
 }
 
-ram_addr_t qemu_ram_get_used_length(RAMBlock *rb)
+ram_addr_t qemu_ram_get_used_length(const RAMBlock *rb)
 {
     return 0;
 }
diff --git a/system/physmem.c b/system/physmem.c
index 7eecd818770..e5390d09bef 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1859,48 +1859,48 @@ static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
     }
 }
 
-const char *qemu_ram_get_idstr(RAMBlock *rb)
+const char *qemu_ram_get_idstr(const RAMBlock *rb)
 {
     return rb->idstr;
 }
 
-void *qemu_ram_get_host_addr(RAMBlock *rb)
+void *qemu_ram_get_host_addr(const RAMBlock *rb)
 {
     return rb->host;
 }
 
-ram_addr_t qemu_ram_get_offset(RAMBlock *rb)
+ram_addr_t qemu_ram_get_offset(const RAMBlock *rb)
 {
     return rb->offset;
 }
 
-ram_addr_t qemu_ram_get_fd_offset(RAMBlock *rb)
+ram_addr_t qemu_ram_get_fd_offset(const RAMBlock *rb)
 {
     return rb->fd_offset;
 }
 
-ram_addr_t qemu_ram_get_used_length(RAMBlock *rb)
+ram_addr_t qemu_ram_get_used_length(const RAMBlock *rb)
 {
     return rb->used_length;
 }
 
-ram_addr_t qemu_ram_get_max_length(RAMBlock *rb)
+ram_addr_t qemu_ram_get_max_length(const RAMBlock *rb)
 {
     return rb->max_length;
 }
 
-bool qemu_ram_is_shared(RAMBlock *rb)
+bool qemu_ram_is_shared(const RAMBlock *rb)
 {
     return rb->flags & RAM_SHARED;
 }
 
-bool qemu_ram_is_noreserve(RAMBlock *rb)
+bool qemu_ram_is_noreserve(const RAMBlock *rb)
 {
     return rb->flags & RAM_NORESERVE;
 }
 
 /* Note: Only set at the start of postcopy */
-bool qemu_ram_is_uf_zeroable(RAMBlock *rb)
+bool qemu_ram_is_uf_zeroable(const RAMBlock *rb)
 {
     return rb->flags & RAM_UF_ZEROPAGE;
 }
@@ -1910,7 +1910,7 @@ void qemu_ram_set_uf_zeroable(RAMBlock *rb)
     rb->flags |= RAM_UF_ZEROPAGE;
 }
 
-bool qemu_ram_is_migratable(RAMBlock *rb)
+bool qemu_ram_is_migratable(const RAMBlock *rb)
 {
     return rb->flags & RAM_MIGRATABLE;
 }
@@ -1925,12 +1925,12 @@ void qemu_ram_unset_migratable(RAMBlock *rb)
     rb->flags &= ~RAM_MIGRATABLE;
 }
 
-bool qemu_ram_is_named_file(RAMBlock *rb)
+bool qemu_ram_is_named_file(const RAMBlock *rb)
 {
     return rb->flags & RAM_NAMED_FILE;
 }
 
-int qemu_ram_get_fd(RAMBlock *rb)
+int qemu_ram_get_fd(const RAMBlock *rb)
 {
     return rb->fd;
 }
@@ -1987,7 +1987,7 @@ static char *cpr_name(MemoryRegion *mr)
     }
 }
 
-size_t qemu_ram_pagesize(RAMBlock *rb)
+size_t qemu_ram_pagesize(const RAMBlock *rb)
 {
     return rb->page_size;
 }
@@ -2772,7 +2772,7 @@ void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr)
 }
 
 /* Return the offset of a hostpointer within a ramblock */
-ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host)
+ram_addr_t qemu_ram_block_host_offset(const RAMBlock *rb, void *host)
 {
     ram_addr_t res = (uint8_t *)host - (uint8_t *)rb->host;
     assert((uintptr_t)host >= (uintptr_t)rb->host);
-- 
2.53.0


