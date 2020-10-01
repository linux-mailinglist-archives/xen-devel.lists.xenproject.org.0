Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D734128017C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 16:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308.4378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNzmG-0007K3-D4; Thu, 01 Oct 2020 14:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308.4378; Thu, 01 Oct 2020 14:41:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNzmG-0007Je-9m; Thu, 01 Oct 2020 14:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1308;
 Thu, 01 Oct 2020 14:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNzmF-0007JZ-BD
 for xen-devel@lists.xen.org; Thu, 01 Oct 2020 14:41:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b258e573-9868-4faa-be4c-7cd801db2a59;
 Thu, 01 Oct 2020 14:41:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 668E4AC3C;
 Thu,  1 Oct 2020 14:41:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNzmF-0007JZ-BD
	for xen-devel@lists.xen.org; Thu, 01 Oct 2020 14:41:47 +0000
X-Inumbo-ID: b258e573-9868-4faa-be4c-7cd801db2a59
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b258e573-9868-4faa-be4c-7cd801db2a59;
	Thu, 01 Oct 2020 14:41:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601563305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cz+hDwcdU0MjLMs7Za9pLsd7gSCv0Vor0U6mUxc9Z0g=;
	b=dvDGFoH6el//vErrEiEEx8sZJOQ3pAq37ekNsa1StG9bJwRPk1EtOm8p/caRgniJODS9KB
	Gj5+RpDi7UcflnluZ5cDAowoxEsOAM67XoB7Un+E1wV/SCytCzheF1+DpU9mz9w/s5eblO
	HIuNcTejcKhVwlnLLTPq5uYrX044mMc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 668E4AC3C;
	Thu,  1 Oct 2020 14:41:45 +0000 (UTC)
Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
To: Don Slutz <don.slutz@gmail.com>
Cc: xen-devel@lists.xen.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7581f3a-71eb-3181-9128-01e22653a47e@suse.com>
Date: Thu, 1 Oct 2020 16:41:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.08.2020 18:52, Don Slutz wrote:
> This adds synchronization of the 6 vcpu registers (only 32bits of
> them) that QEMU's vmport.c and vmmouse.c needs between Xen and QEMU.
> This is how VMware defined the use of these registers.
> 
> This is to avoid a 2nd and 3rd exchange between QEMU and Xen to
> fetch and put these 6 vcpu registers used by the code in QEMU's
> vmport.c and vmmouse.c

I'm unconvinced this warrants a new ioreq type, and all the overhead
associated with it. I'd be curious to know what Paul or the qemu
folks think here.

> --- a/tools/libxc/xc_dom_x86.c
> +++ b/tools/libxc/xc_dom_x86.c
> @@ -67,6 +67,7 @@
>  #define SPECIALPAGE_IOREQ    5
>  #define SPECIALPAGE_IDENT_PT 6
>  #define SPECIALPAGE_CONSOLE  7
> +#define SPECIALPAGE_VMPORT_REGS 8
>  #define special_pfn(x) \
>      (X86_HVM_END_SPECIAL_REGION - X86_HVM_NR_SPECIAL_PAGES + (x))
>  
> @@ -657,6 +658,8 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
>                       special_pfn(SPECIALPAGE_BUFIOREQ));
>      xc_hvm_param_set(xch, domid, HVM_PARAM_IOREQ_PFN,
>                       special_pfn(SPECIALPAGE_IOREQ));
> +    xc_hvm_param_set(xch, domid, HVM_PARAM_VMPORT_REGS_PFN,
> +                     special_pfn(SPECIALPAGE_VMPORT_REGS));

I don't think we want to see new special PFNs appear. This ought to
be made work through the acquire_resource interface instead.

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -28,6 +28,8 @@
>  #include <asm/iocap.h>
>  #include <asm/vm_event.h>
>  
> +vmware_regs_t *get_vmport_regs_any(struct hvm_ioreq_server *s, struct vcpu *v);

Prototypes need to be in scope for both consumer and producer, to
ensure changes done on either side get reflected on the other (or
suitably diagnosed by the compiler).

> @@ -173,6 +175,8 @@ static int hvmemul_do_io(
>      };
>      void *p_data = (void *)data;
>      int rc;
> +    bool_t is_vmware = !is_mmio && !data_is_addr &&
> +        vmport_check_port(p.addr, p.size);

As to the data_is_addr part - what about REP INS / REP OUTS?

> @@ -189,11 +193,17 @@ static int hvmemul_do_io(
>      case STATE_IOREQ_NONE:
>          break;
>      case STATE_IORESP_READY:
> +    {
> +        uint8_t calc_type = is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO;
> +
> +        if ( is_vmware )
> +            calc_type = IOREQ_TYPE_VMWARE_PORT;
> +
>          vio->io_req.state = STATE_IOREQ_NONE;
>          p = vio->io_req;
>  
>          /* Verify the emulation request has been correctly re-issued */
> -        if ( (p.type != (is_mmio ? IOREQ_TYPE_COPY : IOREQ_TYPE_PIO)) ||
> +        if ( (p.type != calc_type) ||
>               (p.addr != addr) ||
>               (p.size != size) ||
>               (p.count > *reps) ||
> @@ -202,7 +212,7 @@ static int hvmemul_do_io(
>               (p.data_is_ptr != data_is_addr) ||
>               (data_is_addr && (p.data != data)) )
>              domain_crash(currd);
> -
> +    }
>          if ( data_is_addr )
>              return X86EMUL_UNHANDLEABLE;
>  
> @@ -322,6 +332,49 @@ static int hvmemul_do_io(
>              }
>          }
>  
> +        if ( unlikely(is_vmware) )
> +        {
> +            vmware_regs_t *vr;
> +
> +            BUILD_BUG_ON(sizeof(ioreq_t) < sizeof(vmware_regs_t));
> +
> +            p.type = vio->io_req.type = IOREQ_TYPE_VMWARE_PORT;
> +            s = hvm_select_ioreq_server(currd, &p);
> +            vr = get_vmport_regs_any(s, curr);

The function tries to give you vr even if s is NULL - at best you're
going to have inconsistent pointers in the end. I think the function
either wants to return NULL for NULL input, or you want to avoid
calling the function when s is NULL.

> +            /*
> +             * If there is no suitable backing DM, just ignore accesses.  If
> +             * we do not have access to registers to pass to QEMU, just
> +             * ignore access.
> +             */
> +            if ( !s || !vr )
> +            {
> +                rc = hvm_process_io_intercept(&null_handler, &p);
> +                vio->io_req.state = STATE_IOREQ_NONE;
> +            }
> +            else
> +            {
> +                const struct cpu_user_regs *regs = guest_cpu_user_regs();
> +
> +                p.data = regs->rax;
> +                /* The code in QEMU that uses these registers,
> +                 * vmport.c and vmmouse.c, only uses the 32bit part
> +                 * of the register.  This is how VMware defined the
> +                 * use of these registers.
> +                 */

Comment style (also elsewhere).

> +                vr->ebx = regs->ebx;
> +                vr->ecx = regs->ecx;
> +                vr->edx = regs->edx;
> +                vr->esi = regs->esi;
> +                vr->edi = regs->edi;

In the description you tale about 6 registers. Is ebp missing here
(and below)?

> +                rc = hvm_send_ioreq(s, &p, 0);
> +                if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
> +                    vio->io_req.state = STATE_IOREQ_NONE;
> +            }
> +            break;
> +        }
> +
>          if ( !s )
>              s = hvm_select_ioreq_server(currd, &p);

Please consider moving most of the if()'s body above below here, so
this remains a single, common call. Presumably even some more code
below here should remain common. The more code you duplicate, the
higher the risk of things getting updated in one place but not the
other.

> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -108,6 +108,44 @@ static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
>      return NULL;
>  }
>  
> +static vmware_regs_t *get_vmport_regs_one(struct hvm_ioreq_server *s,
> +                                          struct vcpu *v)
> +{
> +    struct hvm_ioreq_vcpu *sv;
> +
> +    list_for_each_entry ( sv, &s->ioreq_vcpu_list, list_entry )
> +    {
> +        if ( sv->vcpu == v )
> +        {
> +            shared_vmport_iopage_t *p = s->vmport_ioreq.va;
> +            if ( !p )
> +                return NULL;
> +            return &p->vcpu_vmport_regs[v->vcpu_id];
> +        }
> +    }
> +    return NULL;
> +}
> +
> +vmware_regs_t *get_vmport_regs_any(struct hvm_ioreq_server *s, struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    unsigned int id;
> +
> +    ASSERT((v == current) || !vcpu_runnable(v));
> +
> +    if ( s )
> +        return get_vmport_regs_one(s, v);
> +
> +    FOR_EACH_IOREQ_SERVER(d, id, s)
> +    {
> +        vmware_regs_t *ret = get_vmport_regs_one(s, v);
> +
> +        if ( ret )
> +            return ret;
> +    }
> +    return NULL;
> +}

I think the naming wants improving, to take less reference to
get_ioreq() and more to more modern, properly prefixed naming.
E.g. vmport_get_regs() with the static helper becoming
_vmport_get_regs_one() or just _vmport_get_regs() (but as per
above I'm unconvinced the helper is needed).

Also for both functions (and generally)
- add const to pointed to types whenever possible,
- have a blank line between declarations and statements,
- put a blank line before a function's main return.

> @@ -206,6 +244,26 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          return handle_mmio();
>  
>      case HVMIO_pio_completion:
> +        if ( vio->io_req.type == IOREQ_TYPE_VMWARE_PORT )
> +        {
> +            vmware_regs_t *vr = get_vmport_regs_any(NULL, v);

Why NULL? Isn't s the server you're after? Also - const.

> @@ -233,16 +291,28 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct hvm_ioreq_server *s)
>      unsigned int i;
>  
>      BUILD_BUG_ON(HVM_PARAM_BUFIOREQ_PFN != HVM_PARAM_IOREQ_PFN + 1);
> +    BUILD_BUG_ON(HVM_PARAM_VMPORT_REGS_PFN != HVM_PARAM_BUFIOREQ_PFN + 1);
>  
>      for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )

Without this for() changing I don't see why you put the BUILD_BUG_ON()
here.

>      {
> -        if ( !test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )
> +        if ( test_and_clear_bit(i, &d->arch.hvm.ioreq_gfn.legacy_mask) )

I can't believe this to be a correct change, or if there is a bug
to be fixed here, for this to belong here.

> @@ -293,9 +363,29 @@ static void hvm_free_ioreq_gfn(struct hvm_ioreq_server *s, gfn_t gfn)
>      }
>  }
>  
> -static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
> +typedef enum {
> +    ioreq_pt_ioreq,
> +    ioreq_pt_bufioreq,
> +    ioreq_pt_vmport,
> +} ioreq_pt_;

Why the trailing underscore? And may I ask what "pt" stands for?

> +static void hvm_unmap_ioreq_gfn(struct hvm_ioreq_server *s, ioreq_pt_ pt)
>  {
> -    struct hvm_ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    struct hvm_ioreq_page *iorp = NULL;
> +
> +    switch ( pt )
> +    {
> +    case ioreq_pt_ioreq:
> +        iorp = &s->ioreq;
> +        break;
> +    case ioreq_pt_bufioreq:
> +        iorp = &s->bufioreq;
> +        break;
> +    case ioreq_pt_vmport:
> +        iorp = &s->vmport_ioreq;
> +        break;
> +    }
> +    ASSERT(iorp);
>  
>      if ( gfn_eq(iorp->gfn, INVALID_GFN) )
>          return;

For an ASSERT() like this, please take a look at the bottom of ./CODING_STYLE.
I think you want a default case in the switch() body with ASSERT_UNREACHABLE()
and "return" instead. (Just in case this won't go away anyway, or some similar
construct then appears elsewhere.)

> @@ -329,7 +433,10 @@ static int hvm_map_ioreq_gfn(struct hvm_ioreq_server *s, bool buf)
>      if ( d->is_dying )
>          return -EINVAL;
>  
> -    iorp->gfn = hvm_alloc_ioreq_gfn(s);
> +    if ( pt == ioreq_pt_vmport )
> +        iorp->gfn = hvm_alloc_legacy_vmport_gfn(s);
> +    else
> +        iorp->gfn = hvm_alloc_ioreq_gfn(s);

I'm unconvinced the separate function is warranted, in case this stays in the
first place.

> @@ -645,12 +844,38 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>      for ( i = 0; i < NR_IO_RANGE_TYPES; i++ )
>      {
>          char *name;
> +        char *type_name = NULL;
> +        unsigned int limit;
>  
> -        rc = asprintf(&name, "ioreq_server %d %s", id,
> -                      (i == XEN_DMOP_IO_RANGE_PORT) ? "port" :
> -                      (i == XEN_DMOP_IO_RANGE_MEMORY) ? "memory" :
> -                      (i == XEN_DMOP_IO_RANGE_PCI) ? "pci" :
> -                      "");
> +        switch ( i )
> +        {
> +        case XEN_DMOP_IO_RANGE_PORT:
> +            type_name = "port";
> +            limit = MAX_NR_IO_RANGES;
> +            break;
> +        case XEN_DMOP_IO_RANGE_MEMORY:
> +            type_name = "memory";
> +            limit = MAX_NR_IO_RANGES;
> +            break;
> +        case XEN_DMOP_IO_RANGE_PCI:
> +            type_name = "pci";
> +            limit = MAX_NR_IO_RANGES;
> +            break;
> +        case XEN_DMOP_IO_RANGE_VMWARE_PORT:
> +            type_name = "VMware port";
> +            limit = 1;
> +            break;
> +        case XEN_DMOP_IO_RANGE_TIMEOFFSET:
> +            type_name = "timeoffset";
> +            limit = 1;
> +            break;

Personally I'd prefer if you simply added a single line to the
asprintf() invocation above. I don't see at all why the time offset
thingy is appearing here (and elsewhere below) all of the sudden.
And there's no point for the limit variable afaict, as you ...

> @@ -663,7 +888,11 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>          if ( !s->range[i] )
>              goto fail;
>  
> -        rangeset_limit(s->range[i], MAX_NR_IO_RANGES);
> +        rangeset_limit(s->range[i], limit);
> +
> +        /* VMware port */
> +        if ( i == XEN_DMOP_IO_RANGE_VMWARE_PORT && s->vmport_enabled )
> +            rc = rangeset_add_range(s->range[i], 1, 1);

... add the only wanted range here and don't allow further additions.

> @@ -714,7 +945,7 @@ static void hvm_ioreq_server_disable(struct hvm_ioreq_server *s)
>  }
>  
>  static int hvm_ioreq_server_init(struct hvm_ioreq_server *s,
> -                                 struct domain *d, int bufioreq_handling,
> +                                 struct domain *d, int flags,

Can these flags have a negative value passed?

> @@ -1282,8 +1525,9 @@ struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
>      }
>      else
>      {
> -        type = (p->type == IOREQ_TYPE_PIO) ?
> -                XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> +        type = (p->type == IOREQ_TYPE_PIO) ? XEN_DMOP_IO_RANGE_PORT : 
> +            (p->type == IOREQ_TYPE_VMWARE_PORT) ? XEN_DMOP_IO_RANGE_VMWARE_PORT :
> +            XEN_DMOP_IO_RANGE_MEMORY;

Indentation.

> @@ -23,6 +24,32 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
>  {
>      struct cpu_user_regs *regs = guest_cpu_user_regs();
>  
> +#define port_overlap(p, n) \
> +    ((p + n > BDOOR_PORT) && (p + n <= BDOOR_PORT + 4) ? 1 : \
> +    (BDOOR_PORT + 4 > p) && (BDOOR_PORT + 4 <= p + n) ? 1 : 0)

It's only used in BUILD_BUG_ON(), but I still think this is far more
involved than it needs to be. The typical overlap check goes along
the lines of (start1 < end2 && start2 < end1), and there shouldn't
be any use of a conditional operator needed when all you want are
values of 0 and 1 (or true/false).

> +    BUILD_BUG_ON(port_overlap(PIT_BASE, 4));
> +    BUILD_BUG_ON(port_overlap(0x61, 1));
> +    BUILD_BUG_ON(port_overlap(XEN_HVM_DEBUGCONS_IOPORT, 1));
> +    BUILD_BUG_ON(port_overlap(0xcf8, 4));
> +/* #define TMR_VAL_ADDR_V0  (ACPI_PM_TMR_BLK_ADDRESS_V0) */
> +    BUILD_BUG_ON(port_overlap(ACPI_PM_TMR_BLK_ADDRESS_V0, 4));
> +/* #define PM1a_STS_ADDR_V0 (ACPI_PM1A_EVT_BLK_ADDRESS_V0) */
> +    BUILD_BUG_ON(port_overlap(ACPI_PM1A_EVT_BLK_ADDRESS_V0, 4));

What are these comments about?

> +    BUILD_BUG_ON(port_overlap(RTC_PORT(0), 2));
> +    BUILD_BUG_ON(port_overlap(0x3c4, 2));
> +    BUILD_BUG_ON(port_overlap(0x3ce, 2));
> +/*
> + * acpi_smi_cmd can not be checked at build time:
> + *   xen/include/asm-x86/acpi.h:extern u32 acpi_smi_cmd;
> + *   xen/arch/x86/acpi/boot.c: acpi_smi_cmd = fadt->smi_command;
> + BUILD_BUG_ON(port_overlap(acpi_smi_cmd, 1));

In this case I think the BUILD_BUG_ON() would still be better to
align with the others, even if commented out.

> +*/
> +    BUILD_BUG_ON(port_overlap(0x20, 2));
> +    BUILD_BUG_ON(port_overlap(0xa0, 2));
> +    BUILD_BUG_ON(port_overlap(0x4d0, 1));
> +    BUILD_BUG_ON(port_overlap(0x4d1, 1));

#undef port_overlap

> @@ -137,6 +164,15 @@ void vmport_register(struct domain *d)
>      register_portio_handler(d, BDOOR_PORT, 4, vmport_ioport);
>  }
>  
> +bool_t vmport_check_port(unsigned int port, unsigned int bytes)

bool

> +{
> +    struct domain *currd = current->domain;

const

> @@ -66,11 +69,25 @@ struct ioreq {
>  };
>  typedef struct ioreq ioreq_t;
>  
> +struct vmware_regs {
> +    uint32_t esi;
> +    uint32_t edi;
> +    uint32_t ebx;
> +    uint32_t ecx;
> +    uint32_t edx;
> +};
> +typedef struct vmware_regs vmware_regs_t;
> +
>  struct shared_iopage {
>      struct ioreq vcpu_ioreq[1];
>  };
>  typedef struct shared_iopage shared_iopage_t;
>  
> +struct shared_vmport_iopage {
> +    struct vmware_regs vcpu_vmport_regs[1];
> +};
> +typedef struct shared_vmport_iopage shared_vmport_iopage_t;

I wonder if this layout wouldn't better include some padding, so that
entries are a multiple of 16 bytes apart, to reduce cache line bouncing.

> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -94,8 +94,8 @@
>  #define HVM_PARAM_STORE_EVTCHN 2
>  
>  #define HVM_PARAM_IOREQ_PFN    5
> -
>  #define HVM_PARAM_BUFIOREQ_PFN 6
> +#define HVM_PARAM_VMPORT_REGS_PFN 7

Is it just lucky conincidence that 7 was unused, or are you risking
collision with some old piece of software? (But as said earlier, this
is likely to go away anyway.)

Jan

