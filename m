Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B872EA13
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548358.856279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q981i-00022v-LJ; Tue, 13 Jun 2023 17:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548358.856279; Tue, 13 Jun 2023 17:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q981i-000214-I0; Tue, 13 Jun 2023 17:41:54 +0000
Received: by outflank-mailman (input) for mailman id 548358;
 Tue, 13 Jun 2023 17:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szI4=CB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q981h-00020y-7E
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:41:53 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 943c1717-0a11-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 19:41:51 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f620583bc2so7213249e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 10:41:51 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a056512051a00b004f73e290025sm1133815lfb.210.2023.06.13.10.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:41:50 -0700 (PDT)
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
X-Inumbo-ID: 943c1717-0a11-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686678111; x=1689270111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SaY9juWO6GETL6AiqtS3unBSDymp971SO5UAf/ZzS8c=;
        b=kVQxyAYivd/kKo814LKpYlAv7tX8CL0qF12bnWJ41nPXLDsQJVt9fY4+3DhvWjT3Up
         fIo7ugwCPtkUL3C6OWiFaYBSIa2jy9pAzMXvEnsy9Fep+0qry3xC6qh6rEL0kuG7Km0A
         dVxg5UrY/rzKhdA7u/DiaIXLD+BJai3eDufUS2tTNSGuE4GoEeCEv4QupfZD1k5zqzbU
         /k8ok/3E+wBVB00qsmVlhPebEk7pqDPVnAh4s8iBwT92aml3lnnORgp1bkwqUTvkLysm
         50N1oX4AnpzF+hO5IRaxMncaN4fs4lzAiXRy36zpWfhPs9os4aoZRTp/3hD43Wv5KLLC
         XXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678111; x=1689270111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaY9juWO6GETL6AiqtS3unBSDymp971SO5UAf/ZzS8c=;
        b=j8+NohJRj11hsGTnbs/gK5l61qbbyEG+qf+oE7nZiApZegTx8OeaYQ77LY1v4uxo4W
         vM5BhEv/ZvzCuHAIsCoPD+1DHJ90c7Fbe7nGx949eolNGydltPymtvLk+l6penNCStiS
         W0QgXRVcFJX1nuUEwM4lP/iZY/TBgcKj6Tno9k61Wa4glspk+0lGpM/UQeAbdDV5WG17
         jdNduazC/wC9rK4PYCfhh7nQ2zLvUtqYD2aL9BPTDF3gLUHXDhbwBWtOXqRcwwtel68V
         5JSmS7KEp5cTWBP22gxYYxE+OPXiMtAxzvABmapg4VOGpmCFwm44p+p7r8P0OiaL6St4
         G0LA==
X-Gm-Message-State: AC+VfDxEpNYEOFV+DWnSvRc3VkVUUWZcnh/qaQWZLo8Jgy4z3FGnghvz
	9lBgDJUHENug26moyofgS5k=
X-Google-Smtp-Source: ACHHUZ7GlJ/FseqWybvuSK95sSFAtqunozyPLgpQ4OXfOMv1mwwTYrp33KYYbEINcNJoprcorSwVWg==
X-Received: by 2002:a19:3850:0:b0:4f1:4468:ee65 with SMTP id d16-20020a193850000000b004f14468ee65mr7430182lfj.30.1686678110587;
        Tue, 13 Jun 2023 10:41:50 -0700 (PDT)
Message-ID: <2f834b7b832c140a2b3666b054d51c991aab1905.camel@gmail.com>
Subject: Re: [PATCH v1 2/8] xen/riscv: add .sbss section to .bss
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 13 Jun 2023 20:41:48 +0300
In-Reply-To: <d51d7a7d-9395-8301-2f3e-b6b43a797788@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
	 <d51d7a7d-9395-8301-2f3e-b6b43a797788@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 09:04 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > Sometimes variables are located in .sbss section but it won't
> > be mapped after MMU will be enabled.
> > To avoid MMU failures .sbss should be mapped
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/xen.lds.S | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > index 74afbaab9b..9a2799bab5 100644
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -151,7 +151,7 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.percpu.read_mos=
tly)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(SMP_CACHE_=
BYTES);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_data_end =3D=
 .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.*)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.* .sbss)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_AL=
IGN);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0 } :text
>=20
> Two remarks, despite Alistair's ack: Wouldn't it be better to add
> .sbss.*
> right away as well? And strictly speaking wouldn't it be more logical
> to
> have .sbss ahead of .bss?
It makes sense. I'll take it into account in the following patch
series.
Thanks.
>=20
> Jan


