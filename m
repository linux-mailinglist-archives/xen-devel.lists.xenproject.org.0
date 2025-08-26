Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB6B365E3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094491.1449798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu58-0004CO-SQ; Tue, 26 Aug 2025 13:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094491.1449798; Tue, 26 Aug 2025 13:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu58-00049c-Oe; Tue, 26 Aug 2025 13:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1094491;
 Tue, 26 Aug 2025 13:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwi-0007MD-8H
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:44 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8acf5dd6-8282-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:42:43 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55f4cf36c00so1095073e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:43 -0700 (PDT)
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
X-Inumbo-ID: 8acf5dd6-8282-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215763; x=1756820563; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDszcKlB1VrGnElLTrFUBb/kLsyskQGsR6/f+F1Ka7Q=;
        b=WOjmc133QbNIw+poHyzzUbC5vyO1JQ3xE2GkcnzVzX7+K09CHsuvz2/GfbQCilGSqL
         LREa4xWIOGV7NwV1zkQCo/JWEhjzm9yzZvraG+cskhoyQMl3L0hDnuKl8a+ypa7AU7mP
         9njUB/+W9Hy9qdVJWwy6vXPfQxD6xK2Wmg50jrUVe6D4acLnMPXTat0ReuCBb7Z1dp6m
         DEexiJSzHwu4DOFF+pbx6eRqm46G5KC6RXEC8e4ayftJwN9WmeDtgvrMUcyNFNAAdnZs
         to+jSp1ScXVHX8qDZLYr6BRBJzAAL+NadXbSYaibODO+c9cQvVZMxUa6eTAL92nwEe7V
         rRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215763; x=1756820563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDszcKlB1VrGnElLTrFUBb/kLsyskQGsR6/f+F1Ka7Q=;
        b=GEvShAMe6bSEqWevffKr6UBY46A5br9dzVFevoh+2cVAZDMKQHEswQj1ShoOWCKvbr
         esHTwB25ZJTBpAMfNBA59HE3Jo+3PufZD0yiJd2mNnlGwqAtXCrk/i11x/jgp5iunadd
         yoyNzzGGVc+YooiD+SdY3QHqUp3Na3p/ZRspkvpbefeRLCVL7YKs3N6T8Nid9VgA8CKU
         +s6XB1CaqEmYIwyz2QNDjBRv5tXzdaDXI77N0LDkOTCF6agGvEmx48akJM26eT2d3iaM
         mw19kPm7BH0oZ/w1ql0h7fkINWQR5JfR+jGwkKZHiNpqu6xeJXlmpeS2zDCVsJd/Bg7Q
         SuEA==
X-Gm-Message-State: AOJu0YzlaWsRz1PEiJoLoD8XNGW49fvolVrBq7Z+5HvnazBm6kcuXL8C
	5og90AS7o0+FEJVksg4lZBvkgC/UfyJWS2CyCsazBBYqs0cs3rx7idcUaYJF3uEP6JeHTz9NtmR
	jTco2uOMwcQHeXXiDUq3yskzJAfJCi0U=
X-Gm-Gg: ASbGncsmhKFBqfBioZ7xi4B6CRpspdX8nskPhajPJiJjifRcs7Mwo6DVB0DPW7S03GA
	y65h6hjS1Ymbo+rgiJqv/W8V1LhdM88G2KzsCszuGZxtG+EOrz80QQdLyI/eLoimf87HEZ4xTUJ
	9/1/7TgBBdBftJ78POYY7rW/rN/KobU5LdGgAYrwerOYemw5bH9I93SNjeNmd2k076UTrM7xXCM
	mCbQw==
X-Google-Smtp-Source: AGHT+IF83bnN+Rn6SETMprNxLDqYn3Oa32n/emHN7L11kFTD4jAa5jXEfiASWrm1+/EhdAUC2x3w1NlDeDUyug49x/U=
X-Received: by 2002:a05:6512:1518:10b0:55f:3bab:f205 with SMTP id
 2adb3069b0e04-55f3babf38dmr2216301e87.42.1756215762615; Tue, 26 Aug 2025
 06:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <1689d707b930b1ea4f63cc150810e548962cda81.1754943875.git.mykola_kvach@epam.com>
 <87ldna6ia8.fsf@epam.com>
In-Reply-To: <87ldna6ia8.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:31 +0300
X-Gm-Features: Ac12FXzNhdmUhbvV1XvV6pj2kKFbIMTFDkvyORALk8YOcGEFPk6Mq_WP57ikkqA
Message-ID: <CAGeoDV9Hv02gO=7pcMf_k3XQc=Stp76hEmiDfT1wc5M1NNSmOQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 8:48=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
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
> >  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 269 +++++++++++++++++++++++
> >  1 file changed, 269 insertions(+)
> >
> > diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/pas=
sthrough/arm/ipmmu-vmsa.c
> > index dac0dd6d46..ced762657a 100644
> > --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > @@ -58,6 +58,8 @@
> >  #define dev_print(dev, lvl, fmt, ...)    \
> >      printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> >
> > +#define dev_dbg(dev, fmt, ...)    \
> > +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> >  #define dev_info(dev, fmt, ...)    \
> >      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> >  #define dev_warn(dev, fmt, ...)    \
> > @@ -117,6 +119,23 @@ struct ipmmu_features {
> >      unsigned int imuctr_ttsel_mask;
> >  };
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +struct hw_register {
> > +    const char *reg_name;
>
> Do you really need to store register name? It is not used anywhere.

No, it=E2=80=99s not needed. We can remove it.
Thank you for catching that.

>
> > +    unsigned int reg_offset;
> > +    unsigned int reg_data;
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
> >  /* Root/Cache IPMMU device's information */
> >  struct ipmmu_vmsa_device {
> >      struct device *dev;
> > @@ -129,6 +148,9 @@ struct ipmmu_vmsa_device {
> >      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> >      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
> >      const struct ipmmu_features *features;
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct hw_register *reg_backup[IPMMU_CTX_MAX];
> > +#endif
> >  };
> >
> >  /*
> > @@ -534,6 +556,235 @@ static void ipmmu_domain_free_context(struct ipmm=
u_vmsa_device *mmu,
> >      spin_unlock_irqrestore(&mmu->lock, flags);
> >  }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> > +static LIST_HEAD(ipmmu_devices_backup);
> > +
> > +#define HW_REGISTER_BACKUP_SIZE 4
> > +
> > +static struct hw_register root_pgtable[IPMMU_CTX_MAX][HW_REGISTER_BACK=
UP_SIZE] =3D {
> > +    [0 ... (IPMMU_CTX_MAX - 1)] =3D {
> > +        {"IMTTLBR0", IMTTLBR0, 0},
> > +        {"IMTTUBR0", IMTTUBR0, 0},
> > +        {"IMTTBCR",  IMTTBCR,  0},
> > +        {"IMCTR",    IMCTR,    0},
>
> Taking into account that only 4 registers needs to be saved, will it be
> easier and more efficient to have a hardcoded struct like this?
>
> struct ipmmu_reg_ctx {
>     unsigned int imttlbr0;
>     unsigned int imttubr0;
>     unsigned int imttbcr;
>     unsigned int imctr;
> }
>
> instead of hw_register[] ?
>
> Especially taking into account that struct ipmmu_vmsa_backup{} does
> exactly this.

I see no problem with doing that.

>
>
> > +    }
> > +};
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
> > +    struct hw_register *reg =3D mmu->reg_backup[domain->context_id];
> > +    unsigned int i;
> > +
> > +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->con=
text_id);
> > +
> > +    for ( i =3D 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
> > +        reg[i].reg_data =3D ipmmu_ctx_read_root(domain, reg[i].reg_off=
set);
> > +}
> > +
> > +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *dom=
ain)
> > +{
> > +    struct ipmmu_vmsa_device *mmu =3D domain->mmu->root;
> > +    struct hw_register *reg =3D mmu->reg_backup[domain->context_id];
> > +    unsigned int i;
> > +
> > +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->co=
ntext_id);
> > +
> > +    for ( i =3D 0; i < HW_REGISTER_BACKUP_SIZE; i++ )
> > +    {
> > +        if ( reg[i].reg_offset !=3D IMCTR )
> > +            ipmmu_ctx_write_root(domain, reg[i].reg_offset, reg[i].reg=
_data);
> > +        else
> > +            ipmmu_ctx_write_all(domain, reg[i].reg_offset,
> > +                                reg[i].reg_data | IMCTR_FLUSH);
> > +    }
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
> >  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
> >  {
> >      uint64_t ttbr;
> > @@ -546,6 +797,9 @@ static int ipmmu_domain_init_context(struct ipmmu_v=
msa_domain *domain)
> >          return ret;
> >
> >      domain->context_id =3D ret;
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    domain->mmu->root->reg_backup[ret] =3D root_pgtable[ret];
> > +#endif
> >
> >      /*
> >       * TTBR0
> > @@ -602,6 +856,9 @@ static void ipmmu_domain_destroy_context(struct ipm=
mu_vmsa_domain *domain)
> >      ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
> >      ipmmu_tlb_sync(domain);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    domain->mmu->root->reg_backup[domain->context_id] =3D NULL;
> > +#endif
> >      ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
> >  }
> >
> > @@ -1307,6 +1564,14 @@ static int ipmmu_add_device(u8 devfn, struct dev=
ice *dev)
> >      /* Let Xen know that the master device is protected by an IOMMU. *=
/
> >      dt_device_set_protected(dev_to_dt(dev));
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( ipmmu_alloc_ctx_suspend(dev) )
> > +    {
> > +        dev_err(dev, "Failed to allocate context for suspend\n");
> > +        return -ENOMEM;
> > +    }
> > +#endif
> > +
> >      dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
> >               dev_name(fwspec->iommu_dev), fwspec->num_ids);
> >
> > @@ -1372,6 +1637,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
=3D
> >      .unmap_page      =3D arm_iommu_unmap_page,
> >      .dt_xlate        =3D ipmmu_dt_xlate,
> >      .add_device      =3D ipmmu_add_device,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend         =3D ipmmu_suspend,
> > +    .resume          =3D ipmmu_resume,
> > +#endif
> >  };
> >
> >  static __init int ipmmu_init(struct dt_device_node *node, const void *=
data)
>
> --
> WBR, Volodymyr

Best regards,
Mykola

