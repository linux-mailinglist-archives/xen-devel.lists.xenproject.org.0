Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E0984982
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803099.1213542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Ku-0006Pu-R9; Tue, 24 Sep 2024 16:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803099.1213542; Tue, 24 Sep 2024 16:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Ku-0006Mq-Nf; Tue, 24 Sep 2024 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 803099;
 Tue, 24 Sep 2024 16:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8Kt-0005nz-N9
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:23 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7477f009-7a91-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:24:22 +0200 (CEST)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-846c588fa63so1409205241.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:22 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-505a9f447c9sm1009620e0c.21.2024.09.24.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:19 -0700 (PDT)
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
X-Inumbo-ID: 7477f009-7a91-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195060; x=1727799860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9CJig1i8u5IsDi36lSzKV6C9GOB2ljlgBS7lSvvQGU=;
        b=gb/+R+82dRdYoftMajuBcFSzzzRHpPCeCB13Emr50VE0H6cIEFIK0cCQlmlRAX2gDP
         ZMomO471Iqu1Q6OlIMJmztJCjITbERqf6WPZ03pGoPkC7P6qyyIeCm3+ztlG4vd5BHTZ
         /GzcoQPmAn/4s2FBnFKyOSUW2JK3S1sA5KDak6Y/M/ZU1aAVz4etBW8LAZHlzmUuDOS/
         g+yV8jSQ1KUFZK/B3eW96sk0JZ26h7wGFlP0wrJdxPzYNMjks6YE4/cwHyS2BChIWzwO
         fMeKwYNaufUW2INNCxS6jFJ0HkTlJZKsk4dI+SwdCuxSq4XKygvwXFeZF0CdWq4GmlSV
         YeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195060; x=1727799860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9CJig1i8u5IsDi36lSzKV6C9GOB2ljlgBS7lSvvQGU=;
        b=PjrlD5hOfCaGads2nm98DZ7OATbQkXi7FuoHPTv95CjtLZOyFeQOi58pTkKkRFEco8
         Jkq5qTa0kMzvpoPF2UjE5EAPti1OXz08PbnDYB1Rj6cfakT847fiD4rEr69paltgPpQU
         g9thd+eWlTXxbewKvqzM87bSUTvuR1ztWOFsyKUEDiRQ8ZXxDl5OWZnM+41i7XLShT/H
         nEyyy6t5Gs6jJ+3jGfwpq1LgaCxHNH5r0S6XpmdGuy744dYrpcE53UlIB2HMD/EN/wqC
         25ZfJGW7WfQ+6Xv3s5Yj+nULV7fftTYh0IIe4X4pB26BKEql82qK+IAYN7Q4/bSFayMm
         F7fw==
X-Gm-Message-State: AOJu0Yy50GyoMfMKdX6eR/LCBBGyeiPBsz+/x6Lfk81VFkIw2SyVL9Kz
	yCmBNclPYod+K+Vsl3HHPDe5nTTZIFDo8P6ECU7sekwabJksAMnS0SKcnvGi
X-Google-Smtp-Source: AGHT+IFBD/GEOlq+4MH+47ZnN/yNKHDYkjA993DMIapv0ig7Le6AvtB+avT6gcv4xAEnM3dO6MB/pQ==
X-Received: by 2002:a05:6122:31a6:b0:4ef:65b6:f3b5 with SMTP id 71dfb90a1353d-505c20925c6mr55521e0c.10.1727195060313;
        Tue, 24 Sep 2024 09:24:20 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
Date: Tue, 24 Sep 2024 18:23:55 +0200
Message-ID: <20240924162359.1390487-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Reserve memory ranges and interrupt lines for an externally
emulated PCI controller (e.g by QEMU) dedicated to hosting
Virtio devices and potentially other emulated devices.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/include/public/arch-arm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e19f0251a6..654b827715 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM @ 8GB */
 #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
 
+/* Virtio PCI - Ordered by decreasing size to keep things aligned */
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE  xen_mk_ullong(0x0f000000000)
+#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
+
+#define GUEST_VIRTIO_PCI_ECAM_BASE      (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
+                                         GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
+#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
+
+#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
+#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE + \
+                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
+#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)
+
 #define GUEST_RAM_BASE    GUEST_RAM0_BASE /* Lowest RAM address */
 /* Largest amount of actual RAM, not including holes */
 #define GUEST_RAM_MAX     (GUEST_RAM0_SIZE + GUEST_RAM1_SIZE)
@@ -529,6 +543,9 @@ typedef uint64_t xen_callback_t;
 #define GUEST_FFA_NOTIF_PEND_INTR_ID      8
 #define GUEST_FFA_SCHEDULE_RECV_INTR_ID   9
 
+#define GUEST_VIRTIO_PCI_SPI_FIRST   44
+#define GUEST_VIRTIO_PCI_SPI_LAST    48
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
-- 
2.43.0


