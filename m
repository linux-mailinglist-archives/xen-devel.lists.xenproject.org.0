Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578315443AB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 08:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344660.570213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBUq-0005hD-MH; Thu, 09 Jun 2022 06:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344660.570213; Thu, 09 Jun 2022 06:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBUq-0005eM-J2; Thu, 09 Jun 2022 06:18:20 +0000
Received: by outflank-mailman (input) for mailman id 344660;
 Thu, 09 Jun 2022 06:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ts8Y=WQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nzBUo-0005eB-V4
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 06:18:18 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3ce1fa8-e7bb-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 08:18:17 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id t25so36381884lfg.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun 2022 23:18:17 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 u20-20020ac248b4000000b00478d24ad1basm4061130lfg.307.2022.06.08.23.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 23:18:16 -0700 (PDT)
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
X-Inumbo-ID: f3ce1fa8-e7bb-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoQViV+2VWli6a10OFSyz3kotcrFDlBPUE1vKpSCf14=;
        b=YJsLxTLfipMxWfPYFRkJI6yrVU+dFUi83/nxDVHQor6gq1TlWEjgQ1JG5H6VkeOWgI
         1foVZKVpEfcWlWl5uOvQTXmrgU1+2iKRi2R304LUV4kYJrondNtdmtkLD05AT4QIfoeC
         aZAzB5LT4Bj8dtdBsE4ZRQMFhxJkXTBQAnAXK1yT+ucxgMglHbtNFFUgXc4kRoudj31w
         h0QAot5kIOGjUKVem0CbW3sc8abiL33e5V9UFC6or12plAs5BPY+4uWsHdN/pE38K3DH
         oaKIEVBcjEKMYuFLqDL61q7GMJhdqnChMuNQT+0K+ZtOE+PiSQLl4OLH0NDCpA5fUdzk
         10Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoQViV+2VWli6a10OFSyz3kotcrFDlBPUE1vKpSCf14=;
        b=sJkdBbuMAyb3gPSw/VY5CPjSIl7TqdZqv8FobW9ZysJekBJt8ZHTHHsG9d7nzr2/jl
         MhzJu+MVRe5yqlW7eSXXlKKNhgEmfoc8ePxZQMauu2MfusvQW4whSCFnmiLaoEZM2y84
         che/XQg3tVR9/kbtzkCXrA0rw7VbeGg6HUXXKpM39t/q/7aNLNCaGKp1X/qhIaSAnfsK
         sIa1Shy3KlsZq4s2SwGY2fsWKfFr+5VJXqhLDoVpObZzVOfui2NkHK1MqDqq4v1O8B4h
         CKvJPIqOGaHl8pk5nr4fLhpWy9nSs5W30CaYVgAT5fJ9gfikr45niB/LncfUN1Ne3HNr
         s/CA==
X-Gm-Message-State: AOAM53101RQJI9ewVhA4BSCisoFgPHTcYM4kgflWdQlAjsjFKcvRM1Bi
	QxgjoKeyoSUJFUsFitQSTuowD7YJat1VHw==
X-Google-Smtp-Source: ABdhPJwiVuGh8rWfkw2Vdz25vp18A0RSAUT86dv2EQRqfS57+ZjW6/bpaBZJCzgJrlbIpYta1AN9nA==
X-Received: by 2002:a05:6512:3b98:b0:479:1313:35ab with SMTP id g24-20020a0565123b9800b00479131335abmr21503278lfv.399.1654755497012;
        Wed, 08 Jun 2022 23:18:17 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v2 0/2] Xen FF-A mediator
Date: Thu,  9 Jun 2022 08:18:10 +0200
Message-Id: <20220609061812.422130-1-jens.wiklander@linaro.org>
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

v1->v2:
* Rebased on staging to resolve some merge conflicts as requested


Jens Wiklander (2):
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: add FF-A mediator

 xen/arch/arm/Kconfig              |   11 +
 xen/arch/arm/Makefile             |    1 +
 xen/arch/arm/arm64/smc.S          |   43 +
 xen/arch/arm/domain.c             |   10 +
 xen/arch/arm/ffa.c                | 1624 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |    4 +
 xen/arch/arm/include/asm/ffa.h    |   71 ++
 xen/arch/arm/include/asm/smccc.h  |   42 +
 xen/arch/arm/vsmc.c               |   19 +-
 9 files changed, 1821 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/arch/arm/include/asm/ffa.h

-- 
2.31.1


