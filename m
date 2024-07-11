Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B886992E1E9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757167.1165915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRp1J-0002Wj-1K; Thu, 11 Jul 2024 08:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757167.1165915; Thu, 11 Jul 2024 08:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRp1I-0002V4-Uo; Thu, 11 Jul 2024 08:19:16 +0000
Received: by outflank-mailman (input) for mailman id 757167;
 Thu, 11 Jul 2024 08:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRp1H-0002Uy-9s
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:19:15 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c4dc7a-3f5e-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 10:19:13 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52ea79e689eso858988e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:19:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8561fesm232224266b.186.2024.07.11.01.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:19:12 -0700 (PDT)
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
X-Inumbo-ID: 41c4dc7a-3f5e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720685953; x=1721290753; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t5nrfUZ06fTffePFvVjT+/O5T1y3RPLk8Rfrdf810OI=;
        b=lhVJ72VnhmaqBFCwdEmu8YjSz0Ho3I+hiCJIwwxY70ItOGVIzFIRqboLA5uhfPr7Xa
         JBG04NuhYg6ko1D6FzA4M1fu9Q535a0NW8xwOZb0+F2U7Cjg8q/ty5exCHEj7rbL5kiZ
         StpxXfPHA9LNt9x2nFlLmwJ42D7vTOrM0ArV9jFRXBx06MAAbCFtaWU3KG5RqUKyI4yi
         B6DvWh3US+f4alQy8yt6IT7nYCae+B6Wm+wuPit8kG+sgpgCNh0Om2USrS1yHHP/CIJg
         i16tXltlt7bdTIccwo7qzZ7Ud7b8BcZe3KmC04wf+m8kbKyResLTrIMTwJJ0WCaMywQt
         QeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720685953; x=1721290753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5nrfUZ06fTffePFvVjT+/O5T1y3RPLk8Rfrdf810OI=;
        b=H6ZR90HMWX6dCH/Q4nlL2+f+rrcZeWa5J25QRodJEZbfC2slMcAdPrVPVgkfhFTvSC
         ToqfLgA/9T87Ct+1GA4D+JxhvYR84j/7nlzTrickAauN2DacEBE+Ji6EOSr1A8/PGXTi
         fb6WacaFSr8p1ZWvAQhDZgoXNa2aT4cu0xUn5Me3v2dUDiT6p3GrU3K8npZHgSP21Em7
         uCS8f0MsSo/8omSnKyuXbZBmJwKyJT5Ej4KX8bALXo7TrpGQoTVtv+Y4763CrXhPhfrx
         LC6i9/Ud3Q9V4oT9X3z9vVzi1UUuM3ejuZU4rXEgoKXrwq5G+KJ9LClKD/qnhKJZ50Hj
         vFDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9kMRqH2QyOVQVfkq68OCmooK+CNfHPuiuox/VwiN6DHQXExWc7Zivt86lfknxYsFHzhPNCaKyd6nAgXIr/9UPzg3CQA9Wq2IkSLbM6YA=
X-Gm-Message-State: AOJu0Yxz5oW9ZxYOx/NZ5rlXU8k693DHqEh87u7uffwcWFCP7dA6lH4c
	4T0c/FDwOLFgh/NF9+/a9+u3Y7tXL/FOdiDlglk8pIgZi06U4V+v
X-Google-Smtp-Source: AGHT+IGW67v8jMofC/AqabwFRJG2LsaImRhznxHEB8xr4KXCgdIjS68bZe3kP5zlPI5I0yanR1PXbA==
X-Received: by 2002:a05:6512:1247:b0:52e:716a:1898 with SMTP id 2adb3069b0e04-52eb99d5ff5mr6522307e87.58.1720685952834;
        Thu, 11 Jul 2024 01:19:12 -0700 (PDT)
Message-ID: <bce854bb63b07cc9f16509c163c7b90d56dcb2dc.camel@gmail.com>
Subject: Re: [PATCH v9 3/5] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 10:19:11 +0200
In-Reply-To: <35049d21-b08c-4382-8a71-4430c7f209cf@suse.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
	 <83b9053330e4dae38e926c99f47d0ef11d9dd31d.1719918148.git.oleksii.kurochko@gmail.com>
	 <35049d21-b08c-4382-8a71-4430c7f209cf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 11:50 +0200, Jan Beulich wrote:
> On 02.07.2024 13:23, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -12,6 +12,18 @@
> > =C2=A0#include <asm/riscv_encoding.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > +/*
> > + * Initialize the trap handling.
> > + *
> > + * The function is called after MMU is enabled.
> > + */
> > +void trap_init(void)
>=20
> It may be deliberate that this isn't __init, but for the present
> needs it
> certainly could be. This is the kind of thing that imo want saying in
> the
> description (which sadly once again is entirely empty).
I just missed to add __init so I have to added it in the next patch
version.

Thanks for finding that.

~ Oleksii

