Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51CC6E22F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165831.1492508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLg23-00089A-OM; Wed, 19 Nov 2025 11:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165831.1492508; Wed, 19 Nov 2025 11:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLg23-00086W-Kd; Wed, 19 Nov 2025 11:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1165831;
 Wed, 19 Nov 2025 11:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snYy=53=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vLg21-00086P-LA
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:07:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea820ecb-c537-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:07:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3A0374EE8C8E;
 Wed, 19 Nov 2025 12:07:18 +0100 (CET)
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
X-Inumbo-ID: ea820ecb-c537-11f0-980a-7dc792cee155
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763550438;
	b=vJs9SRNQJV2hcqjCgctfz82dKLqffBlW4q+AqBKkh9KeWBhi1LTtaVAGXb49re8aLwSA
	 F9nCnB7Z8lvkjgErt8QrlHLJ3cQRqJQIrJREg7+/xl1+JK8DkkQ32cef2XSMKTylpTfok
	 YGri6UR45McSeoHwsHxHehn/RjhsUp56yPPO860/pqQf1owhA702FNR2VgVpeb3MsLnU4
	 sHNLAFG9auZsNhp8VsNrbJtMHKN8tHv9NYb6yVRa5yUX215QqrzfskOG/175sPxSdO9+q
	 ZiuUD4Q/6bQfoU37Kwuqxe9A5v34CCMkhFM8Z2+J91yTNUw7bc0ISqt1zTN7FRP+YYBfb
	 yrmSN+1MeWIEQn7q1Cib6NDSchNLuMctw+v7X/2/47FOjUMPtxizX3dyGWRZmneMb/O18
	 GwtvjIePOoEkdKAFRtS6XKSEL501bMgFz7bhEBOiaJAz62jzC8fIZxpmmhcGrpKuJPhz0
	 STsAZifIeDsD3ybedptgV+gCHwrhjdnXftv5qPFabFuTVqet5daGgBxkb/+my5ZpwtuAo
	 5PdpNriIo6AhFsub0Tyn6e9QaHrDMgVfYO98KKTcNq2/QskZf340k2LG2/4jvwvsB66ty
	 ZcoWRo7Eulbcu3emjTw4WBdzYFP0zkYnUE2R7G9P0isLzi2aHXFaiqoPjCPLQsY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763550438;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=BtbYBFrcflQTy2LooyaKZgzoL1OL5n/f/43HkATRBYU=;
	b=pAUjN4Dr80c4oxnVTxf3S/4XfGQgT7c379n+rUEh9d64si1poItRMrVwWPCKWKbXu8B1
	 8ZXDYlgudGyogFurTEJKwE5zj1EVApW8oEach+wOQFRUE+r/iusoYLFsQIhi4h0kl8wqo
	 dWsOPSdPjfc5VRnZDfB5ZSfZ1KyN4+DecRfsi3pR+/K0LIdhg+nf025T1ppSbNDeY81xI
	 dtsat/OZeJeKeDFqSRCNk3AI4hpEYW9Lt21YMlJYhXijhC/Vtwa6d0aEU9CLR2xpUC3+t
	 RsshNOKtxAAYUyWoN5qc7QN54Lu/AFAwdSSE0qQPTwL6VjkubnLVMlt3Vv6ugA2jCbPGU
	 cg5c6B7+LtLqAcx0G8V95jzzXZXU3d+1CwVVco6UoFINofPXox4gDGOwZLelYzUZYpepQ
	 cX0Unn17E4C9MB6vhTzH2hw9b54Y2ZP9XYWLFUpoZhMZIql0XfAfauHpFW9HCMrwEPBD7
	 ZJIlVTLw5p55F8nkWtx4YidXZzZQhhAslHQfejarA/kbXS1OXU6XdWsLXGtHTbTT0ln2A
	 f/iWqXAtJFdMwMx2J41DuJ72rjAn0Ka7d9kYO5p03gh/ut6QYJyZT+SwxZRRuOr95nZuu
	 pL1dXRhCrWEyzR6qDCNg0cJmjU/qZesrgKKwAtO9DZR1pYsCr1iiTqiTJM9k+X8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1763550438; bh=GXxR5CtSDbp7vtYYENYoRAPCok2PrrLZ9PThtM9t9DA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pba9cvMjLyMBKHXTHA6phm0ys3Nv8krpqVouQKJ09td6+8bkMBKTKzYvSntwKCLKI
	 xoFAjPJGfx5NUwyjnbG/v1nN5UIhCe77s7RlYHq451vMNjDwturbbGL9t8izPp0JKd
	 tkGn3qYI4AbDGIeBtFgR9yZmq0WmvFed74ETM8K4gqjMbSaFVe4q21HrYkhFF3kxen
	 RST2DehHXt9nHGYT+ANwTxjrepkKxox189R7tTsY+ELOUAmeWmsqycwOb/PrYQ16wl
	 anlo4omlE842+o/heK3tqL1UbCcNBv/dpdT+Hh9N7fN9NPdApDeCOxH75m26tLM20q
	 d/3iL5o4wIpwA==
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 12:07:18 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
In-Reply-To: <CAGeoDV_4Bpp50wkd+wtq6zVHg4KZqnOcndG7rfqMndo=HW1sYQ@mail.gmail.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
 <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
 <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com>
 <CAGeoDV_4Bpp50wkd+wtq6zVHg4KZqnOcndG7rfqMndo=HW1sYQ@mail.gmail.com>
Message-ID: <cc55fa4e1d2a2660577389ff92cfe035@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-11-19 12:00, Mykola Kvach wrote:
> Hi Michal,
> 
> Thanks for your review.
> 
> On Wed, Nov 19, 2025 at 10:48 AM Orzel, Michal <michal.orzel@amd.com> 
> wrote:
>> 
>> 
>> 
>> On 18/11/2025 16:37, Mykola Kvach wrote:
>> > From: Mykola Kvach <mykola_kvach@epam.com>
>> >
>> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
>> > allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
>> > (both 32-bit and 64-bit variants).
>> >
>> > Implementation details:
>> > - Add SYSTEM_SUSPEND function IDs to PSCI definitions
>> > - Trap and handle SYSTEM_SUSPEND in vPSCI
>> > - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
>> >   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
>> >   in hwdom_shutdown() via domain_shutdown
>> > - Require all secondary VCPUs of the calling domain to be offline before
>> >   suspend, as mandated by the PSCI specification
>> >
>> > The arch_domain_resume() function is an architecture-specific hook that is
>> > invoked during domain resume to perform any necessary setup or restoration
>> > steps required by the platform.
>> >
>> > The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
>> > the vCPU context (such as entry point, some system regs and context ID) before
>> > resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
>> > code and avoids intrusive changes to the generic resume flow.
>> >
>> > Usage:
>> >
>> > For Linux-based guests, suspend can be initiated with:
>> >     echo mem > /sys/power/state
>> > or via:
>> >     systemctl suspend
>> >
>> > Resuming the guest is performed from control domain using:
>> >       xl resume <domain>
>> >
>> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> > ---
>> > Changes in V14:
>> > - move arch_domain_resume to a separate header
>> > - avoid usage of typeof for context struct
>> > - moved error printing from domain_resume to arch_domain_resume
>> >   in order to simplify common parts of code
>> > - minor changes after review
>> > ---
>> >  xen/arch/arm/domain.c                 |  41 +++++++++
>> >  xen/arch/arm/include/asm/domain.h     |   2 +
>> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>> >  xen/arch/arm/include/asm/psci.h       |   2 +
>> >  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
>> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
>> >  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
>> >  xen/common/domain.c                   |   5 ++
>> >  xen/include/xen/suspend.h             |  15 ++++
>> >  9 files changed, 189 insertions(+), 22 deletions(-)
>> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
>> >  create mode 100644 xen/include/xen/suspend.h
>> >
>> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> > index e36719bce4..3c0170480b 100644
>> > --- a/xen/arch/arm/domain.c
>> > +++ b/xen/arch/arm/domain.c
>> > @@ -12,6 +12,8 @@
>> >  #include <xen/softirq.h>
>> >  #include <xen/wait.h>
>> >
>> > +#include <public/sched.h>
>> > +
>> >  #include <asm/arm64/sve.h>
>> >  #include <asm/cpuerrata.h>
>> >  #include <asm/cpufeature.h>
>> > @@ -24,10 +26,12 @@
>> >  #include <asm/platform.h>
>> >  #include <asm/procinfo.h>
>> >  #include <asm/regs.h>
>> > +#include <asm/suspend.h>
>> >  #include <asm/firmware/sci.h>
>> >  #include <asm/tee/tee.h>
>> >  #include <asm/vfp.h>
>> >  #include <asm/vgic.h>
>> > +#include <asm/vpsci.h>
>> >  #include <asm/vtimer.h>
>> >
>> >  #include "vpci.h"
>> > @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *d)
>> >      p2m_domain_creation_finished(d);
>> >  }
>> >
>> > +int arch_domain_resume(struct domain *d)
>> > +{
>> > +    int rc;
>> > +    struct resume_info *ctx = &d->arch.resume_ctx;
>> > +
>> > +    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
>> > +    {
>> > +        dprintk(XENLOG_WARNING,
>> > +                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
>> These are bool and uint, so %u should be used.
> 
> ack
> 
>> 
>> > +                d, d->is_shutting_down, d->shutdown_code);
>> > +        return -EINVAL;
>> > +    }
>> > +
>> > +    /*
>> > +     * It is still possible to call domain_shutdown() with a suspend reason
>> > +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
>> > +     * In these cases, the resume context will be empty.
>> > +     * This is not expected to cause any issues, so we just warn about the
>> > +     * situation and return without error, allowing the existing logic to
>> > +     * proceed as expected.
>> > +     */
>> > +    if ( !ctx->wake_cpu )
>> > +    {
>> > +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
>> > +                d);
>> > +        return 0;
>> > +    }
>> > +
>> > +    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
>> > +    if ( rc )
>> > +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
>> > +
>> > +    memset(ctx, 0, sizeof(*ctx));
>> > +
>> > +    return rc;
>> > +}
>> > +
>> >  static int is_guest_pv32_psr(uint32_t psr)
>> >  {
>> >      switch (psr & PSR_MODE_MASK)
>> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> > index af3e168374..e637cb4de0 100644
>> > --- a/xen/arch/arm/include/asm/domain.h
>> > +++ b/xen/arch/arm/include/asm/domain.h
>> > @@ -5,6 +5,7 @@
>> >  #include <xen/timer.h>
>> >  #include <asm/page.h>
>> >  #include <asm/p2m.h>
>> > +#include <asm/suspend.h>
>> >  #include <asm/vfp.h>
>> >  #include <asm/mmio.h>
>> >  #include <asm/gic.h>
>> > @@ -126,6 +127,7 @@ struct arch_domain
>> >      void *sci_data;
>> >  #endif
>> >
>> > +    struct resume_info resume_ctx;
>> >  }  __cacheline_aligned;
>> >
>> >  struct arch_vcpu
>> > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
>> > index effd25b69e..8dfcac7e3b 100644
>> > --- a/xen/arch/arm/include/asm/perfc_defn.h
>> > +++ b/xen/arch/arm/include/asm/perfc_defn.h
>> > @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
>> >  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>> >  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>> >  PERFCOUNTER(vpsci_features,            "vpsci: features")
>> > +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
>> >
>> >  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
>> >
>> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
>> > index 4780972621..48a93e6b79 100644
>> > --- a/xen/arch/arm/include/asm/psci.h
>> > +++ b/xen/arch/arm/include/asm/psci.h
>> > @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>> >  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>> >  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>> >  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
>> > +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
>> >
>> >  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>> >  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>> >  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
>> > +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
>> >
>> >  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>> >  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
>> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
>> > new file mode 100644
>> > index 0000000000..b991a94d5a
>> > --- /dev/null
>> > +++ b/xen/arch/arm/include/asm/suspend.h
>> > @@ -0,0 +1,24 @@
>> > +/* SPDX-License-Identifier: GPL-2.0-only */
>> > +
>> > +#ifndef __ARM_SUSPEND_H__
>> There should be no double underscores in guards (see examples in 
>> CODING_STYLE)
> 
> I had initially followed the style used by some of the existing headers
> in this directory, which still use guards with double underscores.
> 
> I'll remove underscores in the next series.
> 
>> > +#define __ARM_SUSPEND_H__
>> > +
>> > +struct resume_info {
>> > +    register_t ep;
>> > +    register_t cid;
>> > +    struct vcpu *wake_cpu;
>> > +};
>> > +
>> > +int arch_domain_resume(struct domain *d);
>> If possible, headers should be standalone, meaning you should include 
>> necessary
>> headers or forward declare what's missing.
> 
> Thanks for the comment.
> 
> My initial intention was to avoid adding new dependencies from asm
> headers to higher-level Xen headers, so I did not include e.g.
> <xen/sched.h> directly here. In this header we only need pointers to
> struct domain and struct vcpu, we never dereference them, so forward
> declarations would be sufficient to make it standalone.
> 
> I also noticed that some existing asm headers in this directory do
> include higher-level Xen headers, so both patterns exist in the tree.
> 
> If you prefer, I can either:
>   - add forward declarations
> 
>       struct domain;
>       struct vcpu;
> 
>     at the top of this header and keep the full includes in the .c
>     files that actually dereference these types, or
> 
>   - include the appropriate Xen header(s) directly in this header.
> 
> Personally I slightly prefer the forward-declaration approach to keep
> this header lightweight and avoid tightening the layering, but I am
> happy to follow your preference.
> 
>> 
>> > +
>> > +#endif /* __ARM_SUSPEND_H__ */
>> > +
>> > + /*
>> > +  * Local variables:
>> > +  * mode: C
>> > +  * c-file-style: "BSD"
>> > +  * c-basic-offset: 4
>> > +  * tab-width: 4
>> > +  * indent-tabs-mode: nil
>> > +  * End:
>> > +  */
>> > diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
>> > index 0cca5e6830..d790ab3715 100644
>> > --- a/xen/arch/arm/include/asm/vpsci.h
>> > +++ b/xen/arch/arm/include/asm/vpsci.h
>> > @@ -23,12 +23,15 @@
>> >  #include <asm/psci.h>
>> >
>> >  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
>> > -#define VPSCI_NR_FUNCS  12
>> > +#define VPSCI_NR_FUNCS  14
>> >
>> >  /* Functions handle PSCI calls from the guests */
>> >  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
>> >  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
>> >
>> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>> > +                          register_t context_id);
>> > +
>> >  #endif /* __ASM_VPSCI_H__ */
>> >
>> >  /*
>> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>> > index 7ba9ccd94b..22c3a5f544 100644
>> > --- a/xen/arch/arm/vpsci.c
>> > +++ b/xen/arch/arm/vpsci.c
>> > @@ -10,32 +10,16 @@
>> >
>> >  #include <public/sched.h>
>> >
>> > -static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>> > -                            register_t context_id)
>> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
>> > +                   register_t context_id)
>> NIT: incorrect parameter alignment
> 
> ack
> 
>> 
>> >  {
>> > -    struct vcpu *v;
>> > -    struct domain *d = current->domain;
>> > -    struct vcpu_guest_context *ctxt;
>> >      int rc;
>> > +    struct domain *d = v->domain;
>> >      bool is_thumb = entry_point & 1;
>> > -    register_t vcpuid;
>> > -
>> > -    vcpuid = vaffinity_to_vcpuid(target_cpu);
>> > -
>> > -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>> > -        return PSCI_INVALID_PARAMETERS;
>> > -
>> > -    /* THUMB set is not allowed with 64-bit domain */
>> > -    if ( is_64bit_domain(d) && is_thumb )
>> > -        return PSCI_INVALID_ADDRESS;
>> > -
>> > -    if ( !test_bit(_VPF_down, &v->pause_flags) )
>> > -        return PSCI_ALREADY_ON;
>> > +    struct vcpu_guest_context *ctxt;
>> >
>> >      if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
>> > -        return PSCI_DENIED;
>> > -
>> > -    vgic_clear_pending_irqs(v);
>> > +        return -ENOMEM;
>> >
>> >      memset(ctxt, 0, sizeof(*ctxt));
>> >      ctxt->user_regs.pc64 = (u64) entry_point;
>> > @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>> >      free_vcpu_guest_context(ctxt);
>> >
>> >      if ( rc < 0 )
>> > +        return rc;
>> > +
>> > +    return 0;
>> > +}
>> > +
>> > +static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
>> > +                            register_t context_id)
>> > +{
>> > +    struct vcpu *v;
>> > +    struct domain *d = current->domain;
>> > +    int rc;
>> > +    bool is_thumb = entry_point & 1;
>> > +    register_t vcpuid;
>> > +
>> > +    vcpuid = vaffinity_to_vcpuid(target_cpu);
>> > +
>> > +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>> > +        return PSCI_INVALID_PARAMETERS;
>> > +
>> > +    /* THUMB set is not allowed with 64-bit domain */
>> > +    if ( is_64bit_domain(d) && is_thumb )
>> > +        return PSCI_INVALID_ADDRESS;
>> > +
>> > +    if ( !test_bit(_VPF_down, &v->pause_flags) )
>> > +        return PSCI_ALREADY_ON;
>> > +
>> > +    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
>> > +    if ( rc )
>> >          return PSCI_DENIED;
>> >
>> > +    vgic_clear_pending_irqs(v);
>> >      vcpu_wake(v);
>> >
>> >      return PSCI_SUCCESS;
>> > @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
>> >      domain_shutdown(d,SHUTDOWN_reboot);
>> >  }
>> >
>> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
>> > +{
>> > +    int32_t rc;
>> > +    struct vcpu *v;
>> > +    struct domain *d = current->domain;
>> > +    bool is_thumb = epoint & 1;
>> > +
>> > +    /* THUMB set is not allowed with 64-bit domain */
>> > +    if ( is_64bit_domain(d) && is_thumb )
>> > +        return PSCI_INVALID_ADDRESS;
>> > +
>> > +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
>> > +    if ( is_hardware_domain(d) )
>> > +        return PSCI_NOT_SUPPORTED;
>> > +
>> > +    /* Ensure that all CPUs other than the calling one are offline */
>> > +    domain_lock(d);
>> > +    for_each_vcpu ( d, v )
>> > +    {
>> > +        if ( v != current && is_vcpu_online(v) )
>> > +        {
>> > +            domain_unlock(d);
>> > +            return PSCI_DENIED;
>> > +        }
>> > +    }
>> > +    domain_unlock(d);
>> > +
>> > +    rc = domain_shutdown(d, SHUTDOWN_suspend);
>> > +    if ( rc )
>> > +        return PSCI_DENIED;
>> > +
>> > +    d->arch.resume_ctx.ep = epoint;
>> > +    d->arch.resume_ctx.cid = cid;
>> > +    d->arch.resume_ctx.wake_cpu = current;
>> > +
>> > +    gprintk(XENLOG_DEBUG,
>> > +            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
>> NIT: %# is preffered over 0x%.
> 
> ack
> 
>> 
>> > +            epoint, cid);
>> > +
>> > +    return rc;
>> > +}
>> > +
>> >  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>> >  {
>> >      /* /!\ Ordered by function ID and not name */
>> > @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>> >      case PSCI_0_2_FN32_SYSTEM_OFF:
>> >      case PSCI_0_2_FN32_SYSTEM_RESET:
>> >      case PSCI_1_0_FN32_PSCI_FEATURES:
>> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>> >      case ARM_SMCCC_VERSION_FID:
>> >          return 0;
>> >      default:
>> > @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>> >          return true;
>> >      }
>> >
>> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>> > +    {
>> > +        register_t epoint = PSCI_ARG(regs, 1);
>> > +        register_t cid = PSCI_ARG(regs, 2);
>> > +
>> > +        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
>> > +        {
>> > +            epoint &= GENMASK(31, 0);
>> > +            cid &= GENMASK(31, 0);
>> > +        }
>> > +
>> > +        perfc_incr(vpsci_system_suspend);
>> > +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
>> > +        return true;
>> > +    }
>> > +
>> >      default:
>> >          return false;
>> >      }
>> > diff --git a/xen/common/domain.c b/xen/common/domain.c
>> > index 775c339285..6410d32970 100644
>> > --- a/xen/common/domain.c
>> > +++ b/xen/common/domain.c
>> > @@ -26,6 +26,7 @@
>> >  #include <xen/hypercall.h>
>> >  #include <xen/delay.h>
>> >  #include <xen/shutdown.h>
>> > +#include <xen/suspend.h>
>> >  #include <xen/percpu.h>
>> >  #include <xen/multicall.h>
>> >  #include <xen/rcupdate.h>
>> > @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
>> >
>> >      spin_lock(&d->shutdown_lock);
>> >
>> > +    if ( arch_domain_resume(d) )
>> > +        goto fail;
>> > +
>> >      d->is_shutting_down = d->is_shut_down = 0;
>> >      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>> >
>> > @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
>> >          v->paused_for_shutdown = 0;
>> >      }
>> >
>> > + fail:
>> >      spin_unlock(&d->shutdown_lock);
>> >
>> >      domain_unpause(d);
>> > diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
>> > new file mode 100644
>> > index 0000000000..53f75fd6ad
>> > --- /dev/null
>> > +++ b/xen/include/xen/suspend.h
>> > @@ -0,0 +1,15 @@
>> > +/* SPDX-License-Identifier: GPL-2.0-only */
>> > +#ifndef __XEN_SUSPEND_H__
>> There should be no double underscores in guards
> 
> I initially followed the style used by the existing headers in this
> directory, which still have include guards with double underscores.
> 
> You are right that this does not match CODING_STYLE examples.
> I will update this header to use a proper guard name.
> 
>> 
>> > +#define __XEN_SUSPEND_H__
>> > +
>> > +#if __has_include(<asm/suspend.h>)
>> > +#include <asm/suspend.h>
>> > +#else
>> > +static inline int arch_domain_resume(struct domain *d)
>> > +{
>> > +    return 0;
>> > +}
>> > +#endif
>> > +
>> Stray whiteline?
> 
> will drop
> 
>> 
>> > +
>> > +#endif /* __XEN_SUSPEND_H__ */
>> Missing emacs block?
> 
> It is permitted but isn't necessary as far as know,
> but if it needed here per your opinion I'll add it
> just let me know
> 
>> 
>> Did you run MISRA scan on this patch?
> 
> Yes, I ran it with:
> 
>   ./xen/scripts/xen-analysis.py \
>       --run-cppcheck --cppcheck-misra --cppcheck-html -- \
>       XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> 
> The analysis did not report any new MISRA violations in the code
> touched by this patch.
> 

This just runs cppcheck, which has many false negatives, but the 
upstream analysis should be done using ECLAIR with GitLab pipelines

>> 
>> ~Michal
>> 
>> 
> 
> Best regards,
> Mykola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

