Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPKqMl4OfmmIVAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 15:14:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15746C2344
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 15:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218118.1527109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmBjH-0002Tt-BI; Sat, 31 Jan 2026 14:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218118.1527109; Sat, 31 Jan 2026 14:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmBjH-0002Qp-5i; Sat, 31 Jan 2026 14:13:39 +0000
Received: by outflank-mailman (input) for mailman id 1218118;
 Sat, 31 Jan 2026 14:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQ/4=AE=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1vmBjF-0002Qj-Mb
 for xen-devel@lists.xenproject.org; Sat, 31 Jan 2026 14:13:37 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07f22d7b-feaf-11f0-b161-2bf370ae4941;
 Sat, 31 Jan 2026 15:13:36 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so431111066b.2
 for <xen-devel@lists.xenproject.org>; Sat, 31 Jan 2026 06:13:35 -0800 (PST)
Received: from [192.168.0.109] ([91.123.155.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dd99188adsm448717366b.50.2026.01.31.06.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jan 2026 06:13:33 -0800 (PST)
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
X-Inumbo-ID: 07f22d7b-feaf-11f0-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769868815; x=1770473615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOcO4OFNFjOuvP+jlNFYVPlommE9wXOl86bUnyhSPrM=;
        b=k2AysRoIHhcYrHOfhnF28NT9KwdEGA5Hu5mcw0+cenk4BNnQXE76rx7Sfbapsdpmci
         6oJYMqrUDWVwVzad5yCEWej64M4C2n13k78kZGrPMM1uCtFAl25aXaDhfCydsOYnVkOM
         oMVS1LFKzzPQm/7aIA3i2GCxHf72t2emxnbjLgabiru8SlNgdwMIMyK/+ZAHfXwwP89N
         I2tgOBpxZ7Mh2BGIbFHraY1r8BuKYYQMA4GXwcAS+EMqB2pMOyx/b/w1tGBRDFJfINHZ
         N39exdH9tOndOcyAaovQ6xqYkizq52fJYRLiNoBgQ7gX6k7LR4H5f+AjUXDMa2xK1H43
         61QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868815; x=1770473615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOcO4OFNFjOuvP+jlNFYVPlommE9wXOl86bUnyhSPrM=;
        b=nDg4uCzf53sDR+WsTWQY1b+BwrO3sbmVtr4SS98Xq7EKg1NPiaEJQ54ztmnWtFXEjz
         OL1P0MyZGtsrMGvx1RSyl3d+WBa8OVPBbOAnUBu7oZqZimM662+ZQTU9b2CJ9r2QcDjs
         5UPbuKfJ+FmR7/WnmdgEpCfuTkmMRmIdsMaa5H9cC1BUeXR7q1knU0cI45eWTnRDA2+Z
         537VUxE9msfW4e+6VYN5xyzkwB/n1SJSGiAhE/ZobFZ3dmtAQxsLwl+pXgVJ/L+JnEZg
         WGbuWxBWX4iDconahmsG6QQ9SS9D5Ggrrtz9K3YaFOOuzV0+PSfIcKhDCAQ2SGdOmUXZ
         CQEw==
X-Forwarded-Encrypted: i=1; AJvYcCXkmDRBoGrgKnM9BCJsViPmk7oao+xqGBknYC3DnnxhaL3tAWx0VR+sBRwz78AExVRkHXk/nr4GDVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuaIizfJehMXg+zr3PBN1UsuY8uDxijL1b5EhkiN8R/c4+9ppE
	km2I6hst7QTgGsrwOsyDWLiGna3rKL2mlVX+FtTSkRl6Sjx4I6auvATw+2cU+EEO
X-Gm-Gg: AZuq6aIcxjQuPxeCx5w0S1TK3nD+HfZUQOVlUdXMBkkg7xN6z9qiG9vVgFesZTFCDIk
	garPvLprtyo/JTWZwnNXhX+j1FsMgC6VWeupQXgrgfSvFsxxoxxiiCtcxI80F+BNj4URJbAuofj
	+O946hZBUrjGXeZQ1a3LY7cPYMyMvnJyX8cI9tum8EOCE5EDvVX2BZ2EzDhyoscZB35JJkWoqBZ
	Uz473zwXm9QrhFOn7Zn4AVuBqSHdfpqMIEBoihYLoQF8zB4y+07V5AapWHMHsU/0OmSR/DTmS7q
	Ir9kFbDAw0DEowRnAicccb1aVpHSU1uOv8VZsWT/aNdP9adiEJVk4VBsgvr4KZY6snYsdKgcFTZ
	13C1CmScrCeHmVLbAE4zyPlKfd+bl2oNiaAuOLf4P77d5kBGOlU2ICHTeDBF/uDxZkog42kytRY
	8FrTOcsEpcXSm7+VQ=
X-Received: by 2002:a17:907:9494:b0:b87:34e3:a79e with SMTP id a640c23a62f3a-b8dff56a919mr337390066b.12.1769868814574;
        Sat, 31 Jan 2026 06:13:34 -0800 (PST)
Message-ID: <3fd46041-77e0-44c9-891e-8a50b89cb56a@gmail.com>
Date: Sat, 31 Jan 2026 16:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/12] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <220c777ee30fd35afeedefff5a73d62d6ea1e0ac.1765472890.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <220c777ee30fd35afeedefff5a73d62d6ea1e0ac.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15746C2344
X-Rspamd-Action: no action



On 11.12.25 20:43, Mykola Kvach wrote:

Hello Mykola


> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Store and restore active context and micro-TLB registers.
> 
> Tested on R-Car H3 Starter Kit.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V7:
> - moved suspend context allocation before pci stuff

  Thanks for making this change, one note below ...

> ---
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 ++++++++++++++++++++++-
>   1 file changed, 298 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index ea9fa9ddf3..6765bd3083 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -71,6 +71,8 @@
>   })
>   #endif
>   
> +#define dev_dbg(dev, fmt, ...)    \
> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>   #define dev_info(dev, fmt, ...)    \
>       dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>   #define dev_warn(dev, fmt, ...)    \
> @@ -130,6 +132,24 @@ struct ipmmu_features {
>       unsigned int imuctr_ttsel_mask;
>   };
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +struct ipmmu_reg_ctx {
> +    unsigned int imttlbr0;
> +    unsigned int imttubr0;
> +    unsigned int imttbcr;
> +    unsigned int imctr;
> +};
> +
> +struct ipmmu_vmsa_backup {
> +    struct device *dev;
> +    unsigned int *utlbs_val;
> +    unsigned int *asids_val;
> +    struct list_head list;
> +};
> +
> +#endif
> +
>   /* Root/Cache IPMMU device's information */
>   struct ipmmu_vmsa_device {
>       struct device *dev;
> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>       struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>       unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>       const struct ipmmu_features *features;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
> +#endif
>   };
>   
>   /*
> @@ -547,6 +570,245 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
>       spin_unlock_irqrestore(&mmu->lock, flags);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
> +static LIST_HEAD(ipmmu_devices_backup);
> +
> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
> +
> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
> +                                   unsigned int utlb)
> +{
> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
> +}
> +
> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) != mmu )
> +            continue;
> +
> +        for ( i = 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb = fwspec->ids[i];
> +
> +            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
> +            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +
> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
> +    {
> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
> +        unsigned int i;
> +
> +        if ( to_ipmmu(backup_data->dev) != mmu )
> +            continue;
> +
> +        for ( i = 0; i < fwspec->num_ids; i++ )
> +        {
> +            unsigned int utlb = fwspec->ids[i];
> +
> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +
> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
> +{
> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
> +
> +    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
> +    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
> +    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
> +    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
> +}
> +
> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
> +{
> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
> +    struct ipmmu_reg_ctx *regs  = mmu->reg_backup[domain->context_id];
> +
> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
> +
> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> +}
> +
> +/*
> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
> + * through all registered IPMMUs performing required actions.
> + *
> + * Also take care of restoring special settings, such as translation
> + * table format, etc.
> + */
> +static int __must_check ipmmu_suspend(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return 0;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            for ( i = 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_backup_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_backup(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +
> +    return 0;
> +}
> +
> +static void ipmmu_resume(void)
> +{
> +    struct ipmmu_vmsa_device *mmu;
> +
> +    if ( !iommu_enabled )
> +        return;
> +
> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
> +
> +    spin_lock(&ipmmu_devices_lock);
> +
> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> +    {
> +        uint32_t reg;
> +
> +        /* Do not use security group function */
> +        reg = IMSCTLR + mmu->features->control_offset_base;
> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
> +
> +        if ( ipmmu_is_root(mmu) )
> +        {
> +            unsigned int i;
> +
> +            /* Use stage 2 translation table format */
> +            reg = IMSAUXCTLR + mmu->features->control_offset_base;
> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
> +
> +            for ( i = 0; i < mmu->num_ctx; i++ )
> +            {
> +                if ( !mmu->domains[i] )
> +                    continue;
> +                ipmmu_domain_restore_context(mmu->domains[i]);
> +            }
> +        }
> +        else
> +            ipmmu_utlbs_restore(mmu);
> +    }
> +
> +    spin_unlock(&ipmmu_devices_lock);
> +}
> +
> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data;
> +    unsigned int *utlbs_val, *asids_val;
> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !utlbs_val )
> +        return -ENOMEM;
> +
> +    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
> +    if ( !asids_val )
> +    {
> +        xfree(utlbs_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data = xzalloc(struct ipmmu_vmsa_backup);
> +    if ( !backup_data )
> +    {
> +        xfree(utlbs_val);
> +        xfree(asids_val);
> +        return -ENOMEM;
> +    }
> +
> +    backup_data->dev = dev;
> +    backup_data->utlbs_val = utlbs_val;
> +    backup_data->asids_val = asids_val;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +    list_add(&backup_data->list, &ipmmu_devices_backup);
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_HAS_PCI
> +static void ipmmu_free_ctx_suspend(struct device *dev)
> +{
> +    struct ipmmu_vmsa_backup *backup_data, *tmp;
> +
> +    spin_lock(&ipmmu_devices_backup_lock);
> +
> +    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
> +    {
> +        if ( backup_data->dev == dev )
> +        {
> +            list_del(&backup_data->list);
> +            xfree(backup_data->utlbs_val);
> +            xfree(backup_data->asids_val);
> +            xfree(backup_data);
> +            break;
> +        }
> +    }
> +
> +    spin_unlock(&ipmmu_devices_backup_lock);
> +}
> +#endif /* CONFIG_HAS_PCI */
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */


  ... I noticed the Kconfig guards for ipmmu_alloc_ctx_suspend() and 
ipmmu_free_ctx_suspend() are asymmetrical. This creates a configuration 
(CONFIG_SYSTEM_SUSPEND=y, CONFIG_HAS_PCI=n) where the allocation 
function exists but the deallocation function is compiled out.

While this feels a bit fragile, I understand this is necessary to avoid 
an "unused function" compiler error, as the only caller is within a 
CONFIG_HAS_PCI block. Since the alternative would break the build, I 
think the current implementation is acceptable. I have no further 
comments. The patch looks good now.


> +
>   static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>   {
>       uint64_t ttbr;
> @@ -559,6 +821,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>           return ret;
>   
>       domain->context_id = ret;
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
> +#endif
>   
>       /*
>        * TTBR0
> @@ -615,6 +880,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
>       ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>       ipmmu_tlb_sync(domain);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    domain->mmu->root->reg_backup[domain->context_id] = NULL;
> +#endif
>       ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>   }
>   
> @@ -1340,10 +1608,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>       struct iommu_fwspec *fwspec;
>   
>   #ifdef CONFIG_HAS_PCI
> +    int ret;
> +
>       if ( dev_is_pci(dev) )
>       {
>           struct pci_dev *pdev = dev_to_pci(dev);
> -        int ret;
>   
>           if ( devfn != pdev->devfn )
>               return 0;
> @@ -1371,6 +1640,15 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>           /* Let Xen know that the master device is protected by an IOMMU. */
>           dt_device_set_protected(dev_to_dt(dev));
>       }
> +
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( ipmmu_alloc_ctx_suspend(dev) )
> +    {
> +        dev_err(dev, "Failed to allocate context for suspend\n");
> +        return -ENOMEM;
> +    }
> +#endif
> +
>   #ifdef CONFIG_HAS_PCI
>       if ( dev_is_pci(dev) )
>       {
> @@ -1379,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>           struct pci_host_bridge *bridge;
>           struct iommu_fwspec *fwspec_bridge;
>           unsigned int utlb_osid0 = 0;
> -        int ret;
>   
>           bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
>           if ( !bridge )
>           {
>               dev_err(dev, "Failed to find host bridge\n");
> -            return -ENODEV;
> +            ret = -ENODEV;
> +            goto free_suspend_ctx;
>           }
>   
>           fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
>           if ( fwspec_bridge->num_ids < 1 )
>           {
>               dev_err(dev, "Failed to find host bridge uTLB\n");
> -            return -ENXIO;
> +            ret = -ENXIO;
> +            goto free_suspend_ctx;
>           }
>   
>           if ( fwspec->num_ids < 1 )
>           {
>               dev_err(dev, "Failed to find uTLB");
> -            return -ENXIO;
> +            ret = -ENXIO;
> +            goto free_suspend_ctx;
>           }
>   
>           rcar4_pcie_osid_regs_init(bridge);
> @@ -1407,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>           if ( ret < 0 )
>           {
>               dev_err(dev, "No unused OSID regs\n");
> -            return ret;
> +            goto free_suspend_ctx;
>           }
>           reg_id = ret;
>   
> @@ -1422,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>           {
>               rcar4_pcie_osid_bdf_clear(bridge, reg_id);
>               rcar4_pcie_osid_reg_free(bridge, reg_id);
> -            return ret;
> +            goto free_suspend_ctx;
>           }
>       }
>   #endif
> @@ -1431,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>                dev_name(fwspec->iommu_dev), fwspec->num_ids);
>   
>       return 0;
> +#ifdef CONFIG_HAS_PCI
> + free_suspend_ctx:
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    ipmmu_free_ctx_suspend(dev);
> +#endif
> +    return ret;
> +#endif
>   }
>   
>   static int ipmmu_iommu_domain_init(struct domain *d)
> @@ -1492,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
>       .unmap_page      = arm_iommu_unmap_page,
>       .dt_xlate        = ipmmu_dt_xlate,
>       .add_device      = ipmmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend         = ipmmu_suspend,
> +    .resume          = ipmmu_resume,
> +#endif
>   };
>   
>   static __init int ipmmu_init(struct dt_device_node *node, const void *data)


