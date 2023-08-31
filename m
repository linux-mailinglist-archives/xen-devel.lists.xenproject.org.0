Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD178EB43
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593787.926877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQN-0002U4-PF; Thu, 31 Aug 2023 11:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593787.926877; Thu, 31 Aug 2023 11:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQN-0002RP-Ls; Thu, 31 Aug 2023 11:01:19 +0000
Received: by outflank-mailman (input) for mailman id 593787;
 Thu, 31 Aug 2023 11:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NA7E=EQ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qbfQM-0002RJ-HB
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:01:18 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4dfb97c-47ed-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 13:01:17 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68c3ec0578bso505687b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 04:01:17 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-203.hinet-ip.hinet.net.
 [211.75.219.203]) by smtp.gmail.com with ESMTPSA id
 o9-20020a63a809000000b0056c2de1f32esm1161686pgf.78.2023.08.31.04.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:01:15 -0700 (PDT)
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
X-Inumbo-ID: b4dfb97c-47ed-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693479675; x=1694084475; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOLWUPcKZhk0Ftmj6/gerDDXe3J96mT7F3DqBCwvM9A=;
        b=UhpNESxvgJc32ZX5jMYHqdmBDB8nIy7ROAH+jpUfJjsZIuGvryloBfVbFdOoLTSH5S
         ynYd/xcbfGpn3AV8Uq+xSVoMneSylFHhnGgJB9otDaSQ5KNO8hkkmQCyMB1XTsXLHHYI
         0pPsIgq+GHjSxinWZrQAov1c3FBxLAInivXDvoEHuaBkRmz+VfliFnKmWipILrfJ/hGq
         TKK1CvhUf7Sk/kT+e4QPBZIsxGO2kLpMSZ38PQeyIyWsHRvgPPNVYH2aFX3GDoAXgJHM
         SNYbhtQ7q2I6wUr93Ym1vm/VJAN8yWLumjNw4yT714xigK6cvxn3sp5Y5F5JagMoBrI8
         Nxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693479675; x=1694084475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOLWUPcKZhk0Ftmj6/gerDDXe3J96mT7F3DqBCwvM9A=;
        b=PGjanDD7s/ApzuTHwJhmvGoB73tNEWkeuA0IACQnyjGlB3aRuwjzjQAH1ZV7mItPpJ
         BsgaXY3aOjeyGX8Zl+1KalOIo46XqmO3Le3jdwLeMT57kq7jM/evVkzF8h+m5QCHxsAJ
         1ZxLlH0UVKmZddiLovqYmHpeDxIjVf1+Tm0gh8tdJUKXSh9PwwYZjAWQPwJS/TPplWwB
         /KPrhSW9mSCb4Z0QaHjg9Nfp6CKEEdesc3z9GdvUcRPoQBn1SM9P2ogct1pAGmwo5yk3
         wJrLrJ2pKk/ZvvXAj90MVFdlijLQX1Wmrhxr0p2CMra1TvicqdeWywGqtCrF3A7Kf6H+
         nxBA==
X-Gm-Message-State: AOJu0YyyyOpU87Ig6o35S+Vt5BihoNDP7DJl0zXQLw7D+0VgoV0VZ7sO
	ohtwH2JTbcr7T78lD7GxIMwkDdIZxfWOZf3BO5the9U73zo=
X-Google-Smtp-Source: AGHT+IHK1SYWRCF7hDl+JRWJHpmTlKT30CT9lkNXB1KqjGgjetUboiMNNXTDD3XbU01TylwKwkYpJA==
X-Received: by 2002:a05:6a20:2d6:b0:13a:ccb9:d5b7 with SMTP id 22-20020a056a2002d600b0013accb9d5b7mr4928672pzb.41.1693479675587;
        Thu, 31 Aug 2023 04:01:15 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 0/2] xen/arm: Enlarge identity map space
Date: Thu, 31 Aug 2023 19:01:05 +0800
Message-Id: <20230831110107.2747633-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest Xen fails to boot on ADLink AVA platform.  Alexey Klimov root
caused the issue is related with the commit 1c78d76b67 ("xen/arm64: mm:
Introduce helpers to prepare/enable/disable").

This is because on ADLink AVA platform, it loads Xen hypervisor to the
address above 2TB and hence causes Xen panic:

  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

To fix this issue, this series is to enlarge identity map space to
127 TiB and tested on ADLink AVA platform.

Note, we tested on two ADLind AVA platforms, one machine has this issue
and another machine cannot reproduce the panic.  It's likely they have
different firmware versions so one machine loads Xen hypervisor into the
high memory address and caused booting failure.


Leo Yan (2):
  xen/arm: Add macro XEN_VM_MAPPING
  xen/arm: Enlarge identity map space to 127TiB

 xen/arch/arm/include/asm/config.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.39.2


