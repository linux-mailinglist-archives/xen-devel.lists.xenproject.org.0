Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GNtDuZHumkFTwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 07:36:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747502B678A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 07:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256343.1551031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2kVM-000868-GC; Wed, 18 Mar 2026 06:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256343.1551031; Wed, 18 Mar 2026 06:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2kVM-00083c-CD; Wed, 18 Mar 2026 06:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1256343;
 Wed, 18 Mar 2026 06:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SizD=BS=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w2kVL-00083U-5A
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 06:35:43 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae86b726-2294-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Mar 2026 07:35:40 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5a277379151so949216e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 23:35:40 -0700 (PDT)
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
X-Inumbo-ID: ae86b726-2294-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1773815740; cv=none;
        d=google.com; s=arc-20240605;
        b=WNHW5r8bU1nR6lrVYASGwxl8VRztUXVM4uPCLHonM6QxgeJXCvR7DOaFWFFjaU4hSe
         IrlRxBqo4/RpJvMYLuE1msFUu9Me+j0Nfw2y+qf2w+1v/MHntXxqFP+pGYGvxYFNGcgq
         +zdXyd7UXfmOTVqG4guaX/9hoOgbHqdjhJhfmfPsRwkBxg3K5dIfMFsdi2iorfz9tFMV
         Gcn9lEVJ9HRDWdt2cjmcwP9w0IFT0/prv9+C312dM43YE5fkXZoncDPygsu90+X2MkD/
         V2qidagMqCJS4iOfrhv+0zHOrYJ074N4l+YwvlWyC1ZMWMAGLshURbtWmaDAp+yvREwR
         YaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xj/8qjLdJUYlFeq1ZqVOoJIykQbkpgeynPOtdumGMBM=;
        fh=+z1me4HcwmMh3qCmrOCycJuAlwnlec/5AtLzgU3s9w0=;
        b=CMGIpIt0xt52LlJCPb9r43K0ZDjC7yLme4pU6HxPzIu/pbF0xnxtj5N3jZ86lb5qrB
         Sc9LW0iRsqVZKMbqO1VdabTiEqDh5Wq5S4dbJPm2pKnVRU27PQX76L87gIDqngXg7foK
         FnLEVhXtoB/zv3MihZyXuZvTXaGxQINkk6xqtaJGsJVMNOvzfbq1H2ae7l4xbsDfuNh9
         wB73FIDnO//xVLKzXeBUDIZJPvbXE3DkZNz8sMdf+8bmrYhkkoAgH1FwjuJ0qUlho7zG
         iViaJmrARyWp5StWWyC6+oa9pcRFrsbSlkAPwMSxeEkfWfYX3cGXh6pnrSumKncITZM0
         /yeA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773815740; x=1774420540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj/8qjLdJUYlFeq1ZqVOoJIykQbkpgeynPOtdumGMBM=;
        b=d+ALUCGCxaQBQQfyz4+WgzZd/8r09eH7T0naIzktEycXwN1Mijq5miMEOw6wXQpeoU
         KlzRzj5g2a8r/tfJmoi6yzDyWNtEb7p/WYWAVytVzCg9RLP5ExBJkV/EF/R8XjhLFVnV
         i5NVGI0kF/da2x24I5sdkoXF9AVYvJW4EpJKBOhQH6DVZ7NOa5++qgjHSm97cbmFCY24
         rJ6HsgHGeqCL41p+5QKYGBOyXwLXy9I6vAsiJT3HSE8RSSiZFJNrok20Z6n2NpBODoyo
         3xs86D1lQheb3g3o8AT2w1BZ6mbUS1JKzMs4l32WDYTA9kn85OZ6jbzPfZrKCOQD6hz9
         CmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773815740; x=1774420540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xj/8qjLdJUYlFeq1ZqVOoJIykQbkpgeynPOtdumGMBM=;
        b=SrKDtcpAwAK4sTPEpxmCTPB2+L6V/OR2VU+PA6aPUOXI8PUTaagQb4mJPJvv3jHVA5
         ExntD5wAM/MfR2XaV+PByCsNu37yI/yHP2Hq1I52Wbcg1rKrHbRHkXAHe3iPrZNQbneM
         BofLLKuupoUZGy2aGeWIajtSiCzKEVmoHTkrHxApZp96hjq4RIHCgAke3s9GdYx5p1zs
         VyQKRXYVabRl+WxG2QM1TkrIhQLQozV35brq8yuRc6ayaASFMEHTk5rk5QAeKDzrDh0K
         zD37LEkvVqYrkvNvIPWJxoYZ1aNrASZcZUyEFGDERebZAz4ajG1no/hTOwitHHJoW7g9
         4Ssw==
X-Gm-Message-State: AOJu0Yyzmva/kx0JEkX0c4Mq5kEeTkwvHVv8E00Gj21vnw/6Rxq1j/tl
	Hp4RKFGnLmYkz8mevIHyozCIjXzVSB/nQxyKVpFsgqUibgyQui/i+2yTe5O4rHgfOYRWmQ4mtAG
	zPfVq1BqHhhWrfSx/M6vX93m4RNIV7v4=
X-Gm-Gg: ATEYQzzuKLZqW2emdpQyP4Zdn5TyeheZPzb1ofEBjOFTFi2o1QlvSdtk97PkgqQEcsz
	q8MFy3fACHbdE5yolAl2fHqhobuxZVguJxqbQyH9NmnZ643ep91XDgWA1LKbBmBHeRgLXk++mLx
	wEjFu10+hXV//7qQYdDvblbn8QDpAQN+0ppo873cRqH03jxiyVVtEBPaBM0lUPp5CVoUAcXFlBo
	jBcKTrgJcZ6ZdXaPICKXQX0OXyOCsJvHZHJJmZnvTAjOl9Mewx72k141smPNL7WeQtJheWUQzY6
	LsH42Pk=
X-Received: by 2002:a05:6512:20c9:b0:5a1:23fe:b04c with SMTP id
 2adb3069b0e04-5a27958b7f8mr762787e87.18.1773815739297; Tue, 17 Mar 2026
 23:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1765533584.git.mykola_kvach@epam.com> <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
 <87jyv9kbxe.fsf@epam.com>
In-Reply-To: <87jyv9kbxe.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Mar 2026 08:35:27 +0200
X-Gm-Features: AaiRm53Egc9ZaBeax5JzNHHp1WzLacIeqmEvw0AWkyfatQaFr8fG6h3_s5sK60k
Message-ID: <CAGeoDV-znwz8pG9VfrOOC57O2hp83vMuE9QZEtZMxc70VtDuKA@mail.gmail.com>
Subject: Re: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 747502B678A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Volodymyr,

Thank you for the review.

On Wed, Mar 18, 2026 at 6:18=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola.
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
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
> > +    if ( rc )
> > +        return PSCI_DENIED;
> > +
> > +    d->arch.resume_ctx.ep =3D epoint;
> > +    d->arch.resume_ctx.cid =3D cid;
> > +    d->arch.resume_ctx.wake_cpu =3D current;
> > +
> > +    gprintk(XENLOG_DEBUG,
> > +            "SYSTEM_SUSPEND requested, epoint=3D%#"PRIregister", cid=
=3D%#"PRIregister"\n",
> > +            epoint, cid);
> > +
> > +    return rc;
> > +}
> > +
> >  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >  {
> >      /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >      case PSCI_0_2_FN32_SYSTEM_OFF:
> >      case PSCI_0_2_FN32_SYSTEM_RESET:
> >      case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >      case ARM_SMCCC_VERSION_FID:
> >          return 0;
> >      default:
> > @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
> >          return true;
> >      }
> >
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > +    {
> > +        register_t epoint =3D PSCI_ARG(regs, 1);
> > +        register_t cid =3D PSCI_ARG(regs, 2);
> > +
> > +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> > +        {
> > +            epoint &=3D GENMASK(31, 0);
> > +            cid &=3D GENMASK(31, 0);
> > +        }
> > +
> > +        perfc_incr(vpsci_system_suspend);
> > +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid))=
;
> > +        return true;
> > +    }
> > +
> >      default:
> >          return false;
> >      }
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 93c71bc766..09ad0a26ee 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -26,6 +26,7 @@
> >  #include <xen/hypercall.h>
> >  #include <xen/delay.h>
> >  #include <xen/shutdown.h>
> > +#include <xen/suspend.h>
> >  #include <xen/percpu.h>
> >  #include <xen/multicall.h>
> >  #include <xen/rcupdate.h>
> > @@ -1374,6 +1375,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >  void domain_resume(struct domain *d)
> >  {
> >      struct vcpu *v;
> > +    int rc;
> >
> >      /*
> >       * Some code paths assume that shutdown status does not get reset =
under
> > @@ -1383,6 +1385,13 @@ void domain_resume(struct domain *d)
> >
> >      spin_lock(&d->shutdown_lock);
> >
> > +    rc =3D arch_domain_resume(d);
> > +    if ( rc )
> > +    {
> > +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
>
> I am wondering about this error path... Domain clearly can't be resumed
> anymore. Should we crash it in this case? But domain is already shut
> down, so domain_crash() would do nothing.
>
> Probably it is better to ensure that arch_domain_resume() will not
> return an error by doing all required checks beforehand. Actually you
> already doing this. So how we can get an error realistically?

vpsci_vcpu_up_prepare() can still fail on the resume path, currently due
to alloc_vcpu_guest_context() or arch_set_info_guest().

So I agree with your point: it would be better to move all failure-prone
preparation and validation to the suspend path, so that
arch_domain_resume() does not need to return an error in normal
operation.

The approach I see is:
- allocate and populate the guest context during suspend;
- split arch_set_info_guest() into two parts, something like
    arch_validate_vcpu_guest_context() and
    arch_apply_vcpu_guest_context();
- call only the validation step during suspend;
- on resume, only apply the already validated guest context and then
free it.

This should make the resume path effectively non-failing and avoid the
questionable error handling there.

Does this sound like the right direction?

Best regards,
Mykola


>
> > +        goto fail;
> > +    }
> > +
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> >      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >
> > @@ -1393,6 +1402,7 @@ void domain_resume(struct domain *d)
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> > + fail:
> >      spin_unlock(&d->shutdown_lock);
> >
> >      domain_unpause(d);
> > diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> > new file mode 100644
> > index 0000000000..528879c2a9
> > --- /dev/null
> > +++ b/xen/include/xen/suspend.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef XEN_SUSPEND_H
> > +#define XEN_SUSPEND_H
> > +
> > +#if __has_include(<asm/suspend.h>)
> > +#include <asm/suspend.h>
> > +#else
> > +static inline int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +#endif
> > +
> > +#endif /* XEN_SUSPEND_H */
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
>
> --
> WBR, Volodymyr

