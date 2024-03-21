Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043F885C0F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696451.1087413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKTF-0001aO-N3; Thu, 21 Mar 2024 15:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696451.1087413; Thu, 21 Mar 2024 15:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKTF-0001XR-Jg; Thu, 21 Mar 2024 15:36:45 +0000
Received: by outflank-mailman (input) for mailman id 696451;
 Thu, 21 Mar 2024 15:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnKTE-0001X0-K3
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:36:44 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0fb66c1-e798-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 16:36:42 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a468226e135so136949466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:36:42 -0700 (PDT)
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
X-Inumbo-ID: d0fb66c1-e798-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711035402; x=1711640202; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4GHRLapon4CXxUYbLR3Yah1Qo+858keL9qBn13Siuw=;
        b=1Az9qyOBl7AtCZphxvT3wEx9102/8AqFvckalD0A1NsktNydhT9kT1oTHSkgF3mfh0
         N4oGQ37bEuHZ3pXEQUhQIYjOkzfnpQN2qurzE2Per8ipWOiUx3wWtAC20gn+k9pKKPNd
         k+T39vH4q4hPima6wDuPLXdb20ADCoXjs+rBMnDOXMI1rlxzCrdLhVxtvwK1++xFFK3C
         KdaK+YhO4GToflFl/MY9/I/SW1WDGq4/zUseeX6A2V5uX5WWyoHCfTKIMbImSfQjf7vf
         IC0UyxJlDuL0scpbhFTpuRS/CbYZq92tZvvio20kSsZZvggiCwBE8O5TK+y6zsBP5RQH
         NMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711035402; x=1711640202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4GHRLapon4CXxUYbLR3Yah1Qo+858keL9qBn13Siuw=;
        b=H90L9vl93HRrz7AxFmRW0pH8EzCEWIfBl8muUqJ9vVSYKEl8hhjH0bwWS9isAkS1lI
         y/5N2Fo84vMmXDgOYYzxJmiUoFpRnNKxnj9dajjlmEqVbIAd4rxAzTOeuTVuH+c5rHjw
         oSHop+glHNTmOb7nW4TaI9eRijRbyuXigNviuJHnd7WHI7DxJz35I5ldA39WRc2TXagz
         T26cubbvuTIirPuXQbRV6KCidjCO7TkfG5nicVAERrxxSGS9aiWiNa7iBOvEKUdDtOMd
         HCxMZ9WxbcWRhdGeivx+f4/vrv/VidI/1zBgCiV04pynKgsrL9Udm/5+91A6kiUObiM0
         O/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV3bmTCeQjgTmQPfbSAvY7mlWjCFDjEdNRTiJjhpJd6oBUjrLhO35O/f7bIb+iX4GTnpfMZekcnzyYADl0z59aLbVANDA/6EL+TV2tfEV0=
X-Gm-Message-State: AOJu0Yw1wzMG+xEiYtO4MsvhiKqfiq1aohLlWQdhjg1VApqIt5pRJztq
	QpWWb5EdquraCXCW56QWug3oNAWWK6tEJPqmKJzPnlrqjOIbJhde5/uekQFY9Dx55spas3KBtF6
	xepjd5OzHPHjS6rwQLmbYNSr70ZjKlKFv4kAtXw==
X-Google-Smtp-Source: AGHT+IHn/0mojwAOAt47pcyKbDYRD72fCbHXzZc4cXxEXbWgGVT9UFeEDfOGKtj+d4PWNI5hjvQz1YfMlf+RZ0yegRc=
X-Received: by 2002:a17:907:9710:b0:a46:a3dc:3359 with SMTP id
 jg16-20020a170907971000b00a46a3dc3359mr14164136ejc.46.1711035401917; Thu, 21
 Mar 2024 08:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-13-carlo.nonato@minervasys.tech> <094ace88-eea9-4527-b166-9cd83214928d@suse.com>
In-Reply-To: <094ace88-eea9-4527-b166-9cd83214928d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:36:31 +0100
Message-ID: <CAG+AhRU6fcN71DfmHb+1xHrCSLyCOuFY5jdWLmLfUQrnmOH1Hw@mail.gmail.com>
Subject: Re: [PATCH v7 12/14] xen/arm: add Xen cache colors command line parameter
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Miccio <lucmiccio@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan

On Tue, Mar 19, 2024 at 4:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:59, Carlo Nonato wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> >
> > Add a new command line parameter to configure Xen cache colors.
> > These colors can be dumped with the cache coloring info debug-key.
> >
> > By default, Xen uses the first color.
> > Benchmarking the VM interrupt response time provides an estimation of
> > LLC usage by Xen's most latency-critical runtime task. Results on Arm
> > Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, whic=
h
> > reserves 64 KiB of L2, is enough to attain best responsiveness:
> > - Xen 1 color latency:  3.1 us
> > - Xen 2 color latency:  3.1 us
> >
> > More colors are instead very likely to be needed on processors whose L1
> > cache is physically-indexed and physically-tagged, such as Cortex-A57.
> > In such cases, coloring applies to L1 also, and there typically are two
> > distinct L1-colors. Therefore, reserving only one color for Xen would
> > senselessly partitions a cache memory that is already private, i.e.
> > underutilize it.
>
> Here you say that using just a single color is undesirable on such system=
s.
>
> > The default amount of Xen colors is thus set to one.
>
> Yet then, without any further explanation you conclude that 1 is the
> universal default.

A single default that suits every need doesn't exist, but we know that 1 is
good for the most widespread target we have (Cortex-A53). Having that said,
I think that a simple reorder of the description, while also making it more
explicit, solves the issue.

> > @@ -147,6 +159,21 @@ void __init llc_coloring_init(void)
> >          panic("Number of LLC colors (%u) not in range [2, %u]\n",
> >                max_nr_colors, CONFIG_NR_LLC_COLORS);
> >
> > +    if ( !xen_num_colors )
> > +    {
> > +        unsigned int i;
> > +
> > +        xen_num_colors =3D MIN(XEN_DEFAULT_NUM_COLORS, max_nr_colors);
> > +
> > +        printk(XENLOG_WARNING
> > +               "Xen LLC color config not found. Using first %u colors\=
n",
> > +               xen_num_colors);
> > +        for ( i =3D 0; i < xen_num_colors; i++ )
> > +            xen_colors[i] =3D i;
> > +    }
> > +    else if ( !check_colors(xen_colors, xen_num_colors) )
> > +        panic("Bad LLC color config for Xen\n");
>
> This "else" branch again lacks a bounds check against max_nr_colors, if
> I'm not mistaken.

Yep.

> Jan

Thanks.

