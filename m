Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0627DEEC9
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626796.977369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTwT-00078W-K2; Thu, 02 Nov 2023 09:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626796.977369; Thu, 02 Nov 2023 09:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyTwT-00076n-HN; Thu, 02 Nov 2023 09:24:45 +0000
Received: by outflank-mailman (input) for mailman id 626796;
 Thu, 02 Nov 2023 09:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iPMu=GP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qyTwR-00076h-W1
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:24:44 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a768466d-7961-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 10:24:42 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso10068331fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 02:24:42 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a05651c102d00b002c50c93b053sm427171ljm.61.2023.11.02.02.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:24:41 -0700 (PDT)
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
X-Inumbo-ID: a768466d-7961-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698917082; x=1699521882; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W9T/ZqfnaR0nCts3KfVtAn0njFOcWXaHDJbpOJ1mkoE=;
        b=bV3+FJxO8Tn58u86Ce83uNlYUhGWqkyk6i04qfYMZNL2AZbQkn/TaD06YmS/ATtI3M
         FgMDsLIUkvJgc+xsM9Qk0s0NcGyadecbLBXhvUrcZIQtNOAHRhpOxdpsbXkShmM2Ccb/
         8/0mgYavKJpWZD14MYI1wlkbj1qZtS4yBWtk2u809fRuDZjkRmTIg2M6avmJ/AlfT7mR
         nTD5dpZfmehB42PPUebg1A8NZt86bDal7Li/b7yvppWafgqSvxOufiYyre/224us8P1j
         2pzsQbbQMiMy31QQVfBT2lOElI1BPDdYrRWTI2KtK43fhJjnqNqE5zZElRAJ3ij4WfI+
         bqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698917082; x=1699521882;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9T/ZqfnaR0nCts3KfVtAn0njFOcWXaHDJbpOJ1mkoE=;
        b=iKeU4r1NUhkBjLsDyrZLL3iozEEJnCDhb6krYT6W9eXMRW6YDoOJaiFpFL/XKSB6tV
         Q7j++G9txT5lQIKg20ZlMEAcUrw1xT4/FNY1yYO25JbUTDrTzcsetpJ92s92ILNXYipC
         bSJB/DgX6xbBHuGIGGwDdhEfjmjwEAinsvDJPrj9rcS0amOW5VBiw7ND4zuMWh8gYClJ
         YZgcEfh8AmZhoKAf3727d4rUkFv1SMkCxufMZbsSV2PH65Lh39iPILkcoAE1N2ageXD8
         IDQpz6Fz7+UNXP27D4XWxgH9ryNzyGqTg9nYozd5fLJjiuqk5Tw3kS4s7icmsglaveFM
         A31A==
X-Gm-Message-State: AOJu0YxbfRCceuuWdPBEvYU+n/TlMeM0Kd1inBGz9irucPxp/OQRLrbI
	7LvHL8m71yGaWtxRTvebYR8=
X-Google-Smtp-Source: AGHT+IFu/sZEv35jBngm+ua3TcLyN1ASZAAtw4TXDLc6SB88PHOGYmqi462L5fC6gGR8Sp5awqrRPw==
X-Received: by 2002:a05:651c:2126:b0:2c5:23e3:ed11 with SMTP id a38-20020a05651c212600b002c523e3ed11mr17466766ljq.30.1698917081466;
        Thu, 02 Nov 2023 02:24:41 -0700 (PDT)
Message-ID: <a5ec74d67cfe7413030bc7bd8202fafc49870013.camel@gmail.com>
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 02 Nov 2023 11:24:39 +0200
In-Reply-To: <7642b4d4-c710-d254-b182-4f4540b6c63d@suse.com>
References: 
	<f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
	 <7642b4d4-c710-d254-b182-4f4540b6c63d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-11-02 at 09:39 +0100, Jan Beulich wrote:
> On 01.11.2023 11:15, Oleksii Kurochko wrote:
> > Platforms which doesn't have HAS_PCI enabled it is needed to
> > have <asm/pci.h>, which contains only an empty definition of
> > struct arch_pci_dev ( except ARM, it introduces several
> > ARM-specific functions ).
> >=20
> > Also, for architectures ( such as PPC or RISC-V ) on initial
> > stages of adding support, it is needed to generate <asm/pci.h>
> > for only define the mentioned above arch_pci_dev structure.
> >=20
> > For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
> > HAS_PCI and ARM-specific) will be needed
> > to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
> > <arm/domain.c> <asm/pci.h> was added.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with two remarks:

Thanks for the remarks.

>=20
> > --- a/xen/include/xen/pci.h
> > +++ b/xen/include/xen/pci.h
> > @@ -68,7 +68,18 @@ typedef union {
> > =C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0} pci_sbdf_t;
> > =C2=A0
> > +#ifdef CONFIG_HAS_PCI
> > =C2=A0#include <asm/pci.h>
> > +#else
>=20
> This minimal scope of the #ifdef will do for now, but will likely
> want
> extending down the road. Even what's visible in context is already an
> entity which should be entirely unused in the code base when
> !HAS_PCI.
>=20
> > +struct arch_pci_dev { };
> > +
> > +static always_inline bool is_pci_passthrough_enabled(void)
>=20
> Perhaps s/always_inline/inline/ as this is moved here. We really
> shouldn't
> use always_inline unless actually have a clear purpose.
Could it be fixed during the commit ( in case there won't be any other
critical comments about this patch )?

~ Oleksii

