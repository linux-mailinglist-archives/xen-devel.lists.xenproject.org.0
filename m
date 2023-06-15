Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C8731F90
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 19:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549770.858504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9rCr-0008Sz-12; Thu, 15 Jun 2023 17:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549770.858504; Thu, 15 Jun 2023 17:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9rCq-0008QZ-Tl; Thu, 15 Jun 2023 17:56:24 +0000
Received: by outflank-mailman (input) for mailman id 549770;
 Thu, 15 Jun 2023 17:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Djv=CD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9rCp-0008QT-KV
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 17:56:23 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee87235c-0ba5-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 19:56:19 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso33464821fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 10:56:19 -0700 (PDT)
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
X-Inumbo-ID: ee87235c-0ba5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686851779; x=1689443779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ReuSc0lTm5pJuFPDEcSwwMC9WpxishEdjGAo3hpGg8=;
        b=S77fGWPuAgagfA8nlE6LO413kMn/fIGjsUdgK60zM/9MRM0n+LHgYcLqlPNsuxxqpI
         yiRR6MiUqRObzJ1gIF0euGFT1uKHYgO2ORqgykD+T9M/JHY6Yy+6ka2+otlCUPGTldkU
         JAou1LqgtIuDrZ5r/B30yET7dpSmNKK1T7XWswsnA9mkZhi474AjEDS4t0LIqKBWQsC2
         0XFBhEo1sg69yNYI5Q9I4kk17+AolwGde0HEK3asztdl3GJ3RTpNMZdnA3wc5ufiJmhV
         YWzov52PHPFUHqGrnwPtBGC6M9uhB0MbJle59h88ne8it6opRvNhy7CT/HisvFF9ZyuK
         ur3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686851779; x=1689443779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ReuSc0lTm5pJuFPDEcSwwMC9WpxishEdjGAo3hpGg8=;
        b=GzIAsxxuDXdr87ZYTtMWd/oqXWln39w0yj/cOvSyD7WC24dTZ5yX8bPmxNeMuw1tNP
         MdgQ1KlRYLpUX95raAlMEsPtxdIe0j0qLItN0k4/9dr8+nIZS7g1B1KkeVz1tZN4TIP+
         VZUvhgTGnP7i5p3Juh4eAsHI1/jC1RPexOTa2vMUOOLIYiLyvcC20V5l4qs1GV4xrsB2
         4nwPlSImmNIbTFOcvb8D9lUT6AYzeQqLX2SRrpRWEOsSk64o9BnL4QZzegG7g6kD8E8i
         zrC6HrlnfEbz/hYnePy4/3BYz+7ZFrmeEF83hf5iZJZAvMzTu0iKZozVctL0HdZcMl6Z
         Tk3A==
X-Gm-Message-State: AC+VfDwUAKTumQ8OiYwvg/Np5a/D2Kr17uLDIIPxAJ6hFiy1OqtP9Z3Q
	184k43Nn6Q1sZRFiuMFoQup94b/X8SBd09P+WJ0=
X-Google-Smtp-Source: ACHHUZ7ho+I0gz+wHDeASs3vc70Wgvy85Ve/oBJ1TjOWp9IFayr65wYbNW8+TuPoWUF478fNd7aAzwmzfk8OnKUoi4M=
X-Received: by 2002:a2e:994a:0:b0:2ac:7505:de2d with SMTP id
 r10-20020a2e994a000000b002ac7505de2dmr140460ljj.23.1686851778648; Thu, 15 Jun
 2023 10:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-5-jandryuk@gmail.com>
 <194760c8-31fe-d0f7-828f-b8a637884989@suse.com> <CAKf6xpvoD2vVDzFU-VzXVTN1td0j-tN_VB7Z4z7ZfMwCWh+Tjg@mail.gmail.com>
 <7d00571e-7f04-3cf1-dafe-05d811318e92@suse.com>
In-Reply-To: <7d00571e-7f04-3cf1-dafe-05d811318e92@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Jun 2023 13:56:06 -0400
Message-ID: <CAKf6xps4MbDgjGp4qNg8nGbsEubVvHGzA3ByijF1uMTnWufWSw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] xen/sysctl: Nest cpufreq scaling options
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 10:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 15.06.2023 16:07, Jason Andryuk wrote:
> > On Thu, Jun 15, 2023 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 14.06.2023 20:02, Jason Andryuk wrote:
> >>> --- a/tools/include/xenctrl.h
> >>> +++ b/tools/include/xenctrl.h
> >>> @@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
> >>>      uint32_t cpuinfo_cur_freq;
> >>>      uint32_t cpuinfo_max_freq;
> >>>      uint32_t cpuinfo_min_freq;
> >>> -    uint32_t scaling_cur_freq;
> >>> -
> >>> -    char scaling_governor[CPUFREQ_NAME_LEN];
> >>> -    uint32_t scaling_max_freq;
> >>> -    uint32_t scaling_min_freq;
> >>> -
> >>> -    /* for specific governor */
> >>>      union {
> >>> -        xc_userspace_t userspace;
> >>> -        xc_ondemand_t ondemand;
> >>> +        struct {
> >>> +            uint32_t scaling_cur_freq;
> >>> +
> >>> +            char scaling_governor[CPUFREQ_NAME_LEN];
> >>> +            uint32_t scaling_max_freq;
> >>> +            uint32_t scaling_min_freq;
> >>> +
> >>> +            /* for specific governor */
> >>> +            union {
> >>> +                xc_userspace_t userspace;
> >>> +                xc_ondemand_t ondemand;
> >>> +            } u;
> >>> +        } s;
> >>>      } u;
> >>
> >> There's no comment in the header that this needs to mirror the sysctl
> >> struct. Does it really need changing?
> >
> > Since this matched the other structure, I kept them in sync.  The
> > cppc/hwp data needs to be represented somehow, and it gets introduced
> > in the same way for both later.  If this doesn't get the new nested
> > struct, then maybe fields could be placed into the single union.  That
> > would grow the overall struct and have unused fields for hwp.
>
> I guess I need to leave this to the maintainers then. Still ...
>
> >>> --- a/tools/libs/ctrl/xc_pm.c
> >>> +++ b/tools/libs/ctrl/xc_pm.c
> >>> @@ -265,15 +265,10 @@ int xc_get_cpufreq_para(xc_interface *xch, int =
cpuid,
> >>>          user_para->cpuinfo_cur_freq =3D sys_para->cpuinfo_cur_freq;
> >>>          user_para->cpuinfo_max_freq =3D sys_para->cpuinfo_max_freq;
> >>>          user_para->cpuinfo_min_freq =3D sys_para->cpuinfo_min_freq;
> >>> -        user_para->scaling_cur_freq =3D sys_para->scaling_cur_freq;
> >>> -        user_para->scaling_max_freq =3D sys_para->scaling_max_freq;
> >>> -        user_para->scaling_min_freq =3D sys_para->scaling_min_freq;
> >>>          user_para->turbo_enabled    =3D sys_para->turbo_enabled;
> >>>
> >>>          memcpy(user_para->scaling_driver,
> >>>                  sys_para->scaling_driver, CPUFREQ_NAME_LEN);
> >>> -        memcpy(user_para->scaling_governor,
> >>> -                sys_para->scaling_governor, CPUFREQ_NAME_LEN);
> >>
> >> Did you really mean to remove the copying of these 4 entities, rather
> >> than simply change the way the fields are accessed?
> >
> > Yes, it was intentional.
> >
> > The immediate following lines are:
> >         /* copy to user_para no matter what cpufreq governor */
> >         BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=3D
> >              sizeof(((struct xen_get_cpufreq_para *)0)->u));
> >
> >         memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));
>
> ... this suggests that some matching is intended, yet it's not clear
> to me why then the hole struct-s aren't assumed to be matching / made
> match.

The tools version replaces struct xen_$foo with xc_$foo typedefs.
Maybe it's just to enforce the typedefs?

Regards,
Jason

