Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239057543E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 19:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367749.598868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC2y6-000699-EY; Thu, 14 Jul 2022 17:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367749.598868; Thu, 14 Jul 2022 17:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC2y6-00066S-BI; Thu, 14 Jul 2022 17:49:42 +0000
Received: by outflank-mailman (input) for mailman id 367749;
 Thu, 14 Jul 2022 17:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LFm+=XT=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oC2y4-00065d-EZ
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 17:49:40 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 546c73ef-039d-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 19:49:39 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id g17so1069476plh.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jul 2022 10:49:38 -0700 (PDT)
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
X-Inumbo-ID: 546c73ef-039d-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AoII7QfHsh0FNbRunZNvbmxpoj9M13hEFMAA79iSDDY=;
        b=c2ezCfZdkJdgOHkGl2PuHlR6OqlODRiBwlE/I/+w8civ4z8qFZ6xgZ4bB7Mf77Eg7+
         KWY1YYEjQe+2FsoOi2YbkaU1MNouAnFbmTqy99tJPjqgjNsSETcUcYJLQCZ+3iUqclVO
         MUsBrj11z+vTujqbRY1O1ft7OvktsGfbHw1QU7ej3yYKhra2VfR5oM+tlUjNAMO00Fbb
         /ceIi99ZjGI/yygDqLYXbls0K+DUT/uVt7TCfZoU6IvvtTjfTsqJUWARyJ6tOyM3fS83
         EoH78tcS4Sdw8gbr8lRQG81yQqz8L+WomFt7/X2Sgmnh1TZSpcRiGs6SLBpjVl4OfGQf
         lGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AoII7QfHsh0FNbRunZNvbmxpoj9M13hEFMAA79iSDDY=;
        b=aig8dD//WO3LMppqyFRx43yea5RYpSrZQVoDy3KDoU4482vfn0g61YBS6fhZNBJOkN
         xJw0gM1x9pDDr5IejhEEkNGdO5UKh4wn75EvKF/kUpaHJWRK8nlfWR32DM+oh96+HErv
         YFM2MowLD3W+vIpz/EXzQbQyd9m9FlC5WkgpI2b6RciA1ZQPVHQ5fKLFrq021IU046IQ
         n+mybkOSaZPF7joBwC8mKem4oBypzIhtbJjtRIE4UcfVOw7foDT7hzIjdX8uaiQB+96K
         NsgrNDxnkfLtj4o6uW+OL7hDasoXlTI8ryR0tVh0ea/A+8brv26YiIQZYDSeC6bggKK4
         poCQ==
X-Gm-Message-State: AJIora+HgWANzzzLNWVReHFVXhy346JMj+1P1wbcOtpCcvx/S2HbJaYK
	n4N/nQrBcLEmFezw3pO2aWjrwDq2mvdFRjAQYclS5qFrg0I=
X-Google-Smtp-Source: AGRyM1sUEIvN42AJCCxu8XnOxqtkv6mpbBaqsGZv7zQO6d0v22rXTWaHZUvCgEHo0LRpLhkuBlX21XT7WZDobUFNxfo=
X-Received: by 2002:a17:902:f691:b0:16c:4fb6:e08b with SMTP id
 l17-20020a170902f69100b0016c4fb6e08bmr9680591plg.174.1657820977392; Thu, 14
 Jul 2022 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-2-jens.wiklander@linaro.org> <C8575668-5771-4E77-B77C-15E6E740E540@arm.com>
In-Reply-To: <C8575668-5771-4E77-B77C-15E6E740E540@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 14 Jul 2022 19:49:26 +0200
Message-ID: <CAHUa44Hi=3BScJaapRdcLQAQungR4pdnr=rDMDtexTnXiEVspg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jul 8, 2022 at 2:01 PM Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Jun 2022, at 14:42, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > SMCCC v1.2 AArch64 allows x0-x17 to be used as both parameter registers
> > and result registers for the SMC and HVC instructions.
> >
> > Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> > parameter and result registers.
> >
> > Let us add new interface to support this extended set of input/output
> > registers.
> >
> > This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> > extended input/output registers") by Sudeep Holla from the Linux kernel
> >
> > The SMCCC version reported to the VM is bumped to 1.2 in order to suppo=
rt
> > handling FF-A messages.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >
>
> I think you need to update the copyright information of the smccc.h heade=
r (maintainers can confirm if it=E2=80=99s needed),
> also it seems that you agreed with Julien to update the commit message wi=
th a reference to the spec but maybe you
> forgot about that:
> https://patchwork.kernel.org/comment/24897413/

I'm sorry, I'll fix it.

>
> With these addressed:
>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks, I'll add the to the V5 of the patch set.

Cheers,
Jens

>
>
>
>

