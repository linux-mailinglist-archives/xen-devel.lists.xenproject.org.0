Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DED6FDF4D
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 15:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532828.829140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkHR-0000h5-7K; Wed, 10 May 2023 13:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532828.829140; Wed, 10 May 2023 13:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkHR-0000ej-4K; Wed, 10 May 2023 13:54:57 +0000
Received: by outflank-mailman (input) for mailman id 532828;
 Wed, 10 May 2023 13:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e4GJ=A7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pwkHP-0000ed-Kj
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 13:54:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d597c0f-ef3a-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 15:54:53 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so12942357a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 06:54:53 -0700 (PDT)
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
X-Inumbo-ID: 3d597c0f-ef3a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683726893; x=1686318893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7LfQnggO8g+70sW+PjZ0r6gGoNInRJXkgSlZGk1WBw=;
        b=CSod7Vg8n9dlQ2nGXGZNFpHHopF3Kk11zNRs8bV15UY7QS5678+bABR25KkNcxEhsC
         LFQRHGohYq7OkuwUzmmBRzCust6ggmMl4uuv2P6In4dWkIrKSGC0Lf6YBXmS5K7ntVGr
         fmoj/x6MwGOu5f/TfBBKefMTnhBNyUnCjrev/Cjh6kajT44uf7Y4olQZuemoubk6AXiy
         EnL0Obx00n6PMrR9fXMVvxn9iWiWRIjUPl7nUfh+jgvK4+QDhC/tVtaxGajR3X0mt3V9
         i8vnhgu733eKrU5m2IU7bMx1zlwWW/RQfK2bytTOPePzF76EHTLyEwYA4FO1WYYRIIbx
         kjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683726893; x=1686318893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7LfQnggO8g+70sW+PjZ0r6gGoNInRJXkgSlZGk1WBw=;
        b=Ocae5VECs1FfBCqy/TV9Rh0yAISzFQ25zWYQduniE3nzbHf5/iGp3I4PWNz88VAPVp
         wNkb2CYTlk4XUzj8yjYIhrgLemkHhSZHGmZkYc+lIaEnwvCXUSe/6Y8Fxl1JBMIVKR5v
         KsE90S1V+28nzboABplLFs2M1/nyuj8yVEWcwjVr5NBjcoSd1wXLViTYaoj55k3CJMW0
         c8me0RWZXKqLJZB7FawVfYrQM28s3VsXHfpNxJ/kBdvMCvec1g2eXt4fXObXruL9kYCN
         s9VfoGFNsFChy8gXNP6/Yx7C8dtlanca8nVjUq+zmx1jqk/Mnk1pQXoz0iFZrQYSBsFZ
         73Bw==
X-Gm-Message-State: AC+VfDw51Oqa/970NKCk+f3pCuJmQ+OUU/XtPfhQ0GWkDg0k8MdTe/de
	2vGWxCTN8oYE8d98bW2Is4+4blb9MF40Ef4ltpA=
X-Google-Smtp-Source: ACHHUZ5gFeEoO7F8QsxLLjW8OKv8gzq19vcwdjzpYjMS2YRBOe4qvYO8pHhaYOh/gyFWP7Q8zL+OduwreivrrlplI2I=
X-Received: by 2002:a17:907:6eaa:b0:94f:81c:725e with SMTP id
 sh42-20020a1709076eaa00b0094f081c725emr19150348ejc.59.1683726892829; Wed, 10
 May 2023 06:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com> <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com> <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
 <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
In-Reply-To: <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 May 2023 09:54:40 -0400
Message-ID: <CAKf6xpuZRgQSe7=ST1sa=_vNOvDeC+bnDG4deb9m=A2M5+X2Eg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 2:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.05.2023 17:35, Jason Andryuk wrote:
> > On Fri, May 5, 2023 at 3:01=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 04.05.2023 18:56, Jason Andryuk wrote:
> >>> On Thu, May 4, 2023 at 9:11=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 01.05.2023 21:30, Jason Andryuk wrote:
> >>>>> --- a/docs/misc/xen-command-line.pandoc
> >>>>> +++ b/docs/misc/xen-command-line.pandoc
> >>>>> @@ -499,7 +499,7 @@ If set, force use of the performance counters f=
or oprofile, rather than detectin
> >>>>>  available support.
> >>>>>
> >>>>>  ### cpufreq
> >>>>> -> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondema=
nd|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
> >>>>> +> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondema=
nd|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} |=
 dom0-kernel`
> >>>>
> >>>> Considering you use a special internal governor, the 4 governor alte=
rnatives are
> >>>> meaningless for hwp. Hence at the command line level recognizing "hw=
p" as if it
> >>>> was another governor name would seem better to me. This would then a=
lso get rid
> >>>> of one of the two special "no-" prefix parsing cases (which I'm not =
overly
> >>>> happy about).
> >>>>
> >>>> Even if not done that way I'm puzzled by the way you spell out the i=
nteraction
> >>>> of "hwp" and "hdc": As you say in the description, "hdc" is meaningf=
ul only when
> >>>> "hwp" was specified, so even if not merged with the governors group =
"hwp" should
> >>>> come first, and "hdc" ought to be rejected if "hwp" wasn't first spe=
cified. (The
> >>>> way you've spelled it out it actually looks to be kind of the other =
way around.)
> >>>
> >>> I placed them in alphabetical order, but, yes, it doesn't make sense.
> >>>
> >>>> Strictly speaking "maxfreq" and "minfreq" also should be objected to=
 when "hwp"
> >>>> was specified.
> >>>>
> >>>> Overall I'm getting the impression that beyond your "verbose" relate=
d adjustment
> >>>> more is needed, if you're meaning to get things closer to how we par=
se the
> >>>> option (splitting across multiple lines to help see what I mean):
> >>>>
> >>>> `=3D none
> >>>>  | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
> >>>>                           [{,hwp[,hdc]|[,maxfreq=3D<maxfreq>[,minfre=
q=3D<minfreq>]}]
> >>>>                           [,verbose]]}
> >>>>  | dom0-kernel`
> >>>>
> >>>> (We're still parsing in a more relaxed way, e.g. minfreq may come ah=
ead of
> >>>> maxfreq, but better be more tight in the doc than too relaxed.)
> >>>>
> >>>> Furthermore while max/min freq don't apply directly, there are still=
 two MSRs
> >>>> controlling bounds at the package and logical processor levels.
> >>>
> >>> Well, we only program the logical processor level MSRs because we
> >>> don't have a good idea of the packages to know when we can skip
> >>> writing an MSR.
> >>>
> >>> How about this:
> >>> `=3D none
> >>>  | {{ <boolean> | xen } {
> >>> [:{powersave|performance|ondemand|userspace}[,maxfreq=3D<maxfreq>[,mi=
nfreq=3D<minfreq>]]
> >>>                         | [:hwp[,hdc]] }
> >>>                           [,verbose]]}
> >>>  | dom0-kernel`
> >>
> >> Looks right, yes.
> >
> > There is a wrinkle to using the hwp governor.  The hwp governor was
> > named "hwp-internal", so it needs to be renamed to "hwp" for use with
> > command line parsing.  That means the checking for "-internal" needs
> > to change to just "hwp" which removes the generality of the original
> > implementation.
>
> I'm afraid I don't see why this would strictly be necessary or a
> consequence.

Maybe I took your comment too far when you mentioned using hwp as a
fake governor.  I used the actual HWP struct cpufreq_governor to hook
into cpufreq_cmdline_parse().  cpufreq_cmdline_parse() uses the that
name for comparison.  But the naming stops being an issue if struct
cpufreq_governor gains a bool .internal flag.  That flag also makes
the registration checks clearer.

> > The other issue is that if you select "hwp" as the governor, but HWP
> > hardware support is not available, then hwp_available() needs to reset
> > the governor back to the default.  This feels like a layering
> > violation.
>
> Layering violation - yes. But why would the governor need resetting in
> this case? If HWP was asked for but isn't available, I don't think any
> other cpufreq handling (and hence governor) should be put in place.
> And turning off cpufreq altogether (if necessary in the first place)
> wouldn't, to me, feel as much like a layering violation.

My goal was for Xen to use HWP if available and fallback to the acpi
cpufreq driver if not.  That to me seems more user-friendly than
disabling cpufreq.

            if ( hwp_available() )
                ret =3D hwp_register_driver();
            else
                ret =3D cpufreq_register_driver(&acpi_cpufreq_driver);

If we are setting cpufreq_opt_governor to enter hwp_available(), but
then HWP isn't available, it seems to me that we need to reset
cpufreq_opt_governor when exiting hwp_available() false.

Regards,
Jason

