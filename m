Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D173A5EA62
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 05:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911171.1317666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsZjE-0004Jt-1w; Thu, 13 Mar 2025 03:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911171.1317666; Thu, 13 Mar 2025 03:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsZjD-0004IE-VG; Thu, 13 Mar 2025 03:59:27 +0000
Received: by outflank-mailman (input) for mailman id 911171;
 Thu, 13 Mar 2025 03:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=js1q=WA=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1tsZjB-0004I8-Uq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 03:59:26 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 896de0f9-ffbf-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 04:59:19 +0100 (CET)
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 20:59:17 -0700
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 12 Mar 2025 20:59:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tsZij-00096K-1j;
 Thu, 13 Mar 2025 03:59:01 +0000
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
X-Inumbo-ID: 896de0f9-ffbf-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741838360; x=1773374360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYwKWE3qx6aAxxggYpyZsccNMSnGdzKXacMIEiXDO/w=;
  b=Ah+qiOtYPxCbVH5r1cPmipzBw+A75LVf48ll/KZUFzkh40RDaD6+8kKj
   NS3Hwie4tSVsto0QKg1jDGT94sGXpAdBxj1xy6zn7BlfvwaQwdbuMSCEI
   cDXCfHGXfkIQ+G0BjCL26GLdD9N8J3baXV5iKvJfltBsRa/a3lDHByPMQ
   mBTU8Lo/v5ssohiVzZy+U/FZTJpTk5ThRG1HXzh+Puj2KMOayWtW+BdPu
   XvBukeaqQeQeHAL6IjW/NLKDylpQV3MoVXvfagK/K7BQe6hV4UPczL+2G
   Z7UnWMjCgTvXsvDEmSBkbIkkkfVkurEv7Xj9dxx5Fl1bnOaWWKBrIVVOQ
   A==;
X-CSE-ConnectionGUID: V2Vm3EoMTy60BywgVmBl7A==
X-CSE-MsgGUID: KjhTUhDMRPadX4r+57yWww==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68294339"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="68294339"
X-CSE-ConnectionGUID: Jk/rBPr/R+CE+fsVXvv0Hg==
X-CSE-MsgGUID: rCVWNuURQ4Kucu2VbRCsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="121530505"
Date: Thu, 13 Mar 2025 11:58:50 +0800
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
Message-ID: <202503131309.ZzS9Tova-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131309.ZzS9Tova-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131309.ZzS9Tova-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:10:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2296:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: error: call to undeclared function 'drm_mode_size_dumb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
         |               ^
   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c:80:8: note: did you mean 'drm_mode_set_name'?
   include/drm/drm_modes.h:530:6: note: 'drm_mode_set_name' declared here
     530 | void drm_mode_set_name(struct drm_display_mode *mode);
         |      ^
   1 warning and 1 error generated.


vim +/drm_mode_size_dumb +80 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c

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

