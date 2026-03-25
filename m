Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN/7NMu7w2kKtwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDE32329A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 11:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261931.1554667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfg-0005iP-5G; Wed, 25 Mar 2026 10:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261931.1554667; Wed, 25 Mar 2026 10:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Lfg-0005f7-0m; Wed, 25 Mar 2026 10:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1261931;
 Wed, 25 Mar 2026 10:41:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5Lfe-0005SP-Sq
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:41:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Lfc-00CE42-N8
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 11:41:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbb7-5cb7-0a2a0a5109dd-0a2a4501c0c6-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:06 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c3bbc2-6400-0a2a45010019-d155d035c405-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:41:06 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-667de793310so4106970a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 03:41:06 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm798491866b.17.2026.03.25.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:41:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774435265; x=1775040065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CikO432tEUr8bFn5h+cx0SZD0cYZGcKrs8DBIckuAUw=;
        b=Ox2knnDiceog+aUcmcN1wGAS7FWppjuBH4ATtPiVz1+cftsBSZiivqwebKm9dj8hZ5
         eN0gtlda9SAJU0VTbl+3IY7Xu+DmwCTkF4WraGbKqn6UA1qwvLwvNcanRR/ccqOAe9Cw
         pWS2aFGaL0DqviBgcAFJIcmXokxjAYrgeMG6b9dA+N8PkxiUZpkJYqu9H1yTOfGMLrkN
         oMYug/Ptde0k0HYKprrAu5lDAh6dIy09HstRvrpIJ79aptFEf49nORf3cqd8edqGPnb/
         Rkn00+PMwQ6u2cibQ9EE/TL+DhgxEE+4c2lrxsT0rIGw5ExxITsWr3gWwVdUzBwl/X6N
         sQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435265; x=1775040065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CikO432tEUr8bFn5h+cx0SZD0cYZGcKrs8DBIckuAUw=;
        b=siSna0PFoZGIyBOilBs8UvRH6Pa+TzO/634SdUtqXC3zgF//VgtoP+Y2vnSSERD4KC
         ld1lgfr0/urCrVl4iUyJ6GhP6nDrdnL1QXhZWQsOfpJ4/ObroU7RErIVBlQiVEKaulTV
         A6oV1tn4U2y3nk8GQk+iBg9v0Vs1P/l7lS+oHLgmHqbGkjmKcFLe7BqgN9lcsEqWdvIj
         X8Gl3vwjIyFUr+qpi6lf8h8SjvLwoTn8R8QqfoHJ4dy4CcHTYnB/FWZylHAL3dGjTklB
         V5rr/5TK3sA0fxmu0W99Xge0DvD4JIIvenXgZQcPmNntBNlbbuk2RFIEG0C/9yoksIzD
         lmmQ==
X-Gm-Message-State: AOJu0YyvI9SaBEmL8W0zrPjQ4TaLjEMCb2whsgkYJHZE8LscIpX8cyhS
	AvETbLVT76rtti7uQWxNZTVcQbd/rNa0Qk01TRaHZ9SqZ3Y9a6No00EJKY6jxQ==
X-Gm-Gg: ATEYQzwcsch9fOf9t64vB3+QJD7gbphPdp4jPgOf5XQndoguolajMvrm4+VbvdkzFbV
	z4lDyIy7L4PsGsiQkUCvpTcesiUMBSXRTKYzR5reWRrL8jHPhVd4NkchvjpVg5pY/P+Q0+NiFAL
	qJGNXSQHOH6aHWG4d1N71MD5zuidCcWMqy3LH0zZqgAoNmhYO2R2aDvXvBKHR/TnZOEN1fPsSas
	gACor6ByAMhclMOD2wLbRUaz4rgLRSU7DX0sZE42/JB1vQKYlR0OdxCBicE43IO8Uqhs7RrGZbU
	ps2dBt9gDC30eLixHZgpPdAwaRv42kBTaWf3XxWWf1uMnQUbGjy0h1n/Co/F5Nz0/vpHWto8fkc
	QwtEJIJA5KlWKI7pMToz/h9vdd2Xrdm7QtMEuSNEbbeVD/2zrjbW0qjyiZ3HlxXyo3xT1Zc3L86
	J5ZWVL1mfKGqlRgDc1gekQBTbRVQ==
X-Received: by 2002:a17:907:9626:b0:b9b:e5d:71db with SMTP id a640c23a62f3a-b9b0e5d86c4mr157328866b.46.1774435265134;
        Wed, 25 Mar 2026 03:41:05 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/4] xen/arm: its: add platform match callback for ITS quirks
Date: Wed, 25 Mar 2026 12:38:31 +0200
Message-ID: <10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774431310.git.mykola_kvach@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774435266-21CFBDF3-3AE12AE1/0/0
X-purgate-type: clean
X-purgate-size: 2594
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
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
X-Rspamd-Queue-Id: 86EDE32329A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Extend ITS quirk lookup with an optional match callback so that
platforms sharing the same IIDR can still be distinguished.

Use the board compatible string to positively identify Renesas R-Car
Gen4 before applying ITS workaround flags, preventing false matches
on other SoCs that happen to use the same GIC IP block.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 00524b43a3..c40629731f 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -57,6 +57,7 @@ struct its_device {
  */
 struct its_quirk {
     const char *desc;
+    bool (*match)(const struct host_its *hw_its);
     uint32_t iidr;
     uint32_t mask;
     uint32_t flags;
@@ -64,11 +65,24 @@ struct its_quirk {
 
 static uint32_t __ro_after_init its_quirk_flags;
 
+static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
+{
+    if ( !hw_its->dt_node )
+        return false;
+
+    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
+         !dt_machine_is_compatible("renesas,r8a779g0") )
+        return false;
+
+    return true;
+}
+
 static const struct its_quirk its_quirks[] = {
     {
         .desc  = "R-Car Gen4",
         .iidr  = 0x0201743b,
         .mask  = 0xffffffffU,
+        .match = gicv3_its_match_quirk_gen4,
         .flags = HOST_ITS_WORKAROUND_NC_NS |
                  HOST_ITS_WORKAROUND_32BIT_ADDR,
     },
@@ -77,7 +91,8 @@ static const struct its_quirk its_quirks[] = {
     }
 };
 
-static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *gicv3_its_find_quirk(
+    const struct host_its *hw_its, uint32_t iidr)
 {
     const struct its_quirk *quirk = its_quirks;
 
@@ -86,7 +101,8 @@ static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
         if ( quirk->iidr != (quirk->mask & iidr) )
             continue;
 
-        return quirk;
+        if ( !quirk->match || quirk->match(hw_its) )
+            return quirk;
     }
 
     return NULL;
@@ -99,7 +115,7 @@ static uint32_t gicv3_its_collect_quirks(const struct host_its *hw_its,
     uint32_t flags = 0;
     uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
 
-    quirk = gicv3_its_find_quirk(iidr);
+    quirk = gicv3_its_find_quirk(hw_its, iidr);
     if ( quirk )
         flags |= quirk->flags;
 
-- 
2.43.0


