Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44086E0F8D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 16:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520794.808810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxYy-0008Mh-Bx; Thu, 13 Apr 2023 14:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520794.808810; Thu, 13 Apr 2023 14:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxYy-0008JJ-8Q; Thu, 13 Apr 2023 14:04:36 +0000
Received: by outflank-mailman (input) for mailman id 520794;
 Thu, 13 Apr 2023 14:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxYw-0008JD-FR
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 14:04:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d31a31b-da04-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 16:04:32 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so6459930wmb.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 07:04:32 -0700 (PDT)
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
X-Inumbo-ID: 1d31a31b-da04-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681394672; x=1683986672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tef11HamORpWrO4zt3gqCOD3tNCnJEUhR/3tGw75Byo=;
        b=En+0pKx3uy5Mnn+GGSiASx+oSfjuCd4RNPd7sIyf5eCKUisFJd7NH37cTKIeVen3WT
         S5Z4kjtpFFNIow6mgmfSDIVz0HDfRZ2cKqUWq0YJWiz3cVW1TLxT+Zu/V9VVU81jg7QY
         Fiio/k+0PpOGFgWpEptKpEoFZd6UCEa7yBzDtr60XhLxxjMmMTOChgg4H/erxSRPLbjb
         7/DP21wuPHraUMGIecKmg66TZhCJPyTNC+gaUaNpZXZlqiwK8cqkP5DoT8XLOdO8lSRP
         PXq4B14kBLQN0jHojN6+I9DEvSK+scFbsH0IbV22vLJHWIs4hfVgIbkC/p76xbvu1YJ9
         BcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394672; x=1683986672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tef11HamORpWrO4zt3gqCOD3tNCnJEUhR/3tGw75Byo=;
        b=ku9Fatt2ThHwDTr0FNtLiO9vWY/dAFeRKuloPIP+yv9Oj5jW3Hz8nUh2AORkc/T0e1
         JSLIQ3KxpMaNN73OvBctphjvshQ+hiz69Z6v3rIDy5lClEm5kU+CsXPzKVFqgU5J/5Sd
         UdiKh/Z4f6O2k3vGXgze+cIA3ZxolhQjoXtR2LuUgM6rqP0zFo6byVFuHGgDOsdGZ0p0
         tUROYWp/uc5/+DJwfgIR6fnNx+2mOWrOpks2ga5BPj3vTAJlX/cAxAYFu9U4IeBrMPjy
         XQltpjyKpUbgTzPbMoS/JTjhNQw1/UK6o6ynKNOtM6TwaNFRN83Fs4SurjKPg0c8EaJe
         Rn4Q==
X-Gm-Message-State: AAQBX9eHaRUuXw1ojw+L1VQqWBVNz+U9CXkUaI9rgtjfzdD6NxF/mDX0
	PB6qhFZVSeBoYKf86/lXpSCvtQX36GkVgkJ733W2Kw==
X-Google-Smtp-Source: AKy350b/N/foTgSiIYTBBi1PSq0BNKihoARgBMwt1YyHQzgotCZCq77/mpuOt3p2AsNvDnotLSxVCyZZRJXRpgHx12U=
X-Received: by 2002:adf:df83:0:b0:2f4:1214:d5b4 with SMTP id
 z3-20020adfdf83000000b002f41214d5b4mr404765wrl.3.1681394671929; Thu, 13 Apr
 2023 07:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-15-jens.wiklander@linaro.org> <AS8PR08MB799105F5A90ECF0085BA63A492989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB799105F5A90ECF0085BA63A492989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 16:04:21 +0200
Message-ID: <CAHUa44F3a7_XPqK0CnJUHX=hMXoHXtuXg_v6Rf8ZmCuQpyrX3A@mail.gmail.com>
Subject: Re: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:31=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and
> > uint64_to_regpair() to regs.h
> >
> > Moves the two helper functions regpair_to_uint64() and
> > uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> > specific regs.h. This enables reuse of these functions in the FF-A
> > mediator in a subsequent patch.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll add it.

Thanks,
Jens

>
> Kind regards,
> Henry

