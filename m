Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72018D11F5D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199994.1516013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFLR-0001hi-Nx; Mon, 12 Jan 2026 10:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199994.1516013; Mon, 12 Jan 2026 10:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFLR-0001fd-LG; Mon, 12 Jan 2026 10:40:21 +0000
Received: by outflank-mailman (input) for mailman id 1199994;
 Mon, 12 Jan 2026 10:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vfFLQ-0001fC-ER
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:40:20 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16d4ef99-efa3-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:40:19 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so28027705e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:40:19 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0860f5sm37789313f8f.0.2026.01.12.02.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 02:40:17 -0800 (PST)
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
X-Inumbo-ID: 16d4ef99-efa3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1768214418; x=1768819218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LykZeEOPrv64xvtZjRuGWxA+y3dRZD2O4sxtxa360vI=;
        b=Q48rjkl8+LB5QEnKtPWEMEgM72KZzoNFkljYe5M28cZvDofZBeHl3RABWwfGNj8stO
         P+aGxDpIvHDM1h3mXz9fn8e9BQWrPOZzj4d4YOV1bKXg5sP6Gn1cKezvgV/KH3lYykZ4
         sAIypLTlAhxWmtSVQ0cT/yrK2BqMWWH0ThZW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214418; x=1768819218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LykZeEOPrv64xvtZjRuGWxA+y3dRZD2O4sxtxa360vI=;
        b=K95RBm9X9NOniYmyGdl2f5z10eUV+Z01JtNG03YoB1cJ7TVTRznQxpRsvwLtIfZGCE
         ka1AJt7puZGEDT6DwtioeqOkF3CwEm2N0pNi6+VZHtnXyjBOA4Y6jwRmj07C1R8hdCaO
         WIm3LqAmQY6UEoejhgbboqpd/7La24H4xWbmdefNw+89mavtOU72SFgX4lSLgseMDnSk
         /QjGBy5ygPUjAIUkX1HK7jH+JxqqftSOMnVUNbkTajThAOAZBFeGsWE3my3hDvjuVNHk
         sb11DttplEClubjr5OWi2bsW03Am8Go8aBbr2FIOXuhP4K4OoUNI/thJcNRw48Qx7PPX
         FGng==
X-Gm-Message-State: AOJu0YyIvPeb3Pvd5kLnJGHs63ZkG/JkhT11nMy9D7JVWH6Wlqb5U6zH
	/mZkXG83nfIU5JVyNHgx6nTy5TjpeWF3oNRN92XvbNIYW7Rj5d00YKi6ZUzztaRvkmWKIrQccId
	ZNfDh
X-Gm-Gg: AY/fxX4uP3VQz6kz2eH4QBUpwHj5M0Zy15RyrxdAfOPhwcHVGcwDgBMbAgAKgZb3Nra
	OaU/JRl0W1KaWzzhNxPjIO3p5MXf9CuovTUGeNrOTaY00/UsSJEL4MlRcRaPTwrrH570RSN+hTb
	gM/X+oYygcQ2aF/zXLAEm9/gyMauK8o9vuZN7dJOvqAnylFECBKzTPk51GNY3PoI0iUwaknrir7
	nJ41BuX1BPB8fZRYubvJcFPLgggw2hV3lu4JRE6+3FuR+g+D/Om+H+/WLcKTMFKRtSZLCeI+DoD
	sP8UIMvpm0HUjrW5Cchm5sEqywkDds1Y9ZN8wqae39gO7pdjInCFBgJrR7oXLy/tMHi/EzC2Qn5
	Pk6uG0YXc1+ZiiEefREBEr2rbSakhQrJOGr5zrzeFWFVPQmKcKPhl6rfVn64YXpMif83X7w17rm
	UwNgNe/IiiI94NFOgJh7Vx9QjxmxX542Wg0xDma6g3zI2EnyJz2teEu0IYzY2AjA==
X-Google-Smtp-Source: AGHT+IHytOuQy5U0zHra82QWExPtPdLByvnFvDNZZy1tOjBUrCvc3b21W1UE4YZxhwIX2sWLH/mcVg==
X-Received: by 2002:a5d:64e3:0:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-432c3628287mr20325272f8f.10.1768214418204;
        Mon, 12 Jan 2026 02:40:18 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/nodemask: Remove _unused_nodemask_arg_
Date: Mon, 12 Jan 2026 10:40:15 +0000
Message-Id: <20260112104015.1001907-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This only exists to have it's type taken, despite there being a perfectly good
concrete type to use.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/nodemask.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
index 1dd6c7458e77..c9b18c47aace 100644
--- a/xen/include/xen/nodemask.h
+++ b/xen/include/xen/nodemask.h
@@ -67,8 +67,6 @@ typedef struct { DECLARE_BITMAP(bits, MAX_NUMNODES); } nodemask_t;
 
 #define nodemask_bits(src) ((src)->bits)
 
-extern nodemask_t _unused_nodemask_arg_;
-
 #define node_set(node, dst) __node_set((node), &(dst))
 static inline void __node_set(int node, volatile nodemask_t *dstp)
 {
@@ -215,7 +213,7 @@ static inline int __last_node(const nodemask_t *srcp, int nbits)
 
 #define nodemask_of_node(node)						\
 ({									\
-	typeof(_unused_nodemask_arg_) m;				\
+	nodemask_t m;							\
 	if (sizeof(m) == sizeof(unsigned long)) {			\
 		m.bits[0] = 1UL<<(node);				\
 	} else {							\
-- 
2.39.5


