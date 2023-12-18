Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07312816A8B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655775.1023540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAY2-0000Ul-1w; Mon, 18 Dec 2023 10:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655775.1023540; Mon, 18 Dec 2023 10:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAY1-0000SE-VW; Mon, 18 Dec 2023 10:08:29 +0000
Received: by outflank-mailman (input) for mailman id 655775;
 Mon, 18 Dec 2023 10:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFAY1-0000S6-C1
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:08:29 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d4a33f-9d8d-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:08:28 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cc6a52231cso10435461fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:08:28 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ac25609000000b0050e2cc84f26sm543985lfd.181.2023.12.18.02.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:08:27 -0800 (PST)
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
X-Inumbo-ID: 63d4a33f-9d8d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894108; x=1703498908; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ozxgz9sevBrE1t3w1Q3/tH5P7QLXuImQgZ3W8/TQWI=;
        b=MsOViVRlsp3grl6gMPi2f3g2EqZVh92Zjl3q2KsHarNjWd03Ks5fJA3lmB9oT6Rt2/
         aCHYpsnMfPVPVzln+Q+o+bzSeIHF2jgomfOxcHrYaK/gnpMg7gR0vjgJwiEA7oPtlO1P
         jBEGCtbAI2c/9ioGZfUjC/ptsnOsIYy6moctwZ9XF6HUDFEbcnXDtGWvQI9Cmcd+z5y/
         k9oy9BRmhHYA9WSnZYtbEfpm9pKiYRbBK90gn+KRqF3dOT/uC6qdEwxFS1tqLJ1+vThz
         u5GMOp3bXjOere75VU/MhMAwlCJ8GfWRnxnSm18DBIcK6stg3rSpEiFvncCKIDiwC92T
         O4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894108; x=1703498908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ozxgz9sevBrE1t3w1Q3/tH5P7QLXuImQgZ3W8/TQWI=;
        b=F/hecxLrkBl5fW8XXCnmBdpHsmCEhRwJwQf3R61ge8LBUbRF6WmOSjQQVJ2T7rgNyi
         o8sk3a9mM1yG35S7RSYb75axoycJqLNmw98eRj0oVIxI7OEahhPlpG9CH63fTvjBhR1Q
         1MmIf1r5Nw0CMNPUhhZtoHCuRmzC/cJbZ0fag7j+BkGZIfX51nXtSoC7hLOM4pLGg3t3
         1hBajUljxBmtbFy4p0FCorfG4INiFTKnD8PHS6E0ZbrChrKxAezfqw2Zcg/CML8FCixQ
         UtO4dAvkNsnjQWkpN34mmcg2TpOBQsenXZ/C07010PxgOm1hjcP5hOKFF0p0gxYjmxML
         5JwQ==
X-Gm-Message-State: AOJu0Yz3A4O0a09I1jAi18Uva6AANKoxuvbgGCCZCNSlWyGTFxbJYh8C
	mdIKs5yifxHA2Yqb/WTxihM=
X-Google-Smtp-Source: AGHT+IFELFBJS6VoIuie7rRnjJ5HfquHk4jeRIqZLDyjEEJK8q+q/DNc2aN8RFJgcLdoGn+OW5RfXw==
X-Received: by 2002:a05:6512:2385:b0:50e:2eb0:3c2a with SMTP id c5-20020a056512238500b0050e2eb03c2amr1587102lfv.131.1702894108128;
        Mon, 18 Dec 2023 02:08:28 -0800 (PST)
Message-ID: <50ab6b74c08034c876bf5c1bd5b73528c2021090.camel@gmail.com>
Subject: Re: [PATCH v2 26/39] xen/riscv: introduce asm/regs.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:08:27 +0200
In-Reply-To: <8802a6d5-ac99-4276-a9d4-3443f5f20358@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <073c9a03abe429c1e45f6f66b648a25aff87e9f3.1700761381.git.oleksii.kurochko@gmail.com>
	 <8802a6d5-ac99-4276-a9d4-3443f5f20358@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:05 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/regs.h
> > @@ -0,0 +1,26 @@
> > +#ifndef __ARM_RISCV_REGS_H__
> > +#define __ARM_RISCV_REGS_H__
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <xen/bug.h>
> > +#include <asm/current.h>
>=20
> Does one of these bring in asm/processor.h, for ...
>=20
> > +#define hyp_mode(r)=C2=A0=C2=A0=C2=A0=C2=A0 (0)
> > +
> > +static inline bool guest_mode(const struct cpu_user_regs *r)
>=20
> ... struct cpu_user_regs to be available? Else a forward declaration
> would be needed here.
Agreed. It will be better to use a forward declaration. I'll change
that in next patch series.

>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks.

~ Oleksii

