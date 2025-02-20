Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE41A3D613
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893758.1302620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3UA-0000WP-5E; Thu, 20 Feb 2025 10:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893758.1302620; Thu, 20 Feb 2025 10:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl3UA-0000Te-2e; Thu, 20 Feb 2025 10:08:50 +0000
Received: by outflank-mailman (input) for mailman id 893758;
 Thu, 20 Feb 2025 10:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Om1W=VL=intel.com=matthew.auld@srs-se1.protection.inumbo.net>)
 id 1tl3U9-0000TY-8p
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 10:08:49 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a935b597-ef72-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 11:08:43 +0100 (CET)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:08:40 -0800
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.161])
 ([10.245.244.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:08:36 -0800
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
X-Inumbo-ID: a935b597-ef72-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740046123; x=1771582123;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qEEkaGFEKdByIXhxlRz4s/blmxr0i3FKT7WWs7RYcVE=;
  b=EwFEvfHyCu+tVZ+WzXGjkOp9lvvE/eI1aj+N40NxtJ5DSmqpHtXIU8sk
   s3YZokWW+XODhOuAdCA9a/LdozLPFd6xO7RsiIypT9CxAXUWqcaeKJNIK
   2Mnu+is79jhFHapwNazGmJ4ntxE9w6/EW52l4UoWqtU13M/vQ7DJ6msqC
   Hr7h4vmIycFk045CIzDhvoIDsYBMHtfOuMKMSIAoadOyP4MvjuQUm8SS1
   zKy88TMKIv0ona7Tk5TqzftdlUwgqtC06oMYlhA9kn+O8Q/E3JQrHJmJE
   sVT3SdACJocslNI7MF7NnDyzU2Rd+25onYHjcheeKPZZzUal+j9lzauMT
   w==;
X-CSE-ConnectionGUID: cOcf3S9LQ3idlb7+cHSeTA==
X-CSE-MsgGUID: ZL5M36o2Q4mpZV3cLm4uCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44734926"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44734926"
X-CSE-ConnectionGUID: UUemawqKTUWXKRiDeorKDQ==
X-CSE-MsgGUID: hc9L0Du1SByRgSK2VuJbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120221268"
Message-ID: <92c1b182-5a0b-4d13-9b16-172ac970b62e@intel.com>
Date: Thu, 20 Feb 2025 10:08:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250218142542.438557-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/02/2025 14:23, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Xe's internal calculation allowed for 64-bit wide buffer sizes, but
> the ioctl's internal checks always verified against 32-bit wide limits.
> Hance, it is safe to limit the driver code to 32-bit calculations as
> well.
> 
> v3:
> - mention 32-bit calculation in commit description (Matthew)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 78d09c5ed26d..b34f446ad57d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -9,6 +9,7 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2672,14 +2673,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_bo *bo;
>   	uint32_t handle;
> -	int cpp = DIV_ROUND_UP(args->bpp, 8);
>   	int err;
>   	u32 page_size = max_t(u32, PAGE_SIZE,
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>   
> -	args->pitch = ALIGN(args->width * cpp, 64);
> -	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> -			   page_size);
> +	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,


