Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661598D69B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 15:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808798.1220817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzcf-0002Jm-Ec; Wed, 02 Oct 2024 13:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808798.1220817; Wed, 02 Oct 2024 13:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svzcf-0002Ht-BN; Wed, 02 Oct 2024 13:42:33 +0000
Received: by outflank-mailman (input) for mailman id 808798;
 Wed, 02 Oct 2024 13:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tl1C=Q6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svzcd-0001kP-FH
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 13:42:31 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb58680-80c4-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 15:42:30 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5398df2c871so4551256e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 06:42:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5399f98281bsm333352e87.210.2024.10.02.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 06:42:29 -0700 (PDT)
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
X-Inumbo-ID: 2bb58680-80c4-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727876550; x=1728481350; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hpzR6wPZSpC4EkfaQznkhdhnQj6hr870Dz8nP0zCGCg=;
        b=FBG/D25v3aBwb+aJM9QFuH2REy1y2PiDEJXxrlTiuu58OIBLpk9PerUH+sm+klgEdg
         trpu/fz8X6jiFNkQlRVuxgxZi3/4t0cztge0MQ2DJpEMSjsebJeS8NYJJNGP0ggJ8/ta
         bsc7aogtDRw87odHUSRZeSGwRSRWS8Rwk6JrqRKaB1lVZ3XRTuAxoDkDOpR6NfDDxdbK
         m6NzfUCt5dAqfhnbjfoOvnqFL6WacWnqVodjXAQ0rsoebaJJNPDptUkAlJd1qaDVapLq
         M1C5kb/tEnxXAL0RWOy+a99kpuEeFm4KfKC+VtJ+w1Os3qGh39DYD9OdeTJZsy9njQAp
         lB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727876550; x=1728481350;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpzR6wPZSpC4EkfaQznkhdhnQj6hr870Dz8nP0zCGCg=;
        b=Kf6dfQwmNB8RjgEe77ZSzGBx9/yu0wehWpaD8mYmng3CbH3YvwERX63TYJbwmzURRe
         UbZ02utAs5QV7WerST/4stGUZfkikpUS6yNaq6uXGhkqpFIw/rYOAdzN9BjImec9r0Sy
         OGHvu1B/Z86hOMCrl/mO1O/3tym12FzrnFIQIXIEPWGGWFoWSWQSRrujisSJ8awlz9Nk
         LySspYRDslzvjfb3PITVCbhExxpWlWczWWw1wXHlvK2QMFKStoSFniVgB7+r2V9hciOM
         ZgkrVuqz6Ce0y3Vrh4LQLtzkAQNLztSIyX2/MUsF7Z6JWtG/7f+Ha36kWIaTKxpXq69y
         Y5qA==
X-Forwarded-Encrypted: i=1; AJvYcCUJvJuXYn/i9Xq6zbgo3pYkSmQ8AavJ2al7quKKZXmS4O6c1iLQGRvxPq5pjVVnASQZ3aE4rY5xLzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXQ8iOxCPJVfJil4fxY2VH0AvrazsJFo8ttuTfMG8oP3wePSNt
	Et8el8MHBz5nPXCbxNvk/bWMrD+8Eu7cV9OdQIjYbIsYl3VSI5L4
X-Google-Smtp-Source: AGHT+IEcFwz9+hVWJOrZwKEt48jDUpN6pHVx4WPM5yPMO69a6N610bxj6RquaB/mFFan5/ZIbSazvg==
X-Received: by 2002:a05:6512:3088:b0:533:46cc:a736 with SMTP id 2adb3069b0e04-539a0795bbdmr1926895e87.37.1727876549808;
        Wed, 02 Oct 2024 06:42:29 -0700 (PDT)
Message-ID: <7a087c1844019ea49757b1390ad3fe496b7b2c35.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] xen/riscv: register Xen's load address as a boot
 module
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 02 Oct 2024 15:42:28 +0200
In-Reply-To: <1bd67367-0928-4f16-958c-f45612689346@suse.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
	 <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
	 <178b61bc-d3e5-4c9d-a8c0-88363911bc8f@suse.com>
	 <418443ea4017c401d944971898cb298ef2f826d6.camel@gmail.com>
	 <1bd67367-0928-4f16-958c-f45612689346@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-10-02 at 14:11 +0200, Jan Beulich wrote:
> On 02.10.2024 13:25, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-10-01 at 17:49 +0200, Jan Beulich wrote:
> > > On 30.09.2024 17:08, Oleksii Kurochko wrote:
> > > > @@ -26,6 +27,8 @@ unsigned char __initdata
> > > > cpu0_boot_stack[STACK_SIZE]
> > > > =C2=A0void __init noreturn start_xen(unsigned long bootcpu_id,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t dtb_addr)
> > > > =C2=A0{
> > > > +=C2=A0=C2=A0=C2=A0 struct bootmodule *xen_bootmodule;
> > >=20
> > > With just the uses below this can be pointer-to-const. Question
> > > of
> > > course
> > > is whether you already know of further uses.
> > It could be dropped as it is used only for BUG_ON(!xen_bootmodule)
> > as
> > it looks to me a little bit better then:
> > =C2=A0=C2=A0=C2=A0 BUG_ON(!add_boot_module(BOOTMOD_XEN, virt_to_maddr(_=
start),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (_end - _start), false));
>=20
> Yet that's undesirable for other reasons. Did you consider
>=20
> =C2=A0=C2=A0=C2=A0 if ( !add_boot_module(BOOTMOD_XEN, virt_to_maddr(_star=
t),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 _end - _start, false) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
>=20
> ? Maybe panic() would be even better for cases like this one.
It looks fine to me. Thanks for suggestion.

~ Oleksii


