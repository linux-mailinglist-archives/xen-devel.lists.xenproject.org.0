Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95107903350
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737901.1144405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvlF-00055F-Iq; Tue, 11 Jun 2024 07:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737901.1144405; Tue, 11 Jun 2024 07:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvlF-00051u-G0; Tue, 11 Jun 2024 07:17:41 +0000
Received: by outflank-mailman (input) for mailman id 737901;
 Tue, 11 Jun 2024 07:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3L0u=NN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGvlE-00051o-Ah
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:17:40 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0d7da3-27c2-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 09:17:39 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5ba18126a3bso1995303eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 00:17:39 -0700 (PDT)
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
X-Inumbo-ID: af0d7da3-27c2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718090258; x=1718695058; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoYBBNLSSP1O4lL3mZy+Sbfi2OWvv3v8FsDQhqIkBY=;
        b=WDnCk1RX2YsHKvBdxTfa1ma0qmqSKpuwcVSylSfq8k4tD8/4GI5TvlbJ4AEnPONkSa
         FxcQnndksaeO7iB1+7xwOPs96v31p8jTl47MCR/uLaiyWVamN+CF4v0QvXXpvltxy7jT
         mHlcbCF9dSdyzc7rhcIWM8sZ6yuBnkDInYqckzexQDET5DgYIQ5Jz6+B98wb8MgsZZMK
         TSqgS+zpUy2n+/XC+dT2EiIi4RBFhjFNw/doh2xqYb4U8RRJE36++qVzlQifypqiu37O
         NjBRRMursi84dghnl1z7KlxBjHpPYGLSqC9GdliwOL3GCjlRL5DkCjr3sTxVudLgocWp
         lmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718090258; x=1718695058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyoYBBNLSSP1O4lL3mZy+Sbfi2OWvv3v8FsDQhqIkBY=;
        b=lkeRQzlT0zOLgNfKo+G0oAjuPyVuLytRyuAYm23556fsq1sm4nSVMR69HGGQ17kLAk
         YP/5Vo1CzLsE6jhHxuJ0bPB8ia/MDX/Tk64HigUc7NuVJwWLjwAQdKHHYo1HFukPNQE/
         N5y8K04Xtfau6xXlPWmD6uu7rRKdUaFKYB/hJ8wW4P9y341l9h2RnRaRe+V0JtNBwmFM
         SL74UfZbloR2gA0zbIea9p4BOdMt7CbdSaZz3uJPyqv1liRe4TDNRJpoiznw/x2Wf/fM
         3GrAi7IUNZfL9Jxi9MfCiCc0zFeH3u28n1kh7R8uJ5pGD49RqhYhemKifVRNDkVl/Ct/
         RpCg==
X-Forwarded-Encrypted: i=1; AJvYcCWMBZAV66p1b80HW5fA9KIGG2lof8IXTEMUwzdSsxFMtYy/tCV5QCIlihqv8M81FRxm6O3ZnKQjcgZilD58QRLvsdzwie39j8DHXf5QP8Y=
X-Gm-Message-State: AOJu0YzmTqQPf9SiAUNMICd/ywjgsvq3OAjADDAgbnWPN+rH5DK6cDRy
	XvzKV6sFru7B4oWDV3GUq0qsWaGN6+w85WYG8tX1n7fZznnTvKmSXAgCybP5mOmjZAPonqSnvqn
	/P8j31gy7AZI1r5p9ju8JvB67yJveApC4+UMwVg==
X-Google-Smtp-Source: AGHT+IElWgHm1YsdjYTbTrK1XC4MMT1WF+Bag115PY4VvffFAmulpL3C5j87T3O+tieGy998GKY1OY46P/EJpZxxwsE=
X-Received: by 2002:a05:6820:612:b0:5bb:1ae0:17de with SMTP id
 006d021491bc7-5bb1f7b92b8mr884702eaf.1.1718090257860; Tue, 11 Jun 2024
 00:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com> <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
 <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
In-Reply-To: <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 11 Jun 2024 09:17:26 +0200
Message-ID: <CAHUa44GJYs3mqXG=4T-YyePXK+71FD0qtTmB-_G00FmackZYWA@mail.gmail.com>
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, Jun 11, 2024 at 9:09=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Julien and Oleksii,
>
> @Oleksii: Could we consider having this serie merged for next release ?
>
> It is a feature that is in tech-preview at the moment and as such should =
not have any
> consequences on existing system unless it is activated explicitly in the =
Xen configuration.
>
> There are some changes in the arm common code introducing support to regi=
ster SGI
> interrupt handlers in drivers. As no drivers appart from FF-A is trying t=
o register such
> handlers, the risk is minimal for existing systems.
>
>
> > On 10 Jun 2024, at 22:38, Julien Grall <julien@xen.org> wrote:
> >
> > Hi Bertrand,
> >
> > On 10/06/2024 16:54, Bertrand Marquis wrote:
> >> Hi Jens,
> >>> On 10 Jun 2024, at 08:53, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> Hi,
> >>>
> >>> This patch set adds support for FF-A notifications. We only support
> >>> global notifications, per vCPU notifications remain unsupported.
> >>>
> >>> The first three patches are further cleanup and can be merged before =
the
> >>> rest if desired.
> >>>
> >>> A physical SGI is used to make Xen aware of pending FF-A notification=
s. The
> >>> physical SGI is selected by the SPMC in the secure world. Since it mu=
st not
> >>> already be used by Xen the SPMC is in practice forced to donate one o=
f the
> >>> secure SGIs, but that's normally not a problem. The SGI handling in X=
en is
> >>> updated to support registration of handlers for SGIs that aren't stat=
ically
> >>> assigned, that is, SGI IDs above GIC_SGI_MAX.
> >>>
> >>> The patch "xen/arm: add and call init_tee_secondary()" provides a hoo=
k for
> >>> register the needed per-cpu interrupt handler in "xen/arm: ffa: suppo=
rt
> >>> notification".
> >>>
> >>> The patch "xen/arm: add and call tee_free_domain_ctx()" provides a ho=
ok for
> >>> later freeing of the TEE context. This hook is used in "xen/arm: ffa:
> >>> support notification" and avoids the problem with TEE context being f=
reed
> >>> while we need to access it when handling a Schedule Receiver interrup=
t. It
> >>> was suggested as an alternative in [1] that the TEE context could be =
freed
> >>> from complete_domain_destroy().
> >>>
> >>> [1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4=
SmTy4eWhyN+F+w@mail.gmail.com/
> >>>
> >>> Thanks,
> >>> Jens
> >> All patches are now reviewed and/or acked so I think they can get in f=
or the release.
> >
> > This would need a release-ack from Oleksii (I can't seem to find alread=
y one).
>
> You are right, i do not know why in my mind we already got one.
>
> >
> > As we discussed last week, I am fine with the idea to merge the FFA pat=
ches as the feature is tech-preview. But there are some changes in the arm =
generic code. Do you (or Jens) have an assessment of the risk of the change=
s?
>
> Agree.
>
> In my view, the changes are changing the behaviour of some internal funct=
ions if an interrupt handler is register for SGI but should not have any im=
pact for other kind of interrupts.
> As there was nothing before the FF-A driver registering such interrupts, =
the risk of the changes having any impact on existing configurations not ac=
tivating FF-A is fairly reduced.
>
> @Jens: do you agree with my analysis.

Yes, I agree.

Cheers,
Jens

