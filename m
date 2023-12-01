Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D35800A79
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 13:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645507.1007709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r92JU-00026H-DF; Fri, 01 Dec 2023 12:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645507.1007709; Fri, 01 Dec 2023 12:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r92JU-00023V-Ab; Fri, 01 Dec 2023 12:08:08 +0000
Received: by outflank-mailman (input) for mailman id 645507;
 Fri, 01 Dec 2023 12:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r92JS-00023N-Ls
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 12:08:06 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47f20763-9042-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 13:08:04 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9d0d327d6so20183421fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 04:08:04 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfedcc000000b003333471d94esm425266wro.90.2023.12.01.04.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 04:08:03 -0800 (PST)
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
X-Inumbo-ID: 47f20763-9042-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701432484; x=1702037284; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=govxK1Pg15E792ruahwHUbGAUqY2MLCpOPz7wOxElKM=;
        b=lzGwli7YuVAcDbxru0JRUi75KMmShjeRp62/9hQTYI6blGvWPNPCzy9jaKtnYB9uDe
         ma5kpaDsp2r2Wgko3TdcqLDwXxiYzYvQEGDhC/1aS1snjejQXQt1qaAHIwuQYTciICI1
         0dJk0k2AoIQ9u35e8ix3yBbsMPW+6U3MapDG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432484; x=1702037284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=govxK1Pg15E792ruahwHUbGAUqY2MLCpOPz7wOxElKM=;
        b=LemlSVgAx7w8sl6iGIPjFnDEP0sXkYxfm7tSXAdMejTRtC5qXJ2l3f8jpWVsmRPtS9
         9fgiqzpqvJHiVthVi5D+MSKgVzCKoc18TO+hUzuFmRfBnmUpa01K9damWrVjnC7v4F0e
         Fc2hxu+Dy2BDJRanXLr0uOxhN5EqIBWsdR0GaaaytzvaXmkvDkSgazXB9TWRMp/8byIX
         RjhbRzFZstaaw/HMep0JFFJ0LE1se6Pa/JHx1//Wcc52WhTfuqMVng8EGP723wIICR4K
         WnpSUaxzgEMiqnbsbb85kccx7Zj9MBosHeUh7QRqXVuZXtO7zRrCBMcRSmJs2J2dV/Tk
         XyhA==
X-Gm-Message-State: AOJu0YwHf7BYKC9rq2Ezu8MDcy9+OkS2l70qsuq6Q814XfF6imLeSr6G
	fAtRY1G7m92slVwZ/ZZwx8WP+Q==
X-Google-Smtp-Source: AGHT+IEx5GRIA6pViF7QIMET71iEvnmgYLRni0RjHFmCl2oi23fSv69DR+6FUBRssRRgiYjYZjn8mw==
X-Received: by 2002:a05:6512:3b99:b0:50b:d764:8818 with SMTP id g25-20020a0565123b9900b0050bd7648818mr912454lfv.100.1701432484054;
        Fri, 01 Dec 2023 04:08:04 -0800 (PST)
Date: Fri, 1 Dec 2023 13:08:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] xen/x86: introduce self modifying code test
Message-ID: <ZWnMom8D8F4nEZFp@macbook>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-4-roger.pau@citrix.com>
 <3ac223d0-75a1-40b0-8bf9-1c556703c07d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ac223d0-75a1-40b0-8bf9-1c556703c07d@suse.com>

On Thu, Nov 30, 2023 at 06:02:55PM +0100, Jan Beulich wrote:
> On 28.11.2023 11:03, Roger Pau Monne wrote:
> > --- /dev/null
> > +++ b/xen/arch/x86/test-smc.c
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <xen/errno.h>
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cpufeature.h>
> > +#include <asm/test-smc.h>
> > +
> > +static bool cf_check test_insn_replacement(void)
> > +{
> > +#define EXPECTED_VALUE 2
> > +    unsigned int r = ~EXPECTED_VALUE;
> 
> The compiler is permitted to elide the initializer unless ...
> 
> > +    alternative_io("", "mov $" STR(EXPECTED_VALUE) ", %0",
> > +                   X86_FEATURE_ALWAYS, "=r"(r));
> 
> ... you use "+r" here.

I see, '=' assumes the operand is always written to, which is not the
case if alternative is not applied.

> Also (nit) there's a blank missing between that
> string and the opening parethesis. Also what's wrong with passing
> EXPECTED_VALUE in as an "i" constraint input operand?

Me not knowing enough inline assembly I think, that's what's wrong.

> > @@ -1261,6 +1269,7 @@ struct xen_sysctl {
> >          struct xen_sysctl_livepatch_op      livepatch;
> >  #if defined(__i386__) || defined(__x86_64__)
> >          struct xen_sysctl_cpu_policy        cpu_policy;
> > +        struct xen_sysctl_test_smc          smc;
> 
> Imo the field name would better be test_smc (leaving aside Stefano's comment).

Right, will see what Stefano thinks about using test_smoc.

Thanks, Roger.

