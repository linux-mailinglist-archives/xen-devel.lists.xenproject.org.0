Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586ADC8079F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170563.1495629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVll-0001nI-CY; Mon, 24 Nov 2025 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170563.1495629; Mon, 24 Nov 2025 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVll-0001lU-8Z; Mon, 24 Nov 2025 12:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1170563;
 Mon, 24 Nov 2025 12:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlj-0001Xp-KP
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00fcc8a-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b739b3fc2a0so576111466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:09 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:08 -0800 (PST)
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
X-Inumbo-ID: e00fcc8a-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987649; x=1764592449; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8ifjKP0EguzdGYi8KL9vzcWewOoqZ+j/iRWQquu0b4=;
        b=OmUZ4KR3Ab5Ys9R+yOlQIjRgRUsJw9aClbJrrw1kKXv9qnPCEipz5UQlWye99M+9Co
         N0V88fTasYdHPTmZf9J/rBEZ/GCb4nWk83Tpw6hDShkykYOYoWfhRyWyZbmZbJJEjMS0
         N2kB5R5uG/TztA8ok3HaxlpmbUQPF19NMM8aEcdCUhrEMVg5lUtKq5FmMS2pOuMIH1IK
         2eydHaE6eKJPkDNCCvi/nRCP/RheLMITid7wcpq4b8IEwlwPmhlXk9UpwkwFaP4mTLg7
         zorQrFOj405+pVeoa347T8r+F/BoFIdcdyT827AiW6jJp90tlCVwybEVBQlLLNV3mQcC
         AXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987649; x=1764592449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J8ifjKP0EguzdGYi8KL9vzcWewOoqZ+j/iRWQquu0b4=;
        b=Ab5QeLZRFQOgPXVh2F4lyB5Oi2FAmM/UMGcpNKYPzegsAacHHPYF2NZObkP6h8/Qzf
         vK7tOB3d8iVr85nqcDbPpz0h4VZ9Xvn3oxcfSuv8nwCicVCqTwRg488oSeAjluKx/SPE
         A6v7Il9RA7zr7tH6ePG/Zh3HWliDAGFjwPrYlQFSBcelLIt/qFfGqMgT+eOw3jNkT7f4
         isFIWN2J3baal10lCsEKVJa8FauNNulFA+LHPT06aIz3F0Ak52xU4N3Yp1UFnG+PdVuM
         VhSlvuOLVj6sUKhKMktXPE6h3Hc6VlDKfJB8eOA9XWi+jObfxHKQAW+ZMMiycqHjA88L
         mt9A==
X-Gm-Message-State: AOJu0YxaF64ZE8DiRGc/oWi53LUowQ91egfyloyQHVp1SB06IdLUWxJx
	t1cIyBprlfHgRMdlxNd66VGIa6HySNFW/PtBWIK0r0FEnYAUlSEpVjzvRziEK0ab
X-Gm-Gg: ASbGncuqXoUjNsaUTepShCYC86SsmSt6JvrKOm6afkGTIweaqQF282s8cRjyVklkdNW
	w6wp65KSKXDZ4Rj3O9v1CWXbWRygYgbeR77sUmbKdMbZB4T6M2GgVNhZvCLlHim+WGINW40xHQE
	izJun422UDPSlGJhL0Qxi0gdHltPG968O0FdLvCRF8Mkk22eqfCd6WRkfW9q1a+hmBpINhQPoCF
	9IP1xxUTVgDwykc/xrd9QIDUL8yTWsiw4pdqeYNWB01CTg/2uMwpJzkMg87HsG0pIgvBBpQ4Ux7
	2IGyYS4y6+gWFIXDjGuAnGc0gAAHXc1Ngqw72ks2kiAza8V47eSny45E43JIdapegeVFhQi2KfE
	ZgG6hxYSfrQO6azA+d+tiYIxS5ikj3NX+brZLPr3hxp0wr036Q1EmOuWq4R970odjktLwhtFT25
	3Yul8JzSCUOLrioTFXF8KBlB7c1jU0lFnr6GjL40dU9yugLK3o/a0ZITc=
X-Google-Smtp-Source: AGHT+IG4wDzSKO0Vd1GcklLf6mk4Ak2TaRXHmfJt/3UODicn526SnOfRaen4zX2ZTnqSem0V63HOrg==
X-Received: by 2002:a17:907:9495:b0:b0e:d477:4972 with SMTP id a640c23a62f3a-b76715dcdcamr1133510866b.25.1763987648793;
        Mon, 24 Nov 2025 04:34:08 -0800 (PST)
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
Subject: [PATCH v6 01/19] xen/riscv: avoid redundant HGATP*_MODE_SHIFT and HGATP*_VMID_SHIFT
Date: Mon, 24 Nov 2025 13:33:34 +0100
Message-ID: <f2f2e4ad98ca11763a4b754b80ea79121468ee36.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is sufficient to use HGATP*_MODE_MASK and HGATP*_VMID_MASK without
the corresponding *_SHIFT definitions.

Rename HGATP{32,64}_PPN to HGATP{32,64}_PPN_MASK to more accurately
describe their purpose. The top-level HGATP_PPN and related aliases are
updated accordingly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - New patch.
---

 xen/arch/riscv/include/asm/riscv_encoding.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 6cc8f4eb45..fd27f74cb7 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -132,15 +132,11 @@
 #define HGATP_MODE_SV39X4		_UL(8)
 #define HGATP_MODE_SV48X4		_UL(9)
 
-#define HGATP32_MODE_SHIFT		31
-#define HGATP32_VMID_SHIFT		22
 #define HGATP32_VMID_MASK		_UL(0x1FC00000)
-#define HGATP32_PPN			_UL(0x003FFFFF)
+#define HGATP32_PPN_MASK		_UL(0x003FFFFF)
 
-#define HGATP64_MODE_SHIFT		60
-#define HGATP64_VMID_SHIFT		44
 #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
-#define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
+#define HGATP64_PPN_MASK		_ULL(0x00000FFFFFFFFFFF)
 
 #define PMP_R				_UL(0x01)
 #define PMP_W				_UL(0x02)
@@ -166,10 +162,8 @@
 #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
 #define SATP_PPN_MASK			SATP64_PPN
 
-#define HGATP_PPN			HGATP64_PPN
-#define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
+#define HGATP_PPN_MASK			HGATP64_PPN_MASK
 #define HGATP_VMID_MASK			HGATP64_VMID_MASK
-#define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
 #else
 #define MSTATUS_SD			MSTATUS32_SD
 #define SSTATUS_SD			SSTATUS32_SD
@@ -177,10 +171,8 @@
 #define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
 #define SATP_PPN_MASK			SATP32_PPN
 
-#define HGATP_PPN			HGATP32_PPN
-#define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
+#define HGATP_PPN_MASK			HGATP32_PPN_MASK
 #define HGATP_VMID_MASK			HGATP32_VMID_MASK
-#define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
 #endif
 
 #define TOPI_IID_SHIFT			16
-- 
2.51.1


