Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C253FAE6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 12:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343103.568260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyWAT-0008Ak-RI; Tue, 07 Jun 2022 10:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343103.568260; Tue, 07 Jun 2022 10:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyWAT-00087n-OA; Tue, 07 Jun 2022 10:10:33 +0000
Received: by outflank-mailman (input) for mailman id 343103;
 Tue, 07 Jun 2022 10:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3MX=WO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nyWAR-00087g-Vp
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 10:10:31 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fd9e9e1-e64a-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 12:10:31 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id s6so27476590lfo.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 03:10:31 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 e2-20020ac24e02000000b0047900e9a9d2sm3209841lfr.266.2022.06.07.03.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:10:29 -0700 (PDT)
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
X-Inumbo-ID: 0fd9e9e1-e64a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJcjlqpCDenxDebpNBzBomFtJsifdsICr66XeqHfwIw=;
        b=RHu6caKUT9EkS97WlVqL5cLYP53mMtiW/Fz1kSpDu3G7x+l0VAYfVL7IhZUj8hR3as
         4nOb8zisWCOBjPL9mE7lbDQgFSesfSRmKX/O3zQ2IwUCDfY0fwOlKbt5Nd63ge8sXJxq
         bLe0zmqnlSPi69aDfnTnxaQU8cVsS/fbCe1y/tRTPCW1e8eFyfoDeV/+PCYnHml/oikr
         ENMwi/zCmYWsAZi1lmhD5hK5vbIoJ/XCiOTAyafrh8E2MKS9SFUNfQ1ag+0miko5WeDO
         oO07DVBf9ekKY+bF09+1lW0XR+Mn/Ld6vpojnfKaVl8V7Db88kPP9xgLUah7ubA2YmCi
         rhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJcjlqpCDenxDebpNBzBomFtJsifdsICr66XeqHfwIw=;
        b=XiiDuKDEb409C9tU++hhMsjenXtRmg2PltXIWdXXAyP2ww2fVQvaWtjFdVV9tZRBkI
         XoMmVy/ZcPy5v0mat7o/fYGIx4KR9yqcvZ4xk8WQO5QETDOO43KwVyZk6P3k27wyrAp9
         2W6z37HCgcQrqllLRA/dfZauPVHVSuzdeNa5ZXWEiU4nzhJi+L7S6Y3wqquBML2S2wxM
         VjKwHU337XBIYT5XywSUT4TG950n+0hGr9vQse6PBlF3GAdwy9FzE7bc4yELhKJ+c9ZQ
         2P4NAgGErNClszsAt3fluoz+FgTRY8DebrcuNJdAHXLH0IrDgDbINAIf+dS+nwTEU9P7
         XoLA==
X-Gm-Message-State: AOAM5322oxsEr+3OU94prleCwxoj+eRhWgknNTZ7l2PeBuYRnUaTaJPZ
	hZ5mNoxiWrTkCyIbbbKiPDmza2BXB1QcxQ==
X-Google-Smtp-Source: ABdhPJx6b2jxxQ2behYyjMbf0BsToJbzmi4Md5G/MZ+xAwdkI8YEbT0CgGc4b+whsq8osBSFkRkatQ==
X-Received: by 2002:a05:6512:987:b0:479:3983:e744 with SMTP id w7-20020a056512098700b004793983e744mr7585233lft.402.1654596630343;
        Tue, 07 Jun 2022 03:10:30 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH 0/2] Xen FF-A mediator
Date: Tue,  7 Jun 2022 12:10:08 +0200
Message-Id: <20220607101010.3136600-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch sets add a FF-A [1] mediator modeled after the TEE mediator
already present in Xen. The FF-A mediator implements the subset of the FF-A
1.1 specification needed to communicate with OP-TEE using FF-A as transport
mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
partition of itself to each guest in Xen.

The FF-A mediator is generic in the sense it has nothing OP-TEE specific
except that only the subset needed for OP-TEE is implemented so far. The
hooks needed to inform OP-TEE that a guest is created or destroyed is part
of the FF-A specification.

It should be possible to extend the FF-A mediator to implement a larger
portion of the FF-A 1.1 specification without breaking with the way OP-TEE
is communicated with here. So it should be possible to support any TEE or
Secure Partition using FF-A as transport with this mediator.

[1] https://developer.arm.com/documentation/den0077/latest

Thanks,
Jens

Jens Wiklander (2):
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: add FF-A mediator

 xen/arch/arm/Kconfig         |   11 +
 xen/arch/arm/Makefile        |    1 +
 xen/arch/arm/arm64/smc.S     |   43 +
 xen/arch/arm/domain.c        |   10 +
 xen/arch/arm/ffa.c           | 1624 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c          |   19 +-
 xen/include/asm-arm/domain.h |    4 +
 xen/include/asm-arm/ffa.h    |   71 ++
 xen/include/asm-arm/smccc.h  |   42 +
 9 files changed, 1821 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/include/asm-arm/ffa.h

-- 
2.31.1


