Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E965674258D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 14:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556809.869584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaQ-0004ai-Qi; Thu, 29 Jun 2023 12:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556809.869584; Thu, 29 Jun 2023 12:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqaQ-0004Yd-Ng; Thu, 29 Jun 2023 12:17:22 +0000
Received: by outflank-mailman (input) for mailman id 556809;
 Thu, 29 Jun 2023 12:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEqaP-0004YX-PX
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 12:17:21 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e56952b5-1676-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 14:17:20 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso73692266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 05:17:20 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b0098866a94f14sm6773841ejm.125.2023.06.29.05.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 05:17:19 -0700 (PDT)
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
X-Inumbo-ID: e56952b5-1676-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688041040; x=1690633040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B6K7Uvi8FFL++kLjnQI0eF2jsyd8bW5W+dYQU6booM=;
        b=ATPudzCeyZXToN9Jbfciu+XmAGqZp7gcg3yfulRB+fkAbliujipMa2B1Ap6V8pMO5D
         uIR2ny8ShOqwj4xWwLUUZRWvNbByftom5QkWIREsaRu4RcHHbLx+P9F3bhXmfcfUtI80
         fh5ekKHNQFlvbKmtJvbvapZ0xKnfD0E6HBpNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688041040; x=1690633040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B6K7Uvi8FFL++kLjnQI0eF2jsyd8bW5W+dYQU6booM=;
        b=blC44XsHs7jP2mHR9LdH9bkTljbAUBRucUAqTAq+pFsNVeGILSQ29B0o/Ul5YFdZgi
         aWhxpLjp3bfz+2cWuwoAHndqA7Q7/CIuzcw4DYOs4Tpopb6nyuNbUICzFTKCoI9sk4gu
         Xeze+uBRd5tMNKuVm2LOtQxcKfYacq731iMAy9DKRX2fbGbsCCdv7tdRptjf95iuArU3
         4GuqRgZZV3tPSccrvAzDZl6Bw2SCa6pRWydLm6N6J8tJa9PE5dyYu4PvFJFqUnDJG31/
         k8oqS8KxZ7h1vzp03SzCYqRSLnHX/ATe6V17e63TSmsv9iss/xWNf3kxTSiUZjrhZCHN
         QkRA==
X-Gm-Message-State: AC+VfDwal0oS8hnp7yCFZDG9dqBwkTy3SgjW7jbpVapXy6RHTTGFX1lZ
	oihx/XGpOGzb2iDdApRkgdXbS/+N0s60lLyTbVw=
X-Google-Smtp-Source: ACHHUZ6wnctV4jAa8vvQdEo5GjSvpAD7Khq3vm25VZLJnArJkcbG8stcoDpiOq1pMnVDBs36Gmjjsw==
X-Received: by 2002:a17:907:a01:b0:973:d1ce:dbe8 with SMTP id bb1-20020a1709070a0100b00973d1cedbe8mr31376448ejc.46.1688041039954;
        Thu, 29 Jun 2023 05:17:19 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v3 0/3] Introduce a REQUIRE_NX Kconfig option
Date: Thu, 29 Jun 2023 13:17:10 +0100
Message-Id: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3:
  * Fixed a Gitlab CI breakage on older toolchains (patch 1)
  * Removed XD_DISABLE override logic from cpu/intel.c
  * Various style fixes to patch 2 (from Andrew's feedback)

This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
regardless of the runtime NX feature bit in boot_cpu_data. This prevents an
attacker with partial write support from affecting Xen's PTE generation
logic by overriding the NX feature flag. The patch asserts support for the
NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
to 1.

Alejandro Vallejo (3):
  tools: Add __AC() macro to common-macros.h
  x86/boot: Clear XD_DISABLE from the early boot path
  x86: Add Kconfig option to require NX bit support

 tools/include/xen-tools/common-macros.h |  3 ++
 tools/libs/light/libxl_internal.h       |  2 -
 tools/tests/x86_emulator/x86-emulate.h  |  3 --
 xen/arch/x86/Kconfig                    | 16 +++++++
 xen/arch/x86/boot/head.S                | 62 ++++++++++++++++++++++---
 xen/arch/x86/boot/trampoline.S          |  3 +-
 xen/arch/x86/cpu/intel.c                | 16 +++----
 xen/arch/x86/efi/efi-boot.h             |  9 ++++
 xen/arch/x86/include/asm/cpufeature.h   |  3 +-
 xen/arch/x86/include/asm/msr-index.h    |  2 +-
 xen/arch/x86/include/asm/x86-vendors.h  |  6 +--
 11 files changed, 98 insertions(+), 27 deletions(-)

-- 
2.34.1


