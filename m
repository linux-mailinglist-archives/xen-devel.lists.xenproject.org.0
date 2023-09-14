Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5079F7DE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 04:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601718.937838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvQ-0007PM-1k; Thu, 14 Sep 2023 02:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601718.937838; Thu, 14 Sep 2023 02:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvP-0007NV-TC; Thu, 14 Sep 2023 02:17:47 +0000
Received: by outflank-mailman (input) for mailman id 601718;
 Thu, 14 Sep 2023 02:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUwO=E6=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qgbvO-0007NP-Hp
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 02:17:46 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e24fa863-52a4-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 04:17:45 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fac16ee5fso412304b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 19:17:43 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.115.199])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa78591000000b0068c5bd3c3b4sm212275pfn.206.2023.09.13.19.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 19:17:41 -0700 (PDT)
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
X-Inumbo-ID: e24fa863-52a4-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694657861; x=1695262661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJGDLpaxVf6ArJdz/jc1JrPgtZVyyYN90LX6pOkLUK0=;
        b=DzOYl14me3Y2+muMRa7iWOcabyP66vhB++hpnlW93dmVO4ggFE/22FUm1wmDzhNEzJ
         XGgFUcJxpW6kRiX8VC/IVnI6A2mtRdQlpnipGp0eFtGATKipd1smdrE3+Gfc2a98eFXu
         U2zISmYD4mmswtLmfCzuEr5+GCvTSVfJk6J9qSZmbK5tj+ZcZ9vbQ61+SymQQ0U2hg+L
         IWGFlEdrxaa27wa5nH8itGVA6cwLMZaTElQlJDaBcZ1AI0pdO4+oVN+lWbJDWe0HoYKB
         2S3KIKiGOvFdhi4corntGH1CUA+vmtH/7NyR/Kh7A5gowsyJoW/bT2+MNwrhSTR+7siU
         4oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694657861; x=1695262661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJGDLpaxVf6ArJdz/jc1JrPgtZVyyYN90LX6pOkLUK0=;
        b=RJbUzxbuz6xE/hepKV9MNaD31xADugnnjNeuh2mmaI+dNsN5/99qGKaKYMNpSL3eEp
         gj9xAdx03GYY68/nqqJ2zWCbtN+W2hzjcpNpu3iXMkn1LZJECwPyq7SXsD5GcOmpY042
         xuVaH/hvjTIxV4KFQjUeSr3Qee6jxwCXhDnhpqldr8rBwH3n3yvqRRuSIFt8+Wc0fmXz
         34mhLF1dc1iNKYlKLQ2+/T9IhHQZe27hHe3Fs7gHeybgeiqwYtIyoAn5mWSQrW3d99eK
         WTCnJGqpMBbuDmJ7jH8JSm3FziD6lf6SJJ0mB+Pq2+ZsXNhYhnxUfQz7P0UmcFMSsSEM
         Fb1A==
X-Gm-Message-State: AOJu0YwBtKbl7LpbuqqSK5eYkFAxm4E+TdHMNAX0z/MJ3zHhYJPzUIst
	lukXEXdO/IHRDtorSO8gd+4s6vpnXPzv9P5HQ6K6vUs7
X-Google-Smtp-Source: AGHT+IHQDm96igxxrGFmGTp/0WWdX5JAwJfCeXtmWixTZ8P8LK8LRHwm5zGaVkdNWa657ptgzQCZow==
X-Received: by 2002:a05:6a00:1951:b0:68f:dfda:182a with SMTP id s17-20020a056a00195100b0068fdfda182amr4547346pfk.26.1694657861346;
        Wed, 13 Sep 2023 19:17:41 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 0/2] xen/arm: Enlarge identity map space
Date: Thu, 14 Sep 2023 10:17:32 +0800
Message-Id: <20230914021734.1395472-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest Xen fails to boot on ADLink AVA platform.  Alexey Klimov root
caused the issue is related with the commit 1c78d76b67 ("xen/arm64: mm:
Introduce helpers to prepare/enable/disable").

This is because on ADLink AVA platform, it loads Xen hypervisor to the
address above 8TB and hence causes Xen panic (see patch 02 for details).

To fix this issue, this series is to enlarge identity map space to
127 TiB and tested on AVA platform.

Changes from v2:
- Kept macro naming IDENTITY_MAPPING_AREA_NR_L0 and removed introduced
  macros (Julien Grall).
- Minor improvement for coding style (Julien Grall).
- Added platform's detail in the patch 02 commit log (Julien Grall).

Changes from v1:
- Rebased on staging branch (Bertrand);
- Added Alexey Klimov tested tag for patch 01 (Alexey).
- Corrected the printing log with dynamically calculation ID map size.


Leo Yan (2):
  xen/arm: Add macro XEN_VM_MAPPING
  xen/arm: Enlarge identity map space to 127TB

 xen/arch/arm/arm64/mm.c               |  6 ++++--
 xen/arch/arm/include/asm/mmu/layout.h | 17 +++++++++--------
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.34.1


