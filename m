Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91CA5B7CB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907034.1314402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvn-0003oP-8u; Tue, 11 Mar 2025 04:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907034.1314402; Tue, 11 Mar 2025 04:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvn-0003l8-1m; Tue, 11 Mar 2025 04:09:27 +0000
Received: by outflank-mailman (input) for mailman id 907034;
 Tue, 11 Mar 2025 04:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvl-0003IE-C4
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:25 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96bbfb6e-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:13 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-224191d92e4so86287485ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:13 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:11 -0700 (PDT)
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
X-Inumbo-ID: 96bbfb6e-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666152; x=1742270952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q89mBu4b5JYOE58WB93/V2zR/jXmfpOvKMtRO3aXK0o=;
        b=hqc4QmMdWFslc1XO32nbv/pPRGynF0WaOpCJJdSUi10UwTHxcHcbbisZjZQRrVrQrt
         mwCWtT3JBZX40N45xxNDd3WWYLsG1w9DSxrVpzdDatnxrDwM2NUQUeUAsixi3I3EWrAs
         Uqy5gTYBjRxNPlTRlHzBNzxODe9zFQJy0TfL1HtSGwQb4EHR+oZWzza43IMyuN7Dx81w
         du/tbvGKh0ebYoIRDLjskq3o5yo6dSsTLX0IRRve+sezG6sdJtl7EwzK31uVgCQimGgA
         rWVZdTMKKdpQHkBMmlB6zBSW6zRwNwFLcLb8zDzTMSWmV9cVumyc3unD+V27phqTHa1P
         0L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666152; x=1742270952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q89mBu4b5JYOE58WB93/V2zR/jXmfpOvKMtRO3aXK0o=;
        b=EeEUZn206JXyWLQgFg1W2X8+JjkmZNc/G9gWRR5QtxUm2fq1/55w93tfY3azXw9bOK
         baRmoXhzFlfbBdj7rOfjbShc6Whi6PvaWC1O96KnILVz2Nlm68BmQ0Vm61iqhVf9WNu9
         UxgFvbdArqBxKMoUGU1uh16qc8KBzj/bjJr4OSKlzTbUQFsRJyChB3m36E4kUn+5GZq7
         kRt3XmgwxtZAT17F+XKIqNYR05EXhu0tuVXsSEi1ptgMf8kgdmCqiazVz1ifRat68Ghi
         CyKFRLOB96KnBAQ2fr1HQz9L7ebnVXe8n4mpiDFUZCpp+x/HVkx2j7BRhG9+V+7cdt++
         wuUA==
X-Forwarded-Encrypted: i=1; AJvYcCVqsU8i3H1js8K5KmR7z5m5FLsPNIK9VWjUmoDwWa5PoeySs7K9j0ikuGO/ecRMxYB3RmZwygg0CFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ5k0po/kSe2jfCvcHOzG6FbULAJcIClee2Lc9DlFHJ6VOHZUD
	4AJ6V2Y6OeK98aQ1WW728gkpTGc3orpRT4Ub1SLo55a58EdHhBtc9LMrHIapD48=
X-Gm-Gg: ASbGnctxxNRmEOg46FFf1Kat+9nXixvUomr4UC94FcJZyDCyMqBEIX5+0xnpVSETFRG
	1JXOOhVrkZS/b5UI8j+xmfeeEsmtGHRwXcEinPJCRV8tIDMboH22amlCVPWFFzW9Q8/nWuuWWB3
	eNOVFMvPK3UQi9hodi2M1h5dHUznaBv5q/BfjoUe0PZwSYUopvo4ssUWM+k/51gF6vPMdIKrN5X
	u6DCTL6sJRwKzQk1ppX1oZ8gHq05lzafXmzKE2bFBKReTdraanJWiv/689O2xXgiv0hLVP/gsNU
	lLRvQVGwTY0AnjO/fz2HFJIrvLocFqzGo+iMeAPBzHFs
X-Google-Smtp-Source: AGHT+IE7G7QimFDknOZtg96uV2bamM0fTFqFZY88Y5t1E8IfrTFu2U6cjPQap3/Vq7WYgH3pY/scbA==
X-Received: by 2002:a05:6a21:3944:b0:1f3:321b:4f8b with SMTP id adf61e73a8af0-1f544b190edmr25270834637.19.1741666151748;
        Mon, 10 Mar 2025 21:09:11 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 13/16] system/physmem: compilation unit is now common to all targets
Date: Mon, 10 Mar 2025 21:08:35 -0700
Message-Id: <20250311040838.3937136-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index c83d80fa248..9d0b0122e54 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -2,7 +2,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -15,6 +14,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


