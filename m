Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD01755CB4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564173.881458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXu-0005Qp-M7; Mon, 17 Jul 2023 07:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564173.881458; Mon, 17 Jul 2023 07:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXu-0005P6-GM; Mon, 17 Jul 2023 07:21:26 +0000
Received: by outflank-mailman (input) for mailman id 564173;
 Mon, 17 Jul 2023 07:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXt-0005A9-7g
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:25 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 875611a1-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:21 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so6518084e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:21 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:19 -0700 (PDT)
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
X-Inumbo-ID: 875611a1-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578480; x=1692170480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcyDFAwMClUMKj1eUnO6D/yh7YyMNNNtbCimK9Us1eo=;
        b=Y0oD3nWFn57AhmvKH6IUPbSgB6ak5ksRb+KfcgDUV0yXObAZXhWmjIL06dUVb6hOQ2
         L/ym+RTbC6+32f5aLx8bqX9MgP9ctEsudH0xApf1x2VSDf8JKJSZfMbIuEMPLt7V5oWf
         2/3TH+a1hQLmJ11r99hFrpYmjG/2JVdxxbtkgw44h+/qf2XxIkQqj4JCnuPfyzsv6QzL
         GDfF4WJY3J2IydoFKOz41vMgTTva9O6kH/eT5HlRUOliMR/bvC+II9tti0WTMjOwkadc
         S59UNAKKzrAbvzMgytKOE/OX1JDLN4T2xs8Y/bFf7d4n8XnlzJdQExxpg1gceghTZS+J
         PUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578480; x=1692170480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcyDFAwMClUMKj1eUnO6D/yh7YyMNNNtbCimK9Us1eo=;
        b=LQBnJqXzGgEANP3amzB/bUEJVu5NwA+kl+jJBgbl6nQYtJ6bCGTSIXGiKEYGgoensF
         dj10sZbjHKyNbpn3XPPIfjeIMGNAgUCSNOQyBFLEC2X6Cp4JsYOreUmTq6aZKuHC0ume
         fwNWbdfVdQQ5OoWsB0A0kRho0v2VBiQXo7MGpW5wfDfk5Axfd/AJNuHW5BUOPCNUg0Wq
         vwuV8nZRQFhq8zX4o7dzYQMcby60ita7rkG8fvXZhr5hvVwMpM00V/DaBguJzNo0u0sl
         6Tlsz5yaKZ49MuQWU+wpOC+Mu5t71gHS5HeRU/9jvovYa6oLzbTCqyTCFn8njOFeZ8km
         sCFw==
X-Gm-Message-State: ABy/qLaZhlASzBqoQFsuNdyIHyXXOGUw4T6YCNhfNfbr6WI4ddYhUffG
	tdKbgg6ZKfijWgcGSPfZTrwqyq+Sw87lpktC+WY=
X-Google-Smtp-Source: APBJJlEJdRaPF54ta/Kl63xSnBIFgxID+WuKmJEDF5/IMpIQqzou/bXcoF9Lr5dveilSkwa2O8QTlA==
X-Received: by 2002:a05:6512:39d4:b0:4fb:cab9:ddf with SMTP id k20-20020a05651239d400b004fbcab90ddfmr8987298lfu.57.1689578480106;
        Mon, 17 Jul 2023 00:21:20 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v10 00/24] Xen FF-A mediator
Date: Mon, 17 Jul 2023 09:20:43 +0200
Message-Id: <20230717072107.753304-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
branch "xen_ffa_v10".

With help from Bertrand I've integrated this in a test setup with OP-TEE.
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
That's currently the same as the "xen_ffa_v10" branch, but the "ffa" branch
may change later as I update for a new version of the patch set.

[1] https://developer.arm.com/documentation/den0077/latest

Thanks,
Jens

v9->v10:
Changelog in the the patches for two changed patches:
- "xen: Introduce arch_domain_teardown()"
- "xen/arm: add TEE teardown to arch_domain_teardown()"

v8->v9:
* Patch "xen/arm: ffa: add remaining SMC function IDs"
  - mention the documentation number used
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
* Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
  - Adding a reference to the documentation
  - Renaming FFA_PART_PROP_IS_MASK to FFA_PART_PROP_IS_TYPE_MASK
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
* Patch "xen/arm: ffa: add defines for framework direct request/response messages"
  - add a reference to the documentation
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
* Patch "docs: add Arm FF-A mediator"
  - Updating the wording as requested.
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
  - Fixing a few typos and adding a reference to the code for a list of
    limitations
* Patch "xen/arm: ffa: list current limitations"
  - Fixing a couple of typos
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
  - Removing an invalid limitation of FFA_RXTX_MAP_*
* Patch "xen/arm: ffa: add defines for sharing memory"
  - Fixing a few typos
  - Adding a reference to the documentation
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
  - Updating FFA_MAX_SHM_PAGE_COUNT to have a safe margin to
    TEEC_CONFIG_SHAREDMEM_MAX_SIZE
* Patch "xen/arm: ffa: add direct request support"
  - Fixing a coding style issue
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
  - Updating the TODO comment about features.
* Patch "xen/arm: ffa: send guest events to Secure Partitions"
  - Adding a TODO comment and a limit on the loop in ffa_direct_req_send_vm()
* Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
  - Change FFA_MAX_RXTX_PAGE_COUNT to 1 with a TODO for a larger value
  - Replace !p2m_is_ram(t) test with t != p2m_ram_rw
  - Rename the introduced field tx_is_free to tx_is_free
* Patch "xen/arm: ffa: support sharing memory"
  - Fixing read_atomic() issue in get_shm_pages()
  - Fixing style issue in free_ffa_shm_mem()
  - Replace !p2m_is_ram(t) test with t != p2m_ram_rw in get_shm_pages()
* Patch "tools: add Arm FF-A mediator"
  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
  - Adding Acked-by: Anthony PERARD <anthony.perard@citrix.com>
  - Moving the patch to just before the docs patch.
* Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com to:
  - "xen/arm: ffa: enforce dependency on 4k pages"
  - "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
  - "xen/arm: ffa: add ABI structs for sharing memory"
* Adding "xen: Introduce arch_domain_teardown()" by Andrew Cooper
* Adding "xen/arm: add TEE teardown to arch_domain_teardown()" 
  based on a patch from Andrew Cooper

v7->v8:
* Adding "xen/arm: ffa: list current limitations" as requested
* Adding tags to "xen/arm: smccc: add support for SMCCCv1.2 extended
  input/output registers"
* Patch "xen/arm: tee: add a primitive FF-A mediator":
  - Changing license for ffa.h and ffa.c to GPL-2.0-only
  - Avoiding IS_ENABLED() in the constant FFA_NR_FUNCS
  - Accepting version 1.1 SPMC only to keep things simple
  - Removes 32bit and only supports 64bit to keep things simple
* Patch "tools: add Arm FF-A mediator"
  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
  - Adding LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA for the "ffa" value 
    in arch_arm.tee
* Patch "docs: add Arm FF-A mediator"
  - Fixing a spell error
  - Moving the patch last in the series
* Patch "xen/arm: ffa: add remaining SMC function IDs"
  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
  - Renaming the define FFA_MSG_RUN to FFA_RUN to match the specification
* Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
  - Updating the comment describing the flags for FFA_PARTITION_INFO_GET
* Patch "xen/arm: ffa: add defines for framework direct request/response
  messages"
  - Updating the comment describing the flags for MSG_SEND_DIRECT_REQ/RESP
* Patch "xen/arm: ffa: enforce dependency on 4k pages"
  - Updating title of patch
  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
* Patch "xen/arm: ffa: add support for FFA_ID_GET"
  - In ffa_domain_init(), check that domain_id isn't greater than
    UINT16_MAX to avoid a future potential integer overflow in get_vm_id()
* Patch "xen/arm: ffa: add direct request support"
  - Move preemption (interrupted) parts to a separate patch "xen/arm: ffa:
    support preemption of SP during direct request"
  - Remove loop in handle_msg_send_direct_req() to return eventual
    errors back to the VM instead of the SP.
* Patch "xen/arm: ffa: map SPMC rx/tx buffers"
  - Adding a FFA_RXTX_PAGE_COUNT define instead of using 1 directly
* New patch "xen/arm: ffa: support preemption of SP during direct request"
* Patch "xen/arm: ffa: send guest events to Secure Partitions"
  - Replacing unsigned int with uint16_t for subscr_vm_created_count and
    subscr_vm_destroyed_count plus the needed range check to see that
    they don't overflow.
* Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
  - Limit the number of pages in VM RX/TX buffers to 32 using a new
    FFA_MAX_RXTX_PAGE_COUNT define.
* Patch "xen/arm: ffa: support guest FFA_PARTITION_INFO_GET"
  - Renaming tx_is_mine to rx_is_free as requested
  - Simplified the FFA_PARTITION_INFO_GET_COUNT_FLAG check in
    handle_partition_info_get()
  - Adding a comment on ownership of the RX buffer
  - Adding the patch "xen/arm: ffa: improve lock granularity" to address
    parts of the locking concerns.
* Patch "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
* Patch "xen/arm: ffa: add defines for sharing memory"
  - Fixing reference for FFA_NORMAL_MEM_REG_ATTR and FFA_MEM_ACC_RW
  - Updating descirption for FFA_MAX_SHM_PAGE_COUNT
* Patch "xen/arm: ffa: add ABI structs for sharing memory"
  - Changing name of the "global_handle" memeber in struct
    ffa_mem_transaction_* to "handle".
* Patch "xen/arm: ffa: support sharing memory"
  - Use FFA_MEM_SHARE_64 only since we changed to only suporting ARM_64.
  - Rename struct ffa_mem_transaction_x to struct ffa_mem_transaction_int
    as requested.
  - Adding a check that shm->page_count isn't 0 before calling share_shm()
  - Masking return value from FFA_MEM_FRAG_RX to avoid an implic cast to
    the int32_t returned by ffa_mem_share().
* Patch "xen/arm: ffa: add support to reclaim shared memory"
  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
* Patch "xen/arm: ffa: support sharing large memory ranges"
  - Adding commetns for struct ffa_ctx
  - Cleaning up and removing the fragmentation state if handle_mem_frag_tx()
    detects an error.
* Adding "xen/arm: ffa: improve lock granularity" to address some of the
  locking concerns.

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



Andrew Cooper (1):
  xen: Introduce arch_domain_teardown()

Jens Wiklander (23):
  xen/arm: add TEE teardown to arch_domain_teardown()
  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
    registers
  xen/arm: tee: add a primitive FF-A mediator
  xen/arm: ffa: add remaining SMC function IDs
  xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
  xen/arm: ffa: add defines for framework direct request/response
    messages
  xen/arm: ffa: enforce dependency on 4k pages
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
  xen/arm: ffa: improve lock granularity
  xen/arm: ffa: list current limitations
  tools: add Arm FF-A mediator
  docs: add Arm FF-A mediator

 SUPPORT.md                         |    9 +
 docs/man/xl.cfg.5.pod.in           |   15 +
 tools/include/libxl.h              |    5 +
 tools/libs/light/libxl_arm.c       |    3 +
 tools/libs/light/libxl_types.idl   |    3 +-
 xen/arch/arm/arm64/asm-offsets.c   |    9 +
 xen/arch/arm/arm64/smc.S           |   42 +
 xen/arch/arm/domain.c              |   40 +
 xen/arch/arm/include/asm/psci.h    |    4 +
 xen/arch/arm/include/asm/regs.h    |   12 +
 xen/arch/arm/include/asm/smccc.h   |   40 +
 xen/arch/arm/include/asm/tee/ffa.h |   35 +
 xen/arch/arm/include/asm/tee/tee.h |    7 +
 xen/arch/arm/tee/Kconfig           |   11 +
 xen/arch/arm/tee/Makefile          |    1 +
 xen/arch/arm/tee/ffa.c             | 1988 ++++++++++++++++++++++++++++
 xen/arch/arm/tee/optee.c           |   11 +-
 xen/arch/arm/tee/tee.c             |    8 +
 xen/arch/arm/vsmc.c                |   19 +-
 xen/arch/x86/domain.c              |    5 +
 xen/common/domain.c                |    6 +
 xen/include/public/arch-arm.h      |    1 +
 xen/include/xen/domain.h           |    1 +
 xen/include/xen/sched.h            |    1 +
 24 files changed, 2263 insertions(+), 13 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
 create mode 100644 xen/arch/arm/tee/ffa.c

-- 
2.34.1


