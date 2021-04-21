Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D63674CB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 23:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114964.219157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZKOQ-0006uN-KK; Wed, 21 Apr 2021 21:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114964.219157; Wed, 21 Apr 2021 21:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZKOQ-0006u1-HE; Wed, 21 Apr 2021 21:28:18 +0000
Received: by outflank-mailman (input) for mailman id 114964;
 Wed, 21 Apr 2021 21:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKSo=JS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lZKOP-0006tw-VY
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 21:28:18 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd1f6e04-2d32-4b4c-81a7-bf5ac6e4cd6f;
 Wed, 21 Apr 2021 21:28:17 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id b38so8230922ljf.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 14:28:17 -0700 (PDT)
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
X-Inumbo-ID: dd1f6e04-2d32-4b4c-81a7-bf5ac6e4cd6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NcQ3MaKZI+C5t8JuHnZPbALrZuaTQkyL9knMf5FxIqM=;
        b=WvEuMKEtsNE3h5auyd9kIjf0SQ7/DyN8u+59GhQasb9WsbHqobkeBgTf/6La9cQKaC
         w5dmB2cNJ3dBbBv0Zo0OKS1x1heGVEcemUbrwcLkW82xekXdAPi9C3s8oaMezUA3pWWy
         IYLudpMs6kzwr0qQT9ysCiGX5jlwsFw90cZHbKK969DzVgbAKyhAwVD3XbfiAgJTDqa6
         CFaAo7c4DjNWM+Nyt89Q850quck2LGDFKea1+qVWXdjyVodLfzpQ/647h/tbOPikLXXt
         tLwZ+6teAQSkm+uqLQ11OyR6IKtTX4F5czYJzTh7N8cbYl6mbf+bPJkFzVOnnx8qskr+
         Pw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NcQ3MaKZI+C5t8JuHnZPbALrZuaTQkyL9knMf5FxIqM=;
        b=D2I+x7/MW7W2woeeRBYJbGMnnEvoo8QmtsPmb7J9w1nG5Wb5pQjnHkfQzBxUcYzbf/
         S23c3UK9iLCC4s9C527JeCvBp02IFYezdEuGlBAAQBtqvwni1pQixAWR3Ptm6bzR3o74
         mGKmIH8SdfiJZK1rDdpkNn9zbgkM1xoQ1MDLRMO7y2spG57A4nGtDOVNA99VSinQtTpM
         uQaer3qpyD4m2NMq2/0661drz7Z3eu6r/szFsf0F0S1LhDYmay6R4LczWAFo5ts07Frr
         ckTZk4MWQ15DaMz7A74zyrGILP/IRoBdtT4T4r7+8MHRLazpnxN+TRRNXCX842gKAfO2
         WlaA==
X-Gm-Message-State: AOAM532/sGPbAwUPSQJyGScwCAr3hFnDGoFIDxr3p9X6Z9CYxY3HYDTs
	W5cLlL4vAzqEt2Gn4qqjHlI499J3wxHY0WL969A=
X-Google-Smtp-Source: ABdhPJyeLUJcfOdW9S9miijm8sMq+EWrkKl7n+wJbTj5HSey3xhmSezDABlQJm7buR+rzT1Uj4bgUaF5SHayNcvWPpY=
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr160513ljr.415.1619040496007;
 Wed, 21 Apr 2021 14:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1614734296.git.rosbrookn@ainfosec.com> <24639.23378.722148.653250@mariner.uk.xensource.com>
 <YD+SCKyagzddny1t@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YD+SCKyagzddny1t@FED-nrosbr-BE.crux.rad.ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 21 Apr 2021 17:28:04 -0400
Message-ID: <CAEBZRScuFC+T2W3O-kSnK8b942adyN21-_kgehyqr3zEdQ0+sg@mail.gmail.com>
Subject: Re: [RFC v2 0/7] add function support to IDL
To: Ian Jackson <iwj@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 3, 2021 at 8:41 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> On Wed, Mar 03, 2021 at 09:48:02AM +0000, Ian Jackson wrote:
> > Nick Rosbrook writes ("[RFC v2 0/7] add function support to IDL"):
> > > At a Xen Summit design session for the golang bindings (see [1]), we
> > > agreed that it would be beneficial to expand the libxl IDL with function
> > > support. In addition to benefiting libxl itself, this would allow other
> > > language bindings to easily generate function wrappers.
> > >
> > > The first version of this RFC is quite old [1]. I did address comments
> > > on the original RFC, but also expanded the scope a bit. As a way to
> > > evaluate function support, I worked on using this addition to the IDL to
> > > generate device add/remove/destroy functions, and removing the
> > > corresponding macros in libxl_internal.h. However, I stopped short of
> > > actually completing a build with this in place, as I thought it made
> > > sense to get feedback on the idea before working on the next step.
> >
> > This is exciting!  I hope to find time to look at it, but I'm the
> > release manager for Xen 4.15 and that's taking most of my time right
> > now.
>
> Of course, I understand. Thank you for expressing interest, I look
> forward to hearing your thoughts when time permits.
>
Hi,

Just thought I would send a ping to see if anyone has time to review.

Thanks,
NR

