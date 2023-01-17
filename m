Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B766D9F3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:30:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479249.742976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiI4-0002hK-Px; Tue, 17 Jan 2023 09:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479249.742976; Tue, 17 Jan 2023 09:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiI4-0002f6-ND; Tue, 17 Jan 2023 09:30:00 +0000
Received: by outflank-mailman (input) for mailman id 479249;
 Tue, 17 Jan 2023 09:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+bED=5O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHiI3-0002a8-ET
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:29:59 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 825e6b8e-9649-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:29:58 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id q8so9918057wmo.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 01:29:58 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm41115709wms.0.2023.01.17.01.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:29:57 -0800 (PST)
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
X-Inumbo-ID: 825e6b8e-9649-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kYNyBLHaKUvYsczrNggYPfaD2ZzhIu2yZ4HF2d//eqQ=;
        b=clKmXFK4wr5qbGsHOAnY4/8yvSPAMttP1stCMNOol7op2QvOlimODR08lMMWiED3YT
         gCo7bTi6xSvnUPsTbMIEJmqsFD00lN/lBP8wnBi7RL5vdKpVh9Jbmn0PsLeFrNB22wUr
         u9NV+PDWWMRK8PgQw/lr+yqv4xV6ZP8xZndz1ADiV5QJId1sEIauz9CfcMsfj/c5foQ2
         gjEbotyTaVUibz6DSR9OCnfCTlq6mxHlmrydV6kPwkZGy9yNDGDgsvZjZPLRBopyfwZk
         r9QdLrSJDvrSmB6YAw3fILUAP41YdtqO/5dw1VcuckOKg5dt73uxyfBkh9SJQfQhZBlH
         EDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYNyBLHaKUvYsczrNggYPfaD2ZzhIu2yZ4HF2d//eqQ=;
        b=feZ5kwVQaoZmr7wjusPROCz08OpiL/msgKkHFiCG9GfFRPKSJmHCQx4qORwD6HQsPY
         diGLuzBplpbTF02jh9MjC4X2vv61veskEeux+zswbYjOpR12mzaNAH/48nd+cPPbpJ1G
         dCWzg4BE22CjyZ0RhAIRUsqd1DMukzRuVuHIvSvDVDT5ZuHMQEJICctYnhG7oy/eS2jR
         pukYnYu+yWPD5K9cyc4UXIssi/u8DvizzQQrelnQhtgU/vJ+f7rg2j1PPGWfEfqkHVCf
         w6o7/CoLMgrqizuQKDQnRFLkaMPbt/8ZXtvYGFQHswhGAIe6bhDUyfByTUWCVkPwA6qU
         Lu+g==
X-Gm-Message-State: AFqh2krWub4K0XVahkNqLRHq4TZOcMD3r46V5G0DnuF+8d3MRcEU/TBQ
	V2BICxDs1nSMxgK8SoT+kXI=
X-Google-Smtp-Source: AMrXdXuBUu+S4NPYEwO04khGCCn3SycJfiman6nerk/0+jdtbMUmAGWJL4+NuP5q+bZfV0JgrNAZxw==
X-Received: by 2002:a05:600c:540c:b0:3cf:7704:50ce with SMTP id he12-20020a05600c540c00b003cf770450cemr2258433wmb.38.1673947797797;
        Tue, 17 Jan 2023 01:29:57 -0800 (PST)
Message-ID: <87107d8945c9f1513c305d115f24f488b87e088b.camel@gmail.com>
Subject: Re: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 17 Jan 2023 11:29:56 +0200
In-Reply-To: <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
	 <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
	 <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-16 at 15:59 +0100, Jan Beulich wrote:
> On 16.01.2023 15:39, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0=C2=A0=C2=A0 - Clean up types in <asm/types.h> and remain only ne=
cessary.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The following types was removed as they =
are defined in
> > <xen/types.h>:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {__|}{u|s}{8|16|32|64}
>=20
> For one you still typedef u32 and u64. And imo correctly so, until we
> get around to move the definition basic types into xen/types.h. Plus
> I can't see how things build for you: xen/types.h expects __{u,s}<N>
It builds because nothing is used <xen/types.h> now so that's why I
missed them but you are right __{u,s}<N> should be backed.
It looks like {__,}{u,s}{8,16,32} are the same for all available in Xen
architectures so probably can I move them to <xen/types.h> instead of
remain them in <asm/types.h>?
> to be defined in order to then derive {u,}int<N>_t from them.
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/types.h
> > @@ -0,0 +1,43 @@
> > +#ifndef __RISCV_TYPES_H__
> > +#define __RISCV_TYPES_H__
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#if defined(CONFIG_RISCV_32)
> > +typedef unsigned long long u64;
> > +typedef unsigned int u32;
> > +typedef u32 vaddr_t;
> > +#define PRIvaddr PRIx32
> > +typedef u64 paddr_t;
> > +#define INVALID_PADDR (~0ULL)
> > +#define PRIpaddr "016llx"
> > +typedef u32 register_t;
> > +#define PRIregister "x"
> > +#elif defined (CONFIG_RISCV_64)
> > +typedef unsigned long u64;
> > +typedef u64 vaddr_t;
> > +#define PRIvaddr PRIx64
> > +typedef u64 paddr_t;
> > +#define INVALID_PADDR (~0UL)
> > +#define PRIpaddr "016lx"
> > +typedef u64 register_t;
> > +#define PRIregister "lx"
> > +#endif
>=20
> Any chance you could insert blank lines after #if, around #elif, and
> before #endif?
>=20
Sure, I will fix that.
> > +#if defined(__SIZE_TYPE__)
> > +typedef __SIZE_TYPE__ size_t;
> > +#else
> > +typedef unsigned long size_t;
> > +#endif
>=20
> I'd appreciate if this part was dropped by re-basing on top of my
> "include/types: move stddef.h-kind types to common header" [1], to
> avoid that (re-based) patch then needing to drop this from here
> again. I would have committed this already, if osstest wasn't
> completely broken right now.
>=20
I'll take it into account for the next version of the patch series.
> Jan
>=20
> [1]
> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00720.html
> (since you would not be able to find a patch of the quoted title,
> as in the submission I mistakenly referenced stdlib.h)
Thanks for the link.

~Oleksii


