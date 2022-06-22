Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A8554B91
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 15:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353887.580884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40cq-0002JH-4T; Wed, 22 Jun 2022 13:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353887.580884; Wed, 22 Jun 2022 13:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40cq-0002HK-1H; Wed, 22 Jun 2022 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 353887;
 Wed, 22 Jun 2022 13:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T0g=W5=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1o40co-0002HE-Nb
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 13:42:30 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28cd1c9c-f231-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 15:42:29 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id g12so13348463ljk.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 06:42:29 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 p5-20020ac24ec5000000b0047f666011e4sm1523292lfr.26.2022.06.22.06.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:42:28 -0700 (PDT)
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
X-Inumbo-ID: 28cd1c9c-f231-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhgjqfIBUtzNmowELx4pok3t4Jd74q2jodj8xtz+2fI=;
        b=T+f69ZQ9IFhNkNCoU0TfgfWaA1dETBQEixxLa9e/jpEpbfpNt066Y2DnFwBlx3Yxh8
         vZ+ySqWtYbOgg7lXtQ/6vdyoRkp6b2J9QFwG5A1sE4HzW7DOm255fcV7zlk1rAIRHWsc
         vimBdgsOQwCVNr18JSnRLaqVf90KSfoKIrrIDBc7OrwtHUv/vX+na5LKMYAuwuBTonaC
         IiCZOMXU5HHsJIflcw+K5H1YnvbP3AUTQgQAELset0Id4RrL695dz3uy5tpneTBVKS6x
         uGrxcWnEW3bLfZzPkwdHBHMPXjsb6TwR21BOUrWoWO3LhYHl/L7y9ZiT5XEtZnMrBg5N
         OVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vhgjqfIBUtzNmowELx4pok3t4Jd74q2jodj8xtz+2fI=;
        b=64PKWzJ6OLRpm+Po0yGQfBKoANlLx0XhFXjYxOC8NH+ipdiR0VeGNqLmHZ5fsUQEGM
         Tx+zybb5CiHqrd2f++4jzQXhiMNIg0a/eAciUG9lpB37NtYU20jJyq9m00vnvp/t0QVp
         ZK+F5rZVsOFlUO5M4aZTuiRvRqKWSpsSXjleLt7K2WpspqAaA5qsReo6CPwLld26ULRO
         lXoeSGpAgjXueeZqH7CFdUVpxdKij1hPACCgpyHaL/3iUJBImlz7bu4EKJxOkMvajQt4
         9mizsanYXZ7HR9d5nubFDgHMFFlf/0Wbs7aYXM4px94ZtlHxn1Z7WQS4ozFZHtW9zyUK
         xQow==
X-Gm-Message-State: AJIora+q48vJImE/hGBO6AV0Ciu0vl3+dKWr5edF3lhjEQZ1h2Ob4aHF
	8cKSwJZKSgJIw4Ngh31T7dFFPs+Q/rwDuw==
X-Google-Smtp-Source: AGRyM1srHY5Xlsv6oPCz6ZMknz3XrKlsMD05vaIjs29V9Ovi2QkH7JPCX2VekXaEwzELdBGKyts3UQ==
X-Received: by 2002:a2e:6f03:0:b0:25a:74b7:3a59 with SMTP id k3-20020a2e6f03000000b0025a74b73a59mr1920791ljc.390.1655905348518;
        Wed, 22 Jun 2022 06:42:28 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 0/2] Xen FF-A mediator
Date: Wed, 22 Jun 2022 15:42:17 +0200
Message-Id: <20220622134219.1596613-1-jens.wiklander@linaro.org>
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

v2->v3:
* Generates offsets into struct arm_smccc_1_2_regs with asm-offsets.c in
  order to avoid hard coded offsets in the assembly function
  arm_smccc_1_2_smc()
* Adds an entry in SUPPORT.md on the FF-A status
* Adds a configuration variable "ffa_enabled" to tell if FF-A should be
  enabled for a particular domu guest
* Moves the ffa_frag_list for fragmented memory share requests into
  struct ffa_ctx instead to keep it per guest in order to avoid mixups
  and simplify locking
* Adds a spinlock to struct ffa_ctx for per guest locking
* Addressing style issues and suggestions
* Uses FFA_FEATURES to check that all the needed features are available
  before initializing the mediator
* Rebased on staging as of 2022-06-20

v1->v2:
* Rebased on staging to resolve some merge conflicts as requested

Jens Wiklander (2):
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: add FF-A mediator

 SUPPORT.md                        |    7 +
 tools/libs/light/libxl_arm.c      |    3 +
 tools/libs/light/libxl_types.idl  |    1 +
 tools/xl/xl_parse.c               |    3 +
 xen/arch/arm/Kconfig              |   11 +
 xen/arch/arm/Makefile             |    1 +
 xen/arch/arm/arm64/asm-offsets.c  |    9 +
 xen/arch/arm/arm64/smc.S          |   43 +
 xen/arch/arm/domain.c             |   10 +
 xen/arch/arm/domain_build.c       |    1 +
 xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |    4 +
 xen/arch/arm/include/asm/ffa.h    |   71 ++
 xen/arch/arm/include/asm/smccc.h  |   40 +
 xen/arch/arm/vsmc.c               |   19 +-
 xen/include/public/arch-arm.h     |    2 +
 16 files changed, 1904 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/arch/arm/include/asm/ffa.h

-- 
2.31.1


