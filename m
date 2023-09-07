Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC507972E3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597386.931617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFKn-0002t4-Os; Thu, 07 Sep 2023 13:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597386.931617; Thu, 07 Sep 2023 13:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFKn-0002qq-Lv; Thu, 07 Sep 2023 13:46:13 +0000
Received: by outflank-mailman (input) for mailman id 597386;
 Thu, 07 Sep 2023 13:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeFKl-0002qg-Tz
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:46:11 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6e1aa14-4d84-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 15:46:10 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-500a398cda5so1669988e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 06:46:10 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a19c511000000b004fe36b790a1sm3198213lfe.128.2023.09.07.06.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 06:46:09 -0700 (PDT)
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
X-Inumbo-ID: e6e1aa14-4d84-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694094369; x=1694699169; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l5hosa7EStNjPh8xdEHZ8Pp/c/wz+HxPpBsoB1pGF+Q=;
        b=kiyMs5GmpIZuPvny5KLlxm8cp/wBplNeZ6s7FRcwr81WPMOX/ejronexfTdBOGqqN1
         SdrK9Yyva3BBSdcVN3B0hqrVtmkOp8TwM1Ywj2GGAh/AILR1os6DDJAJ1ixOfrPRDSM8
         YqAAFLNl7g/Fb3els/J2pSZ0J5ZX2L/rBL2M2/49JwHxpwtQBqtPe6IpDIpCuIZmpOyZ
         RtvSM6w+06yy0hGY1y78+JzquGpBYpMU8mZvP9/fXK34F+NlBKAT10GMbtHuMqfDsZw+
         GqQqEpfHMkuUGYvPj7iZT7tufdEk0jEbNdMRK+c4rycafCrMpxvlZi/xGpzeUm4uGbqR
         PCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694094369; x=1694699169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5hosa7EStNjPh8xdEHZ8Pp/c/wz+HxPpBsoB1pGF+Q=;
        b=f0rSHqwPTDX85cwxUapXPzFeJaMBFCW40T6o0hPwFHtvx6yWj5CrY4s/ppwTE/Q1WQ
         zPnhhQUiBMK6faOqokaHkh8QZFDkq3Fjjoqc3yE04VoGT1o5hWwW/g9OWfewEtfRKMv2
         Vy7S8+/RqwiRsMycLM2JrGZ1oaPlau+Sg/Jklz3tNtpRzP8gWuOUIWQ+VRzlPb/c4isP
         Qpg4mvJQmslrjYp6/WgXckMMEkgkl+jxMI+gb92IYqoX8ybCXQjJAwW9Vf7snBiqhonx
         WMF6RORMN7GbB4/3OmkG+eacWveJJ6IART5JwCFk/Ongoe0hTULdkngvTKfp1iLZhes2
         coHA==
X-Gm-Message-State: AOJu0YwAeYwj8SYyg63vobSNWm1XxVh9OD5zGY41S8acXQi6wV8DHQEn
	bKtspf/j8zCy9TQCd4Ht9Qg=
X-Google-Smtp-Source: AGHT+IGmiPkQvFRf9uiHzw4KnnO4Tzk+k+o60J8UwYeIoPO6pqkQQPXo4OXp3GVe0XllBWSZHCqnFQ==
X-Received: by 2002:a19:6d11:0:b0:500:b5db:990c with SMTP id i17-20020a196d11000000b00500b5db990cmr3867847lfc.57.1694094369370;
        Thu, 07 Sep 2023 06:46:09 -0700 (PDT)
Message-ID: <dd922527db03b445d0a2de6113a92ccc1dbb60f1.camel@gmail.com>
Subject: Re: [PATCH v6 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, tamas@tklengyel.com
Cc: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Sep 2023 16:46:08 +0300
In-Reply-To: <687a1039-5f8d-bee2-50ce-1fa80ef31f19@suse.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
	 <47e12756edfefdb5ff1112ae6b78ae95baadbbef.1694078544.git.oleksii.kurochko@gmail.com>
	 <687a1039-5f8d-bee2-50ce-1fa80ef31f19@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-07 at 11:59 +0200, Jan Beulich wrote:
> On 07.09.2023 11:32, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/vm_event.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier:=C2=A0 GPL-2.0-only */
> > +/*
> > + * vm_event.h: stubs for architecture specific vm_event handling
> > routines
> > + *
> > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
>=20
> Tamas is the maintainer of these files (no matter where they live),
> so
> please make sure to Cc him in order to get his ack.
Thanks. I'll add him to CC.
>=20
> > + */
> > +
> > +#ifndef __ASM_STUB_VM_EVENT_H__
> > +#define __ASM_STUB_VM_EVENT_H__
>=20
> Nit: s/STUB/GENERIC/ ?
Yeah, it should be generic. I'll update that. Thanks.

~ Oleksii

