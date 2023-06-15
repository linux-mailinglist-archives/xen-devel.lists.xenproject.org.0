Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA5731CEF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549709.858394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pAL-0005vU-9M; Thu, 15 Jun 2023 15:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549709.858394; Thu, 15 Jun 2023 15:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pAL-0005sk-67; Thu, 15 Jun 2023 15:45:41 +0000
Received: by outflank-mailman (input) for mailman id 549709;
 Thu, 15 Jun 2023 15:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Djv=CD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9pAJ-0005sd-T0
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:45:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acc0dea8-0b93-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:45:38 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so2451434a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:45:38 -0700 (PDT)
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
X-Inumbo-ID: acc0dea8-0b93-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686843938; x=1689435938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUGQdEOFDd5kOXlnIo177KaIHTBcAk19g9JtNc8L+zU=;
        b=RMrFItNGooPZT0zA35PJuOR2a6MZQ3GJ7SiWK/gzsxOEaVUjccLelqDRLW7FJk6FKZ
         pS4PudsGFl0GaRabHVwYTAwTzQratChZuC+/khCr8Nqj4eS4W6g7RNiZWUFbNix4NOSP
         SZXGcrvTLz3mt4ta2iC0hZiyfnQpCQAwkYNYKOt6Q/vQ3fuB/S64pFmUzfBL8dY492gs
         5mS/XyDmCvzFD+Ze5+ZFT3BjehJms1ZE/HsmDn4ZWgiUth54WqeiDOOuRfpg+BfPQ0j0
         v9p04H7h350S+i6luecqMfGxjOlsQHdCEDv/kPL31bev0+6tusK1ITd41L7cZ/8w3vZL
         htdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843938; x=1689435938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUGQdEOFDd5kOXlnIo177KaIHTBcAk19g9JtNc8L+zU=;
        b=GkREWKmsbe0avrpfFlP3VPNETdirIuiCJt1NuMl2F9S4yaT6Ged1G5HA2Qswnqk6Mc
         vrx1ZuOu1LF+aUocsAm3uHM9sxFTiQZQil10quufjG+hGFrQ0evNx9rMGDpshgMTQoTW
         16u0+IQ9qd8hZ473kW+PvcVeqDJAazMJh4KBtYOl7f//v3Zf/oSyAfjkRB1K9xr17L7c
         Or89tJRAQkEMmKph20N8nqI1FZUt/DolKUJ3PhHqDPnwLnYfCA+/OjIsF9yTxpDulMRi
         c1ZuW+s+5XcRN4/SXB6lpI2/4HPZHnhJTZMaDR1AwZkpd44pL//guImx3VSy4H2J/ClB
         FwxQ==
X-Gm-Message-State: AC+VfDy+f3wIRUekVwVpi3pQQ36kPtd6t6sVU0RzUpmTqEKfRkoShwJn
	F+oKwNjcoaZdBx6WjEB217DuTAvbs6KanVmWHHY8BrVG5Pw=
X-Google-Smtp-Source: ACHHUZ6gsd4J8IBK0rJ73Wh7Utb4okruPgifrfmaBQSI7CcnW9DlOsBtPyDsUahnhoTPta9c0tOmKW5++Z/GVAkjYOM=
X-Received: by 2002:aa7:d413:0:b0:516:9fef:f8e7 with SMTP id
 z19-20020aa7d413000000b005169feff8e7mr10897082edq.3.1686843937644; Thu, 15
 Jun 2023 08:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-6-jandryuk@gmail.com>
 <4ee7b593-6e87-25f3-83f8-6309c1cddbfc@suse.com> <CAKf6xpu_KtLzxANGbs5ZhdKCcSGhwnH7Xac=zP+W5vVBJ_PkNw@mail.gmail.com>
 <e50e36f0-0a12-8265-de4c-7cac079b4c7b@suse.com>
In-Reply-To: <e50e36f0-0a12-8265-de4c-7cac079b4c7b@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Jun 2023 11:45:25 -0400
Message-ID: <CAKf6xpsO9poPadUEco2f0M2bg4tPzJPdry7OZXAAECzRsM_M8w@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pmstat&xenpm: Re-arrage for cpufreq union
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 11:22=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 15.06.2023 17:05, Jason Andryuk wrote:
> > On Thu, Jun 15, 2023 at 10:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >> On 14.06.2023 20:02, Jason Andryuk wrote:
> >>> Move some code around now that common xen_sysctl_pm_op get_para field=
s
> >>> are together.  In particular, the scaling governor information like
> >>> scaling_available_governors is inside the union, so it is not always
> >>> available.
> >>>
> >>> With that, gov_num may be 0, so bounce buffer handling needs
> >>> to be modified.
> >>>
> >>> scaling_governor won't be filled for hwp, so this will simplify the
> >>> change when it is introduced.
> >>
> >> While I think this suitably describes the tool stack side changes, ...
> >>
> >>> --- a/xen/drivers/acpi/pmstat.c
> >>> +++ b/xen/drivers/acpi/pmstat.c
> >>> @@ -239,11 +239,24 @@ static int get_cpufreq_para(struct xen_sysctl_p=
m_op *op)
> >>>      if ( ret )
> >>>          return ret;
> >>>
> >>> +    op->u.get_para.cpuinfo_cur_freq =3D
> >>> +        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy-=
>cur;
> >>> +    op->u.get_para.cpuinfo_max_freq =3D policy->cpuinfo.max_freq;
> >>> +    op->u.get_para.cpuinfo_min_freq =3D policy->cpuinfo.min_freq;
> >>> +    op->u.get_para.turbo_enabled =3D cpufreq_get_turbo_status(op->cp=
uid);
> >>> +
> >>> +    if ( cpufreq_driver.name[0] )
> >>> +        strlcpy(op->u.get_para.scaling_driver,
> >>> +            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> >>> +    else
> >>> +        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NA=
ME_LEN);
> >>> +
> >>>      if ( !(scaling_available_governors =3D
> >>>             xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> >>>          return -ENOMEM;
> >>> -    if ( (ret =3D read_scaling_available_governors(scaling_available=
_governors,
> >>> -                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> >>> +    if ( (ret =3D read_scaling_available_governors(
> >>> +                    scaling_available_governors,
> >>> +                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> >>>      {
> >>>          xfree(scaling_available_governors);
> >>>          return ret;
> >>> @@ -254,26 +267,16 @@ static int get_cpufreq_para(struct xen_sysctl_p=
m_op *op)
> >>>      if ( ret )
> >>>          return ret;
> >>>
> >>> -    op->u.get_para.cpuinfo_cur_freq =3D
> >>> -        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy-=
>cur;
> >>> -    op->u.get_para.cpuinfo_max_freq =3D policy->cpuinfo.max_freq;
> >>> -    op->u.get_para.cpuinfo_min_freq =3D policy->cpuinfo.min_freq;
> >>> -
> >>>      op->u.get_para.u.s.scaling_cur_freq =3D policy->cur;
> >>>      op->u.get_para.u.s.scaling_max_freq =3D policy->max;
> >>>      op->u.get_para.u.s.scaling_min_freq =3D policy->min;
> >>>
> >>> -    if ( cpufreq_driver.name[0] )
> >>> -        strlcpy(op->u.get_para.scaling_driver,
> >>> -            cpufreq_driver.name, CPUFREQ_NAME_LEN);
> >>> -    else
> >>> -        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NA=
ME_LEN);
> >>> -
> >>>      if ( policy->governor->name[0] )
> >>>          strlcpy(op->u.get_para.u.s.scaling_governor,
> >>>              policy->governor->name, CPUFREQ_NAME_LEN);
> >>>      else
> >>> -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUF=
REQ_NAME_LEN);
> >>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> >>> +                CPUFREQ_NAME_LEN);
> >>>
> >>>      /* governor specific para */
> >>>      if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> >>> @@ -291,7 +294,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_=
op *op)
> >>>              &op->u.get_para.u.s.u.ondemand.sampling_rate,
> >>>              &op->u.get_para.u.s.u.ondemand.up_threshold);
> >>>      }
> >>> -    op->u.get_para.turbo_enabled =3D cpufreq_get_turbo_status(op->cp=
uid);
> >>>
> >>>      return ret;
> >>>  }
> >>
> >> ... all I see on the hypervisor side is re-ordering of steps and re-fo=
rmatting
> >> of over-long lines. It's not clear to me why what you do is necessary =
for your
> >> purpose.
> >
> > The purpose was to move accesses to the nested struct and union
> > "op->u.get_para.u.s.u" to the end of the function, and the accesses to
> > common fields (e.g. op->u.get_para.turbo_enabled) earlier.  This
> > simplifies the changes in "cpufreq: Export HWP parameters to userspace
> > as CPPC".
>
> Could you mention this as (part of) the purpose in the description?

Certainly.

> > These governor fields get indented, and that needed some re-formatting.
>
> Would it maybe make sense to split the function?

While that could be done, I don't think it's needed.  Maybe you'll
feel otherwise after you look at "cpufreq: Export HWP parameters to
userspace as CPPC".

Regards,
Jason

