Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58076555D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571127.894224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Rp-0007xO-Gj; Thu, 27 Jul 2023 13:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571127.894224; Thu, 27 Jul 2023 13:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1Rp-0007uX-Dq; Thu, 27 Jul 2023 13:54:33 +0000
Received: by outflank-mailman (input) for mailman id 571127;
 Thu, 27 Jul 2023 13:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xgU=DN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qP1Rn-0007uR-L1
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:54:31 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1badc0b2-2c85-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 15:54:30 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so1225953a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 06:54:30 -0700 (PDT)
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
X-Inumbo-ID: 1badc0b2-2c85-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690466070; x=1691070870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEPAt50EPWPd1oIQlbGSziqNoWm4lplgVDe3aNcVQK4=;
        b=Ckcrm7ZZn+x5q7Wm1ayO/T/Ya68nwAzf/N5iXtjbvLK5nDvCSA27FgWRKDOAMDwKTi
         IeYdYCAfTX8f0v2FrxeeO7pgydrNakILUAjYuNibcVyt56/HlWrzaC1Adqv+sQtxkeHB
         cr2C7dmV++q2wiR2SRZyrFaHWxyNqaDmGikbvsPvy4ofzE+8dKmmhHzaLDnHWwvmbWVd
         GEtUsMMu9WS9rcdPvFfIBNIkNsP6WLLIZRQuhA3QLDrCKzLBWfaRuOvKEfxxAkV7TKcI
         yImmAIhM03thDyHkPoP3FXpzMtGKLKW1KbjxEvG53805FcgsSilt6lOfU32ECRyWst2p
         WoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466070; x=1691070870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEPAt50EPWPd1oIQlbGSziqNoWm4lplgVDe3aNcVQK4=;
        b=WK0H8AGJDv9otF+DSIl8xknAX+E0CWyaiWPaFlyI4Szilnx+SAbEtUoc3MJm2hoUmH
         AAv3iQ8n1PDGj6ixq9YHtSJIrzjF2pZPbA1x8dJN7cp22mVGnbd2+/kuf3gU0sjD+6tO
         N6dN8qAaBzSJRnui7+QaiKrxYrgAIQafhTMz4vI/CBO5g7DI74n7CeR4CD8RZudZtUvD
         KwEDm21k1atc6Nhf/y+EbGOPEvL/jhAXiUk2PDNdDqRdRYhjxwy36qGgswS9xExC+9pK
         iheMTP4HXvmIhAx821gsyTX98SNNqj6qLua8M2PUHkwOruFVPn0yyLO7RxODJy+jhVw8
         ebCQ==
X-Gm-Message-State: ABy/qLbTjE6UeWv3U7YxQFlqdPyU1X8ouVzfO7N2TRiaF+qLOajTBpwE
	M7QupPDVvbjdhyup7F1stiO78LF4JLQ91XlM008=
X-Google-Smtp-Source: APBJJlESYiEL1J7UbNdm17D8gS15bKoOs652nNHMIdt7qKwduXVWSe4ZW9BzoIY/xI29FGl2oj5DNeScmcmxs2/O2So=
X-Received: by 2002:a05:6402:32c:b0:51d:9db8:8257 with SMTP id
 q12-20020a056402032c00b0051d9db88257mr1633916edw.30.1690466069502; Thu, 27
 Jul 2023 06:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230726170945.34961-1-jandryuk@gmail.com> <20230726170945.34961-12-jandryuk@gmail.com>
 <882c0e9f-8e66-4be3-aecf-477d38da9371@perard>
In-Reply-To: <882c0e9f-8e66-4be3-aecf-477d38da9371@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 27 Jul 2023 09:54:17 -0400
Message-ID: <CAKf6xpvrh1Y7j3pb506pNgQMgsKM0OmdbKqQtrLBXUPdMqZS6w@mail.gmail.com>
Subject: Re: [PATCH v7 11/15] xenpm: Print HWP/CPPC parameters
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 7:32=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Jul 26, 2023 at 01:09:41PM -0400, Jason Andryuk wrote:
> > @@ -772,6 +812,32 @@ static void print_cpufreq_para(int cpuid, struct x=
c_get_cpufreq_para *p_cpufreq)
> >                 p_cpufreq->u.s.scaling_min_freq,
> >                 p_cpufreq->u.s.scaling_cur_freq);
> >      }
> > +    else
> > +    {
>
> I feel like this could be confusing. In this function, we have both:
>     if ( hwp ) { this; } else { that; }
> and
>     if ( !hwp ) { that; } else { this; }
>
> If we could have the condition in the same order, or use the same
> condition for both "true" blocks, that would be nice.

Makes sense.  From your comment on patch 8, I was thinking of
switching to a bool scaling_governor and using that.  But now I think
hwp is better since it's the specific governor - not the default one.
In light of that, I would just re-organize everything to be "if ( hwp
)".

With that, patch 8 is more of a transitive step, and I would leave the
"if ( !hwp )".  Then here in patch 11 the HWP code would be added
first inside "if ( hwp )".  Does that sound good?

> > +        const xc_cppc_para_t *cppc =3D &p_cpufreq->u.cppc_para;
> > +
> > +        printf("cppc variables       :\n");
> > +        printf("  hardware limits    : lowest [%u] lowest nonlinear [%=
u]\n",
> > +               cppc->lowest, cppc->lowest_nonlinear);
>
> All these %u should be %"PRIu32", right? Even if the rest of the
> function is bogus... and even if it's probably be a while before %PRIu32
> is different from %u.

Yes, you are correct.  In patch 8 "xenpm: Change get-cpufreq-para
output for hwp", some existing %u-s are moved and a few more added.
Do you want all of those converted to %PRIu32?

Thanks,
Jason

