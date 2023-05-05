Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2226F85EF
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530480.826113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxTQ-0006u2-3r; Fri, 05 May 2023 15:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530480.826113; Fri, 05 May 2023 15:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxTQ-0006rX-0J; Fri, 05 May 2023 15:35:56 +0000
Received: by outflank-mailman (input) for mailman id 530480;
 Fri, 05 May 2023 15:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V+Y3=A2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1puxTN-0006rR-OX
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:35:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84876bdc-eb5a-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 17:35:52 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965d2749e2eso188730766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 08:35:52 -0700 (PDT)
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
X-Inumbo-ID: 84876bdc-eb5a-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683300952; x=1685892952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qlMl6bkiI4bRzxC3N4JX9MyFjNBhP97o0bysyL4Rc=;
        b=niNGKM0LFFqkXMppAj+bYzmkzTsiisqFtDYz2Ro5WDODkbpBxHRUlWGeHheYpVWuK6
         TmjoLen0WxGpuoBJ88btqLrqrpddqPupfNtcV4q2j5jHnCEsmWN31z0p/VdajBVEuVxP
         /HClno6FPtan36OMZs9l9VrpdNVwryYWwhnBlDZWBU9fv+X0v/wusYx8gp1LAYm1mYrG
         1r43/L6DUmDygi5XIHnq3ZwyoA3U6deRTP2+iqjFHC9E3fmu6YF4JneN3nCd/Z7MrYau
         A8/SpQWEAIZlG9nhV22q1lNlgX8Fa+/XuPvcWJQoeyfpjntFfEjE6CckHOrnWUoZCExA
         DFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300952; x=1685892952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31qlMl6bkiI4bRzxC3N4JX9MyFjNBhP97o0bysyL4Rc=;
        b=cHX2kSGRBpik3pSyRwoUogdkcg897eLxXg5CjBrl7iQ86VZE7E83aP5oRaNDU5E/Af
         SABEWadpLdflgN3CrxQ/BIwBQ/5bWmJ4duUYDnweX/gKQb7a+b3ZAyYJEJuLRFQznMtY
         WGvFZHnDY7hZ2jGC2Vz2F6PmnBkGU+osSZrUAc6jXMgMvAT9S84utEsXLPjU5qZysHz5
         rjqQxremf8G08p6UXjsbm6mLxvPS4xC/9QGWmvk1ehq4CtLwstvHd6QN9eFZtR/dN/vO
         edmI4D5rUBfOD1FbTHsHqAVDEos4MBGEP37Nbq51bLYiqQQ+QCljLYw5rDWZGoPUSZ3q
         Vcsg==
X-Gm-Message-State: AC+VfDy9DU+uueU2V3Lg5nrAjN/KPPvLZEKlSo7xx9mB2wdA7P7W/RRK
	qvzOaWvJPjGdTQKDbZq2j7l41+NfsXmAo4VzxYcAfRBZ
X-Google-Smtp-Source: ACHHUZ6K+ucZsTkXReKaSLyTS6MXHvsPgDI/+Lt4ZClDTgE2NQfoE9KEzyoCJh20jvOGkN5fGHmw7kAjBmMAo864o9k=
X-Received: by 2002:a17:907:6287:b0:962:582d:89d7 with SMTP id
 nd7-20020a170907628700b00962582d89d7mr1758978ejc.38.1683300951588; Fri, 05
 May 2023 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com> <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
In-Reply-To: <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 May 2023 11:35:39 -0400
Message-ID: <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 3:01=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.05.2023 18:56, Jason Andryuk wrote:
> > On Thu, May 4, 2023 at 9:11=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 01.05.2023 21:30, Jason Andryuk wrote:
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -499,7 +499,7 @@ If set, force use of the performance counters for=
 oprofile, rather than detectin
> >>>  available support.
> >>>
> >>>  ### cpufreq
> >>> -> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondemand=
|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
> >>> +> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondemand=
|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | d=
om0-kernel`
> >>
> >> Considering you use a special internal governor, the 4 governor altern=
atives are
> >> meaningless for hwp. Hence at the command line level recognizing "hwp"=
 as if it
> >> was another governor name would seem better to me. This would then als=
o get rid
> >> of one of the two special "no-" prefix parsing cases (which I'm not ov=
erly
> >> happy about).
> >>
> >> Even if not done that way I'm puzzled by the way you spell out the int=
eraction
> >> of "hwp" and "hdc": As you say in the description, "hdc" is meaningful=
 only when
> >> "hwp" was specified, so even if not merged with the governors group "h=
wp" should
> >> come first, and "hdc" ought to be rejected if "hwp" wasn't first speci=
fied. (The
> >> way you've spelled it out it actually looks to be kind of the other wa=
y around.)
> >
> > I placed them in alphabetical order, but, yes, it doesn't make sense.
> >
> >> Strictly speaking "maxfreq" and "minfreq" also should be objected to w=
hen "hwp"
> >> was specified.
> >>
> >> Overall I'm getting the impression that beyond your "verbose" related =
adjustment
> >> more is needed, if you're meaning to get things closer to how we parse=
 the
> >> option (splitting across multiple lines to help see what I mean):
> >>
> >> `=3D none
> >>  | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
> >>                           [{,hwp[,hdc]|[,maxfreq=3D<maxfreq>[,minfreq=
=3D<minfreq>]}]
> >>                           [,verbose]]}
> >>  | dom0-kernel`
> >>
> >> (We're still parsing in a more relaxed way, e.g. minfreq may come ahea=
d of
> >> maxfreq, but better be more tight in the doc than too relaxed.)
> >>
> >> Furthermore while max/min freq don't apply directly, there are still t=
wo MSRs
> >> controlling bounds at the package and logical processor levels.
> >
> > Well, we only program the logical processor level MSRs because we
> > don't have a good idea of the packages to know when we can skip
> > writing an MSR.
> >
> > How about this:
> > `=3D none
> >  | {{ <boolean> | xen } {
> > [:{powersave|performance|ondemand|userspace}[,maxfreq=3D<maxfreq>[,minf=
req=3D<minfreq>]]
> >                         | [:hwp[,hdc]] }
> >                           [,verbose]]}
> >  | dom0-kernel`
>
> Looks right, yes.

There is a wrinkle to using the hwp governor.  The hwp governor was
named "hwp-internal", so it needs to be renamed to "hwp" for use with
command line parsing.  That means the checking for "-internal" needs
to change to just "hwp" which removes the generality of the original
implementation.

The other issue is that if you select "hwp" as the governor, but HWP
hardware support is not available, then hwp_available() needs to reset
the governor back to the default.  This feels like a layering
violation.

I'm still investigating, but promoting hwp to a top level option -
cpufreq=3Dhwp - might be a better arrangement.

> >>> +union hwp_request
> >>> +{
> >>> +    struct
> >>> +    {
> >>> +        uint64_t min_perf:8;
> >>> +        uint64_t max_perf:8;
> >>> +        uint64_t desired:8;
> >>> +        uint64_t energy_perf:8;
> >>> +        uint64_t activity_window:10;
> >>> +        uint64_t package_control:1;
> >>> +        uint64_t reserved:16;
> >>> +        uint64_t activity_window_valid:1;
> >>> +        uint64_t energy_perf_valid:1;
> >>> +        uint64_t desired_valid:1;
> >>> +        uint64_t max_perf_valid:1;
> >>> +        uint64_t min_perf_valid:1;
> >>
> >> The boolean fields here would probably better be of type "bool". I als=
o
> >> don't see the need for using uint64_t for any of the other fields -
> >> unsigned int will be quite fine, I think. Only ...
> >
> > This is the hardware MSR format, so it seemed natural to use uint64_t
> > and the bit fields.  To me, uint64_t foo:$bits; better shows that we
> > are dividing up a single hardware register using bit fields.
> > Honestly, I'm unfamiliar with the finer points of laying out bitfields
> > with bool.  And the 10 bits of activity window throws off aligning to
> > standard types.
> >
> > This seems to have the correct layout:
> > struct
> > {
> >         unsigned char min_perf;
> >         unsigned char max_perf;
> >         unsigned char desired;
> >         unsigned char energy_perf;
> >         unsigned int activity_window:10;
> >         bool package_control:1;
> >         unsigned int reserved:16;
> >         bool activity_window_valid:1;
> >         bool energy_perf_valid:1;
> >         bool desired_valid:1;
> >         bool max_perf_valid:1;
> >         bool min_perf_valid:1;
> > } ;
> >
> > Or would you prefer the first 8 bit ones to be unsigned int
> > min_perf:8?
>
> Personally I think using bitfields uniformly would be better. What you
> definitely cannot use if not using a bitfield is "unsigned char", it
> ought to by uint8_t then. If using a bitfield, as said, I think it's
> best to stick to unsigned int and bool, unless field width goes
> beyond 32 bits or fields cross a 32-bit boundary.

Ok, thanks.

> >>> +bool __init hwp_available(void)
> >>> +{
> >>> +    unsigned int eax, ecx, unused;
> >>> +    bool use_hwp;
> >>> +
> >>> +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> >>> +    {
> >>> +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> >>> +                    boot_cpu_data.cpuid_level);
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    if ( boot_cpu_data.cpuid_level < 0x16 )
> >>> +    {
> >>> +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU fre=
q info\n",
> >>> +                 boot_cpu_data.cpuid_level);
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    cpuid(CPUID_PM_LEAF, &eax, &unused, &ecx, &unused);
> >>> +
> >>> +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) &&
> >>> +         !(ecx & CPUID6_ECX_IA32_ENERGY_PERF_BIAS) )
> >>> +    {
> >>> +        hwp_verbose("HWP disabled: No energy/performance preference =
available");
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    feature_hwp                 =3D eax & CPUID6_EAX_HWP;
> >>> +    feature_hwp_notification    =3D eax & CPUID6_EAX_HWP_NOTIFICATIO=
N;
> >>> +    feature_hwp_activity_window =3D eax & CPUID6_EAX_HWP_ACTIVITY_WI=
NDOW;
> >>> +    feature_hwp_energy_perf     =3D
> >>> +        eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE;
> >>> +    feature_hwp_pkg_level_ctl   =3D eax & CPUID6_EAX_HWP_PACKAGE_LEV=
EL_REQUEST;
> >>> +    feature_hwp_peci            =3D eax & CPUID6_EAX_HWP_PECI;
> >>> +
> >>> +    hwp_verbose("HWP: %d notify: %d act-window: %d energy-perf: %d p=
kg-level: %d peci: %d\n",
> >>> +                feature_hwp, feature_hwp_notification,
> >>> +                feature_hwp_activity_window, feature_hwp_energy_perf=
,
> >>> +                feature_hwp_pkg_level_ctl, feature_hwp_peci);
> >>> +
> >>> +    if ( !feature_hwp )
> >>> +        return false;
> >>> +
> >>> +    feature_hdc =3D eax & CPUID6_EAX_HDC;
> >>> +
> >>> +    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported%s\n",
> >>> +                feature_hdc ? "" : "not ",
> >>> +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", dis=
abled"
> >>> +                            : "");
> >>> +
> >>> +    feature_hdc =3D feature_hdc && opt_cpufreq_hdc;
> >>> +
> >>> +    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
> >>> +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
> >>
> >> You report this, but you don't really use it?
> >
> > Correct.  I needed to know what capabilities my processors have.
> >
> > feature_hwp_pkg_level_ctl and feature_hwp_peci can also be dropped
> > since they aren't used beyond printing their values.  I'd still lean
> > toward keeping their printing under verbose since otherwise there
> > isn't a convenient way to know if they are available without
> > recompiling.
>
> That's fine, but wants mentioning in the description. Also respective
> variables would want to be __initdata then, be local to the function,
> or be dropped altogether. Plus you'd want to be consistent - either
> you use a helper variable for all print-only features, or you don't.

Got it, thanks.

> >>> +        if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, val) )
> >>> +        {
> >>> +            hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n")=
;
> >>> +            data->curr_req.raw =3D -1;
> >>> +
> >>> +            return;
> >>> +        }
> >>> +
> >>> +        data->energy_perf =3D val & IA32_ENERGY_BIAS_MASK;
> >>> +    }
> >>
> >> In order to not need to undo the "enable" you've already done, maybe t=
hat
> >> should move down here?
> >
> > HWP needs to be enabled before the Capabilities and Request MSRs can
> > be read.
>
> I must have missed this aspect in the SDM. Do you have a pointer?

In 15.4.2 Enabling HWP
Additional MSRs associated with HWP may only be accessed after HWP is
enabled, with the exception of IA32_HWP_INTERRUPT and MSR_PPERF.
Accessing the IA32_HWP_INTERRUPT MSR requires only HWP is present as
enumerated by CPUID but does not require enabling HWP.

> >  Reading them shouldn't fail, but it seems safer to use
> > rdmsr_safe in case something goes wrong.
>
> Sure. But then the "enable" will need undoing in the unlikely event of
> failure.

Yes.

Regards,
Jason

