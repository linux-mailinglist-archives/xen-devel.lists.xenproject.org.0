Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71959C6821B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 09:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164528.1491467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGlo-0005UQ-4q; Tue, 18 Nov 2025 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164528.1491467; Tue, 18 Nov 2025 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGlo-0005SP-1v; Tue, 18 Nov 2025 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1164528;
 Tue, 18 Nov 2025 08:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLGlm-0005SJ-GO
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 08:08:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50ec8ea-c455-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 09:08:57 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5957c929a5eso5903740e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 00:08:57 -0800 (PST)
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
X-Inumbo-ID: d50ec8ea-c455-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763453337; x=1764058137; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxUlbc5kU9WEk3zCbovMK+3SrY/8SQ9jjyNJ7s8plwM=;
        b=lWu1eOlEomDoinQDKQiXNqw4jo4ptVMe5Mw6g7Bbg/h2GqyVMYtOECffZnDmlKY7mk
         wb1Ci8FZKmi+1CmeBjkI+QAoZbcsxZrvpN4QP3MZd0Fd6V/IQwFe9/OVT2iHAs0A5WCZ
         JRe52QX2pvqLdLKkCclVzv8pFO9jF6TJPs3r22PJ2IdSkdlT54wqcxcqRY/aI84aFRsj
         oGt6u9Mt3KbV/5q0BgxjRSQHrYYCZzkkh/3bfY14KY0irHpj6RMT/AAnFg1wvrXYCNBR
         n2EtJP8+WTiKM2mnD0VowAKxJa3wNX2tLvnLER4sbRSThxxgkuVWn6YaAD19JLht0oWh
         AZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453337; x=1764058137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxUlbc5kU9WEk3zCbovMK+3SrY/8SQ9jjyNJ7s8plwM=;
        b=jKAh1WaN+QdCwjI2ggctZSD9URpG6pFuH+AcsV572rVDu4xtxTJWo7BDx03aPijZvw
         yCWiERD+cxiYdah0YRe6PVj6PUU6i67Swuir6uSGDzMdHNig6gxNjHRL6LwBJP/tZuJ6
         8ZTH6kfPJep+Oab/Y2a5KGFx5rRSJuh+K4JpFQbAaaO+40i8LjwRDaJnnRDVWiMQWK6S
         LG38gOKURR3vO1PEmCD0vRBhpSYspSFG/gtvWKZoTkqO/r1uwi2xHQk+QrtecdOzGogB
         stjYakZXE99qVanaybX1NOviAqOgB1TThUUwRfRP7ZMaeO7RSui1kvWKlJqNlIQILXHf
         QZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvMgjR4Gi25LYibObW/j7N/kwwM5/lkH6CxSPHZVF5nPoRL+dod5JaB2kw71IBJ6V1seW2xuIWE9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO/HCbseX9NMGvEKMMBjLTWpWCq8PJqW4E2eBSHeLcMs17DeGf
	VlJhHQtpxpTqHwZRGsQ9GfBgPo0vS1mIelS9kDcBXRl7Mm59UAQQvJWg3mvlee0vVEjXrROq9FI
	ettsogt85JvyDd/Qc4PnYPb/Zf+viMe0=
X-Gm-Gg: ASbGnctSnWapYJmJvG0ANE36iu6LYzYJ8BazQC7P2tMBEAUEMzpgxuBCjeAww7aeiMz
	PgFg5+wAciSgmbQLhxJxdycctC5S0BJ70uQyxYOess7q3StyF1KIqzPB5s0bD2DJ6kMDceWVroP
	JLRzR5OBvEadLTpC9YiR7Xz5uNoiBCqFbbQZJ+/HByEfmWQ4gFQA3m//CampF5gmJ3yOjmmBtSd
	cqbb3M0Gd0wz3Fa+UPd3OaMcFj46YmMqowHd+IQNsZd6nzIPPKsO4Z59mA=
X-Google-Smtp-Source: AGHT+IHYzBcjV2XVR15vw7N7fWExRR4x9L1H9IJ8uOIscCXot5dFVdD4M5zUfLAPP+TrKDKfCvS6UvvfWAINGXJ3HA0=
X-Received: by 2002:a05:6512:108d:b0:595:81e7:3da8 with SMTP id
 2adb3069b0e04-595841f0872mr5122817e87.4.1763453336593; Tue, 18 Nov 2025
 00:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-2-carlo.nonato@minervasys.tech> <0b5f19ea-6e33-4658-a165-f0af1cffbd03@gmail.com>
 <241eaaf3-069c-4dc8-8161-45a9563dbc77@xen.org>
In-Reply-To: <241eaaf3-069c-4dc8-8161-45a9563dbc77@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 10:08:45 +0200
X-Gm-Features: AWmQ_bnHPIOxLCUibI6lRD4GSSU0vx59cexZLIMCiMjiOtq2EiOC74Vg0hmcV3E
Message-ID: <CAGeoDV_v9EHe3x81nhzJ=DTbZYwdxG-fwmAUu7BLnaHbBqCxXQ@mail.gmail.com>
Subject: Re: [PATCH v13 01/12] xen/common: add cache coloring common code
To: Julien Grall <julien@xen.org>
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for your response.

On Tue, Nov 11, 2025 at 1:02=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 07/11/2025 08:27, Mykola Kvach wrote:
> >> +void __init llc_coloring_init(void)
> >> +{
> >> +    unsigned int way_size;
> >> +
> >> +    llc_coloring_enabled =3D (opt_llc_coloring >=3D 1);
> >> +    if ( (opt_llc_coloring !=3D 0) && llc_size && llc_nr_ways )
> >> +    {
> >> +        llc_coloring_enabled =3D true;
> >> +        way_size =3D llc_size / llc_nr_ways;
> >> +    }
> >> +    else if ( !llc_coloring_enabled )
> >> +        return;
> >> +    else
> >> +    {
> >> +        way_size =3D get_llc_way_size();
> >> +        if ( !way_size )
> >> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways'
> >> missing\n");
> >
> > As far as I can see, this error means that we did not detect a suitable
> > LLC/unified cache.
> > Maybe it would be better to make that explicit in the panic message.
>
> I am rather confused why there are reviews on the series that was merged
> nearly a year ago. If you have comments that needs to be addressed, then
> it would be best to either send a new series or start a new thread (if
> there are bugs which needs discussion).

I wasn=E2=80=99t reviewing this specific series, but rather the code in
mainline. I needed to understand whether the LLC coloring code could
impact suspend/resume (s2ram) functionality, because one of my TODO
items was to check and test the interaction between s2ram and LLC
coloring.

During this testing I noticed a few potential problems and had some
questions. Then I found the corresponding mailing list series and saw
that the part I was interested in has not changed since it was
merged, so I replied directly to that thread because the context
still matches the current mainline code.

At the time this felt like the quickest way to ask questions in the
right context without duplicating it. I understand now that this is
not the preferred workflow for this project. In the near future I
will start a new discussion thread about my findings, or possibly
send patches if I manage to address some of them myself.

Thank you.

>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

