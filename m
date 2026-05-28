Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKhcB0KMF2o5IwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53175EB3BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320866.1587997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObh-0007yj-2i; Thu, 28 May 2026 00:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320866.1587997; Thu, 28 May 2026 00:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObg-0007wC-UY; Thu, 28 May 2026 00:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1320866;
 Thu, 28 May 2026 00:28:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSObd-0007Wk-RX
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:28:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSObd-00CjPB-7o
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:28:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178bbc-bab6-0a2a0a5309dd-0a2a450cb27e-44
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:13 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c1d-62f1-0a2a450c0019-d155da2fe9f5-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:13 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bd124546379so1831533766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:28:13 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm655205266b.40.2026.05.27.17.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 17:28:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779928093; x=1780532893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Kal4i8q/2eoKCVkTinqzHb0hjEJZtqPmZO6RzxVrZQ=;
        b=StMe5j2h5UwGvZ9ubkam7kZv+4awpMtcGQ84J20x0L4ePmoGRr7KQl3+Qa02oqHafk
         XxWTsoE+b4aDTZVHgo1uCOFelxasFeVH7sbztcouPgdFJyTJ4lvraZ5QbsijRCfqSsIi
         GqYinMPKX5CzYbM5KceGlhN2Obbnhz71mBN4MLZyU7TJYiuQ2VN6AjuBUSBCKMnVWH0F
         xa3dcSqhkITN4PV1sKNypj+zfxiOMNL6h7V0klfzO797Z/WQclP3RHv6DLDptWkvTSaJ
         JYzzn2O+MDd8n+BUyb9j33AwvD/Off7lsA75lBhBtdKnIkmpxk9iji/zxdq/PCF88MIM
         82Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779928093; x=1780532893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Kal4i8q/2eoKCVkTinqzHb0hjEJZtqPmZO6RzxVrZQ=;
        b=NNKozPtArx3kwozlQ7mZPIaS8wcvJhYucQKq8HQwpGnDBl97ILIGnQZsBIyj1CTzqz
         Wo7nI1wfz2cA4rFb5oPUsJcKKMHXtJcuL68Eq0yo9UxIL0AYtEY++P4WZvAbfw3Cpt+J
         qxGiwRdZujn6zhDR3LkosxGmA04MgJ2/5X0JIc2gGmSGanhadiEKFoW7CsN04uBAhZMi
         H5if9HGGml7vZttZFqzwsIjNs9P2tIGc/VICwJeGo2VUUAz4ASEhzJ/lNM/MIwwN8Nxm
         wPrfrseCZN9u/T+AQh5uvukKh/LJHBfhVFUT9ShaV/p3W6botIgt3vwWnKB1lasuotNp
         9UCQ==
X-Gm-Message-State: AOJu0YwOcqvSoJaI9XKP5OclCGvP5mxP9/uMVq69v2sF12aCdqrw2+5q
	RcOzHrve92hiZtGuM0d80nUR1APNL4xDuLfaXDY3RpAY1bD1MLubfOAQ2MiO6g==
X-Gm-Gg: Acq92OH5u0RzQ/3qESR3LG039CcMyMonWUQyqWeBYC0Jf8A8ZdYPqKxI/Ept/6hb+ke
	KXFYjuIvlmCoXS8TMlk0YqScyi/WYZff3QFMd5apjzofF4uYY1KcLc1aEzNeIYyIz2+HF9dOPa4
	gdO6GgRGWYNIZY19AbgcSdYPqVSsMn6GcsZMnC7+Hae7YGvt31reZi01D6cdt4gL2Ey4wYyUt+/
	FmYu/7IrijA+IuzeD9b98KDzMpfQzUULSDWiXmlJVNZ2gC7oshlmVHyaiJ8r7tDToAUvE/3Rrs0
	YEucv7RHklMS2yiGJqzpj7MTht/PjEnr2eFt/3kR3M+F8HEiDCZ+laSjBHqeEd7qDJ37sBHkQGQ
	Dxo1aHFqseAvtTgYvdgYnp9ntlxnSQoFNZv1bsbvxLQe2Mvd7rzKbkhWm5lNphQ7mn6he2RNS6Z
	cHaM1VLTlIT73sgXMdMbZ8jVt2efEoRAiEdRjD
X-Received: by 2002:a17:906:dc8b:b0:bd5:7c2:7621 with SMTP id a640c23a62f3a-bdd26bd8e30mr1700694366b.48.1779928092408;
        Wed, 27 May 2026 17:28:12 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen/arm: its: refactor ITS quirk matching
Date: Thu, 28 May 2026 03:25:51 +0300
Message-ID: <df3219d050b32a406b3eb787c55a42785aa25379.1779922874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779922874.git.mykola_kvach@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779928093-DBB7CCF5-0E7DFF28/0/0
X-purgate-type: clean
X-purgate-size: 5079
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:email];
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
X-Rspamd-Queue-Id: C53175EB3BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

ITS quirks are currently matched only by IIDR and mask fields stored in
each table entry. That is too coarse for integrations where the same GIC
IP block can appear in several platforms but the workaround is only valid
for a subset of boards.

Replace the fixed IIDR fields with a generic match(hw_its, data) callback
and an opaque data pointer. Add an IIDR matcher as a reusable building
block and use it from the R-Car Gen4 matcher after checking the Renesas
machine compatibles. The R-Car Gen4 platform refinement is DT-only;
ACPI-discovered ITSes do not match it.

Keep first-match semantics explicit. Assert that non-sentinel entries
provide a matcher and that IIDR matching receives match data, but keep
runtime guards so a malformed table entry does not become a NULL function
call or NULL data dereference in non-debug builds. The matched entry still
supplies separate ITS and LPI flags; this patch only changes how the entry
is selected.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Replace v1's optional platform callback plus fixed IIDR/mask fields with
  a single generic match(hw_its, data) selector.
- Add a reusable IIDR matcher and use it after the R-Car Gen4
  machine-compatible checks.
- Document that the R-Car Gen4 quirk remains DT-only.
- Keep the split ITS and host LPI quirk scopes when applying the matched
  entry.
- Document first-match ordering in the lookup path and guard against
  entries without a match callback or IIDR match data.
---
 xen/arch/arm/gic-v3-its.c | 67 +++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index dc48a84789..e055914763 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -53,8 +53,8 @@ struct its_device {
 
 struct its_quirk {
     const char *desc;
-    uint32_t iidr;
-    uint32_t mask;
+    bool (*match)(const struct host_its *hw_its, const void *data);
+    const void *data;
     uint32_t its_flags;
     /*
      * lpi_flags are ORed into the global host LPI policy and must only
@@ -64,11 +64,48 @@ struct its_quirk {
     uint32_t lpi_flags;
 };
 
+struct its_quirk_match_iidr {
+    uint32_t iidr;
+    uint32_t mask;
+};
+
+static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
+                                        const void *data)
+{
+    const struct its_quirk_match_iidr *match;
+    uint32_t iidr;
+
+    ASSERT(data);
+
+    match = data;
+    iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
+
+    return (iidr & match->mask) == match->iidr;
+}
+
+static bool __init gicv3_its_match_quirk_gen4(const struct host_its *hw_its,
+                                              const void *data)
+{
+    if ( !hw_its->dt_node )
+        return false;
+
+    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
+         !dt_machine_is_compatible("renesas,r8a779g0") )
+        return false;
+
+    return gicv3_its_match_iidr(hw_its, data);
+}
+
+static const struct its_quirk_match_iidr rcar_gen4_iidr = {
+    .iidr = 0x0201743b,
+    .mask = 0xffffffffU,
+};
+
 static const struct its_quirk its_quirks[] = {
     {
-        .desc	= "R-Car Gen4",
-        .iidr	= 0x0201743b,
-        .mask	= 0xffffffffU,
+        .desc = "R-Car Gen4",
+        .match = gicv3_its_match_quirk_gen4,
+        .data = &rcar_gen4_iidr,
         .its_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
         .lpi_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
     },
@@ -77,18 +114,21 @@ static const struct its_quirk its_quirks[] = {
     }
 };
 
-static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *__init gicv3_its_find_quirk(
+    const struct host_its *hw_its)
 {
-    const struct its_quirk *quirks = its_quirks;
+    const struct its_quirk *quirk;
 
     /*
-     * The first matching quirk wins. More specific quirks must be listed
-     * before broader IIDR-only entries.
+     * The first matching quirk wins. Entries that match a specific platform
+     * must be listed before broader IIDR-only entries.
      */
-    for ( ; quirks->desc; quirks++ )
+    for ( quirk = its_quirks; quirk->desc; quirk++ )
     {
-        if ( quirks->iidr == (quirks->mask & iidr) )
-            return quirks;
+        ASSERT(quirk->match);
+
+        if ( quirk->match && quirk->match(hw_its, quirk->data) )
+            return quirk;
     }
 
     return NULL;
@@ -96,8 +136,7 @@ static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
 
 static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
-    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
-    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
+    const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
 
     if ( quirk )
     {
-- 
2.43.0


