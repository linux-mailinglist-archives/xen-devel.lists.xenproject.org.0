Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC295819F65
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 13:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657783.1026865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFw7G-0007Ga-Ig; Wed, 20 Dec 2023 12:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657783.1026865; Wed, 20 Dec 2023 12:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFw7G-0007Ec-G2; Wed, 20 Dec 2023 12:56:02 +0000
Received: by outflank-mailman (input) for mailman id 657783;
 Wed, 20 Dec 2023 12:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFw7F-0007EW-BY
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 12:56:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e032d85-9f37-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 13:55:57 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e30b28c1aso5248483e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 04:55:57 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 5-20020ac25f45000000b0050e2e793e32sm1170166lfz.188.2023.12.20.04.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 04:55:55 -0800 (PST)
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
X-Inumbo-ID: 1e032d85-9f37-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703076956; x=1703681756; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EL9H/SClswL/CAdJ5OzfqbaN5AMradeuQsVYTYk2zTs=;
        b=AuL/4VS8KD2axmIde0XQlbHgPpdattHE4xiK9XqJJzc07BX8bdeTwXcm9aNBMjzX4l
         e1Jq2/VK0fY/jC4ESLv5z6901UvXxw7ByQOVRKyWml2zB7xwfO0ueyQwKZ76lUORELnA
         yV7zpGSucGgwEV8DOt908nPRQx/8ckqG3I+NqvaXW7H4N9s5cNIEDv3eb5LLRX/4UY9M
         wN6suW9Z9XLJP1Jjm3FESpWa9GdE4pf22NlY8ZlsQSeK+slxO0S6tTRnmvKRKrDemKuK
         3daAxUHP/zIUR30RDvvqFiaPxu3t7CY+gqsATsl0YlLCRHKamnourDuRXwjBwqMzVmlF
         ur7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703076956; x=1703681756;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EL9H/SClswL/CAdJ5OzfqbaN5AMradeuQsVYTYk2zTs=;
        b=s1wlJ3QtDcdATdfF5m5Yjl+LAHPu2zk8hrSNKhSnA3xOAS5TPfYZEOir5dIDpp/RiJ
         XE0UZwgOW7txNk5Y39GCkSZLNR8kGGfTdfaSXbWmxAGAIAhVURyUCJzPrt5pr/+3C6cu
         znkQOgKtf6mnEQ/XNTmD36X5DyAiM5bNmt3gZzVZJJAPU6s+nUwwg7Vccp5Ae218FVmq
         3Jlu+1TK9RwTqUBV22C4MUePMt/4j76Bggna78TvCD9IyEjjP8YedJC8byMjENj0MUQL
         spai/wE1P0ZdaC5aoNvinXols5f7/abrau0NH08UKQR8ALM4qUV3IxUL+US2RVPiugwq
         6Y1Q==
X-Gm-Message-State: AOJu0YxnMA6HW9HRbdmYccpmeZVFJ9k/v7ZeUY0JADVng8xW4FK1fq/Y
	vPJgUJsFywFFGJqbw5VvJXg=
X-Google-Smtp-Source: AGHT+IE+U5rqzDdrLaJjWRGn4zaAHN1n/qAEbH8g1DPnOFFgheQVsox3WidIWjfXmUdhdna+bdGGrg==
X-Received: by 2002:a05:6512:2211:b0:50b:e6e4:c6c9 with SMTP id h17-20020a056512221100b0050be6e4c6c9mr13291578lfu.85.1703076956233;
        Wed, 20 Dec 2023 04:55:56 -0800 (PST)
Message-ID: <3c34e22a4cf040845e734c3575512945a87465dd.camel@gmail.com>
Subject: Re: [PATCH v2 37/39] xen/rirscv: add minimal amount of stubs to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 20 Dec 2023 14:55:55 +0200
In-Reply-To: <f52b19eb-7633-48df-85b9-c6a545dc4232@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
	 <f52b19eb-7633-48df-85b9-c6a545dc4232@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 18:00 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -1,19 +1,23 @@
> > =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> > =C2=A0
> > +#include <xen/bug.h>
> > =C2=A0#include <xen/cache.h>
> > =C2=A0#include <xen/compiler.h>
> > =C2=A0#include <xen/init.h>
> > =C2=A0#include <xen/kernel.h>
> > =C2=A0#include <xen/macros.h>
> > +#include <xen/mm.h>
> > =C2=A0#include <xen/pfn.h>
> > =C2=A0
> > =C2=A0#include <asm/early_printk.h>
> > =C2=A0#include <asm/csr.h>
> > =C2=A0#include <asm/current.h>
> > -#include <asm/mm.h>
> > =C2=A0#include <asm/page.h>
> > =C2=A0#include <asm/processor.h>
> > =C2=A0
> > +unsigned long frametable_base_pdx __read_mostly;
> > +unsigned long frametable_virt_end __read_mostly;
>=20
> Nit (style):
>=20
> unsigned long __read_mostly frametable_base_pdx;
> unsigned long __read_mostly frametable_virt_end;
>=20
> (i.e. attributes generally between type and identifier). Plus
> __read_mostly or __ro_after_init?
I'll update the style.
I looked at code where this variables are used and they can be
__ro_after_init.
Thanks.
>=20
> > @@ -294,3 +298,49 @@ unsigned long __init calc_phys_offset(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 phys_offset =3D load_start - XEN_VIRT_START;
> > =C2=A0=C2=A0=C2=A0=C2=A0 return phys_offset;
> > =C2=A0}
> > +
> > +void put_page(struct page_info *page)
> > +{
> > +=C2=A0=C2=A0=C2=A0 assert_failed(__func__);
> > +}
> > +
> > +unsigned long get_upper_mfn_bound(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No memory hotplug yet, so current memory limit i=
s the final
> > one. */
> > +=C2=A0=C2=A0=C2=A0 return max_page - 1;
> > +}
> > +
> > +void arch_dump_shared_mem_info(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 WARN();
> > +}
> > +
> > +int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
> > +{
> > +=C2=A0=C2=A0=C2=A0 assert_failed(__func__);
> > +=C2=A0=C2=A0=C2=A0 return -1;
> > +}
>=20
> Whats the pattern between picking WARN(), assert_failed() (which I
> don't
> think you should be using anyway; if an assertion, then
> ASSERT_UNREACHABLE())
> and BUG() (as used earlier in stubs living in header files)?
There is no specific pattern; initially, I used WARN() everywhere.
However, when the time came to implement this function, it became
challenging to identify the location of some WARN() occurrences.
Consequently, I started changing them to assert_failed(__func__) to
pinpoint the source.

I'll be switching to BUG()
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -0,0 +1,426 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#include <xen/cpumask.h>
> > +#include <xen/domain.h>
> > +#include <xen/irq.h>
> > +#include <xen/nodemask.h>
> > +#include <xen/time.h>
> > +#include <public/domctl.h>
> > +#include <public/vm_event.h>
>=20
> I think I can see why you need the former of these last two, but do
> you
> really need the latter?
It is needed for vm_event_request_t and vm_event_response_t, but if use
a forward declaration that it won't be needed:

typedef struct vm_event_st vm_event_request_t;
typedef struct vm_event_st vm_event_response_t;
>=20
> > +#include <asm/current.h>
> > +
> > +/* smpboot.c */
> > +
> > +cpumask_t cpu_online_map;
> > +cpumask_t cpu_present_map;
> > +cpumask_t cpu_possible_map;
> > +
> > +/* ID of the PCPU we're running on */
> > +DEFINE_PER_CPU(unsigned int, cpu_id);
> > +/* XXX these seem awfully x86ish... */
> > +/* representing HT siblings of each logical CPU */
> > +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
> > +/* representing HT and core siblings of each logical CPU */
> > +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
> > +
> > +nodemask_t __read_mostly node_online_map =3D { { [0] =3D 1UL } };
> > +
> > +/* time.c */
> > +
> > +unsigned long __read_mostly cpu_khz;=C2=A0 /* CPU clock frequency in
> > kHz. */
> > +
> > +s_time_t get_s_time(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +int reprogram_timer(s_time_t timeout)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void send_timer_event(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void domain_set_time_offset(struct domain *d, int64_t
> > time_offset_seconds)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +/* shutdown.c */
> > +
> > +void machine_restart(unsigned int delay_millisecs)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void machine_halt(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +/* vm_event.c */
> > +
> > +void vm_event_fill_regs(vm_event_request_t *req)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void vm_event_set_registers(struct vcpu *v, vm_event_response_t
> > *rsp)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void vm_event_monitor_next_interrupt(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Not supported on RISCV. */
> > +}
> > +
> > +void vm_event_reset_vmtrace(struct vcpu *v)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Not supported on RISCV. */
> > +}
> > +
> > +/* domctl.c */
> > +
> > +long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HANDLE_PARAM(xen_do=
mctl_t) u_domctl)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void arch_get_domain_info(const struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct xen_domctl_getdomaininfo *info)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +/* monitor.c */
> > +
> > +int arch_monitor_domctl_event(struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +/* smp.c */
> > +
> > +void arch_flush_tlb_mask(const cpumask_t *mask)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void smp_send_event_check_mask(const cpumask_t *mask)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void smp_send_call_function_mask(const cpumask_t *mask)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +/* irq.c */
> > +
> > +struct pirq *alloc_pirq_struct(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int
> > will_share)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t
> > *mask)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +static void ack_none(struct irq_desc *irq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
> > +
> > +static void end_none(struct irq_desc *irq)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG();
> > +}
>=20
> Much like I said for PPC - I don't think you need the two, as ...
>=20
> > +hw_irq_controller no_irq_type =3D {
> > +=C2=A0=C2=A0=C2=A0 .typename =3D "none",
> > +=C2=A0=C2=A0=C2=A0 .startup =3D irq_startup_none,
> > +=C2=A0=C2=A0=C2=A0 .shutdown =3D irq_shutdown_none,
> > +=C2=A0=C2=A0=C2=A0 .enable =3D irq_enable_none,
> > +=C2=A0=C2=A0=C2=A0 .disable =3D irq_disable_none,
> > +=C2=A0=C2=A0=C2=A0 .ack =3D ack_none,
> > +=C2=A0=C2=A0=C2=A0 .end =3D end_none
>=20
> ... there's nothing right now to invoke these hooks.
They really can be dropped.
I'll take into account that.

Thanks.


~ Oleksii

