Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6027566A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564648.882225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPF-0001hn-G3; Mon, 17 Jul 2023 14:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564648.882225; Mon, 17 Jul 2023 14:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPF-0001fA-DA; Mon, 17 Jul 2023 14:40:57 +0000
Received: by outflank-mailman (input) for mailman id 564648;
 Mon, 17 Jul 2023 14:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PMI=DD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLPPE-0001et-5Y
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:40:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef4b8576-24af-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:40:54 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso7391572e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 07:40:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b004fa52552c7csm2836284lfq.151.2023.07.17.07.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:40:53 -0700 (PDT)
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
X-Inumbo-ID: ef4b8576-24af-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689604854; x=1692196854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86bE+p7Hxw5Gz73vFM8aRB3dE1wjdojg3oCvM9iMbYA=;
        b=ktGc+eaqEDQhLhlXkpPMkf8Yup9uv3ZZhwUvwN09uESTm9HKRL9YoDUgcoHLb2btJt
         N/aN0QXVuew9ot5rVdeWLyZajsMS07pr0I4ATaBkTsE8DksgpciHsqZwDEfu/VpXwhyd
         PdQm/rPTPI88Yp6UJ1PrUCbWawknzNBVtZgoO9736rURXADiQrAWDbwpjdqqFmNoWXmk
         roLAgLTnAznXXMf/nTdheqrlMSL0Ee09cLyJ1EpbCRZYnEBrpijqSO7bcdENedKxXGTv
         huiJH7CXoOb/wEzTD83e4Bq9+mCNdIoSchG+yBuoz5h4p0qY/PTIkH3PjknX/JDvdOJp
         Mh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689604854; x=1692196854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86bE+p7Hxw5Gz73vFM8aRB3dE1wjdojg3oCvM9iMbYA=;
        b=ehAjnrq5Mb9QOtDXpm7IAEbDWrqgFv+zmZ6OGuQFsz/QgGWRjvSSMx6gTuO9/zsJdW
         X/NAbNvK4TF5C5tQLef+7OlFRVfb3OMHJF89AWcUjATPl9mU98IxqeVlAJAVJ/VMI73r
         TNeLEqJ6b+DyxsbiXVM3y05qtrWoQaYqDvPLQlsMGRkC+OYqql4oy5plWSqjPMXQat14
         eisGtFXCOdNesL58+azC05zdhkE7XQj5zAEOAwLpP+8Z5mUp5jcAR2562OnRdziyoMto
         35LjDSmPdQ70nDmvZcNKI6PswJARqhzQRJzIwKfSt/rwACyKozOSRfSk2CN6QOv/go5r
         MfLQ==
X-Gm-Message-State: ABy/qLZ0Jme0Br5mr5QwxrAlDF0BGsKtAW6yU33BB/3Rm/tgVw1LBezR
	6JvonDMG0FXc53qIYBT3KRSsvRdcXTfn0BTx
X-Google-Smtp-Source: APBJJlExYZ0gpssEtZnQNPUbtq40+5t2KLQdYzOLL8k+/bK9K37XH766j4UGRGKf4M95Z6MdWC8O7w==
X-Received: by 2002:a05:6512:39d2:b0:4f6:3000:94a0 with SMTP id k18-20020a05651239d200b004f6300094a0mr9538264lfu.61.1689604853957;
        Mon, 17 Jul 2023 07:40:53 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 1/3] xen/riscv: add SPDX tag to config.h
Date: Mon, 17 Jul 2023 17:40:48 +0300
Message-ID: <2e4580f06b0b9d3b98e70536e3b2b990ec4269a0.1689604562.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689604562.git.oleksii.kurochko@gmail.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch
---
 xen/arch/riscv/include/asm/config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 38862df0b8..fa90ae0898 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #ifndef __RISCV_CONFIG_H__
 #define __RISCV_CONFIG_H__
 
-- 
2.41.0


