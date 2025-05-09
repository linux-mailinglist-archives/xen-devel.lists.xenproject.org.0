Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99ADAB1985
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980135.1366650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6s-0007Nh-OL; Fri, 09 May 2025 15:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980135.1366650; Fri, 09 May 2025 15:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6s-0007Ht-Fz; Fri, 09 May 2025 15:58:02 +0000
Received: by outflank-mailman (input) for mailman id 980135;
 Fri, 09 May 2025 15:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6q-0006Ks-I7
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:58:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a4a4f8-2cee-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 17:58:00 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-acb2faa9f55so288884466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:58:00 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:58 -0700 (PDT)
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
X-Inumbo-ID: 61a4a4f8-2cee-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806279; x=1747411079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPNXFitrsuhjSLUmzL7Et58soUtc/i4BVkSK0TPuQwk=;
        b=FHetQPJsczhh94HI7lWHd4tbL1gzKKg5DulRWGvUkgbE+fC5HJL78J0GiYWhVtu7nI
         6J5MxYgh6/ERf1ngrCIdHYyTPDWvGdLrcoxWizcXeDgbGGVVzW1PBh00s7kw+5eBUnIC
         GL0yLdhDVKOoAEMA77KOL8nxWdF73fvGrkABOGGM9TjxiOItLPjkJJ/g3MtYj0q6ap4H
         DhiBZ0VZBfeNuLZa6i63Wo/o5gIIaOD6CKK7Qh1/yrbQSyIBGYOSMgPL2sPDKzTcQYMr
         KEnRPsJl05qqotVb1I9ATjpyqpJ4HfBs6Q2f936uqULQQfU/QEoFjg72XC31GOUVFKZo
         +LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806279; x=1747411079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPNXFitrsuhjSLUmzL7Et58soUtc/i4BVkSK0TPuQwk=;
        b=Rsd6I1nxVtjMqtOnCzicP2bLlNLtKtD4sn+t/ya2PpLuyeo2H0S0vSBQrOeu7NB90F
         aCuRu1EStOQ2Uk4pfoxp5ABDroW+2WeAlORQSV4Jpaz71q/I769B9Ka8r1Q59Yb4lSFW
         HnsU3RdFOW4vJ125ZWr6y6GfoBv+zY0t5t0rBkikDlgV9Zmh1xphlCq1SdNWur4DQLiN
         MzTsDoRPTLmQ07ahQtsUUvxeqbssH3pxeoOozLlgDL+0VuNgNfMa1kyJAuuQKzx+E7nL
         qQLNakJB1tQR1Bpxb/IzIoKKv0ga6/w+AevgWriLqRLv+ugd1HG7nTvfg2HqYvkTMJn3
         OGRg==
X-Gm-Message-State: AOJu0YwheeMdfoOr7/7pxpAnrf1lAKP6X8HWF3InU1aWW/lwK/nlhPIZ
	iTFNOufIL8Q+T2uVauUTk9G7pdGHMYovjKcG9NgQEM83a2CsIdDYwZjxSg==
X-Gm-Gg: ASbGncuwRMNm2pqxQ2jc6Hr47wPSR5OsioncFWCzV/EF5Lc5+tQmaBwz34tsWMfYlLu
	1aBzGHxHKed9C5KTITvLu7YiDtuHQQyrRtgVGKzKyyMDAg80kSZ9cAY94SVLpnq/1T0IhcxCJzP
	ZBAoD95v1nRnkeDPC253yGBvmI2rsWmQmo+VqIS+ip47WS2YUjQ7P3M+YWXOfCgorjQvKKXXJsr
	Hpx+VQpxagdDhxp7zq39aLGvunXYWbla1ZUwlIjZBs15f2w2xDz9rDKJyVHpN0knZKdPNS8Hd8u
	WNdtpQRkenKq6Kx3KwyjPJVRb53XoxN6txdKcOQVyceYqLwP9uU3RCRNVwK80DmaNFxG8fLCOIP
	ganAwmpsrWQ==
X-Google-Smtp-Source: AGHT+IGnvTq5n8Z2jmUY1+XRaqKd//HxTDg/6NfENTi3CHxhZgJ2aardnE0X2gAcTDFPFE8GwVaBgg==
X-Received: by 2002:a17:907:9486:b0:ace:d8d1:a46d with SMTP id a640c23a62f3a-ad218fa889amr361493566b.30.1746806279251;
        Fri, 09 May 2025 08:57:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 5/6] xen/riscv: add new p2m types and helper macros for type classification
Date: Fri,  9 May 2025 17:57:50 +0200
Message-ID: <52861198c7c363c4b0caf818345f4ffbec056337.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Extended p2m_type_t with additional types: p2m_ram_ro, p2m_mmio_direct_dev,
  p2m_map_foreign_{rw,ro}, p2m_grant_map_{rw,ro}.
- Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES,
  P2M_FOREIGN_TYPES.
- Introduced helper predicates: p2m_is_ram(), p2m_is_foreign(),
  p2m_is_any_ram().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/p2m.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 8b46210768..0fcfec7f03 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -80,8 +80,36 @@ struct p2m_domain {
 typedef enum {
     p2m_invalid = 0,    /* Nothing mapped here */
     p2m_ram_rw,         /* Normal read/write domain RAM */
+    p2m_ram_ro,         /* Read-only; writes are silently dropped */
+    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
+    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
+    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
+    p2m_grant_map_rw,   /* Read/write grant mapping */
+    p2m_grant_map_ro,   /* Read-only grant mapping */
 } p2m_type_t;
 
+/* We use bitmaps and mask to handle groups of types */
+#define p2m_to_mask(t_) BIT(t_, UL)
+
+/* RAM types, which map to real machine frames */
+#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw) | \
+                       p2m_to_mask(p2m_ram_ro))
+
+/* Grant mapping types, which map to a real frame in another VM */
+#define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
+                         p2m_to_mask(p2m_grant_map_ro))
+
+/* Foreign mappings types */
+#define P2M_FOREIGN_TYPES (p2m_to_mask(p2m_map_foreign_rw) | \
+                           p2m_to_mask(p2m_map_foreign_ro))
+
+/* Useful predicates */
+#define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
+#define p2m_is_foreign(t_) (p2m_to_mask(t_) & P2M_FOREIGN_TYPES)
+#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & \
+                            (P2M_RAM_TYPES | P2M_GRANT_TYPES | \
+                             P2M_FOREIGN_TYPES))
+
 #include <xen/p2m-common.h>
 
 static inline int get_page_and_type(struct page_info *page,
-- 
2.49.0


