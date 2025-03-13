Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5BA5FC01
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912892.1319140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslag-0002ng-FA; Thu, 13 Mar 2025 16:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912892.1319140; Thu, 13 Mar 2025 16:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslag-0002js-7f; Thu, 13 Mar 2025 16:39:26 +0000
Received: by outflank-mailman (input) for mailman id 912892;
 Thu, 13 Mar 2025 16:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslad-0000Wn-Sa
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:23 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5aa50bf-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:19 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ff6e91cff5so2131036a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:22 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:20 -0700 (PDT)
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
X-Inumbo-ID: b5aa50bf-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883960; x=1742488760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=r6NND27xqIFbfp7To8/POFOfzYrQJWK4uL3WcSoLBl20ZlIbD6D1JVLX0AJHOxLUl4
         sMV0fHPj0/Chpyb+ibqePu4GVH8NLbkGMv5Dfnp7lnRhPUxx9rwUeOC4W7fVa6L7CCbT
         kFFKJHfwH5lkAo8eTUILBobOXeIcwPThrQkCfRtotNl4Mx5eiGr9+CqcNTgm0RXPd2VZ
         t3BrfTmq4D3lHNXJXujUo6Gne62oNLaOOwXAl/a9Fqep5hdHQsFaYTP5wFFxTZwpkkY4
         O6cKO62JZvw3tvYSMrKDkl7SMJdyv+UlKTPkl3COBW9qEIrz0I1/xC62/R3Hmkl9kscj
         arkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883960; x=1742488760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=q/JfVJ+SF+lq5GNe67AV45BtJG/WIGuSgzFscp/Vbc0mR1E2eRnyA7vSuHkSWkxiHG
         y9uYd5HluVKTDf6hSesBkwM5n/wZ5oww4wS33SnYvi/JBopiT7wD3GUnILFoSpYtTnVi
         X3W3s3znrMPWGxHFcKS4obT8YqWSWwQe/faEsvjfqJJFEinp7qbnzH7jDZ6aeudplrGg
         VJCPPkTFkF/CLMeYEq+uuu2mu8oWXLe8F/gMFbtcT4cewe/hUiPJsxy6nDs+PF9DvFgF
         xM++QvX3MiVbtA9ktAvg6Y+eSrQz0Y1j6bfK2JKXEbMQmYidECoZDKJSDegfsOZCwzeq
         RGdw==
X-Forwarded-Encrypted: i=1; AJvYcCUg87a4CgCdWSroYFQXW4pmDbVpsWJirNIY4Lvz+iH8Rb2noeL/a0EpT1CSLopM5FyrbLmpEqD4QJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbi6HPiWeNsiFh3rFBYw9d86qQYE6pnTI00ptJMOweekO/Er19
	J2dUcVUdolRrnRYWsWG29tBkq6vuQBNc4Y16ZzmvEeIYuSHT+LVvKZth+frXiEo=
X-Gm-Gg: ASbGncug8Xhi2JrSU3e86Ob42YcwWzodqr/nhi8yyFNT7I0oWCjbV64hVqiJzUg12Dw
	SpI7ayhyXEsGSU+8GgOaR/9cDGrOLGT80qIMXsKRzY/tfa01bRtruD2f/KndHFK3M35Z7GiRB9W
	/3ZnVr0fLYyT2VP9fZh0x8UlMyUy7lbC4JO4KprkrbQfyR7DmX2mDN3aWApVD1TzS0pfgOR8w90
	FIcQiYpR1r0X3N3l5XXrz2693S0bMh5fOMaJ01JjsI/Xw9SCSkMnYfqr6aHFCHeyZeZnp/mPYlf
	0V8owK4F/xuK2iywNPnVkcbho2rvcEQU9481+YRBSmwE
X-Google-Smtp-Source: AGHT+IGZzjulkQU+BByDQKOIMhSKMvzNQK3Jb1Ldmjqqry9imNMjEt/+F7i1NK8ViRkyqUoEaWDauw==
X-Received: by 2002:a17:90b:4f41:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-3014ea23938mr221254a91.25.1741883960596;
        Thu, 13 Mar 2025 09:39:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 08/17] exec/memory-internal: remove dependency on cpu.h
Date: Thu, 13 Mar 2025 09:38:54 -0700
Message-Id: <20250313163903.1738581-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


