Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CABB40BF4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107166.1457690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUkq-0007la-TH; Tue, 02 Sep 2025 17:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107166.1457690; Tue, 02 Sep 2025 17:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUkq-0007iS-QI; Tue, 02 Sep 2025 17:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1107166;
 Tue, 02 Sep 2025 17:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utUkp-0007iM-Ik
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:25:11 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6828326-8821-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 19:25:09 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so51299725e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 10:25:09 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7f14bbsm209450565e9.8.2025.09.02.10.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 10:25:08 -0700 (PDT)
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
X-Inumbo-ID: c6828326-8821-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756833909; x=1757438709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFjgMDmRG0RvRn8jcxfZJppN4ti5avtqPxOHumOTe34=;
        b=AxiX6wuRNHqKD9Zz7xyuIWvQXXKZoLsjdGAkgSiSlHm5q0w1wkHkSUWqpsu5d/LkIF
         44Y6oKYebpN2v6WKTQg8jbYmfEOdm0i18UDv5AXm6mM82vthGWC0xIfW3OUxA3y82PeQ
         ikfEpksNWFadR6cvSoBpICsC1FaxJS+aTF2jGAscKMUkizUkyKbskD0n2yN57jfmPLT/
         phWtRgPKq8IPQ2xTLunsmXisw94B3qYew5XCnvWHj8G/oX8qDisxsU6tQt0ibFYyHZxS
         1EUJub3lg76e3EYYS5OkYU1c7QzZNatlpdE55Vfo64rsLkYhSjyEGNyKOHQtTb8+nOhr
         6G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756833909; x=1757438709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFjgMDmRG0RvRn8jcxfZJppN4ti5avtqPxOHumOTe34=;
        b=SdPkVjqXRewjm7D8u6x3R3rUsNPOiSOuBBLruwQxTUfo052sOu2lHf1RmuwZ8dZOmW
         UDVi9u7qNJDOuo+HnvPfH7mhhCzla6a5iGwRqOR3UsrGyPpfMCTFajd2XB/2Md8thYju
         qzRK8Ue3/UA9m2F3OY0yvL6WvB7gfwhpFPW7uGvVqOEGiAEscntqd+Q/uKjb36nx95fx
         x4xVxX2rGFauqo0HMu1nwvvG9MCCILr+Dl1RfBjldOtU9fBoulDnT0ieF/K0FJcgdDMr
         an6VYjSYgIn7W07sNw6N3I/pA+aMo+SED4F+Nzsd/6p0F9MyMnga/yrl2TOANZ8YG2mm
         smsA==
X-Forwarded-Encrypted: i=1; AJvYcCXVrdAt9zyP4CXHLoNytfURiWtF9/pVxi7AdiMBkY2TZJ17X3S+Lwh/OfsB4VCJpL6f0Hu63Y8cKvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/5JHyvUoyPKdAVtPbEqMs+0NASwA98cg9ti9mfCw1zUT/eO4a
	nK1tqDfWr5pNqGhWtMHgdBti+swTbaMNQs5aIdgJ1gQVx8X7CZvhOmoA
X-Gm-Gg: ASbGncsl0b63NDB3fKvMGTRRy8cs2P6fkmnTMlAhx+dPcnqG+NQynVC2pbTYsNhwp52
	1w/AFF0cIzTqoQCD+UkBMwApTrLc36ewlgphzen7FeEH0s0UYRepwuqwdOxyZU3IGTDeqgogRme
	f4QC2PqqHrtvCXQMyp8wfHZyb2Q5yg4sYAYXfxHAt1kSrxlvp+/fszh4TUTPThK0/217vKFLzkD
	SDgMMoMxDg0eN03jdctGFKeWxZjUk4BGD0vOoxevUkg2QvkzEmRWHmPoNom5ntroq4C81n1PZL5
	AWQc9Lx+ZObDzlYvIg+cAdj5xMSoevRXesGiNkLN2lbUGiUX7RicWUBI0nVr2PiA/ipd0AvX6C3
	FMQgdPdrRnDD3zdubqsrkPpwVwdC119a5DM7KsEMPvoKnt7/xPAU2mvI=
X-Google-Smtp-Source: AGHT+IFewne8udaKZi5O5/EHGdS+V0zqJrzJR87cN4IA6CbDt357R4s6zA5Xykz0pM/djQQI0WckbA==
X-Received: by 2002:a05:600c:1d24:b0:45b:581c:ad0d with SMTP id 5b1f17b1804b1-45b85550679mr106806015e9.8.1756833908757;
        Tue, 02 Sep 2025 10:25:08 -0700 (PDT)
Message-ID: <361a7a79-a11c-4c35-a688-0937e9d65fcf@gmail.com>
Date: Tue, 2 Sep 2025 20:25:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/13] xen/arm: Suspend/resume IOMMU on Xen
 suspend/resume
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.09.25 01:10, Mykola Kvach wrote:

Hello Mykola

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is done using generic iommu_suspend/resume functions that cause
> IOMMU driver specific suspend/resume handlers to be called for enabled
> IOMMU (if one has suspend/resume driver handlers implemented).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V6:
> - Drop iommu_enabled check from host system suspend.

I do not have any comments for the updated version, thanks.


> ---
>   xen/arch/arm/suspend.c                | 11 +++++++++++
>   xen/drivers/passthrough/arm/smmu-v3.c | 10 ++++++++++
>   xen/drivers/passthrough/arm/smmu.c    | 10 ++++++++++
>   3 files changed, 31 insertions(+)
> 
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 35b20581f1..f3a3b831c5 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -5,6 +5,7 @@
>   
>   #include <xen/console.h>
>   #include <xen/cpu.h>
> +#include <xen/iommu.h>
>   #include <xen/llc-coloring.h>
>   #include <xen/sched.h>
>   #include <xen/tasklet.h>
> @@ -62,6 +63,13 @@ static void cf_check system_suspend(void *data)
>   
>       time_suspend();
>   
> +    status = iommu_suspend();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_time;
> +    }
> +
>       console_start_sync();
>       status = console_suspend();
>       if ( status )
> @@ -118,6 +126,9 @@ static void cf_check system_suspend(void *data)
>       console_resume();
>       console_end_sync();
>   
> +    iommu_resume();
> +
> + resume_time:
>       time_resume();
>   
>    resume_nonboot_cpus:
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 81071f4018..f887faf7dc 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2854,6 +2854,13 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   	xfree(xen_domain);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static int arm_smmu_suspend(void)
> +{
> +	return -ENOSYS;
> +}
> +#endif
> +
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.page_sizes		= PAGE_SIZE_4K,
>   	.init			= arm_smmu_iommu_xen_domain_init,
> @@ -2866,6 +2873,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
>   	.add_device		= arm_smmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +	.suspend		= arm_smmu_suspend,
> +#endif
>   };
>   
>   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 22d306d0cb..45f29ef8ec 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
>   	xfree(xen_domain);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +static int arm_smmu_suspend(void)
> +{
> +	return -ENOSYS;
> +}
> +#endif
> +
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>       .page_sizes = PAGE_SIZE_4K,
>       .init = arm_smmu_iommu_domain_init,
> @@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>       .map_page = arm_iommu_map_page,
>       .unmap_page = arm_iommu_unmap_page,
>       .dt_xlate = arm_smmu_dt_xlate_generic,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend = arm_smmu_suspend,
> +#endif
>   };
>   
>   static struct arm_smmu_device *find_smmu(const struct device *dev)


