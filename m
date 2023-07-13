Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C7751990
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562949.879762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqUx-0005lK-Vq; Thu, 13 Jul 2023 07:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562949.879762; Thu, 13 Jul 2023 07:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqUx-0005gT-S0; Thu, 13 Jul 2023 07:12:23 +0000
Received: by outflank-mailman (input) for mailman id 562949;
 Thu, 13 Jul 2023 07:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bWA=C7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qJqUw-0005cv-T4
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:12:23 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9afe5934-214c-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:12:20 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-635ee3baa14so1602166d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 00:12:20 -0700 (PDT)
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
X-Inumbo-ID: 9afe5934-214c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232339; x=1691824339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVBsFNcMcN27JVUrRBvthC7aYOWj6V0PgXOouSvKXOE=;
        b=GK1BYzD8ty/NfWzvyARbvTIhbsNmj7WFGCEkU68kR37gyteo3L8BO5ItxWXKwecX2q
         9OFB8fSYZiRq5CAXRE6Nls82daD8205qTTi5Oo5esr9fuG3zoPXhs7znVsUX9CtrobcD
         C5SOi8f/MlWnwCHhfCibcx62v6SBKMGjAqTNibtC4g+1TPj7Aez8fDDP0ACPZp80kRfl
         K/DHSFWbcHHJzJ/9Drqz8VG5+ft9HZI6gVQQ9EE9yFkPY7QFP9EWBHxdtUgxCFK2vbKy
         bXRwnENFwol/1xQS3s12abMBiAT52tq9iCU96HH+jzVLJG5w8ULmfWkE9xWSAVhkpS+T
         SYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232339; x=1691824339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVBsFNcMcN27JVUrRBvthC7aYOWj6V0PgXOouSvKXOE=;
        b=J4GFG0Jc5cEeh/f6k2wvB4mdnktOwU6SVTpMfE+06aFvKWYw3UWbE2YIIHC0OxRiVY
         CiHGtg6HuEYn6naqzJ2oTaTIKZA5EAnkVV/ZmThyMUeWQcMFIbdCQKdnxOWvQSKns8+n
         r5tyA7pAyUsUtAYYgsLtS6ALMaRCypmsp9d5lDxeaFVbw+YADQkh/q3I+8Pb3oahwmH0
         /4+piNN5Tc3NSqH6o/Kmf+/hBm6QqRt1+g2Qc/hSeK/SXo+S1YTlgy0XV1CVaBHDOrED
         SJjXoG1EOqBnM77YSEadjNCUf2THZSs/Zt2894YlbZ7Rtv0Tr3aVbNzlnyG0LlSp08E+
         +vpg==
X-Gm-Message-State: ABy/qLZGvWm8CxQdAVTli3vDej3MLx3YzgKc5DboiwmPufSH1CQtk71i
	MTaOL1nGPgR30vP+s7HysIXCI6vWa9tGO+yQut6hVA==
X-Google-Smtp-Source: APBJJlEZaXwb7tSVvkiDSu65OS9c1Vgu0Iq6WcVWZN6mYt6Rp1SU4I+kCJ5PyP9aebaRCMRskYL6UDUxOxl1QpBgV/A=
X-Received: by 2002:a0c:fca8:0:b0:635:e25d:7eff with SMTP id
 h8-20020a0cfca8000000b00635e25d7effmr477846qvq.6.1689232339061; Thu, 13 Jul
 2023 00:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230705093433.2514898-1-jens.wiklander@linaro.org> <480AA225-0590-40BE-BCD5-ADCCB1BC2274@arm.com>
In-Reply-To: <480AA225-0590-40BE-BCD5-ADCCB1BC2274@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Jul 2023 09:12:08 +0200
Message-ID: <CAHUa44FQotjOASHhUknwju20iOoFnub3erYOp+b_2+h=NCvv1A@mail.gmail.com>
Subject: Re: [XEN PATCH v9 00/24] Xen FF-A mediator
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Jul 12, 2023 at 11:39=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 5 Jul 2023, at 11:34, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi,
> >
> > This patch sets add an FF-A [1] mediator to the TEE mediator framework
> > already present in Xen.  The FF-A mediator implements the subset of the
> > FF-A 1.1 specification needed to communicate with OP-TEE using FF-A as
> > transport mechanism instead of SMC/HVC as with the TEE mediator. It all=
ows
> > a similar design in OP-TEE as with the TEE mediator where OP-TEE presen=
ts
> > one virtual partition of itself to each guest in Xen.
> >
> > The FF-A mediator is generic in the sense it has nothing OP-TEE specifi=
c
> > except that only the subset needed for OP-TEE is implemented so far. Th=
e
> > hooks needed to inform OP-TEE that a guest is created or destroyed are =
part
> > of the FF-A specification.
> >
> > It should be possible to extend the FF-A mediator to implement a larger
> > portion of the FF-A 1.1 specification without breaking with the way OP-=
TEE
> > is communicated with here. So it should be possible to support any TEE =
or
> > Secure Partition using FF-A as transport with this mediator.
> >
> > The patches are also available at https://github.com/jenswi-linaro/xen
> > branch "xen_ffa_v9".
> >
> > With help from Bertrand I've integrated this in a test setup with OP-TE=
E.
> > Please check prerequisites at
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> >
> > My setup is duplicated using:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.x=
ml \
> >        -b qemu_xen_ffa
> > repo sync -j8
> > cd build
> > make -j8 toolchains
> > make -j8 all
> > make run-only
> >
> > Test in dom0 with for instance:
> > xtest 1004
> >
> > at the prompt.
> >
> > To start up a domu and connect to it do:
> > cd /mnt/host/build/qemu_v8/xen
> > xl create guest_ffa.cfg
> > xl console domu
> >
> > Then test as usual with "xtest 1004".
> >
> > The setup uses the branch "ffa" from https://github.com/jenswi-linaro/x=
en.
> > That's currently the same as the "xen_ffa_v9" branch, but the "ffa" bra=
nch
> > may change later as I update for a new version of the patch set.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> >
> > Thanks,
> > Jens
> >
> > v8->v9:
> > * Patch "xen/arm: ffa: add remaining SMC function IDs"
> >  - mention the documentation number used
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > * Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
> >  - Adding a reference to the documentation
> >  - Renaming FFA_PART_PROP_IS_MASK to FFA_PART_PROP_IS_TYPE_MASK
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > * Patch "xen/arm: ffa: add defines for framework direct request/respons=
e messages"
> >  - add a reference to the documentation
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > * Patch "docs: add Arm FF-A mediator"
> >  - Updating the wording as requested.
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> >  - Fixing a few typos and adding a reference to the code for a list of
> >    limitations
> > * Patch "xen/arm: ffa: list current limitations"
> >  - Fixing a couple of typos
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> >  - Removing an invalid limitation of FFA_RXTX_MAP_*
> > * Patch "xen/arm: ffa: add defines for sharing memory"
> >  - Fixing a few typos
> >  - Adding a reference to the documentation
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> >  - Updating FFA_MAX_SHM_PAGE_COUNT to have a safe margin to
> >    TEEC_CONFIG_SHAREDMEM_MAX_SIZE
> > * Patch "xen/arm: ffa: add direct request support"
> >  - Fixing a coding style issue
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> >  - Updating the TODO comment about features.
> > * Patch "xen/arm: ffa: send guest events to Secure Partitions"
> >  - Adding a TODO comment and a limit on the loop in ffa_direct_req_send=
_vm()
> > * Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
> >  - Change FFA_MAX_RXTX_PAGE_COUNT to 1 with a TODO for a larger value
> >  - Replace !p2m_is_ram(t) test with t !=3D p2m_ram_rw
> >  - Rename the introduced field tx_is_free to tx_is_free
> > * Patch "xen/arm: ffa: support sharing memory"
> >  - Fixing read_atomic() issue in get_shm_pages()
> >  - Fixing style issue in free_ffa_shm_mem()
> >  - Replace !p2m_is_ram(t) test with t !=3D p2m_ram_rw in get_shm_pages(=
)
> > * Patch "tools: add Arm FF-A mediator"
> >  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> >  - Adding Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> >  - Moving the patch to just before the docs patch.
> > * Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com to:
> >  - "xen/arm: ffa: enforce dependency on 4k pages"
> >  - "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h=
"
> >  - "xen/arm: ffa: add ABI structs for sharing memory"
> > * Adding "xen: Introduce arch_domain_teardown()" by Andrew Cooper
> > * Adding "xen/arm: add TEE teardown to arch_domain_teardown()"
> >  based on a patch from Andrew Cooper
>
> It makes it easier for reviewers if you put the changelog per patch
> instead of having all of them in the cover letter.

OK. When I post the next version is it enough to document the v9->v10
changes in the affected patches?

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > v7->v8:
> > * Adding "xen/arm: ffa: list current limitations" as requested
> > * Adding tags to "xen/arm: smccc: add support for SMCCCv1.2 extended
> >  input/output registers"
> > * Patch "xen/arm: tee: add a primitive FF-A mediator":
> >  - Changing license for ffa.h and ffa.c to GPL-2.0-only
> >  - Avoiding IS_ENABLED() in the constant FFA_NR_FUNCS
> >  - Accepting version 1.1 SPMC only to keep things simple
> >  - Removes 32bit and only supports 64bit to keep things simple
> > * Patch "tools: add Arm FF-A mediator"
> >  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >  - Adding LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA for the "ffa" value
> >    in arch_arm.tee
> > * Patch "docs: add Arm FF-A mediator"
> >  - Fixing a spell error
> >  - Moving the patch last in the series
> > * Patch "xen/arm: ffa: add remaining SMC function IDs"
> >  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >  - Renaming the define FFA_MSG_RUN to FFA_RUN to match the specificatio=
n
> > * Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
> >  - Updating the comment describing the flags for FFA_PARTITION_INFO_GET
> > * Patch "xen/arm: ffa: add defines for framework direct request/respons=
e
> >  messages"
> >  - Updating the comment describing the flags for MSG_SEND_DIRECT_REQ/RE=
SP
> > * Patch "xen/arm: ffa: enforce dependency on 4k pages"
> >  - Updating title of patch
> >  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > * Patch "xen/arm: ffa: add support for FFA_ID_GET"
> >  - In ffa_domain_init(), check that domain_id isn't greater than
> >    UINT16_MAX to avoid a future potential integer overflow in get_vm_id=
()
> > * Patch "xen/arm: ffa: add direct request support"
> >  - Move preemption (interrupted) parts to a separate patch "xen/arm: ff=
a:
> >    support preemption of SP during direct request"
> >  - Remove loop in handle_msg_send_direct_req() to return eventual
> >    errors back to the VM instead of the SP.
> > * Patch "xen/arm: ffa: map SPMC rx/tx buffers"
> >  - Adding a FFA_RXTX_PAGE_COUNT define instead of using 1 directly
> > * New patch "xen/arm: ffa: support preemption of SP during direct reque=
st"
> > * Patch "xen/arm: ffa: send guest events to Secure Partitions"
> >  - Replacing unsigned int with uint16_t for subscr_vm_created_count and
> >    subscr_vm_destroyed_count plus the needed range check to see that
> >    they don't overflow.
> > * Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
> >  - Limit the number of pages in VM RX/TX buffers to 32 using a new
> >    FFA_MAX_RXTX_PAGE_COUNT define.
> > * Patch "xen/arm: ffa: support guest FFA_PARTITION_INFO_GET"
> >  - Renaming tx_is_mine to rx_is_free as requested
> >  - Simplified the FFA_PARTITION_INFO_GET_COUNT_FLAG check in
> >    handle_partition_info_get()
> >  - Adding a comment on ownership of the RX buffer
> >  - Adding the patch "xen/arm: ffa: improve lock granularity" to address
> >    parts of the locking concerns.
> > * Patch "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to r=
egs.h"
> >  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > * Patch "xen/arm: ffa: add defines for sharing memory"
> >  - Fixing reference for FFA_NORMAL_MEM_REG_ATTR and FFA_MEM_ACC_RW
> >  - Updating descirption for FFA_MAX_SHM_PAGE_COUNT
> > * Patch "xen/arm: ffa: add ABI structs for sharing memory"
> >  - Changing name of the "global_handle" memeber in struct
> >    ffa_mem_transaction_* to "handle".
> > * Patch "xen/arm: ffa: support sharing memory"
> >  - Use FFA_MEM_SHARE_64 only since we changed to only suporting ARM_64.
> >  - Rename struct ffa_mem_transaction_x to struct ffa_mem_transaction_in=
t
> >    as requested.
> >  - Adding a check that shm->page_count isn't 0 before calling share_shm=
()
> >  - Masking return value from FFA_MEM_FRAG_RX to avoid an implic cast to
> >    the int32_t returned by ffa_mem_share().
> > * Patch "xen/arm: ffa: add support to reclaim shared memory"
> >  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > * Patch "xen/arm: ffa: support sharing large memory ranges"
> >  - Adding commetns for struct ffa_ctx
> >  - Cleaning up and removing the fragmentation state if handle_mem_frag_=
tx()
> >    detects an error.
> > * Adding "xen/arm: ffa: improve lock granularity" to address some of th=
e
> >  locking concerns.
> >
> > v6->v7:
> > * Split some of the larger patches into smaller patches for easier revi=
ew.
> >  For instance, the v6 patch "xen/arm: add a primitive FF-A mediator" ha=
s
> >  been replaced with:
> >  - "xen/arm: add a primitive FF-A mediator"
> >  - "tools: add Arm FF-A mediator"
> >  - "docs: add Arm FF-A mediator"
> >  - "xen/arm: ffa: add remaining SMC function IDs"
> > * Some small fixes in the error path for handle_mem_share()
> > * Switched to SPDX for license in new files.
> > * Fixed comment style issues in
> >  "xen/arm: smccc: add support for SMCCCv1.2 extended input/output regis=
ters"
> > * Made FFA support UNSUPPORTED in "xen/arm: add a primitive FF-A mediat=
or"
> > * Replaced ffa_get_call_count() with FFA_NR_FUNCS
> > * Update the FFA_MAX_SHM_PAGE_COUNT with a formula instead of a value.
> > * Replaced XEN_ARM_FLAGS_FFA with XEN_DOMCTL_CONFIG_TEE_FFA to minimize=
 impact
> >  on struct xen_arch_domainconfig. This works because the FF-A mediator =
and
> >  the OP-TEE mediator will not be used at the same time in by a guest.
> > * Replaced "ffa" boolean in the guest config with a new "ffa" value to =
the
> >  enumeration "tee_type".
> > * Integrated the FF-A mediator in the TEE mediator framework instead of
> >  being its own.
> > * Rebased on staging as of 2023-02-16
> >
> > v5->v6:
> > * Updated "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to=
 regs.h"
> >  commit message and moved the patch right before the patch which needs =
it.
> >  Applied Michal Orzel's R-B tag.
> > * Renamed the guest configuration option "ffa_enabled" to "ffa" and
> >  updated the description.
> > * More tools update in "xen/arm: add a primitive FF-A mediator" with th=
e "ffa"
> >  option, including golang and ocaml.
> > * Update ffa_domain_init() to return an error if communication with
> >  the SPMC can't be established.
> > * Factored out a ffa_domain_destroy() from ffa_relinquish_resources().
> > * Added ffa_get_call_count() to give an accurate number of FF-A functio=
n,
> >  updated in each patch as new FF-A functions are added.
> > * Added a flags field in struct xen_arch_domainconfig that replaces the
> >  ffa_enabled field.
> > * Made check_mandatory_feature() __init
> > * Replaced a few printk() calls with gprintk() where needed.
> > * Rebased on staging as of 2022-09-14
> >
> > V4->v5:
> > * Added "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to r=
egs.h"
> > * Added documentation for the "ffa_enabled" guest config flag
> > * Changed to GPL license for xen/arch/arm/ffa.c
> > * Added __read_mostly and const where applicable
> > * Added more describing comments in the code
> > * Moved list of shared memory object ("ffa_mem_list") into the guest co=
ntext
> >  as they are guest specific
> > * Simplified a few of the simple wrapper functions for SMC to SPMC
> > * Added a BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE) since the mediator
> >  currently depends on the page size to be same as FFA_PAGE_SIZE (4k).
> > * Added max number of shared memory object per guest and max number of
> >  size of each shared memory object
> > * Added helper macros to calculate offsets of different FF-A data struc=
tures
> >  in the communication buffer instead of relying on pointer arithmetic
> > * Addressed style issues and other comments
> > * Broke the commit "xen/arm: add FF-A mediator" into multiple parts, tr=
ying
> >  to add a few features at a time as requested
> > * Added a missing call to rxtx_unmap() in ffa_relinquish_resources()
> > * Assignment of "ffa_enabled" is kept as is until I have something defi=
nitive
> >  on the type etc.
> > * Tested with CONFIG_DEBUG=3Dy
> >
> > v3->v4:
> > * Missed v3 and sent a v4 instead by mistake.
> >
> > v2->v3:
> > * Generates offsets into struct arm_smccc_1_2_regs with asm-offsets.c i=
n
> >  order to avoid hard coded offsets in the assembly function
> >  arm_smccc_1_2_smc()
> > * Adds an entry in SUPPORT.md on the FF-A status
> > * Adds a configuration variable "ffa_enabled" to tell if FF-A should be
> >  enabled for a particular domu guest
> > * Moves the ffa_frag_list for fragmented memory share requests into
> >  struct ffa_ctx instead to keep it per guest in order to avoid mixups
> >  and simplify locking
> > * Adds a spinlock to struct ffa_ctx for per guest locking
> > * Addressing style issues and suggestions
> > * Uses FFA_FEATURES to check that all the needed features are available
> >  before initializing the mediator
> > * Rebased on staging as of 2022-06-20
> >
> > v1->v2:
> > * Rebased on staging to resolve some merge conflicts as requested
> >
> > Andrew Cooper (1):
> >  xen: Introduce arch_domain_teardown()
> >
> > Jens Wiklander (23):
> >  xen/arm: add TEE teardown to arch_domain_teardown()
> >  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
> >    registers
> >  xen/arm: tee: add a primitive FF-A mediator
> >  xen/arm: ffa: add remaining SMC function IDs
> >  xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
> >  xen/arm: ffa: add defines for framework direct request/response
> >    messages
> >  xen/arm: ffa: enforce dependency on 4k pages
> >  xen/arm: ffa: add support for FFA_ID_GET
> >  xen/arm: ffa: add direct request support
> >  xen/arm: ffa: map SPMC rx/tx buffers
> >  xen/arm: ffa: send guest events to Secure Partitions
> >  xen/arm: ffa: support mapping guest RX/TX buffers
> >  xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
> >  xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
> >  xen/arm: ffa: add defines for sharing memory
> >  xen/arm: ffa: add ABI structs for sharing memory
> >  xen/arm: ffa: support sharing memory
> >  xen/arm: ffa: add support to reclaim shared memory
> >  xen/arm: ffa: support sharing large memory ranges
> >  xen/arm: ffa: improve lock granularity
> >  xen/arm: ffa: list current limitations
> >  tools: add Arm FF-A mediator
> >  docs: add Arm FF-A mediator
> >
> > SUPPORT.md                         |    9 +
> > docs/man/xl.cfg.5.pod.in           |   15 +
> > tools/include/libxl.h              |    5 +
> > tools/libs/light/libxl_arm.c       |    3 +
> > tools/libs/light/libxl_types.idl   |    3 +-
> > xen/arch/arm/arm64/asm-offsets.c   |    9 +
> > xen/arch/arm/arm64/smc.S           |   42 +
> > xen/arch/arm/domain.c              |   41 +
> > xen/arch/arm/include/asm/psci.h    |    4 +
> > xen/arch/arm/include/asm/regs.h    |   12 +
> > xen/arch/arm/include/asm/smccc.h   |   40 +
> > xen/arch/arm/include/asm/tee/ffa.h |   35 +
> > xen/arch/arm/include/asm/tee/tee.h |    7 +
> > xen/arch/arm/tee/Kconfig           |   11 +
> > xen/arch/arm/tee/Makefile          |    1 +
> > xen/arch/arm/tee/ffa.c             | 1988 ++++++++++++++++++++++++++++
> > xen/arch/arm/tee/optee.c           |   11 +-
> > xen/arch/arm/tee/tee.c             |    8 +
> > xen/arch/arm/vsmc.c                |   19 +-
> > xen/arch/x86/domain.c              |    5 +
> > xen/common/domain.c                |    6 +
> > xen/include/public/arch-arm.h      |    1 +
> > xen/include/xen/domain.h           |    1 +
> > xen/include/xen/sched.h            |    1 +
> > 24 files changed, 2264 insertions(+), 13 deletions(-)
> > create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> > create mode 100644 xen/arch/arm/tee/ffa.c
> >
> > --
> > 2.34.1
> >
>

