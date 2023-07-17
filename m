Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83407755CA5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564177.881497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXy-0006Qj-5P; Mon, 17 Jul 2023 07:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564177.881497; Mon, 17 Jul 2023 07:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXy-0006Nf-0N; Mon, 17 Jul 2023 07:21:30 +0000
Received: by outflank-mailman (input) for mailman id 564177;
 Mon, 17 Jul 2023 07:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXw-0005A3-5T
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:28 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5cc22a-2472-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:21:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so6385308e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:27 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:26 -0700 (PDT)
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
X-Inumbo-ID: 8b5cc22a-2472-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578487; x=1692170487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wSiWqYej8EPgULt6otzEwmKVlaIAponcAwfHuOJ0rA=;
        b=qZlG5/5+KozbDG0dX2Pv46WGN80L7UYXywXQ+0/2LnHsEZfdvzqVzKq6DYdlBIkufx
         MsJI0/Kv4gGhPvcwBAT2ZhvJPFKOFTlg2aqK1h7wHNZ9MBUbNJ6SOyMC8cbKmDBrAoVg
         M6Ijx/72XKfb0hklTPFpMmmd18TMEdL82yOMRO4govS81iwG4I5CW5eD+b0qOTR8d+d5
         I916oiuztElanzYWmV32MZ2DGizLFiUzzcPnF/pFm9rwv6Spuz4RkzKN6NxHYBAzJOKj
         kIzG86XXbbXZdlLfy8BWrCVrgyCULG0QcK4e5p1c8gfT5YxOw2gtrMkeQ4QZ+UQNRyOs
         PCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578487; x=1692170487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wSiWqYej8EPgULt6otzEwmKVlaIAponcAwfHuOJ0rA=;
        b=HsJxrecgYTXFegKO0rPC080T6ONZMDlWCEj4AKzqrzHTFxpTAoEkjToTQqgcn4N69M
         WGrbF8AlD+zCb96Vu9KInyUIQW+r0o+p9jJwVc9Nipq3RWJlydCrNt8fF22inzR7WL/A
         dpf6nywUqDi+k0gFGAoRweqWJjVeX7vzIO30hXDjGA+hoQUwORG0KEuOietVRlmUurBx
         Ri4bNx0u4NwX9L/ckGHAH+AiqDmmvJph/yfYD8Fc7bqWWok42itbjyXV0IP521bwEbg5
         CiJaGJkXdVXupp+094r/oeiG7OcfKZp7zYKb7L+nkxJ3/Eo6fxI6mfELV/kp+w4nhlMK
         FZ6w==
X-Gm-Message-State: ABy/qLZroWUk1bKznFvrKYo03W55wVbO0tEYV0f6C297YSHeb7D5Pi4E
	SyPartw42DanHfOzU3gpW1DdktraHE8wMME/Big=
X-Google-Smtp-Source: APBJJlHsUIExGwq/SOkJY5f47gzvIKiWT9Pe1PJHiVjY2QneHf99uvvJZtEmarMrEGqvoCJjvSgxVg==
X-Received: by 2002:ac2:5921:0:b0:4fb:85ad:b6e2 with SMTP id v1-20020ac25921000000b004fb85adb6e2mr7278312lfi.50.1689578487119;
        Mon, 17 Jul 2023 00:21:27 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v10 06/24] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
Date: Mon, 17 Jul 2023 09:20:49 +0200
Message-Id: <20230717072107.753304-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to DEN0077A version 1.1 REL0, section 13.8, defines
flags used for the function FFA_PARTITION_INFO_GET.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2296e3115beb..c1dead73d1f2 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -57,6 +57,40 @@
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
+/*
+ * Flags to determine partition properties in FFA_PARTITION_INFO_GET return
+ * message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ * BIT(6): Partition must be informed about each VM that is created by
+ *         the Hypervisor
+ * BIT(7): Partition must be informed about each VM that is destroyed by
+ *         the Hypervisor
+ * BIT(8): Partition runs in the AArch64 execution state else AArch32
+ *         execution state
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
+#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
+#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
+#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
+#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
+#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
+#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
+#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
+#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
+
+/*
+ * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
+ * count only.
+ */
+#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
+
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
-- 
2.34.1


