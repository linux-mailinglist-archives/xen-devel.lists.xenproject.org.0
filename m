Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKmUJrQl6mnwvAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:59:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0314B453619
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 15:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292137.1570704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFua1-0003w3-4N; Thu, 23 Apr 2026 13:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292137.1570704; Thu, 23 Apr 2026 13:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFua1-0003tT-1i; Thu, 23 Apr 2026 13:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1292137;
 Thu, 23 Apr 2026 13:58:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wFua0-0003tN-1c
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 13:58:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFuZz-00BRQ7-EZ
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:58:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69ea2581-bab6-0a2a0a5309dd-0a2a4507d1b8-46
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:58:55 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69ea259f-229c-0a2a45070019-d1558031b5bc-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 15:58:55 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488b150559bso53402695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 06:58:55 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4daf2sm52032005f8f.33.2026.04.23.06.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 06:58:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776952735; x=1777557535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtOs/FsZMaCwgHfT225WIJoHwl54zjs3xyeZxIUICp4=;
        b=jbT7f1GHIlsjJxvfDOiqN2BGZrWFv+/Onb1N7qwlofZ90gZINP14KbUpbMT250Pngh
         /UdMW9tkIngq47zRPDeghd6RFVYxka6FesF6mkVFp/7ND3BwhfLHTUHZxA29StFQoTIl
         CADhdWvgye5dxW1EFdL6eSn67w5ztbcPlGVuFfWsHaTTZI7Ja3N3CJGbn3gwb5vGNkKC
         cGKDkv/P+j3QoXp88Ugh6pl4YwuMlgcrUfUgrhOzd3CHiMGvFdSgwgdgefng3HPbeHle
         f/t2keoWoPO26nI65yviUGB5x0QP3FK0W+CSF0EQbeQdpIxw6SLrmZz1Og75MoWZ6He2
         88gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952735; x=1777557535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtOs/FsZMaCwgHfT225WIJoHwl54zjs3xyeZxIUICp4=;
        b=kQfdMlVhxQZSoDxGSMtiIUCX32NdXVzRFr3FVQ4BSamxO4B4M6ia5R7vkcaA7iLmek
         mnLNcj2lI8AY6DuZz9dXvAo3NUuoW8FqD/RXs6A7Kgw3wsuAS/b3Xh4Z5GB2TmPuRtd/
         gHkm/twW5ZolnZXSNpiZqFcwMOxms7CyzxEbu4q41NdPvQerqS5qHypBOuxEwFWr+g+x
         dGcDrOqK8yvR1LbIUIHNYAf1n1A35BPByITjiXM2JSpbrAawx9wZ6HN0gkHp9YvxpgOC
         o5++HlNIFkz6eZfxEkz9BGer0wU9byEjhNLGmk6wqdF25kT23ZXAtTf7fMvzNsd6bOwC
         wFGA==
X-Forwarded-Encrypted: i=1; AFNElJ/EcJTRH4cdRUdWKO6/bud/klr3/OZvC0AX1g7H6+BCvujgBYJxUqRQGDUmQJMevBM1G5nV7P+NYd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKTsfKhPXvg44g/Z0sguHqtoDia3jqj6NvTX6sSUq56y3VTR0I
	1vKMXtTxfApAK8Aidfp5eYXh1s9LECShLXFl7a/THYRNQgPxNbirG1Om
X-Gm-Gg: AeBDievuZZev7bBCzb0yzwzC8jwVaJGOZ1ona87kbmPmD7U3vJGQzmWCWXaxj35GRgK
	JUPC1cvdn3dDdzTSzVjrdlBumZxnxyBb4U2vfQBy8Nf7nPxtqUwUecWRYlTyXcryyKE8wOQGdAr
	Zxb3UWYzmW+/5GpB1YCdNzGIMJ31Me28Z1cG7R0YBv4p20fEQVMvgT5Dsv+bBmCljv3m+2b65FF
	oO/dLwymFVhQ0k2zEXnXfAZS2bNGmP1m79eePF4goeezTV8+akt/f0SnZG9p1ovHU18HXuHOR3I
	T5BfSxoRRkCtkHyq5fNKCyABFN0y91W+J31wnUJQOV4AlM01zzWuaMOUgOCK6Jrcwo5z1COkIQ3
	8jPbA1Uw3XZnW9MMBYOHEMrPXyH4Xid4WRbsDu1tSWT3eD3gSoJZIf+sFwx9oFLT3t+gQL4cVt6
	0lWl7ychRbd5nwJHoP+tBg96jpGgD5gxOOsYAq
X-Received: by 2002:a05:600d:8408:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-488fb73dc6fmr311275065e9.6.1776952734418;
        Thu, 23 Apr 2026 06:58:54 -0700 (PDT)
Message-ID: <166ff356-2f48-4bb6-bb76-96c0f66ba9be@gmail.com>
Date: Thu, 23 Apr 2026 16:58:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: smmuv3: Add support for removing devices
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <d9f90d511208d17f0a98db5d858955f8adfecc03.1776851790.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <d9f90d511208d17f0a98db5d858955f8adfecc03.1776851790.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776952735-2B57BC48-F0C72AAC/0/0
X-purgate-type: clean
X-purgate-size: 7445
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0314B453619
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/26 12:57, Mykyta Poturai wrote:

Hello Mykyta

> Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
> most of the work by disabling ATS and zeroing STEs. Additionally, unset
> the dt_device_is_protected flag and free no longer needed smmu_master.
> Free iommu_fwspec for PCI devices only, for DT devices it is handled by
> generic IOMMU layer.
> 
> Rework dt_device_set_protected to accept a boolean parameter, update
> callsites.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
> VFs.
> 
> [1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.com/
> 
> V2->V3:
> * free fwspec for pci devices
> * remove testing note from commit message
> 
> V1->V2:
> * check for phantom functions
> * simplify pci/dt device split
> * improve error handling
> * don't try to free master for unprotected devices
> * rework dt_device_set_protected

Thanks, this looks much better now. Mostly looks ok to me, but I have 
several comments.


> ---
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
>   xen/drivers/passthrough/arm/smmu-v3.c    | 65 +++++++++++++++++++++++-
>   xen/drivers/passthrough/arm/smmu.c       |  4 +-
>   xen/include/xen/device_tree.h            |  5 +-
>   4 files changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index fa9ab9cb13..0648f9b407 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>           }
>   
>           /* Let Xen know that the master device is protected by an IOMMU. */
> -        dt_device_set_protected(dev_to_dt(dev));
> +        dt_device_set_protected(dev_to_dt(dev), true);
>       }
>   #ifdef CONFIG_HAS_PCI
>       if ( dev_is_pci(dev) )
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..a46c421399 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1493,6 +1493,68 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
>   static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
>   				 struct device *dev);
>   
> +static int arm_smmu_remove_device(u8 devfn, struct device *dev)

Inconsistent devfn type: arm_smmu_remove_device() uses u8,
but int (*remove_device)(uint8_t devfn, device_t *dev); uses uint8_t.


> +{
> +	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
> +	struct domain *d = NULL;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if ( !fwspec )
> +		return -ENODEV;
> +
> +	master = dev_iommu_priv_get(dev);
> +	if ( !master )
> +		return -ENODEV;
> +
> +	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);

arm_smmu_assign_dev() has ASSERT(pcidevs_locked()) in its PCI path, 
while arm_smmu_remove_device() does not. pci_remove_device() holds 
pcidevs_lock() before calling iommu_remove_device().

So, I would add the same assertion here to document the requirement and 
guard against future callers.



> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		d = pdev->domain;
> +	}
> +	else
> +	{
> +		if ( !dt_device_is_protected(dev_to_dt(dev)) )
> +		{
> +			dev_err(dev, "Not added to SMMUv3\n");
> +			return -ENODEV;
> +		}
> +
> +		dt_device_set_protected(dev_to_dt(dev), false);
> +		if ( master->domain && master->domain->d )
> +			d = master->domain->d;

Unless I am mistaken, for DT devices, the deassign logic is unreachable 
dead code. iommu_remove_dt_device() returns -EBUSY if the device is 
still assigned, guaranteeing master->domain == NULL. This means that ...


> +	}
> +
> +	if ( d )
> +	{

  ... this block only has effect for PCI.


I would consider adding a comment and ASSERT, something like:
/*
  * For DT devices, iommu_remove_dt_device() returns -EBUSY if the
  * device is still assigned, so d is always NULL on the DT path.
  */
ASSERT(dev_is_pci(dev));


the rest looks good


> +		int ret = arm_smmu_deassign_dev(d, devfn, dev);
> +		/* This should never fail because we already checked the domain */
> +		ASSERT(!ret);
> +	}
> +
> +	arm_smmu_disable_pasid(master);
> +
> +	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
> +		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	xfree(master);
> +	dev_iommu_priv_set(dev, NULL);
> +
> +	/*
> +	 * For DT devices the fwspec is freed by iommu subsystem, but for PCI
> +	 * devices we need to free it here
> +	 */
> +	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
> +	    iommu_fwspec_free(dev);
> +
> +	return 0;
> +}
> +
>   static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   {
>   	int i, ret;
> @@ -1571,7 +1633,7 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   		}
>   
>   		/* Let Xen know that the master device is protected by an IOMMU. */
> -		dt_device_set_protected(dev_to_dt(dev));
> +		dt_device_set_protected(dev_to_dt(dev), true);
>   	}
>   
>   	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
> @@ -2867,6 +2929,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
>   	.add_device		= arm_smmu_add_device,
> +	.remove_device		= arm_smmu_remove_device,
>   };
>   
>   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index d63c901551..4d2f71f152 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -825,7 +825,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   	if ( !dev_is_pci(dev) )
>   	{
>   		/* Xen: Let Xen know that the device is protected by an SMMU */
> -		dt_device_set_protected(dev_node);
> +		dt_device_set_protected(dev_node, true);
>   	}
>   
>   	for (i = 0; i < fwspec->num_ids; ++i) {
> @@ -862,7 +862,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
>   
>   	if ( !dev_is_pci(dev) )
>   		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
> -		dev_node->is_protected = false;
> +		dt_device_set_protected(dev_node, false);
>   
>   	kfree(master);
>   	return 0;
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 06d7643622..76ae1e674a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -300,9 +300,10 @@ static inline domid_t dt_device_used_by(const struct dt_device_node *device)
>       return device->used_by;
>   }
>   
> -static inline void dt_device_set_protected(struct dt_device_node *device)
> +static inline void dt_device_set_protected(struct dt_device_node *device,
> +                                           bool protected)
>   {
> -    device->is_protected = true;
> +    device->is_protected = protected;
>   }
>   
>   static inline bool dt_device_is_protected(const struct dt_device_node *device)


