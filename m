Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743C8BCBB7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717439.1119715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNk-0003lx-R1; Mon, 06 May 2024 10:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717439.1119715; Mon, 06 May 2024 10:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNk-0003ch-Hh; Mon, 06 May 2024 10:15:40 +0000
Received: by outflank-mailman (input) for mailman id 717439;
 Mon, 06 May 2024 10:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNj-0001cU-0i
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:39 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95e7b675-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:38 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso33038681fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:36 -0700 (PDT)
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
X-Inumbo-ID: 95e7b675-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990538; x=1715595338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJvBUFAikfpz7OucuBwBiLsAEZFo3YhoCLIIuuKYp90=;
        b=V+UxY4opuLh2ap/XGQl1qSvNMNhWvIt7RiErQDbTjmCUkNSgKpZ+GQA+HOj94YIrJU
         IgcxpTNVTD5IJhjtY1WYReNiSHpMipMOaE3q5rou2l+vVDBkS7qSsqnJX1usuytZRSXt
         iky2Qh0mvZrknkmvxBey52Hb1SL+/HOmWJldUDS9n3KQIpJZQGm6OcP2uVZ/SLlQiRsk
         82GXjcTNr6LyVRRI/e6JQjj0GiVtt42lfTSuv5ldUtg0aun7ugUJczMTyz3AegfE50jy
         3w7VHcqBWRZFpKJ95UzMUTiljSW6IL2B8BUD2Z3Qpwax8xi2bEg8ggGZHyLyLI0WBEb5
         RWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990538; x=1715595338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJvBUFAikfpz7OucuBwBiLsAEZFo3YhoCLIIuuKYp90=;
        b=pogXoWFaZnY2uIp7cnV3axoewwcHx3pioCu1NqDULh3N5ciuYj3K4ZpNLygwARCAn9
         kiLF208VqHIFr/4OslY3fqz9/6jc3fbkhg95fGGOFUaMmm1anM18gYCObD2JFfDbIomE
         jV3uxf1BpcS2tnYfoG9GNs4W/JkHkQoSeGv2avUUe83AN60D2Y9gqNgN3C3FCL8sLDaV
         ewbbqIJL11rGtTgIJ6G2dm9cvx1q48VVC2WMEZrqgt+g+KDQhL7L38Nzy2EjGJgH0Yck
         YZ7cy6zectXdKPnpFPbGClZZKyE3xv+OvyQTCyMYMifut3NhN3jWQii5dvFjk/ip9Syu
         Exeg==
X-Gm-Message-State: AOJu0YxUCWGDtdA5KecLp1HRZLHJSunGLSAYofSwkkeM3JSzmCT4NdRa
	YP/SpooXQIK7PlGgCAkMhb+NwurVH1C5M9ObkwkzUg6cPzJ7g+A1u5sppg==
X-Google-Smtp-Source: AGHT+IFeV2fdGTFPUqK1aGKrd8GUTySyeD0VJX0V4TFsFPrwd6qKIcK4SgxWip01sNT5PTe+gUQbWA==
X-Received: by 2002:a2e:9482:0:b0:2e1:d48e:d5b3 with SMTP id c2-20020a2e9482000000b002e1d48ed5b3mr7502821ljh.20.1714990537078;
        Mon, 06 May 2024 03:15:37 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 09/15] xen/riscv: add definition of __read_mostly
Date: Mon,  6 May 2024 12:15:18 +0200
Message-ID: <7fa7b60b4b66f2801de28195de8872050643a741.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
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

Considering that there is still no still final decision regarding patch [2] my suggestion
is to merge RISC-V specific patch and just drop the changes in patch [2].

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V9:
 - Only rebase was done.
---
Change in V8:
 - update the footer after Signed-off.
---
Changes in V4-V7:
 - Nothing changed. Only rebase.
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
2.45.0


