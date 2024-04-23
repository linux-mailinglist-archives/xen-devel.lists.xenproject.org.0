Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE08AE9DC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710735.1110142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHVj-0001An-Eb; Tue, 23 Apr 2024 14:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710735.1110142; Tue, 23 Apr 2024 14:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHVj-00017u-Be; Tue, 23 Apr 2024 14:52:43 +0000
Received: by outflank-mailman (input) for mailman id 710735;
 Tue, 23 Apr 2024 14:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6olb=L4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rzHVh-00017o-OU
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:52:41 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210f7d29-0181-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:52:39 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5aa241232faso4286085eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:52:39 -0700 (PDT)
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
X-Inumbo-ID: 210f7d29-0181-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713883958; x=1714488758; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oJ5oFwFtt28a/L1Lw52NZ/TBbSz0Cd9oGC/3/Q44LI=;
        b=JNl4AhbcK7fmQkmjDERgvVXlizDrw7ZUFMwLCNtqgQoySc+6t00y6Q5uv4HB9qBxd1
         QlhIGnixvAcPnZG/dA7GGXygYIG10MK5S8qG3o9HBvArwh+qCCr/KwSfYr+Y/8QwJLa1
         S/KeS9/HQjfJ1rmwUB9rexE6GKxlbnKWZm/AjLa30/YVMsMGTGVtHHsMTdh0+m/hZdDX
         TMlKZ7uTohe7HyRIMVtkrw8mkewJw8iWWCW/Mm8PPCpwMccopWq+1sCf7Tkg+ybHlFcy
         iYWotBeNLb6uRsGI47hznDUucBK58NmzZzfRj0GClmnpQxgY1YuvA8njNzM477q0NvKX
         4F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713883958; x=1714488758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oJ5oFwFtt28a/L1Lw52NZ/TBbSz0Cd9oGC/3/Q44LI=;
        b=JHA2cGeO1FBEoCw/xXJUP+4VXKtKIKThsICyBz+2Ax9pW/xtscUp5RR0+ThVnlsmhJ
         qcNm4vUFDdxp+EyWpRpiIVLMuG89EMoOSYJwfJmLRJOBKgrmjFUrfqk39YXaVvN8UCuU
         dHSFU6fTiWVOn8b/0sT7v1Eh70nqy2AuMrUAPCg4ZnCqdJEY31UT0ZYSQLimHbCd47BM
         MWz1AT8mtA7CosuD1LQ1q35KeVWuj7QUb3FhfUEmM3v31jd6+Wd6pQuRvKb/HRbD+Zm6
         9LjckRLm9GebtvxCgEPgZn+TaCJK+424oEhZpYiuBfkPpS+MWpWvLzU5YQ4DHsSa3qvX
         a+1w==
X-Forwarded-Encrypted: i=1; AJvYcCVAN1CI9dInveqrajaoXfvYoWMxwDmSAUgaY21rgIs0prgfZ6Z6b1zmAGG4iUELfYCgzk4NS4L9IjbuCj2+h3wynyoXmKKJ/SMWqf6nueA=
X-Gm-Message-State: AOJu0YxhRFBv1o3aAVW9srQDkRYQmrBJqzG/8ebsurTYi4+VquCpRMeB
	IBjtVw3fIBBF59HnvSCYFRPHjQAAp7Yn5sXJW+uflCUhAGF9V6sT7KfT98in6BgEMiTw7J+uQg8
	amQq22FOaXJHJC2+cR2H3SXB2MF5f+wzonOIjkQ==
X-Google-Smtp-Source: AGHT+IGhElEhvoOcLIh6BtvKq0ep5l63/2dy1xgqffEyBWJzt4lw7QGECKqZXkEujCD6RCyTcTNymOhtdVsAksHMPhs=
X-Received: by 2002:a4a:acc3:0:b0:5ac:bdbe:d09b with SMTP id
 c3-20020a4aacc3000000b005acbdbed09bmr14253587oon.4.1713883958407; Tue, 23 Apr
 2024 07:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-5-jens.wiklander@linaro.org> <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
 <CAHUa44GAbBtczbVohVjC=66tqzjgeGLx44k9ddodDJL13KwVEQ@mail.gmail.com>
 <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org> <756FEA03-7F16-48AE-8308-059EBF8638A0@arm.com>
 <27BADE00-E6EC-4BD6-AC5D-201DF1A76BCD@arm.com> <195c1fe6-ed77-417f-bcb0-fdfaf687c4b0@xen.org>
In-Reply-To: <195c1fe6-ed77-417f-bcb0-fdfaf687c4b0@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 Apr 2024 16:52:26 +0200
Message-ID: <CAHUa44FmSg2Nm9JqZ6DLNX_CkS37esabc+E-uvk5XjJymqNWtg@mail.gmail.com>
Subject: Re: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI handlers
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"patches@linaro.org" <patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 23, 2024 at 4:28=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Bertrand,
>
> On 23/04/2024 14:23, Bertrand Marquis wrote:
> > Hi Julien,
> >
> >> On 23 Apr 2024, at 14:37, Bertrand Marquis <Bertrand.Marquis@arm.com> =
wrote:
> >>
> >> Hi Julien,
> >>
> >>> On 23 Apr 2024, at 13:05, Julien Grall <julien@xen.org> wrote:
> >>>
> >>>
> >>>
> >>> On 23/04/2024 10:35, Jens Wiklander wrote:
> >>>> Hi Julien,
> >>>
> >>> Hi Jens,
> >>>
> >>>> On Mon, Apr 22, 2024 at 12:57=E2=80=AFPM Julien Grall <julien@xen.or=
g> wrote:
> >>>>>
> >>>>> Hi Jens,
> >>>>>
> >>>>> On 22/04/2024 08:37, Jens Wiklander wrote:
> >>>>>> Updates so request_irq() can be used with a dynamically assigned S=
GI irq
> >>>>>> as input. This prepares for a later patch where an FF-A schedule
> >>>>>> receiver interrupt handler is installed for an SGI generated by th=
e
> >>>>>> secure world.
> >>>>>
> >>>>> I would like to understand the use-case a bit more. Who is responsi=
ble
> >>>>> to decide the SGI number? Is it Xen or the firmware?
> >>>>>
> >>>>> If the later, how can we ever guarantee the ID is not going to clas=
h
> >>>>> with what the OS/hypervisor is using? Is it described in a
> >>>>> specification? If so, please give a pointer.
> >>>> The firmware decides the SGI number. Given that the firmware doesn't
> >>>> know which SGIs Xen is using it typically needs to donate one of the
> >>>> secure SGIs, but that is transparent to Xen.
> >>>
> >>> Right this is my concern. The firmware decides the number, but at the=
 same time Xen thinks that all the SGIs are available (AFAIK there is only =
one set).
> >>>
> >>> What I would like to see is some wording from a spec indicating that =
the SGIs ID reserved by the firmware will not be clashing with the one used=
 by Xen.
> >>
> >> The idea is that the only SGI reserved for secure are used by the secu=
re world (in fact it is the SPMC in the secure world who tells us which SGI=
 it will generate).
> >> So in theory that means it will always use an SGI between 8 and 15.
> >>
> >> Now it could make sense in fact to check that the number returned by t=
he firmware (or SPMC) is not clashing with Xen as it is a recommendation in=
 the spec and
> >> in fact an implementation might do something different.
> >>
> >> Right now there is no spec that will say that it will never clash with=
 the one used by Xen as the FF-A spec is not enforcing anything here so it =
would be a good idea
> >> to check and disable FF-A with a proper error message if this happens.
> >
> >
> > After some more digging here is what is recommended by Arm in the Arm B=
ase System Architecture v1.0C [1]:
> >
> > "The system shall implement at least eight Non-secure SGIs, assigned to=
 interrupt IDs 0-7."
>
> Thanks! Can we provide a link to the specification in the commit message?

Sure, I'll add a link.

>
> >
> > So basically as long as Xen is using SGIs 0-7 it is safe as those shall=
 never be used by the secure world.
> > Now i do agree that we should check that whatever is returned by the fi=
rmware is not conflicting with what
> > is used by Xen.
> +1.

That makes sense, I'll add a check.

Thanks,
Jens

