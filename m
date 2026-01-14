Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40660D1C9FB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 07:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202452.1517999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftw5-0000Z8-6W; Wed, 14 Jan 2026 06:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202452.1517999; Wed, 14 Jan 2026 06:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vftw5-0000Xf-2F; Wed, 14 Jan 2026 06:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1202452;
 Wed, 14 Jan 2026 06:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bd0b=7T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vftw4-0000XZ-Fh
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 06:00:52 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61237020-f10e-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 07:00:51 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-38310ee9d40so43118341fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 22:00:51 -0800 (PST)
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
X-Inumbo-ID: 61237020-f10e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768370450; x=1768975250; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCy1gkdAFYhKRkFLQUVCrclHbUxztvT7IZ0HJ77bow8=;
        b=IiWGq1+9eO0i5CFt1zLed5UmlspwDwJZ5feZnf/2nvCPJTzQs2XLpm3PE89lQ2wb8X
         q6d0ayrcdJlDB2BxTKhTuMPZnLFbuLPKRU8blKcvuZzIkEEe1Mv5DWWLJMuFqIwPNq1l
         PtgB+7GnXy7LJZZ2fq2tmCdM6woVmxPYo6s7mQXIv0Xo9rllusf3G9U8qlVh+uFddof6
         fyzDFlm7wngFK7DQr5Y5eBXna1O2fRAElObp0a6Gf+z1S46lecGVIv+o8qfUBzHIaYhf
         FTl1+rXAp1aSN+nNilhNv9FuPoQwkuCuuWLCxgfE+fuOVfnvDigrIG/HoXuQ/6anhmNH
         n4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370450; x=1768975250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DCy1gkdAFYhKRkFLQUVCrclHbUxztvT7IZ0HJ77bow8=;
        b=JlQNHoheUYMtn089XXgigJKuLAafsJZ6cjxFoFboomQFXPzeGqgmJrjLZlN0oAGmFY
         oPg5ec4Wckvi2eIkX3sF5PrLm+/BV+eMxZ68PcBF0llbLvet/LRfJwpoGTgeudGmx4Rv
         pRroDmoUUmZ7ZpNNg/0yoAOUBrpgCU526eczv+OV4IjcO4iq2KLsjdwYQdrVrEYwm/tP
         JujE9mPF6+2YNAGeng1MIKOubGxNuU562a9YJOA9IgUWchNKTxmpksUD/OZxgFvINLL4
         B+/A3NF9vv/gelnvk/4+atJqMUAymagfpmmQ+MNSJX+Agw45Ta7jJN9XVmxre4/TTbGy
         e0gw==
X-Forwarded-Encrypted: i=1; AJvYcCUbfKxOYHtZjd1qrl5A0stb30DZTlQn+60Hq7o8cjMCKVBB3Jb/7drclJi8UGGJBivXXJVXPuNDsbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqmbkRTQI016uSjRAFq0y0yZzKAsW+6Xjl9LcLGbA+oVlIOljP
	aeb4wMUtj1qB9zGLP4q5KozrdjTDvEJBKsud/bwU9ulb5gfK2YX0LzVMcPcHm1gcr/X9GuVfE8n
	Kk9koIT3MIrIEC9lDp2MzFnDHm9GssxM=
X-Gm-Gg: AY/fxX6I0j2GBPFJ4QDmHceF7vqSaqD+E2/qavaNEjcQtJlQcvf8xTlWZ2zaYowaVX6
	C9cYHHkWQtAg6KgONc439BIcHPC0BgKV+IBFQaTOgQiBgfs/rgY0KMBzS8buETks8hQ8aYrndo1
	PBG5UD4sTm7kXrRG+tGp6ZbDw+Gcg6dL5AzxTsVsAOR6VaOJMByxkIFcz8YkIw6OjklY3I235tf
	DT8R3mzopH+YwhQK4a+jVdivd4K/DJ3Ute/5d48jT2gnHbb5XXLxDUuUHDqNBuL9RRHf7CitDvi
	MfTp
X-Received: by 2002:a05:651c:30ca:b0:37c:d689:7e1c with SMTP id
 38308e7fff4ca-38360756ffbmr4362431fa.23.1768370450167; Tue, 13 Jan 2026
 22:00:50 -0800 (PST)
MIME-Version: 1.0
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
 <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org> <CAGeoDV9zgfyHaHb5W6+T4F9Hjxv_R5wnGkcbwcN2xgRUhY+v2w@mail.gmail.com>
 <b3e97c6a-b93b-424f-a10e-1d3c93afbe35@xen.org> <8133A491-4245-4376-A00C-D6D98C10A2AC@arm.com>
In-Reply-To: <8133A491-4245-4376-A00C-D6D98C10A2AC@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 14 Jan 2026 08:00:00 +0200
X-Gm-Features: AZwV_QgMO-YJDFYvMOYeKKTllHHPtYbw_6--Gdgi7t7DpmUxiAGuJgEhorjN-3I
Message-ID: <CAGeoDV_z5SUcM1jMJmHb_J6kKrsJS_njqOcpT0A45xGAwj69nQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in setup_irq()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand, Julien,

First of all, please accept my apologies for the delayed response.

On Wed, Dec 3, 2025 at 10:10=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Julien/Mykola,
>
> > On 2 Dec 2025, at 19:26, Julien Grall <julien@xen.org> wrote:
> >
> > Hi,
> >
> > Sorry for the late answer.
> >
> > On 16/09/2025 11:19, Mykola Kvach wrote:
> >> On Sat, Sep 13, 2025 at 1:01=E2=80=AFAM Julien Grall <julien@xen.org> =
wrote:
> >>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>>> ---
> >>>>   xen/arch/arm/irq.c | 8 +++++++-
> >>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> >>>> index 02ca82c089..17c7ac92b5 100644
> >>>> --- a/xen/arch/arm/irq.c
> >>>> +++ b/xen/arch/arm/irq.c
> >>>> @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int ir=
qflags, struct irqaction *new)
> >>> AFAIK, we are not using setup_irq() to handle SGIs because they are a=
ll
> >>> static and always enabled. Are you planning to handle dynamic SGIs? I=
f
> >>> yes, then can you provide more details?As far as I know, there can be=
 at least one =E2=80=9Cdynamic=E2=80=9D SGI in Xen.
> >> As far as I know, there is at least one =E2=80=9Cdynamic=E2=80=9D SGI =
in Xen. For
> >> example, see ffa_notif.c in the functions ffa_notif_init_interrupt
> >> and ffa_notif_init, which handle initialization of such SGIs.
> >
> > Bertrand can you comment on this? In particular, do we want the FFA SGI=
s to have the priority of the internal ones?
>
> The following is only an advice, definitely not a requirement. I would
> be ok to ack the current way to do things as right now FF-A is unsupporte=
d and
> is the only case of usage of dynamic SGI.
> I would though require to have a log message to warn the user that SGI xx
> has the same priority as xen internal interrupts during request_irq.
>
> Here is what I think:
>
> FFA SGIs can only be generated by the secure world and in practice they w=
ill
> be generated mostly when coming coming back from the secure world (either
> after a preemption or on a return to an smc call) but one could also be
> generated from the secure world from another core, preempting whatever ru=
ns
> (but same would occur when an interrupt is directly handled in the secure=
 world).
>
> Linux kernel implementation is not lowering the FF-A SGI interrupt as far=
 as I know.
>
> In my view having the FFA SGI having the same priority as ffa internal SG=
I would mean
> we have some trust that the secure world will not overload us.
>
> But in reality it would make sense to have a priority ordering like:
> - Xen internal SGIs
> - FF-A SGI (or any other dynamic SGI)
> - any other kind of interrupt
>
> So that Xen internal SGIs have the highest priority, but having other SGI=
s still having
> a better priority than other interrupts.
>
> In any case, whatever we do, we should keep it possible to have one speci=
fic dynamic
> SGI at the maximum level or even at an higher level (ie lower down xen in=
ternal SGIs)
> for specific use cases (handling hardware errors comes to mind) but this =
is ok to make
> this possible only by changing xen code or when creating such a specific =
driver.

Thank you for the detailed feedback regarding the priority handling for
dynamic SGIs. Based on Bertrand's suggestions, I would like to propose
a more structured approach to interrupt priorities.

To avoid having dynamic SGIs share the exact same priority as Xen's
internal IPIs, while still ensuring they can preempt normal interrupts,
I propose the following hierarchy:

#define GIC_PRI_LOWEST 0xf0U
#define GIC_PRI_IRQ 0xb0U
#define GIC_PRI_DYNAMIC_SGI 0xa0U
#define GIC_PRI_IPI 0x90U /* IPIs must preempt normal interrupts */
#define GIC_PRI_HIGHEST 0x80U /* Higher priorities belong to Secure-World *=
/


Key changes:
1. Shift GIC_PRI_IRQ to 0xb0U: This moves standard interrupts one level
down.
2. Introduce GIC_PRI_DYNAMIC_SGI at 0xa0U: This creates a dedicated
priority level for dynamic SGIs (like FF-A).

This structure ensures that:
- Internal Xen IPIs (0x90) remain the highest priority for the
hypervisor.
- Dynamic SGIs (0xa0) can preempt normal interrupts but cannot
interfere with internal Xen signaling.
- We stay within the safe range for Xen (starting from 0x80).

Does this approach look acceptable to you? In particular, do you see any
concerns with shifting the default GIC_PRI_IRQ from 0xa0 to 0xb0 on ARM?

If this looks good to you, I will send a v2 with these changes.


Best regards,
Mykola

>
> Cheers
> Bertrand
>

