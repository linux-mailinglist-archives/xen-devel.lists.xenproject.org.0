Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HA0JqHMu2mXogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:14:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1D2C9536
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256915.1551381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3AOq-0001vv-5a; Thu, 19 Mar 2026 10:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256915.1551381; Thu, 19 Mar 2026 10:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3AOq-0001tE-2t; Thu, 19 Mar 2026 10:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1256915;
 Thu, 19 Mar 2026 10:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1n9k=BT=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w3AOo-0001t8-Jg
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 10:14:42 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7136724e-237c-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 11:14:40 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5a279ce9475so1557274e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 03:14:40 -0700 (PDT)
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
X-Inumbo-ID: 7136724e-237c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1773915280; cv=none;
        d=google.com; s=arc-20240605;
        b=cpNnqsQjpwgNGihWiEv8vGSC1AGo1tDZDsLXHWUo7zVSY70MIuT4K1d4C/FybsGEK4
         u0OCAYvIKAMln+riFVy0VdTV1xT53PIaMkebBP0P5xCZSst/FBoEDC/X9DcMJ4OLYMog
         E4O8cVynnrx/z9QZgOjucdtEwuUYn/35mGZcxabiiFzoHL7+crmVdVILNasClqZbhwip
         N7jzObf7oSqkca2eSi6EgPxCHTpsQ25Lc1Ymm4LIIJMfztLUJkCOOxxH0c7vlvxKx0Oi
         emvb9QmbsOklJsjPnTnwo1dV+qJuuRYk4pU6Oh0a6D16vfElWrHXk8FxMZyiG7wHZuWZ
         sOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLudv52DxGrfHYRIi9eHlPNqebBUto5d/XqXeWUEk7I=;
        fh=XPwOTaEPrdk2pN2RgjfihMkJ4NQu8t1nAUIywJrC5RY=;
        b=ECulBka5SoO/0VoHBSdX/w5RkizDGhnsWgKUgBe6YPlC+EodqEikGt+yuzd67uW1PB
         GxvCP2LbZvjs2XBaox4j62PY37eZUsTq9AbfhnyHviJu2cGzD/DJqIWcN8Kcf1brpQdk
         fLnIdboC7cKik0ltww9ShXnT66Yv8HTvRHo0Hd2ZS8LnGzoP1q0OW9Sv12jYj8eXtWj3
         kAJr1BLXejd12OVnwQv1oIdmPU0ZNvnq9htpARczekZ1HzBf11gP8YQ5bYMbGPvaf/+y
         aSX/J8GHc7JN6jpF9wNwlzBvbscMxtp4RlhI5JD+F888SfxjUDSUjCjDR765Y5XmkS/c
         7WvA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773915280; x=1774520080; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLudv52DxGrfHYRIi9eHlPNqebBUto5d/XqXeWUEk7I=;
        b=ey64mlFAEWRz2KRAuvyF8YWzgQVCgz4ajNxYS2AQQzJPxFeyUycVEo5OgH94j+MYij
         ypdruEWjyFv70TvBq1gtM0O0ZB8TjHIrkq5Dm6NKggTbSS078rfxYVM0cADwwK9AcAqR
         995S1hWA3sHQkIwGq5JKVhWC0eLaEkgMAXqQhdC7OmNNX5hNGOGpYr/BR/LE2DmQzr6J
         efiXYvh4uuqYvDrN/hwFx/JzpFLRYJLKW2yYzvuRSO2+HbJum6ZOammKYLqV4kYYud/Q
         v5vc7jcXWx5eUAs2+X6KbkaAFlpggz1wXYQOMHTT7wfPdwSSrA1JwPbzmpr88Dufyf+E
         SQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915280; x=1774520080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iLudv52DxGrfHYRIi9eHlPNqebBUto5d/XqXeWUEk7I=;
        b=lujBOMRJSvX8BtMWIzqpGm01GsOMADL/xvEri/G8Za4uTm4Hu3/ENuDGkvFSZG3jRM
         ebzKvKyErpj+RFTWZireTb9F3UCWsp5s/JYiKHZ9m/AfU2owdzKb2PO+WjzHB/gORbti
         OQEmyEoPxxYl+amFkXa1BR86nzM4cUHaU+2Dtv8uOefr9ZUk95q1OL1ugAEC/kd60czE
         hNtujOFjGRwphlyzQGfFDAi0zJ2DOHjBp6D3BdlrxWPQ6HgW0ynnhcaMnuOjYCKR4jR5
         8Hxx0SM/F9AZO935v2IkvwFPKb0JrYHc8JYcA02Gtgc53XEQDSfbGpKciVTOLlFQELK1
         l81w==
X-Gm-Message-State: AOJu0YzSdYHiz2vKzDqK146hlijU96FwK5EBCTtTJyBT0wnb9IzC7YIe
	LOSVLmUTffWJF35HHj2Vb8owbtgd6QfQ2oaKo4sQa9Olw9kEPdMpmzbclrnnWeyCuNAgl1dssL1
	0NwUa24nXMV54uCetGi7rw2cz1xO2O78=
X-Gm-Gg: ATEYQzxyBeuBAZUHg/pHKqdWhJYAOGVCtpEHpOcVaSUjOxv+6hI7itfqC0k3uepRzTn
	+rdOEqaYgASG5zADmLRHQJYxG8JEz4pAHI8G5OFAMoo5GVgp0YL3hgFGlDY24n3K1dBQoRez8Wg
	q5MMtBNKsrePFhHwEUqoXMJUi6wTpHX2Fyvuj3S3ShcPa4pCXRhwJUmtuGnjraIx50pYb89cwrd
	aG5ZQ4Zj1PBK5wWZZSc+pbD+pGTXLFzTW1sCgTWEFbPuH2Bc7dY6aEQh74QWCx9CcXI+dA5GNnJ
	93eV
X-Received: by 2002:ac2:4a84:0:b0:5a2:7d5a:3328 with SMTP id
 2adb3069b0e04-5a27de5dba3mr536254e87.24.1773915279732; Thu, 19 Mar 2026
 03:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1765533584.git.mykola_kvach@epam.com> <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
 <04017286-885e-4e81-9e89-f012ee608287@amd.com>
In-Reply-To: <04017286-885e-4e81-9e89-f012ee608287@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Mar 2026 12:14:28 +0200
X-Gm-Features: AaiRm52l6stqVaVmdNKvunRjHl-gntzc7pYQ1k7iPi1eiU6X1KfdSuxkLWJi3oo
Message-ID: <CAGeoDV-oTMYnEJTibOyXFZqNKpyNA3Yf8ffUgEim=tsihs9W1A@mail.gmail.com>
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6B1D2C9536
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:37=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 12/12/2025 14:18, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface=
,
> > allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND ca=
ll
> > (both 32-bit and 64-bit variants).
> >
> > Implementation details:
> > - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Trap and handle SYSTEM_SUSPEND in vPSCI
> > - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
> >   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the syste=
m
> >   in hwdom_shutdown() via domain_shutdown
> > - Require all secondary VCPUs of the calling domain to be offline befor=
e
> >   suspend, as mandated by the PSCI specification
> >
> > The arch_domain_resume() function is an architecture-specific hook that=
 is
> > invoked during domain resume to perform any necessary setup or restorat=
ion
> > steps required by the platform. arch_domain_resume() stays int to propa=
gate
> > errno-style detail into common logging; preserving the integer keeps th=
e
> > reason visible and leaves room for future arch-specific failures or ric=
her
> > handling.
> >
> > The new vpsci_vcpu_up_prepare() helper is called on the resume path to =
set up
> > the vCPU context (such as entry point, some system regs and context ID)=
 before
> > resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of =
common
> > code and avoids intrusive changes to the generic resume flow.
> >
> > Usage:
> >
> > For Linux-based guests, suspend can be initiated with:
> >     echo mem > /sys/power/state
> > or via:
> >     systemctl suspend
> >
> > Resuming the guest is performed from control domain using:
> >       xl resume <domain>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V16:
> > - Refactor error handling in domain_resume: move logging to generic cod=
e,
> >   use explicit return code checking.
> > - Make context clearing conditional on success in arch_domain_resume.
> > - The 'int' return type is retained for arch_domain_resume for consiste=
ncy
> >   with other arch hooks and to allow for specific negative error codes.
> > ---
> >  xen/arch/arm/domain.c                 |  39 +++++++++
> >  xen/arch/arm/include/asm/domain.h     |   2 +
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/suspend.h    |  27 ++++++
> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
> >  xen/common/domain.c                   |  10 +++
> >  xen/include/xen/suspend.h             |  25 ++++++
> >  9 files changed, 205 insertions(+), 22 deletions(-)
> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
> >  create mode 100644 xen/include/xen/suspend.h
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 47973f99d9..f903e7d4f0 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -12,6 +12,8 @@
> >  #include <xen/softirq.h>
> >  #include <xen/wait.h>
> >
> > +#include <public/sched.h>
> > +
> >  #include <asm/arm64/sve.h>
> >  #include <asm/cpuerrata.h>
> >  #include <asm/cpufeature.h>
> > @@ -24,10 +26,12 @@
> >  #include <asm/platform.h>
> >  #include <asm/procinfo.h>
> >  #include <asm/regs.h>
> > +#include <asm/suspend.h>
> >  #include <asm/firmware/sci.h>
> >  #include <asm/tee/tee.h>
> >  #include <asm/vfp.h>
> >  #include <asm/vgic.h>
> > +#include <asm/vpsci.h>
> >  #include <asm/vtimer.h>
> >
> >  #include "vpci.h"
> > @@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      p2m_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    int rc;
> > +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> > +
> > +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspen=
d )
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: is_shutting_dow=
n=3D%u, shutdown_code=3D%u\n",
> > +                d, d->is_shutting_down, d->shutdown_code);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /*
> > +     * It is still possible to call domain_shutdown() with a suspend r=
eason
> > +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote=
_shutdown.
> > +     * In these cases, the resume context will be empty.
> > +     * This is not expected to cause any issues, so we just notify abo=
ut the
> > +     * situation and return without error, allowing the existing logic=
 to
> > +     * proceed as expected.
> > +     */
> > +    if ( !ctx->wake_cpu )
> > +    {
> > +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not pr=
ovided\n",
> > +                d);
> > +        return 0;
> > +    }
> > +
> > +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> > +    if ( !rc )
> > +        memset(ctx, 0, sizeof(*ctx));
> > +
> > +    return rc;
> > +}
> > +
> >  static int is_guest_pv32_psr(uint32_t psr)
> >  {
> >      switch (psr & PSR_MODE_MASK)
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/a=
sm/domain.h
> > index 758ad807e4..66b1246892 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -5,6 +5,7 @@
> >  #include <xen/timer.h>
> >  #include <asm/page.h>
> >  #include <asm/p2m.h>
> > +#include <asm/suspend.h>
> >  #include <asm/vfp.h>
> >  #include <asm/mmio.h>
> >  #include <asm/gic.h>
> > @@ -126,6 +127,7 @@ struct arch_domain
> >      void *sci_data;
> >  #endif
> >
> > +    struct resume_info resume_ctx;
> >  }  __cacheline_aligned;
> >
> >  struct arch_vcpu
> > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/inclu=
de/asm/perfc_defn.h
> > index effd25b69e..8dfcac7e3b 100644
> > --- a/xen/arch/arm/include/asm/perfc_defn.h
> > +++ b/xen/arch/arm/include/asm/perfc_defn.h
> > @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system=
_reset")
> >  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
> >  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
> >  PERFCOUNTER(vpsci_features,            "vpsci: features")
> > +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> >
> >  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> >
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 4780972621..48a93e6b79 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
> >  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
> >  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
> >  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> > +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> >
> >  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
> >  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
> >  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> > +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> >
> >  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > new file mode 100644
> > index 0000000000..313d03ea59
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef ARM_SUSPEND_H
> > +#define ARM_SUSPEND_H
> > +
> > +struct domain;
> > +struct vcpu;
> > +
> > +struct resume_info {
> > +    register_t ep;
> > +    register_t cid;
> > +    struct vcpu *wake_cpu;
> > +};
> > +
> > +int arch_domain_resume(struct domain *d);
> > +
> > +#endif /* ARM_SUSPEND_H */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/as=
m/vpsci.h
> > index 0cca5e6830..d790ab3715 100644
> > --- a/xen/arch/arm/include/asm/vpsci.h
> > +++ b/xen/arch/arm/include/asm/vpsci.h
> > @@ -23,12 +23,15 @@
> >  #include <asm/psci.h>
> >
> >  /* Number of function implemented by virtual PSCI (only 0.2 or later) =
*/
> > -#define VPSCI_NR_FUNCS  12
> > +#define VPSCI_NR_FUNCS  14
> >
> >  /* Functions handle PSCI calls from the guests */
> >  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> >  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> >
> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> > +                          register_t context_id);
> > +
> >  #endif /* __ASM_VPSCI_H__ */
> >
> >  /*
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index 7ba9ccd94b..c4d616ec68 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -10,32 +10,16 @@
> >
> >  #include <public/sched.h>
> >
> > -static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > -                            register_t context_id)
> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> > +                          register_t context_id)
> >  {
> > -    struct vcpu *v;
> > -    struct domain *d =3D current->domain;
> > -    struct vcpu_guest_context *ctxt;
> >      int rc;
> > +    struct domain *d =3D v->domain;
> >      bool is_thumb =3D entry_point & 1;
> > -    register_t vcpuid;
> > -
> > -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > -
> > -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > -        return PSCI_INVALID_PARAMETERS;
> > -
> > -    /* THUMB set is not allowed with 64-bit domain */
> > -    if ( is_64bit_domain(d) && is_thumb )
> > -        return PSCI_INVALID_ADDRESS;
> > -
> > -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > -        return PSCI_ALREADY_ON;
> > +    struct vcpu_guest_context *ctxt;
> >
> >      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> > -        return PSCI_DENIED;
> > -
> > -    vgic_clear_pending_irqs(v);
> > +        return -ENOMEM;
> >
> >      memset(ctxt, 0, sizeof(*ctxt));
> >      ctxt->user_regs.pc64 =3D (u64) entry_point;
> > @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, r=
egister_t entry_point,
> >      free_vcpu_guest_context(ctxt);
> >
> >      if ( rc < 0 )
> > +        return rc;
> > +
> > +    return 0;
> > +}
> > +
> > +static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > +                            register_t context_id)
> > +{
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +    int rc;
> > +    bool is_thumb =3D entry_point & 1;
> > +    register_t vcpuid;
> > +
> > +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > +
> > +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > +        return PSCI_INVALID_PARAMETERS;
> > +
> > +    /* THUMB set is not allowed with 64-bit domain */
> > +    if ( is_64bit_domain(d) && is_thumb )
> > +        return PSCI_INVALID_ADDRESS;
> > +
> > +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > +        return PSCI_ALREADY_ON;
> > +
> > +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> > +    if ( rc )
> >          return PSCI_DENIED;
> >
> > +    vgic_clear_pending_irqs(v);
> >      vcpu_wake(v);
> >
> >      return PSCI_SUCCESS;
> > @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
> >      domain_shutdown(d,SHUTDOWN_reboot);
> >  }
> >
> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_=
t cid)
> > +{
> > +    int32_t rc;
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +    bool is_thumb =3D epoint & 1;
> > +
> > +    /* THUMB set is not allowed with 64-bit domain */
> > +    if ( is_64bit_domain(d) && is_thumb )
> > +        return PSCI_INVALID_ADDRESS;
> > +
> > +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > +    if ( is_hardware_domain(d) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* Ensure that all CPUs other than the calling one are offline */
> > +    domain_lock(d);
> > +    for_each_vcpu ( d, v )
> > +    {
> > +        if ( v !=3D current && is_vcpu_online(v) )
> > +        {
> > +            domain_unlock(d);
> > +            return PSCI_DENIED;
> > +        }
> > +    }
> > +    domain_unlock(d);
> > +
> > +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> There is a theoretical race between this and ...
> > +    if ( rc )
> > +        return PSCI_DENIED;
> > +
> > +    d->arch.resume_ctx.ep =3D epoint;
> > +    d->arch.resume_ctx.cid =3D cid;
> > +    d->arch.resume_ctx.wake_cpu =3D current;
> setting up resume context. It is practically impossible but still we coul=
d move
> setting up the context before domain_shutdown and clearing it on failure =
to be
> race free. The race is about small window between domain_shutdown releasi=
ng the
> shutdown_lock and other CPU calling domain_resume, taking the lock and ru=
nning
> arch_domain_resume before resume_ctx has been populated.

I think the current flow is already serialized, so I don't believe
arch_domain_resume() can observe an uninitialized resume_ctx here.

A concurrent domain_resume() does not take shutdown_lock first. It starts
with domain_pause(d), and that path is synchronous: it walks all domain
vCPUs and uses vcpu_sleep_sync().

In the SYSTEM_SUSPEND path, the calling vCPU is still running after
domain_shutdown() returns, and it populates resume_ctx before leaving the
hypercall path. So if another CPU tries to resume the domain in that
window, it should block in domain_pause() until that vCPU stops running.
Only after that can it take shutdown_lock and proceed to
arch_domain_resume().

So, as far as I can see, arch_domain_resume() should not be able to
observe an uninitialized resume_ctx in the current flow.

Also, moving resume_ctx setup before domain_shutdown() would slightly
complicate the failure path, since we would then need to explicitly
clear/invalidate the pre-populated context if domain_shutdown() fails.

So unless we think this race is actually reachable, I would prefer to
keep the current ordering. That said, if you strongly prefer making the
ordering more explicit, I can rework it that way.

Best regards,
Mykola

>
> ~Michal
>

