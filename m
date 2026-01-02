Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C7CEE053
	for <lists+xen-devel@lfdr.de>; Fri, 02 Jan 2026 09:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194895.1513049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbanh-0006a5-M4; Fri, 02 Jan 2026 08:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194895.1513049; Fri, 02 Jan 2026 08:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbanh-0006Xq-JK; Fri, 02 Jan 2026 08:46:25 +0000
Received: by outflank-mailman (input) for mailman id 1194895;
 Fri, 02 Jan 2026 08:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+OO=7H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vbang-0006Xe-7Z
 for xen-devel@lists.xenproject.org; Fri, 02 Jan 2026 08:46:24 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 839b12e2-e7b7-11f0-9ccf-f158ae23cfc8;
 Fri, 02 Jan 2026 09:46:22 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-37b983fbd45so91045351fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jan 2026 00:46:22 -0800 (PST)
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
X-Inumbo-ID: 839b12e2-e7b7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767343581; x=1767948381; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrW4S6osv5NZbj7pLDS3/qMIoLYngCGkqu0/MOgwGfc=;
        b=h1IBtQ6aZxdgDbPWB1nipPvzQ5br6ja1P1xPgsNktzOKox3sEcc/1XgI5EhKgyDqqJ
         QyHZgk1CjLepWScUkqIPkxy1qiDs3nAQ7Fb0cTxJ8bPtNJCFSzvIyzpfWgCY1UJX2r5N
         e8VSLVjPTiY199BHa+0N4FdcpSoNt7DmmbNnq3ydAAf0ayChoKa6Bz9WuUocvKEDohfd
         Z7L4xLJ5WO3r9sVjlOL90QCp2yj7n7FnHvMDIgUn5JL35gYnMcNswdiN5AsGkLHsY6bb
         UNeqxhvhR+hriFB1HmfMDaBHJ1zQMmaUDmWbTWrCtPPYqQsxZ9N15RDUUnFcJtKLudht
         m+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767343581; x=1767948381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qrW4S6osv5NZbj7pLDS3/qMIoLYngCGkqu0/MOgwGfc=;
        b=eTT8vp5R0qFFeUNKCCo5SE441JtPp9CSIAvsnt2/VAUntrl/rbeuGzBVOzwCaOhKOp
         rgNCxhiY0CWTihDbdkmzeBwoDVkygomhEGA1g/KHmj1ETkGxeqLwjDnWBwaHZrwGS5/o
         PXL6GDTAX7iui2+/lnR/x0CsaxSuq2VB5SUS9mMfDgps1cXY+xF49judp6fn0MKyNSzW
         1ntmd71Ndo42e2OG3PoSUdb/arlmRFP7Z7OOHCKZ0Yop+lNiO1MEliaqhtEQKHUcqp6Y
         jlqPvcER6xBpNP4egJ5Be90DExT7/xJUgXIOiaKWMifSg5vo2oFf+Vw2S7D7ENN2bzfH
         TaFA==
X-Gm-Message-State: AOJu0Yx9Ua0Mmu21W6kOwNimoQz7r+KusR6iKYxpmLao+e1kANwDP9zh
	8nYSCqc1l6XIt3/lIchjY6X2CSSXcd3jVcY8EdApMEBu9GEHWPzQ/YzUAOUYtPSRXarfZihO/aa
	Dk9ncWF7R/plMgRuDL5e9iDXjmHeWh+4=
X-Gm-Gg: AY/fxX6y9aYQBZ/clGTxJVksqtK2JfSGlnFtDvG32c8TdHEcULfPERbjrO29/rY5IFg
	YP3b0mh5N85pLTTwwvITmISRTSyRHW7gYb1n8UFdWxSmP3IfxJzOTLgAqpwb8XzjgC4vvkdiKYZ
	ml5j0uljVMTo/UN3GG//URJdWNyJZANnfTchywTgKV7+qd3JLhkpfBi0zsH+LCf2Y6oMaaIub2m
	DUqCNJW0kLfckEVQCcAlrdaOoeWU0HEIFNp6TOBdtyE0KVlcYKyBqOI0osl9GBp6hUuGdY=
X-Google-Smtp-Source: AGHT+IEvUREJT59G9gbF4ntKzbDgoUMEE9esOUpfrf1a+xc4mTp2vdJkppWwy+0Ib2hgvtDlLcB2KQTAyfUH0Brozv4=
X-Received: by 2002:a2e:be20:0:b0:37f:8332:6ae0 with SMTP id
 38308e7fff4ca-381216428e4mr133323951fa.33.1767343581213; Fri, 02 Jan 2026
 00:46:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
 <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org> <584bcb9e-ca3a-442a-9b6c-bdb5fb5fb8f4@xen.org>
In-Reply-To: <584bcb9e-ca3a-442a-9b6c-bdb5fb5fb8f4@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 2 Jan 2026 10:46:10 +0200
X-Gm-Features: AQt7F2qJKVPqT4IwEhLh-H696ZWNpSTB6ej9QkT-7pjn3ko7owHrClVnUNotyz8
Message-ID: <CAGeoDV9oJJH=2J8N6WMbQpY9Sww4Ko07VuQ3vaeKLi4T4G96ow@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 5:35=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 26/12/2025 12:39, Julien Grall wrote:
> > Hi Mykola,
> >
> > On 11/12/2025 18:43, Mykola Kvach wrote:
> >> From: Mykola Kvach <mykola_kvach@epam.com>
> >>
> >> System suspend may lead to a state where GIC would be powered down.
> >> Therefore, Xen should save/restore the context of GIC on suspend/resum=
e.
> >>
> >> Note that the context consists of states of registers which are
> >> controlled by the hypervisor. Other GIC registers which are accessible
> >> by guests are saved/restored on context switch.
> >>
> >> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> ---
> >> Changes in V7:
> >> - restore LPI regs on resume
> >> - add timeout during redist disabling
> >> - squash with suspend/resume handling for GICv3 eSPI registers
> >> - drop ITS guard paths so suspend/resume always runs; switch missing c=
tx
> >>    allocation to panic
> >> - trim TODO comments; narrow redistributor storage to PPI icfgr
> >> - keep distributor context allocation even without ITS; adjust resume
> >>    to use GENMASK(31, 0) for clearing enables
> >> - drop storage of the SGI configuration register, as SGIs are always
> >>    edge-triggered
> >> ---
> >>   xen/arch/arm/gic-v3-lpi.c              |   3 +
> >>   xen/arch/arm/gic-v3.c                  | 319 +++++++++++++++++++++++=
+-
> >>   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
> >>   3 files changed, 320 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> >> index de5052e5cf..61a6e18303 100644
> >> --- a/xen/arch/arm/gic-v3-lpi.c
> >> +++ b/xen/arch/arm/gic-v3-lpi.c
> >> @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block
> >> *nfb, unsigned long action,
> >>       switch ( action )
> >>       {
> >>       case CPU_UP_PREPARE:
> >> +        if ( system_state =3D=3D SYS_STATE_resume )
> >> +            break;
> >
> > Do we need this check because we don't free the LPI pending table when
> > the CPU is turned off?
> >
> > If so, don't we already have a problem for CPU hotplug because the
> > percpu area will be freed but not the pending table?
>
> Looking at [1], we don't seem to support CPU OFF when the GICv3 ITS is
> enabled. So this change could be delayed. But CC Mykyta for awareness.

Probably you are right. Another option is to move this
`system_state =3D=3D SYS_STATE_resume` handling out of this change and into
the follow-up commit where ITS suspend/resume support is introduced, so
the rationale and behavior stay co-located with the suspend
implementation.

If you think the better approach is to avoid these changes for now,
I=E2=80=99m fine with that as well and can drop them in the next revision o=
f
the series (and reintroduce them together with the ITS suspend).

Thanks,
Mykola

>
> Cheers,
>
> [1]
> https://lore.kernel.org/48bafdb8e6269a3d958065c6a1062ce2736632a0.17629397=
73.git.mykyta_poturai@epam.com
>
> >
> > Cheers,
> >
>
> --
> Julien Grall
>

