Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9967A56928F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 21:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362487.592523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Abv-0005lf-Kl; Wed, 06 Jul 2022 19:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362487.592523; Wed, 06 Jul 2022 19:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Abv-0005iZ-HQ; Wed, 06 Jul 2022 19:22:55 +0000
Received: by outflank-mailman (input) for mailman id 362487;
 Wed, 06 Jul 2022 19:22:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gE00=XL=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1o9Abu-0005iT-3a
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 19:22:54 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 073fab99-fd61-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 21:22:52 +0200 (CEST)
Received: by mail-vs1-xe2d.google.com with SMTP id d187so16051659vsd.10
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 12:22:52 -0700 (PDT)
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
X-Inumbo-ID: 073fab99-fd61-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DQbLb5A6nnECqz9CwrVAxcb7ekECVDs2SKH8GTMd+X0=;
        b=ouVah9hX3Lr5fIsfQWXpJTmGvxs+Xxce5uAP8wEFcaSKzeHgsyO8GVZwGfNZNzACfC
         4c6OyxGeN4W8y5v4S/j9wWuA8Vyyo+0deEZ5R3HkPHgu5x2rqe2XD1vusJ+GyYjSiwPq
         xxGEOUD+8MMPDrgB3hT3RvSs5DqWYIovRNxOaQmt93UmpHl8WaUXTOVDwwcf/y3Y/UKC
         Ml7YGzWba3HrIIUqVOK26xx60cJUuu6fP/e+jtEhotIsoCMnT1DCX55RLgkLymuuU73r
         zYJisY8JAy7BZgmXYZNlBTP5R+QeWc8Gie8rXiqJsn8M4zrdDCwhhuW5qycR+pXemQp8
         auOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DQbLb5A6nnECqz9CwrVAxcb7ekECVDs2SKH8GTMd+X0=;
        b=yTAi3lptSEMJB1QGVX2ckCTCJz4z1zkDv0+x+ziPisDWyslyJDa5Mkpxn64FBJnZNZ
         zGdLRStFqSdyPIbkNC2mq4WsaKJkYVPBQeJPHSaeuys58AaNnLdfLHhDTFKKnXAI2vyr
         yLCTm9NLLsoT+rWrPzv8ykmWzHNRSf/TSEPq92mcRzHuAZwcNOitlEqrDti8jCgzQJzy
         Z9ndkVDTRxXATapvn6WxiEstnuQdAq+cm6e0U2LOoFWuk6lHPLMmsdksDETgtKQ052tG
         WSAsIKgSIVYiFgifkdfZ52FCGRhwi/z3FqE6OfXaIzIW5Rm8SfOLZgHExwSkhhyVXfS1
         oz1g==
X-Gm-Message-State: AJIora+31npwgxiWklj9ZBbhn6zJE0yGI77J/acmuIn/SCRa/IpuhA6c
	6cHJ8ZINSXyKercgLFuLNBUAsBeuJoNnTpSe2vU=
X-Google-Smtp-Source: AGRyM1tBSGBBnEMXlVbvqD3f5kUUGG/0JjsizctdAJQURdwvkvXgqR3ZWBOsBQHT454yivgO5Zvi/7j3pNKckfH3zxM=
X-Received: by 2002:a67:e1cc:0:b0:357:1ea6:3d6f with SMTP id
 p12-20020a67e1cc000000b003571ea63d6fmr1629469vsl.0.1657135370848; Wed, 06 Jul
 2022 12:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220324140139.5899-1-jgross@suse.com> <20220324140139.5899-3-jgross@suse.com>
 <5d7de637-3f7a-3e71-5dcf-cbeb1fa08b7b@suse.com>
In-Reply-To: <5d7de637-3f7a-3e71-5dcf-cbeb1fa08b7b@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 6 Jul 2022 12:22:40 -0700
Message-ID: <CACMJ4GaO8nKAXY4kK97OOZMTgc-wz4p94a-oBUkJJkcWrAGPgQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] xen: harmonize return types of hypercall handlers
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 11:24 PM Juergen Gross <jgross@suse.com> wrote:
>
> On 24.03.22 15:01, Juergen Gross wrote:
> > Today most hypercall handlers have a return type of long, while the
> > compat ones return an int. There are a few exceptions from that rule,
> > however.
> >
> > Get rid of the exceptions by letting compat handlers always return int
> > and others always return long, with the exception of the Arm specific
> > physdev_op handler.
> >
> > For the compat hvm case use eax instead of rax for the stored result as
> > it should have been from the beginning.
> >
> > Additionally move some prototypes to include/asm-x86/hypercall.h
> > as they are x86 specific. Move the compat_platform_op() prototype to
> > the common header.
> >
> > Rename paging_domctl_continuation() to do_paging_domctl_cont() and add
> > a matching define for the associated hypercall.
> >
> > Make do_callback_op() and compat_callback_op() more similar by adding
> > the const attribute to compat_callback_op()'s 2nd parameter.
> >
> > Change the type of the cmd parameter for [do|compat]_kexec_op() to
> > unsigned int, as this is more appropriate for the compat case.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Could I please have some feedback regarding the kexec and argo changes?

Thanks for the ping on this and apologies for the delay. The
Argo-related changes in this patch look ok, and I have built and
tested Argo functionality with this patch applied with PV 32 and 64
bit guests, using XTF -- with successful results for the patch -- but
I am behind on exercising it on a system that can run HVM guests,
sorry. Given the HVM-related change described in the description of
the patch, I think that such a test is needed and I am working on
getting a build and a system installed to get that done.

Christopher

>
>
> Juergen
>
> > ---
> > V2:
> > - rework platform_op compat handling (Jan Beulich)
> > V3:
> > - remove include of types.h (Jan Beulich)
> > V4:
> > - don't move do_physdev_op() (Julien Grall)
> > - carve out non style compliant parameter replacements (Julien Grall)
> > V6:
> > - remove rebase artifact (Jan Beulich)
> > ---
> >   xen/arch/x86/domctl.c                |  4 ++--
> >   xen/arch/x86/hvm/hypercall.c         |  8 ++-----
> >   xen/arch/x86/hypercall.c             |  2 +-
> >   xen/arch/x86/include/asm/hypercall.h | 31 ++++++++++++++--------------
> >   xen/arch/x86/include/asm/paging.h    |  3 ---
> >   xen/arch/x86/mm/paging.c             |  3 ++-
> >   xen/arch/x86/pv/callback.c           | 14 ++++++-------
> >   xen/arch/x86/pv/emul-priv-op.c       |  2 +-
> >   xen/arch/x86/pv/hypercall.c          |  5 +----
> >   xen/arch/x86/pv/iret.c               |  4 ++--
> >   xen/arch/x86/pv/misc-hypercalls.c    | 14 ++++++++-----
> >   xen/common/argo.c                    |  6 +++---
> >   xen/common/kexec.c                   |  6 +++---
> >   xen/include/xen/hypercall.h          | 20 ++++++++----------
> >   14 files changed, 58 insertions(+), 64 deletions(-)
> >
> > diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> > index e49f9e91b9..ea7d60ffb6 100644
> > --- a/xen/arch/x86/domctl.c
> > +++ b/xen/arch/x86/domctl.c
> > @@ -221,8 +221,8 @@ long arch_do_domctl(
> >       case XEN_DOMCTL_shadow_op:
> >           ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
> >           if ( ret == -ERESTART )
> > -            return hypercall_create_continuation(__HYPERVISOR_arch_1,
> > -                                                 "h", u_domctl);
> > +            return hypercall_create_continuation(
> > +                       __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
> >           copyback = true;
> >           break;
> >
> > diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> > index 62b5349e7d..3a35543997 100644
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -124,8 +124,6 @@ static long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >       [ __HYPERVISOR_ ## x ] = { (hypercall_fn_t *) do_ ## x,  \
> >                                  (hypercall_fn_t *) compat_ ## x }
> >
> > -#define do_arch_1             paging_domctl_continuation
> > -
> >   static const struct {
> >       hypercall_fn_t *native, *compat;
> >   } hvm_hypercall_table[] = {
> > @@ -158,11 +156,9 @@ static const struct {
> >   #ifdef CONFIG_HYPFS
> >       HYPERCALL(hypfs_op),
> >   #endif
> > -    HYPERCALL(arch_1)
> > +    HYPERCALL(paging_domctl_cont)
> >   };
> >
> > -#undef do_arch_1
> > -
> >   #undef HYPERCALL
> >   #undef HVM_CALL
> >   #undef COMPAT_CALL
> > @@ -300,7 +296,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
> >   #endif
> >
> >           curr->hcall_compat = true;
> > -        regs->rax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
> > +        regs->eax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
> >           curr->hcall_compat = false;
> >
> >   #ifndef NDEBUG
> > diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
> > index 2370d31d3f..07e1a45ef5 100644
> > --- a/xen/arch/x86/hypercall.c
> > +++ b/xen/arch/x86/hypercall.c
> > @@ -75,7 +75,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
> >       ARGS(dm_op, 3),
> >       ARGS(hypfs_op, 5),
> >       ARGS(mca, 1),
> > -    ARGS(arch_1, 1),
> > +    ARGS(paging_domctl_cont, 1),
> >   };
> >
> >   #undef COMP
> > diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
> > index d6daa7e4cb..49973820af 100644
> > --- a/xen/arch/x86/include/asm/hypercall.h
> > +++ b/xen/arch/x86/include/asm/hypercall.h
> > @@ -11,6 +11,8 @@
> >   #include <public/arch-x86/xen-mca.h> /* for do_mca */
> >   #include <asm/paging.h>
> >
> > +#define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
> > +
> >   typedef unsigned long hypercall_fn_t(
> >       unsigned long, unsigned long, unsigned long,
> >       unsigned long, unsigned long);
> > @@ -80,7 +82,7 @@ do_set_debugreg(
> >       int reg,
> >       unsigned long value);
> >
> > -extern unsigned long cf_check
> > +extern long cf_check
> >   do_get_debugreg(
> >       int reg);
> >
> > @@ -118,7 +120,7 @@ do_mmuext_op(
> >   extern long cf_check do_callback_op(
> >       int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
> >
> > -extern unsigned long cf_check
> > +extern long cf_check
> >   do_iret(
> >       void);
> >
> > @@ -133,17 +135,20 @@ do_set_segment_base(
> >       unsigned int which,
> >       unsigned long base);
> >
> > +long cf_check do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> > +
> > +long cf_check do_xenpmu_op(unsigned int op,
> > +                           XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
> > +
> > +long cf_check do_paging_domctl_cont(
> > +    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> > +
> >   #ifdef CONFIG_COMPAT
> >
> >   #include <compat/arch-x86/xen.h>
> >   #include <compat/physdev.h>
> >   #include <compat/platform.h>
> >
> > -extern int cf_check
> > -compat_physdev_op(
> > -    int cmd,
> > -    XEN_GUEST_HANDLE_PARAM(void) arg);
> > -
> >   extern int
> >   compat_common_vcpu_op(
> >       int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
> > @@ -154,12 +159,8 @@ extern int cf_check compat_mmuext_op(
> >       XEN_GUEST_HANDLE_PARAM(uint) pdone,
> >       unsigned int foreigndom);
> >
> > -DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
> > -extern int cf_check compat_platform_op(
> > -    XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
> > -
> > -extern long cf_check compat_callback_op(
> > -    int cmd, XEN_GUEST_HANDLE(void) arg);
> > +extern int cf_check compat_callback_op(
> > +    int cmd, XEN_GUEST_HANDLE(const_void) arg);
> >
> >   extern int cf_check compat_update_va_mapping(
> >       unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags);
> > @@ -177,12 +178,12 @@ extern int cf_check compat_set_gdt(
> >   extern int cf_check compat_update_descriptor(
> >       uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi);
> >
> > -extern unsigned int cf_check compat_iret(void);
> > +extern int cf_check compat_iret(void);
> >
> >   extern int cf_check compat_nmi_op(
> >       unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> >
> > -extern long cf_check compat_set_callbacks(
> > +extern int cf_check compat_set_callbacks(
> >       unsigned long event_selector, unsigned long event_address,
> >       unsigned long failsafe_selector, unsigned long failsafe_address);
> >
> > diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
> > index f0b4efc66e..54c440be65 100644
> > --- a/xen/arch/x86/include/asm/paging.h
> > +++ b/xen/arch/x86/include/asm/paging.h
> > @@ -234,9 +234,6 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> >                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl,
> >                     bool_t resuming);
> >
> > -/* Helper hypercall for dealing with continuations. */
> > -long cf_check paging_domctl_continuation(XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
> > -
> >   /* Call when destroying a vcpu/domain */
> >   void paging_vcpu_teardown(struct vcpu *v);
> >   int paging_teardown(struct domain *d);
> > diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> > index 1f0b94ad21..a7e2707ecc 100644
> > --- a/xen/arch/x86/mm/paging.c
> > +++ b/xen/arch/x86/mm/paging.c
> > @@ -21,6 +21,7 @@
> >
> >   #include <xen/init.h>
> >   #include <xen/guest_access.h>
> > +#include <xen/hypercall.h>
> >   #include <asm/paging.h>
> >   #include <asm/shadow.h>
> >   #include <asm/p2m.h>
> > @@ -759,7 +760,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> >           return shadow_domctl(d, sc, u_domctl);
> >   }
> >
> > -long cf_check paging_domctl_continuation(
> > +long cf_check do_paging_domctl_cont(
> >       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >   {
> >       struct xen_domctl op;
> > diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
> > index 55148c7f9e..1be9d3f731 100644
> > --- a/xen/arch/x86/pv/callback.c
> > +++ b/xen/arch/x86/pv/callback.c
> > @@ -207,9 +207,9 @@ long cf_check do_set_callbacks(
> >   #include <compat/callback.h>
> >   #include <compat/nmi.h>
> >
> > -static long compat_register_guest_callback(struct compat_callback_register *reg)
> > +static int compat_register_guest_callback(struct compat_callback_register *reg)
> >   {
> > -    long ret = 0;
> > +    int ret = 0;
> >       struct vcpu *curr = current;
> >
> >       fixup_guest_code_selector(curr->domain, reg->address.cs);
> > @@ -256,10 +256,10 @@ static long compat_register_guest_callback(struct compat_callback_register *reg)
> >       return ret;
> >   }
> >
> > -static long compat_unregister_guest_callback(
> > +static int compat_unregister_guest_callback(
> >       struct compat_callback_unregister *unreg)
> >   {
> > -    long ret;
> > +    int ret;
> >
> >       switch ( unreg->type )
> >       {
> > @@ -283,9 +283,9 @@ static long compat_unregister_guest_callback(
> >       return ret;
> >   }
> >
> > -long cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
> > +int cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(const_void) arg)
> >   {
> > -    long ret;
> > +    int ret;
> >
> >       switch ( cmd )
> >       {
> > @@ -321,7 +321,7 @@ long cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(void) arg)
> >       return ret;
> >   }
> >
> > -long cf_check compat_set_callbacks(
> > +int cf_check compat_set_callbacks(
> >       unsigned long event_selector, unsigned long event_address,
> >       unsigned long failsafe_selector, unsigned long failsafe_address)
> >   {
> > diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> > index 22b10dec2a..5da00e24e4 100644
> > --- a/xen/arch/x86/pv/emul-priv-op.c
> > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > @@ -22,13 +22,13 @@
> >   #include <xen/domain_page.h>
> >   #include <xen/event.h>
> >   #include <xen/guest_access.h>
> > +#include <xen/hypercall.h>
> >   #include <xen/iocap.h>
> >
> >   #include <asm/amd.h>
> >   #include <asm/debugreg.h>
> >   #include <asm/endbr.h>
> >   #include <asm/hpet.h>
> > -#include <asm/hypercall.h>
> >   #include <asm/mc146818rtc.h>
> >   #include <asm/pv/domain.h>
> >   #include <asm/pv/trace.h>
> > diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
> > index e8fbee7bbb..fe8dfe9e8f 100644
> > --- a/xen/arch/x86/pv/hypercall.c
> > +++ b/xen/arch/x86/pv/hypercall.c
> > @@ -47,8 +47,6 @@ typedef struct {
> >   #define COMPAT_CALL(x) HYPERCALL(x)
> >   #endif
> >
> > -#define do_arch_1             paging_domctl_continuation
> > -
> >   static const pv_hypercall_table_t pv_hypercall_table[] = {
> >       COMPAT_CALL(set_trap_table),
> >       HYPERCALL(mmu_update),
> > @@ -109,11 +107,10 @@ static const pv_hypercall_table_t pv_hypercall_table[] = {
> >   #endif
> >       HYPERCALL(mca),
> >   #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> > -    HYPERCALL(arch_1),
> > +    HYPERCALL(paging_domctl_cont),
> >   #endif
> >   };
> >
> > -#undef do_arch_1
> >   #undef COMPAT_CALL
> >   #undef HYPERCALL
> >
> > diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
> > index dd2965d8f0..55eb6a63bd 100644
> > --- a/xen/arch/x86/pv/iret.c
> > +++ b/xen/arch/x86/pv/iret.c
> > @@ -48,7 +48,7 @@ static void async_exception_cleanup(struct vcpu *curr)
> >           curr->arch.async_exception_state(trap).old_mask;
> >   }
> >
> > -unsigned long cf_check do_iret(void)
> > +long cf_check do_iret(void)
> >   {
> >       struct cpu_user_regs *regs = guest_cpu_user_regs();
> >       struct iret_context iret_saved;
> > @@ -105,7 +105,7 @@ unsigned long cf_check do_iret(void)
> >   }
> >
> >   #ifdef CONFIG_PV32
> > -unsigned int cf_check compat_iret(void)
> > +int cf_check compat_iret(void)
> >   {
> >       struct cpu_user_regs *regs = guest_cpu_user_regs();
> >       struct vcpu *v = current;
> > diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
> > index 5649aaab44..635f5a644a 100644
> > --- a/xen/arch/x86/pv/misc-hypercalls.c
> > +++ b/xen/arch/x86/pv/misc-hypercalls.c
> > @@ -28,12 +28,16 @@ long cf_check do_set_debugreg(int reg, unsigned long value)
> >       return set_debugreg(current, reg, value);
> >   }
> >
> > -unsigned long cf_check do_get_debugreg(int reg)
> > +long cf_check do_get_debugreg(int reg)
> >   {
> > -    unsigned long val;
> > -    int res = x86emul_read_dr(reg, &val, NULL);
> > -
> > -    return res == X86EMUL_OKAY ? val : -ENODEV;
> > +    /* Avoid implementation defined behavior casting unsigned long to long. */
> > +    union {
> > +        unsigned long val;
> > +        long ret;
> > +    } u;
> > +    int res = x86emul_read_dr(reg, &u.val, NULL);
> > +
> > +    return res == X86EMUL_OKAY ? u.ret : -ENODEV;
> >   }
> >
> >   long cf_check do_fpu_taskswitch(int set)
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 297f6d11f0..26a01c2188 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -2207,13 +2207,13 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> >   }
> >
> >   #ifdef CONFIG_COMPAT
> > -long cf_check
> > +int cf_check
> >   compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> >                  XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
> >                  unsigned long arg4)
> >   {
> >       struct domain *currd = current->domain;
> > -    long rc;
> > +    int rc;
> >       xen_argo_send_addr_t send_addr;
> >       xen_argo_iov_t iovs[XEN_ARGO_MAXIOV];
> >       compat_argo_iov_t compat_iovs[XEN_ARGO_MAXIOV];
> > @@ -2267,7 +2267,7 @@ compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> >
> >       rc = sendv(currd, &send_addr.src, &send_addr.dst, iovs, niov, arg4);
> >    out:
> > -    argo_dprintk("<-compat_argo_op(%u)=%ld\n", cmd, rc);
> > +    argo_dprintk("<-compat_argo_op(%u)=%d\n", cmd, rc);
> >
> >       return rc;
> >   }
> > diff --git a/xen/common/kexec.c b/xen/common/kexec.c
> > index a2ffb6530c..41669964d2 100644
> > --- a/xen/common/kexec.c
> > +++ b/xen/common/kexec.c
> > @@ -1213,7 +1213,7 @@ static int kexec_status(XEN_GUEST_HANDLE_PARAM(void) uarg)
> >       return !!test_bit(bit, &kexec_flags);
> >   }
> >
> > -static int do_kexec_op_internal(unsigned long op,
> > +static int do_kexec_op_internal(unsigned int op,
> >                                   XEN_GUEST_HANDLE_PARAM(void) uarg,
> >                                   bool_t compat)
> >   {
> > @@ -1265,13 +1265,13 @@ static int do_kexec_op_internal(unsigned long op,
> >       return ret;
> >   }
> >
> > -long cf_check do_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
> > +long cf_check do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
> >   {
> >       return do_kexec_op_internal(op, uarg, 0);
> >   }
> >
> >   #ifdef CONFIG_COMPAT
> > -int cf_check compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg)
> > +int cf_check compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
> >   {
> >       return do_kexec_op_internal(op, uarg, 1);
> >   }
> > diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> > index 81aae7a662..a032ba2b4a 100644
> > --- a/xen/include/xen/hypercall.h
> > +++ b/xen/include/xen/hypercall.h
> > @@ -114,11 +114,6 @@ common_vcpu_op(int cmd,
> >       struct vcpu *v,
> >       XEN_GUEST_HANDLE_PARAM(void) arg);
> >
> > -extern long cf_check
> > -do_nmi_op(
> > -    unsigned int cmd,
> > -    XEN_GUEST_HANDLE_PARAM(void) arg);
> > -
> >   extern long cf_check
> >   do_hvm_op(
> >       unsigned long op,
> > @@ -126,7 +121,7 @@ do_hvm_op(
> >
> >   extern long cf_check
> >   do_kexec_op(
> > -    unsigned long op,
> > +    unsigned int op,
> >       XEN_GUEST_HANDLE_PARAM(void) uarg);
> >
> >   extern long cf_check
> > @@ -145,9 +140,6 @@ extern long cf_check do_argo_op(
> >   extern long cf_check
> >   do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
> >
> > -extern long cf_check
> > -do_xenpmu_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
> > -
> >   extern long cf_check
> >   do_dm_op(
> >       domid_t domid,
> > @@ -205,15 +197,21 @@ extern int cf_check compat_xsm_op(
> >       XEN_GUEST_HANDLE_PARAM(void) op);
> >
> >   extern int cf_check compat_kexec_op(
> > -    unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
> > +    unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
> >
> >   DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
> >   extern int cf_check compat_multicall(
> >       XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
> >       uint32_t nr_calls);
> >
> > +int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> > +
> > +typedef struct compat_platform_op compat_platform_op_t;
> > +DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
> > +int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
> > +
> >   #ifdef CONFIG_ARGO
> > -extern long cf_check compat_argo_op(
> > +extern int cf_check compat_argo_op(
> >       unsigned int cmd,
> >       XEN_GUEST_HANDLE_PARAM(void) arg1,
> >       XEN_GUEST_HANDLE_PARAM(void) arg2,
>

