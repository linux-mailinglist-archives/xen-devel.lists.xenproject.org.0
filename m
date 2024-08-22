Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC995C143
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782002.1191473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGt9-00054e-Or; Thu, 22 Aug 2024 23:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782002.1191473; Thu, 22 Aug 2024 23:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGt9-000539-M2; Thu, 22 Aug 2024 23:06:43 +0000
Received: by outflank-mailman (input) for mailman id 782002;
 Thu, 22 Aug 2024 23:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGt8-00052v-MZ
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:42 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30dbc220-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:40 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-533488ffaebso1516460e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:40 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:38 -0700 (PDT)
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
X-Inumbo-ID: 30dbc220-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368000; x=1724972800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2LeyzUwL5o7T7PpRPGH34rG7BC0CEXy4TaB1P1AwTY=;
        b=N6y8gBZvGap8ZnbpfXZ9+SRbHNNmeLoXrEs/BrSDNHfQ8Qairt6hsLNWewZ8gVCips
         M+W1Bc5EMBA9qlxdRbprssDq6+cx60GA+idb7i/ku9AE6AquLxKW6UMilVF3QnBkbCJ+
         CFWgohkVLDmoUAL4AHJPv+YzRr/7oTK3zsofg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368000; x=1724972800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2LeyzUwL5o7T7PpRPGH34rG7BC0CEXy4TaB1P1AwTY=;
        b=SfZ1G/2ELWMod5/QUG9xeqEypEASlK+wn4w1huzO5KqtwRLb3PVWlQ7DWATfu+p/8I
         NAit+MhFcvjTQ7GBQdo4TfjjsJaKfg62yQ+cETeBobCBiPD8ICOmMPgJ/vEEL2OpD4mA
         63ELimIYXV3Yuaup2EySTyXkk+hnkC993zjcDGR/CbSihMLIUR+55lt403DJQ+LwmqIG
         51Y9aA/lSC8U/RWV4WY15Z8smAmV+KUutboj3jg3i/jCn+4PDmhsOF1wheR7yczE5BDs
         En4bhFibDVEoXOj6jQcUEug3o35Sp5xtcCEDKQnc84RjLCqbtaCfPMRxVv7UIL1mh192
         IWvQ==
X-Gm-Message-State: AOJu0Yylk3XDYEZOF9b1af/dibFC6bwk59p0B51904L8Rqcg7oVBgNuy
	7xoRhJJ0EN+XO0o1SKpQ1bgPReKwEd4CB2Hgdz3SdTLhqPJGywjL6YfyUr6SLZjff4zzDfFKjGB
	M
X-Google-Smtp-Source: AGHT+IEaVH2wJY8/h1/gFnkOs39vSqEqmt0IjwV8kWT2KBSrYXeuLEVPBeCoURFCMpIwWVDt1NBUqg==
X-Received: by 2002:a05:6512:114d:b0:52e:9b68:d2d4 with SMTP id 2adb3069b0e04-534387be68cmr225605e87.56.1724367999136;
        Thu, 22 Aug 2024 16:06:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/9] xen/bitops: hweight() cleanup/improvements
Date: Fri, 23 Aug 2024 00:06:26 +0100
Message-Id: <20240822230635.954557-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next phase of bitops cleanup.  This series:

 1) Untangles the mess around hweight()
 2) Removes some unwise uses of hweight()
 3) Makes it work transparently for RISC-V
 4) Use the POPCNT instruction on x86 when available

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1424000649
https://cirrus-ci.com/build/4947148859506688

Andrew Cooper (9):
  xen/bitops: Reinstate the please tidy message
  xen/bitops: Introduce a multiple_bits_set() helper
  xen/bitops: Convert 'hweight(x) > 1' to new multiple_bits_set()
  xen/bitops: Drop the remnants of hweight{8,16}()
  xen/bitops: Introduce generic_hweightl() and hweightl()
  xen/bitops: Drop hweight_long() and use hweightl()
  xen/bitops: Implement hweight64() in terms of hweightl()
  xen/bitops: Implement hweight32() in terms of hweightl()
  x86/bitops: Use the POPCNT instruction when available

 xen/arch/arm/include/asm/bitops.h |  11 ----
 xen/arch/ppc/include/asm/bitops.h |  11 +---
 xen/arch/x86/cpu/vpmu.c           |   2 +-
 xen/arch/x86/hvm/vlapic.c         |  10 +--
 xen/arch/x86/include/asm/bitops.h |  30 ++++++---
 xen/common/bitmap.c               |   4 +-
 xen/common/bitops.c               |  41 ++++++++++++
 xen/common/numa.c                 |   2 +-
 xen/include/xen/bitops.h          | 102 +++++++++++++-----------------
 xen/include/xen/self-tests.h      |  10 ++-
 xen/lib/Makefile                  |   2 +
 xen/lib/arch-generic-hweightl.S   |  46 ++++++++++++++
 xen/lib/generic-hweightl.c        |  61 ++++++++++++++++++
 13 files changed, 232 insertions(+), 100 deletions(-)
 create mode 100644 xen/lib/arch-generic-hweightl.S
 create mode 100644 xen/lib/generic-hweightl.c

-- 
2.39.2


