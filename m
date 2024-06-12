Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C843F905035
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739118.1146057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKyo-0003mq-K6; Wed, 12 Jun 2024 10:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739118.1146057; Wed, 12 Jun 2024 10:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKyo-0003kc-HU; Wed, 12 Jun 2024 10:13:22 +0000
Received: by outflank-mailman (input) for mailman id 739118;
 Wed, 12 Jun 2024 10:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FFiX=NO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHKyn-0003kR-Pd
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:13:21 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65245206-28a4-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:13:20 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso370767566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:13:20 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f17b2bcbcsm438058266b.102.2024.06.12.03.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:13:19 -0700 (PDT)
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
X-Inumbo-ID: 65245206-28a4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718187200; x=1718792000; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aiz/H2My8QHO6/QGgq1w7yGj1brhz9OJKzqqTH7M94U=;
        b=T/RXLLtjG9/KbSBUykTyAg6pxjbpZwonw4G/j0wmFK09+9qd3Ddghcj9NNxUb74ZTL
         ZwY5ntZaNPGm25YxZJDRSYdfJMTpjyYmfVZG+6NajeeZzUkBaDdJftmabbDe+f8io09T
         Z/QuZ1k+fONaF3qycOLSnY712wvRnoczJS669s8uZm0SrdAXXW0l3IeUwG6ZR2LN7wvR
         MNc+yUN/Vi04Z60nC0OeY7lnwoRBODC0Jm46EgudDrDr+cFI3tjjpEuzuu3v/TFqdaMc
         427/xr/KxgG85Nol5pSxQWIYJEe7SqkRXmiAbZtzMOLLwz7RsxEMK1ZYmCnBCEsOfK3m
         lQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718187200; x=1718792000;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aiz/H2My8QHO6/QGgq1w7yGj1brhz9OJKzqqTH7M94U=;
        b=Ty2u7bZ7C0ZFda8ZiTwAGYsCgm9EW2ycgxqibpw7Nu76nz6/10B7zYxU5SGjdSCFlE
         s6237+A6X9ZURwukwiMG34STavxeA1Brg8sH+LSxMiRP94v7+7CvorjsvPKjk5qsg60U
         shkUZlgp7281j/eN2CHb7HS4I9DX4zoasjUL02GTio6w5iXxp0P1+XvgSzrlbBr4zCsM
         7doKGz6lT//8XALe/Zp0Jyf6Rd5IfXwuixAYtoQdcjp66ke/y0E4NFmFW/HXYataQ2eQ
         7hLdKa74hTmcTbI0oVvpInUh3bBmMy1/AhGOn+Z2B3QadkNOYZuGVkDr+pO4eNO41qLG
         0YIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXddCJI4YucTZRHr6k/KU7vuBsAQ5qB2sNvpIQ77LQlCAC3CS+CELGD57YZcvzvoMpNGoVwn/uMCHkYU0cYS5xfvtVf96J9teZeMlCXXos=
X-Gm-Message-State: AOJu0YwuxPGMa9LwgQEzmeNh3hXIDGFco8ZswmmuXfoUjcYFDbFnRIoN
	mow0zh6eFU1QJyIZoEnTwYtvA+kStxJLx1uTwt2osqnUyvoZARQv
X-Google-Smtp-Source: AGHT+IFVVLt3s9+yTNrXWUlNKYloRUA4AtCJdyqDt+cis782nXGLaX2jslfhoUxN0LUJU2sPCghA0Q==
X-Received: by 2002:a17:906:f2c7:b0:a68:fb7e:f476 with SMTP id a640c23a62f3a-a6f47d52b3fmr66819866b.30.1718187200154;
        Wed, 12 Jun 2024 03:13:20 -0700 (PDT)
Message-ID: <335bebc196baba16679cdfc9ba997acff1705da0.camel@gmail.com>
Subject: Re: [PATCH v2 3/7] x86/irq: limit interrupt movement done by
 fixup_irqs()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 12 Jun 2024 12:13:18 +0200
In-Reply-To: <5660db44-b169-44e3-9439-67d3b55bcac0@suse.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
	 <20240610142043.11924-4-roger.pau@citrix.com>
	 <5660db44-b169-44e3-9439-67d3b55bcac0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-11 at 11:59 +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > The current check used in fixup_irqs() to decide whether to move
> > around
> > interrupts is based on the affinity mask, but such mask can have
> > all bits set,
> > and hence is unlikely to be a subset of the input mask.=C2=A0 For
> > example if an
> > interrupt has an affinity mask of all 1s, any input to fixup_irqs()
> > that's not
> > an all set CPU mask would cause that interrupt to be shuffled
> > around
> > unconditionally.
> >=20
> > What fixup_irqs() care about is evacuating interrupts from CPUs not
> > set on the
> > input CPU mask, and for that purpose it should check whether the
> > interrupt is
> > assigned to a CPU not present in the input mask.=C2=A0 Assume that -
> > >arch.cpu_mask
> > is a subset of the ->affinity mask, and keep the current logic that
> > resets the
> > ->affinity mask if the interrupt has to be shuffled around.
> >=20
> > Doing the affinity movement based on ->arch.cpu_mask requires
> > removing the
> > special handling to ->arch.cpu_mask done for high priority vectors,
> > otherwise
> > the adjustment done to cpu_mask makes them always skip the CPU
> > interrupt
> > movement.
> >=20
> > While there also adjust the comment as to the purpose of
> > fixup_irqs().
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> Aiui this is independent of patch 1, so could go in while we still
> settle on
> how to word things there?
>=20
> Jan
>=20


