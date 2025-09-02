Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02779B40C63
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107218.1457730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV5P-00042H-8r; Tue, 02 Sep 2025 17:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107218.1457730; Tue, 02 Sep 2025 17:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utV5P-00040m-4R; Tue, 02 Sep 2025 17:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1107218;
 Tue, 02 Sep 2025 17:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utV5N-0003ze-V3
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:46:25 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf18c8a7-8824-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:46:25 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f687fd3bdso5658824e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 10:46:25 -0700 (PDT)
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
X-Inumbo-ID: bf18c8a7-8824-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756835185; x=1757439985; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM/wKtAH/uAh0FVZjh4gVX9F0y/yeEChczro5pZMJ74=;
        b=ONdiZXi7y55oLU5OCcmRwbFCZMwSN5BdOLeyzPgiFS4tV7tkGBqw6nu6CbNexrcXj3
         kJ6Y4iv9UKT20pXhv1SlaITydIuLYqx/8jopThUE7mN4/FV4ar8GsRpvXA29YjHStamJ
         4Lltvm74KrMI6YjhqYFRkKd6nDof1MxB3BPPhf7Rg4+40RDmJeU3bJOoEp9zGqkOIQRy
         AlaDW2WlSF0kpmx+UCCFHdtz/FbD1s3SnlyW6S/Y53LY078BRQwFXDsxeXI42O3We3KB
         auCe7mRRsnjn4YFrNkSqDZnmBR8Fetv8aAIfH0ugJ5VpCNq7i+LILTMiQgmeHzD3FNgf
         VX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835185; x=1757439985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM/wKtAH/uAh0FVZjh4gVX9F0y/yeEChczro5pZMJ74=;
        b=Klx5IS37/k2RR0edfaJ9/bbwoUYR6hp1xRkBZmMpUHwV7MM9OkQbDO4Ka7uWn97vuj
         MTT7WoHwckQFchHHdDXoXVzgsiHetX+CkDl5iUsILhrtkMBAHAVpaREjM3vPGHJLhGFG
         VmCOBKnU8O3m1rxXDkvwHrKYFpEsuHZkACWBii8vf1pOb19YhCmaqYsP/zzBjVy8VDZ/
         972NZUcxLcAgiWzb2Rr0qxXK/hw0JJUSOjSwCwAqbg1o+OHR5RydEf/Mu84MZ7leutqv
         O4W3uffyeCYb05bw2faYmb/YyOg5m6JRPHkoSPjbkTs2T3Iv51qYn838UelVH5HFwHFy
         PblQ==
X-Gm-Message-State: AOJu0YwwN8+eXj9ftjbAnDA2FfmWuZc248UKx95q48YFuK6iiW3OVA9f
	qjDcsZOrGCF52w6gdi1Q2bf4TN8nbBZ0vS6ui8uTzq4LnF9B0Xm/uLjw0wqLiQ2+IBt49cqvMui
	dmIfhZbFnwQnjeAPwkhmLpcH/bEEbTtU=
X-Gm-Gg: ASbGncuigW9C5LCamFHafowd37Cr2qbVscm/rsJrtkZ5Q/mAO+agJdqAR+Pn6yy85F7
	+n7zBnKva8Q7iwRr3aVrweP52dU48bMzX2D1U7HM+jBwqP8DD4ip/CxbcRTFWdUwjwTfrwA3ivY
	veyibcdp2ptVW6KZcflH6bAxD2wdxNYZokffonM9rixtLcNWmERqU+eYUBQcMINjTzBmfbZQney
	+BQPDNA96rBFphn
X-Google-Smtp-Source: AGHT+IGRBZsoq0gunQOIp9dd/bzrryT5gQ0T+UsGYqgYJ8yVuIKR8bkRz6b+q43kAhvTvyvsNn01j9yGa/eTWk/B1Ok=
X-Received: by 2002:a05:6512:61cb:20b0:560:87c4:e105 with SMTP id
 2adb3069b0e04-56087c4e3fdmr319169e87.33.1756835184696; Tue, 02 Sep 2025
 10:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <a846121bf586667f9a7a984955589acb9026bd68.1756763487.git.mykola_kvach@epam.com>
 <361a7a79-a11c-4c35-a688-0937e9d65fcf@gmail.com>
In-Reply-To: <361a7a79-a11c-4c35-a688-0937e9d65fcf@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 20:46:13 +0300
X-Gm-Features: Ac12FXwDIHO1Dze7SK2hINvNNjKdhVj5zSGdbrHT-DFoCTcv0_f2aiUzV53wWYo
Message-ID: <CAGeoDV_DR9CvWwCZhOLW6Vr_kkrrfR72Kin3kLqdSpNY7PrBKw@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] xen/arm: Suspend/resume IOMMU on Xen suspend/resume
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Rahul Singh <rahul.singh@arm.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On Tue, Sep 2, 2025 at 8:25=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gmai=
l.com> wrote:
>
>
>
> On 02.09.25 01:10, Mykola Kvach wrote:
>
> Hello Mykola
>
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > This is done using generic iommu_suspend/resume functions that cause
> > IOMMU driver specific suspend/resume handlers to be called for enabled
> > IOMMU (if one has suspend/resume driver handlers implemented).
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V6:
> > - Drop iommu_enabled check from host system suspend.
>
> I do not have any comments for the updated version, thanks.

Thank you for your time and the review!

>
>
> > ---
> >   xen/arch/arm/suspend.c                | 11 +++++++++++
> >   xen/drivers/passthrough/arm/smmu-v3.c | 10 ++++++++++
> >   xen/drivers/passthrough/arm/smmu.c    | 10 ++++++++++
> >   3 files changed, 31 insertions(+)
> >
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index 35b20581f1..f3a3b831c5 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -5,6 +5,7 @@
> >
> >   #include <xen/console.h>
> >   #include <xen/cpu.h>
> > +#include <xen/iommu.h>
> >   #include <xen/llc-coloring.h>
> >   #include <xen/sched.h>
> >   #include <xen/tasklet.h>
> > @@ -62,6 +63,13 @@ static void cf_check system_suspend(void *data)
> >
> >       time_suspend();
> >
> > +    status =3D iommu_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_time;
> > +    }
> > +
> >       console_start_sync();
> >       status =3D console_suspend();
> >       if ( status )
> > @@ -118,6 +126,9 @@ static void cf_check system_suspend(void *data)
> >       console_resume();
> >       console_end_sync();
> >
> > +    iommu_resume();
> > +
> > + resume_time:
> >       time_resume();
> >
> >    resume_nonboot_cpus:
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index 81071f4018..f887faf7dc 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -2854,6 +2854,13 @@ static void arm_smmu_iommu_xen_domain_teardown(s=
truct domain *d)
> >       xfree(xen_domain);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +static int arm_smmu_suspend(void)
> > +{
> > +     return -ENOSYS;
> > +}
> > +#endif
> > +
> >   static const struct iommu_ops arm_smmu_iommu_ops =3D {
> >       .page_sizes             =3D PAGE_SIZE_4K,
> >       .init                   =3D arm_smmu_iommu_xen_domain_init,
> > @@ -2866,6 +2873,9 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> >       .unmap_page             =3D arm_iommu_unmap_page,
> >       .dt_xlate               =3D arm_smmu_dt_xlate,
> >       .add_device             =3D arm_smmu_add_device,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +     .suspend                =3D arm_smmu_suspend,
> > +#endif
> >   };
> >
> >   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> > diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrou=
gh/arm/smmu.c
> > index 22d306d0cb..45f29ef8ec 100644
> > --- a/xen/drivers/passthrough/arm/smmu.c
> > +++ b/xen/drivers/passthrough/arm/smmu.c
> > @@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struc=
t domain *d)
> >       xfree(xen_domain);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +static int arm_smmu_suspend(void)
> > +{
> > +     return -ENOSYS;
> > +}
> > +#endif
> > +
> >   static const struct iommu_ops arm_smmu_iommu_ops =3D {
> >       .page_sizes =3D PAGE_SIZE_4K,
> >       .init =3D arm_smmu_iommu_domain_init,
> > @@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
> >       .map_page =3D arm_iommu_map_page,
> >       .unmap_page =3D arm_iommu_unmap_page,
> >       .dt_xlate =3D arm_smmu_dt_xlate_generic,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend =3D arm_smmu_suspend,
> > +#endif
> >   };
> >
> >   static struct arm_smmu_device *find_smmu(const struct device *dev)
>

Best regards,
Mykola

