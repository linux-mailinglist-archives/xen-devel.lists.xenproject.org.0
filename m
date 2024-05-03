Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342298BAE1F
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716474.1118615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tN4-00054X-L3; Fri, 03 May 2024 13:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716474.1118615; Fri, 03 May 2024 13:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tN4-00052a-IY; Fri, 03 May 2024 13:54:42 +0000
Received: by outflank-mailman (input) for mailman id 716474;
 Fri, 03 May 2024 13:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aGk=MG=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2tN2-00051Z-Ph
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:54:40 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae41d7ed-0954-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 15:54:38 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5acb737b508so3947247eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 06:54:38 -0700 (PDT)
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
X-Inumbo-ID: ae41d7ed-0954-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714744477; x=1715349277; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76gaEj8j93eOO7a7Mnb1OIG9aYIF5RI94rklGIt0fBU=;
        b=CMZV6v/i/OXGzJAB2pa296aOdOOnYTrBDfiyv9ZTJZWwBCaix74tyEYYf+Dy4hxiJL
         P8WbSs6n8Yom1CbDGN9D6FiRymP+W2WX2cTLoBIHIDzxGYs1Vv2gSIVXhFUEdYKXeTb1
         KOjfgJMCvGFlEh4eqPj5eIHXoMdQVW/S2lbcM744eVFE6+bQouMHqw370SB8SBzafr7D
         Axz1QQrI8XOuISi00uN9QvateYZ5EHcKspzxGkqTYFW0Q7AR+njSIKT/H1dfo43s58xA
         BMkBD34/+UCXIxjl1lmJ/PWHIsB4qocyu1qQkwLpqyrRNJ7vwwNSlP8V3XxeG5PbfKxB
         sk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744477; x=1715349277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76gaEj8j93eOO7a7Mnb1OIG9aYIF5RI94rklGIt0fBU=;
        b=vEqTxo7ol+4hSM1jvXs7FcfIw1DYgilJWBjtS71BMNEHhnNbS2dfDqMAlMB86Gltx4
         3pkFQggkSWOWHMG/1GGzF6Uxmfm1A6hnFWt/8eFzsZV2ji8lFhzOzUAJ/T77zjrrYy91
         2GxsqleX2TAqdRHVUxsvnfhtOjNHDJ3FTKMJ92gHiwre4pJcgKbdgmq8OeI3UkYBPGZu
         otnlK21DVOZeHatdrarWaYNWdhE3nUHt77gEIkQB22A9YlAlyCODZbZxoT/CFL7gt0HY
         0pe7/jZ+tQbocaAdaN8+j4KwIUYxr6fnxyseIMxnTzyxT5x55HDDnq660/OoQZEvqGeO
         3RTA==
X-Gm-Message-State: AOJu0Yx53sXcIREu7imkJwORc5hvm3RjcJqO7cPTt3kCQ+bMxA74NO6N
	QM0j68b9vj0y1qgGQuvMVu/IRwksliAk5pyxSjERAMBHOKFtjZ8WvBEz93ydjv3PVOGiK15mymu
	CmiHBj4GSLUjiC0Mn290AJEMNciOBKvNY6nEJOQ==
X-Google-Smtp-Source: AGHT+IGzMllgkhGbaihZspMy4AJHOCme0u1LbVbCDf4J7Y30fu/sxNZ4J4VRPNhc7SnUJTsqdbhq1Jy7BuHEszUSQCg=
X-Received: by 2002:a4a:4804:0:b0:5a7:c78e:410e with SMTP id
 p4-20020a4a4804000000b005a7c78e410emr2868046ooa.2.1714744477124; Fri, 03 May
 2024 06:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
 <20240502145645.1201613-6-jens.wiklander@linaro.org> <935e3947-53ee-48c5-a10c-5fa7f572ae65@xen.org>
In-Reply-To: <935e3947-53ee-48c5-a10c-5fa7f572ae65@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 May 2024 15:54:25 +0200
Message-ID: <CAHUa44HdA_cdZcjbVL+xYXnLVkdK1hK5hfU_k+fZkS8=VAOy1A@mail.gmail.com>
Subject: Re: [XEN PATCH v4 5/5] xen/arm: ffa: support notification
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, May 3, 2024 at 11:59=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Jens,
>
> On 02/05/2024 15:56, Jens Wiklander wrote:
> > -static bool ffa_probe(void)
> > +static int __init ffa_init(void)
> >   {
> >       uint32_t vers;
> >       unsigned int major_vers;
> > @@ -460,16 +511,16 @@ static bool ffa_probe(void)
> >           printk(XENLOG_ERR
> >                  "ffa: unsupported SMCCC version %#x (need at least %#x=
)\n",
> >                  smccc_ver, ARM_SMCCC_VERSION_1_2);
> > -        return false;
> > +        return 0;
> >       }
> >
> >       if ( !ffa_get_version(&vers) )
> > -        return false;
> > +        return 0;
> >
> >       if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> >       {
> >           printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", ve=
rs);
> > -        return false;
> > +        return 0;
> >       }
> >
> >       major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MA=
JOR_MASK;
> > @@ -492,26 +543,33 @@ static bool ffa_probe(void)
> >            !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> >            !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> >            !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > -        return false;
> > +        return 0;
> >
> >       if ( !ffa_rxtx_init() )
> > -        return false;
> > +        return 0;
> >
> >       ffa_version =3D vers;
> >
> >       if ( !ffa_partinfo_init() )
> >           goto err_rxtx_destroy;
> >
> > +    ffa_notif_init();
> >       INIT_LIST_HEAD(&ffa_teardown_head);
> >       init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL=
, 0);
> >
> > -    return true;
> > +    return 0;
> >
> >   err_rxtx_destroy:
> >       ffa_rxtx_destroy();
> >       ffa_version =3D 0;
> >
> > -    return false;
> > +    return 0;
> > +}
> > +presmp_initcall(ffa_init);
> I would rather prefer if tee_init() is called from presmp_initcall().
> This would avoid FFA to have to try to initialize itself before all the
> others.

OK, I'll update.

>
> This is what I had in mind with my original request, but I guess I
> wasn't clear enough. Sorry for that.

No worries.

>
> [...]
>
> > +static void notif_irq_handler(int irq, void *data)
> > +{
> > +    const struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +    unsigned int id_pos;
> > +    unsigned int list_count;
> > +    uint64_t ids_count;
> > +    unsigned int n;
> > +    int32_t res;
> > +
> > +    do {
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +        res =3D ffa_get_ret_code(&resp);
> > +        if ( res )
> > +        {
> > +            if ( res !=3D FFA_RET_NO_DATA )
> > +                printk(XENLOG_ERR "ffa: notification info get failed: =
error %d\n",
> > +                       res);
> > +            return;
> > +        }
> > +
> > +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> > +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT =
) &
> > +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> > +
> > +        id_pos =3D 0;
> > +        for ( n =3D 0; n < list_count; n++ )
> > +        {
> > +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> > +            uint16_t vm_id =3D get_id_from_resp(&resp, id_pos);
> > +            struct domain *d;
> > +
> > +            /*
> > +             * vm_id =3D=3D 0 means a notifications pending for Xen it=
self, but
> > +             * we don't support that yet.
> > +             */
> > +            if (vm_id)
> > +                d =3D ffa_rcu_lock_domain_by_vm_id(vm_id);
>
> I am still unconvinced that this is sufficient. This will prevent
> "struct domain *" to be freed. But ...
>
> > +            else
> > +                d =3D NULL;
> > +
> > +            if ( d )
> > +            {
> > +                struct ffa_ctx *ctx =3D d->arch.tee;
>
> ... I don't think it will protect d->arch.tee to be freed as this is
> happening during teardorwn. You mostly need some other sort of locking
> to avoid d->arch.tee been freed behind your back.

OK, I'll need to work more on this. The outcome of the [1] thread may
affect this too.

[1] https://lists.xenproject.org/archives/html/xen-devel/2024-05/msg00156.h=
tml

>
> > +                struct vcpu *v;
> > +
> > +                ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> > +
> > +                /*
> > +                 * Since we're only delivering global notification, al=
ways
> > +                 * deliver to the first online vCPU. It doesn't matter
> > +                 * which we chose, as long as it's available.
> > +                 */
> > +                for_each_vcpu(d, v)
> > +                {
> > +                    if ( is_vcpu_online(v) )
> > +                    {
> > +                        vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INT=
R_ID,
> > +                                        true);
> > +                        break;
> > +                    }
> > +                }
> > +                if ( !v )
> > +                    printk(XENLOG_ERR "ffa: can't inject NPI, all vCPU=
s offline\n");
> > +
> > +                rcu_unlock_domain(d);
> > +            }
> > +
> > +            id_pos +=3D count;
> > +        }
> > +
> > +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> > +}
>
> [...]
>
> > +static int ffa_setup_irq_callback(struct notifier_block *nfb,
> > +                                  unsigned long action, void *hcpu)
> > +{
> > +    unsigned int cpu =3D (unsigned long)hcpu;
> > +    struct notif_irq_info irq_info =3D { };
> > +
> > +    switch ( action )
> > +    {
> > +    case CPU_ONLINE:
>
> Can't you execute the notifier in CPU_STARTING? This will be called on
> the CPU directly, so you should be able to use request_irq(...).

I tried that first but it failed with the ASSERT_ALLOC_CONTEXT() in _xmallo=
c().

I've also tested a three-step solution with CPU_UP_PREPARE,
CPU_STARTING, and CPU_UP_CANCELED.
My approach here is more direct, but it still suffers from a weakness
in error handling even if it seems quite unlikely to run out of heap
or for setup_irq() to fail at this stage.

Thanks,
Jens

>
> > +        /*
> > +         * The notifier call is done on the primary or initiating CPU =
when
> > +         * the target CPU have come online, but the SGI must be setup =
on
> > +         * the target CPU.
> > +         *
> > +         * We make an IPI call to the target CPU to setup the SGI. The=
 call
> > +         * is executed in interrupt context on the target CPU, so we c=
an't
> > +         * call request_irq() directly since it allocates memory.
> > +         *
> > +         * We preallocate the needed irqaction here and pass it via th=
e
> > +         * temporary struct notif_irq_info. The call is synchronous in=
 the
> > +         * sense that when on_selected_cpus() returns the callback
> > +         * notif_irq_enable() has done the same on the target CPU.
> > +         *
> > +         * We deal with two errors, one where notif_irq_enable() hasn'=
t
> > +         * been called for some reason, that error is logged below. Th=
e
> > +         * other where setup_irq() fails is logged in the callback. We=
 must
> > +         * free the irqaction in both cases since it has failed to bec=
ome
> > +         * registered.
> > +         *
> > +         * Failures leads to a problem notifications, the CPUs with fa=
ilure
> > +         * will trigger on the SGI indicating that there are notificat=
ions
> > +         * pending, while the SPMC in the secure world will not notice=
 that
> > +         * the interrupt was lost.
> > +         */
> > +        irq_info.action =3D xmalloc(struct irqaction);
> > +        if ( !irq_info.action )
> > +        {
> > +            printk(XENLOG_ERR "ffa: setup irq %u failed, out of memory=
\n",
> > +                   notif_sri_irq);
> > +            return -ENOMEM;
> > +        }
> > +
> > +        *irq_info.action =3D (struct irqaction){
> > +            .handler =3D notif_irq_handler,
> > +            .name =3D "FF-A notif",
> > +            .free_on_release =3D 1,
> > +        };
> > +
> > +        on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info,=
 1);
> > +        if (!irq_info.called)
> > +            printk(XENLOG_ERR "ffa: on_selected_cpus(cpumask_of(%u)) f=
ailed\n",
> > +                   cpu);
> > +        /*
> > +         * The irqaction is unused and must be freed if irq_info.actio=
n is
> > +         * non-NULL at this stage.
> > +         */
> > +        XFREE(irq_info.action);
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return 0;
> > +}
>
> Cheers,
>
> --
> Julien Grall

