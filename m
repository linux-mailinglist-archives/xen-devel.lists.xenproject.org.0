Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB645F6EE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 23:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233547.405247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqjtA-0000yI-35; Fri, 26 Nov 2021 22:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233547.405247; Fri, 26 Nov 2021 22:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqjt9-0000wN-VQ; Fri, 26 Nov 2021 22:40:15 +0000
Received: by outflank-mailman (input) for mailman id 233547;
 Fri, 26 Nov 2021 22:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWll=QN=linaro.org=mathieu.poirier@srs-se1.protection.inumbo.net>)
 id 1mqjt8-0000wH-1k
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 22:40:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0cf616b-4f09-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 23:40:12 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id g14so44299895edb.8
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 14:40:11 -0800 (PST)
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
X-Inumbo-ID: d0cf616b-4f09-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+Bqc907eV3hmADcc+S+rK2ap4qbqE0tPBtR2bxjnuI=;
        b=yDoUB5a7QGV8bTnsVLNgeGtCOtU8y4FAK8S4ui9UR9zl3VsWEDbnyYurj3vOSvBMaC
         Or+4OGpLZHCpBnTy6nDxGDQeOR3kbKtQSx7XqFqzJB9YBJROYIVggCmWpLiN2kGlD20j
         o119/aXszm2taMaEB+Sr15Yz83qoxYBCBAI4ha/4JaaBX8ZEZnTAsHSzNGucPQsaLmuI
         O+J11AV2ujKTshk+NutkAUyxlp19IJPIdJ3Q/Eek5pPQj5Hz6/L+ffWcs/K9Ng/71s52
         gGaYl5wtHv18ZGvA8W61/B4u/lCDGjIdGtJJHJvZKXXeO9Qf98nqJJBalxtaVuD0cRyJ
         8c7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+Bqc907eV3hmADcc+S+rK2ap4qbqE0tPBtR2bxjnuI=;
        b=DwUthxQxRdxK7+eTuOnBQCcfQMT4AVifrmQ8uq0uKABqaplw/tFtNCRDics9giWugg
         7vLUl7jhZAlv3oNCxetmfFkKAAAEDzvOz93KI66pIvXn8KUdfvDGqTlxkzm++DvJUV8R
         Db4EuJ0IhvMJKSFGu0SkFpsFqJRzs4cLBowe25ZBW90BY7ogmDJhGq2X2UjiDgV0n5k/
         xu4uXKgb6LbEJ7lYRhm3x91bX/eX2qhIOaQ3K76EYG/1Bekfo0FljckA9CCQ0+nZV4E1
         5B2YJWvdOYflQDU5LkYIL58iR6gtEC3r63G1B1Z4U1QHX13NtxH2oLdIkzdGsMVuPGXA
         alAQ==
X-Gm-Message-State: AOAM532h3MWUrnA9yh0+Q9Sr91BK5aP3Nq2Yf1BKOD0G6pGfNh0UYlPB
	Mn8gIvv1jqPDwlGRrYkowE3DjpiuZK/iwO2dM5r/97QZt1ishQ==
X-Google-Smtp-Source: ABdhPJwCCWf7Kp3hOUq+KKWhlo4ziQvsTBlot2vvIHxv4iuJ1zG6t6ymKaRRhxhypjQyfDvu/86KFeos8ReiSuLsAt4=
X-Received: by 2002:a05:6402:1e95:: with SMTP id f21mr49918721edf.139.1637966408403;
 Fri, 26 Nov 2021 14:40:08 -0800 (PST)
MIME-Version: 1.0
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
In-Reply-To: <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 26 Nov 2021 15:39:56 -0700
Message-ID: <CANLsYkwpPn-TNEq9aJv35OWK2bUPifvde7XQc1otr4u6QANUkQ@mail.gmail.com>
Subject: Re: Aarch64 stand-alone application for Xen
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>
> Hi Mathieu,
>
> > On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > I am in the process of adding support for aarch64 to the xen-sys
> > crate[1].  The crate currently supports x86_64 and includes a
> > stand-alone "oxerun" application that can be used to validate
> > hypercalls.  My goal is to provide the same functionality on arm64.  I
> > am looking for a stand-alone aarch64 example, something like an "hello
> > world" to help me with the assembler startup code.
>
> We are working on porting XTF to arm64 and already have something running.
> I think it could be a good starting point for you:
> https://github.com/orzelmichal/xtf/tree/arm-devel
>

I just ran the "test-arm-mmu64le-example" and things work as
advertised - this is really nice!  I will have to see how this thing
is put together but the outcome is exactly what I was looking for.

You're awesome - thanks,
Mathieu

> Regards
> Bertrand
>
> >
> > Many thanks for the consideration,
> > Mathieu
> >
> > [1]. https://crates.io/crates/xen-sys
> >
>

