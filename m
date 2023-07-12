Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AC751161
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 21:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562741.879525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJffH-0008On-O7; Wed, 12 Jul 2023 19:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562741.879525; Wed, 12 Jul 2023 19:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJffH-0008Lj-Kd; Wed, 12 Jul 2023 19:38:19 +0000
Received: by outflank-mailman (input) for mailman id 562741;
 Wed, 12 Jul 2023 19:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OL/P=C6=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qJffG-0008Ld-Jd
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 19:38:18 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a623d2e2-20eb-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 21:38:17 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e6113437cso3554620a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 12:38:17 -0700 (PDT)
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
X-Inumbo-ID: a623d2e2-20eb-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689190697; x=1691782697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdBmotNbBMmDJfHlV/l0karpg8+a4cpZORK1uq4GvLA=;
        b=hFl+ksKSwfzM78VR9t3NiGE1EQSMsYbjHrNZW38BIu2d4vR52c/VU1RA0N7k5FMgK2
         ItgA6lrZow1td6RcY2e8YtPVEi4mCoDyPPLPA6+5+NwEkW2GnIoszS54X1cM3WqaWP2X
         vAXxRwd3NYhdagHG46gVxx2i8Mc1Q+tumrzKPgALiiRWjNlgDKAsYzot2tKAV7fbtCC6
         eRb+HDUvAJvXZXx2Mn0X/nLRN1r/dTuCWNHecSRxyrI7WPudHdslrRGQ6uj3o6+hRfib
         5qMJOqbAct21AcitDmRtP9iGMml2n0rSU6ELIvYMZaRrr/g61rM2cnwhMkTfGzdbWWuR
         ahTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689190697; x=1691782697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdBmotNbBMmDJfHlV/l0karpg8+a4cpZORK1uq4GvLA=;
        b=a69lnQtn0DH2AtB5loaJ+10SSp5WNZcGcYAlb2Y0ZMjfdEC3eEcDu9LJVeb3FQHYok
         P0L56RQPS/BgQX1FmtechZqvAABWR1KSU15hek/OQ92raknZ4X5xLQTonLqqoWReXPTv
         YZyoU4i9N+y+mUvmMWfZSzZGnDTDDa0jvckR3Nd9LYiCrnqU8eCIx4ho0SB+mqj0rbRh
         vAApGdkIcJFYA/5MX8Dt1B8P4ivSfNk9KcpJGlKa8PZNbh7IUnL0vvNj9r0ix/YnZ6qj
         jNAHUFlntlO/4t5k1RgrKNT5vzsl36m0rrv5ZrCIGt8HxxJFHTc8vBy+DKVeIRyCY03x
         nnXg==
X-Gm-Message-State: ABy/qLYDVJMDwZN1Rv6Gu+7EDIW5YuFaxByg1ACZzKEmnxt8Xy2+cuqs
	7iPjBBBEwXJXmyx2iLoeZrUQb2RJSqPLXNjeuaU=
X-Google-Smtp-Source: APBJJlFwOMNxZdrApkL4LRIdSWZM4srUharo5o9qPqMURwZpX7RxJdHszdsNlwTwsa4ea6u3FCpgExSFvZVPJdoj0ck=
X-Received: by 2002:a05:6402:120b:b0:51b:ec86:b49a with SMTP id
 c11-20020a056402120b00b0051bec86b49amr19242766edw.7.1689190696429; Wed, 12
 Jul 2023 12:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com> <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com> <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
 <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com> <CAKf6xpspsyShp2O8SLK+=VQvxd=Uaewg-JHYAFPqEPmEWvDRAg@mail.gmail.com>
 <f768b046-4e14-30b3-479b-bdcdebb4d397@suse.com>
In-Reply-To: <f768b046-4e14-30b3-479b-bdcdebb4d397@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 12 Jul 2023 15:38:04 -0400
Message-ID: <CAKf6xpt53io1TGDy0hmfhBoDqz5bUHNbpU37Y0xtpUqPVMJd4g@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 4:43=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.07.2023 19:49, Jason Andryuk wrote:
> > On Tue, Jul 11, 2023 at 10:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >> On 11.07.2023 16:16, Jason Andryuk wrote:
> >>> On Tue, Jul 11, 2023 at 4:18=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 10.07.2023 17:22, Jason Andryuk wrote:
> >>>>> On Mon, Jul 10, 2023 at 9:13=E2=80=AFAM Jan Beulich <jbeulich@suse.=
com> wrote:
> >>>>>> On 06.07.2023 20:54, Jason Andryuk wrote:
> >>>>>>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and no=
t supported by all Dom0 kernels.
> >>>>>>>  * `<maxfreq>` and `<minfreq>` are integers which represent max a=
nd min processor frequencies
> >>>>>>>    respectively.
> >>>>>>>  * `verbose` option can be included as a string or also as `verbo=
se=3D<integer>`
> >>>>>>> +  for `xen`.  It is a boolean for `hwp`.
> >>>>>>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on =
supported Intel
> >>>>>>> +  hardware.  HWP is a Skylake+ feature which provides better CPU=
 power
> >>>>>>> +  management.  The default is disabled.  If `hwp` is selected, b=
ut hardware
> >>>>>>> +  support is not available, Xen will fallback to cpufreq=3Dxen.
> >>>>>>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  H=
DC enables the
> >>>>>>> +  processor to autonomously force physical package components in=
to idle state.
> >>>>>>> +  The default is enabled, but the option only applies when `hwp`=
 is enabled.
> >>>>>>> +
> >>>>>>> +There is also support for `;`-separated fallback options:
> >>>>>>> +`cpufreq=3Dhwp,verbose;xen`.  This first tries `hwp` and falls b=
ack to `xen`
> >>>>>>> +if unavailable.
> >>>>>>
> >>>>>> In the given example, does "verbose" also apply to the fallback ca=
se? If so,
> >>>>>> perhaps better "cpufreq=3Dhwp;xen,verbose", to eliminate that ambi=
guity?
> >>>>>
> >>>>> Yes, "verbose" is applied to both.  I can make the change.  I
> >>>>> mentioned it in the commit message, but I'll mention it here as wel=
l.
> >>>>
> >>>> FTAOD my earlier comment implied that the spelling form you use abov=
e
> >>>> should not even be accepted when parsing. I.e. it was not just about
> >>>> the doc aspect.
> >>>
> >>> Oh.  So what exactly do you want then?
> >>>
> >>> There is a single cpufreq_verbose variable today that is set by eithe=
r
> >>> cpufreq=3Dhwp,verbose or cpufreq=3Dxen,verbose.  Is that okay, or sho=
uld
> >>> the "xen" and "hwp" each get a separate variable?
> >>>
> >>> Do you only want to allow a single trailing "verbose" to apply to all
> >>> of cpufreq (cpufreq=3D$foo,verbose)?  Or do you want "verbose" to be
> >>> only valid for "xen"?  Both cpufreq_cmdline_parse() and
> >>> hwp_cmdline_parse() just loop over their options and don't care about
> >>> order, even though the documentation lists verbose last.  Would you
> >>> want "cpufreq=3Dhwp,verbose,hdc" to fail to parse?
> >>>
> >>> All parsing is done upfront before knowing whether "xen" or "hwp" wil=
l
> >>> be used as the cpufreq driver, so there is a trickiness for
> >>> implementing "verbose" only for one option.  Similarly,
> >>> "cpufreq=3Dhwp,invalid;xen" will try "hwp" (but not "xen")  since the
> >>> live variables are updated.  Even without this patch, cpufreq will be
> >>> configured up to an invalid parameter.
> >>
> >> Right, and I'd like to see "hwp;xen" to be treated as a "unit", with
> >> ",verbose" applying to whichever succeeds initializing. I don't think
> >> there is much point to have separate verbosity variables.
> >
> > When you say "hwp;xen" as a unit, you don't mean to intermix all the
> > options like:
> > cpufreq=3Dhwp;xen:ondemand,hdc,maxfreq=3D42
> > do you?
> >
> > Because of the suboptions, I don't treat "hwp;xen" as a unit, but as
> > strings separated by ';'.
> > That allows the full selection of parameters like:
> > cpufreq=3Dhwc,no-hdc;xen:ondemand,maxfreq=3D42,minfreq=3D0
> >
> > This lets each respective parser handle the options it knows about.
> > This does duplicate "verbose" handling.  cpufreq_cmdline_parse() and
> > hwp_cmdline_parse() are also usable when only one of "hwp" or "xen" is
> > specified.
> >
> > These all work:
> > cpufreq=3Dxen:ondemand,verbose
> > cpufreq=3Dhwp,hdc,verbose
> > cpurfre=3Dhwp,hdc;xen:ondemand,verbose
> >
> > To disallow "verbose" in "cpufreq=3Dhwp,verbose;xen" would require extr=
a
> > code, and setup_cpufreq_option() is already rather complicated IMO.
> > It's a corner case, but doesn't seem harmful to me.   Hmmm, making the
> > above fail parsing may be worse since it would only try "hwp" without
> > a fallback to "xen".
> >
> > I just want to be clear on exactly what I need to implement.
>
> Maybe we need to take a step back a revisit what option forms actually
> make sense to express. Part of the problem may be that we permit (but
> not require afaics) the use of colon as a separator after the "main"
> option ("xen", "none", "dom0-kernel", and perhaps now "hwp"). Such a
> colon suggests that what follows are sub-options applicable to that
> specific "main" option, especially since what follows "xen:" can be
> more than just the governor name (and in fact no governor name is
> required - I've been using cpufreq=3Dxen:up_threshold=3D40 on some of my
> systems, for example). I have to admit that I don't see a clean way
> of (largely) retaining existing behavior while at the same time
> avoiding ambiguity with your additions (and it may well be that there
> is pre-existing ambiguity as well, but the introduction of yet
> another separator [semicolon] clearly makes things worse in this
> regard, as it suggests strong grouping).
>
> Maybe we want to consider an alternative form of expressing the
> fallback. What about e.g. "cpufreq=3Dhwp:hdc(xen:ondemand),verbose"
> (and its possible variations)?

I think I like this less.

I think the strong grouping of ';' is nice.  It clearly delineates the
first and fallback option, and it could be extended to N in the
future.  I like that if you have 2 working cpufreq=3D lines, you just
concatenate them together with the ';'.  If the suboptions were all a
disjoint set, I think it would be easy to pick this.

The downside is the "verbose" handling.  The strong grouping makes
verbose seemingly only apply to the specified group and not globally.
Not the best, but we can document that away.

I implemented something to only allow specifying "verbose" in only the
last ';' grouping.  It's not that bad, but seems a little weird in
light of the strong grouping since it uses the same comma separator.
Also, failing to parse "verbose" in the first part breaks the
concatenation.

A different or additional separator could be used to separate verbose,
but that seems kinda overkill and would not be backwards compatible.

Another idea could be to allow multiple cpufreq=3D lines.  Each one
would call setup_cpufreq_option(), which could track the entries in
cpufreq_xen_opts[].  It still doesn't show a single "verbose" applies
globally.  And it breaks "later options override earlier ones."
"cpufreqfallback=3D" is another option, but I don't particularly care
for that.

I think I just prefer the ';' separator and letting "verbose" be
weird.  It maps well into the existing syntax and I liked it when you
first suggested it.

Regards,
Jason

