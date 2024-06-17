Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75ED90B840
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742536.1149352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKH-00038q-RJ; Mon, 17 Jun 2024 17:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742536.1149352; Mon, 17 Jun 2024 17:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKH-00036x-Lx; Mon, 17 Jun 2024 17:39:29 +0000
Received: by outflank-mailman (input) for mailman id 742536;
 Mon, 17 Jun 2024 17:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKG-00036g-Sd
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a4cbf23-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso534988066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:25 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:24 -0700 (PDT)
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
X-Inumbo-ID: 8a4cbf23-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645964; x=1719250764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlq2KA/Rl2jpa+CD3iKff2ATLeNrqe6aHn27qOTXtpE=;
        b=eSLi34n3l5anaUrp6G3ImCnB70fJ+ksS/EM4OtMJbCPYYOVXZG+3bwJVKH5jWEcyJh
         nhZ9cghG/YgLe45Ld6Z1w5uIIcAnUbZtHAcgxAWwRlSsXNfgNBUk//clMOA9Ls8kz/br
         tdSELTXzaeyU780dmjEDiQFKueXat8URoy/Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645964; x=1719250764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlq2KA/Rl2jpa+CD3iKff2ATLeNrqe6aHn27qOTXtpE=;
        b=G/F5TYPuUNJVKZ6vo7vWkZ09IrhPJtiDXKfEREozHUcCwMRqra5whB0ossuQO/3De8
         dT8BOafqReOrOQZUuU699dL0fzQ3JFdeEJ1ql7Cutp/WoESVGbxECDGm0QbFgFII2Jvx
         5Rw5Vdg+rB09t1Op7wIOyrjW6K/tKtprVNNvPUWnWrvGSMOt8GnemqvNiQEvPqGJGpui
         K1D9JnFvhAvbobNZUCgjQoDNNv1lx9jbVsDQlR6CwrbEzvF34r6bySpPozvs1GFzVAqe
         1QhxtirHzJ0xgUwSTBNf6Lz6rIbPnpW6pCvsE480Phg6lBn2NvPqgS+VfsxhsNuHR6ZO
         NWhw==
X-Gm-Message-State: AOJu0Yw2b0Nx24ji8NKSLOWIUYDfDKtojXM0lo8bTnO4rlERz4tdJunV
	Qm8L2jW7kmc8yvrgMrtQmIjcz45ydx1hIOkxcFD/ObXGFaInW6kNVzz3NxpbB8Jo7ttP6oCCKeO
	WVYk=
X-Google-Smtp-Source: AGHT+IH0Cf5w34tJZlQQYn8ISB9ntlcGzbS6+l97omLPz4iYgaP6n6gLYIJ9DopkPO/6M6RgBbmjCA==
X-Received: by 2002:a17:907:c081:b0:a6f:77bb:1713 with SMTP id a640c23a62f3a-a6f77bb1889mr384559566b.9.1718645964528;
        Mon, 17 Jun 2024 10:39:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v4 0/7] x86/xstate: Fixes to size calculations
Date: Mon, 17 Jun 2024 18:39:14 +0100
Message-Id: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only minor changes in v4 vs v3.  See patches for details.

The end result has been tested across the entire XenServer hardware lab.  This
found several false assupmtion about how the dynamic sizes behave.

Patches 1 and 6 the main bugfixes from this series.  There's still lots more
work to do in order to get AMX and/or CET working, but this is at least a 4-yo
series finally off my plate.

Andrew Cooper (7):
  x86/xstate: Fix initialisation of XSS cache
  x86/xstate: Cross-check dynamic XSTATE sizes at boot
  x86/boot: Collect the Raw CPU Policy earlier on boot
  x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
  x86/cpu-policy: Simplify recalculate_xstate()
  x86/cpuid: Fix handling of XSAVE dynamic leaves
  x86/defns: Clean up X86_{XCR0,XSS}_* constants

 xen/arch/x86/cpu-policy.c                   |  56 ++--
 xen/arch/x86/cpuid.c                        |  24 +-
 xen/arch/x86/domctl.c                       |   2 +-
 xen/arch/x86/hvm/hvm.c                      |   2 +-
 xen/arch/x86/i387.c                         |   2 +-
 xen/arch/x86/include/asm/x86-defns.h        |  55 ++--
 xen/arch/x86/include/asm/xstate.h           |   8 +-
 xen/arch/x86/setup.c                        |   4 +-
 xen/arch/x86/xstate.c                       | 294 +++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 xen/include/xen/lib/x86/cpu-policy.h        |   2 +-
 11 files changed, 330 insertions(+), 122 deletions(-)

-- 
2.39.2


