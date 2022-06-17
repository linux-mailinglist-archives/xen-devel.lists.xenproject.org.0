Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2C54F687
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 13:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351327.577950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29x8-0003gz-UB; Fri, 17 Jun 2022 11:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351327.577950; Fri, 17 Jun 2022 11:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29x8-0003eK-Pr; Fri, 17 Jun 2022 11:15:50 +0000
Received: by outflank-mailman (input) for mailman id 351327;
 Fri, 17 Jun 2022 11:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XzG5=WY=gmail.com=mykyta.poturai@srs-se1.protection.inumbo.net>)
 id 1o29x6-0003eE-OD
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 11:15:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d668b18e-ee2e-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 13:15:47 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so2226657wms.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jun 2022 04:15:47 -0700 (PDT)
Received: from localhost.localdomain (93.75.52.3.lut.volia.net. [93.75.52.3])
 by smtp.gmail.com with ESMTPSA id
 c130-20020a1c3588000000b0039c798b2dc5sm8916790wma.8.2022.06.17.04.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 04:15:46 -0700 (PDT)
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
X-Inumbo-ID: d668b18e-ee2e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1e/KU6OMq50U31RovHeE60PE1VWI/UwnSnAHJHKnsI=;
        b=AVw+QeA+wDP5Mm7Xu9KAd/7gIohZeyU54lCJjD4oCvPiRYBgR2z/kn2iQ+PmyN8jDI
         mLRwSi3bK3ZlyoRsiBCru1qH8offOAn857LGmor5gaKDsp9UlxHmt1CCXaKQa/YI4xqN
         DxKksRzLMO2Sn6QCGXFwOiqsM6oT2e4AAgXI6Z8pzxIbo/Iu3bsRQkFCSiNma4OCKBE8
         huTYVuzY5dpN062SPhMl2iUpp28jTbWyhA7V25D2K8nGXzUww2o5GMJWHrzFbUTU+jOy
         ElJcf4BxPL2tT2XML+WHuUtTC1qwyJksFt6esrBWbzXq2NHiyMZa5ViECV5pFma1AL0m
         fFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1e/KU6OMq50U31RovHeE60PE1VWI/UwnSnAHJHKnsI=;
        b=qieZh3C4FfvEXpVoK24oodNpvqfhLAYUMqA4jrOGdMwuYnTspjbzjJCtN/7/BM4BAO
         St8v8Atktf1ofLSDHK0V9WWE02pDRGxs69wDAOPl2s7AmC36WsYVIExw76L5ukTn0FOL
         k9V5Vu5j0BJP6dU8bJFQ5Av2YcqW/MoLIKQIWqZDL0M/uBD62cNSieGkXenQiYABX01W
         cC2Wtj7THx5Y3ZiZnuXqFIwgG2L558/h0zusd0bDz28SwQtrM/SQzYXe0x2fI04WzD0s
         BZW0YO9ImAEf0dhcU953Bk73k8yl644HQGlAs5slYU34+Ml+MyCHXBKRMmuJxUp9dafP
         B32A==
X-Gm-Message-State: AJIora+P3Gy1txDfu8NewDuhuzlHT0HGAWSuMeBlpLVs2GG+qKZQNhGu
	RiqndCYvKbeDQwrVIFezrjg=
X-Google-Smtp-Source: AGRyM1tsQ7yfIic8PadfBShaFR23UPpDPEKz7X6C3Us1CHpmAXomoJFowkCkaFGNshPEWCzFilx1KQ==
X-Received: by 2002:a05:600c:4fc6:b0:39c:9417:a8bf with SMTP id o6-20020a05600c4fc600b0039c9417a8bfmr9577803wmq.26.1655464547039;
        Fri, 17 Jun 2022 04:15:47 -0700 (PDT)
From: Mykyta Poturai <mykyta.poturai@gmail.com>
X-Google-Original-From: Mykyta Poturai <mykyta_poturai@epam.com>
To: rahul.singh@arm.com
Cc: Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	julien@xen.org,
	mykyta.poturai@gmail.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a device
Date: Fri, 17 Jun 2022 14:15:44 +0300
Message-Id: <20220617111544.205861-1-mykyta_poturai@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <029EEEE1-69E1-42A9-90D3-BEC18CD5B7BC@arm.com>
References: <029EEEE1-69E1-42A9-90D3-BEC18CD5B7BC@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Hi Mykyta,
> 
>> On 16 Jun 2022, at 8:48 am, Mykyta Poturai <mykyta.poturai@gmail.com> wrote:
>> 
>> Hi Julien, Rahul
>> I've encountered a similar problem with IMX8 GPU recently. It wasn't probing
>> properly after the domain reboot.  After some digging, I came to the same
>> solution as Rahul and found this thread. I also encountered the occasional
>> "Unexpected global fault, this could be serious" error message when destroying
>> a domain with an actively-working GPU.
>> 
>>> Hmmmm.... Looking at the code, arm_smmu_alloc_smes() doesn't seem to use
>>> the domain information. So why would it need to be done every time it is assigned?
>> Indeed after removing the arm_smmu_master_free_smes() call, both reboot and global
>> fault issues are gone. If I understand correctly, device removing is not yet
>> supported, so I can't find a proper place for the arm_smmu_master_free_smes() call.
>> Should we remove the function completely or just left it commented for later or
>> something else?
>> 
>> Rahul, are you still working on this or could I send my patch?
> 
> Yes, I have this on my to-do list but I was busy with other work and it got delayed. 
> 
> I created another solution for this issue, in which we don’t need to call arm_smmu_master_free_smes() 
> in arm_smmu_detach_dev() but we can configure the s2cr value to type fault in detach function.
> 
> Will call new function arm_smmu_domain_remove_master() in detach function that will revert the changes done 
> by arm_smmu_domain_add_master()  in attach function.
> 
> I don’t have any board to test the patch. If it is okay, Could you please test the patch and let me know the result.
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 69511683b4..da3adf8e7f 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1598,21 +1598,6 @@ out_err:
>         return ret;
>  }
>  
> -static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)
> -{
> -    struct arm_smmu_device *smmu = cfg->smmu;
> -       int i, idx;
> -       struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
> -
> -       spin_lock(&smmu->stream_map_lock);
> -       for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
> -               if (arm_smmu_free_sme(smmu, idx))
> -                       arm_smmu_write_sme(smmu, idx);
> -               cfg->smendx[i] = INVALID_SMENDX;
> -       }
> -       spin_unlock(&smmu->stream_map_lock);
> -}
> -
>  static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>                                       struct arm_smmu_master_cfg *cfg)
>  {
> @@ -1635,6 +1620,20 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>         return 0;
>  }
>  
> +static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
> +                                     struct arm_smmu_master_cfg *cfg)
> +{
> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
> +       struct arm_smmu_s2cr *s2cr = smmu->s2crs;
> +       struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
> +       int i, idx;
> +
> +       for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
> +               s2cr[idx] = s2cr_init_val;
> +               arm_smmu_write_s2cr(smmu, idx);
> +       }
> +}
> +
>  static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  {
>         int ret;
> @@ -1684,10 +1683,11 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  
>  static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
>  {
> +       struct arm_smmu_domain *smmu_domain = domain->priv;
>         struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
>  
>         if (cfg)
> -               arm_smmu_master_free_smes(cfg);
> +               return arm_smmu_domain_remove_master(smmu_domain, cfg);
>  
>  }
> 
> Regards,
> Rahul

Hello Rahul,

For me, this patch fixed the issue with the GPU not probing after domain reboot.
But not fixed the "Unexpected Global fault" that occasionally happens when destroying
the domain with an actively working GPU. Although, I am not sure if this issue
is relevant here.

Regards,
Mykyta

