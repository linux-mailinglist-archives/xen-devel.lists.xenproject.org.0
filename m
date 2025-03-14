Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397BA617B3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914972.1320637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t3-0003y7-FL; Fri, 14 Mar 2025 17:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914972.1320637; Fri, 14 Mar 2025 17:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t3-0003sv-8v; Fri, 14 Mar 2025 17:31:57 +0000
Received: by outflank-mailman (input) for mailman id 914972;
 Fri, 14 Mar 2025 17:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t2-0000xy-1c
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:56 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f5e975-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:52 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22398e09e39so51803695ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:52 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:50 -0700 (PDT)
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
X-Inumbo-ID: 36f5e975-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973511; x=1742578311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=f1rpiZP08QqLZ0CE8ZYBaNMBHT3mDjfkuGEoFwa5xnlGPoeDoXlGN79fNiMqYibPe8
         6qjKXtbQ0Szb3u29Rq7MYzy2p+Q0GWEJQYfNkKPlTQLvtI8B3Q77+fR4OSVItNkJ8kxR
         Q5b7Cu9HZteDdU3oJcajBfg+F2LFunfmAuK9ONPKq+XuAxIDxsURbjKYsdaNSgfsTa34
         Xs2W6aZp0m89YouxjIhOLiEIc+KXRO0s1O8xkLcIRAa1Y9Jn/5QHxh9SbenchgVqo29d
         TPMZCdG3qVvwlGZKqVJc860PH62lrEwu3CwCr7Nzo2HFNSyMYL+zKo2B9UYqA8rNJzVT
         I9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973511; x=1742578311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=EJ/ie68UtR1IP4x/+5dcgMIzl3T30uvYXXJmrVC/dxFq2A4TJe5/CS/rH/R+xmx5fY
         7JQ8obTcPAdtFhVaAitgwFM1OcTyhZI+LKmbMN01cRRo/OYcQJCrZmufOXWbWMPnI3Co
         czWtmxhJdzCUNUW77JHo9Oh4627IyVTU29IayCJjY8T4uyQ3BJW0So7Zp06uouSfaET8
         dfEEWfNbg/H+vQbjOzjEBuk/Thuyab90vBCcFKfB49jc5QaY3MATtA5wD6A033LMKPzn
         lZBX6WflDB3mzkQxEh9jkcs3Wnf+z4Cq3VkLMetLSv5CumY4IWK4tLl1i2UWKeC1NQTm
         1mpw==
X-Forwarded-Encrypted: i=1; AJvYcCVDioyIjEYGXl1AtwooesWV2bYFCv3QAxAHOj1/0dE+EGt9K50fuYbuveb27cwj2p+9RBXrP9Hf4wM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1RapwBRmDOG+F9TY8UndvNLw+skM5Hc7iZ3u38+9uC3PLs3XP
	8ikioUPSCkSwU0eW5/9E2qhcu4Sg+VYb3QJaJ0F9aQv5kQdS8fsjYUzf3SxQw2k=
X-Gm-Gg: ASbGncsFXSc5mpz93nx+jLZOpD3h0YwrBNlMhS+ryukW0iVJ+NhkBsDp59pEhRsUmRI
	V/FtN84h3ETpRItdKEi18XbGPCIF8h73bIIxGhU2tKo8yUL2kb+FokUI77fV/+8SXHxrIERcSLy
	nwF1CTkyBM15j/cI5i46i6JLpAOrCErPSsOxzWlrXDh1NK/p2DcJcqxLU1YaB+BH9oh3yKQBEhA
	calnf9xlspaUMl6Gb2V5xG4zz2ROKP4W/CAuDl1kdIEAP0SBtjwCsI3Bxrv8AMYa7UvdKNAqfER
	amJcP8gQIgdbvVNYl+LY2sNt6A4U0wQ1m7+8QrCywy98
X-Google-Smtp-Source: AGHT+IHrpliMNKDFJoDtMC4n7ul1BPKlqc8CVK3A1d9AQSWcUHjtbEMPub70Om5ILhqP0o6bsvQnoA==
X-Received: by 2002:a05:6a21:9005:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-1f5c117e146mr4872005637.13.1741973510710;
        Fri, 14 Mar 2025 10:31:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 05/17] exec/memory.h: make devend_memop "target defines" agnostic
Date: Fri, 14 Mar 2025 10:31:27 -0700
Message-Id: <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will allow to make system/memory.c common later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index da21e9150b5..069021ac3ff 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-#ifdef COMPILING_PER_TARGET
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-    /* Swap if non-host endianness or native (target) endianness */
-    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
-#else
-    const int non_host_endianness =
-        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
-
-    /* In this case, native (target) endianness needs no swap.  */
-    return (end == non_host_endianness) ? MO_BSWAP : 0;
-#endif
+    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
+                       ? target_words_bigendian()
+                       : end == DEVICE_BIG_ENDIAN);
+    return big_endian ? MO_BE : MO_LE;
 }
-#endif /* COMPILING_PER_TARGET */
 
 /*
  * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
-- 
2.39.5


