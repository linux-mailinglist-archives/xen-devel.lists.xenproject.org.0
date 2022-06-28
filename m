Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C897055EAF7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 19:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357335.585828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6EwC-0007Zc-B5; Tue, 28 Jun 2022 17:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357335.585828; Tue, 28 Jun 2022 17:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6EwC-0007Wg-81; Tue, 28 Jun 2022 17:23:44 +0000
Received: by outflank-mailman (input) for mailman id 357335;
 Tue, 28 Jun 2022 17:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dqK=XD=gmail.com=mykyta.poturai@srs-se1.protection.inumbo.net>)
 id 1o6EwA-0007Wa-Pz
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 17:23:42 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dee8506-f707-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 19:23:41 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so5471467wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 10:23:41 -0700 (PDT)
Received: from localhost.localdomain ([193.151.14.160])
 by smtp.gmail.com with ESMTPSA id
 23-20020a05600c22d700b003a018e43df2sm141882wmg.34.2022.06.28.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 10:23:40 -0700 (PDT)
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
X-Inumbo-ID: 0dee8506-f707-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4tneAeCsW+HKHp2Ra436gYhCNjMs8eKFMJflioWagLg=;
        b=UVJh50jeXi3ynm7vy//IU0gNPod8XYwZACWGV4upusrrtXtJy2qO591IMxoGWkFFbn
         ZPzK1FvgsIDLarA+WO1KvIUzM+mWRsLEuamDrH4f/dw9rpraFkVOaUJu/On3SqtDdAeD
         KZaqX9QmwxuKBbJoQ4oTYaUP6TsY/ixwBWZpoPmqV49Zlq6JvjU9YkK8O9VmNY4sqUDx
         jlft9v8BECI5vA6DUNQ74xWm5Wij+TZecOqSSKqLN4SpG+Y1vr7EQx17RhH51shlLxBS
         RfG3kuB0Ai2bvfpVsSDVxukurgIGnniuZsLQ2NBlJEDleMDszRGGqB7iqg+3F34HPnvC
         8zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4tneAeCsW+HKHp2Ra436gYhCNjMs8eKFMJflioWagLg=;
        b=IMrd8ovn9t9Xkgge6/+OV86cUAHm8RjGLCkt0wLi27cSe1vgj7M0BVOuDTMe+8PX7Q
         f41qVKfQ29uC1ps9DgGjzsDcl2DkHpPGWX8/SvgRO4VJVoZ6EoSNPzOTz/0ePxSh0gJo
         kIuvtTCMmdiNv5ZQUkl9X+54eZ3S2ae9xMP5vwYxeyVx6RjwJLcHP2prNRD5XjT9jTg1
         +J3jvCXFkSudB7FxOgQsHkJVC5SKgVZcKbLYZhRY8HTJfFXcbtvroaLTmRJDyUlLzVee
         Tglon6nXBAc4u1RlFMPpX1swsxzfa/2WyZsFPcw2SikejvPY2W2xYBHoYlrfi4XLnnmY
         fMyw==
X-Gm-Message-State: AJIora82mH7RMikMDvV+mHjhb5jYzA7mgsYzYSPl6jUsF0tOMOZIQIwl
	fDj801gMeEmptS9Dw6ZCmpI=
X-Google-Smtp-Source: AGRyM1tmVix0KCegYBu28Sh8t+SjyRyzffMIoJRxb68cLY45x3AhXLViwu3qT6R8ytfmvjQudjptCQ==
X-Received: by 2002:a7b:c242:0:b0:3a0:3ba5:81fd with SMTP id b2-20020a7bc242000000b003a03ba581fdmr752171wmj.47.1656437020892;
        Tue, 28 Jun 2022 10:23:40 -0700 (PDT)
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
Date: Tue, 28 Jun 2022 20:23:38 +0300
Message-Id: <20220628172338.1637121-1-mykyta_poturai@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
References: <0A58139F-CA6F-4E18-B44A-2066AEF0C8F6@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Hi Mykyta,
> 
>> On 21 Jun 2022, at 10:38 am, Mykyta Poturai <mykyta.poturai@gmail.com> wrote:
>> 
>>> Thanks for testing the patch.
>>>> But not fixed the "Unexpected Global fault" that occasionally happens when destroying
>>>> the domain with an actively working GPU. Although, I am not sure if this issue
>>>> is relevant here.
>>> 
>>> Can you please if possible share the more details and logs so that I can look if this issue is relevant here ?
>> 
>> So in my setup I have a board with IMX8 chip and 2 core Vivante GPU. GPU is split between domains.
>> One core goes to Dom0 and one to DomU.
>> 
>> Steps to trigger this issue:
>> 1. Start DomU
>> 2. Start wayland and glmark2-es2-wayland inside DomU
>> 3. Destroy DomU
>> 
>> Sometimes it destroys fine but roughly 1 of 8 times I get logs like this:
>> 
>> root@dom0:~# xl dest DomU
>> [12725.412940] xenbr0: port 1(vif8.0) entered disabled state
>> [12725.671033] xenbr0: port 1(vif8.0) entered disabled state
>> [12725.689923] device vif8.0 left promiscuous mode
>> [12725.696736] xenbr0: port 1(vif8.0) entered disabled state
>> [12725.696989] audit: type=1700 audit(1616594240.068:39): dev=vif8.0 prom=0 old_prom=256 auid=4294967295 uid=0 gid=0 ses=4294967295
>> (XEN) smmu: /iommu@51400000: Unexpected global fault, this could be serious
>> (XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GFSYNR1 0x00001055, GFSYNR2 0x00000000
>> 
>> My guess is that this happens because GPU continues to access memory when the context is already invalidated,
>> and therefore triggers the "Invalid context fault".
> 
> Yes you are right in this case GPU trying to do DMA operation after Xen destroyed the guest and configures
> the S2CR type value to fault. Solution to this issue is the patch that I shared earlier.
> 
> You can try this patch and confirm.This patch will solve both the issues.
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 5cacb2dd99..ff1b73d3d8 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1680,6 +1680,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> if (!cfg)
> return -ENODEV;
> 
> + ret = arm_smmu_master_alloc_smes(dev);
> + if (ret)
> + return ret;
> +
> return arm_smmu_domain_add_master(smmu_domain, cfg);
> }
> 
> @@ -2075,7 +2079,7 @@ static int arm_smmu_add_device(struct device *dev)
> iommu_group_add_device(group, dev);
> iommu_group_put(group);
> 
> - return arm_smmu_master_alloc_smes(dev);
> + return 0;
> }
> 
> 
> Regards,
> Rahul

Hi Rahul,

With this patch I get the same results, here is the error message:

(XEN) smmu: /iommu@51400000: Unexpected global fault, this could be serious
(XEN) smmu: /iommu@51400000:    GFSR 0x00000001, GFSYNR0 0x00000004, GFSYNR1 0x00001055, GFSYNR2 0x00000000

Regards,
Mykyta

