Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E27885FCB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696547.1087549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMGg-0005ZN-HB; Thu, 21 Mar 2024 17:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696547.1087549; Thu, 21 Mar 2024 17:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMGg-0005XL-Dz; Thu, 21 Mar 2024 17:31:54 +0000
Received: by outflank-mailman (input) for mailman id 696547;
 Thu, 21 Mar 2024 17:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnMGe-0005XD-N9
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:31:52 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e74e71a8-e7a8-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 18:31:51 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso155548566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 10:31:51 -0700 (PDT)
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
X-Inumbo-ID: e74e71a8-e7a8-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711042311; x=1711647111; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7yYWWwEJPQJZJoFRXLpRuq85VjgKMi1SEsDlACyueo=;
        b=1ObxNMyXWB/7iGxEP+bo3D5ydRDzxs2kL49Xby14+gAwt7bX7G8Yv+yupzwYorcSXO
         fUHfA80D9Q6iZqkJ6AXne8dVwlY6M90/q0M7FMapShV4D6KMId8pxxcO2GjNEjGrNSW1
         zfHe6WSNvUjZtDKybDcPoe43o5y2Ut3IrlpDyBLdVGx9PjziRLdsmf+C6ttM5HLqJk2W
         w76P96Bj+S/IIXS9zcSO81nOh84sDeIkAso7vg+b2YCyLPeawiCM69CRlFmflnYiDesm
         md/eQlMZW+qnFZ9r2pPRLOeUNZtzXcMVvLdWFuUWmYqlGUPaYafw07kPSC2pOFaVkWbt
         WmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711042311; x=1711647111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7yYWWwEJPQJZJoFRXLpRuq85VjgKMi1SEsDlACyueo=;
        b=XymQkQIOwySYs//qmUzPPpuP5HpOdMHfw6JDMsPtLAcION9+NYVmefpFKRg+X8N1C3
         xPR4yr+9kfRtwSUvArmSCh02IL1Qo8x1RiMCZJ/dHcsKs2CGu8xHaNeUXTFWC+q0Tp3L
         /LbHOwWcJwKG8LBv87/oE8N9iarAF3i6c2UwRryrAgJLQaWR/+r20z/ysn1f0nP2dYV3
         JpHwbaK+slzi4TrDunQOBtiAgA5WmN5cPQ2b3TzTuhXpW37+MHzfiwqPL111PfxKDAzo
         WuEmQ8dKOfslLJBapJF146VPLfSr3/qx/0mizzM+15YyQUYM//m8ZddCIRLqqdOHzHff
         zF/w==
X-Forwarded-Encrypted: i=1; AJvYcCVmt1hhxsc7iG2dSKHoeHfjgm8pXgzLWVoCwO3imxoKkkWVs8mbwraXOt/RtarrS38z1/EKizi5kltj4tEbq5j1zHCjyGPRSjiKlssfjhY=
X-Gm-Message-State: AOJu0YwjuDQ04weB+ZEp2oZrHJznvMrhDE/ViEeKxOloBXb/PCyrbcXa
	sJIZz3IiDvekp1Xw4+TtlWMJkVKgTDnDm/4h9d84XzPTlTQfl1GJOujZQtsmYwdCFi5Mb63wIhF
	vP3gquWPCo2yXbcVKEtwU91em0a1BtAdvYYN2/g==
X-Google-Smtp-Source: AGHT+IHsZHvJE9jiRlQH1loXN8L8hM6ROY7z54owlPQxguWU0JLSbpmi2sqMBTR47lyAtdlg08GQXilN1SEb6qc5mM8=
X-Received: by 2002:a17:906:130f:b0:a47:63d:e21a with SMTP id
 w15-20020a170906130f00b00a47063de21amr75934ejb.35.1711042311218; Thu, 21 Mar
 2024 10:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech> <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com> <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
In-Reply-To: <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 18:31:40 +0100
Message-ID: <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org, 
	Andrea Bastoni <andrea.bastoni@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 4:57=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2024 16:04, Carlo Nonato wrote:
> > On Tue, Mar 19, 2024 at 4:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 15.03.2024 11:58, Carlo Nonato wrote:
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> >>>
> >>>  Specify a list of IO ports to be excluded from dom0 access.
> >>>
> >>> +### dom0-llc-colors
> >>> +> `=3D List of [ <integer> | <integer>-<integer> ]`
> >>> +
> >>> +> Default: `All available LLC colors`
> >>> +
> >>> +Specify dom0 LLC color configuration. This option is available only =
when
> >>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all a=
vailable
> >>> +colors are used.
> >>
> >> My reservation towards this being a top-level option remains.
> >
> > How can I turn this into a lower-level option? Moving it into "dom0=3D"=
 doesn't
> > seem possible to me. How can I express a list (llc-colors) inside anoth=
er list
> > (dom0)? dom0=3Dllc-colors=3D0-3,12-15,other-param=3D... How can I stop =
parsing
> > before reaching other-param?
>
> For example by using a different separator:
>
> dom0=3Dllc-colors=3D0-3+12-15,other-param=3D...

Ok, but that would mean to change the implementation of the parsing functio=
n
and to adopt this syntax also in other places, something that I would've
preferred to avoid. Anyway I'll follow your suggestion.

> >>> @@ -91,6 +164,61 @@ void cf_check domain_dump_llc_colors(const struct=
 domain *d)
> >>>      print_colors(d->llc_colors, d->num_llc_colors);
> >>>  }
> >>>
> >>> +static int domain_set_default_colors(struct domain *d)
> >>> +{
> >>> +    unsigned int *colors =3D xmalloc_array(unsigned int, max_nr_colo=
rs);
> >>> +    unsigned int i;
> >>> +
> >>> +    if ( !colors )
> >>> +        return -ENOMEM;
> >>> +
> >>> +    printk(XENLOG_WARNING
> >>> +           "LLC color config not found for %pd, using all colors\n",=
 d);
> >>> +
> >>> +    for ( i =3D 0; i < max_nr_colors; i++ )
> >>> +        colors[i] =3D i;
> >>> +
> >>> +    d->llc_colors =3D colors;
> >>> +    d->num_llc_colors =3D max_nr_colors;
> >>> +
> >>> +    return 0;
> >>> +}
> >>
> >> If this function is expected to actually come into play, wouldn't it
> >> make sense to set up such an array just once, and re-use it wherever
> >> necessary?
> >
> > Then how to distinguish when to free it in domain_destroy() and when no=
t to do
> > it?
>
> By checking against that one special array instance.

Ok.

> Jan

Thanks.

