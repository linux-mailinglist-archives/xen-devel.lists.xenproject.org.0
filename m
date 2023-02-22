Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A910469F7FF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499537.770711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr84-0001OT-Ay; Wed, 22 Feb 2023 15:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499537.770711; Wed, 22 Feb 2023 15:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr84-0001MT-6a; Wed, 22 Feb 2023 15:34:00 +0000
Received: by outflank-mailman (input) for mailman id 499537;
 Wed, 22 Feb 2023 15:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr82-0001MC-GP
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:33:58 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 511aef28-b2c6-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 16:33:57 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id w27so10582924lfu.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:33:55 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:54 -0800 (PST)
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
X-Inumbo-ID: 511aef28-b2c6-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeWtQaC3JHvl+29pYelyweMXbxlYjOwAamRSQUiecqg=;
        b=SifL+Ye44BVdwX9OQqbEOwDBBvuUDaaGPV8NgFtyEKHTR77C8e9Ib7MswD2hORx3CR
         J6gvwE9Y3DXsnFMjOoRJRNBO8NCwEmdKDZL8j8zsnVk3SQtW2lAL7H5qZwvU5pQwozWd
         Elr0bDjST4kbYwRscQcg/IGGatUvJkYvvup/SD7+Q/IuQQwWUvy0s6QaY/QGR3uK5h0o
         HogP1Ibppq7zCCZ/7M/8l1MkfZqmGtthLXXXP1Qwg9pZhcgOyRxbwkI4CKjPi/VofU3J
         ak2vEWzR5fJkZq5GzkT6LHKUL/DxvZAKCyadg3cXPe2tQHH3rZSxg+CfPa/O4HLyjyE4
         wPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeWtQaC3JHvl+29pYelyweMXbxlYjOwAamRSQUiecqg=;
        b=ljZ1GCnM8y+BMLb+vbwNkiav0Lq8sP0mr55wwA6Ouczj++Skxl6Rn+24SEC1gU2WSD
         Cy1g2voYdBtu60sPsD0eS/FhXyhE0Vs5VI8s/a+VKmDWD7SEgjpb5SlZwuWvSMcJyJdj
         +ZM+hFVvaft5VPl+U/2InpufEMOJF4ousE2k2LY3BqZ3Cu29ygSvqSLBfZDmIyqk/8F1
         e9/G8ifXAeXjEQ3x1OpqWUl9D90mDJSVozdJgs7ZBQsZll7w8NfjBRPZykIrsqcn9Kmf
         eUxCq3YfXIkoo2Ljhh6GAzVJpdOPrSsqQQkuZwic09ZaGAzQNCmU5ha1pSMMDFYfniCj
         A9xw==
X-Gm-Message-State: AO0yUKVuGJG87BPMgSADmLPD6FdktFIKdElx4LIOTDFcdfgRPDOu3atv
	Q4V0MKoCcYnQ9gvWp0ZbptK/AunSTzc0TpTdM2w=
X-Google-Smtp-Source: AK7set9ZKkyXjXuW14WrdBSdQEKq16nsolr64pMwzHGxJKq+tIYmPFN/35u2YFGyHLpg9+F2WFHE6Q==
X-Received: by 2002:ac2:55b5:0:b0:4b5:7e4c:dcea with SMTP id y21-20020ac255b5000000b004b57e4cdceamr2648612lfg.51.1677080034533;
        Wed, 22 Feb 2023 07:33:54 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v7 00/20] Xen FF-A mediator
Date: Wed, 22 Feb 2023 16:32:57 +0100
Message-Id: <cover.1677079671.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch sets add an FF-A [1] mediator to the TEE mediator framework
already present in Xen.  The FF-A mediator implements the subset of the
FF-A 1.1 specification needed to communicate with OP-TEE using FF-A as
transport mechanism instead of SMC/HVC as with the TEE mediator. It allows
a similar design in OP-TEE as with the TEE mediator where OP-TEE presents
one virtual partition of itself to each guest in Xen.

The FF-A mediator is generic in the sense it has nothing OP-TEE specific
except that only the subset needed for OP-TEE is implemented so far. The
hooks needed to inform OP-TEE that a guest is created or destroyed are part
of the FF-A specification.

It should be possible to extend the FF-A mediator to implement a larger
portion of the FF-A 1.1 specification without breaking with the way OP-TEE
is communicated with here. So it should be possible to support any TEE or
Secure Partition using FF-A as transport with this mediator.

The patches are also available at https://github.com/jenswi-linaro/xen
branch "xen_ffa_v7".

With help from Bertrand I've intregrated this in a test setup with OP-TEE.
Please check prerequisites at
https://optee.readthedocs.io/en/latest/building/prerequisites.html

My setup is duplicated using:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b qemu_xen_ffa
repo sync -j8
cd build
make -j8 toolchains
make -j8 all
make run-only

Test in dom0 with for instance:
xtest 1004

at the prompt.

To start up a domu and connect to it do:
cd /mnt/host/build/qemu_v8/xen
xl create guest_ffa.cfg
xl console domu

Then test as usual with "xtest 1004".

The setup uses the branch "ffa" from https://github.com/jenswi-linaro/xen.
That's currently the same as the "xen_ffa_v7" branch, but the "ffa" branch
may change later as I update for a new version of the patch set.

[1] https://developer.arm.com/documentation/den0077/latest

Thanks,
Jens

v6->v7:
* Split some of the larger patches into smaller patches for easier review.
  For instance, the v6 patch "xen/arm: add a primitive FF-A mediator" has
  been replaced with:
  - "xen/arm: add a primitive FF-A mediator"
  - "tools: add Arm FF-A mediator"
  - "docs: add Arm FF-A mediator"
  - "xen/arm: ffa: add remaining SMC function IDs"
* Some small fixes in the error path for handle_mem_share()
* Switched to SPDX for license in new files.
* Fixed comment style issues in
  "xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers"
* Made FFA support UNSUPPORTED in "xen/arm: add a primitive FF-A mediator"
* Replaced ffa_get_call_count() with FFA_NR_FUNCS
* Update the FFA_MAX_SHM_PAGE_COUNT with a formula instead of a value.
* Replaced XEN_ARM_FLAGS_FFA with XEN_DOMCTL_CONFIG_TEE_FFA to minimize impact
  on struct xen_arch_domainconfig. This works because the FF-A mediator and
  the OP-TEE mediator will not be used at the same time in by a guest.
* Replaced "ffa" boolean in the guest config with a new "ffa" value to the
  enumeration "tee_type".
* Integrated the FF-A mediator in the TEE mediator framework instead of
  being its own.
* Rebased on staging as of 2023-02-16

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

Jens Wiklander (20):
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: tee: add a primitive FF-A mediator
  tools: add Arm FF-A mediator
  docs: add Arm FF-A mediator
  xen/arm: ffa: add remaining SMC function IDs
  xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
  xen/arm: ffa: add defines for framework direct request/response
    messages
  xen/arm: ffa: note dependency on 4k pages
  xen/arm: ffa: add support for FFA_ID_GET
  xen/arm: ffa: add direct request support
  xen/arm: ffa: map SPMC rx/tx buffers
  xen/arm: ffa: send guest events to Secure Partitions
  xen/arm: ffa: support mapping guest RX/TX buffers
  xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
  xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
  xen/arm: ffa: add defines for sharing memory
  xen/arm: ffa: add ABI structs for sharing memory
  xen/arm: ffa: support sharing memory
  xen/arm: ffa: add support to reclaim shared memory
  xen/arm: ffa: support sharing large memory ranges

 SUPPORT.md                         |    7 +
 docs/man/xl.cfg.5.pod.in           |   15 +
 tools/libs/light/libxl_arm.c       |    3 +
 tools/libs/light/libxl_types.idl   |    3 +-
 xen/arch/arm/arm64/asm-offsets.c   |    9 +
 xen/arch/arm/arm64/smc.S           |   42 +
 xen/arch/arm/include/asm/domain.h  |    2 +-
 xen/arch/arm/include/asm/psci.h    |    4 +
 xen/arch/arm/include/asm/regs.h    |   12 +
 xen/arch/arm/include/asm/smccc.h   |   40 +
 xen/arch/arm/include/asm/tee/ffa.h |   35 +
 xen/arch/arm/tee/Kconfig           |   11 +
 xen/arch/arm/tee/Makefile          |    1 +
 xen/arch/arm/tee/ffa.c             | 1839 ++++++++++++++++++++++++++++
 xen/arch/arm/tee/optee.c           |   11 -
 xen/arch/arm/vsmc.c                |   19 +-
 xen/include/public/arch-arm.h      |    1 +
 17 files changed, 2037 insertions(+), 17 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
 create mode 100644 xen/arch/arm/tee/ffa.c

-- 
2.34.1


