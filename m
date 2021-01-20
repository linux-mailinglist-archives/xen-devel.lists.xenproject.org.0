Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3B2FCCFE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 09:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71261.127470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29I5-0004CJ-Sc; Wed, 20 Jan 2021 08:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71261.127470; Wed, 20 Jan 2021 08:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29I5-0004Bs-P3; Wed, 20 Jan 2021 08:56:37 +0000
Received: by outflank-mailman (input) for mailman id 71261;
 Wed, 20 Jan 2021 08:56:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+JE=GX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l29I4-0004Bn-JX
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:56:36 +0000
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faa9334b-11c6-4931-8373-d3179579781f;
 Wed, 20 Jan 2021 08:56:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id j13so520337edp.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 00:56:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z22sm706765edb.88.2021.01.20.00.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:56:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA3201FF7E;
 Wed, 20 Jan 2021 08:56:32 +0000 (GMT)
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
X-Inumbo-ID: faa9334b-11c6-4931-8373-d3179579781f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=O7LZ1CyhGv9nOKRtBKA1vePKRSppKmv7791UCVLHNG8=;
        b=ASK/Eo1SRlZN3h/6VrvtyZWxarariM2Q7jkcPYLjOFbsVdXcvrlqLroGLxuYXMrukK
         sxsi8REZxDqEMj3Wwm9qi7N6jHaj+9vCFx0fjlnm6K0+EoxI5Br9b5MvFfAd9p3rSRmC
         4+bYIffeaFldubq15q3tho7EuA0YSxlhjO4CWYobL6jJgeH+4bNpa+n0kUtpTlZJiXaB
         hVqTmafsCSGOsSqMAe+qV3hpEA4Azf+130Xa423umYl1gRMh4T2LTBdC/tKo9bR1MyOr
         iMH7vVzOvasSZtu9eyzvFGf23tOyktrK7iV0BtyWphEVX4Lp5PZgUgTRRjQ/TrU0fJpX
         2mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=O7LZ1CyhGv9nOKRtBKA1vePKRSppKmv7791UCVLHNG8=;
        b=I6+dqkC7cWi7K43a0pm4ZebxHylNbphc3fV107hXD/Ed0hX/MKOiw/9qwsyI1lweBa
         MOAxEEm9wdenx7cYNzmF0/2qawGRyq75kXuWKsa8Weq2no5soY2LUU39t+epa1En/IhF
         ir5Lc3Wrn0KzzidlGBoNSLQ+PcfePIO2eivbrUGG7jOeCR/6UfXo72arMwsaQjEl3KTt
         FMZ6FA2zQ8j2xhRErcRNIEzKGSoEiYzfgMxIRR2lqSF487lX8ebUkIiHClc3xvos4fBS
         LX++ONP2dR2ObCrJk0+gQiDvXcOYkY75h3JyFJ2tHDhhd0YgS+iJIHpqaLtSMZ0BZlY+
         tMjg==
X-Gm-Message-State: AOAM5300g63FUG4Nex3IuGAm82jgqC9Ng428gfE3rZ7vQ1nxRpLGgtkf
	B4kcyhjBF5wFdtB6zJFBcHjHPw==
X-Google-Smtp-Source: ABdhPJw4TY/ElD16elVTE7kyetDCaV0UYrAU2WK3Vfnja9er6+ksTgX9KgYwTR2n7dMfQA/oAIPVJg==
X-Received: by 2002:a05:6402:306a:: with SMTP id bs10mr6557963edb.209.1611132994640;
        Wed, 20 Jan 2021 00:56:34 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-6-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 05/24] xen/ioreq: Make x86's
 hvm_ioreq_needs_completion() common
Date: Wed, 20 Jan 2021 08:48:09 +0000
In-reply-to: <1610488352-18494-6-git-send-email-olekstysh@gmail.com>
Message-ID: <87v9bst29r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The IOREQ is a common feature now and this helper will be used
> on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.
>
> Although PIO handling on Arm is not introduced with the current series
> (it will be implemented when we add support for vPCI), technically
> the PIOs exist on Arm (however they are accessed the same way as MMIO)
> and it would be better not to diverge now.

I find this description a little confusing. When you say PIO do you mean
using instructions like in/out on the x86? If so then AFAIK it's a
legacy feature of x86 as everything I've come across since just does
MMIO, including PCI.

The code changes look fine to me though:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

