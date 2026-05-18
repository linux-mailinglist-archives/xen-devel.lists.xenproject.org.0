Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCdpH6oDC2qj/QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 14:18:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D975956C78C
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 14:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311824.1581959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwux-0000Bl-QC; Mon, 18 May 2026 12:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311824.1581959; Mon, 18 May 2026 12:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwux-00008t-Mz; Mon, 18 May 2026 12:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1311824;
 Mon, 18 May 2026 12:17:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOwuv-00008n-F9
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 12:17:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOwuu-008Ifu-H6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:17:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b0370-bab6-0a2a0a5309dd-0a2a4501e80e-2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 14:17:52 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b0370-c1f2-0a2a45010019-d155a72abcbc-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 14:17:52 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a8c94cefcdso1774652e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 05:17:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779106671; cv=none;
        d=google.com; s=arc-20240605;
        b=MQ8ljygVSvRL1Coa0sU9ekiRknsA7sn7NtZdx/FzpxgfRwqAeVA8Z8SVJnjTgcUV44
         Gd+IeBEQYMeAQdiSWFLDSOzKib60O67rP0cQw16e4Kjgm067HeiP/oY/LTC+RYLMWIOC
         eugazIsrPtBy8ZDIU55xsislCz7G+PGZ3tsyKL6cFmJfAruG9REIOjVWpWidb16KbCWa
         OS5XiOmm6m8zVKNVAicUwTeLwd/J5bfIOo3xf9JV2QiKQltuLLt/UPpPDFvK0bUbYq44
         MAZZXm2E7JXRe3aYV7Fg5n0EGAJxjPxd2ksBZRodJVv6TMhWFw7m3aIBqCmrjkPZNGCb
         Qr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUDDMeEAjWqLVQMALbxRXsM4w6DolEPsRZbXDVvo8PI=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=Bn22LNxZT/i9FUKMnZSCkaxoeSOpD4vCHCyuwv36t524o1ToBJks/+ttMVv2SRhNKW
         RGM4yHA1EkD9asDB20hpem3gWXAIYpBBzhiGKqno0GPEbLI8gBDhg3aLnpZ37gjdUSjv
         bKkY8++inMlRRTluJPvd2JY+0Tn+IgyY1BXyXGw+ueHI72D1BrQ45swJnHODGp5j6CBB
         HAxiIYERA7AjYnbRNhbqZBLK4dcOuLzB+QI7HXxWYDnTDf/sY+2AZ+Bjlc9xBHAF2D9b
         1PBcBVSPGWHwMo5QRIG3wFJywEgLfJyKH6pOwflhjIAYE2YjlEAyyp284Ed+xebRDSc/
         5dEw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106671; x=1779711471; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUDDMeEAjWqLVQMALbxRXsM4w6DolEPsRZbXDVvo8PI=;
        b=b5MEPDz23rdjv/xb3N3/Wm9ScdYZ6hfpyWLRS9x+jzpRbclZFi30U/AbtVBrtIOUHc
         QHdfewVg5kknplYPPaLGYPuTVERsqzcYYAJs4kS12I/Fv3bdyumeHblPogivu70+ttYe
         aAyG8mNdY4MeD0ZwoJO3IADoYDAKyTE3kWQD1g24vG6o489sSpO/c5Wp5+srgcjLPKU1
         x1vrOQW5gJWzajbHfpX+d4eHGhYYpd960lYXDvPaKVHVj5jPvfnLBUZa4I9621XdXUpD
         VTw4+OhiHFXE+/a+6S1FBGH2bS/CWtVGafOopjxUQt3V92+JDhA5f8RGPDJnOYTbd0NA
         JCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106671; x=1779711471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUDDMeEAjWqLVQMALbxRXsM4w6DolEPsRZbXDVvo8PI=;
        b=F5vCeqTcmNfwJtkNADpBm4+gV1pYV+1fd2fWZHcztkozjr2gWzWx2AuLLi8CKeGHfR
         s7iFHn4lvdWyVH9U4cg8ABW/f07gK+evX5Ng42gu8v9SszFUxMxG6dCb2//Qau0CcWOE
         scHRGIQllEfvWPGqzVJj7cEl81Ek5QIx40XA1/i83Jjpx2xqH5j20y9NKeMGYWn4sOXv
         LammYXa380ivAMmbTmbcUDVoJiN0fzkF2m96fLENMPhJ9YqNq+beZn/D5eNN0zE3lfxR
         eBlwekfdHLZgMWGWTHx8oLhVM5DQUu6kNHP2zaIMA331+MwEM/6Zo+CJWigMsWrOPdZa
         pPfw==
X-Gm-Message-State: AOJu0YyJUVIPc9Jr+s3KsaMLW+z751RnS9AjkIgqpwaOSqDFuuP0fdFI
	CiUayTIrr2/OhVnxdfGZlOO4KKSJSOHXdTb8lVk6aumV7kr3IbjxzBGpJutgK3pRorFn71xE0Wt
	4HIbTzFa32Y0UiAapg+wU+12RDc8pPrY=
X-Gm-Gg: Acq92OGO4ZeJ2u3fI29hhgw4/GnKO1LFUlUHPl8oh8xqC5Egun0MqMyCyKNZHv6GgDE
	UvZn4UwY8ngmo6buTkgl2so0HAH+uYwOlha/2Q5c3NBMdUcYD6pdHqdO3qfEqbUesd9JoZkBo0H
	8hMkK+GbLDwePWXpDspwBAnsUVrqK6SyVQ0GJO7wYjXE6nuIrkMJQUXSrg/pc1E4rAGIQ0n7euz
	/FYXSn0a4kvUIDlG0KAJBSC+Lpk33QJtthiQv05q9jBPcy0IkIgyPyREJPF/1BAetn9YjREfMWK
	NMCsr2OPRKlr5QY=
X-Received: by 2002:a05:6512:39d0:b0:5a8:9b6a:5749 with SMTP id
 2adb3069b0e04-5aa0e7649eemr4462110e87.28.1779106671271; Mon, 18 May 2026
 05:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
 <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
In-Reply-To: <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 15:17:40 +0300
X-Gm-Features: AVHnY4KnOHtCHpYNiS22fApRj8XdYJuznv52g3PGeMYztESxGRZ5nyaNtC1Vqsw
Message-ID: <CAGeoDV8ucuOL2BfquiMtY7_1jmxhse93RZQkTchC=FHiQg3q8A@mail.gmail.com>
Subject: Re: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1779106672-B695FFF4-25BDDE76/0/0
X-purgate-type: clean
X-purgate-size: 7739
X-Rspamd-Queue-Id: D975956C78C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.958];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Luca,

Thank you for the review.

On Thu, May 14, 2026 at 6:58=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/pas=
sthrough/arm/ipmmu-vmsa.c
> > index fa9ab9cb13..e1b47a5824 100644
> > --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> > @@ -71,6 +71,8 @@
> > })
> > #endif
> >
> > +#define dev_dbg(dev, fmt, ...)    \
> > +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
> > #define dev_info(dev, fmt, ...)    \
> >     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> > #define dev_warn(dev, fmt, ...)    \
> > @@ -130,6 +132,24 @@ struct ipmmu_features {
> >     unsigned int imuctr_ttsel_mask;
> > };
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
> > /* Root/Cache IPMMU device's information */
> > struct ipmmu_vmsa_device {
> >     struct device *dev;
> > @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
> >     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
> >     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
> >     const struct ipmmu_features *features;
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> > +#endif
> > };
> >
> > /*
> > @@ -547,6 +570,245 @@ static void ipmmu_domain_free_context(struct ipmm=
u_vmsa_device *mmu,
> >     spin_unlock_irqrestore(&mmu->lock, flags);
> > }
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
>
> NIT: There is a double space before the `=3D`

Ack.

>
> > +
> > +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->co=
ntext_id);
> > +
> > +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> > +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> > +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> > +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
>
> I see in ipmmu_tlb_invalidate() we do:
> dsb(sy);
> ipmmu_tlb_sync(domain);
>
> Is it safe to omit them here?
>
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
> > +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
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
> > +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
> > +
> > +    spin_lock(&ipmmu_devices_lock);
> > +
> > +    list_for_each_entry( mmu, &ipmmu_devices, list )
>
> This loop has an ordering problem because we can run ipmmu_utlbs_restore(=
) before
> the root ipmmu is restored (ipmmu_probe() uses `list_add()`).
> Maybe going twice on the list, restoring first the root and in the second=
 round the rest
> should work.

Ack, good point.

I will split the resume path into two passes: restore the Root IPMMU contex=
t
state first, then restore the micro-TLB state on Cache IPMMUs afterwards.

Best regards,
Mykola

