Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3262849E38
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676196.1052167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xi-0007Zh-I8; Mon, 05 Feb 2024 15:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676196.1052167; Mon, 05 Feb 2024 15:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xi-0007WS-Du; Mon, 05 Feb 2024 15:32:46 +0000
Received: by outflank-mailman (input) for mailman id 676196;
 Mon, 05 Feb 2024 15:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xg-0007Hv-1q
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:44 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf39f89-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:43 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5114fa38434so1247127e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:43 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:42 -0800 (PST)
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
X-Inumbo-ID: cdf39f89-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147163; x=1707751963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qHLrKRIvGr/pj6MSn1px01rEsYpCg0fb7RhU3fagZE=;
        b=VwYgLVao75azo8Ad0pvpJIN0O94E27TZy/e8p1lulAzitQca1YF5COBtSFEoAbekzi
         n5raDAoih5eimQizJYD6tGsGHPLtbqWbhKt50a5DkiHxksBXVndupx6aatoRHB3Mdtb5
         INDq9Xw6MC9PGN/6ve6inFRzez3vCW+0appx/AI97QSXBys/vN5rfkv1BGUTWRWONRtp
         yEcE7N1aaHOnTgkhuNxTIr4RpGIxTzPYHPE/G3OJgE5edEJsceD+u/WRBVOVTr5H4j7K
         4PDcAM9+D6jrT7rJG9HQQ7ISNhixd7w+LGlLRCLTih8jna6TaTzxZb151fRonGMlBYEX
         wj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147163; x=1707751963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qHLrKRIvGr/pj6MSn1px01rEsYpCg0fb7RhU3fagZE=;
        b=PwvPSjLd70kE7kPbfn674rrRmuzhkFVuupx8QiBmyqStbiCs+CAhF3tYNj7VLqwUz7
         iTmoJ9mm40wD0hjeX39gTx/NTGL/Mxu3M1yk1b5+1u4XuSiSxFIe4MpDDfQ5kr4Kawim
         9er0dL1HCvG031YLKD9SGVXUy/hsBwuQ9kM/ppqzuW5SNsEwY89xaFg8gAi9MaJlHOMW
         EhixiPBNuhuaUg0pnzfKzmMjzbTQxZ9/1yrGjiqkCoQ6gtrxSNFpFObDGXHjj4DJb4YA
         mfFDYMnUwm88Lfghxph5ub3NwBpUBM1sVMUUI3ZyirObHWortOgieoa4HmNaRAbAKbcY
         VS+w==
X-Gm-Message-State: AOJu0YyuBhUsRwF19l1VldMGfTkpbc2DRmK9gahYOKZ0p+SC9mwfFXtS
	8JPA6eJQaEWutf1SgVjjDPsyi3gkDr6ySVTorZBIOifpRP5HizS027l4uBj/
X-Google-Smtp-Source: AGHT+IHIA8wkaD2m5YuCwoeg2lrGgd+V9iJbriZOzQfA4jKlxnqVtqIuodYTcjXqoKuOXiokAircvw==
X-Received: by 2002:ac2:46c5:0:b0:511:4ab5:a5dc with SMTP id p5-20020ac246c5000000b005114ab5a5dcmr2980586lfo.44.1707147162678;
        Mon, 05 Feb 2024 07:32:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuqtsQu29gubfjte2Td+r0JNm/Gnl3mOFEdno4vV4QCgS0EPmwW9S5olZ+IFUhzMyaDGnSFjyJZTXd+NaXFoY3dQrX+mFukZGdQcrS1r6xSQ/QXz4JYOi0pj+CreU+9VMPvn9aoH5Zu6bG5J7yZizNK53yr0EOZk9WnCqKdnQD4Ex6pNZXMEaaWbNNq6IojdYyFH+RBiA5tqElR+i0sh0/4HydrebivnSu7Q9Xs7FvFSbyfnjfhNYdfVxOMKji5bTmDnrqP6TkHXcUeqhyP9mYJ1Auk18QnroQSRHYBbSxj7d6Zt91iGFqbkbdARg4snrpWjeM
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
Subject: [PATCH v4 02/30] xen/riscv: use some asm-generic headers
Date: Mon,  5 Feb 2024 16:32:09 +0100
Message-ID: <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are the same as asm-generic verions of them
so use them instead of arch-specific headers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 As [PATCH v6 0/9] Introduce generic headers
 (https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/)
 is not stable, the list in asm/Makefile can be changed, but the changes will
 be easy.
---
Changes in V4:
- removed numa.h from asm/include/Makefile because of the patch: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
- updated the commit message
---
Changes in V3:
 - remove monitor.h from the RISC-V asm/Makefile list.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - New commit introduced in V2.
---
 xen/arch/riscv/include/asm/Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/Makefile

diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
new file mode 100644
index 0000000000..ced02e26ed
--- /dev/null
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
+generic-y += device.h
+generic-y += div64.h
+generic-y += hardirq.h
+generic-y += hypercall.h
+generic-y += iocap.h
+generic-y += paging.h
+generic-y += percpu.h
+generic-y += random.h
+generic-y += softirq.h
+generic-y += vm_event.h
-- 
2.43.0


