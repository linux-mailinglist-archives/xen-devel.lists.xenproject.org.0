Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F8A5FBFC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912888.1319121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslad-00029d-Nx; Thu, 13 Mar 2025 16:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912888.1319121; Thu, 13 Mar 2025 16:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslad-00025D-8L; Thu, 13 Mar 2025 16:39:23 +0000
Received: by outflank-mailman (input) for mailman id 912888;
 Thu, 13 Mar 2025 16:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslab-0000Wy-Ea
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:21 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6490efc-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:20 +0100 (CET)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso2532068a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:20 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:19 -0700 (PDT)
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
X-Inumbo-ID: b6490efc-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883959; x=1742488759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=BUUsKinLUwoSVTx3bfllBKHlTJSJ61D1mbEG12f/1XiGSLzVKSZ7oxQ3ujTDgFImC+
         JmKd1Alg3RAXOm7i6IIjgUt7/GvKrsGeNLykFM7PXadFHvwDwLZKAhh+kRNfb2iGQ/NQ
         GDZQlfB4Ji0jJOPVOGNbvhV08HQeTr0JC4C91Dz5QK86ZNBq7nwoMXURlhmq0eBmqlUC
         JYkfx5zgQHMcOVWV8IWsSfa+7QP2TGE1h7RzDpkadpQX9Lp+Y+yhgf+QOIFWrE5Vn0vs
         petbhwURZw44Wd5JTpzkXdRY5vMXs3PaaniuxT++GujO+q42dzKZTUh/pyAVOZhneA4L
         gFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883959; x=1742488759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=jIVMJQBDBpV228jGkb9ronTgSPp9se5xPeeBlzvZBd88+Vzqa0pINI43pn2LoPP+DW
         77uP0gob1P5tfVBhzHRQe6Y3Bh8m7IqQiuH9g4acHH++Azk9oS9qxEnRt+te4u/lnSI+
         YKCBqlK0UtJdvnuW7a1hLfVAI3iz1ekgnusBS0zNWIiA3V/KNkjb5jJSdr7zy6Cuatgq
         sFUa+qNCos9mRiHSHas5CCHNsDKZHZ65fESE01lq41X1s5YSPFOU4KP14COZ6wClVmA9
         2BWhNVCT2ePyMrQTb2anxob5tppWCxLQTFKZBl5biJH39xhAwK9bzIY2eG3GOvU8mgIv
         U52w==
X-Forwarded-Encrypted: i=1; AJvYcCV5EaPrM9LaT0lXtlYeGRKFo2iuT/9k0eK0X1vHM5ULz0FtZ28hFmyjgIYQ/RP7oytIYPvDhKsMGiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNc8xXKUAOCDleZv0m8Uhn+kOjFCwOpTLlq6MzvFUGhRBG7Tve
	ZtwPZoeZ0N3bOuyEcCkct85OtOWozUK/Z2/N6EQlNzUlwbaZ7FoU8LjLHNITrdc=
X-Gm-Gg: ASbGnctUJ/C6RLV2B3Y9Uv9osMNtenNVeLjYLC/8Ol3OR0EdXSr1K6UDJ+NWL78p83q
	WBYX/v4cegMO8MJOCWx7K6vmJT9+d6C4kn8fsG1FB1/lhOVZuafMRhABIzgJVUbIDmO+gtCNiGP
	oq7NKC6iCTLhqnXJEoTbN5rSjXaghj4Qe7jDomE7x2Ehm7/0Ht+tK9ugRKHZsUweJyy3HiXo/GK
	MvYri9L1pC2skPu+pL51Z//RIpvicUf4HO1KN9h8CLsb6oWPSkeKYrSGIkORTvAth+gvIhOItz6
	MxsDeL1r559sBxRU53ag1TjVTmaC17nX5HU6qyjXxRdP
X-Google-Smtp-Source: AGHT+IGIP+en0Aj0eYAe+7XhNeZ6W7zp31secPtMQkoPMAwiLZjQzktFWA/FDeyZICzvqUiJA1imgg==
X-Received: by 2002:a17:90b:54c4:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-3014e8619f7mr247106a91.19.1741883959525;
        Thu, 13 Mar 2025 09:39:19 -0700 (PDT)
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
Subject: [PATCH v4 07/17] exec/exec-all: remove dependency on cpu.h
Date: Thu, 13 Mar 2025 09:38:53 -0700
Message-Id: <20250313163903.1738581-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit changed files relying transitively on it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


