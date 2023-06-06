Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC77724D8E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544184.849764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm2-0002ga-ET; Tue, 06 Jun 2023 19:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544184.849764; Tue, 06 Jun 2023 19:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm2-0002es-AU; Tue, 06 Jun 2023 19:55:22 +0000
Received: by outflank-mailman (input) for mailman id 544184;
 Tue, 06 Jun 2023 19:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm1-0002el-H8
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:21 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111a1ffe-04a4-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 21:55:20 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso7994921e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:19 -0700 (PDT)
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
X-Inumbo-ID: 111a1ffe-04a4-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081320; x=1688673320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TGArhQdSQX8UOhmIpz6TBiOEP22ajLMR7OWHR6Nu4A=;
        b=O/XGaXCCKoTPUoZQ8DfwCH/WP0x17xGqKCKSMRVwnICDn5x6+ADpIfUG2vJJxCaDcN
         QFOtJe3BevRTdoRxJ1ihm4+sKe3JcEDxsdXFX3YdPQ+YGsT14pmvjZIUNfm3DpzQyQV1
         sVz6ntBRlEqDBMyEDqmt/Phn47dsMM5EKpGP6bW/ObW/xhPDtskv/EzeaGrwm5Dh9Eup
         JIF3S1CRyf0y4cuYGUuv7/j7E4ppdu/YTOVcJg1lcvjR2QlxzsRNkH4IjTHkfq3C7COe
         oSiKG8EWvk4/M86K/1vgJf3wJayoGlvoweT7MwP38fVyJfMtgei/ecNoMkSJWBjYzHCn
         ImcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081320; x=1688673320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TGArhQdSQX8UOhmIpz6TBiOEP22ajLMR7OWHR6Nu4A=;
        b=Lw8rQ7xi596fGcX8gatd/heJjKMhtjlKlX+wRczZqo/L/Otlc2SB+SHOHeW2p/d1Zy
         xqckWYjiPUmQBHazSeVhTM61/0xKJuiHWx084BQoGL67NUGQo6E9XQpi1o7XNQ7psCYd
         DWJ3T/wdilUkPIAnoKhxtaFe+ouzSSnD8O+VJmxsY+VVIhMscSV5sDhH+SaKVUb5CKPF
         1fzJxHpTY4UlHKWstGl9q5yDkx8XZcaS3OA/F/mqrNMBHTbu/dBHPYl6PW5gqBxvjdp9
         b3A3hKhprd/YyCt8LGB5N87otJVBrrScxBsPJXf8KccIP+EcpEKFm6cFOCCvyKjtHZM1
         +Z4w==
X-Gm-Message-State: AC+VfDwW3CMGc1+FIyp8ObX2N27ittrKIOILkX3H3ufrH7k5EmcvDM9A
	l7iCDA+2d23YLSUjxQMSl6m38m22unQ=
X-Google-Smtp-Source: ACHHUZ57sB49WRMNcaI7ZfKQo7gAicuQco4hCa6Kjlrsr1+WkBj5jKHEmupI5ZX9n2A1vFpA6QoZyQ==
X-Received: by 2002:a19:a416:0:b0:4f6:116d:6d26 with SMTP id q22-20020a19a416000000b004f6116d6d26mr1219679lfc.42.1686081319616;
        Tue, 06 Jun 2023 12:55:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 1/8] xen/riscv: make sure that identity mapping isn't bigger then page size
Date: Tue,  6 Jun 2023 22:55:09 +0300
Message-Id: <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/xen.lds.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 878130f313..74afbaab9b 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -20,6 +20,7 @@ SECTIONS
     . = XEN_VIRT_START;
     _start = .;
     .text : {
+        _idmap_start = .;
         _stext = .;            /* Text section */
         *(.text.header)
 
@@ -35,6 +36,7 @@ SECTIONS
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
         _etext = .;             /* End of text section */
+        _idmap_end = .;
     } :text
 
     . = ALIGN(PAGE_SIZE);
@@ -174,3 +176,10 @@ ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
 
 ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+
+/*
+ * We require that Xen is loaded at a page boundary, so this ensures that any
+ * code running on the identity map cannot cross a page boundary.
+ */
+ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should be page-aligned")
+ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger than a page size")
-- 
2.40.1


