Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2E9E4265
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 18:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848718.1263545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tItWw-0002QU-Hl; Wed, 04 Dec 2024 17:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848718.1263545; Wed, 04 Dec 2024 17:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tItWw-0002O0-Er; Wed, 04 Dec 2024 17:51:18 +0000
Received: by outflank-mailman (input) for mailman id 848718;
 Wed, 04 Dec 2024 17:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UA5x=S5=intel.com=lucas.demarchi@srs-se1.protection.inumbo.net>)
 id 1tItWu-0002Nr-9x
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 17:51:16 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 598e6c29-b268-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 18:51:14 +0100 (CET)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 09:51:11 -0800
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 09:51:09 -0800
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
X-Inumbo-ID: 598e6c29-b268-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733334675; x=1764870675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ik3QLw9UGMKnxPg4l01yFX/0oyq1X9s68T58mzM5ads=;
  b=mFJkwQNf5fb7/ES9NvblmxWi87PQ2POqnQO3StJa1ylKeEVM5rvG7afU
   LAVXma8AIOMjXPkAq87BdgXZfSWM6WvE0MrTS2I5zcL40SaRbPnCJyhr/
   e1llotORoJ3hYZx/8QTWpPHGo0/Yo4LWrQ69YOEhYVeaIOqE/HXAq3K2G
   7opi5tIuiFeBXq90MjszDClcNAiRvsI1vsf9vTRsFPfk9UfGnkk5Rz+Ai
   xBD10E+KfLn7dqjqgAU/JveqtXbujrN6Ml2OVM1ywIPrQRp0dcypQieLI
   hau+82ZspZKpY/Dw6OF2Xg2sKJ98woPLtvAqRQHqlm8XkrCtLCrH2Fh9R
   A==;
X-CSE-ConnectionGUID: KdIXQeW1RDWeLcMj/0HvAA==
X-CSE-MsgGUID: aJ9qRMprSdyNXzA2/rdthQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37392169"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="37392169"
X-CSE-ConnectionGUID: lPqKmV1BT4eeE13DlFLk8Q==
X-CSE-MsgGUID: ImJp8lYITJ6+VecW9ZGo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="131283575"
Date: Wed, 4 Dec 2024 11:51:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Simon Ser <contact@emersion.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver
 and all drivers
Message-ID: <lf2kh3f7wr7nd3tsuq4p2eppiizveqb3mm6z7bfw7a47hj4hsy@u6hybopsg6bl>
References: <cover.1733322525.git.jani.nikula@intel.com>
 <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f2bf2543aed270a06f6c707fd6ed1b78bf16712.1733322525.git.jani.nikula@intel.com>

On Wed, Dec 04, 2024 at 04:31:12PM +0200, Jani Nikula wrote:
>We stopped using the driver initialized date in commit 7fb8af6798e8
>("drm: deprecate driver date") and (eventually) started returning "0"
>for drm_version ioctl instead.
>
>Finish the job, and remove the unused date member from struct
>drm_driver, its initialization from drivers, along with the common
>DRIVER_DATE macros.
>
>v2: Also update drivers/accel (kernel test robot)
>
>Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>Acked-by: Alex Deucher <alexander.deucher@amd.com>
>Acked-by: Simon Ser <contact@emersion.fr>
>Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

