Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3390390D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 12:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738250.1144944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGys7-0005o2-Lw; Tue, 11 Jun 2024 10:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738250.1144944; Tue, 11 Jun 2024 10:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGys7-0005lV-JI; Tue, 11 Jun 2024 10:36:59 +0000
Received: by outflank-mailman (input) for mailman id 738250;
 Tue, 11 Jun 2024 10:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sGys5-0005lP-J4
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 10:36:57 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8650b6c8-27de-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 12:36:56 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebed33cbafso16313211fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 03:36:56 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ebeeedb430sm5839201fa.7.2024.06.11.03.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 03:36:54 -0700 (PDT)
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
X-Inumbo-ID: 8650b6c8-27de-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718102216; x=1718707016; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ua/9tU6WjUgdIb99k8GzdQaIcfyExYSTyUBWc9wYbNs=;
        b=Q1bWwgF1E2BtklRXg01pSbkjLPM5ajNncu7PtXynaigICD79RimFpjYt+bAAazG2cf
         YSYL43ZKPuWdar28qVdaPrxqWvxqPhIyybTAH7bMQL8+opCh/rv2xKTKsCUv8N2Cs3eU
         T3CidGzWfFwDeIe88ohLJE7sx3yGNo2aYqA2gmsvbEWj0xeKRTbBKBJu9jBAR72dWJ4K
         lj+hgPuC1GGHGA7ehQIRrdyap0tbCBPlnbg1/N8dGCvCdRDJgfwmTSiVrpp91NRIj9ON
         x3OhHXbanIyjBqa9rMVyU0YZrbX1JDOmFYuJ1MGkE2NtOLlGtGb3DEGmr0/g9A16J2sn
         ZTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102216; x=1718707016;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ua/9tU6WjUgdIb99k8GzdQaIcfyExYSTyUBWc9wYbNs=;
        b=Ch0gF/D/bpAu7SMjga+nI4q7y6TPPCLqPRTV1z3l4hckPPXYH0DRBxqQc3udFgbMqZ
         O6D2JDIQKbbPGo27MPEKfl215MXKSpgf5kyoLxt9CwE3fBggi3yBAD1lcAxPU5oBv0lF
         TAKfzfgUE9pofmOTpsKD8wQun+KM/df64YIv+Ad0AfhkLVMzn0sMIdLfhX17voqgdnzc
         ALlI83fdfdPvUiVTlYj2g86xTWGh16ZkbTj8NE2aryX6PkZio6Cbbp8AonzI7FJBIWl/
         iJe4EJy6mEVf/I5Tq0ut7W+WHdXrchHp8hAkFLhu7mTY2ZEBqWveoJX8xZEoRKeq31UD
         g3wA==
X-Forwarded-Encrypted: i=1; AJvYcCXrlNv/3Jnt04dIrrcbXDGY12DWYoBbK4ufLYqOtIDHXB+zHgw52ZhhjaPKStUO9cdQoBQAa4a06Z5yuQfq5ejlEtCOjK+4q4WmODHdG5s=
X-Gm-Message-State: AOJu0YwnSsFaAO7hJHKpZzl1LMMHrZ0TOmh6oi3cY96VIQRfmCcKZJwv
	PYFJX4E/qVW6ltNiSU/bf2aPZHoISK8ePbwRLye9xZJ7NBRb2YWh
X-Google-Smtp-Source: AGHT+IHYsD+RBewU6TEw3bw/LvCitwcG9YbpIzBPYTeW5cMKahE5cAUAulsxW7/VYoKUAA+2j3L/ug==
X-Received: by 2002:a2e:9d91:0:b0:2eb:d620:88d2 with SMTP id 38308e7fff4ca-2ebd6208a4fmr44532761fa.5.1718102215160;
        Tue, 11 Jun 2024 03:36:55 -0700 (PDT)
Message-ID: <6a255f3dccc609e680659ed05b613c21a33cfb20.camel@gmail.com>
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <julien@xen.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, "patches@linaro.org"
 <patches@linaro.org>,  Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 11 Jun 2024 12:36:54 +0200
In-Reply-To: <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
	 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
	 <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
	 <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hi Bertrand and Julien,

On Tue, 2024-06-11 at 07:09 +0000, Bertrand Marquis wrote:
> Hi Julien and Oleksii,
>=20
> @Oleksii: Could we consider having this serie merged for next release
> ?
We can consider including it in Xen 4.19 as it has a low impact on
existing systems and needs to be explicitly activated:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> It is a feature that is in tech-preview at the moment and as such
> should not have any
> consequences on existing system unless it is activated explicitly in
> the Xen configuration.
>=20
> There are some changes in the arm common code introducing support to
> register SGI
> interrupt handlers in drivers. As no drivers appart from FF-A is
> trying to register such
> handlers, the risk is minimal for existing systems.
>=20
>=20
> > On 10 Jun 2024, at 22:38, Julien Grall <julien@xen.org> wrote:
> >=20
> > Hi Bertrand,
> >=20
> > On 10/06/2024 16:54, Bertrand Marquis wrote:
> > > Hi Jens,
> > > > On 10 Jun 2024, at 08:53, Jens Wiklander
> > > > <jens.wiklander@linaro.org> wrote:
> > > >=20
> > > > Hi,
> > > >=20
> > > > This patch set adds support for FF-A notifications. We only
> > > > support
> > > > global notifications, per vCPU notifications remain
> > > > unsupported.
> > > >=20
> > > > The first three patches are further cleanup and can be merged
> > > > before the
> > > > rest if desired.
> > > >=20
> > > > A physical SGI is used to make Xen aware of pending FF-A
> > > > notifications. The
> > > > physical SGI is selected by the SPMC in the secure world. Since
> > > > it must not
> > > > already be used by Xen the SPMC is in practice forced to donate
> > > > one of the
> > > > secure SGIs, but that's normally not a problem. The SGI
> > > > handling in Xen is
> > > > updated to support registration of handlers for SGIs that
> > > > aren't statically
> > > > assigned, that is, SGI IDs above GIC_SGI_MAX.
> > > >=20
> > > > The patch "xen/arm: add and call init_tee_secondary()" provides
> > > > a hook for
> > > > register the needed per-cpu interrupt handler in "xen/arm: ffa:
> > > > support
> > > > notification".
> > > >=20
> > > > The patch "xen/arm: add and call tee_free_domain_ctx()"
> > > > provides a hook for
> > > > later freeing of the TEE context. This hook is used in
> > > > "xen/arm: ffa:
> > > > support notification" and avoids the problem with TEE context
> > > > being freed
> > > > while we need to access it when handling a Schedule Receiver
> > > > interrupt. It
> > > > was suggested as an alternative in [1] that the TEE context
> > > > could be freed
> > > > from complete_domain_destroy().
> > > >=20
> > > > [1]
> > > > https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4Sm=
Ty4eWhyN+F+w@mail.gmail.com/
> > > >=20
> > > > Thanks,
> > > > Jens
> > > All patches are now reviewed and/or acked so I think they can get
> > > in for the release.
> >=20
> > This would need a release-ack from Oleksii (I can't seem to find
> > already one).
>=20
> You are right, i do not know why in my mind we already got one.
>=20
> >=20
> > As we discussed last week, I am fine with the idea to merge the FFA
> > patches as the feature is tech-preview. But there are some changes
> > in the arm generic code. Do you (or Jens) have an assessment of the
> > risk of the changes?
>=20
> Agree.
>=20
> In my view, the changes are changing the behaviour of some internal
> functions if an interrupt handler is register for SGI but should not
> have any impact for other kind of interrupts.
> As there was nothing before the FF-A driver registering such
> interrupts, the risk of the changes having any impact on existing
> configurations not activating FF-A is fairly reduced.
>=20
> @Jens: do you agree with my analysis.
>=20
> I made a text for Oleksii at the beginning of the mail.
>=20
> Cheers
>=20
> Bertrand
>=20
> >=20
> > Cheers,
> >=20
> > --=20
> > Julien Grall
>=20
>=20


