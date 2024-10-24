Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5E9AE89F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825347.1239555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynm-0004EY-V2; Thu, 24 Oct 2024 14:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825347.1239555; Thu, 24 Oct 2024 14:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynm-0004Ae-Pv; Thu, 24 Oct 2024 14:27:02 +0000
Received: by outflank-mailman (input) for mailman id 825347;
 Thu, 24 Oct 2024 14:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ynl-00048O-Dd
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:01 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076dc871-9214-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 16:26:59 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so10147081fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:26:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:26:57 -0700 (PDT)
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
X-Inumbo-ID: 076dc871-9214-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780018; x=1730384818; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQn6if9ekWW0MVda6U/yRZVQvqrGPOmcVRtM007BrxE=;
        b=I7t/9tgenlDr70MzA7dTdG4e6az5wofLwV5r1s8a+5hd4fmeGf68M4TvCuCnbhzwXQ
         JJIoDrjBk3gCXrkwCWlXhuALBDFcznCVISXLToLwQrN9dKAuPyD5shCQVrxDxBzx2jyS
         4Pq8USgzt2fiLG4hri5HwxELg18N+kmvSESaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780018; x=1730384818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQn6if9ekWW0MVda6U/yRZVQvqrGPOmcVRtM007BrxE=;
        b=CSSpiy6KyemJtx7cYPumwQOKEEHayvKueRJOnLuLqTkFb1RJ7sG8Zk6PWgSawsYpGu
         bhKsZuNMGNs8jodUXA4msKKzJAA/k1PaaruIpF2+45RP5PZdzg1VbW+3AeMtSVk8OI7s
         LVwDZcmkKpYTbM7SFA4M0eT5Ma51HAzP+VRMjfnC+LfK5nJiTyBN5NhHxID0BgRdp8wJ
         f/HPdR/Fzguk0FJ4RXPEJxggfGC2ihxiHLUBHJQ63mfqnf6ci+aP4xj5jBndvbxAZq8s
         9rK7AEXUSuDHMnsyFDv31MAbrOs6jf+Q61VILOzl9Ftw1xL6Tf4FJY2JYvEo28RkELET
         co/Q==
X-Gm-Message-State: AOJu0Yy3Y0nXM1Ep0yjgAQ6v9oV1B49603QAChATwk6TmXlEMC7LEcRN
	zlGo4WXBP8juj+pm3GrnkLknDmI4wcifb7JOwUnq0V7JMVKksPmbC9Agf4QbVE2j4+Cp/+39q5m
	r
X-Google-Smtp-Source: AGHT+IGBaIg5dld97J2YFf12AVU4jvb0j6B5FH9DyyEl5ZFJuk5cn/12xzqmIzCmUoXr2nmVXJWfww==
X-Received: by 2002:a2e:4a12:0:b0:2fb:599a:a8e9 with SMTP id 38308e7fff4ca-2fca820a0fbmr11626381fa.15.1729780017912;
        Thu, 24 Oct 2024 07:26:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] x86/boot: Remove the mbi/mod pointers
Date: Thu, 24 Oct 2024 15:26:49 +0100
Message-Id: <20241024142654.989980-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This prevents the reintroduction of patterns which turn out to be unsafe for
PVH boots.  Various bits extracted/rearranged from the Hyperlaunch v7 series.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1509397930

Andrew Cooper (2):
  x86/boot: Introduce bootstrap_unmap()
  x86/boot: Drop the mbi and mod pointers in __start_xen()

Daniel P. Smith (3):
  x86/boot: Drop initial_images pointer
  x86/boot: Introduce bootstrap_map_bm() to map boot_module's
  x86/boot: Convert mod[] to bi->mods[] in __start_xen()

 xen/arch/x86/cpu/microcode/core.c |   6 +-
 xen/arch/x86/include/asm/setup.h  |   4 ++
 xen/arch/x86/pv/dom0_build.c      |   2 +-
 xen/arch/x86/setup.c              | 107 ++++++++++++++++--------------
 xen/xsm/xsm_core.c                |   4 +-
 xen/xsm/xsm_policy.c              |   2 +-
 6 files changed, 70 insertions(+), 55 deletions(-)

-- 
2.39.5


