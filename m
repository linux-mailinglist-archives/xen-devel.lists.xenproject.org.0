Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RQhWO+FMFGqnMQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEA5CB072
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 15:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319265.1586975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEu-0000sv-6O; Mon, 25 May 2026 13:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319265.1586975; Mon, 25 May 2026 13:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRVEu-0000pm-3H; Mon, 25 May 2026 13:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1319265;
 Mon, 25 May 2026 13:21:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRVEs-0000h4-6e
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 13:21:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRVEr-00HD0O-It
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 15:21:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144c9e-e002-0a2a0a5209dd-0a2a450cd30e-22
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:21:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a144cbd-62f1-0a2a450c0019-d155802cdc96-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 15:21:01 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4905529b933so13307365e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 06:21:01 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526ca21sm247101985e9.3.2026.05.25.06.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 06:21:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779715261; x=1780320061; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnvKC3uKIYyQyLpDODWpeTmvo1taBNlFPdhQ7OBPgd4=;
        b=i7ULngCd7rwk9j1/VqYvxIFyrV5pT00sKpQDMGBHxXu8XJyl/bTHG/r4UJ8JktD6mB
         Qps3FRJlBa8pV45gwVWb0Vq8dHCMglahS4QUuoU5fnn6UWq+d4xXbdOPGHzjQb06UoHm
         jGNzUfX4wiw83TmdhEloSv2XI/Dc7UcbM0Pbp3YC4qFXvJySvW9i7KJ+8twzWjRgoOqq
         KOb+D2BXfXfpH9wpJJ7VBcsrI9Y2BR4+LojhS2ItBrQiztXnwRf6jRPy/HiHHtjGkzJ2
         oz+N5xtg2ZEUnU22SEqTWkeijyh97tQW+PWAinu+OwijOXdHt0w9wVI+vEFjVhiyx3qN
         x2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715261; x=1780320061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnvKC3uKIYyQyLpDODWpeTmvo1taBNlFPdhQ7OBPgd4=;
        b=AIt0GyLzMV5uS0H8UdeVpxNfgBLgB/z7/x3BICpU+1J36dqn6jsRp4xekXDeGL2z+D
         k2YYlZgBrY61mvYgWe9TnIU8HoM0grVFPS30Vel4vZVHO2LB4qMsLM2ddRKWKKvV7lhD
         FFKUtXaHVGpbSRLmMqo98lNPtpAYXiwe/M1EEBBBgGoEm3oKWaSDowrVhLnHSdf5zQNu
         e+iyp5e9XmKvuMXigde1OdfHmZRgSCGir0FCZr7t335kPYbcrupHlQp1zVjQVADRjCb8
         zMUKJ++vJ+b5btZKMrWaR8eHKrlerWDpoLYVYkzLof8LlzSjIVvWfvz1nJ3Stf1UUyFo
         J2pg==
X-Gm-Message-State: AOJu0YwVHyixmNY+ZsSyJlf9PK70h98IrofZGz6vKHg2ybo1llKOlLul
	Nf7MVxQ9D4irsH4wVA1C6raGQodooHvt1B+Npw8n5HlRB97N/i/h+wAQI6lPun1n
X-Gm-Gg: Acq92OHi4C9iyo0LphWtY06F1WmhhBhhL7KBXr44xrc0FC+gO7pSK+S61gMiI7vfrVn
	GkssFVzN6/2IPbajcwyn3HeaeuJvq3D1QqSSfyeJji/wXX1DHPXhToE1a4QgydUVwoEilAyMk08
	7C83oWZ14gyLC7Vl3y5CNYVjav1PdNPdo45RI+xA55oyeuJXrgNNJTUMmCvHUzgouzGHa7aivnk
	ZOtTxABfMKYvjKDfVD0GBGRfQj4Afqh0odlAel1OjRNR9wt95aHpIkqg/mMneOhosGDS/50C7Nk
	6XqzDAuylfVMsrrdkrg2hUVyGj2A58P6dowgf1HS7flDfXWhVGeYpQ6ovggofdYHUt24h9ssc0z
	9UeGKDeWQl7zootq2V01xJJ2baz3h0gBb1vtK983J2+2MTg6iiAMhkAbPP6VESCnYLSaSWgT4GX
	IuEAKAP7W0fuFZqUo+Fno9NTBD5XxZO0LznhCnMuiamXBti71WqfjSrw7XKSe8OhxeyA==
X-Received: by 2002:a05:600c:4510:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490428ddf15mr222949465e9.28.1779715260801;
        Mon, 25 May 2026 06:21:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH v2 3/3] libfdt: fix UBSAN null pointer in fdt_property()
Date: Mon, 25 May 2026 15:20:44 +0200
Message-ID: <248482e608157a7156f7bb6d8a809540a50f3f86.1779712171.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779712171.git.oleksii.kurochko@gmail.com>
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779715261-E1B6CCF5-167C92D7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1556
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:david@gibson.dropbear.id.au,m:baptiste.le-duc@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,gibson.dropbear.id.au,vates.tech];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,dropbear.id.au:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8EAEA5CB072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fdt_property() unconditionally calls memcpy(ptr, val, len) even when
len is zero and val is NULL.  This is a legitimate calling convention
for adding empty FDT properties such as "interrupt-controller", which
carry no payload.

However, compilers that treat memcpy as nonnull on its pointer arguments
will fire UBSAN before observing that len is zero.

Guard the memcpy() with a check on len so it is skipped entirely when
there is no payload to copy, bringing the code in line with the
nonnull contract.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git f57e7df35df4

Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v2:
 - Backport patch from https://github.com/dgibson/dtc/commit/f57e7df35df4a301961cbbf9433ba4e85c2ee5ed
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


