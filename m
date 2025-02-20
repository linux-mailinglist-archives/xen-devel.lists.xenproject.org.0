Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC0A3E2D5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894054.1302903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb3-00058n-Li; Thu, 20 Feb 2025 17:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894054.1302903; Thu, 20 Feb 2025 17:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAb3-000572-Hn; Thu, 20 Feb 2025 17:44:25 +0000
Received: by outflank-mailman (input) for mailman id 894054;
 Thu, 20 Feb 2025 17:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAb2-000469-E7
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:24 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51dc0b7d-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:22 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-545316f80beso1151720e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:22 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54619e7bc2esm1600904e87.244.2025.02.20.09.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:21 -0800 (PST)
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
X-Inumbo-ID: 51dc0b7d-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073462; x=1740678262; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44DLzUJS4/7YPqM44qJeQqKQV9VY1XX/yd4qaNRxoGA=;
        b=hxbNu1Pge9wBWlU8TTyztJYB66BQ5y5iyX6KdsrnRWaJzn3CHY8FbioGkd0R9qdojK
         VtTsvuZh7uGTwynSh1B/Zmv6WoU4kQhxeWhYb9E8hOGmFgjFtTu+aJvVdWu5E6WMLM9E
         JCu8KjpQkaT44wmQL3fv/W7HELewydGFAs++PlmbmvAhQbBkvbGGqsWwrrK6PxqmJdaQ
         DlJvvVPXuQXT2Nw+CxDohWjiXbwiRza+kBkH9Q+7v60q3pnmx4U1OugeDRodTqCQ/hQT
         Uy/JgS9ZL1ybz2Inng9qupf3ls2/rUiFNvunkG3sUtlnhnBkef3rH4wipCcvHtGdYrXM
         96Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073462; x=1740678262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44DLzUJS4/7YPqM44qJeQqKQV9VY1XX/yd4qaNRxoGA=;
        b=heDz0ZsJvwm9p58kwDmysURuAL3n454XDCvGo00gq4CkEGXZL2EOg97Cjwo/7sFPUq
         w6bpGaWhD1xvNY0mN8+NU5qf5N8I16angx2JvjJ6/1SVpYCrnVHkkg8cfUU6yEp6gaAN
         4babROpSN9TeMugWSPFo88UGTNVe4W+QEPGu7X9MFQBIgGNuaXiZ6rQ78Uj9Ygw/KpMS
         jApL9Vn89m+3J5BBsbv0N+tgfR17ULZIeXbLELZYmzSiCknurr9JP27eOEj4C5cfTCjQ
         C3w/rMq2kaFPwRPEcBZmUvW/WQfc2vl2iGDO6rCO/czZYCJNcckNnm3gbDP+0hcNGxAz
         NdzQ==
X-Gm-Message-State: AOJu0Yz6OCKvKxCJGnVW4JFn/hnQc4oJzkbhdZ5afV77Ulgj5M4PNpRx
	HO2jBIBkU9e0+u2OA25dVkfTAYLJBX+gYYoWCP5TkU1gHmYTUEQ2Obohkg==
X-Gm-Gg: ASbGncs9Vd4lkT9HDA+gxKF11jwFlTx3Mb1SqJyVhg8op8qqSxfm9cLaFwEN/xx2t60
	ozUW9yfsbMdtuM7TM+gnnQcrs6dhTQNNFJ1Ral6X6luR5Ri41qdIc2wOKNVCA3ezlXNsC9vkjqY
	NdApKQ0KHDZQgzG/6upfiHnPAb+hNfdf5jXGtd+/Avma7ZwJUGfaUSHvmNfJVn/urq3/5c0Cnht
	GpJ4W8c0q1RH0p5i2xuQLZBaqUKJ/ZNcPk2KR1xIZjFe8mmW5m9EYp0l25baU+CeHQpPvH4v2dP
	fTZJWiCp97CN0EcO
X-Google-Smtp-Source: AGHT+IGCJ5Qn2oPaoO44iEKNWf42lK+GbTD0lueehjlK7AXXwayKrqAaXEd40cyuFunKRrfTEyV1AA==
X-Received: by 2002:a05:6512:ea5:b0:545:191:81db with SMTP id 2adb3069b0e04-5452fe77135mr7517333e87.50.1740073462025;
        Thu, 20 Feb 2025 09:44:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for 4.21 v7 0/4] RISC-V runtime detection of extenstions
Date: Thu, 20 Feb 2025 18:44:11 +0100
Message-ID: <cover.1740071755.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on riscv,isa property of device tree file parse extenstions which are
available in CPU.

As a part of this feature, drop CONFIG_RISCV_ISA_RV64G and explicitly use
extensions 'i', 'm', 'a', 'zicsr', 'zifencei' as they are necessary for a work
if Xen and it should be true not only for RISC-V 64 (but also for 32 and 128).

Oleksii Kurochko (4):
  automation: drop debian:11-riscv64 container
  xen/riscv: drop CONFIG_RISCV_ISA_RV64G
  xen/riscv: make zbb as mandatory
  xen/riscv: identify specific ISA supported by cpu

 automation/gitlab-ci/build.yaml         |  14 -
 automation/scripts/containerize         |   1 -
 xen/arch/riscv/Kconfig                  |  18 -
 xen/arch/riscv/Makefile                 |   1 +
 xen/arch/riscv/arch.mk                  |  13 +-
 xen/arch/riscv/cpufeature.c             | 504 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  59 +++
 xen/arch/riscv/setup.c                  |   3 +
 8 files changed, 573 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/riscv/cpufeature.c
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

-- 
2.48.1


