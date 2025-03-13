Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD28A5FBFA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912885.1319095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaa-0001RO-LI; Thu, 13 Mar 2025 16:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912885.1319095; Thu, 13 Mar 2025 16:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslaa-0001Li-7z; Thu, 13 Mar 2025 16:39:20 +0000
Received: by outflank-mailman (input) for mailman id 912885;
 Thu, 13 Mar 2025 16:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaZ-0000Wy-8h
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:19 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f573a2-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:18 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso2532000a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:18 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:16 -0700 (PDT)
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
X-Inumbo-ID: b4f573a2-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883957; x=1742488757; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=cI0QjfoHLLNNzGPcxeGESaVdGZrSaLwwu/74qBl6ZQ/AQhcFSoUBqdiDbTiojDy2wl
         XQaILVtHLtALVTihX4kzUXaBFWGwcFwEo3K5hpONDd1sC2U70xQWKC3LmFxAeV3FUE7h
         rpn14LnHoEdXS6nap8Aavb6+6d/fE6r7UJH5RwUwEn3P0CLINcGRV8Zp3dj8egd0vo0D
         duzy913qZPeWprSCYZSUQfkmkDcNJsEFRJHkMSw9VGI/SVRVBMsQKPLen2Km2hv7NlGg
         EJ14YiPFpJCupgU8RWGYZCpg4QGMla4XPNaFAUqnQbMmzW0sA24nkIgqttKwjVYayOzh
         /rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883957; x=1742488757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT5ohu0Ui7xrH+jgYqMJMpKemGPcZNvy7jzdyuAyzEs=;
        b=VqPu4b3nAPQ27TtVKzeS9rR7hf/HzlFntVMmWDfZ4HwbXSp5mBQTEZxiWdSst/PUCB
         M7OVKyhUqMOj2hGAVf+25q37OCUmzoQ7Fixp8APE53z8B0gxVu93BAYqmPEk4ExF9xws
         vgR4o/yW5tz09Otn92QfU/aKSs3kGo5o6tV44LP4Z5WAmISBVm157x4ffsKzknQW+rei
         ICQm7sapxijoy7wxDlmOk06lcrnoiDeNL5RzKTn0p7QuqNvJAVylbq/6yUzFmhul4FnF
         4Q//4rgENx5/vJ6+2xPyd/uGMYbL37n5yg5Y+iOwAxu9IzsJ43Dh6BSd6PY2cPziHxt7
         B+DA==
X-Forwarded-Encrypted: i=1; AJvYcCW33ugIQcJvPtZTKCk2lrDpZ6WYEdjc1Sx6qvPGUK54ZN5ae9RLPSRY1bIppDMNCaAUGk+SckCWwaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLF/+8SdGtj8+tqTSvuYe5x/fVKEZhLvPMv7cxhDJgN3U4c5nv
	RItd+D15KXSSBzyLeFmxcDwxi4JJLdQbB6+58jlEVWnSyBdG/auzAxrTu67gpZI=
X-Gm-Gg: ASbGncv2J94Gl45mznovyUA/rP4G7SylsQLPUKm7u6WFny3VTBwh69/D6hZk9643p3+
	gHfO8CV0wzo2/Oozw1NmEQvb7VP3VR6NjYtNxBwjtcSJnza3vUpX5ssetuOndx1UVZGb09/6EeG
	qFAWLYm4ddSRhESEZVuQK2bFjziHrOKZE4q/DsGeWH7G5RaHTz61PMfdw9ohVHM6CGWCLybyDkC
	F/aZ9gzB58JV/3d/hY5qqvaBfG49Uxx0sii5oefqxE421ESRRaTIA085MT0fpsOm9uZ1clZSzhQ
	D1njUQ5bi/BXh/udpLE+HM7Cy95ad5m0WjQRvio19imC
X-Google-Smtp-Source: AGHT+IGT0TQa6IzxQKmV0c+iT9Ap/Go2mov47rFQ/lft0hbXJmOXflaiO0g7vmiNGPWVgJAiRn5xgQ==
X-Received: by 2002:a17:90b:2710:b0:2ff:6fc3:79c3 with SMTP id 98e67ed59e1d1-3014e8435admr275040a91.9.1741883957269;
        Thu, 13 Mar 2025 09:39:17 -0700 (PDT)
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
Subject: [PATCH v4 05/17] exec/memory.h: make devend_memop "target defines" agnostic
Date: Thu, 13 Mar 2025 09:38:51 -0700
Message-Id: <20250313163903.1738581-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


