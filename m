Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697239292F
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132870.247779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAyv-0006q2-B0; Thu, 27 May 2021 08:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132870.247779; Thu, 27 May 2021 08:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAyv-0006o8-74; Thu, 27 May 2021 08:03:05 +0000
Received: by outflank-mailman (input) for mailman id 132870;
 Thu, 27 May 2021 08:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmAyt-0006nw-Mu
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:03:03 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12a44cbd-a727-40dc-98c4-8af5f820f7d2;
 Thu, 27 May 2021 08:03:01 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 982242190B;
 Thu, 27 May 2021 08:03:00 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id CB24F11CD5;
 Thu, 27 May 2021 07:55:20 +0000 (UTC)
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
X-Inumbo-ID: 12a44cbd-a727-40dc-98c4-8af5f820f7d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622102580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8lYDPUfaNwpwzT9KadN9y6xkH7cv7N12qFSTtd2XeI=;
	b=NxTDOWhzzmtAjvRM2nG2cdOzvgq4DvL1Lw5h8vbW2pZ/l9kCc0dyXeceHKtE5EeabahmLm
	fTgo7RGt3wPzfvFzMKHARA+RMY654qzhJ6iylOL8AEQWIb3+kVkVpnauOyw8PbCBdwCxPl
	PkgU7JitPugRS24e7JcmrqpyW1QwlHs=
Subject: Re: [PATCH 06/13] cpufreq: Export HWP parameters to userspace
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-7-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e54c3aef-4c44-4302-f7f4-4f4733e33780@suse.com>
Date: Thu, 27 May 2021 09:55:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-7-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -523,6 +523,30 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
>      .update = hwp_cpufreq_update,
>  };
>  
> +int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = hwp_drv_data[cpu];

const, perhaps also for the first function parameter, and in
general (throughout the series) whenever an item is not meant to
be modified.

> +    if ( data == NULL )
> +        return -EINVAL;
> +
> +    hwp_para->hw_feature        =
> +        feature_hwp_activity_window ? XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  : 0 |
> +        feature_hwp_energy_perf     ? XEN_SYSCTL_HWP_FEAT_ENERGY_PERF : 0;

This needs parentheses added, as | has higher precedence than ?:.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -290,6 +290,12 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>              &op->u.get_para.u.ondemand.sampling_rate,
>              &op->u.get_para.u.ondemand.up_threshold);
>      }
> +
> +    if ( !strncasecmp(op->u.get_para.scaling_governor,
> +                      "hwp-internal", CPUFREQ_NAME_LEN) )
> +    {
> +        ret = get_hwp_para(policy, &op->u.get_para.u.hwp_para);
> +    }
>      op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);

Nit: Unnecessary parentheses again, and with the leading blank line
you also want a trailing one. (As an aside I'm also not overly happy
to see the call keyed to the governor name. Is there really no other
indication that hwp is in use?)

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -246,4 +246,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
>  void cpufreq_dbs_timer_suspend(void);
>  void cpufreq_dbs_timer_resume(void);
>  
> +/********************** hwp hypercall helper *************************/
> +int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para);

While I can see that the excessive number of stars matches what
we have elsewhere in the header, I still wonder if you need to go
this far for a single declaration. If you want to stick to this,
then to match the rest of the file you want to follow the comment
by a blank line.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>  #include "domctl.h"
>  #include "physdev.h"
>  
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014

As long as the size of struct xen_get_cpufreq_para doesn't change
(which from the description I imply it doesn't), you don't need to
bump the version, I don't think - your change is a pure addition
to the interface.

> @@ -301,6 +301,23 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +struct xen_hwp_para {
> +    uint16_t activity_window; /* 7bit mantissa and 3bit exponent */

If you go this far with commenting, you should also make the further
aspects clear: Which bits these are, and that the exponent is taking
10 as the base (in most other cases one would expect 2).

> +#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0) /* energy_perf range 0-255 if
> +                                                    1. Otherwise 0-15 */
> +#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1) /* activity_window supported
> +                                                    if 1 */

Style: Comment formatting. You may want to move the comment on separate
lines ahead of what they comment.

> +    uint8_t hw_feature; /* bit flags for features */
> +    uint8_t hw_lowest;
> +    uint8_t hw_most_efficient;
> +    uint8_t hw_guaranteed;
> +    uint8_t hw_highest;

Any particular reason for the recurring hw_ prefixes?

Jan

