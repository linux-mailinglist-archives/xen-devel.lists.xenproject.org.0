Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F93B4A243
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 08:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115832.1462300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvrrX-0003nF-UC; Tue, 09 Sep 2025 06:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115832.1462300; Tue, 09 Sep 2025 06:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvrrX-0003lY-Qh; Tue, 09 Sep 2025 06:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1115832;
 Tue, 09 Sep 2025 06:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i4f=3U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvrrV-0003lQ-Rp
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 06:29:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f0a76d0-8d46-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 08:29:43 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55f753ec672so5928364e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 23:29:43 -0700 (PDT)
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
X-Inumbo-ID: 5f0a76d0-8d46-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757399383; x=1758004183; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EfhFX4EPnLTi9YabeTCEqkgK8LItjVconuUeEtWqAA=;
        b=ikaxbMo6HoM0JB15r+oxmf+B+i6N96XLjsXGn8RrzDt90wvg+NtHw5bm5DsXvX2aBW
         h4WxmwNhhc1xKWYoF7zD5gvYEetfVHeYjcCTjuitjYMP/lTB+9cGxO7AUhPnnJtgK1Qj
         xemS+0ZtrGQEMVvJ36NunbSTqcuar2iuJ+maY7bw5SU6kw1cAnAxr91wvGfSC6kKdnw8
         WWpTGHe+HQG4wgyuUdybHh4U8oTdDMVerInR1sfQrjuCAWsY/2IjbC8kZVsv0rFbuhl9
         uLNwmMv2hlTTOI2req8s52WsGBe22xBY43FQar6BaYlRj6wLtHdhNyQG9qlYtgPxwHSW
         Nrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757399383; x=1758004183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EfhFX4EPnLTi9YabeTCEqkgK8LItjVconuUeEtWqAA=;
        b=a2HKYP1GYCTTp0363B+cDq6SLEXi8jVGXpW+HmmHroLBz4X7K3qr7jHq0Jb+RRJOLy
         DT4s0tacgaSe64PcKxrNJAtwJuR5knUgSKiPk0FxAtKgE3QJI9K84UT89B1q+Z3mrnLn
         IO6b1QGWBpKxJO03/EddPp1KxQOAJ/35WUmkb0WUKpvBcgdbxJi98Lp4jk2UGnQocywS
         izebL+RIULs6inoYqunIVLPBEPcKwqGvMKj3UPMZF9IfbW2lLyKVAn63sbr0dgjXAH4v
         CjYPbowbheoll26jVa5xTI2EqJQvkua8mSLUAJRUSBZQ3+Xgg3m9ZuINF9sTZtbbr/mz
         jMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVeciYX7m8ZN3YsP7F1pQllnogiEwVWh+3QbMW3nWMv7DwfBNwDSclPec45bgUrAQjh2oxCpDa1R0w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtgw8ek1DRfHZoNAty+6FFVNtVcz0D3L8BehWnFu9bGrW92ahZ
	0lo/Z+afgnEP0uU37p+82Jvq97OeVLxJe8IH3TDcvHGo+T3Gh8deI0nzlDQsUmI9yfMHOydxsvh
	R7aFpnDbSsDOVhoSCaRoQLcQ5glHAjTU=
X-Gm-Gg: ASbGncsYNLiaXv29SYb4byWMFk3YpvCXOfcVxFyaT+sfajnaPgsEZ9tKJmE2OMmhK/g
	PrldFEPWFNXj8gz46Vjx1wq3cuIe10aA6aYrimtk/HpMeFLQBWcWxgskOL+JhfmV/pLbn20OsLM
	VekoprKV9VNhNm1mWFjfNJlOqOxV7huwpKZqkLVKnFYK8XjQ7uGH6SWEkPAa8QFjvVo+H4JeuVW
	8W6Pw2sjhGucFT2jEByWxVU26c=
X-Google-Smtp-Source: AGHT+IEZi7L5Kp4FAyb0YJRiuQ3mktbQ5k5+TR21BPDwymSXAYH1CiA8503weYI5HEC5134lOqhvQqiGTFS0YPI+0T4=
X-Received: by 2002:a05:6512:318e:b0:55f:6580:8160 with SMTP id
 2adb3069b0e04-562618e1416mr3126576e87.42.1757399382292; Mon, 08 Sep 2025
 23:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com> <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
In-Reply-To: <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 9 Sep 2025 09:29:30 +0300
X-Gm-Features: Ac12FXyHOZa75W805XZrPLNNtZjbcvTtaz-ssbdZKnfGryAhd1KpzBKlM6lhY58
Message-ID: <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Wed, Sep 3, 2025 at 7:31=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> Hi Jan,
>
> On Tue, Sep 2, 2025 at 5:33=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> >
> > On 02.09.2025 00:10, Mykola Kvach wrote:
> > > --- a/xen/common/domain.c
> > > +++ b/xen/common/domain.c
> > > @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reaso=
n)
> > >          d->shutdown_code =3D reason;
> > >      reason =3D d->shutdown_code;
> > >
> > > +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> > > +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> > > +#else
> > >      if ( is_hardware_domain(d) )
> > > +#endif
> > >          hwdom_shutdown(reason);
> >
> > I still don't follow why Arm-specific code needs to live here. If this
> > can't be properly abstracted, then at the very least I'd expect some
> > code comment here, or at the very, very least something in the descript=
ion.
>
> Looks like I missed your comment about this in the previous version of
> the patch series.
>
> >
> > From looking at hwdom_shutdown() I get the impression that it doesn't
> > expect to be called with SHUTDOWN_suspend, yet then the question is why=
 we
> > make it into domain_shutdown() with that reason code.
>
> Thank you for the question, it is a good one.
>
> Thinking about it, with the current implementation (i.e. when the HW doma=
in
> requests system suspend), we don't really need to call domain_shutdown().
> It would be enough to pause the last running vCPU (the current one) just =
to
> make sure that we don't return control to the domain after exiting from t=
he
> hvc trap on the PSCI SYSTEM_SUSPEND command. We also need to set
> shutting_down to ensure that any asynchronous code or timer callbacks
> behave properly during suspend (i.e. skip their normal actions).

If we avoid calling domain_shutdown() for the hardware domain during
suspend, we would need to duplicate most of its logic except for the
hwdom_shutdown() call, which is not ideal.

To improve this, I suggest introducing a helper function:

    static inline bool need_hwdom_shutdown(const struct domain *d, u8 reaso=
n)
    {
        if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && IS_ENABLED(CONFIG_ARM) )
            return is_hardware_domain(d) && reason !=3D SHUTDOWN_suspend;

        return is_hardware_domain(d);
    }

Then, in domain_shutdown(), we can call need_hwdom_shutdown() instead
of directly checking is_hardware_domain(d). This keeps the logic
readable and avoids code duplication.

What do you think about this approach?

>
> However, if we consider a setup with two separate domains -- one control =
and
> one HW -- where the control domain makes the final decision about system
> suspend, then we would need to call __domain_finalise_shutdown() during t=
he
> HW domain suspend in order to notify the control domain that the HW domai=
n
> state has changed. The control domain would then check this state and cal=
l
> system suspend for itself after confirming that all other domains are in =
a
> suspended state.
>
> I already added a TODO about moving this logic to the control domain. So,=
 at
> first sight (unless I am missing something), we can avoid extra modificat=
ions
> inside domain_shutdown() and simply avoid calling it in case of HW domain=
.
>
> >
> > Jan
>
> Best regards,
> Mykola

Best regards,
Mykola

