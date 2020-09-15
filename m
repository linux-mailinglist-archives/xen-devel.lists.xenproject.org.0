Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCC26A865
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICZa-0002mh-Rf; Tue, 15 Sep 2020 15:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8SvQ=CY=amd.com=christian.koenig@srs-us1.protection.inumbo.net>)
 id 1kICZZ-0002mc-Qh
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:08:45 +0000
X-Inumbo-ID: 07f6c5f2-973a-4ace-ac95-fc63a90866d6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7eab::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f6c5f2-973a-4ace-ac95-fc63a90866d6;
 Tue, 15 Sep 2020 15:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUcNpo5fzb3JwwK0F942oTWh45NniLMZoGoYfx18U+KII72eKBob3HzhqHRckJbnsYy8IaZHa/n/tWED0Nm2tPGcRSUyQE7djlDrijJC9BoxobLmWxRBhLb1UqmUkhXgy/3WmVQ0jzDH1zrueK3iYPFGBSt8Y1x1wOvroMiCJLU4sYJcdki+ULyq1J2flrqJ7+YbaJkskCZs4mGbmGO/Q3Yx7wag2sg7oosNcSR2kujs3FQZDJl7BMeyaaGRWtCgJQfKCPzYpsEPr7L/HktdQo6ybnE6uNnLhTstHqUsMiK2Kdc+/tbhJzc74j5Ue1GTZ1Jmq6qepExtLp+J7M0kQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5uCNV14Y5+oxuB45JEb7dF0haf6FFXwOrSKO4I5r1M=;
 b=m43WwP43FOvu9Sm0tQVQ5iW4VVHojmBhWFbeASYIh44O0OtThl2Rl93orlBmtBljedDJ/UbZSnzEYL9Bu+CLYUpzVd6QM+KHAgeTtnW36viqcrbYJxTXMmNZ3P3UxvLjVGxYGdkOsTF/go0tEOsTMD5qULgwUgjDoWRvrtd4+QBYmhZNn+LSbz2R31Tiby79R3gp2C+FzMzhNXOHW7lfx6cPH2kvlpRT96fArkDnyLTK0mP/Ae/kxHoN6Q7oCyu6GgD8Noj8ZD9T+YiMFcyMOtT1R1L9QqUFMUd6kWEj6Ex7VuQfp8XhmgXfGKDryVmDbeplzITjUodDuOhKxYZyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5uCNV14Y5+oxuB45JEb7dF0haf6FFXwOrSKO4I5r1M=;
 b=uvoqfpRxta/vXsJXFE/V6/V+hDRU6w+cjrHsAAQvLpVVSF1WQg+w/qXVONScovvbZFUaP5afM1e9LW8o5aWuXFO1WAut8DzuVEAmOcfWdCc9VEGswDDmdntg0MNUghna7S1e3cJ4EAQ5GjimK+MCcLvIz6JlyYD0//Ap0E7zp7A=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 15:08:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 15:08:38 +0000
Subject: Re: [PATCH v2 12/21] drm/radeon: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-13-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4b6a97f2-6787-e727-d723-00fa35d6e67a@amd.com>
Date: Tue, 15 Sep 2020 17:08:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915145958.19993-13-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0079.eurprd07.prod.outlook.com
 (2603:10a6:207:6::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0079.eurprd07.prod.outlook.com (2603:10a6:207:6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.5 via Frontend Transport; Tue, 15 Sep 2020 15:08:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b21235c9-3b87-4bbc-3b4a-08d8598938ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125DAC29E711691DA35650B83200@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFwQBSYQJvriXtH4jYw1xxlsZ9NameSbLcnEu4Tuwz81gKQ5atGHV5uSILYOc96fXON7mQoH4at8JPoX+GnjDm8QPRJP03yJagISM+DhjiKXfvsFmFvkvHWAlc7z2EJinH5Uxt9q9CLlRHDHmPHAqCBcXZIFb6gJYBN7ow9ME0el9GwMCdIuyyYT+bkCJs+rucuhVWfdg49KgLeCQ9gdng69kif0zH8k8xfNAp+czYKmeu8qh6q5IxHYvKzo9ZyJYtaN1qk4jJdYTk4MI3VQ8fO+jro6SqyqtjYr+cpuuY7YygGmRD5qY23esd8TikocLkYIwN7JAlX2B9p3YwMuL/9kzfp/cINpajNaD6un4vXhTJXJppMhoFZFFef+uc7whvQm2/dJIRDST54jPfcjA1k6hmacNfoIH5+b+AuBzKdAQ6d0JH/Z6Ow9NbGpzNME
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(1191002)(4326008)(7416002)(7366002)(66574015)(83380400001)(186003)(7406005)(2616005)(36756003)(31686004)(316002)(31696002)(6666004)(8676002)(16526019)(2906002)(6486002)(66476007)(66556008)(478600001)(8936002)(86362001)(52116002)(5660300002)(66946007)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8CiufGiqhDTeP4EZXv+6HoHId8NRbG6zzdX81ctFuLi8NnPTkqKLL9u8yl4bd2/H3+XvCnOEmS03wdgzUkBiplMy0brhli9qTxGZ+Mc5MpLJQA943sD6kuYMHVDLLqX+E2m50F2G9zKaQq2ek1xdGoPOb9KLnlsW52poC7mt/cVCVAiHwXyQ2QroxSGBXzHSrOky1guDph6xbQ9VH1eRZ8nMZPWfTPuMrkeRP5LmF98Wl4Kviv65U6JnBY32LOMzwYrBxl7rc1Jnqi+i8aXrS1gyL1bU9aNgfzRxij8wIAluaArGfMqkMt1M8VI/0fTKf2xqOLN+Lbz5Fb1MhihWP8YSM+g/hilI9Suin0rv0VgklFIhyBa2wrzNKSRbFZ1OJGg7xudNvDd9P6dY2BAchmvR8oFXv5oapvdmhs8geYHEFWNrY1Cm8Q/vcrjArReKJ/HW3Tdqs/HhPLX/JMAA5N5mAybUDcviC+I9bcRqtRDqYbSn9l9fNbdZBD1mB/ZLqBgWYG0SCAb4hswC4wRqDK54xotxN1ydpNsvBYWbxPPDVREhZX64ewhRvJWgMH2JhkL+vxyQM86jLyp4UuOvRxywqsFznHRzv1XRPTGYHXjYZODUM4g4Yf2TTI7ZOKG+7b58lIMD0RzBq2/GfpnlJ3S7h0dWCiVsXe+QyCxNO3US3ESqS8mHeGeNMLl7auiGYB545qjIPCIYt534kbVvwg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21235c9-3b87-4bbc-3b4a-08d8598938ba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 15:08:37.7991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgQ4GzL7IGSFftfLEaFMbjQc3dl3Z1KJkpOYSKn9HXJ2CJQXGwiCyFzSthRSpEQl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in radeon.
>
> v2:
> 	* move object-function instance to radeon_gem.c (Christian)
> 	* set callbacks in radeon_gem_object_create() (Christian)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_drv.c | 23 +--------------------
>   drivers/gpu/drm/radeon/radeon_gem.c | 31 +++++++++++++++++++++++++----
>   2 files changed, 28 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 4cd30613fa1d..65061c949aee 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
>   int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
>   void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
>   irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
> -void radeon_gem_object_free(struct drm_gem_object *obj);
> -int radeon_gem_object_open(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
> -void radeon_gem_object_close(struct drm_gem_object *obj,
> -				struct drm_file *file_priv);
> -struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
> -					int flags);
>   extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int crtc,
>   				      unsigned int flags, int *vpos, int *hpos,
>   				      ktime_t *stime, ktime_t *etime,
> @@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>   int radeon_mode_dumb_create(struct drm_file *file_priv,
>   			    struct drm_device *dev,
>   			    struct drm_mode_create_dumb *args);
> -struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
>   struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
>   							struct dma_buf_attachment *,
>   							struct sg_table *sg);
> -int radeon_gem_prime_pin(struct drm_gem_object *obj);
> -void radeon_gem_prime_unpin(struct drm_gem_object *obj);
> -void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
> -void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   
>   /* atpx handler */
>   #if defined(CONFIG_VGA_SWITCHEROO)
> @@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
>   	}
>   
>   	ret = drm_ioctl(filp, cmd, arg);
> -	
> +
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);
>   	return ret;
> @@ -609,22 +597,13 @@ static struct drm_driver kms_driver = {
>   	.irq_uninstall = radeon_driver_irq_uninstall_kms,
>   	.irq_handler = radeon_driver_irq_handler_kms,
>   	.ioctls = radeon_ioctls_kms,
> -	.gem_free_object_unlocked = radeon_gem_object_free,
> -	.gem_open_object = radeon_gem_object_open,
> -	.gem_close_object = radeon_gem_object_close,
>   	.dumb_create = radeon_mode_dumb_create,
>   	.dumb_map_offset = radeon_mode_dumb_mmap,
>   	.fops = &radeon_driver_kms_fops,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = radeon_gem_prime_export,
> -	.gem_prime_pin = radeon_gem_prime_pin,
> -	.gem_prime_unpin = radeon_gem_prime_unpin,
> -	.gem_prime_get_sg_table = radeon_gem_prime_get_sg_table,
>   	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
> -	.gem_prime_vmap = radeon_gem_prime_vmap,
> -	.gem_prime_vunmap = radeon_gem_prime_vunmap,
>   
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index e5c4271e64ed..0ccd7213e41f 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -35,7 +35,17 @@
>   
>   #include "radeon.h"
>   
> -void radeon_gem_object_free(struct drm_gem_object *gobj)
> +struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
> +					int flags);
> +struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
> +int radeon_gem_prime_pin(struct drm_gem_object *obj);
> +void radeon_gem_prime_unpin(struct drm_gem_object *obj);
> +void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
> +void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +
> +static const struct drm_gem_object_funcs radeon_gem_object_funcs;
> +
> +static void radeon_gem_object_free(struct drm_gem_object *gobj)
>   {
>   	struct radeon_bo *robj = gem_to_radeon_bo(gobj);
>   
> @@ -85,6 +95,7 @@ int radeon_gem_object_create(struct radeon_device *rdev, unsigned long size,
>   		return r;
>   	}
>   	*obj = &robj->tbo.base;
> +	(*obj)->funcs = &radeon_gem_object_funcs;
>   	robj->pid = task_pid_nr(current);
>   
>   	mutex_lock(&rdev->gem.mutex);
> @@ -146,7 +157,7 @@ void radeon_gem_fini(struct radeon_device *rdev)
>    * Call from drm_gem_handle_create which appear in both new and open ioctl
>    * case.
>    */
> -int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv)
> +static int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv)
>   {
>   	struct radeon_bo *rbo = gem_to_radeon_bo(obj);
>   	struct radeon_device *rdev = rbo->rdev;
> @@ -176,8 +187,8 @@ int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_pri
>   	return 0;
>   }
>   
> -void radeon_gem_object_close(struct drm_gem_object *obj,
> -			     struct drm_file *file_priv)
> +static void radeon_gem_object_close(struct drm_gem_object *obj,
> +				    struct drm_file *file_priv)
>   {
>   	struct radeon_bo *rbo = gem_to_radeon_bo(obj);
>   	struct radeon_device *rdev = rbo->rdev;
> @@ -216,6 +227,18 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
>   	return r;
>   }
>   
> +static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
> +	.free = radeon_gem_object_free,
> +	.open = radeon_gem_object_open,
> +	.close = radeon_gem_object_close,
> +	.export = radeon_gem_prime_export,
> +	.pin = radeon_gem_prime_pin,
> +	.unpin = radeon_gem_prime_unpin,
> +	.get_sg_table = radeon_gem_prime_get_sg_table,
> +	.vmap = radeon_gem_prime_vmap,
> +	.vunmap = radeon_gem_prime_vunmap,
> +};
> +
>   /*
>    * GEM ioctls.
>    */


