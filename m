Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBF914B15
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746576.1153675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjA7-0005DA-3X; Mon, 24 Jun 2024 12:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746576.1153675; Mon, 24 Jun 2024 12:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLjA7-0005BJ-0q; Mon, 24 Jun 2024 12:51:11 +0000
Received: by outflank-mailman (input) for mailman id 746576;
 Mon, 24 Jun 2024 12:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLjA5-0004kK-Fe
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:51:09 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce8bd44-3228-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:51:08 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee83so4398008a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:51:08 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30583e93sm4654164a12.96.2024.06.24.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 05:51:06 -0700 (PDT)
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
X-Inumbo-ID: 6ce8bd44-3228-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719233467; x=1719838267; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Co5VKq2X8eV2JY38N3vHR2oZK+yr/Bk1+kSzxf0TuYo=;
        b=mvhCQlGwA9CuFBlEZXg60mtMb6EQhI2BsleH0uiU84hGMVFlPCvTHRThbM61D8W4fd
         6d3hI6Loot2Cbv5Zd7HiRJ2ffJYWdZKjwiDJiADh8nid3kLmamTuS2gUFgGsMvryUa4+
         XXIsUdrpOwSEOsaEyRyOaJwvh69TftablbmKYpdbcCyBxETg8Ud/sq99WquT1rVW0CLN
         fSOGDWIdE7uJk8SOaKsa4vv/n9BhDAD0dGTk30hNHB2r4VAXKQoB8Q3G/MBembhz6nxj
         yyJBeX7jpnAvv6HndQ5BMBaLDilyRcXLMwpPSNSzXnV6jcFFxxzZVGg/Sn4k7An6mb/n
         bK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719233467; x=1719838267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Co5VKq2X8eV2JY38N3vHR2oZK+yr/Bk1+kSzxf0TuYo=;
        b=X79SFBs+4+HkDlw06iqEUo64jn4gvCLbaBJAd40otqte/E01tG3xKOzu6IWJ9LUJN8
         kTX5nx6Jjh9UFayvlqAyF+K2bt5iSeC0TKxw1z+DiWICQAVZH1bLA40Mypt4r7wA/d0W
         1Gpb/C+npa1eognTgET5RQYIQhRo2Ja3i6SBt5mYIVofZNZizmnXWcXq2ow6Ug+clbT1
         nOjUuplvwLet5I/mKyqYr/B7rGfbOpeK5+wvRGRm25HktAJaLCzRsWePyPWsnPfcCJKE
         sJx5aZthoJZXUuo2xQjkYYQuT/DoQ8wHTGzLIj8mVU5IXu2VhyZe0cVmqzeFEn4lJ/He
         HdYg==
X-Forwarded-Encrypted: i=1; AJvYcCVSXGe9yxc6H99+LmHKU1Ce3HwKJaTx3EqphuMhFHdR7xNtv1ZnVL8QSeP/+qnfc9qVRxCKr1dRZss/inwm8DYMUSic0CjNBtQO4sHtLNw=
X-Gm-Message-State: AOJu0YxD/1uFhwBWkTCUr+hmjsITC+09UJfq78oyuT8HPQeAmLvXZfAM
	1iSdnyxh+M5hRAaqsLHS7wo70ggmVGlTyRIO5xge5DrIpM79I0ke
X-Google-Smtp-Source: AGHT+IFG7SGY8Ec/NL7vG/HPM8X4zeP7SF3ICNHBrufuwsEVvHPjx71PDa6mT2Ot5xz6iGSON2PaIw==
X-Received: by 2002:a50:cdc2:0:b0:57d:701:5350 with SMTP id 4fb4d7f45d1cf-57d45780645mr3221748a12.6.1719233467111;
        Mon, 24 Jun 2024 05:51:07 -0700 (PDT)
Message-ID: <7985d9bc66d5ec254eb1ad07704f9aac598efc4b.camel@gmail.com>
Subject: Re: [PATCH 1/3] xen/riscv: Drop legacy __ro_after_init definition
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2024 14:51:06 +0200
In-Reply-To: <a15da9eb-f93f-4a01-8822-21452b762f53@suse.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
	 <20240621201928.319293-2-andrew.cooper3@citrix.com>
	 <d8b2b01e608c6ddedbb2b46f58e8bd46ecfd5ca9.camel@gmail.com>
	 <a15da9eb-f93f-4a01-8822-21452b762f53@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 10:04 +0200, Jan Beulich wrote:
> On 24.06.2024 10:02, Oleksii wrote:
> > On Fri, 2024-06-21 at 21:19 +0100, Andrew Cooper wrote:
> > > Hide the legacy __ro_after_init definition in xen/cache.h for
> > > RISC-V,
> > > to avoid
> > > its use creeping in.=C2=A0 Only mm.c needs adjusting as a consequence
> > >=20
> > > No functional change.
> > >=20
> > > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > ---
> > > CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> > > CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > CC: George Dunlap <George.Dunlap@citrix.com>
> > > CC: Jan Beulich <JBeulich@suse.com>
> > > CC: Stefano Stabellini <sstabellini@kernel.org>
> > > CC: Julien Grall <julien@xen.org>
> > >=20
> > > https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342686=
294
> > > ---
> > > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0xen/include/xen/cache.h | 2 ++
> > > =C2=A02 files changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > > index 053f043a3d2a..3ebaf6da01cc 100644
> > > --- a/xen/arch/riscv/mm.c
> > > +++ b/xen/arch/riscv/mm.c
> > > @@ -1,11 +1,11 @@
> > > =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> > > =C2=A0
> > > -#include <xen/cache.h>
> > > =C2=A0#include <xen/compiler.h>
> > > =C2=A0#include <xen/init.h>
> > > =C2=A0#include <xen/kernel.h>
> > > =C2=A0#include <xen/macros.h>
> > > =C2=A0#include <xen/pfn.h>
> > > +#include <xen/sections.h>
> > > =C2=A0
> > > =C2=A0#include <asm/early_printk.h>
> > > =C2=A0#include <asm/csr.h>
> > > diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> > > index 55456823c543..82a3ba38e3e7 100644
> > > --- a/xen/include/xen/cache.h
> > > +++ b/xen/include/xen/cache.h
> > > @@ -15,7 +15,9 @@
> > > =C2=A0#define __cacheline_aligned
> > > __attribute__((__aligned__(SMP_CACHE_BYTES)))
> > > =C2=A0#endif
> > > =C2=A0
> > > +#if defined(CONFIG_ARM) || defined(CONFIG_X86) ||
> > > defined(CONFIG_PPC64)
> > > =C2=A0/* TODO: Phase out the use of this via cache.h */
> > > =C2=A0#define __ro_after_init __section(".data.ro_after_init")
> > > +#endif
> > Why "defined(CONFIG_RISCV_64)" is missed?
>=20
> The TODO is being addressed by this patch for RISC-V. See how a
> subsequent
> patch also drops CONFIG_PPC64.
Thanks for the explanation. Now it makes sense to me.

~ Oleksii

