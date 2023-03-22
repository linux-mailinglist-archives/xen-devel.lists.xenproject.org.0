Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B16C4742
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513285.794088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevPY-0003lP-MC; Wed, 22 Mar 2023 10:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513285.794088; Wed, 22 Mar 2023 10:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevPY-0003ib-Ij; Wed, 22 Mar 2023 10:09:40 +0000
Received: by outflank-mailman (input) for mailman id 513285;
 Wed, 22 Mar 2023 10:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pevPX-0003iV-07
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:09:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65fc56e-c899-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 11:09:36 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id o32so4747324wms.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 03:09:36 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c00c200b003edd1c44b57sm11074276wmm.27.2023.03.22.03.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:09:35 -0700 (PDT)
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
X-Inumbo-ID: a65fc56e-c899-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679479776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tHCBMxof4CzVnYYOJZ5PsACoiE3rIhxKUrkqz69Pj9I=;
        b=hvDppK/MI7YxVnBDtgnZTWaEZE5pAmk3UXZTtP9v6Xd5nCHWeYsLhmbZADc4LPg5tW
         npIocyDhdwIn9orwVnI75QmToQMzHGabllc/1qMjcl17G3sPfEucWXhvEYD/z7Aic41O
         wi23wGKTYnU2hwBql01M8SKIrPNi7lKBx5PEba04zaxYasQzZQPnL+aUOsUAxPLayTDa
         D61Z1O7Fov7rGHAgsR1EF7drOo9XF4lzL30TjwcbaY3Pkz3y+P164vlkk7qinESFhQmW
         pyNqmPc26Qylk1vH7wLevpzxi6uB+IAFF5Xx5/ZWw+i9CnwGLopF+K4QjnTLVSgLhUAp
         Sv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679479776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHCBMxof4CzVnYYOJZ5PsACoiE3rIhxKUrkqz69Pj9I=;
        b=gnV9TUPTk2Pi4BBBpi2NGZnq5Rz7iYV8O4SFCMTyNDG5bOjVIBL9DjndRtjL0vHFKP
         pqMmbBGdzo2f7T+WzxhTOy8cC5FdLe3+LIdlxIga+h85SUpB/yzU4+kan0eD8E5hAwpR
         YYMoHdPRqES4pscfGBSVaFL1SclAhyH6CuS8Y5mktCCh1z4i6wHrmVl10lGYWdvchQgI
         MRyGf+JC7r/JDQQEmr/9ktQpHwbrP425dWNQWCZDroQKnhYep2JbFLgQUC/4lRXbr4PL
         wI5bEegl2fesC4C53hkx8EAZ3+TWlMXxkadMTnmmr5HW0cvjdnqGUCfGlsUob01opGaw
         df0Q==
X-Gm-Message-State: AO0yUKWrGO2/SYveWaCrUbx1ZSm8RFj8cjX7dOFcWJmnn8tQRPi2tkPv
	ncZKlbThWiy4LnuwvnUEKyU=
X-Google-Smtp-Source: AK7set8INV/j9DdtUq/fyPrI1L8snnRorgqx+wf/wWKZ3GCpQeLGj5CSf5lEcl2LYOsyFdxxmb1g1A==
X-Received: by 2002:a05:600c:d3:b0:3ee:5519:fae1 with SMTP id u19-20020a05600c00d300b003ee5519fae1mr1634369wmm.12.1679479776027;
        Wed, 22 Mar 2023 03:09:36 -0700 (PDT)
Message-ID: <071f2e0971ea53d37b9b645ebce6d169fcc642ff.camel@gmail.com>
Subject: Re: [PATCH v5 3/7] xen/riscv: introduce dummy <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 12:09:34 +0200
In-Reply-To: <b28bc3fc-c38d-502b-409b-092e7398dd3a@xen.org>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
	 <b28bc3fc-c38d-502b-409b-092e7398dd3a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-21 at 17:21 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > <xen/lib.h> will be used in the patch "xen/riscv: introduce
> > decode_cause() stuff" and requires <asm/bug.h>
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V5:
> > =C2=A0 * the patch was introduced in the current patch series (V5)
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
> > =C2=A0 1 file changed, 10 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/bug.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/bug.h
> > b/xen/arch/riscv/include/asm/bug.h
> > new file mode 100644
> > index 0000000000..e8b1e40823
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2012 Regents of the University of California
> > + * Copyright (C) 2021-2023 Vates
>=20
> I am a bit puzzled with those copyright given the header is empty.
>=20
> But is there any reason this can't be folded in #6 or part of #6
> moved=20
> forward?
Initially it was folded in #6 but in this case a build will be failed
after introduction of #5 as <asm/bug.h> is needed for <xen/lib.h>

Taking into account that <asm/bug.h> is fully re-written after
introduction of generic bug implementation we can remove copyrights
from header fully.

>=20
> > + *
>=20
> NIT: Drop the line.
Thanks. I'll do it in the next patch version.

>=20
> > + */
> > +#ifndef _ASM_RISCV_BUG_H
> > +#define _ASM_RISCV_BUG_H
> > +
> > +#endif /* _ASM_RISCV_BUG_H */
>=20


