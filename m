Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E170DE6A
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 16:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538500.838468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Sc8-0002Wn-V4; Tue, 23 May 2023 14:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538500.838468; Tue, 23 May 2023 14:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Sc8-0002Tc-S5; Tue, 23 May 2023 14:03:48 +0000
Received: by outflank-mailman (input) for mailman id 538500;
 Tue, 23 May 2023 14:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/YuP=BM=linaro.org=linus.walleij@srs-se1.protection.inumbo.net>)
 id 1q1Sc7-0002TW-4s
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 14:03:47 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a22f03f6-f972-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 16:03:46 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso8053272e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 May 2023 07:03:46 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 w16-20020ac254b0000000b004f01ae1e63esm1338341lfk.272.2023.05.23.07.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 07:03:45 -0700 (PDT)
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
X-Inumbo-ID: a22f03f6-f972-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850625; x=1687442625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vPsiQpeoZd8UCXYzsHHeRCuEWCzprLDI2K1UxMG1vNw=;
        b=x+MCP6RIfgrhP/C4vp/VF513UZfXgcHOXjt39EnZYcgmTNS9SmK6xTyRxymm3cAXhy
         /LaZFhOURjsNJOM6lIY9MwAVxzXsmMIWE8DLJaBbKJFE4kIQ0kHMc3SxPyVh6uSwrtk+
         wNU2s2zwxen1OqwemfuCkOAFnIWaN+GP7UW62vDuVvYvmriGIigLWe6Gni7csFiLWmIh
         jchR1tkEcWwy7Bb8Twqgp8qV4sQVPq4jMfbrSvauaswEagc8MJQP8ZxgMukHJvIdRfW4
         SeSUkwhQub6h3PdQEBdBn9B6wSPsBeZUjcBXyY2tNf52dtUjqpcdqhVQtWybc8ItqCU5
         4xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850625; x=1687442625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPsiQpeoZd8UCXYzsHHeRCuEWCzprLDI2K1UxMG1vNw=;
        b=DT3xa5WkxjGCf3NxZYZAwrn3u98c07+sLCWnXIidDBHvIhBXC1gAGp1gDU1SE0LbHW
         DNypVl1cTQ1YAyYtsu4SDSOT3MvdX0G2O4zsSMqq/GzfBmanU4ma5yYNhzurnnYxbWiT
         xA5sA9Um5cV1MEV0Mz7OSs8Wh1czoMIUyrKpczsiQOjqd21HWMtt2T3c3LpCh/mTRNq3
         4dpLRj5gkR57kOMoDE3LgKc5bb24cPGJRCsmyssOwOmXDegPY+nKin6MuR5+vG5Yf534
         BVXo+GpK5yNLBp+VmxIll906aYJFFAea57bYYb38TlG3F6fzutQfdzmNwtREf6mcraqR
         1ctg==
X-Gm-Message-State: AC+VfDxOwgvxalm+BoQpi17eNJ3/cKoZau+5C/tCeBpt5bJRwwh8lGrB
	M857lEK+xiEtEaff6KIJ7r3Glw==
X-Google-Smtp-Source: ACHHUZ4e1X4jxIZwXl+y72sLOP3yazcOb2+MopQ9WDQmhL++ViPZczhGjjS6itrmgC5AhktkZRl30w==
X-Received: by 2002:ac2:5de8:0:b0:4f1:3bd7:e53a with SMTP id z8-20020ac25de8000000b004f13bd7e53amr4566812lfq.49.1684850625594;
        Tue, 23 May 2023 07:03:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] xen/netback: Pass (void *) to virt_to_page()
Date: Tue, 23 May 2023 16:03:42 +0200
Message-Id: <20230523140342.2672713-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_to_page() takes a virtual address as argument but
the driver passes an unsigned long, which works because
the target platform(s) uses polymorphic macros to calculate
the page.

Since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up by an explicit (void *) cast.

Cc: Wei Liu <wei.liu@kernel.org>
Cc: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index c1501f41e2d8..caf0c815436c 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -689,7 +689,7 @@ static void xenvif_fill_frags(struct xenvif_queue *queue, struct sk_buff *skb)
 		prev_pending_idx = pending_idx;
 
 		txp = &queue->pending_tx_info[pending_idx].req;
-		page = virt_to_page(idx_to_kaddr(queue, pending_idx));
+		page = virt_to_page((void *)idx_to_kaddr(queue, pending_idx));
 		__skb_fill_page_desc(skb, i, page, txp->offset, txp->size);
 		skb->len += txp->size;
 		skb->data_len += txp->size;
-- 
2.34.1


