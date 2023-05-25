Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15755710D8F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539613.840691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BJe-0005v7-Sq; Thu, 25 May 2023 13:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539613.840691; Thu, 25 May 2023 13:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BJe-0005ro-Pz; Thu, 25 May 2023 13:47:42 +0000
Received: by outflank-mailman (input) for mailman id 539613;
 Thu, 25 May 2023 13:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oUrw=BO=linaro.org=linus.walleij@srs-se1.protection.inumbo.net>)
 id 1q2BJe-0005ri-2c
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:47:42 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b703002a-fb02-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 15:47:40 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-561e919d355so7691267b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 06:47:40 -0700 (PDT)
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
X-Inumbo-ID: b703002a-fb02-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685022459; x=1687614459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvX3qTYnWmFe+W70V5JCbvykxTeA+ozEK9uZ5GQt4so=;
        b=q2nzyAvWejUD3JwR7mFGQPT2GPWeaVIEeaFR/7oUXDoDkjI262vYRp7uITJhm38K4g
         upLwGmxLF+ZBT0Wt7HbiVX6ykWWIDZp3Mz6q52Xx0uYDkOJaVqkOqg5ir58fI8ADb2YM
         1vtADouc4aX/U0dSoHAlHGn8Ek0q5R5ozG5/oU/l4b+lHgq7Y+Pst4Uw/btzgwsbj4dC
         bxQ+xjA7JDTKRN3DDTWsIZquxnFaWFng6dkdYrlMib9gT6NKdQqDDVSKuXc0ArDxO8Jn
         qvZiZS4fX/4HXTsXGLKhMhTqVtgrKEGQEebKeBDb2vy2Di6/bSl6fzBnf5gDxNVQH2Xt
         Ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685022459; x=1687614459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvX3qTYnWmFe+W70V5JCbvykxTeA+ozEK9uZ5GQt4so=;
        b=M3vYaiiCpluCsSFnWpwh0Q9+enDwx0rNUGksVHYx/KOHX2opRGJLrJFrRUTEDSSOV0
         Xhr0BKATvHlYgoVdUkLbE+nRcLGdyjfSQuDrZvYcvfBITUe5y5Z4ERRUESDnmXLLS4F2
         Pr/oeOEZYg3rrGNSlBd/RWpPyFQfSevFWCBB/a6TuySmPNMTMkyfKQbKFky3NhURNHbn
         OLAL0bKyOQZr1O2itCYnH5G0wB3vEQTuKD4aGG4JSb24x5EMQ018Jp6f/yJCvUd8nDDm
         aKysSOrZUyGEtumv0wiuQ+TDppyzlYCgvS2XlsiAjRTfd1bxBRqNWTaM1k3+jeOTR6aF
         fAew==
X-Gm-Message-State: AC+VfDxVEYlXKlF7hD4td9qvImQaF1c17PoSH62yT3CkQhJGARdGK5sU
	EomGatmJTH4xJ+XOUqYqUNZRTgD4y9oBrXpQgB8GUA==
X-Google-Smtp-Source: ACHHUZ7y8gATzBWNHSdzx5J9bh9s6aYETJ1C8/dygpgpBavsOQ8azBCpcw01ORvU0zwyW0QsR5nbg5dxKgdYsiiDjgM=
X-Received: by 2002:a81:9c51:0:b0:55a:ec:6de4 with SMTP id n17-20020a819c51000000b0055a00ec6de4mr21696722ywa.10.1685022459535;
 Thu, 25 May 2023 06:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230523140342.2672713-1-linus.walleij@linaro.org>
 <20230524221147.5791ba3a@kernel.org> <20230524221247.1dc731a8@kernel.org>
In-Reply-To: <20230524221247.1dc731a8@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 May 2023 15:47:27 +0200
Message-ID: <CACRpkdbUrEZ1FAqMCq35z+g3NF1gx_9c_0vhQw6ioqkyOwaAnw@mail.gmail.com>
Subject: Re: [PATCH] xen/netback: Pass (void *) to virt_to_page()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 7:12=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> On Wed, 24 May 2023 22:11:47 -0700 Jakub Kicinski wrote:
> > On Tue, 23 May 2023 16:03:42 +0200 Linus Walleij wrote:
> > > virt_to_page() takes a virtual address as argument but
> > > the driver passes an unsigned long, which works because
> > > the target platform(s) uses polymorphic macros to calculate
> > > the page.
> > >
> > > Since many architectures implement virt_to_pfn() as
> > > a macro, this function becomes polymorphic and accepts both a
> > > (unsigned long) and a (void *).
> > >
> > > Fix this up by an explicit (void *) cast.
> >
> > Paul, Wei, looks like netdev may be the usual path for this patch
> > to flow thru, although I'm never 100% sure with Xen.
> > Please ack or LUK if you prefer to direct the patch elsewhere?
>
> Ugh, Wei already acked this, sorry for the noise.

Don't worry about it Jakub, it's queued in the asm-generic tree
along with patches making things give nasty compile messages
if they are not typed right, we try to keep down the level of noise
this way: silence it while fixing the root cause.

If you prefer to take it into the net tree that works too but no need.

Yours,
Linus Walleij

