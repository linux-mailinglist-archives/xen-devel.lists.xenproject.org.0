Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1AA5FC26
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912973.1319186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslcD-0000Fh-M5; Thu, 13 Mar 2025 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912973.1319186; Thu, 13 Mar 2025 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslcD-0000Dr-Hm; Thu, 13 Mar 2025 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 912973;
 Thu, 13 Mar 2025 16:41:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslak-0000Wn-KS
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:30 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d8956b-0029-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 17:39:26 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-225a28a511eso22556325ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:29 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:27 -0700 (PDT)
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
X-Inumbo-ID: b9d8956b-0029-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883967; x=1742488767; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=nIuvgRQSCIKSkJIIHuJR8fc52spkMdYUEn7kuK5KWr96zlP4qtOvtjFOVsNYvL7Kyw
         Sftprcebu+sN9gKhn3H56Q/kuWpRNaKyOxTxyhYODPCLU372Dp3UpidblW/K1a5/zTn6
         1zubNyhY2tE6DZiUWct96fUt+cv6clqjCkL90kw7Huj7p09t4V3JgPGjzBJW4hXXJxJA
         e+f90i9Svz5Wl6SH5mm1/SgalPXUC2pbyo1xwR3C1J1O5jEnemvrGaz7DwUl+01/zTCP
         ZYoInpT5e0xvlwGnWN89gr4MLJ9hszkytGPIzUsGlruMJJPyVx1yUiSDwZYmaDUugg8e
         t5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883967; x=1742488767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=UbwK2FZoVnwr1lay+QAYmTzQi68igW1AiGgAp9l6xm0Os+2Lu2DlX/s7jcIRyBp9G1
         FG6lTqRqGG1lmvCjphqL+s2/IgCogHjGYdjKSzQ4RmIqFMkGcRnVlSQ+CuZ6XTNwzeh0
         OWA3Ggqkhz8IvIeb7j+Xg1y5ObpqKBCW8UioNiHRCgIIhurzsygWjJc+6TfPtwmJIT2K
         jXM2kq31tG9bAvBrLibDVNZHyKyal+kXsdiJ+W9gVTtwMcYZthLO3staG86HiuwUYhBA
         Ac2W5GPug39la5NlDcFIu6U5ll+Vq2O40tz71kyekMpNuBSSHSg/KX06jwxeFfYQMqe4
         l2bw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/momGIpWdM+yeavkabdLmWhNcYCtUCRpwFydTIbDh887qYWn006WC94+QZLU/nKr0w6pv9Auppo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjNQbIRNymsKMcHXP4NNkBpZMJMQ+rsEkomoiOz3+ueFiw/zVt
	YqRgmfEViNde5JpVWrnv9eX75QTQeWrFauH3WT2DRG83JwAfjBJTeNB/Q9v/smE=
X-Gm-Gg: ASbGnctWsJ6qyYpjR31h1C3WTjOvI9JfGUgct3LR0Owy/U1uTkMTAQ8H9Eo2T0N3YO5
	NLcrpxaz7kloUpXshBxnBvK0Zi6Sp5T6VuWE4pHg6i60d95c/Q59T159rsjVtdvqgt8T5OjiZhx
	KDCxciKmKgDm7LPYMds5Ca9iykSYAU7d4t5jGXpVoT1y4xlNBp1cv1Kyrv9yP2s8zUUfpUpct9K
	V4Og+PfjR30Mxlw1NJVdJVK12fPB+CLeElm3yOv886L8mf+Hsr/AjrUjM6U+hvY2jgNEznPC5D/
	Rp8wDNtIj42xNSA82DY82PhLBQAD49uFPWSdoS02bbO0YCF4sr/dBK4=
X-Google-Smtp-Source: AGHT+IFcq5bUjsmA5zzk8huR+izs7UMfjfhsI/1Y2larg5eumFEccAwXse4tJs4zAbzQaGCcQS+wlQ==
X-Received: by 2002:a17:902:cecd:b0:220:e924:99dd with SMTP id d9443c01a7336-225dd8b9922mr2731115ad.34.1741883967572;
        Thu, 13 Mar 2025 09:39:27 -0700 (PDT)
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
Subject: [PATCH v4 14/17] include/exec/memory: extract devend_big_endian from devend_memop
Date: Thu, 13 Mar 2025 09:39:00 -0700
Message-Id: <20250313163903.1738581-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

we'll use it in system/memory.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 069021ac3ff..70177304a92 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
-                       ? target_words_bigendian()
-                       : end == DEVICE_BIG_ENDIAN);
-    return big_endian ? MO_BE : MO_LE;
+    if (end == DEVICE_NATIVE_ENDIAN) {
+        return target_words_bigendian();
+    }
+    return end == DEVICE_BIG_ENDIAN;
+}
+
+/* enum device_endian to MemOp.  */
+static inline MemOp devend_memop(enum device_endian end)
+{
+    return devend_big_endian(end) ? MO_BE : MO_LE;
 }
 
 /*
-- 
2.39.5


