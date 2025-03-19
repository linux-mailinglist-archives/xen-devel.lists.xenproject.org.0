Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A69A68C42
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920387.1324579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus6H-00053K-Rx; Wed, 19 Mar 2025 12:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920387.1324579; Wed, 19 Mar 2025 12:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus6H-00050n-Ox; Wed, 19 Mar 2025 12:00:45 +0000
Received: by outflank-mailman (input) for mailman id 920387;
 Wed, 19 Mar 2025 12:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jwTt=WG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tus6G-0004qj-A7
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:00:44 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c883ebe8-04b9-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:00:43 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3feaedb531dso123774b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:00:43 -0700 (PDT)
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
X-Inumbo-ID: c883ebe8-04b9-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742385642; x=1742990442; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZTyndYufa/LfKPDq0tE2/Oykkyzj9F95XRC4kLnyDE=;
        b=dl4RPA6IDNyr1Cc3vMHmVm1fDJRmxiki6pUHcBaXiM+R//hG15aOaWsNhhyT9u7sv9
         hCtsF/GhJNPWAE/Miq5vZGqehAaon6LBXMFHJVcfbWKE9CFXj7N9TlFmSfhncPynLDeQ
         JOtAuCWujQbuNs3K1USdm2GoGBP7RZvoS5K1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385642; x=1742990442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZTyndYufa/LfKPDq0tE2/Oykkyzj9F95XRC4kLnyDE=;
        b=PIElyxVVS3Q4q7m9jL7H50Mo3so9tVNCjFQ0UCE5exTiKD38CVEUNP7ZaCXKsbwcve
         Xnqfl0e9caIN3jIxXk5U5Po8hXCYe0t+D2e9da+bosbjCXQtSjsK9lOKUrb6i4Vx7ou+
         gzD1hs9rV9k+AEDckr0L7GEfvCfD0fu8kbfrvPEmDSKyF9mI7VYK1ddGtrtAGgT4pGU8
         4vNMLwB/pqfluep4pvOJpUkO4xQn2GBwnxy7zcelr2VYEY21XfcsDOKcBwyandB5u0NY
         3CDztQj8pW85pObE5vpHuJYcf5Si4YWq3uTilrg6WbyaQDPWyFJYexCNrHVk4Nj/E0Fu
         3Oww==
X-Gm-Message-State: AOJu0Yw061Zs7Z9nJSi7P1k0BIFlyxB4e1F3Hn63wdwqv0yZ6xuainso
	ZZw/kiep53jZVBKKLR7YFGHZg0CjTJ/sLCmmgC/PLsiiKef/fTAyEphHQeNHLtRUwyWcWH2Uq3U
	HDUrHA9RfETSZZJl2ZyShQPgixx80H9YlGDdYVg==
X-Gm-Gg: ASbGncu7A9UsiQ2VsCehEOpE0y4CKPdpoxDfgOTVpqWA5i5TYQ/5MRC5ePKhLG51Ji/
	a/wN1y2NaXnVl/pwpGX49BzqMncxEZJsGBes5fdP30MU+1Dx5sygOUcNexeeqCi3H6IJzZeJlid
	xO03G24vcFrj2g2C+gAPEVnATdjw==
X-Google-Smtp-Source: AGHT+IEnLedfrakI2e7FKIRhyv+bhjPFKXqHPbHj0gpOnlZZZwt/MXXjGnQZgJmwdITlbN/lSKmVFgudwz6A8mtkoa0=
X-Received: by 2002:a05:6808:14d4:b0:3f8:b73b:682f with SMTP id
 5614622812f47-3fead57dfb2mr1587602b6e.1.1742385642162; Wed, 19 Mar 2025
 05:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250318173547.59475-1-roger.pau@citrix.com> <20250318173547.59475-5-roger.pau@citrix.com>
 <CACHz=Zhyn54-w=dysFXwwzhdnL4RVnadKoT+hx7hR42_VrY2oA@mail.gmail.com>
In-Reply-To: <CACHz=Zhyn54-w=dysFXwwzhdnL4RVnadKoT+hx7hR42_VrY2oA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 19 Mar 2025 12:00:31 +0000
X-Gm-Features: AQ5f1JpbD3HLn63DmeeqLB8HYQlBxjeL8EHIBtGVhR3uKn7zBvzT8B9iK_WUmKY
Message-ID: <CACHz=ZiuTn2M6Pq6-Ft9VwmRvEMaqSNvsHQV+fkdsANGhD-+1A@mail.gmail.com>
Subject: Re: [PATCH 4/7] x86/boot: apply trampoline relocations at destination position
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 7:05=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Tue, Mar 18, 2025 at 5:36=E2=80=AFPM Roger Pau Monne <roger.pau@citrix=
.com> wrote:
> >
> > Change the order relocations are applied.  Currently the trampoline is
> > patched for relocations before being copied to the low 1MB region.  Cha=
nge
> > the order and instead copy the trampoline first to the low 1MB region a=
nd
> > then apply the relocations.
> >
> > This will allow making .init.text section read-only (so read and execut=
e
> > permissions only), which is relevant when Xen is built as a PE image.
> >
>
> This change is not enough to make the section read-only, some other
> code writes directly into the trampoline at the not-relocated
> position.
> But this improves the situation.
> The code looks fine, I'll try the code if it passes some tests I did.
>

Works!

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

