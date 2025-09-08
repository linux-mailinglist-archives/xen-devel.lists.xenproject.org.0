Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12A1B48738
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 10:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114786.1461596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXIi-0008EG-Pi; Mon, 08 Sep 2025 08:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114786.1461596; Mon, 08 Sep 2025 08:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXIi-0008Bd-Mn; Mon, 08 Sep 2025 08:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1114786;
 Mon, 08 Sep 2025 08:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvXIg-0008BX-RS
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 08:32:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvXIf-00DBfz-1X;
 Mon, 08 Sep 2025 08:32:33 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvXIf-003Nfv-12;
 Mon, 08 Sep 2025 08:32:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=NBtc1R411wMyE9pDeaEoLzklekDODEKk+Z3S2fXg3yM=; b=6P1/hnnaxYl7Uqy21sr2sVw9a8
	LOAImOKjmoT6oswAK3+vy1VJ4SFdMEiLUQBP3sQKZs9wmvydps+3ioxsh1GxGQhFZ+PoY7Plqg5KL
	dOdpo1j3W0HSpj45ihgO3Xl+7ah4CmaYO9B2hfNv2/2N7KWO3PHGjcSvrP/GHk/oBDxI=;
From: dmukhin@xen.org
Date: Mon, 8 Sep 2025 01:32:32 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aL6UoCKLOTSKMG/B@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-4-dmukhin@ford.com>
 <CAGeoDV87whMh9G88NNYd9UYBBurgohFJHY6qiSArOFEW034x9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV87whMh9G88NNYd9UYBBurgohFJHY6qiSArOFEW034x9A@mail.gmail.com>

On Sat, Sep 06, 2025 at 11:37:28PM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> On Sat, Sep 6, 2025 at 2:27 AM <dmukhin@xen.org> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > The change is the first on the way on introducing minimally functional
> > NS16550-compatible UART emulator.
> >
> > Define UART state and a set of emulated registers.
> >
> > Implement alloc/free vUART hooks.
> >
> > Stub out I/O port handler.
> >
> > Add initialization of the NS16x50-compatible UART emulator state machine.
> >
> > Plumb debug logging.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v5:
> > - v5 feedback
> > - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-4-dmukhin@ford.com/
> > ---
> >  xen/arch/x86/hvm/hvm.c          |  21 ++
> >  xen/common/emul/vuart/Kconfig   |  19 ++
> >  xen/common/emul/vuart/Makefile  |   1 +
> >  xen/common/emul/vuart/ns16x50.c | 366 ++++++++++++++++++++++++++++++++
> >  4 files changed, 407 insertions(+)
> >  create mode 100644 xen/common/emul/vuart/ns16x50.c
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 23bd7f078a1d..91c971f11e14 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -28,6 +28,7 @@
> >  #include <xen/softirq.h>
> >  #include <xen/trace.h>
> >  #include <xen/vm_event.h>
> 
> I noticed that this include ...
> 
> > +#include <xen/vuart.h>
> 
> ... is out of alphabetical order. All other includes in this block
> are correctly sorted.

Thanks, will update.

> 
> >  #include <xen/vpci.h>
> >  #include <xen/wait.h>
> >  #include <xen/warning.h>
> > @@ -689,6 +690,22 @@ int hvm_domain_initialise(struct domain *d,
> >      if ( rc != 0 )
> >          goto fail1;
> >
> > +    /* Limit NS16550 emulator for dom0 only for now. */
> > +    if ( IS_ENABLED(CONFIG_VUART_NS16X50) && is_hardware_domain(d) )
> 
> Currently, the Xen glossary defines a "hardware domain" as:
> 
>     A domain, commonly dom0, which shares responsibility with Xen
>     about the system as a whole.
> 
> It has been historically correct to treat is_hardware_domain(d) as
> equivalent to dom0. However, according to patch series [1], this is
> no longer guaranteed:
> 
>     "Setting hardware domain as domid 0 is removed."
> 
> After these changes, the assumption that hardware domain always equals
> dom0 may not hold. As a result, the above comment in the code could
> become misleading. Consider updating it to something like:
> 
>     /* Limit NS16550 emulator to the hardware domain only for now */
> 
> to reflect the new semantics.

I adjusted the code a bit so that it is possible to test vUART for
either hwdom or domU; will remove the comment in v7.

> 
> > +    {
> > +        struct vuart_info info = {
> > +            .name       = "COM2",
> > +            .compatible = "ns16550",
> > +            .base_addr  = 0x2f8,
> > +            .size       = 8,
> > +            .irq        = 3,
> > +        };
> 
> Consider defining COM2 base address and IRQ in a shared header
> (e.g., VUART_COM2_BASE and VUART_COM2_IRQ) rather than using
> the magic numbers 0x2f8 and 3 here. This would allow reuse in
> `__start_xen` and other places, and makes the code clearer and
> easier to maintain.

PC platform resources are standard and not going to change, so
I think it is satisfactory to use hardcoded numbers here:
   COM1 - 0x3f8 / IRQ#4
   COM2 - 0x2f8 / IRQ#3
   COM3 - 0x3fe / IRQ#4
   COM4 - 0x2fe / IRQ#3

Other PC I/O ports still use hardcoded values, e.g. dom0_setup_permissions().

Anyway, this code will change again, once xl support is plumbed.
So, I would keep that as is for now...

[..]
> > +/*
> > + * Emulate 8-bit read access to ns16x50 register.
> > + */
> > +static int ns16x50_io_read8(
> > +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> > +{
> > +    uint8_t val = 0xff;
> 
> Instead of hardcoding 0xff here, consider using UINT8_MAX. This makes
> it clear that the value is the maximum for uint8_t and avoids magic
> numbers.
> 
> Similarly, in other places where constants for 16-bit or 32-bit
> unsigned integers are used, it would be good to replace them with
> UINT16_MAX and UINT32_MAX respectively for consistency and clarity.

Agreed, will do.
Thanks.

[..]
> > +/*
> > + * Emulate I/O access to ns16x50 register.
> > + * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
> > + */
> > +static int cf_check ns16x50_io_handle(
> > +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> > +{
> > +#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
> 
> Instead of defining the op(dir) macro, it might be cleaner to compute
> the direction character once at the beginning, e.g.:
> 
>     const char dir_char = (dir == IOREQ_WRITE) ? 'W' : 'R';
> 
> and then use dir_char in printk()/debug. This avoids the local macro
> and makes the code easier to follow.

Thanks for suggestion.
Will update.

> 
> > +    struct domain *d = rcu_lock_current_domain();
> > +    struct vuart *vuart = vuart_find_by_io_range(d, addr, size);
> > +    struct vuart_ns16x50 *vdev;
> > +    const struct domain *owner;
> > +    const struct vuart_info *info;
> > +    uint32_t reg;
> > +    unsigned dlab;
> > +    int rc;
> > +
> > +    if ( !vuart || !vuart->vdev )
> > +    {
> > +        printk(XENLOG_ERR "%c io 0x%04x %d: not initialized\n",
> > +               op(dir), addr, size);
> > +
> > +        ASSERT_UNREACHABLE();
> > +        goto out;
> > +    }
> > +    vdev = vuart->vdev;
> > +
> > +    owner = vuart->owner;
> > +    ASSERT(owner);
> > +    if ( d != owner )
> > +    {
> > +        ns16x50_err(vdev, "%c io 0x%04x %d: does not match current domain %pv\n",
> > +                    op(dir), addr, size, d);
> > +
> > +        ASSERT_UNREACHABLE();
> > +        goto out;
> > +    }
> > +
> > +    info = vuart->info;
> > +    ASSERT(info);
> > +    reg = addr - info->base_addr;
> > +    if ( !IS_ALIGNED(reg, size) )
> > +    {
> > +        ns16x50_err(vdev, "%c 0x%04x %d: unaligned access\n",
> > +                    op(dir), addr, size);
> > +        goto out;
> > +    }
> > +
> > +    dlab = ns16x50_dlab_get(vdev);
> > +    if ( reg >= NS16X50_REGS_NUM )
> > +    {
> > +        ns16x50_err(vdev, "%c io 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": not implemented\n",
> > +                    op(dir), addr, size, dlab, reg, *data);
> > +        goto out;
> > +    }
> > +
> > +    spin_lock(&vdev->lock);
> > +
> > +    if ( dir == IOREQ_WRITE )
> > +    {
> > +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> > +                      op(dir), addr, size, dlab, reg, *data);
> > +        rc = ns16x50_io_write(vdev, reg, size, data);
> 
> AFAICT ns16x50_io_read() and ns16x50_io_write() have identical
> signatures. Would it be cleaner to store them in an array of
> function pointers and call through that, e.g.:
> 
>     rc = ns16x50_io_op[dir == IOREQ_WRITE](vdev, reg, size, data);
> 
> This would avoid the if/else block here.

I remember I tried this way, but eventually decided to keep just direct calls
for simplicity.

> 
> > +    }
> > +    else
> > +    {
> > +        rc = ns16x50_io_read(vdev, reg, size, data);
> > +        ns16x50_debug(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
> > +                      op(dir), addr, size, dlab, reg, *data);
> 
> The ns16x50_debug() call is duplicated in both branches of the
> IOREQ_WRITE check, differing only in whether it's placed before or
> after the access. Would it make sense to move this debug print
> outside the condition, so the same code is used for both read and
> write paths (assuming the "data"  is not modified during a write)?

Yep, that will work, thanks!

> 
> > +    }
> > +    if ( rc < 0 )
> > +        ns16x50_err(vdev, "%c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": unsupported access\n",
> > +                    op(dir), addr, size, dlab, reg, *data);
> 
> The ns16x50_err() call doesn’t require holding vdev->lock, so it would
> be cleaner to move it after spin_unlock(). That way the critical section
> is shorter.

Ack.

> 
> > +
> > +    spin_unlock(&vdev->lock);
> > +
> > +out:
> > +    rcu_unlock_domain(d);
> > +
> > +    return X86EMUL_OKAY;
> > +#undef op
> > +}
> > +
> > +static int ns16x50_init(void *arg)
> > +{
> > +    struct vuart_ns16x50 *vdev = arg;
> > +    const struct vuart_info *info = vdev->info;
> > +    struct domain *d = vdev->owner;
> > +
> > +    ASSERT(vdev);
> > +
> > +    register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
> > +
> > +    return 0;
> > +}
> > +
> > +static void cf_check ns16x50_deinit(void *arg)
> > +{
> > +    struct vuart_ns16x50 *vdev = arg;
> > +
> > +    ASSERT(vdev);
> > +}
> > +
> > +static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
> > +{
> > +    struct vuart_ns16x50 *vdev;
> > +    int rc;
> > +
> > +    if ( !info )
> > +        return ERR_PTR(-EINVAL);
> > +
> > +    if ( vuart_find_by_io_range(d, info->base_addr, info->size) )
> > +    {
> > +        ns16x50_err(info, "already registered\n");
> > +        return ERR_PTR(-EBUSY);
> > +    }
> > +
> > +    if ( !is_hvm_domain(d) )
> 
> Currently, ns16x50_alloc() first calls vuart_find_by_io_range() and
> only afterwards checks if the domain is an HVM domain. Wouldn’t it
> be more logical to perform the HVM check first? If the console is
> only available for HVM domains, the extra check for an uninitialized
> vuart field seems unnecessary.

Ack.

> 
> > +    {
> > +        ns16x50_err(info, "not an HVM domain\n");
> > +        return ERR_PTR(-ENOSYS);
> > +    }
> > +
> > +    vdev = xvzalloc(typeof(*vdev));
> > +    if ( !vdev )
> > +    {
> > +        ns16x50_err(info, "failed to allocate memory\n");
> > +        return ERR_PTR(-ENOMEM);
> > +    }
> > +
> > +    spin_lock_init(&vdev->lock);
> > +    vdev->name = info->name;
> > +    vdev->owner = d;
> > +    vdev->info = info;
> > +
> > +    rc = ns16x50_init(vdev);
> > +    if ( rc )
> 
> If ns16x50_init(vdev) fails, vdev should be freed with xvfree() to
> avoid a memory leak.

Whoops, thanks.

> 
> Currently, ns16x50_init() always returns 0. If it is not planned to
> return other values in the future, it may be simpler to make the
> function return void, avoiding the need for the rc variable and
> conditional checks.

There will be non-zero return values in the future.

> 
> > +        return ERR_PTR(rc);
> > +
> > +    return vdev;
> > +}
> > +
> > +static void cf_check ns16x50_free(void *arg)
> > +{
> > +    if ( arg )
> > +        ns16x50_deinit(arg);
> > +
> > +    xvfree(arg);
> > +}
> > +
> > +#define ns16x50_emulator                \
> > +{                                       \
> > +    .compatible = "ns16550",            \
> > +    .alloc      = ns16x50_alloc,        \
> > +    .free       = ns16x50_free,         \
> > +    .dump_state = NULL,                 \
> 
> dump_state is set to NULL, but vuart_dump_state() in the previous
> commit does not check this pointer. If all commits up to this one
> are applied and domain state is dumped, this could result in a
> NULL pointer dereference and crash the hypervisor.

Thanks; will fix vuart.c

> 
> Consider adding a NULL check in vuart_dump_state() or initializing
> dump_state properly.
> 
> > +    .put_rx     = NULL,                 \
> > +}
> > +
> > +VUART_REGISTER(ns16x50, ns16x50_emulator);
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > --
> > 2.51.0
> >
> >
> 
> [1] https://patchew.org/Xen/20250416212911.410946-1-jason.andryuk@amd.com/
> 
> Best regards,
> Mykola

