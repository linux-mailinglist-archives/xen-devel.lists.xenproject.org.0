Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74555990872
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810515.1223201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknN-0005cS-OS; Fri, 04 Oct 2024 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810515.1223201; Fri, 04 Oct 2024 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknN-0005bO-Lf; Fri, 04 Oct 2024 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 810515;
 Fri, 04 Oct 2024 16:04:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgwL=RA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swknM-0005bC-M5
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:04:44 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0deeac-826a-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 18:04:42 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso301671466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:04:42 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5c3c8fsm10040166b.3.2024.10.04.09.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 09:04:41 -0700 (PDT)
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
X-Inumbo-ID: 5e0deeac-826a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728057882; x=1728662682; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGXhc0yICj2K+QEEiwngvwgzC9xM8NG/E1TGVjkBmus=;
        b=TI3dK0o6ssG2Ijpx2L337hRBC4nea8fGHml48N1fJqcCuJkO0+nqfoBN/mmJw1HE+d
         L4IkFb7BSMpQHrP0fAueU4d8OHI+Rd8aAYiO2I6/W09fyIRjsOIYaEpbHVyFp5coeRj5
         L97DaQDTN5YvjRrg7ZcB2yjoy6yeVtL5VQvQCdZ4ijnFEsIQl3tF1SStzvrEetc4PtL5
         YfXnQKV+3IiIHtjVgUDuTyMPANHaj9NRVx0mzNtityXE7RRVjpe3ZVnEHbFu678M/mVJ
         EZIRqN25iUJ/BTNHztqe7/TtQOUW+zdn/5UCg60iFpQEwOl8Y2xzwlMrzaJBcyGYaDcg
         XqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728057882; x=1728662682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGXhc0yICj2K+QEEiwngvwgzC9xM8NG/E1TGVjkBmus=;
        b=ObaCYSpzB3BZAD3yv1Zb/DVQofZmHADO6abOiRR0dgAi7wOIme7WDYryzqyiXx9FeA
         jtKgR6aIcZNBGZk2PmfOSaNYeoeBETsVGtmQZtuk3nHHR5xky5LTxlpeGVHjh/n8VZ6Y
         BvCkrI+6Jq+KZGLEXcL4RT4xTRTRTsDT+T+p0LD5t10NUjok9SVbmbSWPKJHS+zNnQeg
         w0CGfb08xzR4lScRAMKXtE9CrL+D22sN/SIC2MzZFXoD9AD2nGZf0wDaQEOnzOHJ6RV5
         1tVS19wLHxdKDTK0NtevY9ZvgZ17LXvozz9+Q/7gJwmJJQpTg9C2KcfVm5Q6okSCg63V
         VUVA==
X-Gm-Message-State: AOJu0YwiY4NYRd2h9MJlwFslU4vgrPO5ooTbMHyXoEZwgJfRaz1zKXiB
	gJX03I9tLLo/K8zFCPtUnKZlh+HUHyjkVsioRG2jUMIdvrE4vn52PE8tjQ==
X-Google-Smtp-Source: AGHT+IE7HSO6d0uXf2nrKReQy+nuyaUF/Ts9WrSMU6/kNrBrGkHabLyqXuQ5/Erdmpgnfc2DL55iKg==
X-Received: by 2002:a17:907:3f86:b0:a8a:6c5d:63b2 with SMTP id a640c23a62f3a-a991bd09b0amr291003766b.18.1728057881731;
        Fri, 04 Oct 2024 09:04:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3]  Register Xen's load address as a boot module
Date: Fri,  4 Oct 2024 18:04:34 +0200
Message-ID: <cover.1728057657.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series registers Xen's load address as a boot module and
introduce virt_to_maddr(), and drops LINK_TO_LOAD() to use virt_to_maddr()
instead.

---
Changes in V2:
 - Update the commit message ( drop depency from "device tree mapping" patch
   series as it was merged to staging )
 - Other changes please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: implement virt_to_maddr()
  xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
  xen/riscv: register Xen's load address as a boot module

 xen/arch/riscv/include/asm/config.h |  4 ++++
 xen/arch/riscv/include/asm/mm.h     | 17 ++++++++++++++++-
 xen/arch/riscv/mm.c                 |  9 ++++-----
 xen/arch/riscv/setup.c              |  6 ++++++
 4 files changed, 30 insertions(+), 6 deletions(-)

-- 
2.46.2


