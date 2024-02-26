Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0431867EE0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685700.1066908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewp-00023M-OE; Mon, 26 Feb 2024 17:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685700.1066908; Mon, 26 Feb 2024 17:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewp-0001yk-8J; Mon, 26 Feb 2024 17:39:27 +0000
Received: by outflank-mailman (input) for mailman id 685700;
 Mon, 26 Feb 2024 17:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewn-0007o5-Cg
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:25 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faf19dce-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:23 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d28387db09so20490801fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:22 -0800 (PST)
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
X-Inumbo-ID: faf19dce-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969163; x=1709573963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGlTx0l/7wzx/Zv16vmoEO2TfVyCaXBuPMB/Z0fPp6g=;
        b=HRKgY2YjSz5fSZrl9lAYw2hZ0drFmb5vy/csCvf8EqQmgwI/fQZ/PneMLY/8Rbu9GB
         7JnxfqvjLyLkxSYvUWEwL2UtlHWQsbTMi93bvQJHjSEgaDQjwom9LhcmXxH6/ReqLPAh
         T7d5eyDJfewGw7LlBNhvhnNKqDmmu+fLa5MCLT0tK7doH5yP6snVsBphLW7zDb7yzQ9k
         MXNqwwnZfuNPXJrrk2HGxGE9946Dgz16lawsmI4b8/KcgCa/GtjEt6BhpC1tzMbsa9tj
         9WahmJ2e3IjMxOX+Tvshkbg1S6M5M8FmNtOWbmRZo9uHA6A3TkeTQcmAs4bZlD7xQMMe
         67bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969163; x=1709573963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGlTx0l/7wzx/Zv16vmoEO2TfVyCaXBuPMB/Z0fPp6g=;
        b=PwLDIFcEizCrBN01OAV1Dhv/QTIuq6jBlvhc1HBRotSo9x/eiKwtCqI7xKFe7K7UGH
         xZn+ZbjLwFgTi+0XpeRUfGMDyFSJaJFiewq50R25U+SO2Mwn4mWOmVFq1sxOwRUznb6E
         BdVxyHzKdUdHCoYesNd82I+JuepjrsTl7UiQ54WuvuVP+L8BSGY4sdOVVlhb6pjddUKj
         7mlexGQLgsJWiPKiBTIJMWnsZbNzKTIqYgp3SvzTX9rwMbd4UNfS/g3qcGhTX2LTSYy1
         MKwKe0F2NsJCgfrTDd8sheynQnnGSUUQGmRCQ7HopxD35tgl7JEN3x+gLEn+HYR8C/j5
         vZ3g==
X-Gm-Message-State: AOJu0YxGnTXvxwOF8Bj9ZnYAFpm1Fgl6m2VoQl0X3nQaixrU+a5qaR3u
	2g90Zgn8Vvw0ZHx4L79tsqDqHaLnTpzlLeLAwidzOWp3IWU24WMkPeo1ka8L
X-Google-Smtp-Source: AGHT+IGfvvy6IL4qNFWijrM1136jAJtzr6Qi7RCs8sZOJg5TyImx7CwaLDqSR9VkmFL8jvs2UOtDHw==
X-Received: by 2002:a2e:86cf:0:b0:2d2:50bc:99d6 with SMTP id n15-20020a2e86cf000000b002d250bc99d6mr5020428ljj.35.1708969162707;
        Mon, 26 Feb 2024 09:39:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 10/23] xen/riscv: introduces acrquire, release and full barriers
Date: Mon, 26 Feb 2024 18:38:52 +0100
Message-ID: <85eb894608120a05eb616cea721d24e02212a5cc.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/arch/riscv/include/asm/fence.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/fence.h

diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
new file mode 100644
index 0000000000..27f46fa897
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER   "\tfence rw, w\n"
+#define RISCV_FULL_BARRIER      "\tfence rw, rw\n"
+
+#endif	/* _ASM_RISCV_FENCE_H */
-- 
2.43.0


