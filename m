Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A976BB40C92
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107249.1457750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utVEe-0006Th-Bz; Tue, 02 Sep 2025 17:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107249.1457750; Tue, 02 Sep 2025 17:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utVEe-0006S0-8s; Tue, 02 Sep 2025 17:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1107249;
 Tue, 02 Sep 2025 17:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utVEc-0006Ru-Cv
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:55:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13eb5c46-8826-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:55:57 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso9703511a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 10:55:57 -0700 (PDT)
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
X-Inumbo-ID: 13eb5c46-8826-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756835757; x=1757440557; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeMCaETJ15KlQOb/LFepnWLSIdng3W6/qh/WhqmNexM=;
        b=AC4ZmdjUcK633nQ1mONIF5EkgO1iMo5eWn9AxWtR/eV9WOAOSFked55HKGhARIGbs1
         kpE6X2U+O3FIgB0MUf0NmZb74UTjI2vHCQ2vxtdN98caNdPnrVa1rJANkUUdlwNF7nal
         8OZio6Gy6Gu9yTGRq3nuTCrdzcWc/5Jqd7pzEyt2Rk2WQuCYEiOp7cA2PzUVDHGL1wrg
         UQNpz8d+hwomP1Wtg0Ntne+r84kDHEitjsOBYFjTcHdZB4nuAeNfECq50TmyUX4ZdBjB
         wBOnFYTEQ93jPlbUGSTiRetpVeTAcAS9sfhaRtEaGztE8xEbJMeGg8cOElGUh5AxTHjV
         /BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835757; x=1757440557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeMCaETJ15KlQOb/LFepnWLSIdng3W6/qh/WhqmNexM=;
        b=t5tnSLKtbU5JEJrhkds7Te2+TrnceNd5cYuRt2tbAPIJG1QyykdZi4t4sQ+Fg3p507
         RrBORn9SuPQmGodxn7P4Xq9Dx9PhhauGddKwTOfp7Ak2O118H1TapCVPGlyPt8nc81zr
         ++9ma1T4c2U/uRfekQgrx6UEqGrSc28qBn+tAhIBOCRjiFilR4i3sSi4tCb9NeemdakO
         R3TrlbH9FBzMgt3qBxj/yoCj0E+NtEN2cv1yGX2Zbl8Z6nckbR3C6baHiGxhS1nmrd/t
         H0L/TAYLb+jLHNi11ExiTWwOHM7lUFrCbVokZ2JG9pN+tHza6xsRj2V/jDx78KYr8E1A
         wkRw==
X-Forwarded-Encrypted: i=1; AJvYcCU8+eGqZQXHaSgLB7Aj1W8WtjlglpsE3aByl7VLQ1PetX5xjZ72DxNTKu7gdA4KuLtiRu+NPHp9lnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoVU1Q9l1hkp+1ZimMt6+BXtjftADlEluuzEqyesrY9ieXp5zW
	z5vLGpmHk1vRho0csWDNn8jc/inaevzjiJuPzsGnjEgu+EXVG6tuMl8e0Qpc84nXbkFLIqipXir
	Jz+IasASJ1QBXeCbsp1blZof4hu1tIOc=
X-Gm-Gg: ASbGncv6TtixTyXMcdP/n99qPYxEu79AqDw8t6qAW67toltpIpZzEXeJtaEbbDcj3TZ
	KnU6UQJumnqSWFSP52sAp03IQn+sTZDk9DLq8Eq1QsJNh/TrbqrgfcPMf6Anyl8vgY2+5Gv1uOO
	r0/b39NzyrGis64p4JTjBd7v/U1H6ZXlycJ0QfX230RQj50crMcCZHN0bmiE4GKf0UT6TfpEdsD
	QZiQfwRXZTrm6fa
X-Google-Smtp-Source: AGHT+IG8/mV0QClmH5H974Y8oFMA2swgFkMVmgsAGfjaIWB2yNIx/lmnxm3KrPpD6j032qrrH5Z9lfILnMsODUkiiN8=
X-Received: by 2002:a05:6402:5216:b0:61d:2405:b4a9 with SMTP id
 4fb4d7f45d1cf-61d26d9143dmr10325248a12.17.1756835756638; Tue, 02 Sep 2025
 10:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756803419.git.mykola_kvach@epam.com> <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
 <28e78684-ff7b-4902-89cd-c341ba236d57@suse.com>
In-Reply-To: <28e78684-ff7b-4902-89cd-c341ba236d57@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 20:55:45 +0300
X-Gm-Features: Ac12FXxuRuM-7Bz8QE4tJc92lRUsbKSJR6i5zA_q1DBKTVQeWU1VXZtDLiIaDYI
Message-ID: <CAGeoDV_LpUjV5ctZDE7-Z8Nb5mQgOBT2vFaLwidxNqqMM1B8qw@mail.gmail.com>
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 6:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2025 11:03, Mykola Kvach wrote:
> > ---
> >  xen/arch/arm/domain.c                 |  37 ++++++++
> >  xen/arch/arm/include/asm/domain.h     |   6 ++
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/suspend.h    |  18 ++++
> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
> >  xen/common/domain.c                   |   9 ++
> >  xen/include/xen/domain.h              |  11 +++
> >  9 files changed, 183 insertions(+), 22 deletions(-)
> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
>
> Note, btw, how this way you won't need x86, ppc, and riscv acks.

Thanks for suggesting this approach. Hopefully, the other stub functions
can be updated in a similar manner.

>
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -8,6 +8,10 @@
> >
> >  #include <public/xen.h>
> >
> > +#if __has_include(<asm/suspend.h>)
> > +#include <asm/suspend.h>
> > +#endif
> > +
> >  struct guest_area {
> >      struct page_info *pg;
> >      void *map;
> > @@ -109,6 +113,13 @@ int arch_domain_soft_reset(struct domain *d);
> >
> >  void arch_domain_creation_finished(struct domain *d);
> >
> > +#if !__has_include(<asm/suspend.h>)
> > +static inline int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +#endif /* !__has_include(<asm/suspend.h>) */
> > +
> >  void arch_p2m_set_access_required(struct domain *d, bool access_requir=
ed);
> >
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
>
> Imo it would be preferable to have such in a single #if/#else. There's no=
thing
> wrong with an #include not sitting at the very top.

I understand that includes can be placed near where something from the
header is used. However, I find it more natural to keep them together
in a single location.

>
> (Another question is whether to put this in xen/domain.h at all. There co=
uld
> be a xen/suspend.h having - for now at least - just this and nothing else=
.)

With this approach, I don=E2=80=99t need to move the include to the middle =
of
the file.

>
> Jan

Best regards,
Mykola

