Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1285BAA2C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 12:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407912.650580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8TD-0002CU-Si; Fri, 16 Sep 2022 10:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407912.650580; Fri, 16 Sep 2022 10:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8TD-000294-PK; Fri, 16 Sep 2022 10:21:15 +0000
Received: by outflank-mailman (input) for mailman id 407912;
 Fri, 16 Sep 2022 10:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4qww=ZT=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oZ8TC-00028y-3S
 for xen-devel@lists.xen.org; Fri, 16 Sep 2022 10:21:14 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a24d0d8-35a9-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 12:21:13 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id z25so34860427lfr.2
 for <xen-devel@lists.xen.org>; Fri, 16 Sep 2022 03:21:13 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k28-20020a05651c10bc00b0025e00e0116esm3612372ljn.128.2022.09.16.03.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 03:21:11 -0700 (PDT)
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
X-Inumbo-ID: 4a24d0d8-35a9-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=unuENXp5XxWAMuOHE9gtvGUFk2dn9o6HiYCwiikE1MI=;
        b=Khpzc/tx42zQb/rh2bWodHFxgXN1ORuAODQnbikBmE5bck7kqwuaIAEoA3r7c/PqbF
         9kgy1Se9OonniSyuYYXOH5XaQXVAzLIRP5d2XsFsSPhgl0ZEfs6Dmn4NlLqxD0lsqZpO
         trbui6UTkGemwg58bsN3o4kpf+O/V0+HEDTr1nsSJJQjy9WYsyWjBnAeAwG2DTKZtszB
         fxB9fCeb0xIdIvU1AI0ObTg0lh+3pBEOfSbVYepZoiDZg3AtXJ4qZBncnOKoxhAPMMle
         yL0ItgG6MzY+aI3J73f/2Tw8A/CB9ur7XevM3N0fBam0UOss5SfZ08LQR9ST13Ht06iD
         gObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=unuENXp5XxWAMuOHE9gtvGUFk2dn9o6HiYCwiikE1MI=;
        b=Ov2aybMXDCRLAkFUXupoOcZXtaZ1fF/CQdzQhBhxFVkRpzxj2zLFAvdkP7EQOYivV8
         V4bj0G/UXpRnclQQahrmBwT2gt2UH9+Zj8K6TTTc+UvykDS8CL0woeuPeQv6be5D75Lw
         NOavnzWPvn00KZewflMvecSxS5h3bXCGv97/HKJDA8rBXhdiWe4yQ0hIb3p6+xaHubI8
         X2IhDNu8sksoHl+LcIjx1tUnneW59qRfFADIGoV/0WJAWGrZbiw50IE1+UQ111C8C7Yf
         0uYZgLeBlGe5FNk5yhEd94iRAOAOAbViPI6lg7T1ExbXX/eDIpEG8EIO9FZwybSFYn07
         e2cQ==
X-Gm-Message-State: ACrzQf0JCBVqFQjifIB/D1g6HfsTbg1nr3QK8H1Oq7BlGkCNaXFC2wU8
	akbJwrCaBZgOpagNcuzPdoE=
X-Google-Smtp-Source: AMsMyM7/GVIyLpzH4/iC12nMtxo5LEvGitMwdQQWmpdp70mof0Slz3FZfb65wgQtpR/PtKuwlxL8Bw==
X-Received: by 2002:a05:6512:38b2:b0:493:9a:ac2e with SMTP id o18-20020a05651238b200b00493009aac2emr1374758lft.126.1663323672293;
        Fri, 16 Sep 2022 03:21:12 -0700 (PDT)
Message-ID: <b2cff35d-3eb9-f746-01dd-c413de09d95b@gmail.com>
Date: Fri, 16 Sep 2022 13:21:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09.09.22 17:43, Viresh Kumar wrote:

Hello Viresh

> The iommu node will be required for other virtio device types too, not
> just disk device.
>
> Move the call to make_xen_iommu_node(), out of the disk device specific
> block and rename "iommu_created" variable to "iommu_needed", and set it
> to true for virtio disk device.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V6->V6.1:
> - Initialize iommu_needed at declaration time only.
> - Update comment.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>



>
>   tools/libs/light/libxl_arm.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 55aee15c10b4..fe1c92383dd6 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1157,7 +1157,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>       size_t fdt_size = 0;
>       int pfdt_size = 0;
>       libxl_domain_build_info *const info = &d_config->b_info;
> -    bool iommu_created;
> +    bool iommu_needed = false;
>       unsigned int i;
>   
>       const libxl_version_info *vers;
> @@ -1265,22 +1265,25 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>           if (d_config->num_pcidevs)
>               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>   
> -        iommu_created = false;
>           for (i = 0; i < d_config->num_disks; i++) {
>               libxl_device_disk *disk = &d_config->disks[i];
>   
>               if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> -                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
> -                    !iommu_created) {
> -                    FDT( make_xen_iommu_node(gc, fdt) );
> -                    iommu_created = true;
> -                }
> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                    iommu_needed = true;
>   
>                   FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
>                                              disk->backend_domid) );
>               }
>           }
>   
> +        /*
> +         * The iommu node should be created only once for all virtio-mmio
> +         * devices.
> +         */
> +        if (iommu_needed)
> +            FDT( make_xen_iommu_node(gc, fdt) );
> +
>           if (pfdt)
>               FDT( copy_partial_fdt(gc, fdt, pfdt) );
>   

-- 
Regards,

Oleksandr Tyshchenko


