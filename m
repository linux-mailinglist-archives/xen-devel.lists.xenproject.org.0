Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162CCA61893
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915220.1320793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9BN-00025E-1r; Fri, 14 Mar 2025 17:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915220.1320793; Fri, 14 Mar 2025 17:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9BM-000226-Ux; Fri, 14 Mar 2025 17:50:52 +0000
Received: by outflank-mailman (input) for mailman id 915220;
 Fri, 14 Mar 2025 17:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8tE-0000xy-4i
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:08 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3af37e-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:32:02 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22113560c57so48295505ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:02 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:00 -0700 (PDT)
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
X-Inumbo-ID: 3d3af37e-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973521; x=1742578321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=eLhi9ASUnkQSDHrVRruCp4aY65MBDbjFSUxhDau/jAY0dmG67kOl5um9BggkoDDvep
         qz6f82MgXvqvevm2I/F1pLpb78hZtuIpotUNYuFUKyh/c4AEEwxwR2vHoQL3g2YodYrP
         LZ9rfrWVaJuOfDZApwxfEPVwmCNV/iGLwWfcpHyDfaDNBFVojg/WTon5ze2FCDpnCAF0
         /Vc2O4+CsoJYgOIVHJBzMO/4frUKaf0k1QSAIAuzhE3LmmqW1x8pRVLwvvWvtesuVP1v
         ZPs7zNwtMXDcS/hzXBf9gOD35fcJtWfaYuv8MkpCXMc1zNbiR0vSD/+1Y1e9R0N/0YOA
         5Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973521; x=1742578321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
        b=JwdlmsFh1ymOkU9N/abqyDoB0r5W3BM97VujJKKJCPuNQfGDeryGhOo0XWKXvpZewr
         r3ZXc6uL56gO1gMJJaafEp12Xj9p87CNYrjd7n8/ECqh1dVJ7eTcabZz93jjuHshoTAC
         ezybPaLAg0SRSSwf+ZDgRh6azsQ0nAOgwVMzWMu8WIh0Qy5qiMuDd8bTGiytFTxtSX5/
         CLPxWXZCQq3KoczLBrC/D19auC2jLVy+H//hPja1iY48MCFMuZE47tRMQgg+pqemfH6o
         KcOvfYJOwVCdpWQgEyI+qEg6Ug69UCV2FErf8Dr2k/vJ8IAqyZe6Zb1ZAWrM0RQGq977
         CgZw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyTqPYdA3CHu8UIjwH+FyQE2u4knDrtqgbz9bSZxbVqzCFh8Q7MTuhHWOJyy37tYNRHo0D6j3Q7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0y3IAGxv4lJ5J91uLcLYEaTSCI3J5tIORT74d3jAWiMeWJsIo
	PTQe8SzXE0stQerEIs+/l7B09MpvEPR+e6S3t+X6OVwTWREZzhZAn0atM2dPVoI=
X-Gm-Gg: ASbGncsze2Bn0w7C+JxnKxMlUc4Peo474lBzacK0SV+OaPL6CUfalhPhkF2J+YFQG3j
	ppkkfFlDc4tYk6C4kpr/HTXJj2JAmQ8ycbEbwn6vNoK4xxu3uwE/Hh5k5OvhL5X0/73ZH+Zoqie
	0U79a4zViOiVFnBJsTSNyfYx8S/89MY/N1WJ57GrBo1EXq6YgU9zTb4ZTiSplYg4J1OqnoIHhEz
	puxzX6hicuskORua0ezntav3y/Mw8lnEle62xRftIK8stp1/EIydW0ZNdm7dYTPu5cI8lP5qb9k
	/ueH7m0JlxEpZ5nnKMM3mEqtOUIA8TW7hDNB7yvOVC4n
X-Google-Smtp-Source: AGHT+IG6cCxvjsVBwzL07VH+mus/++8may6iqII6GPehxKvNj4VKnHVcl4393YyfiqPTiVq1ksSu0w==
X-Received: by 2002:a05:6a20:9c8d:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-1f5c113f552mr5261243637.8.1741973521265;
        Fri, 14 Mar 2025 10:32:01 -0700 (PDT)
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
Subject: [PATCH v5 14/17] include/exec/memory: extract devend_big_endian from devend_memop
Date: Fri, 14 Mar 2025 10:31:36 -0700
Message-Id: <20250314173139.2122904-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


