Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F3A6B800
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923775.1327192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYzv-0004f1-Vf; Fri, 21 Mar 2025 09:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923775.1327192; Fri, 21 Mar 2025 09:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYzv-0004dG-S4; Fri, 21 Mar 2025 09:49:03 +0000
Received: by outflank-mailman (input) for mailman id 923775;
 Fri, 21 Mar 2025 09:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvYzu-0004YZ-EM
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:49:02 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b76504ef-0639-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:49:00 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5499e3ec54dso2046872e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:49:00 -0700 (PDT)
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
X-Inumbo-ID: b76504ef-0639-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550540; x=1743155340; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVbou/KzCebiI4gwX/HMLSGwhhwxzS3AZlFq1Jurstg=;
        b=MOf4CCmpp44pQXD5rUl/6CB6Og+GQ31vwg8mgOwnz/uy4NA7PfMYI8eRUM3qwU420r
         S85URgnfEPHGSFF2ZL/s5Jhg+Jq029M8cREFDqNDUQ5rkSWxHY1jKV2t9YnpncfUwNVK
         v7lz9lLAEYN4ihCHtnk5e3tYOBQu+fZls75uxMeY5dUxgMNUwphsfxBbLJFZnUUctIgx
         E/xTmj/6I3Es41mMWYNofEOfzM1UhqUyKwxiqpmMc4miu4n/u+am4PItTPWWdh8blRV7
         BxgCx7oi6UuNoti/JS/yoc+AIrOVMM6Joua++J3HWAzHmwx4IECSHpC1Br2ZLT/XnEeM
         5ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550540; x=1743155340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVbou/KzCebiI4gwX/HMLSGwhhwxzS3AZlFq1Jurstg=;
        b=X0ayqg1i5TYn05q32UFg5/3s6+BieabksusdE7qcBb1IXhNh0KnYf8qEybI6aFPu9+
         eNlvj6D3/BmkcSriAfI6d6LyzAnpWWJ7uocVxiKbnymcg9mN6aOYFT1nXQ1vs9547dyP
         ZYp/WaVFgSnah39i12aBHr0buqnD9S9PpoLc8Sfpepxu5FNO8t/Bp64n9Ieqj/KD2EFJ
         oGu6DXg5DdQAWMSjlnMq3xtOrZQdnWpfiTZAvpfFKwwFczwokt/cxGhaGMfhDIzJHFg7
         0LOZDw8wSWuttZaTdLPvw4cbMAYk/wFmMyaxrGUSgOwNbhI1jvph5Ki4fYs5u2iLf2+/
         hwng==
X-Forwarded-Encrypted: i=1; AJvYcCXdyoCjLPxT6QEg00bsIxivMBIe7n+oGd/ED6lVihneSd/hCxqNt4tNbIhxpgEXWYTHAF6EyXExLPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjAHCN8GvjE/6cL6Tg64ep1fgBgmCWOtpagA+2oEB+Jq7vUS3l
	QVxCqZOAIc2dFDAlse4aBxhCcenGDi7Z9JtZip2b2PbvErfJXucaNtCAY/+Q9LOM4h2T1SlvcV/
	FW9v7N9ZFndyP3bLcncBZa8Y87T6V92tL
X-Gm-Gg: ASbGnctGzEce8+k6q67x9Di7XxWBXKKhAHrWw5ZNNCzUH/wQiTv+uZTUUo1tXDHr9Az
	02nFMxOnv1aIcCgoasGLuJkho2MSmF88/PszluCH2h9kzfwH4AXXBVnMKnqNkB2GcH/vahbpmyZ
	u0tmoPoYU92v7GcV+CuBBObKm9Xhn7Nk9vqXc=
X-Google-Smtp-Source: AGHT+IE4gGPwAlntvuGmQMc9KSqiqwJ6ZZv5wXT91b0NND+lzZzEHD48b7g1GaQDYy5UcXpqTqaRLQmQRKyPurNmbXM=
X-Received: by 2002:a05:6512:32c1:b0:549:6451:7e6b with SMTP id
 2adb3069b0e04-54ad647ea56mr1091219e87.15.1742550540061; Fri, 21 Mar 2025
 02:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
 <c5ccb703-45eb-4fb1-842c-75317354afad@xen.org> <e8ddc992-a092-46d8-8c87-6b3c516fe464@suse.com>
 <32989e14-4754-427d-8347-73fc83a8bd62@suse.com> <08cf29e4-8029-4c3b-bb32-f84bcb6d3678@suse.com>
In-Reply-To: <08cf29e4-8029-4c3b-bb32-f84bcb6d3678@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:48:48 +0200
X-Gm-Features: AQ5f1JqjzGC_OUGB-q2G3UzoS0Pz9cePvDU03ZUvcTGSCXz4HYoDCHl_HCsewio
Message-ID: <CAGeoDV_sq-BuYF0fp8KByzit6CySgn_1X3VnL2jXBdoGDnNsDA@mail.gmail.com>
Subject: Re: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 13, 2025 at 6:20=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.03.2025 17:05, J=C3=BCrgen Gro=C3=9F wrote:
> > On 13.03.25 16:54, Jan Beulich wrote:
> >> On 11.03.2025 21:59, Julien Grall wrote:
> >>> On 05/03/2025 09:11, Mykola Kvach wrote:
> >>>> Invocation of the CPU_UP_PREPARE notification
> >>>> on ARM64 during resume causes a crash:
> >>>>
> >>>> (XEN) [  315.807606] Error bringing CPU1 up: -16
> >>>> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
> >>>> [...]
> >>>> (XEN) [  316.142765] Xen call trace:
> >>>> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x1=
28/0x1ac (PC)
> >>>> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x1=
20/0x1ac (LR)
> >>>> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspen=
d+0x4c/0x1a0
> >>>> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hyper=
call_tasklet_handler+0x54/0xd0
> >>>> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_wo=
rk+0xb8/0x100
> >>>> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
> >>>> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c=
/0x194
> >>>> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cp=
u+0/0x14
> >>>> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
> >>>>
> >>>> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU=
_AREA
> >>>> only occur when !park_offline_cpus and system_state is not SYS_STATE=
_suspend.
> >>>> On ARM64, park_offline_cpus is always false, so setting __per_cpu_of=
fset to
> >>>> INVALID_PERCPU_AREA depends solely on the system state.
> >>>>
> >>>> If the system is suspended, this area is not freed, and during resum=
e, an error
> >>>> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_A=
REA is not
> >>>> set and park_offline_cpus remains 0:
> >>>>
> >>>>       if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
> >>>>           return park_offline_cpus ? 0 : -EBUSY;
> >>>>
> >>>> It appears that the same crash can occur on x86 if park_offline_cpus=
 is set
> >>>> to 0 during Xen suspend.
> >>>
> >>> I am rather confused. Looking at the x86 code, it seems
> >>> park_offline_cpus is cleared for AMD platforms. So are you saying the
> >>> suspend/resume doesn't work on AMD?
> >>
> >> Right now I can't see how it would work there. I've asked Marek for cl=
arification
> >> as to their users using S3 only on Intel hardware.
> >
> > Seems as if this issue has been introduced with commit f75780d26b2f
> > ("xen: move per-cpu area management into common code"). Before that
> > on x86 there was just:
> >
> >      if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
> >          return 0;
> >
> > in init_percpu_area().
>
> Ah yes. Mykola, can you then please address this by adjusting init_percpu=
_area(),

Do I understand correctly that I should move the system_state check
inside init_percpu_area?

> adding a Fixes: tag to reference the commit above?

Sure! Should I send it as a separate patch to speed up its merging?

>
> Looking at the tags of the patch, please also make sure you clarify who's=
 the
> original author of the patch. Your S-o-b isn't first, but there's also no=
 From:.

ok

>
> Jan

Best regards,
Mykola

