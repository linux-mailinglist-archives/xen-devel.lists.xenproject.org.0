Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23171886C07
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 13:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696854.1088038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndyz-0006IQ-11; Fri, 22 Mar 2024 12:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696854.1088038; Fri, 22 Mar 2024 12:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndyy-0006Ga-Tq; Fri, 22 Mar 2024 12:26:48 +0000
Received: by outflank-mailman (input) for mailman id 696854;
 Fri, 22 Mar 2024 12:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8LS=K4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rndyy-0006GR-6d
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 12:26:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72e4bb44-e847-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 13:26:46 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a468004667aso293930066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 05:26:46 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a170906475400b00a46cc48ab07sm965496ejs.221.2024.03.22.05.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 05:26:45 -0700 (PDT)
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
X-Inumbo-ID: 72e4bb44-e847-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711110406; x=1711715206; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2r3y+dx+CyevSy20ZzcwhiqyVuOXpNZgGm5JdYb6VhE=;
        b=QNwkUz6JjZszLZsjUYjilZSYAE3cpmsx5CibGNCRafIyPW2mFAx/isGT/AtUv+yYc2
         Bb7LTVfoTiHhUcn7qu/06trlCfc3zgCJw25hkXDkAeOQDqOrgy0ZF5UrmQsxpI6+NUdv
         ZcEFUlZvkBVaz5250AbHOWT2nnivzz5LZ5vJZhqYYcAFGCqzflISQ/025/tp/+5q+phS
         lGq2niAi9sdmzVV0ABYswhV26n+vX8HVIFPaGMwt2tpS5Xif7sBD85jXzfaPm/rDgCkj
         U17sgljJEnUdgIKY+wM3qmUboVMoHcqqwJuGLN/sYoXY302O0+IwJlbRBz7wkXmNkEQP
         IHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711110406; x=1711715206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r3y+dx+CyevSy20ZzcwhiqyVuOXpNZgGm5JdYb6VhE=;
        b=K4TM0LkZYozUXW3X9jRSQzaBl96Z5mrM/eFaOyOFKB9uG8niv1S2piMdsxR2DXlS3c
         2gL+TE2eXRGOAuOiB0gi1uZFu6JPerql/AQfWAi/r/noBI6r4JqXXnkKOget3cwAxzLC
         mLVVyFzM2QEjLDZUaoOkFx1ckFp8RCGkcSajAktUhQNbgbSjuhUn+dCIBEcWkOIf2/PI
         O6ZLWNPuIblzzUqvs+BuwvXdyhdffEDPU5lGrBeUPN0HCsuZarUpdRRdK+Z4dNjou6Q+
         FoW7Bmv2nYaLqWp0xjPNCpJ6uR2qfRF6HE8qtLiJ8AHERpGYg1xI7AVfW6/Ph9x7J2Xw
         VyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2pa31HzptzZhJ8th7B/R1czF4eiICUJ6QKM5NBcE+0ura/6XHtEECJoSe2NAXillHV+NY0WIIoEHKHQtYPztSGVw0DEszbWvcXoCZEEo=
X-Gm-Message-State: AOJu0YznatofWzyAAzllIArgs2l0APymnW9IYa6SSnC75VafkQgis/9X
	4H0D6DbAYEQauRMWXlM8nJ+6eMnymBcQfdSm2pr5mtW1IiOntH4q
X-Google-Smtp-Source: AGHT+IF3FfXwJFKR+QlDi1JxhgEGOcCl+LBHS4ilrZ14dVU0Pv+7/gaji6dDMpVm1tylTGO+hBDh1A==
X-Received: by 2002:a17:907:bb8e:b0:a47:2f8c:7614 with SMTP id xo14-20020a170907bb8e00b00a472f8c7614mr1132524ejc.43.1711110405761;
        Fri, 22 Mar 2024 05:26:45 -0700 (PDT)
Message-ID: <c3eae3e4466a79ca0af7025ea0773f4af1405b6e.camel@gmail.com>
Subject: Re: [PATCH v6 15/20] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Mar 2024 13:26:44 +0100
In-Reply-To: <026c4245-5a8c-4e09-9026-44b8f3daca67@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <c05291c698d37ac0d6d31602fe35b2accf2d518c.1710517542.git.oleksii.kurochko@gmail.com>
	 <026c4245-5a8c-4e09-9026-44b8f3daca67@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-21 at 14:26 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > The cpu_relax() function, introduced in this commit, is anticipated
> > to
> > support _zihintpause by the CPU.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks.

>=20
> Looks like this can go in ahead of the other 14 patches?
Yes, it can. I'll rebase it ahead.

~ Oleksii

