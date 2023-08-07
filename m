Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3847729FD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578693.906320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2ec-0004NT-Jm; Mon, 07 Aug 2023 16:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578693.906320; Mon, 07 Aug 2023 16:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2ec-0004Kc-Fi; Mon, 07 Aug 2023 16:00:22 +0000
Received: by outflank-mailman (input) for mailman id 578693;
 Mon, 07 Aug 2023 16:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98uV=DY=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1qT2eb-0004KV-32
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:00:21 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fdd769e-353b-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 18:00:17 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 09:00:15 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 09:00:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qT2eN-000sgs-2E; Mon, 07 Aug 2023 19:00:07 +0300
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
X-Inumbo-ID: 7fdd769e-353b-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691424018; x=1722960018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z/4FddksZRjYPF/sctXV9wacx6/6dUIpgpIazoNeWKI=;
  b=WQJD0bOhtubuBXTQrK+yzSqlFx6anRM1eRTs5PjqaJBwUiZw4x1eNaxO
   dKwsQrnS8FO6PfpqKn9I3zeQekLYC/NHiJr7bIbSTh1MgeVEC1KAJ9ICj
   TPC2tP3eCStAQSAI01fviqbwNO02cOrhCMOTKBRrkQ0C4udw4akSbxxa+
   afqBhujIyIXV1l/FwcMGAKi3Fv1mvW69JGqn871BSWgv/BywccFec5G+L
   HQD6mgpBBsnFYGeY1iZFWs+KZyzTuVulSP5uTheu/F91Rrl14uBYIY3Dg
   mmghH3KmlL24wRtLAsDgcAwyvCG+g5BtephfHxgd7V6TM6RfnzSxTTSRu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401553720"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="401553720"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977491938"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="977491938"
Date: Mon, 7 Aug 2023 19:00:07 +0300
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
Message-ID: <ZNEVB8ZJah9Y9Bua@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
 <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
 <87pm3yj2s5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm3yj2s5.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 07, 2023 at 05:22:18PM +0200, Takashi Iwai wrote:
> On Tue, 01 Aug 2023 19:51:39 +0200, Andy Shevchenko wrote:
> > On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

...

> I rather wonder why it can't be simple strncpy().

This is obvious. To avoid compiler warning about 0 (possible) truncation.

...

> > Taking all remarks into account I would rather go with sockptr.h being
> > untouched for now, just a big
> > 
> > /* DO NOT USE, it's obsolete, use uniptr.h instead! */
> > 
> > to be added.
> 
> Possibly that's a safer choice.  But the biggest question is whether
> we want a generic type or not.  Let's try to ask it first.
> 
> Interestingly, this file doesn't belong to any subsystem in
> MAINTAINERS, so I'm not sure who to be Cc'ed.  Chirstoph as the
> original author and net dev, maybe.

Yes, but actually it's fine to just copy and change sockptr.h to say
"that's blablabla for net subsystem" (maybe this is implied by the name?).
In that case we just introduce our copy and can do whatever modifications
we want (see previous reply).

-- 
With Best Regards,
Andy Shevchenko



