Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id naM+N8u7w2kRtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028232329B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261930.1554658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfe-0005ST-OB; Wed, 25 Mar 2026 10:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261930.1554658; Wed, 25 Mar 2026 10:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfe-0005Qi-L0; Wed, 25 Mar 2026 10:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1261930;
 Wed, 25 Mar 2026 10:41:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Lfd-0005DO-F8
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:41:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lfc-00CENL-RF
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:04 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbb7-e002-0a2a0a5209dd-0a2a450bd7b6-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:04 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbc0-ef63-0a2a450b0019-d155d035b01a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:04 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-667f8794e97so10873664a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 03:41:04 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm798491866b.17.2026.03.25.03.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:41:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435264; x=1775040064; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH93Di2V3lm2/5shCb0uuFhGc+gxIZ87omGm1UV+NOQ=;
        b=BrdwNUT0DUELUeYGQ+x4+zIw1Ckhb8sSJqKQEQbpfVMWzvfH0pqdrllpEw4TrbtRsu
         BdEOIKbgTmzoxDaHQyJbEqLBM80FAWt/B2vcUE+6zIGrgsRcFoJsrejSOrgNWQFu+/wn
         FwfsixoBN1UKsSJCMQpxmSZvOg1AAyZYusA9VtXPm0+0wTF/4r2Ab/a/336SupF4q4Og
         UswEpvhVJo3S/NRjPgK/c19pM/CSbjFjWHOQ9SjKFjNvWYyVVHco0YuobuTgV5SgZCB6
         OB3eGCB08z4H3pNifHFCq+4dEAXKCwo2H83R4DToIPo3Z9DoExVOxvz2FNjouGmN1BVt
         NmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435264; x=1775040064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JH93Di2V3lm2/5shCb0uuFhGc+gxIZ87omGm1UV+NOQ=;
        b=Eu04sQtK+Z1EeeD7mtvD+JYINKT8nQtZW+A0eOqbqiGDM3B+Zv+MsbXHI1zVgTjYvv
         gfU+zRXaafSwmQMR4Z0O7Ntd9hWSTg/Q805VZrUI89/qwIVBjLEcycw1NSXDsfbcm1b6
         RCOENv9nXWol+KdZ5p5WWWtL3FhyaoMFbCvq7GlsgHWE2+99L6npW6K7/6ZBJuSHUo2d
         B1lh/0datiQATtAXwT+UTKqTbdr6g6/1kvrt+t8eJYR6kNKgsOeLZWDhMrlYinwcPAjY
         GfGFjWc/XSC4R/cpw5hglk4KBh3wURcKIiT3xdDo+85o2Fv+dcvCUv/5DsE9WqsxuWZm
         H7LQ==
X-Gm-Message-State: AOJu0Yz6wy1OPRW0AuAgccqrNJkdgcONxF2vpRhuWCasdomGPSKf95hu
	ocfE/F1BbqoVuVGqTQxrZALyK+DCvi1cfN0f2eIkxN4TeUa538YEdIdzRXK2bw==
X-Gm-Gg: ATEYQzzljgXEGdQTlm7FlibIG3QQC3EmSVnECX77X2TGzxSuOgqg0VskoSEPWqGFNrR
	iJcO0C7RVkMgGzbUho47P7sbGJteN3Tcd8Mbmng/TkK2cvV2EYlifnTWEa/GPNN9wdGDX1FdPl/
	2vcNhd9ZWJBj58M7FpkrkTqpBMQyWJWkl/TZWXpsDV3ng/wk/1uUHmJwO9ij+ctg4O0uSO7AaM3
	5xh+Jsak9MsWtlHNhgRJrtSL6xNB87JMvQFYJUCShgFM+LUpw6hrzH5/oT1QCalmxKfiM5w9aF9
	RQlJING16n+SAUyVFyOl4gY3OqsHIUf4oVnpDLtQpmiZUyUY7iR3bf+3T88pi6VeMUTjKV3ijgQ
	Vzr3GHM5040XDuVwRjZSidn64iHFztzgMiuSMjNStVoFY3/zXZdXA4Jqq1R7XzrtPd8vgyTFdF9
	m/jrTo9MsreaTgi9xCAQXeZIBXyQ==
X-Received: by 2002:a17:907:e113:b0:b97:1d24:bfd7 with SMTP id a640c23a62f3a-b9a3f166610mr163314766b.6.1774435263745;
        Wed, 25 Mar 2026 03:41:03 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/4] xen/arm: its: collect quirk flags and honor dma-noncoherent
Date: Wed, 25 Mar 2026 12:38:30 +0200
Message-ID: <5b68fa0a8403ea60db3047f6505876bc03a41f3f.1774431310.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774431310.git.mykola_kvach@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774435264-A000B112-B5D61A7C/0/0
X-purgate-type: clean
X-purgate-size: 4195
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9028232329B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Replace the per-quirk init callback with declarative flags in
struct its_quirk, and introduce gicv3_its_collect_quirks() to gather
the effective workaround flags from both the IIDR-matched quirk entry
and the "dma-noncoherent" device-tree property.

This lets non-coherent platforms force non-cacheable ITS table
attributes even when no IIDR quirk entry matches.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 70 ++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9ba068c46f..00524b43a3 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -57,71 +57,87 @@ struct its_device {
  */
 struct its_quirk {
     const char *desc;
-    bool (*init)(struct host_its *hw_its);
     uint32_t iidr;
     uint32_t mask;
+    uint32_t flags;
 };
 
 static uint32_t __ro_after_init its_quirk_flags;
 
-static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
-{
-    its_quirk_flags |= HOST_ITS_WORKAROUND_NC_NS |
-        HOST_ITS_WORKAROUND_32BIT_ADDR;
-
-    return true;
-}
-
 static const struct its_quirk its_quirks[] = {
     {
-        .desc	= "R-Car Gen4",
-        .iidr	= 0x0201743b,
-        .mask	= 0xffffffffU,
-        .init	= gicv3_its_enable_quirk_gen4,
+        .desc  = "R-Car Gen4",
+        .iidr  = 0x0201743b,
+        .mask  = 0xffffffffU,
+        .flags = HOST_ITS_WORKAROUND_NC_NS |
+                 HOST_ITS_WORKAROUND_32BIT_ADDR,
     },
     {
         /* Sentinel. */
     }
 };
 
-static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
 {
-    const struct its_quirk *quirks = its_quirks;
+    const struct its_quirk *quirk = its_quirks;
 
-    for ( ; quirks->desc; quirks++ )
+    for ( ; quirk->desc; quirk++ )
     {
-        if ( quirks->iidr == (quirks->mask & iidr) )
-            return (struct its_quirk *)quirks;
+        if ( quirk->iidr != (quirk->mask & iidr) )
+            continue;
+
+        return quirk;
     }
 
     return NULL;
 }
 
-static void gicv3_its_enable_quirks(struct host_its *hw_its)
+static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
+                                         const struct its_quirk **matched_quirk)
 {
+    const struct its_quirk *quirk;
+    uint32_t flags = 0;
     uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
-    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
 
-    if ( quirk && quirk->init(hw_its) )
+    quirk = gicv3_its_find_quirk(iidr);
+    if ( quirk )
+        flags |= quirk->flags;
+
+    if ( hw_its->dt_node &&
+         dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
+        flags |= HOST_ITS_WORKAROUND_NC_NS;
+
+    if ( matched_quirk )
+        *matched_quirk = quirk;
+
+    return flags;
+}
+
+static void gicv3_its_enable_quirks(struct host_its *hw_its)
+{
+    const struct its_quirk *quirk;
+
+    its_quirk_flags = gicv3_its_collect_quirks(hw_its, &quirk);
+
+    if ( quirk )
         printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
 }
 
 static void gicv3_its_validate_quirks(void)
 {
-    const struct its_quirk *quirk = NULL, *prev = NULL;
+    uint32_t quirks, prev_quirks;
     const struct host_its *hw_its;
 
     if ( list_empty(&host_its_list) )
         return;
 
     hw_its = list_first_entry(&host_its_list, struct host_its, entry);
-    prev = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
+    prev_quirks = gicv3_its_collect_quirks(hw_its, NULL);
 
-    list_for_each_entry(hw_its, &host_its_list, entry)
+    list_for_each_entry_continue(hw_its, &host_its_list, entry)
     {
-        quirk = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
-        BUG_ON(quirk != prev);
-        prev = quirk;
+        quirks = gicv3_its_collect_quirks(hw_its, NULL);
+        BUG_ON(quirks != prev_quirks);
     }
 }
 
-- 
2.43.0


