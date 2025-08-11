Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDAB2022E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077114.1438208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOCX-0006nG-1t; Mon, 11 Aug 2025 08:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077114.1438208; Mon, 11 Aug 2025 08:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulOCW-0006le-V7; Mon, 11 Aug 2025 08:48:16 +0000
Received: by outflank-mailman (input) for mailman id 1077114;
 Mon, 11 Aug 2025 08:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulOCV-0006lY-RZ
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:48:15 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb3badfe-768f-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 10:48:14 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55502821bd2so4254900e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:48:14 -0700 (PDT)
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
X-Inumbo-ID: eb3badfe-768f-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902094; x=1755506894; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqGsWRXWp/HZdOQieC5QgH2PV9Ff0EAfQeIphWwDWg8=;
        b=f6KqDr4AFNhEeMe6sBiA+Da1OBc3UrZ+NushuAdmuTexqrTYGjraqREP4THAXlJfr8
         RURTCznJT7rXKp4UpUEHZtPDpdpv9z5Nedph8uiohgsh6pUvoa3Y64UnrlAFByiPAwI8
         h5Vr+7hkVyXHMkVtOj1fQvleEhz/Md0b+k5WbcIH43USlQAupUvxb1DC3mZwYMKAfrob
         qrjRjSJD0vddCR6gQOpg4K+enSKUp/ne4BoSdgbNZvtklARhKyCkh7zTNxp1tmuWt/t+
         GxCmHYOC6fyb/iRfNDbK33D+e1E4Rtyd2KDo2GettrSpzkdqyMqXRBGkqSs3W+QICcaO
         hGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902094; x=1755506894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqGsWRXWp/HZdOQieC5QgH2PV9Ff0EAfQeIphWwDWg8=;
        b=SBtCsPxTSH0BcBqylgwv+YEURhKWae7UAuiPOO50bE8ZCHojPww0AFlucG4xVjmYgn
         lrpf1DajnWj+Rasc0YzAIMCkWF7qIufmutlTEYE/jWhHW8tvFpxk404ziekWmBEuG8D2
         cixKfZoy92gDA7zfQ6Cd6saRBCvmej4UpJOKvqcD1fqAvUpprx0O0ug10susFDN0vz0i
         Q2s8nw9aKJuR6gG3MQjzFYl1NsJskPynJq6O532K/qYhkKWH9aJ1HdDG134+4l6uSJkX
         ssTp3QSHgvxQs/gcRX3B6KqBqHzkMm4/tydsDl8J+7oc63Uc+0CiAByYNsD3u8Ub43cQ
         BJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWf3AJcIkZS3Hbyq8GPlWfzprRxhX/kYxEPZjoblHpLqgCEMm8BPlteeLpRovjyPCfiERU8d/ZsQNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd+woO/fBRHF2ZHUPZ1i02aPSnysTqoo9LlgHv0fDxO82cybD6
	mpjVa6132hQ13zPGRg02+7xd6O/7RxPywIob2P6bpwgAcCSNQolFkcmu7nnH/vzyb9DGxyhjXkT
	s1V71EdI2FG+isSKnCnjihxwC8wAXRZ4=
X-Gm-Gg: ASbGncvAeQXVp6PHhoMJ9/40ChLxXM7ZAr8eECCoc9NFluCfx1NABW+GNtKpbSzLt1S
	rjC+k8yl9w2dDYpULccu5wWyvgp82rpRXm1WY6bqYHKvWL5LoGDLDRKyq7NgNV5Dz24VEvUDgy2
	HsMoAok+9XUGc4brimxybCxaFEEduOy7iTqikDnmH6BLPsJSTHQ+KFn1N8jls6ugn8sweDbvVjo
	oetIQ==
X-Google-Smtp-Source: AGHT+IHUk2b7VFDDxFKffd7YN4DgqdGks8yJwuMLGYNPVMHkOT+AKcDp94OpW17PcX2JAQ5279sADMLm9h/4WbTwzsI=
X-Received: by 2002:a05:6512:1043:b0:55b:8ab3:c1a1 with SMTP id
 2adb3069b0e04-55cc012781fmr3201076e87.49.1754902094073; Mon, 11 Aug 2025
 01:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
 <977c6c31-af2a-4108-8b28-172dc3916731@suse.com>
In-Reply-To: <977c6c31-af2a-4108-8b28-172dc3916731@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 11 Aug 2025 11:48:01 +0300
X-Gm-Features: Ac12FXwfKdgosCmxV3tOTGt6GjUB0-CZ6yOxbGr4JqHR4FtaUSN_gPYRXuMSITk
Message-ID: <CAGeoDV8eB6dFP=kek9CnEOd=w4bJB5-CjO6S6v8Fp=ZJqyDg6w@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: irq: add missing spin_unlock() in
 init_local_irq_data() error path
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 10:53=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 09.08.2025 16:32, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > If init_one_irq_desc() fails, init_local_irq_data() returns without
> > releasing local_irqs_type_lock, leading to a possible deadlock.
> >
> > Release the lock before returning to ensure proper cleanup.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Pretty likely wants backporting, which would best be indicated by a suita=
ble
> Fixes: tag.

I have added the Fixes: tag as suggested and resent the patch.
Thank you for pointing this out.

>
> Jan
>
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -94,7 +94,10 @@ static int init_local_irq_data(unsigned int cpu)
> >          int rc =3D init_one_irq_desc(desc);
> >
> >          if ( rc )
> > +        {
> > +            spin_unlock(&local_irqs_type_lock);
> >              return rc;
> > +        }
> >
> >          desc->irq =3D irq;
> >          desc->action  =3D NULL;
>

Best regards,
Mykola

