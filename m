Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14D74F789
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 19:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561847.878415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJHV2-00037B-EA; Tue, 11 Jul 2023 17:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561847.878415; Tue, 11 Jul 2023 17:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJHV2-00034p-BX; Tue, 11 Jul 2023 17:50:08 +0000
Received: by outflank-mailman (input) for mailman id 561847;
 Tue, 11 Jul 2023 17:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjKM=C5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qJHV1-00034f-0z
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 17:50:07 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5de4d970-2013-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 19:50:04 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4faaaa476a9so9810651e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jul 2023 10:50:04 -0700 (PDT)
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
X-Inumbo-ID: 5de4d970-2013-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689097804; x=1691689804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUN8KD9tNvZb3y3+8dxnWQJeVLSAh3t75kfY9QrgH2k=;
        b=bHi7PUi2I6I2oIk3UgsJIhjETDMcTKwdoicNEc0jhbWX49lwBa2O74rnYfvwqPBSwn
         CELp9WFakiZDoMjgiReoxljpMCmjMuFsPk/nVfJRESvzkyd/hbbq8DAPklU596f/5Obi
         jcYMFnyPOwJ6hUGgEOY2y7IzqPWdgLLA6axuJYICbgvRaQE0OL/x0hKSuS2d+slgm4FI
         mlS1aJAHIqkf0S2eNXkPv78Wpw7Cwha302TQrE4uj+2Y8U3de8N57omLw2AbYsRtKtnm
         lT+e6nnvJzDvbyvfwkPYKdRKdarTyDVgwGmWauO26nlJVe7mcOQFe2qisVakF15LAod5
         WZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689097804; x=1691689804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUN8KD9tNvZb3y3+8dxnWQJeVLSAh3t75kfY9QrgH2k=;
        b=VulmB6/SWiAVDHhNugR5BvofF2qISrdkDtCz1NLEd3gdmn052XqzQgV5z9qV0kOCjf
         qLa8oTlGQS/izh6wIAW0ScsLdfk0bKEpsgR0dtE2VGDjLpZAXsVmAa9qxkjXS974HrgI
         9btMyxQoO+W4o00iYy7UsuQHm0ZIflp1NoWrbaNxmBzVe67lYv9GB+Ax31Thv8IqMCbD
         /xD30pqII5eOcPNmoEKCmMfg+ZOwMbzR4wtHDgRYHfv+HgfE8w527OEGVzo1xyIN1H9h
         flfTWFkZpCfhkcJzxYWZYVlEQYwJdgx4WRNMIzijpgg+SyHRNnXaB7JXcDg77ErqvmOX
         hJeg==
X-Gm-Message-State: ABy/qLYQcevIzz4ryCvm14PihRyVKO3iXS1rOg6qmV+FwW9T42sNisL1
	CA4QyBEW59bmlmvgIHQjnEheSv1fvZosYTBn08mL0zjr
X-Google-Smtp-Source: APBJJlEn46nXPlwtaHk44qlRraM1wbmWIgjX5liWpikmIs3LCtU93Y8Awj7xACjKgBeFM9aHmuDJyN4K9PVHjX6N7uU=
X-Received: by 2002:a05:6512:1595:b0:4fb:52a3:e809 with SMTP id
 bp21-20020a056512159500b004fb52a3e809mr15336922lfb.28.1689097803825; Tue, 11
 Jul 2023 10:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com> <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com> <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
 <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com>
In-Reply-To: <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Jul 2023 13:49:51 -0400
Message-ID: <CAKf6xpspsyShp2O8SLK+=VQvxd=Uaewg-JHYAFPqEPmEWvDRAg@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 10:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 11.07.2023 16:16, Jason Andryuk wrote:
> > On Tue, Jul 11, 2023 at 4:18=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 10.07.2023 17:22, Jason Andryuk wrote:
> >>> On Mon, Jul 10, 2023 at 9:13=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 06.07.2023 20:54, Jason Andryuk wrote:
> >>>>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not =
supported by all Dom0 kernels.
> >>>>>  * `<maxfreq>` and `<minfreq>` are integers which represent max and=
 min processor frequencies
> >>>>>    respectively.
> >>>>>  * `verbose` option can be included as a string or also as `verbose=
=3D<integer>`
> >>>>> +  for `xen`.  It is a boolean for `hwp`.
> >>>>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on su=
pported Intel
> >>>>> +  hardware.  HWP is a Skylake+ feature which provides better CPU p=
ower
> >>>>> +  management.  The default is disabled.  If `hwp` is selected, but=
 hardware
> >>>>> +  support is not available, Xen will fallback to cpufreq=3Dxen.
> >>>>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC=
 enables the
> >>>>> +  processor to autonomously force physical package components into=
 idle state.
> >>>>> +  The default is enabled, but the option only applies when `hwp` i=
s enabled.
> >>>>> +
> >>>>> +There is also support for `;`-separated fallback options:
> >>>>> +`cpufreq=3Dhwp,verbose;xen`.  This first tries `hwp` and falls bac=
k to `xen`
> >>>>> +if unavailable.
> >>>>
> >>>> In the given example, does "verbose" also apply to the fallback case=
? If so,
> >>>> perhaps better "cpufreq=3Dhwp;xen,verbose", to eliminate that ambigu=
ity?
> >>>
> >>> Yes, "verbose" is applied to both.  I can make the change.  I
> >>> mentioned it in the commit message, but I'll mention it here as well.
> >>
> >> FTAOD my earlier comment implied that the spelling form you use above
> >> should not even be accepted when parsing. I.e. it was not just about
> >> the doc aspect.
> >
> > Oh.  So what exactly do you want then?
> >
> > There is a single cpufreq_verbose variable today that is set by either
> > cpufreq=3Dhwp,verbose or cpufreq=3Dxen,verbose.  Is that okay, or shoul=
d
> > the "xen" and "hwp" each get a separate variable?
> >
> > Do you only want to allow a single trailing "verbose" to apply to all
> > of cpufreq (cpufreq=3D$foo,verbose)?  Or do you want "verbose" to be
> > only valid for "xen"?  Both cpufreq_cmdline_parse() and
> > hwp_cmdline_parse() just loop over their options and don't care about
> > order, even though the documentation lists verbose last.  Would you
> > want "cpufreq=3Dhwp,verbose,hdc" to fail to parse?
> >
> > All parsing is done upfront before knowing whether "xen" or "hwp" will
> > be used as the cpufreq driver, so there is a trickiness for
> > implementing "verbose" only for one option.  Similarly,
> > "cpufreq=3Dhwp,invalid;xen" will try "hwp" (but not "xen")  since the
> > live variables are updated.  Even without this patch, cpufreq will be
> > configured up to an invalid parameter.
>
> Right, and I'd like to see "hwp;xen" to be treated as a "unit", with
> ",verbose" applying to whichever succeeds initializing. I don't think
> there is much point to have separate verbosity variables.

When you say "hwp;xen" as a unit, you don't mean to intermix all the
options like:
cpufreq=3Dhwp;xen:ondemand,hdc,maxfreq=3D42
do you?

Because of the suboptions, I don't treat "hwp;xen" as a unit, but as
strings separated by ';'.
That allows the full selection of parameters like:
cpufreq=3Dhwc,no-hdc;xen:ondemand,maxfreq=3D42,minfreq=3D0

This lets each respective parser handle the options it knows about.
This does duplicate "verbose" handling.  cpufreq_cmdline_parse() and
hwp_cmdline_parse() are also usable when only one of "hwp" or "xen" is
specified.

These all work:
cpufreq=3Dxen:ondemand,verbose
cpufreq=3Dhwp,hdc,verbose
cpurfre=3Dhwp,hdc;xen:ondemand,verbose

To disallow "verbose" in "cpufreq=3Dhwp,verbose;xen" would require extra
code, and setup_cpufreq_option() is already rather complicated IMO.
It's a corner case, but doesn't seem harmful to me.   Hmmm, making the
above fail parsing may be worse since it would only try "hwp" without
a fallback to "xen".

I just want to be clear on exactly what I need to implement.

Regards,
Jason

