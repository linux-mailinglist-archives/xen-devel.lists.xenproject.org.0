Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BD5FECC3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422752.669005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIK3-00042X-Je; Fri, 14 Oct 2022 10:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422752.669005; Fri, 14 Oct 2022 10:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIK3-0003yN-GW; Fri, 14 Oct 2022 10:53:47 +0000
Received: by outflank-mailman (input) for mailman id 422752;
 Fri, 14 Oct 2022 10:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Vh=2P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ojIK1-0003Z3-8I
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:53:45 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7821b7c6-4bae-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:53:43 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so4492390pjl.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 03:53:43 -0700 (PDT)
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
X-Inumbo-ID: 7821b7c6-4bae-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5vsiJalDbjby2om3CQm0IH1msjjCaXJq8bt03niS5qI=;
        b=TlduGKO8Bh7thwB4rCCy1azM4v9Lze3+t+rbIj2CbcShSSs+QiOGJlabCe00k/fxx3
         G+Pg5yHqZPfSnDSoNeDTJ9+e/g7UphKSnmLwprQpbP5MXUlmP/9pLtQOGtPOp7Mz86mY
         cDNVfl6TBZgyItxXLXqGcvX8EePiFrW50ZoZJpA/YZHjZtNYKM1Tz+tH1+v1EOxzW+NL
         obkccgCqgFMJSTNJHAoxtk5LIJfheZVR8beQ2LjuZ1Whvnj7NFBOLgq7W7qhuhEpgxlx
         Gb0kN5azoh2E3vZEx2rAooH0nATorfAiU8vybph+VAswcclx/iHcst+lyehhcrK+pI87
         fJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vsiJalDbjby2om3CQm0IH1msjjCaXJq8bt03niS5qI=;
        b=g6gtnANi8VMUHeJ3X8NmityYQoScxzciEUOX0tK96SessFcvhfi7i+SPHBIKj03rO2
         uZE28Aa3KsjKM+fhC8NKYV2tMZ8oGhZZLcwUvSi8ImkWFnZe2oSyhjy6EjsW4UDvd0fC
         oIKkvZpEAd97PCSRRP6l0MKMZxcyh+1SHhwiztPlylkqjIYPY8i9EdArPgsgswM7FkjQ
         vV4ZARvKV6uPiQktmH0wAai6LrxJe9hUsd5EheanWdfuJOx3n4Cl/J38p5ayr/ZhX8vk
         sv96g69mYr/tZ1Z1K1UYGGth0WKsmmifAmIM241Kn7ez7UXAus0km8NaAK+M49tSLYjw
         CxXQ==
X-Gm-Message-State: ACrzQf23gqB12eDDvdu08SRRTV2thZIl7ATV7MXZDPAibUI4X5FA1jBs
	5UCVVYs71BDXffodJBlfBBNw/YuiTRhJXmAGBc4jvJvwfqw6vw==
X-Google-Smtp-Source: AMsMyM4ZjWVlcTIf7ju6WsADtB9wdbDsBTeVYqn4jrnWU0/ZZKH4eMqmXgOpcHvG6RnQr3U3o6dsK/3MU2d5+n9eFUw=
X-Received: by 2002:a17:902:cf11:b0:178:29d7:4fbd with SMTP id
 i17-20020a170902cf1100b0017829d74fbdmr4560873plg.174.1665744822237; Fri, 14
 Oct 2022 03:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Oct 2022 12:53:31 +0200
Message-ID: <CAHUa44G9cFOy=s7+zfZQ=XJ0FrqHd2bcx9B11Hn7ZHB9+9AM2g@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Xen FF-A mediator
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I understand that you're busy with the Xen release. When you have time
to resume reviewing this patch set please let me know if I should
rebase it first.

Thanks,
Jens

On Mon, Sep 19, 2022 at 11:12 AM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hi,
>
> This patch sets add a FF-A [1] mediator modeled after the TEE mediator
> already present in Xen. The FF-A mediator implements the subset of the FF-A
> 1.1 specification needed to communicate with OP-TEE using FF-A as transport
> mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
> design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
> partition of itself to each guest in Xen.
>
> The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> except that only the subset needed for OP-TEE is implemented so far. The
> hooks needed to inform OP-TEE that a guest is created or destroyed is part
> of the FF-A specification.
>
> It should be possible to extend the FF-A mediator to implement a larger
> portion of the FF-A 1.1 specification without breaking with the way OP-TEE
> is communicated with here. So it should be possible to support any TEE or
> Secure Partition using FF-A as transport with this mediator.
>
> [1] https://developer.arm.com/documentation/den0077/latest
>
> Thanks,
> Jens
>
> v5->v6:
> * Updated "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
>   commit message and moved the patch right before the patch which needs it.
>   Applied Michal Orzel's R-B tag.
> * Renamed the guest configuration option "ffa_enabled" to "ffa" and
>   updated the description.
> * More tools update in "xen/arm: add a primitive FF-A mediator" with the "ffa"
>   option, including golang and ocaml.
> * Update ffa_domain_init() to return an error if communication with
>   the SPMC can't be established.
> * Factored out a ffa_domain_destroy() from ffa_relinquish_resources().
> * Added ffa_get_call_count() to give an accurate number of FF-A function,
>   updated in each patch as new FF-A functions are added.
> * Added a flags field in struct xen_arch_domainconfig that replaces the
>   ffa_enabled field.
> * Made check_mandatory_feature() __init
> * Replaced a few printk() calls with gprintk() where needed.
> * Rebased on staging as of 2022-09-14
>
> V4->v5:
> * Added "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
> * Added documentation for the "ffa_enabled" guest config flag
> * Changed to GPL license for xen/arch/arm/ffa.c
> * Added __read_mostly and const where applicable
> * Added more describing comments in the code
> * Moved list of shared memory object ("ffa_mem_list") into the guest context
>   as they are guest specific
> * Simplified a few of the simple wrapper functions for SMC to SPMC
> * Added a BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE) since the mediator
>   currently depends on the page size to be same as FFA_PAGE_SIZE (4k).
> * Added max number of shared memory object per guest and max number of
>   size of each shared memory object
> * Added helper macros to calculate offsets of different FF-A data structures
>   in the communication buffer instead of relying on pointer arithmetic
> * Addressed style issues and other comments
> * Broke the commit "xen/arm: add FF-A mediator" into multiple parts, trying
>   to add a few features at a time as requested
> * Added a missing call to rxtx_unmap() in ffa_relinquish_resources()
> * Assignment of "ffa_enabled" is kept as is until I have something definitive
>   on the type etc.
> * Tested with CONFIG_DEBUG=y
>
> v3->v4:
> * Missed v3 and sent a v4 instead by mistake.
>
> v2->v3:
> * Generates offsets into struct arm_smccc_1_2_regs with asm-offsets.c in
>   order to avoid hard coded offsets in the assembly function
>   arm_smccc_1_2_smc()
> * Adds an entry in SUPPORT.md on the FF-A status
> * Adds a configuration variable "ffa_enabled" to tell if FF-A should be
>   enabled for a particular domu guest
> * Moves the ffa_frag_list for fragmented memory share requests into
>   struct ffa_ctx instead to keep it per guest in order to avoid mixups
>   and simplify locking
> * Adds a spinlock to struct ffa_ctx for per guest locking
> * Addressing style issues and suggestions
> * Uses FFA_FEATURES to check that all the needed features are available
>   before initializing the mediator
> * Rebased on staging as of 2022-06-20
>
> v1->v2:
> * Rebased on staging to resolve some merge conflicts as requested
>
> Jens Wiklander (9):
>   xen/arm: smccc: add support for SMCCCv1.2 extended input/output
>     registers
>   xen/arm: add a primitive FF-A mediator
>   xen/arm: ffa: add direct request support
>   xen/arm: ffa: map SPMC rx/tx buffers
>   xen/arm: ffa: send guest events to Secure Partitions
>   xen/arm: ffa: support mapping guest RX/TX buffers
>   xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
>   xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
>   xen/arm: ffa: support sharing memory
>
>  SUPPORT.md                           |    7 +
>  docs/man/xl.cfg.5.pod.in             |   15 +
>  tools/golang/xenlight/helpers.gen.go |    6 +
>  tools/golang/xenlight/types.gen.go   |    1 +
>  tools/include/libxl.h                |    6 +
>  tools/libs/light/libxl_arm.c         |    6 +
>  tools/libs/light/libxl_types.idl     |    1 +
>  tools/ocaml/libs/xc/xenctrl.ml       |    1 +
>  tools/ocaml/libs/xc/xenctrl.mli      |    1 +
>  tools/xl/xl_parse.c                  |    1 +
>  xen/arch/arm/Kconfig                 |   11 +
>  xen/arch/arm/Makefile                |    1 +
>  xen/arch/arm/arm64/asm-offsets.c     |    9 +
>  xen/arch/arm/arm64/smc.S             |   42 +
>  xen/arch/arm/domain.c                |   11 +
>  xen/arch/arm/domain_build.c          |    1 +
>  xen/arch/arm/ffa.c                   | 1827 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h    |    4 +
>  xen/arch/arm/include/asm/ffa.h       |   78 ++
>  xen/arch/arm/include/asm/regs.h      |   12 +
>  xen/arch/arm/include/asm/smccc.h     |   40 +
>  xen/arch/arm/tee/optee.c             |   11 -
>  xen/arch/arm/vsmc.c                  |   19 +-
>  xen/include/public/arch-arm.h        |    4 +
>  24 files changed, 2100 insertions(+), 15 deletions(-)
>  create mode 100644 xen/arch/arm/ffa.c
>  create mode 100644 xen/arch/arm/include/asm/ffa.h
>
> --
> 2.31.1
>

