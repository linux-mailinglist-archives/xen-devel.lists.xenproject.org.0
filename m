Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOtME+8hDGrjWwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDA57A4FA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312579.1582681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzM-0002R3-PW; Tue, 19 May 2026 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312579.1582681; Tue, 19 May 2026 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzM-0002OG-M3; Tue, 19 May 2026 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1312579;
 Tue, 19 May 2026 08:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPFzL-0001ss-9p
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPFzK-008Zic-Lu
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:39:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21bd-2eae-0a2a0a5409dd-0a2a450ab5b8-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:42 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21ce-56b3-0a2a450a0019-d155da2fd44c-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:42 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-bd9a71b565aso58907866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:39:42 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c2a0dasm689854066b.19.2026.05.19.01.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 01:39:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779179982; x=1779784782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34U+gzhvif9A/R9ljb0v070dq+nUEolj8ya2xM2qXEY=;
        b=PlZTvmlb9K5nLl7HiW/UVlkFHoplbXM6b0UjvAuLb2Lfi1Sbbnt1I3hb/VF3oalfuw
         EZ/HvAEAi8wiJtF0qz3CKjh8qdDfFQYWm4HH3arUbv1ym+8WsdiRcu7oeDL3V8MmuLmD
         YyhXhhJTw4TpC0epe1WCD8S2CLcCQ/yAvAhASzhd/DrGDiid0poCTOoithgTwjDs9Ezi
         wqiqTX/hZhPa1PKz6GBfMoStxNoxHe3fYAJ4hbZqmOOhsbG1GT2Kpmo0uWa1tbH75z/m
         yLfwVaeSc9DH1ot8CQaHbUJ1yiT+GWKKHcP1U3Vm4xpzGhrXmv1J7iWtqHtKAt2q2yXY
         jeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179982; x=1779784782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34U+gzhvif9A/R9ljb0v070dq+nUEolj8ya2xM2qXEY=;
        b=q5pLdY01zi7a3ADn+dWgzW3z/OxrI55p+8UKx+xpZkmXeMXT1c72ofbAL0iaXztSPR
         aasmG/TpGvgiw2+PrK38yn6IzfAJwNzFNjq1Cm/FCHpP5XOKQ8FJauaBQ3zV3TCrkzO6
         KoaDzaNNfkNyEbf1yDEFkMfDyxkSoOcGVGv0AjX3rQv/OFWoLuKTqo6nUV9Pu8lq9kCW
         fdW2R1YxtSwHoiOCUsuZZKnBmI3Ph2+h0M7hOlLK8jOEOLF531ju7CMpxHEraNo7dg7Z
         ivstJaTha7wOZVv19kCkvvGnX/yl49NHJnvKJp2wHpIkfBHiM+15z3qahtKmLilagK8Y
         pZNQ==
X-Gm-Message-State: AOJu0Yyg/ok6OfqaXv+wfodQNd9Ud1SGahVPoh6vRunmBhz9FmUAX3X8
	KHKEcF5e3HagjXKXseyFh3kTydPjEGseakzDshLAokgdMAniQoyOdvLYrnlTVw==
X-Gm-Gg: Acq92OEksHeiOtAR5J7GS+r0+OIUuItELhIUuy4sAGH2oQwdeovDdzahu/h/0oY8YrP
	WweuBgWdUR2EbND3TTDMYN5eLsTqkK3qk722MM/x5yiXwOyxWqIBj5eTJkGIKmC0HAoHKNKIcGr
	QsU8sHUiEfa3OT7MjPf3VAfaFLu+FsgbGz7ROZI+zp31RffG5FWQ+raKOVuXEslC1ORfTxfOx77
	BLQQslb2X3BvYwkR+q9aAz4BnC5usHakeP6IdZi6nYKTGUhAd7VtWpXEEMCP9zeYfqplt9gShAh
	bkKAfQrElYis4Z1c8f1lB2lcxWHtFKK+UBaJ2dPHPUjf7LGo2sjQvoW09y6HeX9zEZu7IfgU7JA
	sSkjL47B14ukfLIgxYJqDS7qK8qYC9D2T1zdHhm1TlkN1kSN15OrlbEkVDd11A2o+8/ywus5DFG
	AUvu8txrAWvbBnyZBs8E+w7HvbVG7/L07ZB59PwwXwBGt+cPIkoy1LXnhYT9etmyAD5BOfsv2E2
	21U
X-Received: by 2002:a17:907:9813:b0:bd3:1a18:cc64 with SMTP id a640c23a62f3a-bd5179080d9mr1050897466b.31.1779179982003;
        Tue, 19 May 2026 01:39:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in fdt_property()
Date: Tue, 19 May 2026 10:39:28 +0200
Message-ID: <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779179301.git.oleksii.kurochko@gmail.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779179982-70F618B7-300E0014/10/73395122804
X-purgate-type: spam
X-purgate-size: 1440
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 45FDA57A4FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fdt_property() unconditionally calls memcpy(ptr, val, len) even when
len is zero and val is NULL.  This is a legitimate calling convention
for adding empty FDT properties such as "interrupt-controller", which
carry no payload.

In Xen, memcpy() maps to __builtin_memcpy(). The compiler treats
__builtin_memcpy as nonnull on its pointer arguments, so UBSAN fires
before it can observe that len is zero:
  UBSAN: Undefined behaviour in common/libfdt/fdt_sw.c:333:2
         null pointer passed as argument 2, declared with nonnull
         attribute

Guard the memcpy() with a check on len so it is skipped entirely when
there is no payload to copy, bringing the code in line with the
nonnull contract.

Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/common/libfdt/fdt_sw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
index 4c569ee7eb0d..96d4cf571319 100644
--- a/xen/common/libfdt/fdt_sw.c
+++ b/xen/common/libfdt/fdt_sw.c
@@ -330,7 +330,8 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
 	ret = fdt_property_placeholder(fdt, name, len, &ptr);
 	if (ret)
 		return ret;
-	memcpy(ptr, val, len);
+	if (len)
+		memcpy(ptr, val, len);
 	return 0;
 }
 
-- 
2.54.0


