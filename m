Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AE674ADA3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560304.876120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhVb-0004sF-1r; Fri, 07 Jul 2023 09:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560304.876120; Fri, 07 Jul 2023 09:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHhVa-0004po-VP; Fri, 07 Jul 2023 09:12:10 +0000
Received: by outflank-mailman (input) for mailman id 560304;
 Fri, 07 Jul 2023 09:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcIV=CZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qHhVY-0004pi-U3
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:12:08 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5884c991-1ca6-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 11:12:07 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b703d7ed3aso25958251fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 02:12:07 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a2e9f50000000b002b6fe751b6esm679254ljk.124.2023.07.07.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 02:12:06 -0700 (PDT)
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
X-Inumbo-ID: 5884c991-1ca6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688721127; x=1691313127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lrUZH5OPBvrM+ZE4I5B5tGUAEUpwhPul9K/44S93/jk=;
        b=mDuB1cMSZooDY2ancPe1ytrRLFC22Q2aDm8M+PBgGLRirf0zPTla17V26bLSFEs1Ma
         G6b9CaujRnpSrqYJEuwATMO7gbrMMMk8s7U+rD+ghwr+yVdPXLPzAhrc29o0fVMiqpSS
         YIuvZrjjOWHM3wxIprZ96eSlXMH7zchYSr0x4SZuGmmdZ680xtuWO/XKcbllnrOvX/Rx
         4vdT5p4oKz0Jh0oU5WFYrhsGu9XtzdbNIAtRSZtqr1llNxnEyyR05cl9j6eMN7Psdugi
         OIGvXj8AAlvrVVUM/oy/pAl95R0fC7Tu2o/5FB7QX9tBMPBd9dlihh6am9py9mJxqtVL
         5SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688721127; x=1691313127;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrUZH5OPBvrM+ZE4I5B5tGUAEUpwhPul9K/44S93/jk=;
        b=ceLeibnYK/OJnHXndGJO2IWbtmLow95P+nVRui1tDylDrAQdl7V8vEltNo8ZUsDn3O
         2xUzjf2OApyC2L28fnDUXQL3eEUMXM1yn4xuE+XeDv1yktRerBvOSFOmoLy/xjecdFM0
         dimH8q6ykiR3Qs6tDdi7ApPvwJyxXiiBWxFMCNQ4BgeTS8wVY7Jk+dSpZ7kRaBrNpjuK
         TrGRS0T9zoQ09tZFW4c1q+LGDrDc9Fp4fzDrphZSAbUEuKphNaEsSG3cZHaG/EMXg5DB
         9Y+wH+4Xu3szLlVnYUW6y5/0Kvd1+tk2+X+9U39un0bunYR+SeX36l939GGlGJI+X5Kn
         vmmg==
X-Gm-Message-State: ABy/qLYAoNnKe1RP+eKE+wE2rcpuLlc/a5lvjecUP9Anz7ssr+pC/S35
	L1+JCsmKT0JR8FiLemdpZjLPEcgrKxs=
X-Google-Smtp-Source: APBJJlGaBM+5N/3JkS9VWKmGAoNYXOdrOEP9FdT0RwRe1JJPMfX1gPCwdTufy+I8zZlUVt3yqeoZow==
X-Received: by 2002:a2e:9656:0:b0:2b5:1b80:264b with SMTP id z22-20020a2e9656000000b002b51b80264bmr3809272ljh.12.1688721126414;
        Fri, 07 Jul 2023 02:12:06 -0700 (PDT)
Message-ID: <29c4af7dcc95956c12818fd024416930f90e12f7.camel@gmail.com>
Subject: Re: [PATCH v2 3/6] xen/riscv: introduce function for physical
 offset calculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 07 Jul 2023 12:12:05 +0300
In-Reply-To: <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <f84bdc5ad9f10f864d070f7581dce663ccc9cb53.1687178053.git.oleksii.kurochko@gmail.com>
	 <c716120e-8228-826a-bb33-298aa47b94f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-06 at 13:18 +0200, Jan Beulich wrote:
> On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -29,6 +29,8 @@ ENTRY(start)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 reset_stack
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=C2=A0=
 calc_phys_offset
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0=
 start_xen
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text, "ax", =
%progbits
>=20
> Since you call a C function, the code to save/restore a0/a1 needs to
> move here (from patch 4).
Thanks. It makes sense.
It would be better to move save/restore a0/a1 ( from patch 4 )code
here.

The only one reason I didn't do that before that calc_phys_offset
doesn't touch that and it is guaranteed that it will not ( as it
doesn't have arguments )

~ Oleksii


