Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9AB36FE2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 18:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094850.1450067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqwMv-00052D-Cw; Tue, 26 Aug 2025 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094850.1450067; Tue, 26 Aug 2025 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqwMv-0004zO-AB; Tue, 26 Aug 2025 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1094850;
 Tue, 26 Aug 2025 16:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqwMt-0004yn-LC
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 16:17:55 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38ca5dc9-8298-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 18:17:54 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f42523658so2784273e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 09:17:54 -0700 (PDT)
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
X-Inumbo-ID: 38ca5dc9-8298-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756225074; x=1756829874; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAcvPVSkSqtErIqieITcAtFbJ2W1vczHq24oF4CqUME=;
        b=lKvcC89vvf5vfW80dgS//xr4BzEq57y4k1gySaY+SCriHYlnFOx2QyPQMMDfkUjimV
         ptrRKqu/7wRoeszl0GO0uANrtFIVbQTnkbcj353aB7FJCNnK1tmeObYPMJ+2B0gu07lT
         gjiP7aMJbG8FViIdxvtAR6zg+80DV+ycOR4hte40s1VPNGLuqFwEOc3iLz8LcnIU6glY
         KntK0CN97Qs8HcX/qQyumnuRUh0azoew2+R0aQhIqinngooCM8aX7KvmV/TiW3aqTUh6
         eriqDpLchvOyy+V/MbQYVE/7va05yVtkSo1G9MzylEq88vVbBG3h2jtvb0gPIYNEL5Dq
         V6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225074; x=1756829874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAcvPVSkSqtErIqieITcAtFbJ2W1vczHq24oF4CqUME=;
        b=n1tD5g68GEbLIkBNuEv4twBSZAcDdaTLX1DIHFmq3gno3vXZ5HCqfLnCmcXSx7XYbd
         vZREKa0R1apwDweMWUVlFPI3HslFy5dIvhd2vGnSL5GZLE9xZEFCitMe4a5O+uPBJLiW
         sskx62/R82jtAsGJsbWIaw1KjuLSiH6gFaxFrHKWB22NgVcLUTcdSxJSC9+85JRaxd8a
         YaDMGdQ9LTuBwU7Vcn4Se1Bi5wkfvmkv00PQKUqi1aSWD65Q+sT9TLtBrPRFPKrcJCxH
         EOv8a5QkEDf6buXDBo4AAHaBliLL/IAh/rtiD9H/7jK1CDUkHQx7l1FgfksRt5CtolOy
         qkoA==
X-Forwarded-Encrypted: i=1; AJvYcCWGzViTZV7xzIyi1S6gs+asLPAfAXCK10jHPczRHkZXpWm8dVP7skvuX0QGEaCAxFYQEorzFOySMck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyotiLpxLWkcpKpHw9B8IZvi910eXEb2kGktHqQKcUbeC9vN8fB
	0fvLBUyre1D5thFCIQUGqxkQMHuUvizn81xEr/Aej5jxUFuptoz0gC4QVW+QEspFGnWkU1K2HZe
	sS3g/yiF3fbH3Mz0pLBqikUjiDdyyhoA=
X-Gm-Gg: ASbGncu7lUyPDQXlJXKm/v38aVug8AKlmw1Yb7W3fEr/Fi+LDCSEg3YBomKTdzKiAnn
	cKuRncseI/ElIDvq+9gGOL9XfTJ1vbm9luehNmmk4KtyWuAgajGCETeVrWw87ITwVR5cwdAMCxN
	S1vdFM3PGwWuhTGXHktQCG+fsluYcvo1d/sQCfgK2xRgUU2A4jyTtnpiIiNlszXsKFx/qMtpm3a
	1XPlvAEz5NrOFUXskWFAmNrL50=
X-Google-Smtp-Source: AGHT+IGpKxX60oRhL52egjrFIE8Pa/p7MtFYckPF999x0rCSghR65ST15CBs7gAeibc0E24KA1NboJYSDezbTQqvMm4=
X-Received: by 2002:a05:6512:2908:b0:553:3422:c39d with SMTP id
 2adb3069b0e04-55f0d3a567bmr3778437e87.37.1756225073953; Tue, 26 Aug 2025
 09:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
 <87frdh7wk0.fsf@epam.com> <CAGeoDV9ftF_hihWJHqEV8R8X6ddbbZ_GCe7pgftD+S1u+FCr8g@mail.gmail.com>
 <f42d9f13-3817-4922-b112-3cc807c0e4d7@gmail.com>
In-Reply-To: <f42d9f13-3817-4922-b112-3cc807c0e4d7@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 19:17:42 +0300
X-Gm-Features: Ac12FXxHknqA53E7z_u6ppadShEkTb6W003dJQXa0BuhHGah5lbDoxJwJpaaXeE
Message-ID: <CAGeoDV9RbAeTHw4xBqtGL0bRgyNa6cur3f+Oj0+7fwnAhJrz+A@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen suspend/resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On Tue, Aug 26, 2025 at 6:01=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
>
>
> On 26.08.25 16:42, Mykola Kvach wrote:
>
> Hello Mykola, Volodymyr
>
>
> > Hi Volodymyr,
> >
> > On Sat, Aug 23, 2025 at 8:55=E2=80=AFPM Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com> wrote:
> >>
> >> Hi,
> >>
> >> Mykola Kvach <xakep.amatop@gmail.com> writes:
> >>
> >>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>
> >>> This is done using generic iommu_suspend/resume functions that cause
> >>> IOMMU driver specific suspend/resume handlers to be called for enable=
d
> >>> IOMMU (if one has suspend/resume driver handlers implemented).
> >>>
> >>> These handlers work only when IPMMU-VMSA is used; otherwise,
> >>> we return an error during system suspend requests.
> >>>
> >>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> Tested-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> I think, the Tested-by here should be dropped. A lot of time has passed
> since Oleksandr provided the tag, and the code has changed a bit (I am
> afraid, the tag is now stale).

Got it, I=E2=80=99ll drop the Tested-by tag in the next version.

>
>
> >>> ---
> >>>   xen/arch/arm/suspend.c | 21 +++++++++++++++++++++
> >>>   1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> >>> index b5398e5ca6..cb86426ebd 100644
> >>> --- a/xen/arch/arm/suspend.c
> >>> +++ b/xen/arch/arm/suspend.c
> >>> @@ -4,6 +4,7 @@
> >>>   #include <asm/suspend.h>
> >>>   #include <xen/console.h>
> >>>   #include <xen/cpu.h>
> >>> +#include <xen/iommu.h>
> >>>   #include <xen/llc-coloring.h>
> >>>   #include <xen/sched.h>
> >>>
> >>> @@ -49,6 +50,13 @@ static long system_suspend(void *data)
> >>>
> >>>       time_suspend();
> >>>
> >>> +    status =3D iommu_suspend();
> >>> +    if ( status )
> >>> +    {
> >>> +        system_state =3D SYS_STATE_resume;
> >>> +        goto resume_time;
> >>> +    }
> >>> +
> >>>       local_irq_save(flags);
> >>>       status =3D gic_suspend();
> >>>       if ( status )
> >>> @@ -105,6 +113,10 @@ static long system_suspend(void *data)
> >>>
> >>>    resume_irqs:
> >>>       local_irq_restore(flags);
> >>> +
> >>> +    iommu_resume();
> >>> +
> >>> + resume_time:
> >>>       time_resume();
> >>>
> >>>    resume_nonboot_cpus:
> >>> @@ -140,6 +152,15 @@ int host_system_suspend(void)
> >>>           return -ENOSYS;
> >>>       }
> >>>
> >>> +    /* TODO: drop check once suspend/resume support for SMMU is impl=
emented */
> >>> +#ifndef CONFIG_IPMMU_VMSA
>
> The original patch did not seem to have this check...
>
> >>
> >> This check is meaningless, as you can have CONFIG_IPMMU_VMSA enabled
> >> along with CONFIG_ARM_SMMU on a system with SMMU. I think it is enough
> >> that iommu_suspend() will fail during system_suspend(), isn't it?
> >
> > Not exactly. In the case of SMMU, we don=E2=80=99t have valid iommu_sus=
pend/iommu_resume
> > handlers. So it=E2=80=99s possible to have CONFIG_ARM_SMMU enabled and =
iommu_enabled
> > set, but without the appropriate suspend handlers. This could lead to
> > a crash during
> > system_suspend().
>
>   ... I also have doubts whether this check is needed (at least in its
> current shape). Xen has 2 SMMU drivers at the moment. Lets imagine that
> S2R for SMMUv3 is implemented, so we will need to extend #ifndef above
> to cover CONFIG_ARM_SMMU_V3 as well, right (otherwise an attempt to
> suspend SMMUv2-powered system will lead to crash)? Or there is a plan to
> implement S2R for both SMMU implementations?
>
> ***
>
> If we care for possible crash because iommu_suspend is NULL for
> SMMUv2/SMMUv3, maybe we should consider adding stub callbacks to the
> both SMMU drivers, just returning -ENOSYS?

I=E2=80=99m fine with that proposal, adding stub callbacks sounds like a cl=
ean
solution.

>
> Let's see what other people's opinions are.
>
> >
> >
> >>
> >>
> >>> +    if ( iommu_enabled )
> >>> +    {
> >>> +        dprintk(XENLOG_ERR, "IOMMU is enabled, suspend not supported=
 yet\n");
> >>> +        return -ENOSYS;
> >>> +    }
> >>> +#endif
> >>> +
> >>>       /*
> >>>        * system_suspend should be called when Dom0 finalizes the susp=
end
> >>>        * procedure from its boot core (VCPU#0). However, Dom0's VCPU#=
0 could
> >>
> >> --
> >> WBR, Volodymyr
> >
> > Best regards,
> > Mykola
> >
>

Best regards,
Mykola

