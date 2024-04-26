Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3018B3268
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712533.1113264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GyJ-00041q-UA; Fri, 26 Apr 2024 08:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712533.1113264; Fri, 26 Apr 2024 08:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GyJ-0003zP-RP; Fri, 26 Apr 2024 08:30:19 +0000
Received: by outflank-mailman (input) for mailman id 712533;
 Fri, 26 Apr 2024 08:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0GyI-0003z0-R4
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:30:18 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d84770-03a7-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:30:17 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3c5ed7fdbb1so1418851b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:30:17 -0700 (PDT)
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
X-Inumbo-ID: 35d84770-03a7-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714120216; x=1714725016; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir3Htn6xFQKqQ1rrSRCs954i22FBAEAX8XDahxDQvao=;
        b=i1ysjdvp6tREfejtZNJWbma2UuNJDzKxY/SnCuYzwNiP0TnPo9n9VyTTaIfZZqnsak
         +ZWsXRW1yG5YUhtwrXRLbQDOv0ey0Eb/QOIZnAMoK24469qVmBMsdd73d+A69Uu5TC+T
         kb4BTaIU5hNznRbZtlX+jgvOFKRaGOSAsO+pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120216; x=1714725016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir3Htn6xFQKqQ1rrSRCs954i22FBAEAX8XDahxDQvao=;
        b=rCotv/1nD33lroca8gRZDZQyOsldT7o3NOLQyKm5WY7nd7Mzt5hNsFQP/L9nEzaeF/
         1IWMx1QnkYconQ4fI0nb2syJhCe0wOgQrfbJrut+lMaZpGNCC5ie3aGWJtyA0uDoBEJ8
         4CB0eA+3IBndXF3TXVRELR4SA3OtbGOs8rOk5EaQdK8+j+EIjRqXSNuQAeDVwsKNmuEY
         kpzSTYNL5fxLmfcDkmnjvAOFfpLfjkcDjOSLudypxYHhAs64StUJaEQCWZD9a2mgiz1P
         3T1BD2Wtz5gH6gu8z1kOkOLlymrDdQq5gybY+vNW8Z3Z+B6BgBpVCmaPEtQQc6aegoyw
         0SVA==
X-Gm-Message-State: AOJu0YzNO0dYPEo4BEp1d0fweY8C8Yi1ie9rBt46K5k1RKAeNZGKBRxk
	6SzE4YuQAKcZQjtjtFdulb1iW3gYgWHpBilRnZEGRwQ14fZgId6CN0MxwcrvxxrOoASNQpShAq2
	rREgLsmM59fVM9wyF2DBC6eD505+vYZ3I+TMujUabsxd2JcQn
X-Google-Smtp-Source: AGHT+IHxkiJLT5J/xIS1EBB5DiIb8Bd+8xUZ4rvEsU0HibgzMtiz0bj5dJmMmgy/JaOSy9H+NUCDDa9LGtlwx3OwpUM=
X-Received: by 2002:a05:6808:1309:b0:3c8:52bf:5114 with SMTP id
 y9-20020a056808130900b003c852bf5114mr1543801oiv.4.1714120216396; Fri, 26 Apr
 2024 01:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240425091249.2639809-1-george.dunlap@cloud.com> <ed721736-532a-4989-981a-4d8b0789e159@citrix.com>
In-Reply-To: <ed721736-532a-4989-981a-4d8b0789e159@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 Apr 2024 09:30:05 +0100
Message-ID: <CA+zSX=bvQFxi8gRxAyEDqhQ_i==Ech=u_reY8p450M-ezjS5RA@mail.gmail.com>
Subject: Re: [PATCH] svm: Fix MISRA 8.2 violation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@cloud.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 5:00=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 25/04/2024 10:12 am, George Dunlap wrote:
> > Misra 8.2 requires named parameters in prototypes.  Use the name from
> > the implementaiton.
> >
> > Fixes 0d19d3aab0 ("svm/nestedsvm: Introduce nested capabilities bit").
>
> Nit.  We treat Fixes: as a tag.

Oops -- I'll fix that on check-in.  Gmail is also underlining my
misspelling of "implementation" in red, so I'll fix that as well.

> Also you might want to include the Reported-by's.

I thought about adding a Reported-by; but this was reported by Eclair,
which is run automatically, right?  We typically don't give a
"Reported-by" to the person who flagged up the osstest or gitlab
failure, so I figured this would be similar.

I'm happy to give credit where it's due, however.  You were the first
one who reported it to me, but Nicola also raised it; and I guess it's
someone else who's paying for the Eclair runs.  So what "Reported-by"
did you have in mind?

> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although
> I have a strong wish to shorten the parameter name.  That can be done at
> a later point.

Thanks,
 -George

