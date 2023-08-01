Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C876BBB4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 19:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574463.899749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQtXN-0006qN-70; Tue, 01 Aug 2023 17:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574463.899749; Tue, 01 Aug 2023 17:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQtXN-0006oY-3T; Tue, 01 Aug 2023 17:52:01 +0000
Received: by outflank-mailman (input) for mailman id 574463;
 Tue, 01 Aug 2023 17:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nouE=DS=linux.intel.com=andriy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1qQtXL-0006oO-Fx
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 17:51:59 +0000
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 170b10fc-3094-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 19:51:54 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 10:51:47 -0700
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 10:51:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qQtX2-00DKb2-0b; Tue, 01 Aug 2023 20:51:40 +0300
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
X-Inumbo-ID: 170b10fc-3094-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690912314; x=1722448314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23Wc3k0mFLbrQycUcEsHy3FEUV7003iJlGRdyTKc6ms=;
  b=PCUoIkXMQeK6PgQqyzurFvxhlQkIf3OUGJ1J2qKMomkcrETlAdSnp1GD
   rU8AiWlWtXaXuWdghcFoEIJ7Yz5CM12CRk/9BrS36Oezi/0NBosa+5/km
   M7gW3PiDBYp75S/MYFyMe25TtKJPIcj7Ed01Q/0sGaIpCkKa/LSzFXx+U
   QnTlc+iThqyfcoJBSy5IQgQt23D7H8kQ3PNmTcl+D1ZP4/dp2jiH9A5Pt
   urMCwDcikMi72miS23C2Ko0SPeV2Gc6ONlnT5IBygkR/hGbC0Ilfj70tY
   3tm0S41Q+mRy7xVc2J2/rfxPzPk/sQMgWykG4yn80wAVZ6lLAofgzRXYl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368273820"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="368273820"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758441153"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="758441153"
Date: Tue, 1 Aug 2023 20:51:39 +0300
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
Message-ID: <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leeugbxm.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 21:40:20 +0200,
> Mark Brown wrote:
> > On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> > > Mark Brown wrote:
> > 
> > > > It really feels like we ought to rename, or add an alias for, the type
> > > > if we're going to start using it more widely - it's not helping to make
> > > > the code clearer.
> > 
> > > That was my very first impression, too, but I changed my mind after
> > > seeing the already used code.  An alias might work, either typedef or
> > > define genptr_t or such as sockptr_t.  But we'll need to copy the
> > > bunch of helper functions, too...
> > 
> > I would predict that if the type becomes more widely used that'll happen
> > eventually and the longer it's left the more work it'll be.
> 
> That's true.  The question is how more widely it'll be used, then.
> 
> Is something like below what you had in mind, too?

I agree with your proposal (uniptr_t also works for me), but see below.

...

> +#include <linux/slab.h>
> +#include <linux/uaccess.h>

But let make the list of the headers right this time.

It seems to me that

err.h
minmax.h // maybe not, see a remark at the bottom
string.h
types.h

are missing.

More below.

...

> +	void *p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
> +
> +	if (!p)
> +		return ERR_PTR(-ENOMEM);

This can use cleanup.h.

> +	if (copy_from_uniptr(p, src, len)) {
> +		kfree(p);
> +		return ERR_PTR(-EFAULT);
> +	}
> +	return p;
> +}
> +
> +static inline void *memdup_uniptr_nul(uniptr_t src, size_t len)
> +{
> +	char *p = kmalloc_track_caller(len + 1, GFP_KERNEL);

Ditto.

> +	if (!p)
> +		return ERR_PTR(-ENOMEM);
> +	if (copy_from_uniptr(p, src, len)) {
> +		kfree(p);
> +		return ERR_PTR(-EFAULT);
> +	}
> +	p[len] = '\0';
> +	return p;
> +}

...

> +static inline long strncpy_from_uniptr(char *dst, uniptr_t src, size_t count)
> +{
> +	if (uniptr_is_kernel(src)) {
> +		size_t len = min(strnlen(src.kernel, count - 1) + 1, count);

I didn't get why do we need min()? To check the count == 0 case?

Wouldn't

		size_t len;

		len = strnlen(src.kernel, count);
		if (len == 0)
			return 0;

		/* Copy a trailing NUL if found */
		if (len < count)
			len++;

be a good equivalent?

> +		memcpy(dst, src.kernel, len);
> +		return len;
> +	}
> +	return strncpy_from_user(dst, src.user, count);
> +}

...

> +static inline int check_zeroed_uniptr(uniptr_t src, size_t offset, size_t size)
> +{
> +	if (!uniptr_is_kernel(src))

Why not to align all the functions to use same conditional (either always
positive or negative)?

> +		return check_zeroed_user(src.user + offset, size);
> +	return memchr_inv(src.kernel + offset, 0, size) == NULL;
> +}

...

Taking all remarks into account I would rather go with sockptr.h being
untouched for now, just a big

/* DO NOT USE, it's obsolete, use uniptr.h instead! */

to be added.

-- 
With Best Regards,
Andy Shevchenko



