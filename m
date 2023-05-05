Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6396F8601
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530487.826122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxXd-0008Ph-Mx; Fri, 05 May 2023 15:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530487.826122; Fri, 05 May 2023 15:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxXd-0008NL-KE; Fri, 05 May 2023 15:40:17 +0000
Received: by outflank-mailman (input) for mailman id 530487;
 Fri, 05 May 2023 15:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V+Y3=A2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1puxXc-0008NF-I3
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:40:16 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 215d7988-eb5b-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 17:40:15 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso3759013a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 08:40:15 -0700 (PDT)
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
X-Inumbo-ID: 215d7988-eb5b-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683301215; x=1685893215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow8QnJEELfcaFY4U3gRJU7R7gd8Vy0C9uCYqlaaNapY=;
        b=UJVF30BB53uSjvbrTD6oKVNzfz6TfDRHMfyOgGso/nWY5ymTWFNtPYYRwZRH/LDlqt
         /5MKVnjkjBL8BprwfuDvqUSFowSPKS38klsPfqIQhATdM6T8WCikQDPdnYIgLTqEv1MG
         DpijPPb46l4jKugRYaV7xq4DnGZh/SOxClLjezuiCKL02ebh+SdExMO41Vw9htnKyPaY
         EIOtGdUajE8DbAR2ct6CIduXrCCKGA5AadsMQYh0eJ3q1BYUe67/oguPoKyg+vwh3dRF
         DWWlHLVQ0A77nDOJYsFZ0J7YHFahxCCEBKngLiuSXkhTAYu035a4S4M4XLUVQxj8u7Vs
         +4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301215; x=1685893215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow8QnJEELfcaFY4U3gRJU7R7gd8Vy0C9uCYqlaaNapY=;
        b=jyRWp8aYZ9ry5DtvqTUuF6E9xEGIOJSuqOokNiXbBP+KFEzyGzWaTacPkNdIPoydmm
         fZcw1PNAsjNHRswmiJ0auwcua94cOtyzrlkQWH3ny2O8vUC85rSQCqQeEEBXj7eEgm8a
         P3Xdp3bdZZtjF7f/0De5rLzg3NpYSCv274aRgDu1Wnpvc7rdeeyU3unP6DV8Saixqqhj
         qYxt6sxcxvV3IaJQ47HpPIW2bHXH8e3kA7mcReXh+c3sR1du8DFYsKXOFU0GdUWnR52w
         J54hGgPoaSy3heluc/DuRnF15drsfHoDsUpTdwSDPHNsgr3jPZA0vwov7MBiWVQ0XoAn
         ZiUA==
X-Gm-Message-State: AC+VfDxSLtY3QzwXTPnyhSfybYDf3gGrkVWQLqa2pxm0sD1jq82/ojeP
	FT51VVDpeDct/NvDTP7P88MI5OGy8NaV8aBJY7I=
X-Google-Smtp-Source: ACHHUZ7crrh2ZFeMxB9vLIkmKRR296a7g+ILEk7o9jF9gnSdA6hfcmgh1CbUnSfbrv2P2CYnu+Wyndo+qYrdI1Uu1vY=
X-Received: by 2002:a17:907:7250:b0:965:ff38:2fbb with SMTP id
 ds16-20020a170907725000b00965ff382fbbmr402910ejc.1.1683301214830; Fri, 05 May
 2023 08:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-6-jandryuk@gmail.com>
 <2864bf57-88cd-6fce-2d38-6f3a31abb440@suse.com> <CAKf6xpshQ=6kPHtjpWqNUiaBym2uEXt=reY0Kd0VoZgxuE=LxA@mail.gmail.com>
 <fe991a0d-53ff-1b16-02b4-85c0332467a1@suse.com>
In-Reply-To: <fe991a0d-53ff-1b16-02b4-85c0332467a1@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 May 2023 11:40:03 -0400
Message-ID: <CAKf6xpss-CbNNJ9+p_7AhEdQMr8e=--9XQCDo6+4su=pSdKNew@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] xenpm: Change get-cpufreq-para output for internal
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 3:04=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
> >>> @@ -720,10 +721,15 @@ static void print_cpufreq_para(int cpuid, struc=
t xc_get_cpufreq_para *p_cpufreq)
> >>>          printf(" %d", p_cpufreq->affected_cpus[i]);
> >>>      printf("\n");
> >>>
> >>> -    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
> >>> -           p_cpufreq->cpuinfo_max_freq,
> >>> -           p_cpufreq->cpuinfo_min_freq,
> >>> -           p_cpufreq->cpuinfo_cur_freq);
> >>> +    if ( internal )
> >>> +        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
> >>> +               p_cpufreq->cpuinfo_min_freq,
> >>> +               p_cpufreq->cpuinfo_max_freq);
> >>
> >> ... calling it "turbo" (and not "max") here.
> >
> > I'm fine with "max".  I think I went with turbo since it's a value you
> > cannot sustain but can only hit in short bursts.
>
> ... I don't mind you sticking to "turbo" as long as the description makes
> clear why that was chosen despite the SDM not naming it this way.

I switched to "max" since as you point out that matches the SDM naming.

Regards,
Jason

