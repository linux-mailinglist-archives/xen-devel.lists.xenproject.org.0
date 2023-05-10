Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40606FDFAC
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 16:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532835.829151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkUx-0002Nv-DX; Wed, 10 May 2023 14:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532835.829151; Wed, 10 May 2023 14:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwkUx-0002LJ-9v; Wed, 10 May 2023 14:08:55 +0000
Received: by outflank-mailman (input) for mailman id 532835;
 Wed, 10 May 2023 14:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e4GJ=A7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pwkUv-0002LD-9t
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 14:08:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30892a20-ef3c-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 16:08:51 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1287675766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 07:08:51 -0700 (PDT)
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
X-Inumbo-ID: 30892a20-ef3c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683727730; x=1686319730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3S3pf8HRFB2drSMnCxHEMdMXWlYH2EWlxxK17tauz0=;
        b=CiReim0wv/tmjiF115bGunDq1jJ7GwxpcD/vdU6srL+gHsRQYsI60Fy30OriXR3maI
         OTTrJAV0on3HJvbVjPjD9eIVM0A6ghInxa7doKCui+s8jatmik/ltLpnBlNCknY0zFoH
         eW8es18O+ElTQb3Q5F5qH9Pdrwt9x3K2yw0VNycfdh4XMG80KyA4ngaeAZMRlaB75RZ1
         yTclbPqeo/bzWUQGwgrr3ntNRGW9uC57OA4ekN+sxNC04dXxnsaW7og1j0N/IM5Z8fHe
         z0uNfnzIqrG0oHJpUSedBa8XonukP835o5AUWTZ6FL8p9l0MtOsqZqX/0kHsPEr6tv0b
         L5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727730; x=1686319730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3S3pf8HRFB2drSMnCxHEMdMXWlYH2EWlxxK17tauz0=;
        b=iJ7cavzXQocJ0l6MTa9iqV6IDa5Ia+hQyn/NHYw3O+qbamTLRsP0XmJm08Hc3sNDSb
         SHy9UbM/jPJlccA6nj0uGvLyN+LprWF5wHtcXj/aviN7aZR90+r7cHhdcCKgIs9GsJtI
         6oDlVsrZX+hfypGj6t/NlJzFfSLsuN4PqeHssbi4Nd456Bow5OnxaK0ytRsPjgtVSt7T
         TGjw8MfzFCRFMzIo8aV4qZ2iA2HXhnUERDSjVVQYn2ULzPAfM9vde4X+xiDf66mM1jdI
         5Z05nBjpzdacDcWSyDia5olRhSRUN7EJwQJtyyJFU1jbDKSa/40QkjFkjm6E/tCRHUoc
         Zuow==
X-Gm-Message-State: AC+VfDzMJ4B0DgSIlYc2lJdvUiEHZZas2BBl9QpREdx5/ZO/PLINDFXH
	sIexjKjVw5tSEZelLmqsmvy2RFDK4J4r7Rv61mA=
X-Google-Smtp-Source: ACHHUZ7dhRPHDFROTcAUrJxor4wuPvbU4JzK0sJTQhUIMq0GTm7dF1E/myzoyYqzG3llhihnCqD0W2Zkx287xKWsQJI=
X-Received: by 2002:a17:907:9719:b0:96a:1ee9:4a5 with SMTP id
 jg25-20020a170907971900b0096a1ee904a5mr3071240ejc.8.1683727730511; Wed, 10
 May 2023 07:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-7-jandryuk@gmail.com>
 <bdd7aa43-3fb7-0a26-4041-b476b285d14e@suse.com>
In-Reply-To: <bdd7aa43-3fb7-0a26-4041-b476b285d14e@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 May 2023 10:08:38 -0400
Message-ID: <CAKf6xpsi11BbSxUW5h1Yx=BmZX5w5+dBD4rWtB8gTNnw_dwk1A@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] xen/x86: Tweak PDC bits when using HWP
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 5:53=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -13,6 +13,8 @@
> >  #include <asm/msr.h>
> >  #include <acpi/cpufreq/cpufreq.h>
> >
> > +static bool hwp_in_use;
>
> __ro_after_init again, please.

Of course.  (I'd already made the change locally after the earlier ones.)

> > --- a/xen/include/acpi/pdc_intel.h
> > +++ b/xen/include/acpi/pdc_intel.h
> > @@ -17,6 +17,7 @@
> >  #define ACPI_PDC_C_C1_FFH            (0x0100)
> >  #define ACPI_PDC_C_C2C3_FFH          (0x0200)
> >  #define ACPI_PDC_SMP_P_HWCOORD               (0x0800)
> > +#define ACPI_PDC_CPPC_NTV_INT                (0x1000)
>
> I can probably live with NTV (albeit I'd prefer NATIVE), but INT is too
> ambiguous for my taste: Can at least that become INTR, please?

Sounds good.  I'm switching to ACPI_PDC_CPPC_NATIVE_INTR.

> With at least the minimal adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you.

Regards,
Jason

