Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B401A5E9B2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 03:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911110.1317636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsY7I-00062m-Ht; Thu, 13 Mar 2025 02:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911110.1317636; Thu, 13 Mar 2025 02:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsY7I-0005zd-DC; Thu, 13 Mar 2025 02:16:12 +0000
Received: by outflank-mailman (input) for mailman id 911110;
 Thu, 13 Mar 2025 02:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=js1q=WA=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1tsY7G-0005zE-Gu
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 02:16:10 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1946fcf3-ffb1-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 03:15:59 +0100 (CET)
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 19:15:55 -0700
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2025 19:15:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tsY6V-000936-1q;
 Thu, 13 Mar 2025 02:15:25 +0000
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
X-Inumbo-ID: 1946fcf3-ffb1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741832159; x=1773368159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=96yJDyEP9BeK2cVK+9MUvmIHjdk7wR1LKgFfN3+p/fM=;
  b=G84TJZqugmG+cV2GRcJA7EejKnBYR0pjZP90LE3ccCKyLv7KBMjaqMhT
   zVyk6YCI7/tO/kZudICx5EWKOU8VFx0QCVGx5L3CuJ76G0PITa9edoetv
   mMWkWT8igplhb4JK89C3yZQjYiC4E++NwaFZrtom6s39asJ2hFoWXJldS
   IJPboUJQDhd20UjYrQM07NK1jNM0XDh9XdbJ6eJCQmXjxV2RWQVmj+8C7
   N/+28tnoc5sAAJWmWDPlr9uoN/vQ20hE/oBit76ULEIs+X0MxL/7lX2fC
   xP8m09RAkhpzLJrNYEKm2pUeK41EilJiXvYZAELNVLYqeF240+Vs/QqOp
   A==;
X-CSE-ConnectionGUID: oWo7LnZuT5mMfSAKkZt4uw==
X-CSE-MsgGUID: 57E4IgZzQmy3qr9zjwvqKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43038844"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43038844"
X-CSE-ConnectionGUID: KHahmpZOTNOqvrR+C7Song==
X-CSE-MsgGUID: H65afRTcQ5CspG2G7V7fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125887063"
Date: Thu, 13 Mar 2025 10:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
	airlied@gmail.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <202503130956.VyNIuYfU-lkp@intel.com>
References: <20250311155120.442633-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311155120.442633-19-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250311]
[also build test ERROR on v6.14-rc6]
[cannot apply to drm-exynos/exynos-drm-next rockchip/for-next tegra/for-next drm-xe/drm-xe-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-dumb-buffers-Sanitize-output-on-errors/20250311-235818
base:   next-20250311
patch link:    https://lore.kernel.org/r/20250311155120.442633-19-tzimmermann%40suse.de
patch subject: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
config: powerpc64-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130956.VyNIuYfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130956.VyNIuYfU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c: In function 'rzg2l_du_dumb_create':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:15: error: implicit declaration of function 'drm_mode_size_dumb'; did you mean 'drm_mode_set_name'? [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^~~~~~~~~~~~~~~~~~
         |               drm_mode_set_name


vim +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

    70	
    71	/* -----------------------------------------------------------------------------
    72	 * Frame buffer
    73	 */
    74	
    75	int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
    76				 struct drm_mode_create_dumb *args)
    77	{
    78		int ret;
    79	
  > 80		ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
    81		if (ret)
    82			return ret;
    83	
    84		return drm_gem_dma_dumb_create_internal(file, dev, args);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

