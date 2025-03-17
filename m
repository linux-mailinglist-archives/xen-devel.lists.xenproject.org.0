Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF0A65CB2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917745.1322621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIO-0008Oa-3C; Mon, 17 Mar 2025 18:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917745.1322621; Mon, 17 Mar 2025 18:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIN-0008KP-SM; Mon, 17 Mar 2025 18:34:39 +0000
Received: by outflank-mailman (input) for mailman id 917745;
 Mon, 17 Mar 2025 18:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIM-0006uj-Fv
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:38 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a09deff-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:36 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2255003f4c6so82568455ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:36 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:34 -0700 (PDT)
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
X-Inumbo-ID: 7a09deff-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236475; x=1742841275; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=dr92+fEPc5ZTGJQ+Gp7kIkr+duRXOtgXTxzDRqNTRmhKUTKJRv8ibwPUWmNWEmsDIW
         N0Bnz5QV7lz4BE8oUt0EAIAH4J3MS8WxFYe3xGCF7rMmfJ8cPBtBStg/TGfYHo7mH8Qt
         3bCriGnwfcdsDIgaRbyMCIc6Tn9lMpwPtTNZjYKYmyDPKM83mc0zsvZFQtiMxTxSKyaQ
         pMuzx/SG2NtuoQVEGb81dZ7AC5Cugrrtvd5g+jbnkEKQjTMqp/ASk/YLqC64szUMvh7E
         NPZfeZq+4u0B7D9AH9WInuk3rPTegnyn3q2Sr9g+xRSoo7qKVPLWLXJuLXOZXk/3lpH1
         y32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236475; x=1742841275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=fIDO+4ZCYhWlM2bscj03EQ72yZ1+vHOLkOl44xKa5DbOP/75Wui1dWR3SIXcGobNdy
         Tr7+rj+iqVtNSFKfR8btQc6RFZ+uYygHTMCNSG149XRaljNv1gop0FCTAG2c3AHolX5K
         ZMpAkEN5G0aQMmX5fNczFCusnDLJpn7+NkbcO8jfF5X8fmjv9O/lUnPSE0lPxtWpZgui
         Z1KOVh0Tr6WQJ0zvFPOjuM0gK1xVGwdE/ECXKPqAUx2wtjwrNL3ZNV1DHe/2amXhTCQ1
         aUyYK6HfEEvb91RT3RdigGZemGHdMFrEOXwjaEbNbJ7F5KixrWR9cV7KxS9rJhpxroDB
         Y0KA==
X-Forwarded-Encrypted: i=1; AJvYcCWC9e35RocOUB1U8PcgPt1q7mLUH0GKVczlYHPHh1vHU1PY1bPThPibdGEm+3arbc5BpMJzG6tmxD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybKcmItnIW7ZIabK6PyeVPFQwBNSrfI8EyQfBXDQ+kMohsaPui
	lvANTSMga5fuGR0HZPDEw1cC2ke4br7M8gh5rsYq0oRhl5n77bqM9FpW1Sz5JWw=
X-Gm-Gg: ASbGncuoU/oWnuC8X89RKVMbq65y5eB0WSILfMzeqRIyK1EQVQdBNi/e4bxwvwpu7UQ
	AA6UtCksKS0jp0C9coaRHtlvcq5FcF/BMmeL26yvIarO6YQN37s2XvG3b2L8FCcHayfzs/aN3oX
	5kJ+8BkixuxF5EmmYI/dCUK2NyR2oXMm2ZVOayxOJY26lg87EAkROPS5RdpLwDL0+skyWW8lkf+
	+UdySbV6BJyprUrAX46uEoo/fjrH1SiUIOahjlYiTkcs7HC0QsHn0HB6yUryYvA8MlHgdJX1wxw
	9MW6rCoAuKd2nAsxR5P9HkFcPoGasMgx9KMboqKo+d70
X-Google-Smtp-Source: AGHT+IHhIUK7t53+vTI188pQaTMyR7EJzQqReYcVMpj4OefpwS1cjUKc4hsfvFYLapAGzkczRRlDcg==
X-Received: by 2002:a05:6a00:2196:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-7372238f773mr15973995b3a.6.1742236475108;
        Mon, 17 Mar 2025 11:34:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 09/18] exec/ram_addr: remove dependency on cpu.h
Date: Mon, 17 Mar 2025 11:34:08 -0700
Message-Id: <20250317183417.285700-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index e4c28fbec9b..f5d574261a3 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


