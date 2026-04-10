Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MmpLT012WmjnQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:37:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525F3DB1ED
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 19:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279641.1563970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFmO-0002eb-Ey; Fri, 10 Apr 2026 17:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279641.1563970; Fri, 10 Apr 2026 17:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBFmO-0002d9-Be; Fri, 10 Apr 2026 17:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1279641;
 Fri, 10 Apr 2026 17:36:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wBFmN-0002d3-70
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:36:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBFmM-00FFGg-JH
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 19:36:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d93503-bab6-0a2a0a5309dd-0a2a45039306-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 19:36:26 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d9351a-02b3-0a2a45030019-d155d02ba5af-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 19:36:26 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-66d65646c65so11742a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:36:26 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.238])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6708ccd48d0sm519318a12.28.2026.04.10.10.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 10:36:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775842586; x=1776447386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8RgKnZUaHYG07CM+muNZWfpQmLhMpF3N7LZtrx/ros=;
        b=XtA5WWzqA0SJrc64RubbQ8qbUcdZWWYOB26vPGR4dg4YL7NKJO/INfOX1hjXmFxMrt
         7FjNqXgYH3InTvwVXEfzrlZ5MCnSlWbz4lf9/URwBlWBAG2fl6oK8vxlrWLefUTKDonm
         7MfRAYvCwHoCalO4gOIv7T62Eeq8uyiDK668HkkIx+tz6RsAJ3R52IB28wmtr7JpHoKq
         BrInBat/pGR7Sdl+41f+oURM9jpBplhxxXHn9xqV14suH45L07IrhD6Stc7bZEOc6rvg
         FO8aKfB2jnbtigJ/l8JY3fVulVjcDIAfHuFdAiNYhnWbP4DsyqOc2kEBUKL+is+OOp00
         t6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775842586; x=1776447386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8RgKnZUaHYG07CM+muNZWfpQmLhMpF3N7LZtrx/ros=;
        b=YRERlZa1AjCcRoHabKpe2yM5yEC/OtZX7XU4MZlmecb6HaGE+kFbra4u5gB2TS6XRy
         jippfgxzmR8tkSpfbIgSQL8zCkZKsw7I+a4DRzc50SZCg/ZHfe6S/NexQ0KxFXy5o1B7
         qZ6MYi0K/WsUjt4Ev5WJ9nCVp+MfcetiUNppfJQGOn1SdsmivATOaXcMbsexWyJCfT1U
         k8tGuVtT6i2B/ZeFGK+pEjhqzA2SvTZXnR4nk49jhFRtTWQq58a20I79KA3agQ20vX/F
         fmbDQ5+Of2YCkKl2ohcvcCL3EDLHKW0xFGKuzVxKK1CRU8iykfkB0C1Aa/MJ25Jk/1f+
         Mgbw==
X-Gm-Message-State: AOJu0YziSbMyojdZJTvM678UPwJBkGTLtTJpJIar3vJrOXZMkMwicfQX
	7AgaNHgY2ElcEfAbWr/sNER+MIS1wMe/MNv0lE7A9Odq7iE8xBeU8HMEeCiWFiO1
X-Gm-Gg: AeBDietVsOMnUyLVhlztxtxUtMoksGpHAwmORLQjFS4Nl3Vdb+xx3miasqgUQN/z/ci
	i9LG8oZYGVgazuJafPKZ3sMWvOUeRMVTJYZOWAi3ZpAhdMx+2lEdhVwrFg1LXR5vODdJpKkmuIj
	4VjUl8xfCM5CNR5R9WAl5Jtg7g5bMr5NDVdpDDLbS24bhdb+83RdZDha20El8Ijud95vslLMx9v
	YIqdtcz9ozrZ6uP3QqPB8dwhYW43fE6xzHEY2S8AJBLs4KCweCOF0TfcK1w+dvWZiZkFzpxEaJM
	/tsji5y3ZGAkq3jnw4AIx1ip4+/rAEOPlCbSKNfNUcgEESwOYwe0opT9r8/T6G2k5mfH7ru3ok0
	5BBz3GKS+rUFm8LeW2O4tj+RdUZgdPDaIii3MpsBabR+jggZChcFNKircQTbUSauqwiYO1s6ADt
	MYiLXtPv2Sr/85bMLkfJh5gNE8NPHe4TfyW10xMw==
X-Received: by 2002:a05:6402:21d2:b0:66e:3f9b:4e03 with SMTP id 4fb4d7f45d1cf-67076f7ceeamr1568951a12.12.1775842585411;
        Fri, 10 Apr 2026 10:36:25 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v2] arm/gicv3: Decode cacheability fields before comparing
Date: Fri, 10 Apr 2026 20:34:11 +0300
Message-ID: <7c20230fcd388ebe398ce19a21a1cd3c2c73d5fa.1775839987.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1775842586-4251AC9A-C0E6E45F/0/0
X-purgate-type: clean
X-purgate-size: 2946
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1525F3DB1ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

GITS_BASER_INNER_CACHEABILITY_MASK and
GICR_PROPBASER_INNER_CACHEABILITY_MASK are shifted masks. Comparing the
masked but unshifted values against GIC_BASER_CACHE_nC, which is an
unshifted enum value, leads to incorrect detection of non-cacheable
GITS_CBASER command queue, GITS_BASER tables, and GICR_PROPBASER
mappings.

Use MASK_EXTR() to decode these cacheability fields before comparing
against GIC_BASER_CACHE_nC, so the backing memory is flushed when
required.

Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
Fixes: 05238012b86d ("ARM: GICv3 ITS: allocate device and collection table")
Fixes: c9b939863c89 ("ARM: GICv3: allocate LPI pending and property table")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- use MASK_EXTR() instead of open-coding the BASER field shift
- fix the analogous PROPBASER cacheability comparison in
  gicv3_lpi_set_proptable()
- fix the CBASER command queue cacheability check as well
---
 xen/arch/arm/gic-v3-its.c | 6 ++++--
 xen/arch/arm/gic-v3-lpi.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9ba068c46f..e87465d2ff 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
      * If the command queue memory is mapped as uncached, we need to flush
      * it on every access.
      */
-    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
+    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=
+         GIC_BASER_CACHE_nC )
     {
         its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
         printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
@@ -496,7 +497,8 @@ retry:
         }
         attr = regc & BASER_ATTR_MASK;
     }
-    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+    if ( MASK_EXTR(regc, GITS_BASER_INNER_CACHEABILITY_MASK) <=
+         GIC_BASER_CACHE_nC )
         clean_and_invalidate_dcache_va_range(buffer, table_size);
 
     /* If the host accepted our page size, we are done. */
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de5052e5cf..9ee338edc2 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -351,7 +351,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
     }
 
     /* Remember that we have to flush the property table if non-cacheable. */
-    if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+    if ( MASK_EXTR(reg, GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=
+         GIC_BASER_CACHE_nC )
     {
         lpi_data.flags |= LPI_PROPTABLE_NEEDS_FLUSHING;
         /* Update the redistributors knowledge about the attributes. */
-- 
2.43.0


