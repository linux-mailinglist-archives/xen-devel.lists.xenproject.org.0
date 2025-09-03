Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F89B41BC8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 12:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108098.1458240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkgN-0003kZ-JF; Wed, 03 Sep 2025 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108098.1458240; Wed, 03 Sep 2025 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkgN-0003hz-Fv; Wed, 03 Sep 2025 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1108098;
 Wed, 03 Sep 2025 10:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIR0=3O=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utkgM-0003hX-Jj
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:25:38 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54840e9f-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:25:36 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f6f7edf45so4063953e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 03:25:36 -0700 (PDT)
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
X-Inumbo-ID: 54840e9f-88b0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756895135; x=1757499935; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZdUt7mgVvqTFTx9fuTQu6EjZ2GCzZ1RjGv44Z5ZUFg=;
        b=iNkm6EOzbTWDN7ZMkDzlIeuFUWTXmWY+JWPB/7eKPWO/oJ8wb8faYS00LDSNgXU6pD
         V4cYUh7yDqDJW9lD72NMmWHoJ4MaTBD9tg0UimbEQIfJ/FIKZN8ZJaWLVNUAqmQSRF+w
         QrAGlFJu8OG/U0GkbtlfGyxXcVPnY8EDECi6se1VHV9p4hrPi/oLn9qjXIAExmYduwdK
         a57I4Ztm61Qd5ZD/xbMJQwEzweGrIIAHIwqFNrJj5H1xag4K5EjHA1AhDXOZgpjDx5ye
         eYhAz3MV6cQm0Xh50+hLS5FfGfeF0UbveVsoqm0yGH7FmZlJO2+y4mTwFoCo27VV6yWp
         ZSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895135; x=1757499935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZdUt7mgVvqTFTx9fuTQu6EjZ2GCzZ1RjGv44Z5ZUFg=;
        b=jLp5BVyRqQnq7/bs/HHgGDSrgD6RGFyDbZhtXOENpmowJ7psIWxoGowPBeaz5mdy5X
         8yplNDJTkw8tcJ3/iE1yQ8KlbJINjAH89nVgH89xUScc1T3fYleTdoR+n48tJp48J1f3
         9JAxR0LJwJeZC25NdX/6EybhxhrPXw7s9+ayFd8Mk4FdcE8r/JK68OD1s4jD2LnJ0COq
         WYofuOlRAch29+Cv+8p+uyfQo4JOEGWJEq//LHLNmNIy9UWG4Rk5Ta+60+nyrhTXJUlF
         d/lcl0M0oAG3mpC6X0UAr8VZDIDfMWp76eNP0ivGG6okPsR6uujvdyANb2mRser8ILWN
         9Liw==
X-Gm-Message-State: AOJu0Yxdc9aSVscuLMyKdUEYaV30P+OEjKVHtdK5z3X0//NYWsAzZ4Xf
	kezdgsSqOL5qYVXkEHEsZVIeF9XkZNfMPjYmfrbZAGwZDRx69Jdl73uhTpQigrNgxo7S3pjVmch
	OldSEdniYVpt9eMs7FZqpPOnw/SCVhzQ=
X-Gm-Gg: ASbGnctaJqGeVgIsTLaLoh2+SbyVg1OABdPhd4BX5txupwCtx486S3s4TIZU2dD24cx
	6yqYEUVVt1vhTzE+WKg0adrVtEibDk09koI65QWmBRFe5t544emBJ/nfPut1GIqZfSqNmKjeSQJ
	gFbYw5XQ0cbScC9xN2naDCRIdjgbs49+mGJbxIMDGh+V3bVWEw0skhdLH36bCL+D9PIfZB8gMhU
	nQS68S+/BobeTb3
X-Google-Smtp-Source: AGHT+IH6cW6pSrxaZ/6Xw6SrcENlGX34AWn45iYKTsIPoQ9VE3kvhmL28nCZnXc6ZEteqDvSHPNiqU53o01cYWRr6+4=
X-Received: by 2002:a05:6512:3b9e:b0:55f:4a95:675 with SMTP id
 2adb3069b0e04-55f708f168emr4950011e87.31.1756895133710; Wed, 03 Sep 2025
 03:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <3a05d0f188943173703690981a7590fd12fabd4c.1756763487.git.mykola_kvach@epam.com>
 <41cddeee-6cc2-4426-9020-2f1000983845@epam.com>
In-Reply-To: <41cddeee-6cc2-4426-9020-2f1000983845@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Sep 2025 13:25:22 +0300
X-Gm-Features: Ac12FXx9G5KlJeCAtsoIfvjd73bBXFRNo58KD309ae0vpKzQLNA7UQdiYCoLppQ
Message-ID: <CAGeoDV_qgq6HWma_QDoxGdk+3=J1QYfUE6tCRAr7361mNqjpGQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On Wed, Sep 3, 2025 at 1:01=E2=80=AFPM Oleksandr Tyshchenko
<Oleksandr_Tyshchenko@epam.com> wrote:
>
>
>
> On 02.09.25 01:10, Mykola Kvach wrote:
>
> Hello Mykola
>
>
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > Store and restore active context and micro-TLB registers.
> >
> > Tested on R-Car H3 Starter Kit.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V6:
> > - refactor code related to hw_register struct, from now it's called
> >    ipmmu_reg_ctx
>
> The updated version looks good, thanks. However, I have one
> concern/request ...
>
> > ---
> >   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 ++++++++++++++++++++++=
+
> >   1 file changed, 257 insertions(+)
> >
> > diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/pas=
sthrough/arm/ipmmu-vmsa.c
> > index ea9fa9ddf3..0973559861 100644
> > --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > @@ -71,6 +71,8 @@
> >   })
> >   #endif
> >
> > +#define dev_dbg(dev, fmt, ...)    \
> > +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> >   #define dev_info(dev, fmt, ...)    \
> >       dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> >   #define dev_warn(dev, fmt, ...)    \
> > @@ -130,6 +132,24 @@ struct ipmmu_features {
> >       unsigned int imuctr_ttsel_mask;
> >   };
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +struct ipmmu_reg_ctx {
> > +    unsigned int imttlbr0;
> > +    unsigned int imttubr0;
> > +    unsigned int imttbcr;
> > +    unsigned int imctr;
> > +};
> > +
> > +struct ipmmu_vmsa_backup {
> > +    struct device *dev;
> > +    unsigned int *utlbs_val;
> > +    unsigned int *asids_val;
> > +    struct list_head list;
> > +};
> > +
> > +#endif
> > +
> >   /* Root/Cache IPMMU device's information */
> >   struct ipmmu_vmsa_device {
> >       struct device *dev;
> > @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
> >       struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> >       unsigned int utlb_refcount[IPMMU_UTLB_MAX];
> >       const struct ipmmu_features *features;
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> > +#endif
> >   };
> >
> >   /*
> > @@ -547,6 +570,222 @@ static void ipmmu_domain_free_context(struct ipmm=
u_vmsa_device *mmu,
> >       spin_unlock_irqrestore(&mmu->lock, flags);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> > +static LIST_HEAD(ipmmu_devices_backup);
> > +
> > +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> > +
> > +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> > +                                   unsigned int utlb)
> > +{
> > +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> > +}
> > +
> > +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> > +{
> > +    struct ipmmu_vmsa_backup *backup_data;
> > +
> > +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> > +
> > +    spin_lock(&ipmmu_devices_backup_lock);
> > +
> > +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> > +    {
> > +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_da=
ta->dev);
> > +        unsigned int i;
> > +
> > +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> > +            continue;
> > +
> > +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> > +        {
> > +            unsigned int utlb =3D fwspec->ids[i];
> > +
> > +            backup_data->asids_val[i] =3D ipmmu_imuasid_read(mmu, utlb=
);
> > +            backup_data->utlbs_val[i] =3D ipmmu_imuctr_read(mmu, utlb)=
;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&ipmmu_devices_backup_lock);
> > +}
> > +
> > +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> > +{
> > +    struct ipmmu_vmsa_backup *backup_data;
> > +
> > +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> > +
> > +    spin_lock(&ipmmu_devices_backup_lock);
> > +
> > +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> > +    {
> > +        struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(backup_da=
ta->dev);
> > +        unsigned int i;
> > +
> > +        if ( to_ipmmu(backup_data->dev) !=3D mmu )
> > +            continue;
> > +
> > +        for ( i =3D 0; i < fwspec->num_ids; i++ )
> > +        {
> > +            unsigned int utlb =3D fwspec->ids[i];
> > +
> > +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> > +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> > +        }
> > +    }
> > +
> > +    spin_unlock(&ipmmu_devices_backup_lock);
> > +}
> > +
> > +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *doma=
in)
> > +{
> > +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> > +    struct ipmmu_reg_ctx *regs =3D mmu->reg_backup[domain->context_id]=
;
> > +
> > +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->con=
text_id);
> > +
> > +    regs->imttlbr0 =3D ipmmu_ctx_read_root(domain, IMTTLBR0);
> > +    regs->imttubr0 =3D ipmmu_ctx_read_root(domain, IMTTUBR0);
> > +    regs->imttbcr  =3D ipmmu_ctx_read_root(domain, IMTTBCR);
> > +    regs->imctr    =3D ipmmu_ctx_read_root(domain, IMCTR);
> > +}
> > +
> > +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *dom=
ain)
> > +{
> > +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> > +    struct ipmmu_reg_ctx *regs  =3D mmu->reg_backup[domain->context_id=
];
> > +
> > +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->co=
ntext_id);
> > +
> > +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> > +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> > +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> > +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> > +}
> > +
> > +/*
> > + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> > + * for handling all IPMMUs. There is no framework for ipmmu_suspend/re=
sume
> > + * callbacks to be invoked for each IPMMU device. So, we need to itera=
te
> > + * through all registered IPMMUs performing required actions.
> > + *
> > + * Also take care of restoring special settings, such as translation
> > + * table format, etc.
> > + */
> > +static int __must_check ipmmu_suspend(void)
> > +{
> > +    struct ipmmu_vmsa_device *mmu;
> > +
> > +    if ( !iommu_enabled )
> > +        return 0;
> > +
> > +    printk(XENLOG_DEBUG "ipmmu: Suspending ...\n");
> > +
> > +    spin_lock(&ipmmu_devices_lock);
> > +
> > +    list_for_each_entry( mmu, &ipmmu_devices, list )
> > +    {
> > +        if ( ipmmu_is_root(mmu) )
> > +        {
> > +            unsigned int i;
> > +
> > +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> > +            {
> > +                if ( !mmu->domains[i] )
> > +                    continue;
> > +                ipmmu_domain_backup_context(mmu->domains[i]);
> > +            }
> > +        }
> > +        else
> > +            ipmmu_utlbs_backup(mmu);
> > +    }
> > +
> > +    spin_unlock(&ipmmu_devices_lock);
> > +
> > +    return 0;
> > +}
> > +
> > +static void ipmmu_resume(void)
> > +{
> > +    struct ipmmu_vmsa_device *mmu;
> > +
> > +    if ( !iommu_enabled )
> > +        return;
> > +
> > +    printk(XENLOG_DEBUG "ipmmu: Resuming ...\n");
> > +
> > +    spin_lock(&ipmmu_devices_lock);
> > +
> > +    list_for_each_entry( mmu, &ipmmu_devices, list )
> > +    {
> > +        uint32_t reg;
> > +
> > +        /* Do not use security group function */
> > +        reg =3D IMSCTLR + mmu->features->control_offset_base;
> > +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECG=
RP);
> > +
> > +        if ( ipmmu_is_root(mmu) )
> > +        {
> > +            unsigned int i;
> > +
> > +            /* Use stage 2 translation table format */
> > +            reg =3D IMSAUXCTLR + mmu->features->control_offset_base;
> > +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2=
PTE);
> > +
> > +            for ( i =3D 0; i < mmu->num_ctx; i++ )
> > +            {
> > +                if ( !mmu->domains[i] )
> > +                    continue;
> > +                ipmmu_domain_restore_context(mmu->domains[i]);
> > +            }
> > +        }
> > +        else
> > +            ipmmu_utlbs_restore(mmu);
> > +    }
> > +
> > +    spin_unlock(&ipmmu_devices_lock);
> > +}
> > +
> > +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> > +{
> > +    struct ipmmu_vmsa_backup *backup_data;
> > +    unsigned int *utlbs_val, *asids_val;
> > +    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> > +
> > +    utlbs_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> > +    if ( !utlbs_val )
> > +        return -ENOMEM;
> > +
> > +    asids_val =3D xzalloc_array(unsigned int, fwspec->num_ids);
> > +    if ( !asids_val )
> > +    {
> > +        xfree(utlbs_val);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    backup_data =3D xzalloc(struct ipmmu_vmsa_backup);
> > +    if ( !backup_data )
> > +    {
> > +        xfree(utlbs_val);
> > +        xfree(asids_val);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    backup_data->dev =3D dev;
> > +    backup_data->utlbs_val =3D utlbs_val;
> > +    backup_data->asids_val =3D asids_val;
> > +
> > +    spin_lock(&ipmmu_devices_backup_lock);
> > +    list_add(&backup_data->list, &ipmmu_devices_backup);
> > +    spin_unlock(&ipmmu_devices_backup_lock);
> > +
> > +    return 0;
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain=
)
> >   {
> >       uint64_t ttbr;
> > @@ -559,6 +798,9 @@ static int ipmmu_domain_init_context(struct ipmmu_v=
msa_domain *domain)
> >           return ret;
> >
> >       domain->context_id =3D ret;
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    domain->mmu->root->reg_backup[ret] =3D &root_pgtable[ret];
> > +#endif
> >
> >       /*
> >        * TTBR0
> > @@ -615,6 +857,9 @@ static void ipmmu_domain_destroy_context(struct ipm=
mu_vmsa_domain *domain)
> >       ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
> >       ipmmu_tlb_sync(domain);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> > +#endif
> >       ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
> >   }
> >
> > @@ -1427,6 +1672,14 @@ static int ipmmu_add_device(u8 devfn, struct dev=
ice *dev)
> >       }
> >   #endif
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( ipmmu_alloc_ctx_suspend(dev) )
> > +    {
> > +        dev_err(dev, "Failed to allocate context for suspend\n");
> > +        return -ENOMEM;
> > +    }
> > +#endif
>
> ... The initial version was based on the driver code without PCI
> support, but it is now present. There is PCI-specific code above in this
> function (not visible in the context) that performs some initialization,
> allocation and device assignment. What I mean is that in case of the
> suspend context allocation error here, we will need to undo these
> actions (i.e. deassign device). I would move this context allocation
> (whose probability to fail is much lower than what is done for PCI dev)
> above the PCI-specific stuff, and perform the context freeing on the
> error path.

Maybe it would be better just to add some checks to the suspend handler.
We could skip suspend in case the context is not available, and avoid
deallocating previously allocated stuff. This is similar to what is
done for GICs.

What do you think? Or do you prefer to destroy everything related to the
IOMMU here on error?

>
> > +
> >       dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
> >                dev_name(fwspec->iommu_dev), fwspec->num_ids);
> >
> > @@ -1492,6 +1745,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
=3D
> >       .unmap_page      =3D arm_iommu_unmap_page,
> >       .dt_xlate        =3D ipmmu_dt_xlate,
> >       .add_device      =3D ipmmu_add_device,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend         =3D ipmmu_suspend,
> > +    .resume          =3D ipmmu_resume,
> > +#endif
> >   };
> >
> >   static __init int ipmmu_init(struct dt_device_node *node, const void =
*data)

Best regards,
Mykola

