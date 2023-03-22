Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4E6C53E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 19:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513570.794761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf3NR-0000XK-Gw; Wed, 22 Mar 2023 18:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513570.794761; Wed, 22 Mar 2023 18:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf3NR-0000UE-E3; Wed, 22 Mar 2023 18:40:01 +0000
Received: by outflank-mailman (input) for mailman id 513570;
 Wed, 22 Mar 2023 18:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wfD=7O=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1pf3NP-0000RV-7d
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 18:39:59 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f02f4db4-c8e0-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 19:39:55 +0100 (CET)
Received: by mail-ed1-f51.google.com with SMTP id cn12so31171633edb.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 11:39:54 -0700 (PDT)
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
X-Inumbo-ID: f02f4db4-c8e0-11ed-b464-930f4c7d94ae
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679510394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7rV+SRpydAcO3aF+tnR91nn7Q5fcg5T3XLPDHeJhik=;
        b=smxuavjpi7gioTq6cDLcAW0buP7hj1dwkQ5CkMwBb8MFa5PIQMBgcy+T3o6yt2e84E
         HxwGKDUnBUvspFs+yr0jwgl9PnJ44gO6Pi3hStUfSq8YQv+TE2KLz8bDqaZ46cdZw8Ns
         bzjhxNck9zmWXZVB38f5LCyh8LP57q5BhprlL78bHqBaAWFsG7R8BcMoDK5K6Bt9f6kz
         CMYBSoNZ8/RNrhZ1ZhHOtxNO6I93J0QTmz+o8G/e8AY68gLPnvxNPy4DA95QAIgg+vcU
         pz3MiWnRms4gDU6yyNXxI70tFCp7mslBtwT7vkvKVN/NWVzTg9XMEsU1cMmEi2pib2JE
         g3Tw==
X-Gm-Message-State: AO0yUKXau15whESG94Hc1PxsyU3vpldrF7DtyFdaBgGy1U7XDdGAkMj/
	OvVLc+khmlvDyXFpFnLce2BJboGo1K0XTYgi/55/qZ5NAfo=
X-Google-Smtp-Source: AK7set8GTSoMTVUaheMEuVEUivJgOMkcKrAXGDPunim0E7Q4xVL8zvucT3EGhB3/pzUfwesiYc8Tqf8mCVJACUP5OQo=
X-Received: by 2002:a17:906:ca41:b0:939:a51a:dc30 with SMTP id
 jx1-20020a170906ca4100b00939a51adc30mr1794905ejb.2.1679510394073; Wed, 22 Mar
 2023 11:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230322111330.63651-1-roger.pau@citrix.com>
In-Reply-To: <20230322111330.63651-1-roger.pau@citrix.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Mar 2023 19:39:43 +0100
Message-ID: <CAJZ5v0jRNHDsDwXPJa01x2t35vNboVxb4hysE4dfThrJs9kT7Q@mail.gmail.com>
Subject: Re: [PATCH v6] ACPI: processor: Fix evaluating _PDC method when
 running as Xen dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Alex Chiang <achiang@hp.com>, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:13=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> In ACPI systems, the OS can direct power management, as opposed to the
> firmware.  This OS-directed Power Management is called OSPM.  Part of
> telling the firmware that the OS going to direct power management is
> making ACPI "_PDC" (Processor Driver Capabilities) calls.  These _PDC
> methods must be evaluated for every processor object.  If these _PDC
> calls are not completed for every processor it can lead to
> inconsistency and later failures in things like the CPU frequency
> driver.
>
> In a Xen system, the dom0 kernel is responsible for system-wide power
> management.  The dom0 kernel is in charge of OSPM.  However, the
> number of CPUs available to dom0 can be different than the number of
> CPUs physically present on the system.
>
> This leads to a problem: the dom0 kernel needs to evaluate _PDC for
> all the processors, but it can't always see them.
>
> In dom0 kernels, ignore the existing ACPI method for determining if a
> processor is physically present because it might not be accurate.
> Instead, ask the hypervisor for this information.
>
> Fix this by introducing a custom function to use when running as Xen
> dom0 in order to check whether a processor object matches a CPU that's
> online.  Such checking is done using the existing information fetched
> by the Xen pCPU subsystem, extending it to also store the ACPI ID.
>
> This ensures that _PDC method gets evaluated for all physically online
> CPUs, regardless of the number of CPUs made available to dom0.
>
> Fixes: 5d554a7bb064 ('ACPI: processor: add internal processor_physically_=
present()')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v5:
>  - Include bug.h header for the inline dummy helper.
>  - Constify pcpu local variable in xen_processor_present().
>
> Changes since v4:
>  - Move definition/declaration of xen_processor_present() to different
>    header.
>  - Fold subject edit.
>
> Changes since v3:
>  - Protect xen_processor_present() definition with CONFIG_ACPI.
>
> Changes since v2:
>  - Extend and use the existing pcpu functionality.
>
> Changes since v1:
>  - Reword commit message.
> ---
>  drivers/acpi/processor_pdc.c | 11 +++++++++++
>  drivers/xen/pcpu.c           | 20 ++++++++++++++++++++
>  include/xen/xen.h            | 11 +++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/acpi/processor_pdc.c b/drivers/acpi/processor_pdc.c
> index 8c3f82c9fff3..18fb04523f93 100644
> --- a/drivers/acpi/processor_pdc.c
> +++ b/drivers/acpi/processor_pdc.c
> @@ -14,6 +14,8 @@
>  #include <linux/acpi.h>
>  #include <acpi/processor.h>
>
> +#include <xen/xen.h>
> +
>  #include "internal.h"
>
>  static bool __init processor_physically_present(acpi_handle handle)
> @@ -47,6 +49,15 @@ static bool __init processor_physically_present(acpi_h=
andle handle)
>                 return false;
>         }
>
> +       if (xen_initial_domain())
> +               /*
> +                * When running as a Xen dom0 the number of processors Li=
nux
> +                * sees can be different from the real number of processo=
rs on
> +                * the system, and we still need to execute _PDC for all =
of
> +                * them.
> +                */
> +               return xen_processor_present(acpi_id);
> +
>         type =3D (acpi_type =3D=3D ACPI_TYPE_DEVICE) ? 1 : 0;
>         cpuid =3D acpi_get_cpuid(handle, type, acpi_id);
>
> diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
> index fd3a644b0855..b3e3d1bb37f3 100644
> --- a/drivers/xen/pcpu.c
> +++ b/drivers/xen/pcpu.c
> @@ -58,6 +58,7 @@ struct pcpu {
>         struct list_head list;
>         struct device dev;
>         uint32_t cpu_id;
> +       uint32_t acpi_id;
>         uint32_t flags;
>  };
>
> @@ -249,6 +250,7 @@ static struct pcpu *create_and_register_pcpu(struct x=
enpf_pcpuinfo *info)
>
>         INIT_LIST_HEAD(&pcpu->list);
>         pcpu->cpu_id =3D info->xen_cpuid;
> +       pcpu->acpi_id =3D info->acpi_id;
>         pcpu->flags =3D info->flags;
>
>         /* Need hold on xen_pcpu_lock before pcpu list manipulations */
> @@ -381,3 +383,21 @@ static int __init xen_pcpu_init(void)
>         return ret;
>  }
>  arch_initcall(xen_pcpu_init);
> +
> +#ifdef CONFIG_ACPI
> +bool __init xen_processor_present(uint32_t acpi_id)
> +{
> +       const struct pcpu *pcpu;
> +       bool online =3D false;
> +
> +       mutex_lock(&xen_pcpu_lock);
> +       list_for_each_entry(pcpu, &xen_pcpus, list)
> +               if (pcpu->acpi_id =3D=3D acpi_id) {
> +                       online =3D pcpu->flags & XEN_PCPU_FLAGS_ONLINE;
> +                       break;
> +               }
> +       mutex_unlock(&xen_pcpu_lock);
> +
> +       return online;
> +}
> +#endif
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 7adf59837c25..0efeb652f9b8 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -71,4 +71,15 @@ static inline void xen_free_unpopulated_pages(unsigned=
 int nr_pages,
>  }
>  #endif
>
> +#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI) && defined(CONFIG_X=
86)
> +bool __init xen_processor_present(uint32_t acpi_id);
> +#else
> +#include <linux/bug.h>
> +static inline bool xen_processor_present(uint32_t acpi_id)
> +{
> +       BUG();
> +       return false;
> +}
> +#endif
> +
>  #endif /* _XEN_XEN_H */
> --

Applied as 6.4 material.

I've added the R-by from Juergen to it, because the difference between
it and the v4 for which the tag was provided is merely a build fix.

