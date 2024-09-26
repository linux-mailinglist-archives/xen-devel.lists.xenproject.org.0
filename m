Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB6987006
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805111.1216154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkk7-0004Bx-OI; Thu, 26 Sep 2024 09:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805111.1216154; Thu, 26 Sep 2024 09:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkk7-00049L-L5; Thu, 26 Sep 2024 09:24:59 +0000
Received: by outflank-mailman (input) for mailman id 805111;
 Thu, 26 Sep 2024 09:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stkk7-00049F-0T
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:24:59 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 326e3d30-7be9-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:24:58 +0200 (CEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5da686531d3so396844eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:24:58 -0700 (PDT)
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
X-Inumbo-ID: 326e3d30-7be9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727342697; x=1727947497; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O7iDPLqyRz+7jXGw8qEqhyGLFeYmTF1APe//qYl3kc=;
        b=BdvzO4r7TSz9/xGsGs460ov487ED+c3L9SUGnAxpaJAwrc5ZapgV1QcAe9JJcaNHD4
         H8UD2xSsW9XLtF+joR73p7IiPGM1OcfvK95nhrepXy7ERhM8JtkTYu2S5UJcC7a5nsuw
         uqC4pQV36iM3/f2+BrkW4QYboJ7H1MXZ0G9Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342697; x=1727947497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O7iDPLqyRz+7jXGw8qEqhyGLFeYmTF1APe//qYl3kc=;
        b=uf8PvM9tg6OcHRYiwwjqpLpPfyr5VWKQ5nJHwl7xKAKTyv9oTBQgsgWubzEH4X3Na9
         PdhJzh3Z6GtUXW9axVPj7AvXxeF28QifMowqIKmPKINMmSX5ZuLdTrpqJ5zT34JK6Jem
         CqtHmu7z0wiokMWyImzjx39L8yiaTA82rzPrP9kofbWLtjLKwkSbvzC8T0PsMtCYgpxx
         WnhJHnIHQrcZ7dL+sBeZoHsGtzUCEFfrZDz7RifVQh+IPUgXz0eeLDyLikZSnfjUpWSK
         Yda+qQe1ve8A0LwBbKuf3rWxqCpXYimZq5NG0mn+lOoE1PyAvxM1rL9LAIO3iQY9DXMX
         vL2A==
X-Forwarded-Encrypted: i=1; AJvYcCXZM8vBGPhY8eowFzW4lRSO64ThG/HNGdZuRzDgqZAJ+FjRt+TEsv2JkQ/UhSzlnL2HxWWO1JwTWvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbtk78Sc6SAjyg8QRxgKzXvhjvE3aL9wuN57n9VKy7qKuISilP
	yONAFRjeR913DIICEMLpvVwUttN3UnlODbySsbTZ9sW/gqUUKkt389WOuIKqfN9XRDIhvyvGkl/
	oLaDroZvXX2yR9rQlFhmaZj2pzALJ+Qc+S9Q48Q==
X-Google-Smtp-Source: AGHT+IHsIWExjy6LbYuGzDwV1/AJN/SGyc40SBBBKiWuAsob7ZmLj5h+HBRF0nwcUIi3NLbV8RuEOjSw7vaduOH/3nA=
X-Received: by 2002:a05:6871:5d0:b0:268:9d81:24b7 with SMTP id
 586e51a60fabf-286e1609ea2mr4296755fac.29.1727342696932; Thu, 26 Sep 2024
 02:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-3-frediano.ziglio@cloud.com> <88189db4-c89c-430d-b96f-46259993fb5e@citrix.com>
 <2c550860-97fc-487d-9799-e543de15fff7@suse.com>
In-Reply-To: <2c550860-97fc-487d-9799-e543de15fff7@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 10:24:46 +0100
Message-ID: <CACHz=ZieO0T0zb0+O9SKJTnDiaF3gEsA=AaGQghqkBMNGvgaug@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] x86/boot: Refactor BIOS/PVH start
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 7:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.09.2024 21:33, Andrew Cooper wrote:
> > On 25/09/2024 7:00 am, Frediano Ziglio wrote:
> >> @@ -449,62 +458,40 @@ __pvh_start:
> >>          mov     %ecx, %es
> >>          mov     %ecx, %ss
> >>
> >> -        /* Skip bootloader setup and bios setup, go straight to tramp=
oline */
> >> -        movb    $1, sym_esi(pvh_boot)
> >> -        movb    $1, sym_esi(skip_realmode)
> >> +        /* Load null selector to unused segment registers. */
> >> +        xor     %ecx, %ecx
> >> +        mov     %ecx, %fs
> >> +        mov     %ecx, %gs
> >
> > Honestly, the more I look at this, the more bizarre it is.
> >
> > We should just set up %fs/gs like we do %ds/es, which in this case is
> > simply to drop the comment and the xor.
>
> What's bizarre here? As long as we don't use %fs/%gs, it doesn't matter
> much what we set them to. So yes, they may be set to what %ds etc are set
> to, but they may as well be marked unusable. Documentation-wise that's
> cleaner imo, as down the road - when a need to use one arises - it then
> won't require auditing of all code to figure where the register(s) is(are=
)
> actually used (just to find: nowhere). Even if a comment to this effect
> was left here, I for one wouldn't trust it in a couple of years time, but
> rather fear it went stale.
>
> Jan

Hi,
  are you against this change and asking to roll it back?

Frediano

