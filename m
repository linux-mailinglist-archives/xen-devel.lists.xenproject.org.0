Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B784A7303C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929077.1331709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txldJ-0003wb-0I; Thu, 27 Mar 2025 11:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929077.1331709; Thu, 27 Mar 2025 11:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txldI-0003v9-TU; Thu, 27 Mar 2025 11:42:48 +0000
Received: by outflank-mailman (input) for mailman id 929077;
 Thu, 27 Mar 2025 11:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFzh=WO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1txldG-0003v3-T4
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:42:46 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9947d7d1-0b00-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:42:44 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30db2c2c609so10190681fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:42:44 -0700 (PDT)
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
X-Inumbo-ID: 9947d7d1-0b00-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743075764; x=1743680564; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o144CeXTAv2vUjsN8DB1z1C25OJiP36K3aaUIMZ2VM=;
        b=Z+1pSrFFWiB788wTyIuzmVK2oKCYcnDaA8o9D9is/3SFcBW9x7k1HUlQMhqxQgC9GU
         bJ4IRae/Bh1CVBftWKrh+bKXbqSCxo1yhLlErQ/Oziyq2oxN6lYZf/3mwgdIGCRqd83n
         MmeZ/e1Gzi9O5jKLLls/rl9/nb1Js3NTvwhQy6D7010IWnN0GODpuNxwlCIxCPb97emQ
         RNzS2Lr7yF/HLt3bemzErIKJaKZDazvqGGonIWFkn/fhiSOD6TQ0d+xnZFtYjsfufkI+
         2QxGYrrOXa9sUg8FBJHWkFe7YWC+fMY2396XHUkHiTDGZrNYfgWq0/1YCB6UeB5B2NC0
         FOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075764; x=1743680564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o144CeXTAv2vUjsN8DB1z1C25OJiP36K3aaUIMZ2VM=;
        b=S8CjpeEe0RTjV3WFC+oGe8rhRfVUtiselVqV6ijAAcjvW63J49V88aKlgMe0UiUlMT
         JXhg+JlVxLVovQ90OCXOuc+zalh897GGWOrvA+Otlz6BKvINfBxDUyJngV7nSccAzl6c
         Qa/ofd+QeH9KZZHMidpEcQHz4cAybMOgPhG0azH8Il009qiPU993aFlJsvry9RamP0u3
         86stnWxJ48vebo3FnAdlurBbQtI+TzyI737T8Qrc02RroWdAWciz+O3zUpEiIhH5eqr1
         LVioqTcWS01LLXxJpnusp/hZZNwvbi7JHRpQtOA4o9/DHWhf7v4ng+EK/jG0mTxgBk+K
         yCww==
X-Forwarded-Encrypted: i=1; AJvYcCUHAs+7Y8dbUquhzkGD3E4bnGfAaov8n6eOSWVyPhfTsutTlpVp+d9b28fQd28VxNKTQ9RIyYzrEac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC0bjVe9xn3YsRQuWbQORYS6qYGegNr9FDzqWYQAuAH/4ZL65p
	632L42wEk5ga2zGR456I2JoUeFKhr50S97zJ7MKXQEJJMKaDfPUe1bzWxxj4cbM0ZSLiozfzyRk
	qwwXlt98ijxO3V9LsDB9F17xs4TE=
X-Gm-Gg: ASbGnctFbp8DfzaQPaFxtYord5W/8PWuCsM5bUhOt/x1Yh2svIl1xqpHlJSbtwNi2wH
	tLfCk77YASibfTvaShFiNgLxwsU6XINLt4Hb2w/azw7ZUo4qSyOo5a+rCru8tQYEnW3+I1rfgl9
	gVI7H1zWhrgyD2om6RvVhnYO1i
X-Google-Smtp-Source: AGHT+IH9Z5YJXZV6kfkJCGjoxq9mxClY+0fGyWncFpsPzphHEiohRjsYQ4ziXhw6alcGVGnDMMoOVFbVrNghRQt1nvQ=
X-Received: by 2002:ac2:4e16:0:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-54b01221f44mr1153392e87.33.1743075763923; Thu, 27 Mar 2025
 04:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250327052241.202167-1-xakep.amatop@gmail.com> <689e103f-8130-4b38-ba63-607493737af7@suse.com>
In-Reply-To: <689e103f-8130-4b38-ba63-607493737af7@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 27 Mar 2025 13:42:32 +0200
X-Gm-Features: AQ5f1JoASXPbLLMHXDzsTT4BEJFWoGQMWBTORAVFx3ZB4euCzw_Uk0SRFwtSNqs
Message-ID: <CAGeoDV8nW1aiQkmZ6NBWESCvOODpX+FnKt_kOnmHiMxsGO5CDQ@mail.gmail.com>
Subject: Re: [PATCH] xen/percpu: don't initialize percpu on resume
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 27, 2025 at 10:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 27.03.2025 06:22, Mykola Kvach wrote:
> > --- a/xen/common/percpu.c
> > +++ b/xen/common/percpu.c
> > @@ -30,7 +30,12 @@ static int init_percpu_area(unsigned int cpu)
> >      char *p;
> >
> >      if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
> > -        return park_offline_cpus ? 0 : -EBUSY;
> > +    {
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            return 0;
> > +        else
> > +            return park_offline_cpus ? 0 : -EBUSY;
> > +    }
>
> Hmm, why not the much simpler
>
>         return park_offline_cpus || system_state =3D=3D SYS_STATE_resume
>                ? 0
>                : -EBUSY;
>
> Even if not for whatever reason, I'd really like to ask to omit such an
> unnecessary "else".

Done

>
> Preferably with the adjustment (which I'd be happy to make while
> committing) and with the (iirc) previously suggested Fixes: tag:

Done

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Added

>
> Jan

Best regards,
Mykola

