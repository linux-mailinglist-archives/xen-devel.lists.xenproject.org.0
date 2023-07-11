Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86A74F183
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 16:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561771.878296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJEAD-0008FH-1Y; Tue, 11 Jul 2023 14:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561771.878296; Tue, 11 Jul 2023 14:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJEAC-0008DM-UV; Tue, 11 Jul 2023 14:16:24 +0000
Received: by outflank-mailman (input) for mailman id 561771;
 Tue, 11 Jul 2023 14:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjKM=C5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qJEAB-0008Bn-12
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 14:16:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8185fc47-1ff5-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 16:16:21 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e99584adaso987545a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jul 2023 07:16:19 -0700 (PDT)
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
X-Inumbo-ID: 8185fc47-1ff5-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689084979; x=1691676979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3t8MOjTESHetojE5fepGdnt7zMEWWqb4KmlEDKAmrw=;
        b=lLPy8qQdQeVZlUsxKQYaJLJW/pRKVT3RgzV3onHlXD9XGicpVghKdWDR7Qca8Ldx8Q
         OnDO3DMSzqvfMIiP+Zb7CxDqb65f2nfivrjrkJ/Gj2tTTMhmoe3ZPLprOEGyHZf60CVx
         B3YutWTQcJ4fxKDbvoxslude/QIxSYvb/oRhglyshFABS9C8eDxCtOMVucCr6xnGcQJM
         7Mq/UQvC1ryWZyKb/w0Erdiep3ZlMxnC6eZ5h2DjXa3zdG9OdDnLKUKYKvo4a0yayoMA
         RyYYK8LSmmYZfeD7cMKx/9NpUdSGmCkLlmmMiRLggVpm+ezfdaEa8iTxk01w4b2ZUbYn
         /JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084979; x=1691676979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3t8MOjTESHetojE5fepGdnt7zMEWWqb4KmlEDKAmrw=;
        b=HOYBTcKMNF2CCXz+l+ilGGkyysc7hjS6mqQY3JzzeP7DRcDKsGYxywvAewDLqNs/hD
         99ffHZ2q9Fg4kMPGgL9lADvXlIATrErDtMY+9qV1yT4/7w15VtNwiAqmXFo+I99LIosO
         mtc/g6MmxXg1i3d5NZUqlceYp6DVum0YWuh0GBAd/B5NiCtuzQx9xiZkCGu7AmdfbHKA
         MzqoVuEjv8COtg0MP/ljc+Ab60fKMAfQf7t5zccwLXaDJZmgxyE14xfR5U9PiVeT/WQE
         vmoRM/uFzuwmHTPVidoNYirDHdjMzn5ASVAmaT7tZg2hj7mKEwVl3uFvN4owkfUDzyWG
         xb8w==
X-Gm-Message-State: ABy/qLbWzNhmQSBH0ScsFqAAfAmI1TMHq99l/3qhiUmvNB43zpjCqX/W
	stBKTTisMLCyp6fQ/YvxPbnoETvX4+tGJkD8W4JKfMpduv4=
X-Google-Smtp-Source: APBJJlGOIp5rwlECl7uk8jJAujph+1MLuxYpGT+85R80mQBnZI4aUUZfjp5N0o/SUQ41INgJfHTAej8bL60SfwmKrPw=
X-Received: by 2002:aa7:c042:0:b0:51e:be0:d2ea with SMTP id
 k2-20020aa7c042000000b0051e0be0d2eamr15091559edo.9.1689084978963; Tue, 11 Jul
 2023 07:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com> <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
In-Reply-To: <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Jul 2023 10:16:05 -0400
Message-ID: <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 4:18=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.07.2023 17:22, Jason Andryuk wrote:
> > On Mon, Jul 10, 2023 at 9:13=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 06.07.2023 20:54, Jason Andryuk wrote:
> >>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not su=
pported by all Dom0 kernels.
> >>>  * `<maxfreq>` and `<minfreq>` are integers which represent max and m=
in processor frequencies
> >>>    respectively.
> >>>  * `verbose` option can be included as a string or also as `verbose=
=3D<integer>`
> >>> +  for `xen`.  It is a boolean for `hwp`.
> >>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on supp=
orted Intel
> >>> +  hardware.  HWP is a Skylake+ feature which provides better CPU pow=
er
> >>> +  management.  The default is disabled.  If `hwp` is selected, but h=
ardware
> >>> +  support is not available, Xen will fallback to cpufreq=3Dxen.
> >>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC e=
nables the
> >>> +  processor to autonomously force physical package components into i=
dle state.
> >>> +  The default is enabled, but the option only applies when `hwp` is =
enabled.
> >>> +
> >>> +There is also support for `;`-separated fallback options:
> >>> +`cpufreq=3Dhwp,verbose;xen`.  This first tries `hwp` and falls back =
to `xen`
> >>> +if unavailable.
> >>
> >> In the given example, does "verbose" also apply to the fallback case? =
If so,
> >> perhaps better "cpufreq=3Dhwp;xen,verbose", to eliminate that ambiguit=
y?
> >
> > Yes, "verbose" is applied to both.  I can make the change.  I
> > mentioned it in the commit message, but I'll mention it here as well.
>
> FTAOD my earlier comment implied that the spelling form you use above
> should not even be accepted when parsing. I.e. it was not just about
> the doc aspect.

Oh.  So what exactly do you want then?

There is a single cpufreq_verbose variable today that is set by either
cpufreq=3Dhwp,verbose or cpufreq=3Dxen,verbose.  Is that okay, or should
the "xen" and "hwp" each get a separate variable?

Do you only want to allow a single trailing "verbose" to apply to all
of cpufreq (cpufreq=3D$foo,verbose)?  Or do you want "verbose" to be
only valid for "xen"?  Both cpufreq_cmdline_parse() and
hwp_cmdline_parse() just loop over their options and don't care about
order, even though the documentation lists verbose last.  Would you
want "cpufreq=3Dhwp,verbose,hdc" to fail to parse?

All parsing is done upfront before knowing whether "xen" or "hwp" will
be used as the cpufreq driver, so there is a trickiness for
implementing "verbose" only for one option.  Similarly,
"cpufreq=3Dhwp,invalid;xen" will try "hwp" (but not "xen")  since the
live variables are updated.  Even without this patch, cpufreq will be
configured up to an invalid parameter.

FYI, cpufreq=3Dxen;hwp will be accepted.  "xen" shouldn't fail, so it
doesn't make sense to specify that.  But it didn't seem necessary to
prevent it.

> >>> +            {
> >>> +                switch ( cpufreq_xen_opts[i] )
> >>> +                {
> >>> +                case CPUFREQ_xen:
> >>> +                    ret =3D cpufreq_register_driver(&acpi_cpufreq_dr=
iver);
> >>> +                    break;
> >>> +                case CPUFREQ_hwp:
> >>> +                    ret =3D hwp_register_driver();
> >>> +                    break;
> >>> +                }
> >>> +
> >>> +                if ( ret =3D=3D 0 )
> >>> +                    break;
> >>> +            }
> >>>              break;
> >>
> >> In this model any kind of failure results in the fallback to be tried
> >> (and the fallback's error to be returned to the caller rather than
> >> the primary one). This may or may not be what we actually want;
> >> personally I would have expected
> >>
> >>                 if ( ret !=3D -ENODEV )
> >>                     break;
> >>
> >> or some such instead.
> >
> > I guess this comes back to our fruit preferences. :)
>
> Does it? It's not just a style question here, but one of when / whether
> to use the fallback.

Indeed.  I was trying to allude back to the earlier conversation.  Do
we try the pears only when there are no apples or also when the apples
are "bad"?  Only falling back for no apples is fine.

> > I can switch it around like that, and make hwp_register_driver()
> > return -ENODEV for hwp_available() returning false.
>
> Thanks.
>
> >>> +int __init hwp_cmdline_parse(const char *s, const char *e)
> >>> +{
> >>> +    do
> >>> +    {
> >>> +        const char *end =3D strpbrk(s, ",;");
> >>> +
> >>> +        if ( s && !hwp_handle_option(s, end) )
> >>
> >> This check of s not being NULL comes too late, as strpbrk() would have
> >> de-referenced it already. Considering ...
> >>
> >>> +        {
> >>> +            printk(XENLOG_WARNING "cpufreq/hwp: option '%s' not reco=
gnized\n",
> >>> +                   s);
> >>> +
> >>> +            return -1;

I should change this to -EINVAL.

> >>> +        }
> >>> +
> >>> +        s =3D end ? ++end : end;
> >>> +    } while ( s && s < e );
> >>
> >> ... this it probably wants to move even ahead of the loop.
> >
> > I'll switch from do/while to just while and then the NULL check will
> > be covered.  In practice, this function is never called with s =3D=3D
> > NULL.
>
> In which case - why not leave things largely as they are, simply dropping
> the odd check of s?

Sure.

> >>> +    if ( data->curr_req.raw =3D=3D -1 )
> >>> +    {
> >>> +        hwp_err(cpu, "Could not initialize HWP properly\n");
> >>> +        per_cpu(hwp_drv_data, cpu) =3D NULL;
> >>> +        xfree(data);
> >>> +        return -ENODEV;
> >>> +    }
> >>> +
> >>> +    data->minimum =3D data->curr_req.min_perf;
> >>> +    data->maximum =3D data->curr_req.max_perf;
> >>> +    data->desired =3D data->curr_req.desired;
> >>> +    data->energy_perf =3D data->curr_req.energy_perf;
> >>> +    data->activity_window =3D data->curr_req.activity_window;
> >>> +
> >>> +    if ( cpu =3D=3D 0 )
> >>> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->=
hwp_caps);
> >>
> >> While I'm fine with this (perhaps apart from you using "cpu =3D=3D 0",
> >> which is an idiom we're trying to get rid of), ...
> >
> > Oh, I didn't know that.  What is the preferred way to identify the
> > BSP?
>
> Sometimes we pass a separate boolean to functions, in other cases we
> check whether a struct cpuinfo_x86 * equals &boot_cpu_info. The
> latter clearly can't be used here, and the former doesn't look to be
> a good fit either. However, ...
>
> >  This doesn't necessarily run on the BSP, so "cpu"/"policy->cpu"
> > is all we have to make a determination.
>
> ... isn't it, conversely, the case that the function only ever runs
> on "cpu" when it is the BSP? In which case "cpu =3D=3D smp_processor_id()=
"
> ought to do the trick.

The calls do not necessarily run from the BSP.  The cpufreq init
callbacks run later when dom0 uploads the ACPI processor data.  If you
don't want "cpu =3D=3D 0", maybe just print for the first CPU regardless
of number, and then print differences from that?

Regards,
Jason

