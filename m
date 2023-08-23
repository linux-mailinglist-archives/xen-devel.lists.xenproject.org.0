Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F47856AE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 13:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589170.920949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlw1-0002cn-CQ; Wed, 23 Aug 2023 11:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589170.920949; Wed, 23 Aug 2023 11:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYlw1-0002ai-9b; Wed, 23 Aug 2023 11:22:01 +0000
Received: by outflank-mailman (input) for mailman id 589170;
 Wed, 23 Aug 2023 11:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3PRN=EI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qYlvz-0002ac-LM
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 11:21:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 456cf858-41a7-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 13:21:57 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso5310491fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 04:21:57 -0700 (PDT)
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
X-Inumbo-ID: 456cf858-41a7-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692789717; x=1693394517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE07tyZV5YnRshFuZVP/wL3+K3eSSgJuIPcoHM8HS+M=;
        b=sGlaVDkVWx4pfFqST0S+Kdw2UtVWFMftPdRQgv3URZ0SfM4tKWWXUamNTT6JwfGNCl
         syKwpjYaJCWwKKNJLVPxp2Q9pGRoG/Vv4gR1iCO354yJikic4mETukn8o7VUeWTqp1YS
         epgO0H9dIi+uIJue3+QDtglI2pztle5BJRWj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789717; x=1693394517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LE07tyZV5YnRshFuZVP/wL3+K3eSSgJuIPcoHM8HS+M=;
        b=U9qTPwTF4RaWMQZdnOvNpNtEjh/n1uNxwfxO9mkHzRghKnJZ2CLvYswM1Px7hiJnJy
         gIcGtKBVpSaa+sRFeLRi9cnlSkCw86eqQUEzxw4tiD39hdmAJiHAFyfb1lB61QPswSj9
         34gExz7pRxSCao2XZ8CEUCuxdkNChUFRq6a6M/cirVRr8hGUDwqNS5Payq4I7D25mAkI
         JEfNSFDEenjMESZ7pM0jHDWZxoiuIr90gKfvQ/9sewrdjALwgssPAX/QdnKcBsUpGQnF
         ud2cdBoyKqxghe8aHv7zI8a1BdDMfak4qaNUzr5C1xfyGugN9eddKlZhTiJo/WV3Q+LF
         DBEw==
X-Gm-Message-State: AOJu0YyUgcY0kHiBSxJeO0+TCPkMu4fQSNUe3SjDaKWPM/TAmhWyKKa2
	JJFKccJqIeGffdkDJKFBT5+g8KrWvrRbQ2V2e1eMRd7IxtFYyRSy7VPhiA==
X-Google-Smtp-Source: AGHT+IFsATq3uLYoA702Ql8pu35KJKgcLeVZSW4phKPHfvLzYjE3FYfMh2iuRZvn/GuxNANtTnqSMAZ2XKXuU0uvFcI=
X-Received: by 2002:a2e:9851:0:b0:2b9:f1ad:94f5 with SMTP id
 e17-20020a2e9851000000b002b9f1ad94f5mr9234769ljj.40.1692789717036; Wed, 23
 Aug 2023 04:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <osstest-182423-mainreport@xen.org> <49570fa5-abf5-4179-f046-97bb40614ae6@suse.com>
In-Reply-To: <49570fa5-abf5-4179-f046-97bb40614ae6@suse.com>
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 23 Aug 2023 12:21:46 +0100
Message-ID: <CAKoJhMS1NtbreH2Q7zEsjZeivxjOCVrcvteREzwbjxv_9xZ=WA@mail.gmail.com>
Subject: Re: [xen-4.17-testing test] 182423: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 8:05=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 23.08.2023 06:32, osstest service owner wrote:
> > flight 182423 xen-4.17-testing real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/182423/
> >
> > Regressions :-(
> >
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  build-amd64-xsm               6 xen-build                fail REGR. vs=
. 182410
> >  build-amd64-prev              6 xen-build                fail REGR. vs=
. 182410
> >  build-amd64                   6 xen-build                fail REGR. vs=
. 182410
>
> Looks like an infrastructure problem at the first glance, as all three
> logs have
>
> Timeout, server 10.149.64.36 not responding.
>
> near the failure point. It's also at the same instant (2023-08-22 18:12:3=
4)
> when the failures were detected in all three cases.

It was the same machine used for all builds, godello0.

I don't know what happened to the machine, osstest rebooted it to
gather log, but nothing useful in it.

Cheers,

--=20
Anthony PERARD

