Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6139AF942
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 07:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825630.1239903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4D91-0003EC-42; Fri, 25 Oct 2024 05:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825630.1239903; Fri, 25 Oct 2024 05:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4D91-0003CH-0r; Fri, 25 Oct 2024 05:45:55 +0000
Received: by outflank-mailman (input) for mailman id 825630;
 Fri, 25 Oct 2024 05:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acHf=RV=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1t4D90-0003CB-6u
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 05:45:54 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63410fb1-9294-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 07:45:50 +0200 (CEST)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:45:47 -0700
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 22:45:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4D8m-000Xds-1o;
 Fri, 25 Oct 2024 05:45:40 +0000
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
X-Inumbo-ID: 63410fb1-9294-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729835151; x=1761371151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8YdKGr5Fv9UWaGPtsTURl32RwtbX08N+XEK40AZcHw=;
  b=Hwkb95E0yOgy+mM0Odb0HN3BZKxRQnbiB6MyaWoXhKl68ajrYSDSJu+l
   DeWuU+8VRwMgGuYwHEhaOB/HhcWPMBiziWSR2xEV1VEvYXViTAoS7m4BA
   ScRneD4eDTiqHIClUFBV1woLOnYLDPvV9ZMenKvjeJJLfhPFLy2Y/DxUi
   OAGyer3PY8wApCpaC4tvtx9VmbiEZfNP2PLiUGateGp9sayemJVryQEDQ
   ff5jtrUswsfEYG+Z0cou45l5+jaZ7pFMzSsfs1QlFprVN6vwcYsRDo3Ma
   FvmstzIKzKgUkZAGPSChyIco7yXuV4UGr82l6AvqYO+SxWvTe0JkT5zkF
   Q==;
X-CSE-ConnectionGUID: MToiyWwUSZ+iF4TGYmV7ZA==
X-CSE-MsgGUID: 7HfyCPooRmyao6jEFATAxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40868330"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40868330"
X-CSE-ConnectionGUID: U+IhO4ZdSmukpojzOgMEog==
X-CSE-MsgGUID: 57T+eSsTSUawMXHuyqKwcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="104136410"
Date: Fri, 25 Oct 2024 13:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	David Airlie <airlied@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Simon Ser <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
Message-ID: <202410251306.cOs7w98U-lkp@intel.com>
References: <20241024162240.2398664-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20241024]
[cannot apply to drm-exynos/exynos-drm-next shawnguo/for-next drm-xe/drm-xe-next linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-remove-driver-date-from-struct-drm_driver-and-all-drivers/20241025-002344
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241024162240.2398664-2-jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251306.cOs7w98U-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251306.cOs7w98U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251306.cOs7w98U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/qaic/qaic_drv.c:211:10: error: 'const struct drm_driver' has no member named 'date'
     211 |         .date                   = "20190618",
         |          ^~~~
>> drivers/accel/qaic/qaic_drv.c:211:35: error: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     211 |         .date                   = "20190618",
         |                                   ^~~~~~~~~~
   drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')
>> drivers/accel/qaic/qaic_drv.c:211:35: error: initializer element is not computable at load time
   drivers/accel/qaic/qaic_drv.c:211:35: note: (near initialization for 'qaic_accel_driver.driver_features')


vim +211 drivers/accel/qaic/qaic_drv.c

c501ca23a6a306 Jeffrey Hugo 2023-03-27  205  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  206  static const struct drm_driver qaic_accel_driver = {
c501ca23a6a306 Jeffrey Hugo 2023-03-27  207  	.driver_features	= DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  208  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  209  	.name			= QAIC_NAME,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  210  	.desc			= QAIC_DESC,
c501ca23a6a306 Jeffrey Hugo 2023-03-27 @211  	.date			= "20190618",
c501ca23a6a306 Jeffrey Hugo 2023-03-27  212  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  213  	.fops			= &qaic_accel_fops,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  214  	.open			= qaic_open,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  215  	.postclose		= qaic_postclose,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  216  
c501ca23a6a306 Jeffrey Hugo 2023-03-27  217  	.ioctls			= qaic_drm_ioctls,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  218  	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
c501ca23a6a306 Jeffrey Hugo 2023-03-27  219  	.gem_prime_import	= qaic_gem_prime_import,
c501ca23a6a306 Jeffrey Hugo 2023-03-27  220  };
c501ca23a6a306 Jeffrey Hugo 2023-03-27  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

