Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE1A5D01E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908971.1316040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k8-0007pu-Ab; Tue, 11 Mar 2025 19:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908971.1316040; Tue, 11 Mar 2025 19:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5k8-0007nV-76; Tue, 11 Mar 2025 19:58:24 +0000
Received: by outflank-mailman (input) for mailman id 908971;
 Tue, 11 Mar 2025 19:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k6-0007Uu-Lz
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:22 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e77400b-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:21 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225477548e1so64746335ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:21 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:19 -0700 (PDT)
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
X-Inumbo-ID: 2e77400b-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723100; x=1742327900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=rqT+31mIV+vPr03qoENe6CuMOe8gLU4c+/GqGRI21EM+dS3Ec2fPRdbewPKTUSbooW
         vRycV7B6RVOK1vhZOIXBYxWOP7VQ/EXiTO/D29r3I6EmdnNWcOutxwiBGM8vMiYXePGQ
         9vghG81+GFDPEdj3z0WVnSmOfuqcysl4xJsE8N0eqOJn584n5DIwfc+Z5hBSG90OBQY+
         zOai0wydV9wQOFixpCT1IFZrKwkO5b8TgExMwkS1LiOcKish8VTxYsHezoZs4yScwP1t
         D6ahQSVvrawIsZpWSYB5XB1YSLx/nHvZG83PYP/l2YfQo63W9CdbcbxyTYYMbsMePt2k
         JLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723100; x=1742327900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=KmKL3GHvEJVVWSxx0rebhShS0w4wSZYif8BdGLBtPqGZfb1ZuZE7v3nV1P2lM4+L8p
         JXXJTmL9slwSQA8P45IMHfL3ankA9eH4zGRRj2JJq64MYOxFCkvk/1chRSfP32DRVuJi
         PqIz69/lc42InhMWlXRW5LeE0MTbaJxnManjR2yKM/QxVp2Pq4Fb4T5GqMZaggJzS/Hc
         HUk/FOPer+iIM1bXAyM4WUfXSfxtd7ImJDW+gCaSR3G/pRi9+MEymNKDd10XWPM2jbaW
         zu2qwq66Y34V6EQP+3PUx5ufkVuYCzmJ/YXS5Hx772AlMG4SZtrx72lQMjFPlACnJNqI
         gLsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfT5w2shCNE3K5hy8w3GmPAvTxV9Xv0tuxaE+2vlpbF4D+w19OSeu2CRNwpTGFi0bR7/Ey52kDF0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBNXckCef3yO31LOZ8Xv07QjQwfgBIsxruZId3HbwrHmiraI9L
	oqZ9hCLIcbXQXmw2B0SHu3gKjCwZCAVF+ZRLLbb3Pv68+/YQEV6FSDDzlWcelfs=
X-Gm-Gg: ASbGncvaSgxx/ufFinL8bbPYzy3QWL09aX5R00c4FeC+QieOdCo5XT+RnHvlihrAhiL
	nNEnXbSMWSuLr+eDrW2QubNj38j0AV4ZU/DdH0IcnueotVEcH/d+pw5RV6wyd+pnm6cbLM4GxgV
	EcE8OntkWQvvwboS/pcN9icTNEVC0GLgRvRjFu/Czl49bYbpC6zVhQjz4ZxU7NLWqYh9wn+qpVT
	xDx+9gbYTYG1BLQoIhCNQE3qSLeaDkrMRudKxpgIyEf9hhVkMo8y2e3MOO3oD8iXQNK694C2uzT
	opfF8lmE4S7198FSvarzScjLxpYs+QFhIZYfScyphnKffsPW2/TlqMw=
X-Google-Smtp-Source: AGHT+IEBCxz8tAPvpmfBsP3Ukq6OIHQbs/5ODtSLSGAs7fop1NjSulQH4pEJZaQn/aXi1ghSaJLALA==
X-Received: by 2002:a17:902:cccd:b0:224:256e:5e4e with SMTP id d9443c01a7336-2242889d3a7mr298318035ad.16.1741723099862;
        Tue, 11 Mar 2025 12:58:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/17] exec/memory-internal: remove dependency on cpu.h
Date: Tue, 11 Mar 2025 12:57:54 -0700
Message-Id: <20250311195803.4115788-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 100c1237ac2..b729f3b25ad 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -20,8 +20,6 @@
 #ifndef MEMORY_INTERNAL_H
 #define MEMORY_INTERNAL_H
 
-#include "cpu.h"
-
 #ifndef CONFIG_USER_ONLY
 static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 {
-- 
2.39.5


