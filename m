Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E0731AD8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549621.858245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ndw-00057t-JV; Thu, 15 Jun 2023 14:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549621.858245; Thu, 15 Jun 2023 14:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ndw-00056E-Ev; Thu, 15 Jun 2023 14:08:08 +0000
Received: by outflank-mailman (input) for mailman id 549621;
 Thu, 15 Jun 2023 14:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Djv=CD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9ndu-000564-Qd
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:08:06 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bd92b48-0b86-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:08:04 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b1acd41ad2so28446971fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 07:08:04 -0700 (PDT)
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
X-Inumbo-ID: 0bd92b48-0b86-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686838084; x=1689430084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35Xp/xzSTIq0bvn06gcv6fcs5PrVPcnmufNOpdv+E8w=;
        b=oOD+YdPJYQEcKr1woXPMTylORcV3JDk8qFmX0FEfYg66sDAYqsNyQyTXUYKqxVKkcx
         ruuks3rmxqLXPDBJwYklJJxvLHN5HeEO1ryCEHk5uGwvJk9+llJcUWrCez0aydrIfiJy
         SeZylgNNSptVr499oAkB5qm38X6xI/1aiVcI05rAcs/GMiqSfHzCETI13XDnJ+trvry1
         8fU27MWBToPNYH/GICTFj3XaYynBjS862BM2At+pAYUpRkkpx+J8oR06RfPO4kJGePPy
         ac3wPLEYlbffWQtqGspojxZs6sYYf3NBYuYj4IZ/KzbzcpIiFIVwfAAVM3v7EcrgJ+jg
         pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686838084; x=1689430084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35Xp/xzSTIq0bvn06gcv6fcs5PrVPcnmufNOpdv+E8w=;
        b=E7uu5VuX2tk72/l37j7tvz/9pr68FrvkcBo2N0B/2fNalZ46MCQZwBPwk/r/proi4c
         FgoiHteVtkY0STCPGQlqyEbs6oaW+pQDnEQOgyqST7Srrs60bJAMkBirjQS9Nb2NDX4Y
         YwVdjGv3SZyYcPKdb4GJoMQe+Di8rfjy6MKa7PbfIRU8MlAtoZLtUdRlNZ3m6uMKY4FL
         o6uz+TP9DdPWgxTZ7xt2ncXySNQdjeJmF5Jt72pfZu37HJXFqXFxrLabVcGgVNfn7+jT
         kaCxNbnxilG5ZxaJTDv1BKHjjtaoQPWPk1alZoKeYVI683guOUlmSRGrRm6rRRFE+GB/
         yuQw==
X-Gm-Message-State: AC+VfDz2+eVXWugxnD0WsdRvnmHckPVCvxtzuqCE4+tBzqmehpQaJTFE
	ryl7Xj8Fis4Z5ugos+aMb2vBqjJnmhqiUx2P+XQ=
X-Google-Smtp-Source: ACHHUZ5oFBfOBR3f988zFy/j/q4Ysg2nDc7uf22o1k6zf8JEH59cPBtzx6XtuTVNVJRfsAtoia3vy4ZXHHVWWUYRLKE=
X-Received: by 2002:a2e:870d:0:b0:2b1:cb17:b445 with SMTP id
 m13-20020a2e870d000000b002b1cb17b445mr8243788lji.48.1686838083996; Thu, 15
 Jun 2023 07:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-5-jandryuk@gmail.com>
 <194760c8-31fe-d0f7-828f-b8a637884989@suse.com>
In-Reply-To: <194760c8-31fe-d0f7-828f-b8a637884989@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Jun 2023 10:07:52 -0400
Message-ID: <CAKf6xpvoD2vVDzFU-VzXVTN1td0j-tN_VB7Z4z7ZfMwCWh+Tjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] xen/sysctl: Nest cpufreq scaling options
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.06.2023 20:02, Jason Andryuk wrote:
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
> >      uint32_t cpuinfo_cur_freq;
> >      uint32_t cpuinfo_max_freq;
> >      uint32_t cpuinfo_min_freq;
> > -    uint32_t scaling_cur_freq;
> > -
> > -    char scaling_governor[CPUFREQ_NAME_LEN];
> > -    uint32_t scaling_max_freq;
> > -    uint32_t scaling_min_freq;
> > -
> > -    /* for specific governor */
> >      union {
> > -        xc_userspace_t userspace;
> > -        xc_ondemand_t ondemand;
> > +        struct {
> > +            uint32_t scaling_cur_freq;
> > +
> > +            char scaling_governor[CPUFREQ_NAME_LEN];
> > +            uint32_t scaling_max_freq;
> > +            uint32_t scaling_min_freq;
> > +
> > +            /* for specific governor */
> > +            union {
> > +                xc_userspace_t userspace;
> > +                xc_ondemand_t ondemand;
> > +            } u;
> > +        } s;
> >      } u;
>
> There's no comment in the header that this needs to mirror the sysctl
> struct. Does it really need changing?

Since this matched the other structure, I kept them in sync.  The
cppc/hwp data needs to be represented somehow, and it gets introduced
in the same way for both later.  If this doesn't get the new nested
struct, then maybe fields could be placed into the single union.  That
would grow the overall struct and have unused fields for hwp.

> > --- a/tools/libs/ctrl/xc_pm.c
> > +++ b/tools/libs/ctrl/xc_pm.c
> > @@ -265,15 +265,10 @@ int xc_get_cpufreq_para(xc_interface *xch, int cp=
uid,
> >          user_para->cpuinfo_cur_freq =3D sys_para->cpuinfo_cur_freq;
> >          user_para->cpuinfo_max_freq =3D sys_para->cpuinfo_max_freq;
> >          user_para->cpuinfo_min_freq =3D sys_para->cpuinfo_min_freq;
> > -        user_para->scaling_cur_freq =3D sys_para->scaling_cur_freq;
> > -        user_para->scaling_max_freq =3D sys_para->scaling_max_freq;
> > -        user_para->scaling_min_freq =3D sys_para->scaling_min_freq;
> >          user_para->turbo_enabled    =3D sys_para->turbo_enabled;
> >
> >          memcpy(user_para->scaling_driver,
> >                  sys_para->scaling_driver, CPUFREQ_NAME_LEN);
> > -        memcpy(user_para->scaling_governor,
> > -                sys_para->scaling_governor, CPUFREQ_NAME_LEN);
>
> Did you really mean to remove the copying of these 4 entities, rather
> than simply change the way the fields are accessed?

Yes, it was intentional.

The immediate following lines are:
        /* copy to user_para no matter what cpufreq governor */
        BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=3D
             sizeof(((struct xen_get_cpufreq_para *)0)->u));

        memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));

And this memcpy copies all the moved entities.

I suppose the comment could change to "...no matter which cpufreq driver".

Regards,
Jason

