Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF55BC51D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408574.651328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpa-0007Iu-Oe; Mon, 19 Sep 2022 09:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408574.651328; Mon, 19 Sep 2022 09:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpa-0007Fr-L9; Mon, 19 Sep 2022 09:12:46 +0000
Received: by outflank-mailman (input) for mailman id 408574;
 Mon, 19 Sep 2022 09:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpa-0007Fl-0i
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:46 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c4ec038-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:23 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id z25so45932663lfr.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:44 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:43 -0700 (PDT)
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
X-Inumbo-ID: 2c4ec038-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AfPstKk13JdIZMSlOZN4GRY7iYaNj9hgjfOeyJ3u/H0=;
        b=Uj/5rHaYI73vHgrkjKMjL4/ZAg/JHHp0Q0p2aOLnB9mldSt2vZ5HYQ+ro9Gi1cbiGp
         38qjgO09JySceBCZOFHlTQTqE069fipPRsJ/hkjotympEqRRoygT5mNog/tbXdXmjNV7
         cmA68sGMAkl3Bset38htDuD9JhI40Dp7QM12l184gINxIYHT1jxIcb7kfSFoJIimNDrB
         rVjE7AdyEW5DEsVvDfRqfiJm8OXQgtv5M9IwhgdVMsD+BJIi6YmLzWuu13m7IBpZcFaJ
         G6s6ggQAs01MctWZdHLM6hNbYCHQbeRBS5qwjHXQA4zLHAObWgV4sR0cBzF/xRDOPD1M
         9Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AfPstKk13JdIZMSlOZN4GRY7iYaNj9hgjfOeyJ3u/H0=;
        b=1CcOMpjZL4R7RHMjn06eHaFos+DibhD/+cA7lWW5+TwXPSQeeZZT2YTOiY4vYUfxGz
         msVfwgmBdjTCDQ1hNVJ+rBUE6oRShxbPBXRgENg18aZOFlhsiVCNVwRB04ozVDyMWMgO
         9HbCddsO7gRzrTlLrxWKrrwaV9ao9JjLR3qjDvaHsPir4KIWhX9r0ofC/Ey0GbV2Mojz
         wDIsVEyZihjl2Meqc2XXxN2NKzV4LcZ3B7qZwrbaX/Txxa9wfrxOtxCZe+auz/aBfAZC
         9vRaMpj7uOsUNvP6/hhJatXdhpGkAPN61X+L75MAXfb7/jjPNLLvX3PNCqQszPs5s3fl
         KjSg==
X-Gm-Message-State: ACrzQf3fya4rSJ5W4tB1hJEbOJu8OAh6sRtyK8LvfCHMvLHzTCGmBGMs
	LcqQNO4SoMFZTGGY2awXNYvsOeBt0T4usVJW
X-Google-Smtp-Source: AMsMyM7YU7mNt6wj9pTfRwsVfqlk0vs2DcQvdvP8nZTxCFTm1Hp6dbMlkk8HEL/enIEKZM4U5ay7eA==
X-Received: by 2002:a05:6512:370c:b0:49f:c4fb:8706 with SMTP id z12-20020a056512370c00b0049fc4fb8706mr363638lfr.635.1663578764018;
        Mon, 19 Sep 2022 02:12:44 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 0/9] Xen FF-A mediator
Date: Mon, 19 Sep 2022 11:12:29 +0200
Message-Id: <20220919091238.2068052-1-jens.wiklander@linaro.org>
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

v5->v6:
* Updated "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
  commit message and moved the patch right before the patch which needs it.
  Applied Michal Orzel's R-B tag.
* Renamed the guest configuration option "ffa_enabled" to "ffa" and
  updated the description.
* More tools update in "xen/arm: add a primitive FF-A mediator" with the "ffa"
  option, including golang and ocaml.
* Update ffa_domain_init() to return an error if communication with
  the SPMC can't be established.
* Factored out a ffa_domain_destroy() from ffa_relinquish_resources().
* Added ffa_get_call_count() to give an accurate number of FF-A function,
  updated in each patch as new FF-A functions are added.
* Added a flags field in struct xen_arch_domainconfig that replaces the
  ffa_enabled field.
* Made check_mandatory_feature() __init
* Replaced a few printk() calls with gprintk() where needed.
* Rebased on staging as of 2022-09-14

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
  xen/arm: add a primitive FF-A mediator
  xen/arm: ffa: add direct request support
  xen/arm: ffa: map SPMC rx/tx buffers
  xen/arm: ffa: send guest events to Secure Partitions
  xen/arm: ffa: support mapping guest RX/TX buffers
  xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
  xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
  xen/arm: ffa: support sharing memory

 SUPPORT.md                           |    7 +
 docs/man/xl.cfg.5.pod.in             |   15 +
 tools/golang/xenlight/helpers.gen.go |    6 +
 tools/golang/xenlight/types.gen.go   |    1 +
 tools/include/libxl.h                |    6 +
 tools/libs/light/libxl_arm.c         |    6 +
 tools/libs/light/libxl_types.idl     |    1 +
 tools/ocaml/libs/xc/xenctrl.ml       |    1 +
 tools/ocaml/libs/xc/xenctrl.mli      |    1 +
 tools/xl/xl_parse.c                  |    1 +
 xen/arch/arm/Kconfig                 |   11 +
 xen/arch/arm/Makefile                |    1 +
 xen/arch/arm/arm64/asm-offsets.c     |    9 +
 xen/arch/arm/arm64/smc.S             |   42 +
 xen/arch/arm/domain.c                |   11 +
 xen/arch/arm/domain_build.c          |    1 +
 xen/arch/arm/ffa.c                   | 1827 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h    |    4 +
 xen/arch/arm/include/asm/ffa.h       |   78 ++
 xen/arch/arm/include/asm/regs.h      |   12 +
 xen/arch/arm/include/asm/smccc.h     |   40 +
 xen/arch/arm/tee/optee.c             |   11 -
 xen/arch/arm/vsmc.c                  |   19 +-
 xen/include/public/arch-arm.h        |    4 +
 24 files changed, 2100 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/arch/arm/include/asm/ffa.h

-- 
2.31.1


