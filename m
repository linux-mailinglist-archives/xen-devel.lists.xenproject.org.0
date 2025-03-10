Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CBA58C2D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905960.1313445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqr-0001hu-IG; Mon, 10 Mar 2025 06:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905960.1313445; Mon, 10 Mar 2025 06:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqr-0001UE-8t; Mon, 10 Mar 2025 06:43:01 +0000
Received: by outflank-mailman (input) for mailman id 905960;
 Mon, 10 Mar 2025 04:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEC-00070S-2T
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:00 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fbbae20-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:58:58 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so7132758a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:58 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:56 -0700 (PDT)
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
X-Inumbo-ID: 5fbbae20-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582737; x=1742187537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErKU0wbfVZdnsjs5NMSuiTB4KixyX1gD9AraKkIZNBI=;
        b=OQOOlWNi52Yku4QClHAMKlQuJ4CjB0VBe4FkV7VkXKHLJrJlqrnAW4GC9v6pff6ZMf
         esaqHclwd2xg1oHwIL/YmMYmmE5YrIjlmoA3w+pVcLrKzEKL2tNWnoYrai95tTDOvaeD
         uRohAWPpd8dEqaz7VbYOBjvED7SH3BTJ1E+YqQxOKBVeC3HtAJhATE5u+KjnUTrPwEwg
         bN8m+CxS6T4OU0FkIbQ5WlA1bmIzloZBdIM/yusTsdskAR/QC9ty5HCraahwi5YBvOT1
         uXvK0qXmgHp2GT4c+YkgGzlkIYaseh7kVfLq/UnyTIEZmwC7Xq8xnaguqRpOB39CJ6tC
         G2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582737; x=1742187537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErKU0wbfVZdnsjs5NMSuiTB4KixyX1gD9AraKkIZNBI=;
        b=MQ3LyaQQmXKfg3kIINQJEVhVu/KaApGfavVOYG4OKLAbMTBLlhoUSgFX7yEZ1KIUj5
         qdZdNHk9c+o434VcqZMgcFrxBcdeGH+RLj4U0BCZYH2Eqga/0nTNx8YQ2UlqDmFkkC7R
         ZZJ+lDRj8O1T3JjOKzhJWHejPfWOVVArxG0JHepNFOVDFpPk97e+wbTaq7/ThVEwwhu7
         4Hgyv9gKUgNFO/ronc0WinAOEQKpvlZbWZHYCWx0VMhadpYXnbBBe3IFX56NxV33wqLc
         xApqtm+tyNgwFLOFvGWd94n7lL9NnemJ6ZXut+aPTNqUkTaoQ2EqmWGdR3D7tLEBC0Ic
         zj0w==
X-Forwarded-Encrypted: i=1; AJvYcCX1EK+ouxKtWrlWi2XGyQTP6Tot9MvMM72pB4lsWTXsGigUdFVgsz/oip07OExmmWXsc80+l7pWrgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9Aat/p8HPAL8ROBwxPTZDWz9d3dsZE/Op5FYjZCfPpCYFk4Zm
	kcr//U9KdMqVfpoTXyLz/EAxsu0OIRChe0hRaxRZtAQPGBwgib1RnEzw6yYdHxQ=
X-Gm-Gg: ASbGncvG133hepn4+PCY4ydt4zN7X2SNZOb+DyxMnlk0cCEWmea4CGG82B61AWk/z3R
	Z+rD9qWzsAv6JX7vGsyNz1v6kW1zrrxPG8OaHK6D8Fn8k+sFXjFwAqSkwza7y74dx3dB8Sm37d/
	X93s6ZtAWNNvZHuTgxsR/aY7ZaaBhyE0AHbvwwm50b1zEFfpbQ4mieIpSByQC72Z6z3rbJjLZCZ
	fnCMXQboMK9WGzto8eoP5VrSaROTakUmg0v6GfdgIWdLpaW11DycNOqS18mXmKjgya6W6+/Vu0b
	bcRSHkqEX1m7I/eBr+/ZyhX92oPsl7aRtt+l+lc+hJQp
X-Google-Smtp-Source: AGHT+IHO0adHTKDFbdiZLdbwVjzffyYfi7nVPL6wN+0ieHxoGwNOezFQMlR0NxHpJZQhWhI8f44U4w==
X-Received: by 2002:a05:6a21:9786:b0:1f5:8506:5039 with SMTP id adf61e73a8af0-1f585065599mr1040552637.28.1741582737079;
        Sun, 09 Mar 2025 21:58:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 06/16] exec/cpu-all.h: we can now remove ld/st macros
Date: Sun,  9 Mar 2025 21:58:32 -0700
Message-Id: <20250310045842.2650784-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions declared in bswap.h will be used instead.

At this point, we finished to extract memory API from cpu-all.h, and it
can be called from any common or target dependent code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1c2e18f492b..625b4c51f3c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,31 +38,6 @@
 #define BSWAP_NEEDED
 #endif
 
-/* Target-endianness CPU memory access functions. These fit into the
- * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
- */
-#if TARGET_BIG_ENDIAN
-#define lduw_p(p) lduw_be_p(p)
-#define ldsw_p(p) ldsw_be_p(p)
-#define ldl_p(p) ldl_be_p(p)
-#define ldq_p(p) ldq_be_p(p)
-#define stw_p(p, v) stw_be_p(p, v)
-#define stl_p(p, v) stl_be_p(p, v)
-#define stq_p(p, v) stq_be_p(p, v)
-#define ldn_p(p, sz) ldn_be_p(p, sz)
-#define stn_p(p, sz, v) stn_be_p(p, sz, v)
-#else
-#define lduw_p(p) lduw_le_p(p)
-#define ldsw_p(p) ldsw_le_p(p)
-#define ldl_p(p) ldl_le_p(p)
-#define ldq_p(p) ldq_le_p(p)
-#define stw_p(p, v) stw_le_p(p, v)
-#define stl_p(p, v) stl_le_p(p, v)
-#define stq_p(p, v) stq_le_p(p, v)
-#define ldn_p(p, sz) ldn_le_p(p, sz)
-#define stn_p(p, sz, v) stn_le_p(p, sz, v)
-#endif
-
 /* MMU memory access macros */
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.39.5


