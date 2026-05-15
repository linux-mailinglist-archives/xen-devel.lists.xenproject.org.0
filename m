Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNdbDkDrBmqVowIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:45:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DDE54CAD5
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309795.1580843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNp6W-0001CM-4S; Fri, 15 May 2026 09:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309795.1580843; Fri, 15 May 2026 09:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNp6W-00019x-1P; Fri, 15 May 2026 09:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1309795;
 Fri, 15 May 2026 09:45:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wNp6U-00019q-9q
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:45:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNp6T-005wNZ-4i
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:45:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a06eb0f-5cb7-0a2a0a5109dd-0a2a450bc304-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:45:09 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a06eb24-212f-0a2a450b0019-d155da33f128-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:45:09 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bcc2b199c17so874180166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 02:45:09 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4ded99dsm197009366b.30.2026.05.15.02.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 02:45:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778838308; x=1779443108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hJaSnQ3sX5cqD1qfGugpJRcqI2K1GGAvge8mcTL6Nw=;
        b=kKMolczeSgGFbWFeXf52Gcj4XbbkObleKPvTEcVpsum/34KlH5yft+nlCSjEdxwwBo
         O6x4rW+wOguqXN9gJ2BafWtNxBrPzWLCdYJh3eUXZ8j6KDWn5GzQtZN3Gu3IIOohB+f7
         PnJtAD/nFwdVw60lgI11JWtbwU84flL9ib8y6DT5kBI1LIRxlO3jLJmEwuINTLecONhz
         Obv6ywHSBd8LPQ+p3CBnlqHAB6uC9CF0zsBuo/Zexja56s9m8hyAi2BTzVnR0E5PVUw9
         7btjHrzKoZU9FK/6ymYUvZTS3b3cIRinWKCrH6qLweVreiFsXRkRKw5IbNNDQZfFA5EZ
         ZTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838308; x=1779443108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hJaSnQ3sX5cqD1qfGugpJRcqI2K1GGAvge8mcTL6Nw=;
        b=Nzze+uh3KFBQJnRGOS1zbS+1uqGhOhKfLvIgbSxT8Q9uy1UD4W8LtyupDDaIVdzPXh
         Xb27LwO6f3/No4ObdkHgj3sEUGUKuRfAdta7zUS8vuHTr1zV8UlU4ZmmTZtvTmrr+N3L
         pGcLdKYv53wzqCWNiKXmi4e4MJ3ZOLRTcGk858Fbo/h4xTcYgAd0Rvt7npqx2ztUJhlj
         IMyUo/8nIoTZfP6IgsmBr4ya23Dj/uLd7y+cfGm3nW185aRTnJ7JNeWJGjPTRSxcBwQn
         wKmYGOqQO8n6q7c42GTCtUrOTyQ4AiyfOfxyfBi4mjrKzFaON42zgYasqjMB87r49YAU
         eofA==
X-Gm-Message-State: AOJu0YzXwkjV00066iiChEbnnE3hx33uvP3s0dlELs7ZxAFv+bBiYGeu
	T99ua74zAJ2xVbCqevXkppLNwx30Z2yKxgTvbuaI5dOEyJdzdEu+UgA6TBRGzg==
X-Gm-Gg: Acq92OG32P2INN95E2zzXRCdqtEZQTHq1f4Ifht9/dTkXEzniufgVMXPYqDoH4pM14D
	vl4bnKkj4WHOlJuAqFZM9nH1bMaOHtkBRno193jb08hR6ADW8LxuBLNspDpdyKD6DzM4LUmfNDZ
	DRLExxH4bUltnQK4ps6MLAJAokImDciHdlaUUJJ7drfZ4dusyyxrF841uX7uSF+4YmK2NRmmaly
	h9ovx6pa4E7bFxyuIkxjcLL31HQBn5Wkq3N8ZP/kBpAgP+ycUlijcoTvLD9vcWjppV++haSEsCZ
	EF8ot3b1OtbQ5EiM3pqMDsL4aVtW59m/W0Glw9/hPpIF1v1pJFAM6cZonx7DmoIiStUmQt8AC64
	eqnh7daxKmZhajXE8z4d79Kd3VwOhFFDwfbgzBhBpq0tGDmYzsLmPaJv3heH01BAEdh7QjeD6zk
	yfwGPRo+WmWBht2xJ6ARQo/fKmLkS60PNjGbXG
X-Received: by 2002:a17:907:6d01:b0:bd2:b983:96b with SMTP id a640c23a62f3a-bd5178652bdmr147607466b.20.1778838308287;
        Fri, 15 May 2026 02:45:08 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/gicv3: Detect normal NC ITS command queues
Date: Fri, 15 May 2026 12:40:31 +0300
Message-ID: <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1778838309-21B86F3B-F118FD1E/0/0
X-purgate-type: clean
X-purgate-size: 1399
X-Rspamd-Queue-Id: E0DDE54CAD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

GITS_CBASER.InnerCache uses the GIC BASER cacheability encoding.
Both 0b000 (Device-nGnRnE) and 0b001 (Normal Inner
Non-cacheable) describe non-cacheable accesses to the command queue.

its_map_cbaser() only checked whether the shifted field was zero,
so an ITS that reports Normal Inner Non-cacheable would not set
HOST_ITS_FLUSH_CMD_QUEUE. Decode the field before comparing it with
the unshifted enum value, matching the handling of ITS BASER tables
and GICR_PROPBASER.

Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9005ce8ce5..7560d46c6d 100644
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
-- 
2.43.0


