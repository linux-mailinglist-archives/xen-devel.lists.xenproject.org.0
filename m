Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDD394358
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 15:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133910.249404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcP5-0000qj-Tq; Fri, 28 May 2021 13:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133910.249404; Fri, 28 May 2021 13:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcP5-0000oZ-QI; Fri, 28 May 2021 13:19:55 +0000
Received: by outflank-mailman (input) for mailman id 133910;
 Fri, 28 May 2021 13:19:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QboB=KX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lmcP4-0000oT-OJ
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 13:19:54 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23221fd-77a2-44e9-97c8-cc365e133578;
 Fri, 28 May 2021 13:19:53 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a5so5365328lfm.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 May 2021 06:19:53 -0700 (PDT)
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
X-Inumbo-ID: f23221fd-77a2-44e9-97c8-cc365e133578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6CI3bJoWlR73wvGXkQ1pwSf9oraVxE1+E2j7+D/QPU=;
        b=qcMEJo688QrfETvG8lwRXHD3x2/GMvUrF8rj0gxaHLd8Ze+baq1raGSwyVU/NDSAUF
         TO/W5P2jl4fBhd3zsG2sEq3DKBEVrsJlPBRO45kUcQCCcpqc/MdnFQgZ1NYnTr40ArrY
         N7C+gWbDH0OOmSO/0s8fK0eOML9zxFzBWLlFeQp+IaR+qEcR9t68I1GlhS7ULHPN7q15
         siNtSTimI8txtIdy9usOtG1gXjcMJPx947BRXL3H3a9npe81QS3B9QIh5G0eONeUGscQ
         QttC02aXdPqCpx4UzvgbA73gGgTpfwJB+yaNPi3C9ld06T2IDjY1s5HMHCRSPxqoHvN5
         uZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6CI3bJoWlR73wvGXkQ1pwSf9oraVxE1+E2j7+D/QPU=;
        b=kX2cQumUrHExHMCc7a/n7NROuKteB8CQfFxawUAMB5eJGq3KERE6VJCYSXXPI/lsNA
         lRtCUOx9r3jNgvUyhJZk+HIeNdJmA0po+0XyqDYAQNrqxQLTAQnYlW8HSFytZkcUfWnT
         6/93WZ1hUBjgqi4aI2Ggq/dRGo0nPpdz2aQu4zKMYXd7mdpiaEPICPP3w3A2RX9aZhk8
         fI6zpDY1spp3DnNQuTrgk0vgQCG/4nH5iB5dsC7wIDyBcrDq7X3cUcLGiZ3Q64fwaN1m
         5KHK+5q8PzvllcWMC8GGVLwm5eaubJtwxNoQZFY3QmLy7PkTnxJ2Xco9H3SmAgPLfagg
         Z0LA==
X-Gm-Message-State: AOAM530NOtnz41ESf6YX2IzjMF+8dh99Es9uHFw/kK9o9lG6mJy3AyVu
	nRFftziyDhF+mSKjiCV+6nPt/vpnCSUJdfkKUow=
X-Google-Smtp-Source: ABdhPJxHubQ4FhiTAJgLMZWfFaU+5M7ZPmpSEQAaEJuxlxLxY3+S+VNSs/2hbaYeaYHTgCBfwpT0jTLXU0HhXw6GMSs=
X-Received: by 2002:a05:6512:b95:: with SMTP id b21mr5710476lfv.491.1622207991200;
 Fri, 28 May 2021 06:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-7-jandryuk@gmail.com>
 <e54c3aef-4c44-4302-f7f4-4f4733e33780@suse.com>
In-Reply-To: <e54c3aef-4c44-4302-f7f4-4f4733e33780@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 28 May 2021 09:19:39 -0400
Message-ID: <CAKf6xptN13CW78XajgyE0G8t2NjFVka8tzNO2oofjcw7tT7n8g@mail.gmail.com>
Subject: Re: [PATCH 06/13] cpufreq: Export HWP parameters to userspace
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 27, 2021 at 4:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:28, Jason Andryuk wrote:
> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -290,6 +290,12 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
> >              &op->u.get_para.u.ondemand.sampling_rate,
> >              &op->u.get_para.u.ondemand.up_threshold);
> >      }
> > +
> > +    if ( !strncasecmp(op->u.get_para.scaling_governor,
> > +                      "hwp-internal", CPUFREQ_NAME_LEN) )
> > +    {
> > +        ret = get_hwp_para(policy, &op->u.get_para.u.hwp_para);
> > +    }
> >      op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
>
> Nit: Unnecessary parentheses again, and with the leading blank line
> you also want a trailing one. (As an aside I'm also not overly happy
> to see the call keyed to the governor name. Is there really no other
> indication that hwp is in use?)

This is preceded by similar checks for "userspace" and "ondemand", so
it is following existing code.  Unlike other governors, hwp-internal
is static.  It could be exported if you want to switch to comparing
with cpufreq_driver.

> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -246,4 +246,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
> >  void cpufreq_dbs_timer_suspend(void);
> >  void cpufreq_dbs_timer_resume(void);
> >
> > +/********************** hwp hypercall helper *************************/
> > +int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para);
>
> While I can see that the excessive number of stars matches what
> we have elsewhere in the header, I still wonder if you need to go
> this far for a single declaration. If you want to stick to this,
> then to match the rest of the file you want to follow the comment
> by a blank line.

Will remove.

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -301,6 +301,23 @@ struct xen_ondemand {
> >      uint32_t up_threshold;
> >  };
> >
> > +struct xen_hwp_para {
> > +    uint16_t activity_window; /* 7bit mantissa and 3bit exponent */
>
> If you go this far with commenting, you should also make the further
> aspects clear: Which bits these are, and that the exponent is taking
> 10 as the base (in most other cases one would expect 2).

Yes, this is much more useful.

> > +#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0) /* energy_perf range 0-255 if
> > +                                                    1. Otherwise 0-15 */
> > +#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1) /* activity_window supported
> > +                                                    if 1 */
>
> Style: Comment formatting. You may want to move the comment on separate
> lines ahead of what they comment.
>
> > +    uint8_t hw_feature; /* bit flags for features */
> > +    uint8_t hw_lowest;
> > +    uint8_t hw_most_efficient;
> > +    uint8_t hw_guaranteed;
> > +    uint8_t hw_highest;
>
> Any particular reason for the recurring hw_ prefixes?

The idea was to differentiate values provided by CPU hardware from
user-configured values.

Regards,
Jason

