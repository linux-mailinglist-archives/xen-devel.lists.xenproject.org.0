Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848F92E2C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 10:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757185.1165946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpYR-0000q9-1i; Thu, 11 Jul 2024 08:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757185.1165946; Thu, 11 Jul 2024 08:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRpYQ-0000o8-Uv; Thu, 11 Jul 2024 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 757185;
 Thu, 11 Jul 2024 08:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRpYQ-0000o2-BO
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 08:53:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1c5f97-3f63-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 10:53:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso882667a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 01:53:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bba54b07sm3198647a12.14.2024.07.11.01.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 01:53:28 -0700 (PDT)
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
X-Inumbo-ID: 0b1c5f97-3f63-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720688009; x=1721292809; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iMEbJ2rxHgRvAONezc82LFzC2srBewtXwCprCffYOOI=;
        b=XLGTdDSzhJ3RJpagsmZzbtpN2lzY5FDjcH/FNGvkP2dKfiyQAWn29Rb++yTq1aP9U5
         4rTmozbpmrGrBludJePQatFfD9MD8+qw+bItVFu8FNvvzPNpMFefTx4aGaxj4Q8n18Op
         H7WZ7qS3+cF/vfRd8kSdOnLBtXXjyPihw2SyPnCIRwGYHMIYHizA8hc2UkMonsWAdzvz
         sMA3nlBUEl5KDbQDMceWct5acq9LtaggfMWGh8JdwTfb4erqz1dAJWC2HFAYq5aJDIT2
         yl1B1uM/IR/vtCDuPEcgqGD6k0ijJcOoWoSYiKDE7+XRT9RUsqIMLDLZ7N3yYt9uAs+t
         QITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688009; x=1721292809;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMEbJ2rxHgRvAONezc82LFzC2srBewtXwCprCffYOOI=;
        b=rzRxa19nAnw2jL/69GeGBJ1KJ7o4t12xoKaco9fevpuztUPicb10rU2t9OsonO0zho
         1P7P3SfMsftNNY1YSlM2oC+ylLWsJWG/1fOvxagLnBiOUk6/QGS5daL2zaxLpvO74HO+
         qFUIN3l8ouYiEd79rsGBNfQg+jqeShoz0jbnHLlejNCga3QaqZt9GXM3gtOMGg2cSY44
         SSpQkZ6cHByGxZi4FIekdzz2ZRIbG1lo0Ae/c33vy8A51IoDlK/aaC+8NhpekossYeoO
         WNbawmcBmkQvMtB76A5bcgN5LdtmFpSON0LUJCZjxvavGhMwGUB2aBdahY3pakkWFat2
         kj/g==
X-Forwarded-Encrypted: i=1; AJvYcCUGMuBAY/7Q+kdI6t8a2ohlw/IVrDF0yrx9QQS1/T1Vo4VqA/jb3GlhXQjViV+6nAstmqOxl9sQ4GC0uWmGSOP3pNFemBsuXVfOn4uWM+w=
X-Gm-Message-State: AOJu0Yyi068LIUQMoXwv+FpTecAj07N+UI+RO5DkZ3kxdOyqpDaGjSWO
	pxNp0PTzLCgMhd4Z9gCQqSJOQ7fbj50912/nLwld4e5Y92TuG0f6
X-Google-Smtp-Source: AGHT+IGap7rRhfFAHLholDWn17PL1+ygZqQMNAIJc6OqROSyqNxnDARvf8kjCEx9pqlIVUeRHbdfEg==
X-Received: by 2002:a05:6402:2791:b0:58d:115c:f529 with SMTP id 4fb4d7f45d1cf-594ba997550mr6085030a12.7.1720688008619;
        Thu, 11 Jul 2024 01:53:28 -0700 (PDT)
Message-ID: <34ca768d5c007907469252769ecc44304ca19868.camel@gmail.com>
Subject: Re: [PATCH v9 5/5] xen/riscv: test basic handling stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 10:53:27 +0200
In-Reply-To: <ad1b1b09-faca-4dc1-997a-a0fd56a6781a@suse.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
	 <62cce91351f00f80cb1c7701906e2d8cd3301ec1.1719918148.git.oleksii.kurochko@gmail.com>
	 <48dcb83f-3314-4091-9e57-9f757d7bc9db@suse.com>
	 <ad1b1b09-faca-4dc1-997a-a0fd56a6781a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-10 at 12:07 +0200, Jan Beulich wrote:
> On 10.07.2024 12:06, Jan Beulich wrote:
> > On 02.07.2024 13:23, Oleksii Kurochko wrote:
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > > =C2=A0xen/arch/riscv/setup.c | 16 ++++++++++++++++
> > > =C2=A01 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > > index a6a29a1508..4f06203b46 100644
> > > --- a/xen/arch/riscv/setup.c
> > > +++ b/xen/arch/riscv/setup.c
> > > @@ -19,6 +19,20 @@ void arch_get_xen_caps(xen_capabilities_info_t
> > > *info)
> > > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > > =C2=A0
> > > +static void test_run_in_exception(const struct cpu_user_regs
> > > *regs)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 printk("If you see this message, ");
> > > +=C2=A0=C2=A0=C2=A0 printk("run_in_exception_handler is most likely w=
orking\n");
> > > +}
> > > +
> > > +static void test_macros_from_bug_h(void)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 run_in_exception_handler(test_run_in_exception);
> > > +=C2=A0=C2=A0=C2=A0 WARN();
> > > +=C2=A0=C2=A0=C2=A0 printk("If you see this message, ");
> > > +=C2=A0=C2=A0=C2=A0 printk("WARN is most likely working\n");
> > > +}
> >=20
> > While for the moment this may be okay, in the longer run WARN()
> > will cause
> > quite a bit of output that you don't want on every boot. The
> > further plans
> > here will want mentioning in the description.
> >=20
> > Additionally as part of re-basing I think you would have wanted to
> > put this
> > under the (relatively new) SELF_TESTS Kconfig control.
I will consider SELF_TESTS Kconfig, there is not a lot of sense to
print that every boot.

>=20
> Oh, and: Is it possible there's a word ("exception"?) missing from
> the title?
Yes, I missed that. I will update the title to: " test basic exception
handling stuff ". Thanks.

~ Oleksii

