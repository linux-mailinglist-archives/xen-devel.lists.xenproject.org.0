Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93CF6FF820
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 19:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533490.830224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nQ-0002O1-Re; Thu, 11 May 2023 17:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533490.830224; Thu, 11 May 2023 17:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9nQ-0002Lu-Oo; Thu, 11 May 2023 17:09:40 +0000
Received: by outflank-mailman (input) for mailman id 533490;
 Thu, 11 May 2023 17:09:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPy6=BA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1px9nP-0002Lh-Mq
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 17:09:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c949eed-f01e-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 19:09:38 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ac8c0fbb16so82671261fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 10:09:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05651c014900b002aa3cff0529sm2443830ljd.74.2023.05.11.10.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:09:37 -0700 (PDT)
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
X-Inumbo-ID: 9c949eed-f01e-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824978; x=1686416978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8bc8sBrfSe9Kkfb3sttx5nGDE1LXzDoaGCPR0OUB4U=;
        b=TR1Xt4pS5K4Vz1znogj/0rL73x12kbzbC2UCZyysdZOPd+11rHyWr9kPh8x/llH618
         N2/vKAGXJdC6OVTUN9N3Q2FN7iR1bdL3bI9xJCSlHyBokp2DMRrYMEgq5K8AGg06Ape/
         1rezhud1SRMlOd0zXlifugILIPOZV+o6qZg18jseLMqocHWfoObO8BFf2kQLk3oG134l
         9wKZilUShYfBD9slOAvNC3RuyPgxWpfNggnc9pdca9igu1/VCr23RrMdOrzcYl65DAA9
         3KWc/qCXj0TCue011TpmwW1mM3ZqLS8JfTH04MAQQRD0+yRTmKzPISi7QJCoLtZplI2y
         SWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824978; x=1686416978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8bc8sBrfSe9Kkfb3sttx5nGDE1LXzDoaGCPR0OUB4U=;
        b=WBW2JdVzIm30nqU8MXcMYFPT0QfDSPEnNIHfJzgBt9Fz9ZhF1SmZzNSu8vfv0lGe6U
         +5NSz3dO4njzbMZmBZqYGM1UdyGE2gPK+lrGBiuHMjX0HfE9Yu0Y72QPoMMi2Gmlz7T5
         1GI8rmeOp5elHsM6DHwiKQSIxUoSnSMCcmJhfr0nym/X0OTlTPZl+6DDfzz8zkoWXmg/
         oNCmqcprb86BM9k8TV5q7tAqRSQhfQwacoRaG5ygHx4tPKl9vLgIaxHdTXXNoTC7XVWO
         TezjonZMLPpJZ0Tl3QwP4aYxtY8fl+CaSiyIo5jFXszJgngLvNJBmW+sSGyFKnRKY0ua
         yozg==
X-Gm-Message-State: AC+VfDxhVJsWcXYSFk4uD9bjHcF0M67qUxiURTBJyQkT6jRW53OfcKC3
	t0pjn70ctF9fK1uIbgVvuoLJnewjbSg=
X-Google-Smtp-Source: ACHHUZ5StywoRO9/FVyt83hqn6Wq7FxO91WQxwO81pg8PQemoYjsnLzH82cDNAhPhqX7mtRiQqb5hQ==
X-Received: by 2002:a2e:a1c7:0:b0:2a8:c520:da1d with SMTP id c7-20020a2ea1c7000000b002a8c520da1dmr3066201ljm.29.1683824977866;
        Thu, 11 May 2023 10:09:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 1/5] xen/riscv: add VM space layout
Date: Thu, 11 May 2023 20:09:29 +0300
Message-Id: <7b03dbf21718ed9c05859a629f4442167d74553c.1683824347.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683824347.git.oleksii.kurochko@gmail.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also it was added explanation about ignoring of top VA bits

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Fix range of frametable range in RV64 layout.
 - Add ifdef SV39 to the RV64 layout comment to make it explicit that
   description if for SV39 mode.
 - Add missed row in the RV64 layout table.
---
Changes in V6:
 - update comment above the RISCV-64 layout table
 - add Slot column to the table with RISCV-64 Layout
 - update RV-64 layout table.
---
Changes in V5:
* the patch was introduced in the current patch series.
---
 xen/arch/riscv/include/asm/config.h | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 763a922a04..a53833afee 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -4,6 +4,42 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+/*
+ * RISC-V64 Layout:
+ *
+ * #ifdef SV39
+ *
+ * From the riscv-privileged doc:
+ *   When mapping between narrower and wider addresses,
+ *   RISC-V zero-extends a narrower physical address to a wider size.
+ *   The mapping between 64-bit virtual addresses and the 39-bit usable
+ *   address space of Sv39 is not based on zero-extension but instead
+ *   follows an entrenched convention that allows an OS to use one or
+ *   a few of the most-significant bits of a full-size (64-bit) virtual
+ *   address to quickly distinguish user and supervisor address regions.
+ *
+ * It means that:
+ *   top VA bits are simply ignored for the purpose of translating to PA.
+ *
+ * ============================================================================
+ *    Start addr    |   End addr        |  Size  | Slot       |area description
+ * ============================================================================
+ * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
+ * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
+ * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
+ * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
+ *                 ...                  |  1 GB  | L2 510     | Unused
+ * 0000003200000000 |  0000007f40000000 | 309 GB | L2 200-509 | Direct map
+ *                 ...                  |  1 GB  | L2 199     | Unused
+ * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
+ *                 ...                  |  1 GB  | L2 195     | Unused
+ * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
+ *                 ...                  | 194 GB | L2 0 - 193 | Unused
+ * ============================================================================
+ *
+ * #endif
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
-- 
2.40.1


