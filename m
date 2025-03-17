Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A371A65CB1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917743.1322611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIL-00082z-Lx; Mon, 17 Mar 2025 18:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917743.1322611; Mon, 17 Mar 2025 18:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIL-0007zx-HN; Mon, 17 Mar 2025 18:34:37 +0000
Received: by outflank-mailman (input) for mailman id 917743;
 Mon, 17 Mar 2025 18:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIJ-0006VW-UQ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:35 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79546c03-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:35 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225b5448519so88590925ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:35 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:33 -0700 (PDT)
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
X-Inumbo-ID: 79546c03-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236474; x=1742841274; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=WQrZry/u3rQFy/srQzn32K/ERX5LuRjJF4kpNxsflRdD+XgMBmhJ5o13VKlOMUm+lI
         bqkHZ5QtNa5J6BFculxpo/y3jRqO0kgZHFIC79vwW+MqoS0qstav23EWa1IGYZ8zATMT
         U1lA7qxU9+WeQGs2VirkUzFil9it4K7llOSRpYs4ohvZ2COMpMMXH8DwInn3cFUqFZaL
         6LVrg3PUqlbKr3jhzOqJFAOK3DF57Texajvb+BbHk1+UxBoFh4Sr9yMxQMRNwPtM2cni
         W31REbR2q+9i/gkQpETlsPt5BEyCunyqtkzgOgz5zGjtboJVJBjo0GR3UsdPZNdlEzjz
         BwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236474; x=1742841274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=BhXRhHUm3JalkfH2a2LPXgzKDjMQdyHtf4NXpfvfG2XH3aQ6CD5aNQZbl5f4DIV5SF
         +F/9JeHmVXIkiXMKOoN7PTWhDZxGG1Mep2A4r/j7NNAIg2wrQRobKKFTA84hBg4Mvznm
         g5HBHgIpD2uLtXm52KAKxF8MfM+Ms7bwPucGaz6r/q/rmmBo8NWWtLGkQS+j47y7x4SY
         UrB+LntQLa65/PT1gmhrTrSUMECEs4FTnvgpXCrBvm+4QMJEEywiso7Fi0KFp3jn1Qyj
         YStJWIP9HM2ylcILOLkmF209jLmTngYjY8ztHJemSdcXkm2Zh9X4t6vtokOaoMVw+TkL
         Ck1w==
X-Forwarded-Encrypted: i=1; AJvYcCXpPjYMZDaDzur8oM9kNNC1nqWQPYUplDr5aZxSXle1jee/wwBrw9bqwTvSpuVy1DRktO/+knA8PO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiacCP2X/o1ztXfrB+6AofPTdFQAt1O9tpRIqborpcNwOsjp0q
	tgL8WhUz73LZYM+mTaSj+FboJhMkuM8kxIVvvsaTEvg3K/GTEGptjDDmpNTEm74=
X-Gm-Gg: ASbGnctJYDKLBAHPfCYJ1msXZALxldSFNCFqbawfLLKduwgczO42MuujZ2leCUEftTk
	TiMq35Yq9ub5M1PUJ9Ghzi7Tx/opDqAzgKUnV1pwzw50pUgXwQM0FptU/mqpZ+zdFAsaNVgXGZ0
	7wUM2vvodzpdoPdIxBR7ATbk4o/E9SPEf6mVl2/akeM+jqQj8IsDbYbc0L16h0MdCXWzyTejmZ4
	xDizWwGsX0n/djC1vVLxBHPnOjsKVdANy2Iv4A2P2BTk/T5qcbVkEg1tG+I3XCUtNwDYGZXCfpf
	yUJ8MGHjEwXpea4yG7u8mEKhg2io2EE0vuplyETueWwN
X-Google-Smtp-Source: AGHT+IHGRjUHfsZhtfemIo+dlcyT/9a20csro4vrsnSjWHRpRL87+9vnxPcq6naL2TxBdu+3gDVtPg==
X-Received: by 2002:a05:6a00:9a7:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-73722375218mr14371340b3a.11.1742236473962;
        Mon, 17 Mar 2025 11:34:33 -0700 (PDT)
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
Subject: [PATCH v6 08/18] exec/memory-internal: remove dependency on cpu.h
Date: Mon, 17 Mar 2025 11:34:07 -0700
Message-Id: <20250317183417.285700-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


