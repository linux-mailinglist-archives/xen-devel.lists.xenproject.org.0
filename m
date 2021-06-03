Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5340F39A066
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 13:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136419.252944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lolwS-0001A2-9Z; Thu, 03 Jun 2021 11:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136419.252944; Thu, 03 Jun 2021 11:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lolwS-00017F-5r; Thu, 03 Jun 2021 11:55:16 +0000
Received: by outflank-mailman (input) for mailman id 136419;
 Thu, 03 Jun 2021 11:55:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeTI=K5=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lolwQ-000179-WC
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 11:55:15 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d3d0e52-4435-4aca-9e4e-94d34855bb16;
 Thu, 03 Jun 2021 11:55:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p17so7621649lfc.6
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 04:55:13 -0700 (PDT)
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
X-Inumbo-ID: 8d3d0e52-4435-4aca-9e4e-94d34855bb16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EpM6Yqr00wTEWuXreXquvTVwpQ5MOp19mRj8EEUbqIk=;
        b=CwRJuPSeN0OvZ45C85AUDzswzI+YW4S9qQb6poFiff70a6/jZf/CCIy1nl4+D6vJjB
         98NGxOPP0BUt2U0HXsA4x0bQ79KCjDzeYMxGSXePt2ZgaZC77GRwgVqsdjk4wsbaxuiW
         Dbb0hYF2A7fiBpZsU66nh1vmyvmmOeN/TCtJwjAb/WbaGnP+i+9SMEjJuxg11PWjatZ2
         SVxSaEksVgFwzYMNfzP/hOo7NJRupMqB/KwApXMLew8y7lecKzrTcZPIVJW4429M45SR
         Bg6hOnKe69XZ0mw6VePdDJmkxH05xhG/XroUJwxypuJO+cwi6pbd/vhbxgb3SwtEA3An
         6VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EpM6Yqr00wTEWuXreXquvTVwpQ5MOp19mRj8EEUbqIk=;
        b=YxcTX/DJb9UYwvX+JtX8YLx0L8VfMJwBMw7FbBWl45mND5gokmXVZ7C2+W9K32YO0S
         YCWSVhDwRbJwpNx/gEnpDn3hfV4mVGPYbR0NCUGELziZUXHrCqdYvhZxOxxtYZKmUv5N
         HYki7Ezh1e9PMwg+zwHXHBSs6nF91WnEc+52y2wGZByDB6a2bMjcQIKvxOdJBg6DwPuf
         z9gjI3U4IlPGGU8tJ8eeKTN6OUCUsBnzFgFtJennt8R+xwm02IPZPJNoQ2/DIe5Tggv0
         DpulCWWzTy3KQVvQK2wNqrf1ZhpspEwOPvk5i72aOfSxZzsziuMGWIBgQ02Bn0WNtkRe
         qq/g==
X-Gm-Message-State: AOAM533cKSGJA7My74WhPA4sM7XcAPfPm6d3JsboRqUs0zdshrwLzHfF
	OsfPGSw74YDzjl3rMMhPQw8yN9K7bsF6utYDt+I=
X-Google-Smtp-Source: ABdhPJwyivv+crQ7rx0EYCzqBC39js/ujiICRam711RxBEblvFzPC1Jg/bNWYsjdg1iKUlMIqUoUzF2vPKnDaUGLpgE=
X-Received: by 2002:a19:ed04:: with SMTP id y4mr10699984lfy.562.1622721312122;
 Thu, 03 Jun 2021 04:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-5-jandryuk@gmail.com>
 <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com> <CAKf6xps4NuBxMpgCo_duWU1ZXB8x8B8uszb3uNyb6kABxUhNHA@mail.gmail.com>
 <2c3400e8-8236-8558-08e4-37c8b1494de7@suse.com>
In-Reply-To: <2c3400e8-8236-8558-08e4-37c8b1494de7@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 3 Jun 2021 07:55:00 -0400
Message-ID: <CAKf6xpvCkzHOZsBY2yMQSVxq844_muaAaKd-JZUQfd7UCrXLVg@mail.gmail.com>
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021 at 2:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 27.05.2021 20:50, Jason Andryuk wrote:
> > On Wed, May 26, 2021 at 11:00 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 03.05.2021 21:28, Jason Andryuk wrote:
> >>> +    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
> >>> +                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
> >>> +    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
> >>> +    {
> >>> +        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
> >>> +            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
> >>> +
> >>> +        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);
> >>
> >> Missing "else" above here?
> >
> > Are unbalanced braces acceptable or must they be balanced?  Is this acceptable:
> > if ()
> >   one;
> > else {
> >   two;
> >   three;
> > }
>
> Yes, it is. But I don't see how the question relates to my comment.
> All that needs to go in the else's body is the hwp_verbose().

'val' shouldn't be used to set features when the rdmsr fails, so the
following code needs to be within the else.  Unless you want to rely
on a failed rdmsr returning 0.

> >>> +static void hdc_set_pkg_hdc_ctl(bool val)
> >>> +{
> >>> +    uint64_t msr;
> >>> +
> >>> +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> >>> +    {
> >>> +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
> >>
> >> I'm not convinced of the need of having such log messages after
> >> failed rdmsr/wrmsr, but I'm definitely against them getting logged
> >> unconditionally. In verbose mode, maybe.
> >
> > We should not fail the rdmsr if our earlier cpuid check passed.  So in
> > that respect these messages can be removed.  The benefit here is that
> > you can see which MSR failed.  If you relied on extable_fixup, you
> > would have to cross reference manually.  How will administors know if
> > hwp isn't working properly there are no messages?
>
> This same question would go for various other MSR accesses which
> might fail, but which aren't accompanied by an explicit log message.
> I wouldn't mind a single summary message reporting if e.g. HWP
> setup failed. More detailed analysis of such would be more of a
> developer's than an administrator's job then anyway.
>
> > For HWP in general, the SDM says to check CPUID for the availability
> > of MSRs.  Therefore rdmsr/wrmsr shouldn't fail.  During development, I
> > saw wrmsr failures when with "Valid Maximum" and other "Valid" bits
> > set.  I think that was because I hadn't set up the Package Request
> > MSR.  That has been fixed by not using those bits.  Anyway,
> > rdmsr/wrmsr shouldn't fail, so how much code should be put into
> > checking for those failures which shouldn't happen?
>
> If there's any risk of accesses causing a fault, using *msr_safe()
> is of course the right choice. Beyond that you will need to consider
> what the consequences are. Sadly this needs doing on every single
> case individually. See "Handling unexpected conditions" section of
> ./CODING_STYLE for guidelines (even if the specific constructs
> aren't in use here).

Using *msr_safe(), I think the worst case is the users can't set HWP
in the way they want.  So power/performance may not be what the users
wanted, but Xen won't crash.  The hardware will throttle itself if
needed for self-protection, so that should be okay as well.

> >>> +static void hdc_set_pm_ctl1(bool val)
> >>> +{
> >>> +    uint64_t msr;
> >>> +
> >>> +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
> >>> +    {
> >>> +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
> >>> +
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    msr = val ? IA32_PM_CTL1_HDC_Allow_Block : 0;
> >>
> >> Same here then, and ...
> >>
> >>> +static void hwp_fast_uncore_msrs_ctl(bool val)
> >>> +{
> >>> +    uint64_t msr;
> >>> +
> >>> +    if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
> >>> +        hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL)\n");
> >>> +
> >>> +    msr = val;
> >>
> >> ... here (where you imply bit 0 instead of using a proper
> >> constant).
> >>
> >> Also for all three functions I'm not convinced their names are
> >> in good sync with their parameters being boolean.
> >
> > Would you prefer something named closer to the bit names like:
> > hdc_set_pkg_hdc_ctl -> hdc_set_pkg_enable
> > hdc_set_pm_ctl1 -> hdc_set_allow_block
> > hwp_fast_uncore_msrs_ctl -> hwp_fast_request_enable
>
> My primary request is for function name, purpose, and parameter(s)
> to be in line. So e.g. if you left the parameters as boolean, then
> I think your suggested name changes make sense. Alternatively you
> could make the functions e.g. be full register updating ones, with
> suitable parameters, which could be a mask-to-set and mask-to-clear.

I'm going to use the replacement names while keeping the boolean
argument.  Those MSRs only have single bits defined today, so
functions with boolean parameters are simpler.

> >>> +static void hwp_read_capabilities(void *info)
> >>> +{
> >>> +    struct cpufreq_policy *policy = info;
> >>> +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
> >>> +
> >>> +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
> >>> +    {
> >>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
> >>> +                policy->cpu);
> >>> +
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
> >>> +    {
> >>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
> >>> +
> >>> +        return;
> >>> +    }
> >>> +}
> >>
> >> This function doesn't indicate failure to its caller(s), so am I
> >> to understand that failure to read either ofthe MSRs is actually
> >> benign to the driver?
> >
> > They really shouldn't fail since the CPUID check passed during
> > initialization.  If you can't read/write MSRs, something is broken and
> > the driver cannot function.  The machine would still run, but HWP
> > would be uncontrollable.  How much care should be given to
> > "impossible" situations?
>
> See above. The main point is to avoid crashing. In the specific
> case here I think you could simply drop both the log messages and
> the early return, assuming the caller can deal fine with the zero
> value(s) that rdmsr_safe() will substitute for the MSR value(s).
> Bailing early, otoh, calls for handing back an error indicator
> imo.

I changed it to have failure set curr_req.raw = -1.  Then
cpufreq_driver.init returns -ENODEV in that case.

> >>> +    policy->governor = &hwp_cpufreq_governor;
> >>> +
> >>> +    data = xzalloc(typeof(*data));
> >>
> >> Commonly we specify the type explicitly in such cases, rather than using
> >> typeof(). I will admit though that I'm not entirely certain which one's
> >> better. But consistency across the code base is perhaps preferable for
> >> the time being.
> >
> > I thought typeof(*data) is always preferable since it will always be
> > the matching type.  I can change it, but I feel like it's a step
> > backwards.
>
> There's exactly one similar use in the entire code base. The original
> idea with xmalloc() was that one would explicitly specify the intended
> type, such that without looking elsewhere one can see what exactly is
> to be allocated. One could further rely on the compiler warning if
> there was a disagreement between declaration and assignment.

Oh, okay.  Thanks for the explanation of xmalloc().

> >>> +    if ( feature_hwp_energy_perf )
> >>> +        data->energy_perf = 0x80;
> >>> +    else
> >>> +        data->energy_perf = 7;
> >>
> >> Where's this 7 coming from? (You do mention the 0x80 at least in the
> >> description.)
> >
> > When HWP energy performance preference is unavailable, it falls back
> > to IA32_ENERGY_PERF_BIAS with a 0-15 range.  Per the SDM Vol3 14.3.4,
> > "A value of 7 roughly translates into a hint to balance performance
> > with energy consumption."  I will add a comment.
>
> Actually, as per a comment on a later patch, I'm instead expecting
> you to add a #define, the name of which will serve as comment.

Yes, sounds good.

Regards,
Jason

