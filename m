Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5D85A630
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682936.1062203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4oU-0001x8-KH; Mon, 19 Feb 2024 14:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682936.1062203; Mon, 19 Feb 2024 14:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4oU-0001uv-GY; Mon, 19 Feb 2024 14:40:10 +0000
Received: by outflank-mailman (input) for mailman id 682936;
 Mon, 19 Feb 2024 14:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc4oT-0000og-Ro
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:40:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72613e8-cf34-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 15:40:08 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3cc2f9621aso456498466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:40:08 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a170906704c00b00a3d932d8fa7sm3024217ejj.183.2024.02.19.06.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:40:07 -0800 (PST)
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
X-Inumbo-ID: c72613e8-cf34-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708353608; x=1708958408; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f9zwNMGKSNSAwnTlgSx/X1Qxc/SU9hgGoqtSMEumcRw=;
        b=SctYV4akprnNyIEjktktNOsogkjtGUm6mfYucMqSkarxOFAtyPZ23hEqqboQdtn0Bp
         uwyTjhFouoNHzW1hlDSqEZxsalf0IE3MenBve2gnxXWwXrTapa2SCJV7HjgfmSpZIE9h
         LfiqxQ0NvMmI/JwWQajT5dwcTL/Yr2H2B9YdyEDeShg7DvwC4ADUzbjRnTNRWemeJnzC
         ODI5+DyLZy/mkedErmE3eCrYv3fdcIWUNX6SvCTfnEejnmTBcwtAKCC8Pl45Faw082tv
         nD3E//sBncJ31YTGVnQDqtjo9eB7RGFtQlXANVppAzY7iu2L75Gs4lSrWu810dp5lwi/
         kCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353608; x=1708958408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9zwNMGKSNSAwnTlgSx/X1Qxc/SU9hgGoqtSMEumcRw=;
        b=gN3xl2J6VNM5tGCYbELI8ErWLgiDNPzBdZkUHHfU6dWEgNJt29i8LQ97uVTkdKbsYs
         r/IVqplX0IxC/b9pJk4XnrmciA66XNP6OFatzFgdbERsvyErsOlvsiEac6rcqytUs1Yv
         /B+2ztQTpZDc4fNjV1yIrbrtfHiTOZJ/diZ0ksduWmmiJS4xBbowBp/0l1Wqgy5K8pKR
         fjOChfWTKOD7YlEX5lIvlmFyztZHf5q65UG+MWgOClZ00He6Zoh4NNxE0trhF21vD4dx
         PatOXt6zYgB1R1BLAAxKKsKW2VG49TYwAP4Rkwspdk84CNn1qeBVIbspwrNcWUhimFTV
         XzNg==
X-Forwarded-Encrypted: i=1; AJvYcCW4pibPvzvL9xHm43Y/Z3iS+odlQkmHpBzPxOA9C8/6Eh+w9SG+AoJw0Tz5GLOUoCShyuB90fsN/L9Ni7Koti87Uy3BSNGtNWpPnewQfLI=
X-Gm-Message-State: AOJu0YwCgIBWW5GmwmZGa3WamqeCxBCE0ZGbl+/Eg47RURD6FdskVWYE
	cjv2atoYFdQvhZkEDV5gfTYIwqajobgbJ9aQM4iReJQnw59KnfwE
X-Google-Smtp-Source: AGHT+IFHKWkyJZvt8hl8NblYrUGBOj9S7t78T+2+N32yeVHov0fCHGf3N3T291+ocGQ5SJomwFzwSA==
X-Received: by 2002:a17:906:b753:b0:a3e:c2aa:ceb6 with SMTP id fx19-20020a170906b75300b00a3ec2aaceb6mr1224212ejb.32.1708353607575;
        Mon, 19 Feb 2024 06:40:07 -0800 (PST)
Message-ID: <4a8f923188279747387baf1002be5ba9726969d1.camel@gmail.com>
Subject: Re: [PATCH v4 17/30] xen/riscv: introduce regs.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Mon, 19 Feb 2024 15:40:06 +0100
In-Reply-To: <ea8d10ef-39cd-49a2-a445-6705b87d50b3@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <13cfdfa01b303d2597124f09c0ec0734859b697d.1707146506.git.oleksii.kurochko@gmail.com>
	 <ea8d10ef-39cd-49a2-a445-6705b87d50b3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-02-18 at 18:22 +0000, Julien Grall wrote:
> Hi,
>=20
> On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ------
> > Changes in V4:
> > =C2=A0 - add Acked-by: Jan Beulich <jbeulich@suse.com>
> > =C2=A0 - s/BUG()/BUG_ON("unimplemented")
> > ---
> > Changes in V3:
> > =C2=A0 - update the commit message
> > =C2=A0 - add Acked-by: Jan Beulich <jbeulich@suse.com>
> > =C2=A0 - remove "include <asm/current.h>" and use a forward declaration
> > instead.
> > ---
> > Changes in V2:
> > =C2=A0 - change xen/lib.h to xen/bug.h
> > =C2=A0 - remove unnecessary empty line
> > ---
> > xen/arch/riscv/include/asm/regs.h | 29
> > +++++++++++++++++++++++++++++
> > =C2=A0 1 file changed, 29 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/regs.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/regs.h
> > b/xen/arch/riscv/include/asm/regs.h
> > new file mode 100644
> > index 0000000000..c70ea2aa0c
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/regs.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ARM_RISCV_REGS_H__
> > +#define __ARM_RISCV_REGS_H__
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <xen/bug.h>
> > +
> > +#define hyp_mode(r)=C2=A0=C2=A0=C2=A0=C2=A0 (0)
>=20
> I don't understand where here you return 0 (which should really be=20
> false) but ...
>=20
> > +
> > +struct cpu_user_regs;
> > +
> > +static inline bool guest_mode(const struct cpu_user_regs *r)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +}
>=20
> ... here you return BUG_ON(). But I couldn't find any user of both=20
> guest_mode() and hyp_mode(). So isn't it a bit prematurate to
> introduce=20
> the helpers?

I agree regarding hyp_mode() it can be dropped , but gest_mode() is
used by common/keyhandler.c:142.

~ Oleksii

