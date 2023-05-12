Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4986570028F
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 10:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533749.830652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxOH9-00022Q-Sq; Fri, 12 May 2023 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533749.830652; Fri, 12 May 2023 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxOH9-00020P-Q6; Fri, 12 May 2023 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 533749;
 Fri, 12 May 2023 08:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGko=BB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pxOH8-00020G-5I
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 08:37:18 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32e4cc00-f0a0-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 10:37:15 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac7c59665bso106678061fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 May 2023 01:37:16 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a2eb1c4000000b002a76c16ad65sm2707537lja.87.2023.05.12.01.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 01:37:14 -0700 (PDT)
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
X-Inumbo-ID: 32e4cc00-f0a0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683880635; x=1686472635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5jshfeE58bBaVwCcbNiWX9ibjxktpjo8LIbRDvC11Sw=;
        b=WXuXNqVuQJ+Nbw6ciDkDs77md+jeK5/x06xH7tSe26w0c+35bKuV+55mRR7/Q8+S/T
         8WPorP7588Qan7LvRL78G7oqN31jkYdfwgR9rQ2WMXrKq1cksipCk6keY6KK0U6PV8gB
         aBF2DwZZCXLFX9y9vOLAIYMbdwBqsqLNzY9UGTaDZ63GzwrOsTvCXmVdDGJWaxz0go85
         e1xe0LAZ1H/St+RU7MG8mfD6bHErNFNEN/pwZqzrm3sX3sEeBcua2krgi0fk+ZiKiN5L
         TRzA9FApOvQdI0d7T6zqGBbnMqbaigfhCPB6YDNZMOzob8Qa4aoBQ1GkztshgL728zm2
         G5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683880635; x=1686472635;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jshfeE58bBaVwCcbNiWX9ibjxktpjo8LIbRDvC11Sw=;
        b=kcwxRv3oBTEbTEVpK8fQPvVVmP+nprnMK0zuvguxb9mZ8x1T0bEYystDvt4lSIUztU
         dRxVxYS36f0Z6WN2oy/nburc2WEfya9E/wZ5TaKV3SXfpo36H85ujOI442/5ZCpLrv9X
         OlVNcG4oaN7IYssmd2eqYKrC8vxB3dr2HwuzDGKOxbbC99qsXsL7FVyiomtMGtxS3lMI
         8pqCT86EO/yRKO1/YxmiQllQrXU4+5xQS3fx1I5HXq3MUCTYNS2bu9FaCMzpmFvYb4jK
         2r0LvUXSRQezODFrEKq/++Px0bgdy0h2LKxqJMaH37zwvK8mgFw65wIpvihVt6zoz4tx
         4AoA==
X-Gm-Message-State: AC+VfDwnr4zTppWRmeSz4AN9t/525oXq95FOQbNkaSBjlaLIYWyVMlfB
	/ZSglX/X84QgffKY2QHUfRU=
X-Google-Smtp-Source: ACHHUZ7kXv038ojaQs1C6D0CxaqKtlAhukqZYVIzbZoDRFkR9MyYZrEJjwBea6rRQXUPMTnkI0skPw==
X-Received: by 2002:a2e:87cc:0:b0:2a7:b168:9e87 with SMTP id v12-20020a2e87cc000000b002a7b1689e87mr3785507ljj.18.1683880635090;
        Fri, 12 May 2023 01:37:15 -0700 (PDT)
Message-ID: <921898bbda0c125a958c47a667657fc69c22b2c3.camel@gmail.com>
Subject: Re: [PATCH v7 3/5] xen/riscv: align __bss_start
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 12 May 2023 11:37:13 +0300
In-Reply-To: <7ae95b59-3c13-373d-191b-97a80bddfc4f@suse.com>
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
	 <2e9018989c628a519aadeae150786efe5e8054ab.1683824347.git.oleksii.kurochko@gmail.com>
	 <7ae95b59-3c13-373d-191b-97a80bddfc4f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-05-12 at 09:45 +0200, Jan Beulich wrote:
> On 11.05.2023 19:09, Oleksii Kurochko wrote:
> > bss clear cycle requires proper alignment of __bss_start.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two remarks, though:
>=20
> While probably not very important yet for RISC-V (until there is at
> least enough functionality to, say, boot Dom0), you may want to get
> used to add Fixes: tags in cases like this one.
Got it.

>=20
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -137,6 +137,7 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0 __init_end =3D .;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 .bss : {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* BSS */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.stack_aligned)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE)=
;
>=20
> While independent of the change here, this ALIGN() visible in context
> is unnecessary, afaict. ALIGN() generally only makes sense when
> there's a linker-script-defined symbol right afterwards. Taking the
> case here, any contributions to .bss.page_aligned have to specify
> proper alignment themselves anyway (or else they'd be dependent upon
> linking order). Just like there's (correctly) no ALIGN(STACK_SIZE)
> ahead of *(.bss.stack_aligned).
It make sense.

>=20
> The change here might be a good opportunity to drop that ALIGN() at
> the same time. So long as you (and the maintainers) agree, I guess
> the adjustment could easily be made while committing.
I would agree with this. Thanks.

~ Oleksii

