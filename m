Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F2076B681
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574239.899505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQptO-0002Wq-An; Tue, 01 Aug 2023 13:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574239.899505; Tue, 01 Aug 2023 13:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQptO-0002VC-7u; Tue, 01 Aug 2023 13:58:30 +0000
Received: by outflank-mailman (input) for mailman id 574239;
 Tue, 01 Aug 2023 13:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nouE=DS=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1qQptM-0002V6-Jr
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:58:29 +0000
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a14cbe0-3073-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:58:24 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 06:57:59 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 06:57:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qQpsm-005MX9-2k; Tue, 01 Aug 2023 16:57:52 +0300
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
X-Inumbo-ID: 7a14cbe0-3073-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898304; x=1722434304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZKIy+hH5QB+KBuMy5Vbg4Dhcb8h2GptMzqQNMbJ5fGU=;
  b=cxaJWq2SuAMDVIwUPtisnAfJnEyWqk6PJGyJI7FgFXdOrOa/uErM27Hp
   +NqPQWx+qiE16jc8bAHywSdJl0GXb/w4WSMzRTvGpnGs/T3WlG6rHkFBD
   sFtZ4AYuN7ABb0kUTSZLaT0GEOrd8R1fNlI1H47G0iA3lfYP3d1qzWlty
   gnrePRbXgjJCMKwY2sjjwnnuGMAOUU2xwxI2J08U1/lQ1ySYI2Xa/Rts6
   NXojIWQYEwtMHbbLHK46XLgCNipCYBKU0hninmLw+4GsO/CLvK+2cIn9D
   7lTXDgolHMkUHPbHqB52/LivRnwAgPNDIdOQso51DWr49IEP0IC/+I1eK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400250896"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="400250896"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="763772313"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="763772313"
Date: Tue, 1 Aug 2023 16:57:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <ZMkPYFblXjxah6Xt@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 19:20:54 +0200,
> Mark Brown wrote:
> > 
> > On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:
> > 
> > > this is a patch set to clean up the PCM copy ops using sockptr_t as a
> > > "universal" pointer, inspired by the recent patch from Andy
> > > Shevchenko:
> > >   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com
> > 
> > > Even though it sounds a bit weird, sockptr_t is a generic type that is
> > > used already in wide ranges, and it can fit our purpose, too.  With
> > > sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> > > be unified again gracefully.
> > 
> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.
> 
> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

Maybe we should define a genptr_t (in genptr.h) and convert sockptr infra to
use it (in sockptr.h)? This will leave network and other existing users to
convert to it step-by-step.

Another approach is to simply copy sockptr.h to genptr.h with changed naming
scheme and add a deprecation note to the former.

Thank you, Takashi, for doing this!

-- 
With Best Regards,
Andy Shevchenko



