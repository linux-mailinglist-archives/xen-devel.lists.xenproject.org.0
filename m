Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF315B5905A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 10:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124554.1466852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQyJ-00029I-Hx; Tue, 16 Sep 2025 08:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124554.1466852; Tue, 16 Sep 2025 08:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQyJ-000277-Em; Tue, 16 Sep 2025 08:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1124554;
 Tue, 16 Sep 2025 08:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL7b=33=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyQyI-0001Zv-RN
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 08:23:30 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c8990ad-92d6-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 10:23:29 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-571a58b385aso4385838e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 01:23:29 -0700 (PDT)
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
X-Inumbo-ID: 6c8990ad-92d6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758011009; x=1758615809; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auVS9T+dgb0lg6NH2LN1afejzf9QPdC2hyz88jpF4oM=;
        b=gOFgVCE2UdUiIAVwG7FHKBsC8rOqy+UOoew5Drjp1+iKtkUGM1J/LEyhXuEPO65XU3
         9l99mBfKOZ3KH3SrryT2F6LR+AJHm+VEHOiun0bBIWVfqCiNB6zgEu/Z6uCRjnrVNkbi
         q62TkSo888M+Lmlurf5H8zIqS0t4Cpp5iyY1pkI7iksH7FFBAw4i+5d91dV9ih58Dsyr
         QXPD3hTa1eTSQneufEHYdUWbRcmElZ1zCD1C5/4SwDFJbTF6ea3Ql3y+Ud4YMMo8rvBm
         6gWjuJFhPXPOSqAHgmdrfKsv2PFSDqMK2nmvJyAMIN2fR7aBCL1YYnKHXJ/IUpcvhqWH
         0H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758011009; x=1758615809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auVS9T+dgb0lg6NH2LN1afejzf9QPdC2hyz88jpF4oM=;
        b=T272u/j9eqaa5cYXpnwH+PYXAtsBOzlXQ9O2quHr0P2k3EytGMwUv+dwO1SedIetEl
         1567QldNoxijmZc+hyVLxz+VSHZBvi4F5DrASYLlE86Ss+j150WV3AZM0GMm7zSuJtpv
         VtkuREpiQsZfkmjX3yyDB4XKSRp14AJ7n18CX09jSx4N5CXeMPmIBptdCza/VfvMaVzH
         bDM5Vrv9icyWMmCUL03NLwW0tl5i54Dqh0cGgofzjglMUph2AZohDBsv9rseaCTBBBK6
         3otMzHLLrLC+Wj7z7+wvEL9jbUhV/ewj9avppcwRQbCo/cjV5VwFxBB1yG+GbXH5Dbwm
         JMIw==
X-Forwarded-Encrypted: i=1; AJvYcCWP2Q5d0jHuWAvedFDdgOu8Xe+yDqkjOvrFRmvE33fditq5AmCWpk83dafLmWLCr3X+WklfUJPvSXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaazEVIsqDQvMd6FE2gitvymIPjb8wJtpbHUa9HmwFPHMg+dX0
	l0K96Fibl7Sb5h4QcGigTGsjFyxj/XhYY6InOglt+klUt3aLyNj5NDidR9gV6KkGkMred/uNFSO
	05di3KpNhwBMayJtyvolCoT/ZVdrQMgQ=
X-Gm-Gg: ASbGncs8TTLuSitLm8AFJnvcehNN4aPUKLe/Go1Ip9wFVkAmN6E6luZV387AIs1Q8uQ
	iGr9CDJDT91SYqdYYT2S+H8VveYEpgA/rDHuW2lEMIL5WwQhsPVR3sv98kN+qYjsbzU1ruabrgv
	yaDwW4Y9dgvUnVJEZpTxeEl+TLUnrFUbnCZIrU+q97ToFPqVpm9OgHS5qgBb364/AnuhhhCLBaJ
	gbw1g==
X-Google-Smtp-Source: AGHT+IHWxBsSoQN9PIWPasmPxaATOMBJU4zAZHQLuU4ZrpZiZRMedObwLqZfQGyO/x8z4qnjiOw5ravJ9lo3+a1+UpY=
X-Received: by 2002:a05:651c:509:b0:354:8a7:2f7a with SMTP id
 38308e7fff4ca-35408a73bc8mr39241341fa.20.1758011008543; Tue, 16 Sep 2025
 01:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756803419.git.mykola_kvach@epam.com> <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
 <28e78684-ff7b-4902-89cd-c341ba236d57@suse.com> <CAGeoDV_LpUjV5ctZDE7-Z8Nb5mQgOBT2vFaLwidxNqqMM1B8qw@mail.gmail.com>
 <212f3043-bfd1-4c84-bce4-ed98648aa880@xen.org>
In-Reply-To: <212f3043-bfd1-4c84-bce4-ed98648aa880@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 16 Sep 2025 11:23:17 +0300
X-Gm-Features: AS18NWBhtmIpqHcw2C26VfKBkitw_05lwPVsJylFKd6NPU7YsVYHzkbc22rLbGQ
Message-ID: <CAGeoDV8gT=J_49atciCMsR7UDkgpFwK65dRbjJXFNY2TWm7d3Q@mail.gmail.com>
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 1:43=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 02/09/2025 18:55, Mykola Kvach wrote:
> >>> --- a/xen/include/xen/domain.h
> >>> +++ b/xen/include/xen/domain.h
> >>> @@ -8,6 +8,10 @@
> >>>
> >>>   #include <public/xen.h>
> >>>
> >>> +#if __has_include(<asm/suspend.h>)
> >>> +#include <asm/suspend.h>
> >>> +#endif
> >>> +
> >>>   struct guest_area {
> >>>       struct page_info *pg;
> >>>       void *map;
> >>> @@ -109,6 +113,13 @@ int arch_domain_soft_reset(struct domain *d);
> >>>
> >>>   void arch_domain_creation_finished(struct domain *d);
> >>>
> >>> +#if !__has_include(<asm/suspend.h>)
> >>> +static inline int arch_domain_resume(struct domain *d)
> >>> +{
> >>> +    return 0;
> >>> +}
> >>> +#endif /* !__has_include(<asm/suspend.h>) */
> >>> +
> >>>   void arch_p2m_set_access_required(struct domain *d, bool access_req=
uired);
> >>>
> >>>   int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
> >>
> >> Imo it would be preferable to have such in a single #if/#else. There's=
 nothing
> >> wrong with an #include not sitting at the very top.
> >
> > I understand that includes can be placed near where something from the
> > header is used. However, I find it more natural to keep them together
> > in a single location.
>
> It is not always possible to keep all includes together. I also have a
> slight preference to Jan suggestion because we don't have multiple "#if
> __has_include(<asm/suspend.h>)" which I find rather ugly but necessary.
>
> >
> >>
> >> (Another question is whether to put this in xen/domain.h at all. There=
 could
> >> be a xen/suspend.h having - for now at least - just this and nothing e=
lse.)
> >
> > With this approach, I don=E2=80=99t need to move the include to the mid=
dle of
> > the file.
>
> A new suspend.h file would also work for me.

Ack.

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

