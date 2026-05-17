Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GhqIh/bCWqZswQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 17:13:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5987561EEB
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 17:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311281.1581482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOdAl-0007fN-Ch; Sun, 17 May 2026 15:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311281.1581482; Sun, 17 May 2026 15:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOdAl-0007dZ-9X; Sun, 17 May 2026 15:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1311281;
 Sun, 17 May 2026 15:12:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wOdAj-0007dT-Ss
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 15:12:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOdAj-005ro4-50
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 17:12:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09dae3-e002-0a2a0a5209dd-0a2a45098bc2-4
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 17:12:53 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a09daf4-2497-0a2a45090019-d155d0a9cd1d-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 17:12:52 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-393c40246afso18785471fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 08:12:52 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395882c41c1sm5715151fa.12.2026.05.17.08.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 08:12:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779030772; x=1779635572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z15437ihNsBn2bknoWGnhSYwX6Gf3shYweS8Kz4hD5w=;
        b=JLGRq2zJkZUeiVv/tgQIfF8vRAICe+eZA57UAsL7RG5CuG/ee25rd6+4hI0RtNWIJh
         csdf5ksRe5SFrpWUYfhv/3ZrNgXM5peCvrE0reoHQc1IXz7pi2jMO9UOIRfDBn964T8v
         quiSb9CQKPOhdLYKDn5A2xAk9RDivUEfKQqxEELofBim7/cwhcnoZdrEFKi+MjiUpv/m
         89DMXocQl0llW4B2Xmy9VT5BjMe7+TCgEw8k7gVkIo49KY+obY4NeUD8x6FqclWqaMBp
         lqDHeqLSqKDR1rjao2Q2ej94lKDJpe4SBIjZ8RMkULnCWNsHsCxPAG7TtvdlqS8v3KS8
         I9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030772; x=1779635572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z15437ihNsBn2bknoWGnhSYwX6Gf3shYweS8Kz4hD5w=;
        b=WR0Kqo0KEwYcyo5TMm2Zz8ETNOE/W1ooNMdZEjJJgrtgoWMZ/WWvE/1cN8WHZxHPtu
         ZklBfunvySlSvELR93OSzFZHYjX42kUB1qiSXMBV+m9OHZVUEnWx/i58dP1098l9aza9
         00/cFzCh8v9GfwTLs8/bbbwvE+JCwVPakIm8biPCUnaWsvpL7gZf1ozeSOaKLs3Tl1JP
         ZbtOwCFWAIiLoUY15x2a/r2k9pL+NddpMeFunjbagcg8v1j+uXqePx7rHmoxX3bNVyEV
         AEaXKUgI6OM2I4Jm4pBHV/9LTzuKuPSTLUfEmjN0h+AD14LEYxlxGIJyFP+lKO1g+6KT
         6+Qg==
X-Gm-Message-State: AOJu0Yzs64FPMNlYzmpQCCbJHqU41OM3Q51CbIIT3NixHgR9iTM/FJ9+
	t+WPlkyp4xrjrKZVz6ak1im71QPVEDnevgMEmOyLZs1x6K4MC69W3ud8
X-Gm-Gg: Acq92OFmynKw2TWYs5lKlz6/N2s+g4rj5kq7i17JxwDbfZehAgqSz4dbDRbchf69BD9
	jT8ZVLTg8CYqDXim5xhdWb/DTZM0G1ZnPcb3a+0AL/+2R6KKGkd7hWHYtBuh492CmJIS5/tT8oY
	Q1NDyX1lhvCkFSudUVc1XQVEh3JamLFna3lz5aaOrUSxot+IJPLFs1NsD55lPwyrAo4NwiHfPAb
	9gc188pBCAJpTZkhVj6LyYyQdHbR7tgsMUxHr51f50vvup17r6xL5HgN6x95LxUuxT8r/VgrVZ7
	gbU7pY381HB26Sbcdq0KuxAsvBjxwMjCSf7C8G2WLOWmUWDEhf2j7l5lGTogR1Nke7bGIh6faSw
	YVHd8A4VN5M+PfsKk9lArbNcjmnEbfIgj+oZk7t3gDwEElaY2eAEmN/Y74zLOjjmFX3IhR/Bzw7
	HkvgrEaPR+WvbsN08oob995Fktew==
X-Received: by 2002:a2e:a995:0:b0:38e:186e:350e with SMTP id 38308e7fff4ca-39561a26af2mr33975421fa.7.1779030771927;
        Sun, 17 May 2026 08:12:51 -0700 (PDT)
Message-ID: <636cda11-bc98-44e9-a333-5a61cc86e0dd@gmail.com>
Date: Sun, 17 May 2026 18:12:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
 <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779030772-41165A53-7D061DD8/0/0
X-purgate-type: clean
X-purgate-size: 8134
X-Rspamd-Queue-Id: E5987561EEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[arm.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.917];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/14/26 18:57, Luca Fancellu wrote:
> Hi Mykola,

Hello Luca and Mykola

> 
>>
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index fa9ab9cb13..e1b47a5824 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -71,6 +71,8 @@
>> })
>> #endif
>>
>> +#define dev_dbg(dev, fmt, ...)    \
>> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>> #define dev_info(dev, fmt, ...)    \
>>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>> #define dev_warn(dev, fmt, ...)    \
>> @@ -130,6 +132,24 @@ struct ipmmu_features {
>>      unsigned int imuctr_ttsel_mask;
>> };
>>
>> +#ifdef CONFIG_SYSTEM_SUSPEND
>> +
>> +struct ipmmu_reg_ctx {
>> +    unsigned int imttlbr0;
>> +    unsigned int imttubr0;
>> +    unsigned int imttbcr;
>> +    unsigned int imctr;
>> +};
>> +
>> +struct ipmmu_vmsa_backup {
>> +    struct device *dev;
>> +    unsigned int *utlbs_val;
>> +    unsigned int *asids_val;
>> +    struct list_head list;
>> +};
>> +
>> +#endif
>> +
>> /* Root/Cache IPMMU device's information */
>> struct ipmmu_vmsa_device {
>>      struct device *dev;
>> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>>      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>>      const struct ipmmu_features *features;
>> +#ifdef CONFIG_SYSTEM_SUSPEND
>> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
>> +#endif
>> };
>>
>> /*
>> @@ -547,6 +570,245 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
>>      spin_unlock_irqrestore(&mmu->lock, flags);
>> }
>>
>> +#ifdef CONFIG_SYSTEM_SUSPEND
>> +
>> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
>> +static LIST_HEAD(ipmmu_devices_backup);
>> +
>> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
>> +
>> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
>> +                                   unsigned int utlb)
>> +{
>> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
>> +}
>> +
>> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
>> +{
>> +    struct ipmmu_vmsa_backup *backup_data;
>> +
>> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
>> +
>> +    spin_lock(&ipmmu_devices_backup_lock);
>> +
>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>> +    {
>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>> +        unsigned int i;
>> +
>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>> +            continue;
>> +
>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>> +        {
>> +            unsigned int utlb = fwspec->ids[i];
>> +
>> +            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
>> +            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
>> +        }
>> +    }
>> +
>> +    spin_unlock(&ipmmu_devices_backup_lock);
>> +}
>> +
>> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
>> +{
>> +    struct ipmmu_vmsa_backup *backup_data;
>> +
>> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
>> +
>> +    spin_lock(&ipmmu_devices_backup_lock);
>> +
>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>> +    {
>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>> +        unsigned int i;
>> +
>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>> +            continue;
>> +
>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>> +        {
>> +            unsigned int utlb = fwspec->ids[i];
>> +
>> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
>> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
>> +        }
>> +    }
>> +
>> +    spin_unlock(&ipmmu_devices_backup_lock);
>> +}
>> +
>> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
>> +{
>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>> +    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
>> +
>> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
>> +
>> +    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
>> +    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
>> +    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
>> +    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
>> +}
>> +
>> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
>> +{
>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>> +    struct ipmmu_reg_ctx *regs  = mmu->reg_backup[domain->context_id];
> 
> NIT: There is a double space before the `=`
> 
>> +
>> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
>> +
>> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
>> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
>> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
>> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
> 
> I see in ipmmu_tlb_invalidate() we do:
> dsb(sy);
> ipmmu_tlb_sync(domain);
> 
> Is it safe to omit them here?

Luca, good question, thanks. Below my understanding (which might be wrong):

The IMCTR_FLUSH bit here is not an explicit TLB invalidation request — 
it is required by the HW whenever context registers are modified 
(regardless of whether an actual TLB flush is the intent). For example, 
ipmmu_domain_init_context() similarly writes:

ipmmu_ctx_write_root(domain, IMCTR,
                      IMCTR_VA64 | IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);

and does not follow it with dsb(sy) / ipmmu_tlb_sync().

In contrast, ipmmu_tlb_invalidate() does include the sync because it is 
an explicit flush request from the P2M framework, and we need a 
guarantee that the invalidation has completed before proceeding.

Here, we are simply restoring context registers after resume, there is 
no caller waiting on flush completion, so the additional synchronization 
is not necessary from my PoV.


> 
>> +}
>> +
>> +/*
>> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
>> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
>> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
>> + * through all registered IPMMUs performing required actions.
>> + *
>> + * Also take care of restoring special settings, such as translation
>> + * table format, etc.
>> + */
>> +static int __must_check ipmmu_suspend(void)
>> +{
>> +    struct ipmmu_vmsa_device *mmu;
>> +
>> +    if ( !iommu_enabled )
>> +        return 0;
>> +
>> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
>> +
>> +    spin_lock(&ipmmu_devices_lock);
>> +
>> +    list_for_each_entry( mmu, &ipmmu_devices, list )
>> +    {
>> +        if ( ipmmu_is_root(mmu) )
>> +        {
>> +            unsigned int i;
>> +
>> +            for ( i = 0; i < mmu->num_ctx; i++ )
>> +            {
>> +                if ( !mmu->domains[i] )
>> +                    continue;
>> +                ipmmu_domain_backup_context(mmu->domains[i]);
>> +            }
>> +        }
>> +        else
>> +            ipmmu_utlbs_backup(mmu);
>> +    }
>> +
>> +    spin_unlock(&ipmmu_devices_lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static void ipmmu_resume(void)
>> +{
>> +    struct ipmmu_vmsa_device *mmu;
>> +
>> +    if ( !iommu_enabled )
>> +        return;
>> +
>> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
>> +
>> +    spin_lock(&ipmmu_devices_lock);
>> +
>> +    list_for_each_entry( mmu, &ipmmu_devices, list )
> 
> This loop has an ordering problem because we can run ipmmu_utlbs_restore() before
> the root ipmmu is restored (ipmmu_probe() uses `list_add()`).
> Maybe going twice on the list, restoring first the root and in the second round the rest
> should work.
> 
> Cheers,
> Luca
> 
> 


