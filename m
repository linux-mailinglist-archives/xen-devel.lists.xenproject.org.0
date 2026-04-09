Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD9lFWu812l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:49:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97463CC32E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277646.1562791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqgo-0003MG-H8; Thu, 09 Apr 2026 14:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277646.1562791; Thu, 09 Apr 2026 14:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqgo-0003Ja-Ec; Thu, 09 Apr 2026 14:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1277646;
 Thu, 09 Apr 2026 14:49:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wAqgn-0003JU-Ia
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:49:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqgm-0026kI-UH
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:49:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69d7bc42-bab6-0a2a0a5309dd-0a2a45059ade-46
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:49:00 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <olekstysh@gmail.com>)
 id 69d7bc5c-3760-0a2a45050019-d1558031e1d6-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:49:00 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso10912885e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:49:00 -0700 (PDT)
Received: from [10.17.80.122] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1d171dsm39810815e9.5.2026.04.09.07.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 07:48:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775746140; x=1776350940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITlGhv9Njii142pmKjT/2uvGK7HxNsPVXtpcv9dPkKA=;
        b=USMddU2N6Ri4WXKtzyqwBTzn2uYpG1psCrFufZZtTPV5zCmPyW6yLbfsdtpM7A6pJP
         nawaapEyI0K5uYi8vmZVcZ3fo4PPXw43mtuOvzYmqUJuY4ET9Nnt+q8UOSg2BnWHRndH
         MsnIZrPJG2XZcmfRW2gFAd4vT5pfNhEFNgEO1NWKjaDHXtIlRGm45uUA4XwRlGaZr1Eb
         G6wJiPPNR1OYSiA96td+OR48/i+1u0d+BxN0gE+HicOukDYeS+73PJvKay3k9biJEaNc
         gdKn9+3UigsI0cBZnSnHNHFyo9iII1uBcvzCQMhZFOT3bv//iDr7XZrpjWhSJK/i9Zec
         X9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746140; x=1776350940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITlGhv9Njii142pmKjT/2uvGK7HxNsPVXtpcv9dPkKA=;
        b=EMFfVhk+6jeWho5gGKkYof5/CHcX/U7FTKMg1p36q3/Z3AMcOoWhc0Fj7q4X16Vr6v
         4ym0M11358BFwGrTFQWosN4yx1+q1KRHemii3V50d0XGaRY0Oe6m3NWX6VqP0rs4LaKu
         afeb18lZN/rUbauXff014zIl2YFfvV5CC3MhHLOwUJd4QMHpX6VTgQwLZdUgxUqbk/yu
         VZW3Rm6VmUaUU0pr4QfomlQLetlkWpp3G/5A37QJgd8clECj08aoQMeSTjIzrn2Xv6py
         Gruso47UQBcqnOlTtbZoQkeofoR3FELlu/r6S/1KSLYazITb37IzqEIHcJnkzJk63hoL
         VcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbWCiGlfWTCQzr93sWm/tKdu1ZPIib6Ka7nvEFt6FheVgVH4HRa/NBaIBivlsysunQRqOhRAoXl0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6k27dUZ8cN5q+2WoWog2QokYfsMJH0w7Q/Zxdef9cikzJc1t7
	fJd4rn1IqtUOlG6QSpsPZjQfpo8iSTT8+2uxCgEdbo3UaDjqSVR86Q+s
X-Gm-Gg: AeBDievdx4qaYsYEZtk6+YmLX1ph+bMypqQeQQbaHNIvnfIqCZS1+fuKoAXRMGZDXgk
	yx3KyLRdLvzGZ/vwh1ivbfZ/5SrPGsTcxg96rHH3kcY/QO3ZuohczZ21Y86XVy954rM6/rxgxtE
	J8yifHqoiFM6nLc6db7pYS98MO7+eTmmXxnhxteX+WJ6veUPNmPrULqbnp2vLGxo03CQFgQ+XdR
	SKoIbbvG+4pdL0odzWIF7acNg6vBu6WvgZ16bSS0MayFL5J9TfYXsjXTMxJAvFkz++wI11b0i9h
	BwUIxRJ0SAFwKJQmOsj3XKo+0C8xWm5V+BOF0OejTWgSywS8oEvt67f2o+FCqwSUWjnCjvyBgge
	wJZsvLqirjm/BQAKs2Ci4YgmSueTMBwC81r7yKKT/TS0Ke65POYP5hNNjxzugvPN5dL089HabCC
	2GcrmiMZQ5178V77C9M4Uu2PUpHJUpmhtZ2PHiNASFO5/fsNKJJbwESWE=
X-Received: by 2002:a05:600c:3acb:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-4889972b76amr357729015e9.13.1775746140090;
        Thu, 09 Apr 2026 07:49:00 -0700 (PDT)
Message-ID: <85a89549-cf54-4441-b2f7-84e6f2b3d2b8@gmail.com>
Date: Thu, 9 Apr 2026 17:48:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: smmuv3: Add support for removing devices
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <a59c2da0d4c72deb42950e9a8e3982fbdee60668.1775555766.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a59c2da0d4c72deb42950e9a8e3982fbdee60668.1775555766.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775746140-39B9096F-01393D5E/0/0
X-purgate-type: clean
X-purgate-size: 5719
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B97463CC32E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/26 12:58, Mykyta Poturai wrote:

Hello Mykyta

> Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
> most of the work by disabling ATS and zeroing STEs. Additionally, unset
> the dt_device_is_protected flag and free no longer needed smmu_master.
> 
> Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
> VFs.
> 
> [1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.com/
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 59 +++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h         |  5 +++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..b5b834a7b7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1493,6 +1493,64 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
>   static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
>   				 struct device *dev);
>   
> +static int arm_smmu_remove_device(u8 devfn, struct device *dev)
> +{
> +	int ret = 0;
> +	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if ( !fwspec )
> +		return -ENODEV;
> +
> +	master = dev_iommu_priv_get(dev);
> +	if ( !master )
> +		return -ENODEV;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);

As Luca has already noticed in a separate email regarding phantom 
functions:

If I understand the code correctly, the iommu_remove_device() loops over 
PCI phantom functions, calling ops->remove_device() multiple times for 
the exact same struct device *dev. Because you omitted the phantom 
function check (which exists in arm_smmu_add_device), the code will 
process the first phantom function, fall through to out_free, and 
destroy the master struct. When the iommu_remove_device() subsequently 
calls remove_device() for the main devfn, dev_iommu_priv_get(dev) will 
return NULL, and the removal will abort with -ENODEV.

Should not we ignore phantom functions at the top of the PCI block, just 
like in the add_device()? if ( devfn != pdev->devfn ) return 0;


> +
> +		if ( pdev->domain )
> +		{
> +			ret = arm_smmu_deassign_dev(pdev->domain, devfn, dev);
> +			if ( ret )
> +				printk(XENLOG_WARNING "Failed to deassign device %pp from SMMU\n",
> +					&pdev->sbdf);

What worries me is a possible state corruption on deassign failure. If 
arm_smmu_deassign_dev() fails, the code prints a warning but continues 
execution here ...


> +		}
> +	}
> +#endif
> +
> +	if ( !dev_is_pci(dev) )


NIT: I think that you could simplify the PCI/platform device split to 
avoid evaluating dev_is_pci(dev) twice by using #else block.

> +	{
> +		if ( !dt_device_is_protected(dev_to_dt(dev)) )
> +		{
> +			dev_err(dev, "Not added to SMMUv3\n");
> +			ret = -ENODEV;
> +			goto out_free;
> +		}
> +
> +		if ( master->domain && master->domain->d )
> +		{
> +			ret = arm_smmu_deassign_dev(master->domain->d, 0, dev);
> +			if ( ret )
> +				dev_warn(dev, "Failed to deassign device from SMMU\n");
> +		}

   ... and here.

It falls through to the bottom of the function where it frees the master 
struct. Because you return an error code, the IOMMU framework 
(specifically in the DT path) will abort the removal. At least, 
iommu_remove_dt_device() sees the error code and skips freeing the 
fwspec. But because you freed the master struct, the SMMUv3 driver has 
lost track of the device, while the common code might think it is still 
assigned and functional...

Should not we bail out immediately and return the error without freeing 
master or altering the protected state if arm_smmu_deassign_dev() fails?

Or am I missing something?



> +		dt_device_unset_protected(dev_to_dt(dev));
> +	}
> +
> +	arm_smmu_disable_pasid(master);
> +
> +	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
> +		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +out_free:
> +	xfree(master);
> +	dev_iommu_priv_set(dev, NULL);
> +	return ret;
> +}
> +
>   static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   {
>   	int i, ret;
> @@ -2867,6 +2925,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
>   	.add_device		= arm_smmu_add_device,
> +	.remove_device		= arm_smmu_remove_device,
>   };
>   
>   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 06d7643622..1f9608cdcd 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -305,6 +305,11 @@ static inline void dt_device_set_protected(struct dt_device_node *device)
>       device->is_protected = true;
>   }
>   
> +static inline void dt_device_unset_protected(struct dt_device_node *device)
> +{
> +    device->is_protected = false;
> +}

NIT: Rather than introducing new helper, it might be possible to update 
the existing helper to take a boolean: e.g., 
dt_device_set_protected(struct dt_device_node *device, bool protect).
But doing this would require updating existing callers, I am not sure if 
that broader refactoring is necessary, so your current unset approach is 
acceptable.


> +
>   static inline bool dt_device_is_protected(const struct dt_device_node *device)
>   {
>       return device->is_protected;


