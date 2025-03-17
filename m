Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7681A65D06
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917867.1322701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFP4-0007F3-IK; Mon, 17 Mar 2025 18:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917867.1322701; Mon, 17 Mar 2025 18:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFP4-0007DW-FT; Mon, 17 Mar 2025 18:41:34 +0000
Received: by outflank-mailman (input) for mailman id 917867;
 Mon, 17 Mar 2025 18:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIV-0006uj-Hn
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:47 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7899dc0a-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:34 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22359001f1aso41894345ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:34 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:32 -0700 (PDT)
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
X-Inumbo-ID: 7899dc0a-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236473; x=1742841273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=ou5iumzeKO3KYBOeU8S37Bw5DN7fJHy8MdESIyp/mO1Y1tYJ0TvC9cRX2tX4GJhPof
         t0nJcKPI80Z7cwHiysjNMjA6ZxQZ2URM56aJ82nfDTKSYD9B8/SbNUD0TnrhrCBiaskj
         FLaqDfsn7M/AuMJp74H9oyLiG4XWr5m9f4w/tzsgJxuBRCPv7CkkOT4oFugVcY3dqzO6
         xAoNKySLz8mi3FoHg6sVg689SsEGN/BANdMr5HLYkZuWYlrLOs2H+cxZQ00m9pA4g1hZ
         NBBSSPS0o8GPMO3WXYubIPJHFZ2UXYCnDLllAM/UI27pHKL7lEYcNtK0Y6Uqfh/lT9zi
         PuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236473; x=1742841273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=qVZY6A6xfb+ywhlckHdiD74Zy441CZDKWPzk7Rq4hCUDm10s0FRGJumVh66M6ue9OW
         WHbIOqSL366Q0iaEzeEC/zz3yF4Pr277lP4nfbSDn8rOeCyaJ8Pf7i2INU903jJVvRgW
         o2JWIYJ/32MPsmzx0HwIx3Q4Ksl9tK0p3FGgGcl7zus0b7MrUjQiSvJTXphohf6cIbl3
         pmxHJFGPYa9xkQ0RgDeR9g/mRfskvZUB2sD5P679VD9py+UlzTRGUcRyK4gkhrL5Z7vh
         pkEnw9zX14C0DcphoVOlI/yFP9Wk+1FM9XXVJKPokLhk4dOdvopzdWaV9Mg/BMfZCFi+
         hNjg==
X-Forwarded-Encrypted: i=1; AJvYcCWfVi5acfDUihYI/oUCMMFrD585Z23ccxzKPjDAWViH7HcnTUGK1YFMxMLqmxcapUPJ+WC+iJSSgRI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytxw3S7jKO4z9uVJ39SVeKfPDoWhd5oKZ0Y0v/vXTS1KZUJzLm
	U1J9d1nXXiK1Dxrea5F4J6UeuqyspZrvuzcK1bV3lKK+Ot/kumRi/JD2MuDBr8zdC20wIrLouyt
	7
X-Gm-Gg: ASbGnct4mo+SLktaOBnJEAGKSVLhjF8PI8f4a5aIjdM9hJ1k2KKjmmX3Hl/x4l0oa+U
	zvb98sZpArEx91bUs31dWScGrzmYEjpd2A8Vm69KhMyTFNXiSPjPplU9gY4hjcZ/ed+Jo1JhF6f
	gVrRRfrQpzTCZL7wzTGxj7e64mJba8gk8sWUeXHMZ2XBOCA4ruLV+pU2oDhkTxebMakI/7WCw6U
	pdDO2iKsLa1Hguxdbmp0rBbivTISx8af3xELSTbAWKIOPIgb7pnqEuBwpwPD6G6naCMrKVF9Zis
	dFz4K3eTcddq6uAYjrZPrP7IuClWdKXR9BZD9Dg5bbsl
X-Google-Smtp-Source: AGHT+IFV6DhukzDJTQhxKL2T76dlm4rDEmTDcVzAIQ6vxy9qm1/fBJU2mGtWaSFzbonBb3tr3G7FIw==
X-Received: by 2002:a05:6a20:a11b:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-1fa43cbf794mr1071010637.8.1742236472852;
        Mon, 17 Mar 2025 11:34:32 -0700 (PDT)
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
Subject: [PATCH v6 07/18] exec/exec-all: remove dependency on cpu.h
Date: Mon, 17 Mar 2025 11:34:06 -0700
Message-Id: <20250317183417.285700-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


