Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043A809FFF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650514.1016123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXY1-0000E2-LA; Fri, 08 Dec 2023 09:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650514.1016123; Fri, 08 Dec 2023 09:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXY1-0000C5-IZ; Fri, 08 Dec 2023 09:53:29 +0000
Received: by outflank-mailman (input) for mailman id 650514;
 Fri, 08 Dec 2023 09:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXY0-0000Am-7R
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:53:28 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1dc7dd1-95af-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:53:26 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c70c70952so2664574a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:53:26 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vw11-20020a170907a70b00b00a1cbb055575sm787513ejc.180.2023.12.08.01.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:53:25 -0800 (PST)
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
X-Inumbo-ID: a1dc7dd1-95af-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702029206; x=1702634006; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0VUxLyNi6dnErmrZDMBJXzOAhHsUtspxp/ce1cVvzMs=;
        b=h2iLj2rKBY8YksQz5zHOhDakrtiyT5MrFCMr594CDsGchF+ym405G8mR1vzDKMLARM
         7efVB2RppL+X95zZIc4YXRpLBbwssCXk5EucydzoAF/1M/YxRrs+OrnXbMQZJKxPOt5m
         6yx6IjaI7i0pPZPGtDeJBb/30lvdb+Bl24ro/cpUbEpv5d+/pld4Nn8YhrWyu0c0ZLZr
         apcBA9sS4d/rKzfxzVHhLj4UF9nQ+Ne0gFoKpKhWg6+cTh0sXzodJvQw+K9zqzeqx8v+
         xAFzwJs3RkSIfjT7q24LtCSRibOOVdN5iafrH5W8A5Uyl7G5mqkvyGpdLo3x7t65WhXm
         y6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029206; x=1702634006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VUxLyNi6dnErmrZDMBJXzOAhHsUtspxp/ce1cVvzMs=;
        b=jiN078UTP4C8RMnouBwMuy1G0Gu606EI4Jmi0+4xUYjx75ZKY9NLjMvzL/RcOUdXN0
         wB01WTIGdO/dqKomQV9nw/BKNOS+9AkvPgOijnFALIXAAI4pb7uSNdF6DbyHWreCXovh
         /eKTzIOW2MU95yI0ubO6Uq6Kda+zT9XeddPfPjyBjcNBODOfvL44JpjOobQPrx1Rrexa
         maz6icfEn5Xau4gOAxj9yc7G9y7qwMb3YuThDaPtbgDTgJLg2CvlfqyGciNOykFbAlSv
         0m17xOgp7JvEeWBuvdUYt6UB2YekH1h+2vWbmhN8jiUUEh9JAytmPOmbB9rSmGXI0xYN
         HVBA==
X-Gm-Message-State: AOJu0Yysm5LeJ8yuUddLOaWUwb5d2LenF+13XpG++qHLjcdCufynDaa1
	3/gUAM+8U3Y20EUmjLHLRYM=
X-Google-Smtp-Source: AGHT+IGy/mtgqlRsf2ha145nwBUrAAHWgi0iuKWpaVFnrcZxOiXpOjiowyRhTIAuJ4Z/1RY8VXHW3A==
X-Received: by 2002:a17:906:6852:b0:a19:9b79:8b45 with SMTP id a18-20020a170906685200b00a199b798b45mr1836677ejs.86.1702029205779;
        Fri, 08 Dec 2023 01:53:25 -0800 (PST)
Message-ID: <b8f50306e37ab137f5f9fa81fa4ccc794b488b36.camel@gmail.com>
Subject: Re: [PATCH v2 16/39] xen/riscv: introduce asm/smp.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:53:24 +0200
In-Reply-To: <4e21bb44-5410-4676-a7a8-96f1d1729c27@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <39cc57e443d2df432f90361204c9edd802fcc320.1700761381.git.oleksii.kurochko@gmail.com>
	 <4e21bb44-5410-4676-a7a8-96f1d1729c27@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 16:43 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/smp.h
> > @@ -0,0 +1,23 @@
> > +#ifndef __ASM_RISCV_SMP_H
> > +#define __ASM_RISCV_SMP_H
> > +
> > +#ifndef __ASSEMBLY__
> > +#include <xen/cpumask.h>
> > +#include <xen/percpu.h>
> > +#endif
>=20
> If you want this to be possible to include from assembly files (I
> don't
> know why you would want that), ...
>=20
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> > +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>=20
> ... these two would also need to live inside the #ifdef. Otherwise
> the
> #ifdef wants dropping.
I think we can just drop $ifdef. I am not sure that this header will be
used in assembly code.

>=20
> > +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
>=20
> Seeing this is now the 4th instance, I guess we want to move it to
> xen/smp.h. I'll try to remember making a patch.
It will be nice.

Thanks.

>=20
> > +/*
> > + * Do we, for platform reasons, need to actually keep CPUs online
> > when we
> > + * would otherwise prefer them to be off?
> > + */
> > +#define park_offline_cpus false
> > +
> > +/* TODO: need to be implemeted */
> > +#define smp_processor_id() (0)
> > +
> > +#endif
> > \ No newline at end of file
>=20
> You want to take care of this.
Sure. I'll add a newline. Thanks for noticing that.

>=20
~ Oleksii

