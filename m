Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62CE2F925D
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 13:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69231.123914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l17RM-0004fQ-IF; Sun, 17 Jan 2021 12:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69231.123914; Sun, 17 Jan 2021 12:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l17RM-0004f1-Et; Sun, 17 Jan 2021 12:45:56 +0000
Received: by outflank-mailman (input) for mailman id 69231;
 Sun, 17 Jan 2021 12:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0Xk=GU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l17RL-0004ew-4t
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 12:45:55 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87838b3c-c8cb-448b-89f6-547aa253255c;
 Sun, 17 Jan 2021 12:45:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o17so20045838lfg.4
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 04:45:53 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r18sm1559913lfm.184.2021.01.17.04.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 04:45:51 -0800 (PST)
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
X-Inumbo-ID: 87838b3c-c8cb-448b-89f6-547aa253255c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cnn+RWvN5I1CqzwRcYGQhstDFxE9aLmBj/h3sXBAlxw=;
        b=BCQikygVh2K37wk7SH4sGYIokeHfJwfs6QtkJfK7GRLRTLDBl9v/SmuB9yPpuzINwP
         HuYJXcSVk+yEtUs3E9T0eqM/Dw+kWpSB1ENWJGxvbN5Gf5SB60mnZKZI6Dtv/M+lusai
         w09SeAgJPrXxJoNabsFcBauJQoAqo6zmypsVaxRZfgPsGEPPAFpIT20C/XYDEB4jv6vT
         KHmpoMn3mOmI3qPYLaowmFcvcTd7Tjl6m4962GPnFJtrqtbrSVLIuwvVguXb7J3pqd0x
         IlyoiX8EBcEfcNbUZfPUf4omMRRqo/NBKASqPgh+lLzAsMyQT8eRCzUazFqj53QCETfq
         ry7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cnn+RWvN5I1CqzwRcYGQhstDFxE9aLmBj/h3sXBAlxw=;
        b=iYZD8WXkkYy5J6LGdyma02kyCgAOb4dMClvmVwdd2WcTdmpv9WrWWcDSswugmBt7/L
         XWfBoOyiTm+ruzxskFh2eCpR33og2tFYA3+Or61uKeoRQJGFc5m6F7gPry8oXOXK+kUr
         pIMzsOMdZzosFBRyUqDWRr87SvcsyJF9yPSnp9SLHpe1yUzqrSJz63wwEMtDUuLkHIsv
         zcIuYcZBwuo+i9vvQ0McMEE721JeAPnMMZ8iNjVGhQK565QEv4/P9LDvuljY9rdexelH
         WQwrzAznBS/nKP4vVFM6v+oPlehDr+Vrpy1gAHCzF5Cw/wPMhbXQa/ACtpU+g/47HMzz
         pL3Q==
X-Gm-Message-State: AOAM530FvmRqazNLWxAzP1uuQpfXJg/7xFXeAMz+sg4N6AIxmvJg32pR
	0uF/jYWkpg4tHeFs7F05pHo=
X-Google-Smtp-Source: ABdhPJwYBo6cXa6hnJZ+b45nrLtr2spOs+V5Ip9zzfdErmaaRMNfaP03O8Sa7E/QR9zWsCON1v9T0Q==
X-Received: by 2002:a19:a415:: with SMTP id q21mr9311465lfc.59.1610887552052;
        Sun, 17 Jan 2021 04:45:52 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2101141652360.31265@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dad53a8c-2771-ba81-9fa0-f1ea70aa14cf@gmail.com>
Date: Sun, 17 Jan 2021 14:45:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101141652360.31265@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 02:55, Stefano Stabellini wrote:

Hi Stefano


> On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch adds basic IOREQ/DM support on Arm. The subsequent
>> patches will improve functionality and add remaining bits.
>>
>> The IOREQ/DM features are supposed to be built with IOREQ_SERVER
>> option enabled, which is disabled by default on Arm for now.
>>
>> Please note, the "PIO handling" TODO is expected to left unaddressed
>> for the current series. It is not an big issue for now while Xen
>> doesn't have support for vPCI on Arm. On Arm64 they are only used
>> for PCI IO Bar and we would probably want to expose them to emulator
>> as PIO access to make a DM completely arch-agnostic. So "PIO handling"
>> should be implemented when we add support for vPCI.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - was split into:
>>       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>       - xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>     - update patch description
>>     - update asm-arm/hvm/ioreq.h according to the newly introduced arch functions:
>>       - arch_hvm_destroy_ioreq_server()
>>       - arch_handle_hvm_io_completion()
>>     - update arch files to include xen/ioreq.h
>>     - remove HVMOP plumbing
>>     - rewrite a logic to handle properly case when hvm_send_ioreq() returns IO_RETRY
>>     - add a logic to handle properly handle_hvm_io_completion() return value
>>     - rename handle_mmio() to ioreq_handle_complete_mmio()
>>     - move paging_mark_pfn_dirty() to asm-arm/paging.h
>>     - remove forward declaration for hvm_ioreq_server in asm-arm/paging.h
>>     - move try_fwd_ioserv() to ioreq.c, provide stubs if !CONFIG_IOREQ_SERVER
>>     - do not remove #ifdef CONFIG_IOREQ_SERVER in memory.c for guarding xen/ioreq.h
>>     - use gdprintk in try_fwd_ioserv(), remove unneeded prints
>>     - update list of #include-s
>>     - move has_vpci() to asm-arm/domain.h
>>     - add a comment (TODO) to unimplemented yet handle_pio()
>>     - remove hvm_mmio_first(last)_byte() and hvm_ioreq_(page/vcpu/server) structs
>>       from the arch files, they were already moved to the common code
>>     - remove set_foreign_p2m_entry() changes, they will be properly implemented
>>       in the follow-up patch
>>     - select IOREQ_SERVER for Arm instead of Arm64 in Kconfig
>>     - remove x86's realmode and other unneeded stubs from xen/ioreq.h
>>     - clafify ioreq_t p.df usage in try_fwd_ioserv()
>>     - set ioreq_t p.count to 1 in try_fwd_ioserv()
>>
>> Changes V1 -> V2:
>>     - was split into:
>>       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>       - xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed
>>     - update the author of a patch
>>     - update patch description
>>     - move a loop in leave_hypervisor_to_guest() to a separate patch
>>     - set IOREQ_SERVER disabled by default
>>     - remove already clarified /* XXX */
>>     - replace BUG() by ASSERT_UNREACHABLE() in handle_pio()
>>     - remove default case for handling the return value of try_handle_mmio()
>>     - remove struct hvm_domain, enum hvm_io_completion, struct hvm_vcpu_io,
>>       struct hvm_vcpu from asm-arm/domain.h, these are common materials now
>>     - update everything according to the recent changes (IOREQ related function
>>       names don't contain "hvm" prefixes/infixes anymore, IOREQ related fields
>>       are part of common struct vcpu/domain now, etc)
>>
>> Changes V2 -> V3:
>>     - update patch according the "legacy interface" is x86 specific
>>     - add dummy arch hooks
>>     - remove dummy paging_mark_pfn_dirty()
>>     - don’t include <xen/domain_page.h> in common ioreq.c
>>     - don’t include <public/hvm/ioreq.h> in arch ioreq.h
>>     - remove #define ioreq_params(d, i)
>>
>> Changes V3 -> V4:
>>     - rebase
>>     - update patch according to the renaming IO_ -> VIO_ (io_ -> vio_)
>>       and misc changes to arch hooks
>>     - update patch according to the IOREQ related dm-op handling changes
>>     - don't include <xen/ioreq.h> from arch header
>>     - make all arch hooks out-of-line
>>     - add a comment above IOREQ_STATUS_* #define-s
>> ---
>>   xen/arch/arm/Makefile           |   2 +
>>   xen/arch/arm/dm.c               | 122 +++++++++++++++++++++++
>>   xen/arch/arm/domain.c           |   9 ++
>>   xen/arch/arm/io.c               |  12 ++-
>>   xen/arch/arm/ioreq.c            | 213 ++++++++++++++++++++++++++++++++++++++++
>>   xen/arch/arm/traps.c            |  13 +++
>>   xen/include/asm-arm/domain.h    |   3 +
>>   xen/include/asm-arm/hvm/ioreq.h |  72 ++++++++++++++
>>   xen/include/asm-arm/mmio.h      |   1 +
>>   9 files changed, 446 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/dm.c
>>   create mode 100644 xen/arch/arm/ioreq.c
>>   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 512ffdd..16e6523 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -13,6 +13,7 @@ obj-y += cpuerrata.o
>>   obj-y += cpufeature.o
>>   obj-y += decode.o
>>   obj-y += device.o
>> +obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>   obj-y += domain.o
>>   obj-y += domain_build.init.o
>>   obj-y += domctl.o
>> @@ -27,6 +28,7 @@ obj-y += guest_atomics.o
>>   obj-y += guest_walk.o
>>   obj-y += hvm.o
>>   obj-y += io.o
>> +obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>>   obj-y += irq.o
>>   obj-y += kernel.init.o
>>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
>> new file mode 100644
>> index 0000000..e6dedf4
>> --- /dev/null
>> +++ b/xen/arch/arm/dm.c
>> @@ -0,0 +1,122 @@
>> +/*
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <xen/dm.h>
>> +#include <xen/guest_access.h>
>> +#include <xen/hypercall.h>
>> +#include <xen/ioreq.h>
>> +#include <xen/nospec.h>
>> +
>> +static int dm_op(const struct dmop_args *op_args)
>> +{
>> +    struct domain *d;
>> +    struct xen_dm_op op;
>> +    bool const_op = true;
>> +    long rc;
>> +    size_t offset;
>> +
>> +    static const uint8_t op_size[] = {
>> +        [XEN_DMOP_create_ioreq_server]              = sizeof(struct xen_dm_op_create_ioreq_server),
>> +        [XEN_DMOP_get_ioreq_server_info]            = sizeof(struct xen_dm_op_get_ioreq_server_info),
>> +        [XEN_DMOP_map_io_range_to_ioreq_server]     = sizeof(struct xen_dm_op_ioreq_server_range),
>> +        [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
>> +        [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
>> +        [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
>> +    };
>> +
>> +    rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    rc = xsm_dm_op(XSM_DM_PRIV, d);
>> +    if ( rc )
>> +        goto out;
>> +
>> +    offset = offsetof(struct xen_dm_op, u);
>> +
>> +    rc = -EFAULT;
>> +    if ( op_args->buf[0].size < offset )
>> +        goto out;
>> +
>> +    if ( copy_from_guest_offset((void *)&op, op_args->buf[0].h, 0, offset) )
>> +        goto out;
>> +
>> +    if ( op.op >= ARRAY_SIZE(op_size) )
>> +    {
>> +        rc = -EOPNOTSUPP;
>> +        goto out;
>> +    }
>> +
>> +    op.op = array_index_nospec(op.op, ARRAY_SIZE(op_size));
>> +
>> +    if ( op_args->buf[0].size < offset + op_size[op.op] )
>> +        goto out;
>> +
>> +    if ( copy_from_guest_offset((void *)&op.u, op_args->buf[0].h, offset,
>> +                                op_size[op.op]) )
>> +        goto out;
>> +
>> +    rc = -EINVAL;
>> +    if ( op.pad )
>> +        goto out;
>> +
>> +    rc = ioreq_server_dm_op(&op, d, &const_op);
>> +
>> +    if ( (!rc || rc == -ERESTART) &&
>> +         !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
>> +                                           (void *)&op.u, op_size[op.op]) )
>> +        rc = -EFAULT;
>> +
>> + out:
>> +    rcu_unlock_domain(d);
>> +
>> +    return rc;
>> +}
>> +
>> +long do_dm_op(domid_t domid,
>> +              unsigned int nr_bufs,
>> +              XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
>> +{
>> +    struct dmop_args args;
>> +    int rc;
>> +
>> +    if ( nr_bufs > ARRAY_SIZE(args.buf) )
>> +        return -E2BIG;
>> +
>> +    args.domid = domid;
>> +    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
>> +
>> +    if ( copy_from_guest_offset(&args.buf[0], bufs, 0, args.nr_bufs) )
>> +        return -EFAULT;
>> +
>> +    rc = dm_op(&args);
>> +
>> +    if ( rc == -ERESTART )
>> +        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
>> +                                           domid, nr_bufs, bufs);
>> +
>> +    return rc;
>> +}
> I might have missed something in the discussions but this function is
> identical to xen/arch/x86/hvm/dm.c:do_dm_op, why not make it common?
>
> Also the previous function dm_op is very similar to
> xen/arch/x86/hvm/dm.c:dm_op I would prefer to make them common if
> possible. Was this already discussed?
Well, let me explain. Both dm_op() and do_dm_op() were indeed common 
(top level dm-op handling common) for previous versions, so Arm's dm.c 
didn't contain this stuff.
The idea to make it other way around (top level dm-op handling 
arch-specific and call into ioreq_server_dm_op() for otherwise unhandled 
ops) was discussed at [1] which besides
it's Pros leads to code duplication, so Arm's dm.c has to duplicate some 
stuff, etc.
I was thinking about moving do_dm_op() which is _same_ for both arches 
to common code, but I am not sure whether it is conceptually correct 
which that new "alternative" approach of handling dm-op.
Please see [2].



[1] 
https://lore.kernel.org/xen-devel/1606732298-22107-10-git-send-email-olekstysh@gmail.com/
[2] 
https://lore.kernel.org/xen-devel/1610488352-18494-10-git-send-email-olekstysh@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko


