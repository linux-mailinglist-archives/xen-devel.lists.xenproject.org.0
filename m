Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A828F437
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7396.19302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3ng-0002DI-92; Thu, 15 Oct 2020 14:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7396.19302; Thu, 15 Oct 2020 14:00:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT3ng-0002Cs-5h; Thu, 15 Oct 2020 14:00:12 +0000
Received: by outflank-mailman (input) for mailman id 7396;
 Thu, 15 Oct 2020 14:00:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpcQ=DW=amd.com=christian.koenig@srs-us1.protection.inumbo.net>)
 id 1kT3ne-0002Cl-QA
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:00:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b171dfc-b9eb-44f3-89c0-6a9ddbf1ae41;
 Thu, 15 Oct 2020 14:00:09 +0000 (UTC)
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 14:00:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 14:00:08 +0000
Received: from [192.168.137.56] (80.187.123.114) by
 AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Thu, 15 Oct 2020 14:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rpcQ=DW=amd.com=christian.koenig@srs-us1.protection.inumbo.net>)
	id 1kT3ne-0002Cl-QA
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:00:10 +0000
X-Inumbo-ID: 9b171dfc-b9eb-44f3-89c0-6a9ddbf1ae41
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown [40.107.92.77])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9b171dfc-b9eb-44f3-89c0-6a9ddbf1ae41;
	Thu, 15 Oct 2020 14:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrotYsJjeWOMiRBJ5xl+FV1qRNoMzKcJ1OP7AsXnDSWcsjQwegprSQ6NZjyTDAL1L2eMOuAVE/prj3rlDbWPXRmzf+kF/1kW8qsNGzsuGc5n58DCVzay87yn9U6wQMMAUvzMXLTRw+GasDbs3gOuAHXI7zStmO+ir1XgrTvh5o/NcOR/Ewna7/x4LfvWXhMqlZmd2UMA4DsSPAB7BZDZEMp0JHsMs2M3sPRyA8BIlcm2QP02DWo5siZjh2bwCeTDEkV3Um2PKZgtTNHhzqxcbsM1aM12CsEEGXJCn1xxFMwv/kpl5hfID2hhG77DjwSJJSuxsQn6tXPdctZBOXF/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY0ToQsC5k5lgdXyZsEcz+Mg0BHPMRMwcR+tXpbXx4A=;
 b=YyPKHwimVEGy341RD8VxK7/sj4nkelutvMMNgUe4clA3bW3o4ISYQP49jPgMhcgiEbWLziKoIT1G28d1A4OBQgDEklmdsXXEgyse5dNk1FlYNJ7/s8t6BOJV46xv2RuOWIHU9I7HucieJn4W7BqV+YoD4+AyFv3nGBTO23FZ5huPtEeqVU2T10cD/pHXlLqha0AVsT6yt4aoMQxeZjydsJsm70xuHF0DpyBOz/DZHlamKwMAEWK/MgEtQVlM9rfHd8ON3QmGLthHyDNcIbE68GSJ/8DyNNPiqFo8cGvWRICmSE9H/k22JurK5tlJ2eR4p8JV69I4u+ttqpB3FyFAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY0ToQsC5k5lgdXyZsEcz+Mg0BHPMRMwcR+tXpbXx4A=;
 b=uKtAvUqVZgTElsNEwYDKeRn16OpQfYsG2NOBID5VLUuXcNtsYHNZxLJtO7RE/dq1TeTwzBktkh9eUgGsDwc7XcJU9LT0LfEB7gUsKTebLCfNe42PDky9M2X31mp6VfR9oZngJeHltUsM4opPaxdxVoFgq/lYtI1iCyyQoYdbSPs=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 14:00:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 14:00:08 +0000
Subject: Re: [PATCH v4 03/10] drm/etnaviv: Remove empty
 etnaviv_gem_prime_vunmap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2a01560b-d7f7-e59e-cf71-50b36e0ee078@amd.com>
Date: Thu, 15 Oct 2020 15:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Thu, 15 Oct 2020 14:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 212df4cd-8a35-494f-accb-08d871129f11
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<MN2PR12MB4061D4F28C6CE95C8EA1CBBB83020@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sx09Pw1cjzdKnru49xflPAssGdo4mvXxQIo1KBjpidSpmoaHPvBxVHLHKuWwB90kY+LNLdeOJjeGxh4pG29Jiev+VyYs5jsjF7sIre6kC3p1p9sX9iIT3Q20LamIo9k6ZYygwkHSqUNjhcYS9W2Wbd8Ocd6/muMX2JEJY1Cz0Cj8L6vKKlmE9k5wR3EZ7t4tvadPzBY8BmwXoYlhZ7oE2RANAFuFhDE5Z/BAUFvZ/qnVqqlt/jk6o/YkZdRqTZjaJIR72hynJ0aflfZdfNNKsfEwn23cpYXLA5vObKHzMxja8PgsWSEcTgWoFLSNFfhBnKu+bQBGZCcYeyJygQYZuVF6XY20d5ZlIk94o9Qzx5MwoQ1XEIQEq99NMoLduCvd6oTHzvJivfoqM/3ba2keqGBnIqGGCyvjWNCNhIBPUnmxnd4BxZdYU0PPmPzCoGX2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(2906002)(2616005)(66556008)(66476007)(36756003)(83380400001)(52116002)(31686004)(8936002)(66946007)(7406005)(7416002)(8676002)(4326008)(34490700002)(16576012)(956004)(316002)(5660300002)(31696002)(6486002)(6666004)(86362001)(186003)(16526019)(478600001)(26005)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	lIj9WfLFMVEVu1L6IQjBPgqlEK8GWxN/L5KU1cZ94QY6UM2xZrbvMR3zX03N56XYrCVX9LGJHz1peLkHaQRk1LmBrhqi89YrGcWg77kuATWQd9aARfq+XN8Y8r+Nse0K/ERjc5OKC9BTcFtGLBgvC6C5ItrfAvzcSNzebmQJpTVUUYwGVJCrvVH/829r37FoDjB8ubN62hmjbVS5e9gmPuDaIPE0cdfMP5edJn5VLwmcmdsOqLEX3YzTxDBC0ct3IGN6s/JZxM6/soiNH8PNFiiQohBSQhIk3k7TO3dmycHI5GVwj8LObq9ZwEL6q1n+6w/5Xm3DsiUO0TvZW45uA6ImZ+Sr64Vs3hxBoPIX5Ezs7UfiqGVzbpzJLMtuYyIFDvpM+UIr0wZH0vcv5uie3wEXIMsaOfOsYXbrcM0gqjtEXeNIcnHfe9u2L6EtRDFDH99L9Q7rq+qU/EnP1O/bRORaxzamDnbFYllxUsNj8LNiiaadfQsKNhJm9L3D2MpmRiyU0llmrVds26SJVg4hJmbpLTZPDuKY1XU7aqsUyDry4uPNdoUKByurkYjaVWYim9kQdtkxdNOjsL6eiuhCrc1XHcAteukh2Csfb0GXZW9rLGw/lafIzVmbGyGG8mbOncDDO0gnCm9l2RWmJEjTow==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212df4cd-8a35-494f-accb-08d871129f11
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:00:07.1477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6pWEsmfeP4c6Y3uqcywYbYfrQlJ4351IJdGanvoxElYheMV7hkc0+Q74le5xvtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The function etnaviv_gem_prime_vunmap() is empty. Remove it before
> changing the interface to use struct drm_buf_map.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       | 1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 5 -----
>   3 files changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 914f0867ff71..9682c26d89bb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -52,7 +52,6 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>   int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
>   void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>   			   struct vm_area_struct *vma);
>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 67d9a2b9ea6a..bbd235473645 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -571,7 +571,6 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>   	.unpin = etnaviv_gem_prime_unpin,
>   	.get_sg_table = etnaviv_gem_prime_get_sg_table,
>   	.vmap = etnaviv_gem_prime_vmap,
> -	.vunmap = etnaviv_gem_prime_vunmap,
>   	.vm_ops = &vm_ops,
>   };
>   
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 135fbff6fecf..a6d9932a32ae 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -27,11 +27,6 @@ void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
>   	return etnaviv_gem_vmap(obj);
>   }
>   
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> -{
> -	/* TODO msm_gem_vunmap() */
> -}
> -
>   int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>   			   struct vm_area_struct *vma)
>   {


