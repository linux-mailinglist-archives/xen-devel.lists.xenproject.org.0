Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC646E7E91
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523575.813756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xO-0001hF-8R; Wed, 19 Apr 2023 15:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523575.813756; Wed, 19 Apr 2023 15:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xO-0001fY-4r; Wed, 19 Apr 2023 15:42:54 +0000
Received: by outflank-mailman (input) for mailman id 523575;
 Wed, 19 Apr 2023 15:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pp9xN-0001fK-11
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:42:53 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8444d25-dec8-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 17:42:52 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id q21so5348682ljp.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 08:42:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f3-20020a2e6a03000000b00298dc945e9bsm2945367ljc.125.2023.04.19.08.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 08:42:51 -0700 (PDT)
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
X-Inumbo-ID: d8444d25-dec8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681918971; x=1684510971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E46jpy0Zie/1cfMUcFkLi1mB8rgGvBGdIMdB+mtmZc0=;
        b=JOkinOp95RvBpDpCom11brtIcJVSBUfZN6ck+zgam3uwRNxX9SCjWu2SqRvA1EuTyH
         A4VyJiZzLCuWSZJPFlx9W82rJswDupB1BLgj0GXe3pD0QmcYKWZd9OSMaELKalBxW2Pr
         8UvvGqlXxRNWmQdMsyBzM/DSqZdQeBk6NB5NBKZ2nTyFN7eRYXtYdFEMjXcBI4TQNmib
         sqIJQNZYdTpV4l2YQDRwtXqGnlOwshTWbc56bzjg3sXBkQSFGGxUyklk3iW1KFucXAgO
         RfdMbtbuFbpGsXxs1K4faeKTMtbrHhBE+sfVUWA6AuvKSTpvxA3TLy58DsgIndGowtQB
         5C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918971; x=1684510971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E46jpy0Zie/1cfMUcFkLi1mB8rgGvBGdIMdB+mtmZc0=;
        b=UapNJct3B/qYeP11Gq9BFv040QRr130ZoakcRqNGkNaNBUi2M5bEOpd7mT/G5X3ALl
         o1bWLUZKEcnvNn1jPlcdXzygYeHEKJw2l0SQkr7+z/fdFEcZoSnxa29WHo0IXVGQikBa
         4vHl1ITzCgFA0gJK0wk72zzNpaZW4UuyQmQXFr1eaZeNgSu1KnBU1wH9xlnWhVovvlx4
         ekV1OdzhAlfOBRfZoa4nhxclhBBvX9QPOb+ot5kPuKzQQRvvxUBVpnEdKspLH8c3APEz
         6zr6EuZy9GbmpTEHJ6l1aZgAvCuz8FKIfgPFqaPIofxCD9vFV8vmzb2g0jGaOfe9QWG9
         LxZg==
X-Gm-Message-State: AAQBX9d0l6jwPRX1o4pUV01SxP0+QM4wenE3R5v2Y/NdtYzPANK8Ka2a
	NsmHGcr9FbKBH5NiidBeBc5sJOTnolQ=
X-Google-Smtp-Source: AKy350Y9kQRULjxFCNmtC9rjhZdI6coee3xk3hp29Rj7PYWHXtuixmN0nW2dU10oJ4yVUoYlrOk7AA==
X-Received: by 2002:a05:651c:22a:b0:2a7:a54b:a10c with SMTP id z10-20020a05651c022a00b002a7a54ba10cmr2109510ljn.3.1681918971266;
        Wed, 19 Apr 2023 08:42:51 -0700 (PDT)
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
Subject: [PATCH v5 1/4] xen/riscv: add VM space layout
Date: Wed, 19 Apr 2023 18:42:44 +0300
Message-Id: <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1681918194.git.oleksii.kurochko@gmail.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also it was added explanation about ignoring of top VA bits

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
* the patch was introduced in the current patch series.
---
 xen/arch/riscv/include/asm/config.h | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 763a922a04..0c860e88ce 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -4,6 +4,37 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+/*
+ * RISC-V64 Layout:
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
+ * The similar is true for other Sv{32, 39, 48, 57}.
+ *
+ * ============================================================================
+ *    Start addr    |   End addr        |  Size  | VM area description
+ * ============================================================================
+ * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
+ * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
+ * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
+ *     .................. unused ..................
+ * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2 slot: 200-509)
+ * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2 slot: 196-197)
+ * 0000003080000000 |  00000030c0000000 |  1 GB  | VMAP (L2 slot: 194-195)
+ *     .................. unused ..................
+ * ============================================================================
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
-- 
2.39.2


