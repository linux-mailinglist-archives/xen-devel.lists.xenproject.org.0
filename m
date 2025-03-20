Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A8A6A210
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921499.1325327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBnd-0001vJ-B4; Thu, 20 Mar 2025 09:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921499.1325327; Thu, 20 Mar 2025 09:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBnd-0001tM-8K; Thu, 20 Mar 2025 09:02:49 +0000
Received: by outflank-mailman (input) for mailman id 921499;
 Thu, 20 Mar 2025 09:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVbL=WH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvBnc-0001tE-5W
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:02:48 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17b86bd9-056a-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 10:02:47 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-549b159c84cso656561e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 02:02:47 -0700 (PDT)
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
X-Inumbo-ID: 17b86bd9-056a-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742461367; x=1743066167; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqbPBVuH0zOv/UmIDKPK3LBDdErqFo0KqSUl/xl7oKI=;
        b=J+mwAdOakgeMiX20+cd2a722WIhzo/PZf9E93vYEour1g9AcE+DXMJlE81dzd06pIp
         ng06/q5HyctCx5l9Rztvh42lHVc7XOSJuPRD04xLexiIZ79mGbLHuDCcCb3W9EpOhM0b
         85zW4qN8p1lkB09ekty5ujTZLLnI/4ilgsi8yxsZPX0aGDm3DH7TEhcwbWMAIeS4cWlW
         /2raDCJkaJRjOgg/WIsqUJeAp22/zP5NYQKCSAVBQ2sPbwr5kEKWw7a2Q1cPs9pi3btt
         dxv1qynQlVVWezNY1Ck4NK/f4zwHNvSc4mcmOUgWyHmrOMLNScKnsUkebnIknWRZVian
         OBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742461367; x=1743066167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqbPBVuH0zOv/UmIDKPK3LBDdErqFo0KqSUl/xl7oKI=;
        b=Ltz9OZOJhb3BRPaxD8Orq1ae61DBDkax5tZ7NhmXwKbLqspiOiYCLKnihKE8ON+Fji
         B0XqXCy86FoqWaeJS78mzexcQbm/kp0UW4q+EBRHq+3Aj8LgRY1OFLJji8rtMKHgE/dS
         7VyFtiKypzsBgaYYlSMKIQs6knEwWEemtIToHn4C1xohkhOlh+k1b+Feforab4lKvdwk
         8tVy1cQp0ripeC3+edIfEVGGW+RPXICVov9WM/55XYFY2krsxYGUfJmh37reSjDP5/9W
         m5P3PETzWlBdIZPqECLR51hXHfQNesbiH+vCx15pTZIOprL4ADZ8PjuHN5XkF1acnQXE
         0DIA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJqVMWj7tHsCWA+wdVZyOpgn4V+rv79qzqLpd6erGFW93AqvfqmHcwOkBCmMZD2YMKsKVds+64MQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylviQO09Hwwf0wPo2OnDeeRoqEiqDCu+Anmo8mkkx7ghv6r6DQ
	b2RQgVioHuColzxFVuhJderhPQLq1eFrsZMEOMA6ihaHryeewucpOeyTSZCQZhGP5JPzPltp9Si
	ZvdrG5RlkNQxbnoUVf1mDMVF8NV8=
X-Gm-Gg: ASbGncu5yzd4rzPOa6JcSSSr5YyPxY+MEkPKxkU7MveHYja+GJvbDKkbYWDZPYZmbzk
	k6J8/YX+1i//LwdMEUSvr2VugP+QnDCxRsta8EBkwQEQEPgUAdAHw9RoUipQDb2rWrrgO0V/pvB
	tQkKmb8rijHqfiGzxF8A6lnXJj
X-Google-Smtp-Source: AGHT+IEdkvVMO3d8oSokcw6vcTnS1+eKn/FGUUS7sdpMN15VQPvfCDznEyEfYeIaMVR57e57kj9PIf5Ifu+gE7yxjIE=
X-Received: by 2002:a05:6512:23a1:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54acb1d3460mr2430604e87.30.1742461366309; Thu, 20 Mar 2025
 02:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
 <9a958cb6-d9f3-4bc3-9305-db954902f897@suse.com> <CAGeoDV8zK89jfq-2uOayUVEAo5uEdGsXqTnyz-9h7+CjBYAtgQ@mail.gmail.com>
 <a4662e3d-8206-442b-a1bd-75b3fa8dee9b@suse.com>
In-Reply-To: <a4662e3d-8206-442b-a1bd-75b3fa8dee9b@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 20 Mar 2025 11:02:34 +0200
X-Gm-Features: AQ5f1Jp5eD7zBbd-0zus9bGUu7cXhOHEACxk61s6XmorJgrJtk2PQYHNdUJalMI
Message-ID: <CAGeoDV8cVNb4Qmq9y8wJesS3UentyJEFhMgR_ZcVRmggBP77Og@mail.gmail.com>
Subject: Re: [PATCH 02/16] xen/x86: Move freeze/thaw_domains into common files
To: Jan Beulich <jbeulich@suse.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 2:47=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.03.2025 13:03, Mykola Kvach wrote:
> > On Wed, Mar 5, 2025 at 6:48=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 05.03.2025 10:11, Mykola Kvach wrote:
> >>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >>>
> >>> These functions will be reused by suspend/resume support for ARM.
> >>
> >> And until then they are going to violate the Misra rule requiring ther=
e
> >> to not be unreachable code.
> >>
> >>> --- a/xen/common/domain.c
> >>> +++ b/xen/common/domain.c
> >>> @@ -2259,6 +2259,36 @@ int continue_hypercall_on_cpu(
> >>>      return 0;
> >>>  }
> >>>
> >>> +
> >>> +void freeze_domains(void)
> >>
> >> Nit: No double blank lines please.
> >
> > Thanks for pointing that out! I'll fix it in the next version of the
> > patch series.
> >
> >>
> >>> +{
> >>> +    struct domain *d;
> >>> +
> >>> +    rcu_read_lock(&domlist_read_lock);
> >>> +    /*
> >>> +     * Note that we iterate in order of domain-id. Hence we will pau=
se dom0
> >>> +     * first which is required for correctness (as only dom0 can add=
 domains to
> >>> +     * the domain list). Otherwise we could miss concurrently-create=
d domains.
> >>> +     */
> >>> +    for_each_domain ( d )
> >>> +        domain_pause(d);
> >>> +    rcu_read_unlock(&domlist_read_lock);
> >>> +
> >>> +    scheduler_disable();
> >>
> >> When made generally available I'm unsure having this and ...
> >>
> >>> +}
> >>> +
> >>> +void thaw_domains(void)
> >>> +{
> >>> +    struct domain *d;
> >>> +
> >>> +    scheduler_enable();
> >>
> >> ... this here is a good idea. Both scheduler operations aren't related
> >> to what the function names say is being done here.
> >
> > I have just moved these functions from x86-specific headers to a common=
 one,
> > but they are still used only for suspend/resume purposes.
> > It's not a problem for me to adjust the names slightly in the next
> > version of the
> > patch series.
>
> I wasn't after a rename really; my suggestion was to leave the scheduler
> calls at the original call sites, and remove them from here.

got it, thank you

>
> Jan

