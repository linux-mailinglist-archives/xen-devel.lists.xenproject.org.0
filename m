Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5881B2C3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 10:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658730.1028049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFZa-00083R-JP; Thu, 21 Dec 2023 09:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658730.1028049; Thu, 21 Dec 2023 09:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFZa-00081J-Gb; Thu, 21 Dec 2023 09:42:34 +0000
Received: by outflank-mailman (input) for mailman id 658730;
 Thu, 21 Dec 2023 09:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywj9=IA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGFZZ-000800-6G
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 09:42:33 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c55da7-9fe5-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 10:42:31 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e3c6f1c10so795151e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 01:42:31 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u5-20020ac25185000000b0050d438f0a09sm221057lfi.256.2023.12.21.01.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 01:42:29 -0800 (PST)
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
X-Inumbo-ID: 42c55da7-9fe5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703151751; x=1703756551; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnD7DRVsvCfnbIpgFymmyiUUeWm8PbgiSCMTawUhusA=;
        b=Sf4t/FkbfCLm/Fm9ad/YorMBsv5pCxPxDGkgyKS/ykYUCnf0ENQrko/9ocZyj+Lg+C
         YnYGr5Foos0sYX5oiOzhp3POqpFssMhWnso20dMxTaxApjUoSwrafuQgnU4SMTYBuXM3
         LfkXOTxDCyWE/ZOeB6jyPbvtuRWaXnSwLsoeG5hZIFi5LIYrgWTapN9KzIz3MhiXOZlL
         cgtpnr3IdNGan/YS9oDO6qU5OV6gUXBnwk/va0rb2dKR2YW7grLHswqSwOSI+LI+VK9c
         MXx8shRsL4P0QJZpwvfihdNYfgmyCNpu2AcFcLMyFayrrtW127LsNZo7lJV4NQ/NROAX
         BbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703151751; x=1703756551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnD7DRVsvCfnbIpgFymmyiUUeWm8PbgiSCMTawUhusA=;
        b=M3nex2jBnj9iMfLCc0aj0qwWqmY8iOrB9qkuhRdzUi78GGz3+ZlCENnqI+j5M+FYl5
         cqypuBAGPRcjb+EGS9sy3IHpLrLDmwE7Gi1qW3/8NnBp9PeBk2fBJ7Xa8n+0w4Vwy8Gm
         rGYfjgZkZ0SoSG+zid2+kVOdOkzCInNLzTzyz7+KRgd0hR6BxcTSfUwd2EJfz9fgdpMZ
         fAIFjRb4kDgHfrBlIewZHb/Gno+CbyxehKwwK4W2x/8hGyBmP0msAPfFzwZxj2esll1L
         0CDvNvntebZ2Ae8/kEVHlvIVroDAOu7nAUiUeuyQYm7I+OKBfB0QvLm1USJ/krtUdAIE
         e8hQ==
X-Gm-Message-State: AOJu0YwR0i2v7HvxKLg+YjqxkmZXzSQ/rbug2H+LCFi08tLekXWaUujL
	ekPSUR9qjpRgFoBxcmj3aJQ=
X-Google-Smtp-Source: AGHT+IGLXGrphCDlWXByCcOTKtFLcRABEUJbMQ5BV/qVKln4dpqg9BjXt9CuABM3EyjLWkQElmfZ+Q==
X-Received: by 2002:ac2:428a:0:b0:50e:3774:9db6 with SMTP id m10-20020ac2428a000000b0050e37749db6mr1635470lfh.196.1703151750430;
        Thu, 21 Dec 2023 01:42:30 -0800 (PST)
Message-ID: <f9a2967197f809c64f32c1140f249de791055aad.camel@gmail.com>
Subject: Re: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Date: Thu, 21 Dec 2023 11:42:28 +0200
In-Reply-To: <5a896d14-d96e-424a-a2a9-f0fc92b3cbde@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
	 <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
	 <f890996c2b100c6ace1f853da2c293d2f9244ef9.camel@gmail.com>
	 <5a896d14-d96e-424a-a2a9-f0fc92b3cbde@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-21 at 08:58 +0100, Jan Beulich wrote:
> On 20.12.2023 21:05, Oleksii wrote:
> > On Tue, 2023-12-05 at 16:59 +0100, Jan Beulich wrote:
> > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/public/arch-riscv/hvm/save.h
> > > > @@ -0,0 +1,20 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Structure definitions for HVM state that is held by Xen and
> > > > must
> > > > + * be saved along with the domain's memory and device-model
> > > > state.
> > > > + */
> > > > +
> > > > +#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> > > > +#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> > > > +
> > > > +#endif
> > > > +
> > > > +/*
> > > > + * Local variables:
> > > > + * mode: C
> > > > + * c-file-style: "BSD"
> > > > + * c-basic-offset: 4
> > > > + * tab-width: 4
> > > > + * indent-tabs-mode: nil
> > > > + * End:
> > > > + */
> > >=20
> > > Seeing that Arm's is as empty, I wonder why we have it. Julien,
> > > Stefano?
>=20
> I'm still curious about the reason here, but ...
>=20
> > It seems to exist to satisfy the 'install-tools-public-headers'
> > target:
> > install: cannot stat 'xen/arch-arm/hvm/*.h': No such file or
> > directory
> > Makefile:58: recipe for target 'install' failed
> > make[1]: *** [install] Error 1
> > make[1]: Leaving directory '/builds/xen-
> > project/people/olkur/xen/tools/include'
> > Makefile:44: recipe for target 'install-tools-public-headers'
> > failed
> >=20
> > From tools/include/Makefile:
> > install: all
> > ...
> > $(DESTDIR)$(includedir)/xen/arch-arm
> > 	$(INSTALL_DATA) xen/arch-arm/hvm/*.h
> > $(DESTDIR)$(includedir)/xen/arch-arm/hvm
> > ...
> >=20
> > We have the following options:
> > 1. Remove the line with $(INSTALL_DATA) xen/arch-arm/hvm/*.h (only
> > save.h is now in this folder, which is empty).
>=20
> ... we can't easily remove any existing public header. We can only
> try to
> avoid making the same mistake (even if it's just a minor one) again.
>=20
> > 2. Don't touch the Arm part, but for PPC and RISC-V, do the
> > following:
> > #if defined(__i386__) || defined(__x86_64__)
> > #include "../arch-x86/hvm/save.h"
> > #elif defined(__arm__) || defined(__aarch64__)
> > #include "../arch-arm/hvm/save.h"
> > +#elif defined(__powerpc64__) || defined(__riscv)
> > +/* no specific header to include */
> > #else
> > #error "unsupported architecture"
> > #endif
>=20
> Yes. Still awaiting Shawn's input here as well, though.
Perhaps you missed the email from Shawn:
https://lore.kernel.org/xen-devel/c2f3280e-2208-496b-a0b5-fda1a2076b3a@rapt=
orengineering.com/

>=20
> > 3. Provide an asm-generic version of save.h for Arm, PPC, and RISC-
> > V
> > and use it in public/save.h.
>=20
> That's not an option imo - what's under public/ needs to be self-
> contained.
> Stuff there isn't supposed to even know of asm-generic/.
In this case, this is not an option.

~ Oleksii

