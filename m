Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F031781CBF2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659437.1029171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDp-0005PB-6A; Fri, 22 Dec 2023 15:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659437.1029171; Fri, 22 Dec 2023 15:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDo-0005Ie-Tw; Fri, 22 Dec 2023 15:13:56 +0000
Received: by outflank-mailman (input) for mailman id 659437;
 Fri, 22 Dec 2023 15:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDn-0000EM-0w
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:55 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6b03b49-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:51 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e3cdcf010so2164009e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:51 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:50 -0800 (PST)
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
X-Inumbo-ID: b6b03b49-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258031; x=1703862831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eSPhcTFUbPdwgMRF6vEav6OFJOc3ZFzJrrGmImsUM0=;
        b=EOGqhNVpiET431qw1h4wdrFYYucOEGr5chxN9RVNRCmkAMW5Kh/0QfBc/apq8vtaVS
         Y/bOwf2UOtZX1BOs6dRCGqHfz07iHchZzNVyLa4f5dfJ85NuPTTd9suB61XP0pG6ocOD
         6hqEIMW4mrzBOnbxN7OhNvGNobK/s/0wRkH6YzEmf6B5akQUlTWdPF9W6mxcvuMjw3dI
         99DfzJcM8RA50MnZRBD9neaUtduEfsE53OggZArSh+eBvD4108LqaUToBRffoMzMm87i
         YSyhjdJBGsjEw1ALLr3EdRwO1bXyJB5Axr4LrpyY2eP/KL9+McejE056t8xNzUN03xBG
         o9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258031; x=1703862831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eSPhcTFUbPdwgMRF6vEav6OFJOc3ZFzJrrGmImsUM0=;
        b=AIUofAPWslNPup/RTc+1f2ohAiFJmtWhvAiTGTQl4HGwWZU3T4L0DT6HDDiXOoxBwP
         SyidFTHP/DR914XdUd76i3kRNUtlBLaULUeP2TucHfoQNlLJdUodjPT5fRFrtlIINgfj
         9uzKhAF0L8FK/HUlrm3BI5nKS3LMWW79DHiNNOkN27VQfkUR60fg8uRo/x3PLzUL7R0O
         zBrUpcC1OjymGGAEW0rKiRPxw/xWt5bf7JFoh4lTsJ71NFk24s0coXtk4fxmSFXaqXHJ
         gZJHULv4KFfa5UX8GK/Ddu+vFRTjKBif2Bu3ncgQxStAOIC3vJUUJlqDDlZaoLs1Rq68
         2vfA==
X-Gm-Message-State: AOJu0Yzk4s+9B2ed7q0u3G1row65yuzV8yCQOUyUV/Qw0eKjSOOf7uk8
	dwVXCGF8dqytqvsoABY3ynax39oNjF0=
X-Google-Smtp-Source: AGHT+IFEsG1MNqzjtUyGkWJ9ZAJ+YosHac50huzAaqYgJlmtxmj/WwHQhQuiJDgzV9FUBmOvcwQc8g==
X-Received: by 2002:ac2:5ed1:0:b0:50e:696e:168d with SMTP id d17-20020ac25ed1000000b0050e696e168dmr406590lfq.10.1703258030783;
        Fri, 22 Dec 2023 07:13:50 -0800 (PST)
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
Subject: [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
Date: Fri, 22 Dec 2023 17:13:10 +0200
Message-ID: <0ce2db672e336896761144b81b21ddf89329e00b.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.43.0


