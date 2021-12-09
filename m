Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D647346DF32
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 01:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242634.419626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv6v2-0005Yw-G5; Thu, 09 Dec 2021 00:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242634.419626; Thu, 09 Dec 2021 00:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv6v2-0005Wo-CY; Thu, 09 Dec 2021 00:04:16 +0000
Received: by outflank-mailman (input) for mailman id 242634;
 Thu, 09 Dec 2021 00:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OcP=Q2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mv6v0-0005Wh-H9
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 00:04:14 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897fc6e6-5883-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 01:04:12 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id l7so6452388lja.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 16:04:12 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n14sm376546lfu.285.2021.12.08.16.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 16:04:10 -0800 (PST)
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
X-Inumbo-ID: 897fc6e6-5883-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NwkfgwE4hFBKZOW6AEiviT1UwHpyhZyudjz2jFh5pGs=;
        b=X4vu2guvvme1GenhG1YxA9LNY4p/yipWtN9Kyoc4It4SP0xJ1KI2qumwOEyNJxOXnG
         xx9Sthx5uQTmF6bKpQPYEImtzJbZtBpL5ErzUi4f7OcjqEsMe/gkQXDLX2dEluE6hylE
         IF0MNaKpcZp4f0YgeDdXVjtG6HJkqsd8P8fVrTiYSWtvxILZJDrL5f099w3RbvObkiuS
         GDf7luj1TFhO4VAm7bq8e8sZzd3GzLN46ID/eoOD7TRrcYhyT4SMez+LOt5TgFsSBfYm
         tE4JJgXxiK184TA3/nzom1OShnA+mpRWR1KQFlwkQQ0+YivYT1V0sH5HbTpWWzYjzZvl
         WPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NwkfgwE4hFBKZOW6AEiviT1UwHpyhZyudjz2jFh5pGs=;
        b=TCNslf1GzIInIHMe+JPMl2vl4kiZR5nr2OqZJNDt8AvXK6rmIeXav8q4O9zodGFsV+
         XB3m3iM090KZR+c5XUWOgu4Px8rGraVSI7U5fnvOj4hZsySryxFiYHnp2faTeAg6Ex6P
         cvM/+413DTz//doRc/G1JxD/NZAXEnjkfAzXO3hDqkQdRC761Jj8Z558ADEZcf9IQ9eQ
         RqIvbQpYMm85X9OBzKh1y3F/LinAh9/mcmfzBZPlOCLvGGNE2sLhryLMekwOorHPYk0y
         xTYBY+qRtSzS/K4wJ+dPOTbrso9vuZIdWZ6SUhygdosbAhJw8Y0heynmHb7rYpmfStPk
         XBtQ==
X-Gm-Message-State: AOAM53219lcdW6g2dUlXZ4O1O6sbR06ATFU6Zmo+lMY7o+Bys8+QSBJu
	aTaVJtM2/3R8Pg6Sud8wFVg=
X-Google-Smtp-Source: ABdhPJyk013Xzz0RmSxuRkrQ663IkNcmRsJXkp7HTUtRcNHFgY5U5UOFwTjTh/OcCcBciYUb29C/uw==
X-Received: by 2002:a2e:bc1c:: with SMTP id b28mr2747279ljf.500.1639008250838;
        Wed, 08 Dec 2021 16:04:10 -0800 (PST)
Subject: Re: [PATCH V3 4/6] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2111241701240.1412361@ubuntu-linux-20-04-desktop>
 <c2e8c00a-3856-8330-8e8f-ab8a92e93e47@gmail.com>
 <alpine.DEB.2.22.394.2112071506370.4091490@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <50997667-7c6c-491d-ff04-11e093fee7f0@gmail.com>
Date: Thu, 9 Dec 2021 02:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2112071506370.4091490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 08.12.21 01:36, Stefano Stabellini wrote:


Hi Stefano

> On Thu, 25 Nov 2021, Oleksandr wrote:
>>>> Please note the following:
>>>> for V3 arch_xen_unpopulated_init() was moved to init() as was agreed
>>>> and gained __init specifier. So the target_resource is initialized there.
>>>>
>>>> With current patch series applied if CONFIG_XEN_UNPOPULATED_ALLOC
>>>> is enabled:
>>>>
>>>> 1. On Arm, under normal circumstances, the xen_alloc_unpopulated_pages()
>>>> won't be called “before” arch_xen_unpopulated_init(). It will only be
>>>> called "before" when either ACPI is in use or something wrong happened
>>>> with DT (and we failed to read xen_grant_frames), so we fallback to
>>>> xen_xlate_map_ballooned_pages() in arm/xen/enlighten.c:xen_guest_init(),
>>>> please see "arm/xen: Switch to use gnttab_setup_auto_xlat_frames() for DT"
>>>> for details. But in that case, I think, it doesn't matter much whether
>>>> xen_alloc_unpopulated_pages() is called "before" of "after"
>>>> target_resource
>>>> initialization, as we don't have extended regions in place the
>>>> target_resource
>>>> will remain invalid even after initialization, so
>>>> xen_alloc_ballooned_pages()
>>>> will be used in both scenarios.
>>>>
>>>> 2. On x86, I am not quite sure which modes use unpopulated-alloc (PVH?),
>>>> but it looks like xen_alloc_unpopulated_pages() can (and will) be called
>>>> “before” arch_xen_unpopulated_init().
>>>> At least, I see that xen_xlate_map_ballooned_pages() is called in
>>>> x86/xen/grant-table.c:xen_pvh_gnttab_setup(). According to the initcall
>>>> levels for both xen_pvh_gnttab_setup() and init() I expect the former
>>>> to be called earlier.
>>>> If it is true, the sentence in the commit description which mentions
>>>> that “behaviour on x86 is not changed” is not precise. I don’t think
>>>> it would be correct to fallback to xen_alloc_ballooned_pages() just
>>>> because we haven’t initialized target_resource yet (on x86 it is just
>>>> assigning it iomem_resource), at least this doesn't look like an expected
>>>> behaviour and unlikely would be welcome.
>>>>
>>>> I am wondering whether it would be better to move
>>>> arch_xen_unpopulated_init()
>>>> to a dedicated init() marked with an appropriate initcall level
>>>> (early_initcall?)
>>>> to make sure it will always be called *before*
>>>> xen_xlate_map_ballooned_pages().
>>>> What do you think?
>>     ... here (#2). Or I really missed something and there wouldn't be an issue?
> Yes, I see your point. Yeah, it makes sense to make sure that
> drivers/xen/unpopulated-alloc.c:init is executed before
> xen_pvh_gnttab_setup.
>
> If we move it to early_initcall, then we end up running it before
> xen_guest_init on ARM. But that might be fine: it looks like it should
> work OK and would also allow us to execute xen_xlate_map_ballooned_pages
> with target_resource already set.
>
> So I'd say go for it :)


Thank you for the confirmation! In order to be on the safe side, I would 
probably leave drivers/xen/unpopulated-alloc.c:init as is, I mean with 
current subsys initcall level (it expects the extra memory regions to be 
already filled)
and create a separate unpopulated_init() to put 
arch_xen_unpopulated_init() into. Something like the following:

static int __init unpopulated_init(void)
{
     int ret;

     if (!xen_domain())
         return -ENODEV;

     ret = arch_xen_unpopulated_init(&target_resource);
     if (ret) {
         pr_err("xen:unpopulated: Cannot initialize target resource\n");
         target_resource = NULL;
     }

     return ret;
}
early_initcall(unpopulated_init);




-- 
Regards,

Oleksandr Tyshchenko


