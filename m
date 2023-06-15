Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B90731C24
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549678.858341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oXG-0007eE-1P; Thu, 15 Jun 2023 15:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549678.858341; Thu, 15 Jun 2023 15:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oXF-0007bf-UE; Thu, 15 Jun 2023 15:05:17 +0000
Received: by outflank-mailman (input) for mailman id 549678;
 Thu, 15 Jun 2023 15:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Djv=CD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9oXE-0007bW-ML
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:05:16 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08070086-0b8e-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:05:14 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b448470602so9413331fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:05:14 -0700 (PDT)
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
X-Inumbo-ID: 08070086-0b8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686841514; x=1689433514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXp3CZvNX7rLpeiqaWkvWunNWyaPzPAcCiwzgNquZkQ=;
        b=R/ukOAYm2c5ih5pusYkOljU0/K7m+m2ZFWQGw6pO2X8DB6RoWE9ZkAXUgfT6UiSCsZ
         0LEK0WpgHFe3FdkfbgdpZvjVHGks3kkof21WLG7ZpodrP11pUudc78g45fZtoiaMRBYt
         fs3pI781XwSnzMDt+2H1OHGuzULbuxyvEAZzHKIbLQA/jB1JjcEGNiL8qSTQPfV4BDGn
         vdS74OPQfg2skDJTHWH3k5e6BP8nzBhpWnkXYntocAgEloKaWFRP7llDukJXI6NQDvwo
         krRBcZ/Ks7kXP52OXVDbKy3fabp29j56nQcY9lA3WryxmOFrM8g/pCV69suzWXR15U0O
         nGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841514; x=1689433514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXp3CZvNX7rLpeiqaWkvWunNWyaPzPAcCiwzgNquZkQ=;
        b=H2MAoPd0xkmeUfPZAQs87CMBxEa9/tqOM5Jq/TG8kVUdLNFdo1kceKD2DZmHTKbzKe
         y59JAIAhgBYVpGrFsz6BlXUTno8g4pUFuVqi5RfAFOUJcCSiIx1Fn4nBc4vhi6mHUHbE
         TvFEZsegb9GaTxs8b4SYh6nTEFHOhFR7Gxu5qd7B3+bcCJb9tHMmM4GqT550AyD49MzL
         RloCMZZ4gbU3ledD+a5FLI8OwTG1CwFMHoD6qqudSCcX9PZg9mCE3/A6AFK8Sa0CiWFO
         PUXlKOvXLoUhrLcO1+0OZ1V3SsZfJPjW9H+/aMFMwjWqlWJqhvK72BrRo2UorcVBWhjr
         GOOQ==
X-Gm-Message-State: AC+VfDwin/ZcGuJMjd2eJ8sXGj8R4CEBn328ycpqSCliXHhwjAVq1Bix
	jri92pf/GGvCBYwPlaJiLF5V4VXmvL0g6usuBOVL8jS7gdY=
X-Google-Smtp-Source: ACHHUZ4PfzmXsZvKj2RKMOl5B1GEddv8NM6kEzdnPWgZf8c9h/ql2FecBAxj1v1eLqeBf8AFvUMk6Zs9kXxKnxE1Y3o=
X-Received: by 2002:a05:651c:102d:b0:2a8:ce32:867 with SMTP id
 w13-20020a05651c102d00b002a8ce320867mr9061171ljm.53.1686841513696; Thu, 15
 Jun 2023 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-6-jandryuk@gmail.com>
 <4ee7b593-6e87-25f3-83f8-6309c1cddbfc@suse.com>
In-Reply-To: <4ee7b593-6e87-25f3-83f8-6309c1cddbfc@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Jun 2023 11:05:01 -0400
Message-ID: <CAKf6xpu_KtLzxANGbs5ZhdKCcSGhwnH7Xac=zP+W5vVBJ_PkNw@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pmstat&xenpm: Re-arrage for cpufreq union
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 10:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 14.06.2023 20:02, Jason Andryuk wrote:
> > Move some code around now that common xen_sysctl_pm_op get_para fields
> > are together.  In particular, the scaling governor information like
> > scaling_available_governors is inside the union, so it is not always
> > available.
> >
> > With that, gov_num may be 0, so bounce buffer handling needs
> > to be modified.
> >
> > scaling_governor won't be filled for hwp, so this will simplify the
> > change when it is introduced.
>
> While I think this suitably describes the tool stack side changes, ...
>
> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -239,11 +239,24 @@ static int get_cpufreq_para(struct xen_sysctl_pm_=
op *op)
> >      if ( ret )
> >          return ret;
> >
> > +    op->u.get_para.cpuinfo_cur_freq =3D
> > +        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->c=
ur;
> > +    op->u.get_para.cpuinfo_max_freq =3D policy->cpuinfo.max_freq;
> > +    op->u.get_para.cpuinfo_min_freq =3D policy->cpuinfo.min_freq;
> > +    op->u.get_para.turbo_enabled =3D cpufreq_get_turbo_status(op->cpui=
d);
> > +
> > +    if ( cpufreq_driver.name[0] )
> > +        strlcpy(op->u.get_para.scaling_driver,
> > +            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> > +    else
> > +        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME=
_LEN);
> > +
> >      if ( !(scaling_available_governors =3D
> >             xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> >          return -ENOMEM;
> > -    if ( (ret =3D read_scaling_available_governors(scaling_available_g=
overnors,
> > -                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> > +    if ( (ret =3D read_scaling_available_governors(
> > +                    scaling_available_governors,
> > +                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> >      {
> >          xfree(scaling_available_governors);
> >          return ret;
> > @@ -254,26 +267,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_=
op *op)
> >      if ( ret )
> >          return ret;
> >
> > -    op->u.get_para.cpuinfo_cur_freq =3D
> > -        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->c=
ur;
> > -    op->u.get_para.cpuinfo_max_freq =3D policy->cpuinfo.max_freq;
> > -    op->u.get_para.cpuinfo_min_freq =3D policy->cpuinfo.min_freq;
> > -
> >      op->u.get_para.u.s.scaling_cur_freq =3D policy->cur;
> >      op->u.get_para.u.s.scaling_max_freq =3D policy->max;
> >      op->u.get_para.u.s.scaling_min_freq =3D policy->min;
> >
> > -    if ( cpufreq_driver.name[0] )
> > -        strlcpy(op->u.get_para.scaling_driver,
> > -            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> > -    else
> > -        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME=
_LEN);
> > -
> >      if ( policy->governor->name[0] )
> >          strlcpy(op->u.get_para.u.s.scaling_governor,
> >              policy->governor->name, CPUFREQ_NAME_LEN);
> >      else
> > -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFRE=
Q_NAME_LEN);
> > +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> > +                CPUFREQ_NAME_LEN);
> >
> >      /* governor specific para */
> >      if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> > @@ -291,7 +294,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op=
 *op)
> >              &op->u.get_para.u.s.u.ondemand.sampling_rate,
> >              &op->u.get_para.u.s.u.ondemand.up_threshold);
> >      }
> > -    op->u.get_para.turbo_enabled =3D cpufreq_get_turbo_status(op->cpui=
d);
> >
> >      return ret;
> >  }
>
> ... all I see on the hypervisor side is re-ordering of steps and re-forma=
tting
> of over-long lines. It's not clear to me why what you do is necessary for=
 your
> purpose.

The purpose was to move accesses to the nested struct and union
"op->u.get_para.u.s.u" to the end of the function, and the accesses to
common fields (e.g. op->u.get_para.turbo_enabled) earlier.  This
simplifies the changes in "cpufreq: Export HWP parameters to userspace
as CPPC".  These governor fields get indented, and that needed some
re-formatting.  Some re-formatting slipped in while I rebased changes
- sorry about that.

Regards,
Jason

