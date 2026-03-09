Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAeVD41srml3EAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7B234564
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249073.1546594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMD-0005n6-Fu; Mon, 09 Mar 2026 06:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249073.1546594; Mon, 09 Mar 2026 06:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzUMD-0005ki-Co; Mon, 09 Mar 2026 06:44:49 +0000
Received: by outflank-mailman (input) for mailman id 1249073;
 Mon, 09 Mar 2026 06:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UF23=BJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vzUMB-0005KI-SB
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 06:44:47 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 764f911f-1b83-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 07:44:47 +0100 (CET)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-56afafef7aeso3209087e0c.3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Mar 2026 23:44:47 -0700 (PDT)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ffe8922cdfsm8333849137.5.2026.03.08.23.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:44:44 -0700 (PDT)
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
X-Inumbo-ID: 764f911f-1b83-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773038686; x=1773643486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgO9zG7fMna9CoPh8ghnxcTLAQlMFEOZkqL0utLfYyE=;
        b=ENpG5V5usi1dQDsSbkonf3DtNFki4VYUf8duZcAKBOGI1W+/hpmf8RIdgKSlgUOc+I
         KHt+8MSMlTqcyJZ203F3eUaJvoJKmilORXBcZC9qHyH7ExDhM0/7k4X/TQextuc52yic
         3geaiCqD6Qh6sObjfdJ7yc4l+Cm2dzcqOJ+BEO2Na9IE5+kuZdAnkH9lXYIgp/j06u9Q
         r+IKlIpOgp1NUGjbuBuyEc9GLUn/TuOSNBpLyGpmsVC1UUWxTal2TbFz8gmvBB6uedY1
         cRPqPrWcSxrjKLSeJESxJuGJIn94BcVY5+tHhOvXjFahBX8oKrUe1Er9KE3RlPicubpb
         Bm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038686; x=1773643486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xgO9zG7fMna9CoPh8ghnxcTLAQlMFEOZkqL0utLfYyE=;
        b=jPQKXiqiIjLK6re0Ji0NSMQ2Ev9yuIJPs8K8pV16r+HoMitIOCP5lgGNYOQo1L5yvh
         LwK46gtkBwvQi8siScsng/4/II167B7GbQck22bZ59gYEsGN7ZN45KlYQagiT161hxi7
         jKkZkBBRj9r85f+fXZI1UjclMiyH4vJc0YEd5tvCZpJGle5Vu2kae5wxwkG8cYePhjsd
         r296/z5rPpBUSbiX197iPLnTCrolnl6vKc+AG8KDCUx2m1+Gpglsx4PSwznDrGqLMOh7
         6gA9uV4PWaLbMNYp9EeNkpnZGHKgmfPcXjrg86fRjivIvvAzISeiK9kmuBFwlow9nL88
         WMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiok5T6AQCmyMKO1x+yRDeh6IkAK8tgoZx47+Qxg+hTYeMB4J3Gzvsr05IgAg/hzlrObxIStsS8JI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUeG6ezip/TSSlmgFThW1cNYouyAX5uvExPOJYHU27jrjnZ6C9
	Oo/aplumbPVL/RnMnxjHjuHDD8ZVPJ8ZO1BxrfU+CMjyytb7JUnWmkyU
X-Gm-Gg: ATEYQzzZLQ6kIZsrTf+KlsMgHNzNd/z8mm7INEwOxv832s4dGQZqxlFj/PEQgsbbd+P
	4fXLi3mmqyvXa68OicLK+kalCHmMkArVHjbJNeMM9K+1HuMgdmF4MJMhs4SdN2Of5ekT+VDLryS
	SsHMMhps77A95JilTM0MEgeo96sXWpAJAWAdUEVFDyFkpIa5B29jv0C5ccH8FBYv5b8buWlgX2w
	tikdx8ZpNG2ledDYgSXOfjHePgV1TQgYENnh6r/gaN3JvNw835aU++v6lSEF7N2SjhkNe+d2gxF
	029wjg6TiAGzxZ4jB4Pt+2KEBkyyH0fqys55sfg7OwmVk/wviHxlzO/SnJW/5ZE4gtYCnvYjw1u
	KSJUu2ZV7Rq/V7xCD4xjb+RWw7flY8RyKRJ7KyKlmPO/A6mMsjTsdWPw6Zc322xVFjZh/YYeiB1
	kWjQsfRVGl6LHqJApOdKurt5oYuQHvJYcJjQsNkFSF/hNHZy/iC3QaS2x5qcmWmfLFqqOR
X-Received: by 2002:a05:6102:c86:b0:5ff:a606:3cfc with SMTP id ada2fe7eead31-5ffe61248dfmr4759508137.21.1773038685979;
        Sun, 08 Mar 2026 23:44:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 2/5] xen: mapcache: Add function to check if the mapcache is enabled
Date: Mon,  9 Mar 2026 07:44:32 +0100
Message-ID: <20260309064436.51860-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309064436.51860-1-edgar.iglesias@gmail.com>
References: <20260309064436.51860-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D5C7B234564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nongnu.org,kernel.org,xenproject.org,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
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

Add function to check if the mapcache is enabled.
No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


