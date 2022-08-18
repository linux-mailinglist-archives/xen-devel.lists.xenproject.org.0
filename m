Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C65981C1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389431.626333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdC9-0003zx-1b; Thu, 18 Aug 2022 10:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389431.626333; Thu, 18 Aug 2022 10:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOdC8-0003wT-UT; Thu, 18 Aug 2022 10:56:12 +0000
Received: by outflank-mailman (input) for mailman id 389431;
 Thu, 18 Aug 2022 10:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avir=YW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oOdC7-0003wI-AX
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:56:11 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df8258f-1ee4-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 12:56:09 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id o2so1660129lfb.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 03:56:09 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 y27-20020a0565123f1b00b0048a85334a11sm176837lfa.143.2022.08.18.03.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 03:56:08 -0700 (PDT)
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
X-Inumbo-ID: 5df8258f-1ee4-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oi8fCB/lcY/IJzhYgzv8T3qd45K63a+tPtGnN+UB+KE=;
        b=zbQvAwhTWLDU07t5pbHAPpvLyvepHJ0FnuvzVKIyfjSrtgQ84pxLINbbAtcm+6fjbS
         6whRWsiekzNP0LE2kyZwN8aGP7x/Ptl2bhr7OrOsBy794t6b0qFqZr7w78Cots2fvAr0
         R7js+NT3C0JVrwVMbXudkv8qlGxS7IUzUBZynU0OrrWKTssXzuS3Im7inD+mpXHlZ1Df
         4wiY74kaXZuehvwU7kRUp3KQBU6JP51eMv3ejVHstTtu0Xmpg1qgR9zcM2dC69XkJfgj
         PRvjqcOZ/G9XtddTE2lOUP99MuZsRgiDTxrOad6ugMz1pMrujsWrdC0gxoUWDRvgw23c
         SmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oi8fCB/lcY/IJzhYgzv8T3qd45K63a+tPtGnN+UB+KE=;
        b=U6NWKDRJHlRP719WiSanLhX0zR9ivWmtNMqFok1FvCzDNBMJ42U/7WdCIbS9/wc3Ag
         /1lK0PIPca13hclM2Jv2Y8zpM0bJtQbCigOnEvxtOXNLTtBBsioYmqJsneRRoySbD3K9
         V1WFf6ceIAI55Vhro087CogfecHj8iqAmsAXTI29QGueiysr14JAJP2ITrE/anOlB0QE
         8hBCjcbkSSYoRR/VbBraQplARQEZttQ3neRC7rZItRFjGyyv8Wwde204uityqQScsv/K
         MRLi8OPJT+y2BY9j9CkHIJ3lDL2jelc6MIBS6ZrCAf9jGo8YHfDQYts9xN8E4YH3OgKG
         laFg==
X-Gm-Message-State: ACgBeo3IVrb7RcnjzfNSiSlBoxOtXnWJdjZRwzWwD1UFzgVdZOGDld7O
	Iwl6nCUgl12d7TFzINvWBXPC27OeFANe8Q==
X-Google-Smtp-Source: AA6agR4oGiAqxwUY9SIQVaJ0Ofrxs1jyIfW2iVKq4fokM2pSlKkp5L7tv6Ng7BFiIz3EgCfQaKrngg==
X-Received: by 2002:a05:6512:228a:b0:492:b7cd:9599 with SMTP id f10-20020a056512228a00b00492b7cd9599mr726002lfu.625.1660820168948;
        Thu, 18 Aug 2022 03:56:08 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 0/9] Xen FF-A mediator
Date: Thu, 18 Aug 2022 12:55:52 +0200
Message-Id: <20220818105601.1896082-1-jens.wiklander@linaro.org>
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

V4->v5:
* Added "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
* Added documentation for the "ffa_enabled" guest config flag
* Changed to GPL license for xen/arch/arm/ffa.c
* Added __read_mostly and const where applicable
* Added more describing comments in the code
* Moved list of shared memory object ("ffa_mem_list") into the guest context
  as they are guest specific
* Simplified a few of the simple wrapper functions for SMC to SPMC
* Added a BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE) since the mediator
  currently depends on the page size to be same as FFA_PAGE_SIZE (4k).
* Added max number of shared memory object per guest and max number of
  size of each shared memory object
* Added helper macros to calculate offsets of different FF-A data structures
  in the communication buffer instead of relying on pointer arithmetic
* Addressed style issues and other comments
* Broke the commit "xen/arm: add FF-A mediator" into multiple parts, trying
  to add a few features at a time as requested
* Added a missing call to rxtx_unmap() in ffa_relinquish_resources()
* Assignment of "ffa_enabled" is kept as is until I have something definitive
  on the type etc.
* Tested with CONFIG_DEBUG=y

v3->v4:
* Missed v3 and sent a v4 instead by mistake.

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

Jens Wiklander (9):
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
  xen/arm: add a primitive FF-A mediator
  xen/arm: ffa: add direct request support
  xen/arm: ffa: map SPMC rx/tx buffers
  xen/arm: ffa: send guest events to Secure Partitions
  xen/arm: ffa: support mapping guest RX/TX buffers
  xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
  xen/arm: ffa: support sharing memory

 SUPPORT.md                        |    7 +
 docs/man/xl.cfg.5.pod.in          |   15 +
 tools/include/libxl.h             |    6 +
 tools/libs/light/libxl_arm.c      |    3 +
 tools/libs/light/libxl_types.idl  |    1 +
 tools/xl/xl_parse.c               |    3 +
 xen/arch/arm/Kconfig              |   11 +
 xen/arch/arm/Makefile             |    1 +
 xen/arch/arm/arm64/asm-offsets.c  |    9 +
 xen/arch/arm/arm64/smc.S          |   43 +
 xen/arch/arm/domain.c             |   10 +
 xen/arch/arm/domain_build.c       |    1 +
 xen/arch/arm/ffa.c                | 1805 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |    4 +
 xen/arch/arm/include/asm/ffa.h    |   71 ++
 xen/arch/arm/include/asm/regs.h   |   12 +
 xen/arch/arm/include/asm/smccc.h  |   40 +
 xen/arch/arm/tee/optee.c          |   11 -
 xen/arch/arm/vsmc.c               |   19 +-
 xen/include/public/arch-arm.h     |    2 +
 20 files changed, 2059 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/arch/arm/include/asm/ffa.h

-- 
2.31.1


