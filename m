Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B16A7283
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 19:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504209.776786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQmA-0003Be-Rg; Wed, 01 Mar 2023 18:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504209.776786; Wed, 01 Mar 2023 18:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQmA-00039O-Og; Wed, 01 Mar 2023 18:02:02 +0000
Received: by outflank-mailman (input) for mailman id 504209;
 Wed, 01 Mar 2023 18:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1hj9=6Z=tibco.com=sdyasli@srs-se1.protection.inumbo.net>)
 id 1pXQm9-00039I-7v
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 18:02:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2872a86e-b85b-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 19:01:58 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id ck15so57571050edb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 10:01:58 -0800 (PST)
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
X-Inumbo-ID: 2872a86e-b85b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1677693717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFZAC/KwSknetZaccQZZmpgZB+/3G+xJAs5HA6Dklxg=;
        b=R5/G8sUNJd0UOBKqqRJk9CqpeKAK+Hkad1bvRAzFvA6gzpX+fa6qmnPpqqiM+He0Xc
         8bG4oNDszOFruTrUMAqNb56eVWzniU6xMMkvoYlMsazDOR+ybTyHoANd8YD3p17atWCI
         WREdelnRpRx9oRRc+nU6+5K0ZdLf2PPYpU0WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677693717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFZAC/KwSknetZaccQZZmpgZB+/3G+xJAs5HA6Dklxg=;
        b=43C/sZ05ruGwB3w3Jwqtb3YXKVdDPliV6si9SxqCYQL1OPWImkPBzOaye90WjOKbjC
         foRuFY/tVSltauG1tvIyA83knCuNpAgbWj1/C3a9xh3wrZgskP4jiam8CnAgjb5eTKYU
         SqgQikd/J4P+MJi9dmJPuwC+KagBMLmaBp2ofScJ64vQKuaLVEIUMcUyHDiHKLpe8i0F
         TuieUA56Z6qq3mhEclmxS+H1wELUry0HqL5Fkal7aiEEIWkrcqY9XCiy33mau5r/MNvJ
         QIw/KENZl6DLMNTXCzbVhAr9h4hlODJpmauUtMOrRUSsbH86DEutPdYYVnto57/jCv6G
         OQlw==
X-Gm-Message-State: AO0yUKUNxpPNal3hZlNNMaeCGbbKJhdGlGmASP17ZId7Tly14Ue1jtzN
	r4FvYrhUth2dIH4HCymv/UI7LrwDFAuMZ1kgGODBPQ==
X-Google-Smtp-Source: AK7set+sLlv5kKyK6J2IRdVNpzIgY9mihhl4L5o1m+A9GbTSRaeNk/PaAL/pWUanLeLSZShs6Rb8Q5OjSl0ECv7iEGQ=
X-Received: by 2002:a17:906:b043:b0:878:8103:985 with SMTP id
 bj3-20020a170906b04300b0087881030985mr3708856ejb.10.1677693717455; Wed, 01
 Mar 2023 10:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
 <20230228173932.28510-4-sergey.dyasli@citrix.com> <4fee8e81-79d3-eafc-b806-ea061216e072@suse.com>
In-Reply-To: <4fee8e81-79d3-eafc-b806-ea061216e072@suse.com>
From: Sergey Dyasli <sergey.dyasli@cloud.com>
Date: Wed, 1 Mar 2023 18:01:46 +0000
Message-ID: <CAPRVcufSx6PTGKaycZBj2j-92zRYnHqx=8YPH5EOnWf9ujwAaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tools/xen-ucode: print information about currently
 loaded ucode
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 11:31=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.02.2023 18:39, Sergey Dyasli wrote:
> > Add an option to xen-ucode tool to print the currently loaded ucode
> > version and also print it during usage info.  Print CPU signature and
> > processor flags as well.  The raw data comes from cpuinfo directory in
> > xenhypfs and from XENPF_get_cpu_version platform op.
>
> While I don't mind the use of the platform-op, I'm little puzzled by the
> mix. If CPU information is to be exposed in hypfs, can't we expose there
> everything that's needed here?
>
> Then again, perhaps in a different context, Andrew pointed out that hypfs
> is an optional component, so relying on its presence in the underlying
> hypervisor will need weighing against the alternative of adding a new
> platform-op for the ucode-related data (as you had it in v1). Since I'm
> unaware of a request to switch, are there specific reasons you did?

Ideal situation would be microcode information in Dom0's /proc/cpuinfo
updated after late load, since that file already has most of the
information about the cpu. And the closest thing to /proc is xenhypfs.
It allows the user to query information directly, e.g.

    # xenhypfs cat /cpuinfo/microcode-revision
    33554509

Which could be used manually or in scripts, instead of relying on
xen-ucode utility. Though printing the value in hex would be nicer.
That was my motivation to go hypfs route. In general it feels like cpu
information is a good fit for hypfs, but agreement on its format and
exposed values is needed.
I can always switch back to a platform op if that would be the preference.

> > --- a/tools/misc/xen-ucode.c
> > +++ b/tools/misc/xen-ucode.c
> > @@ -11,6 +11,96 @@
> >  #include <sys/stat.h>
> >  #include <fcntl.h>
> >  #include <xenctrl.h>
> > +#include <xenhypfs.h>
> > +
> > +static const char intel_id[] =3D "GenuineIntel";
> > +static const char   amd_id[] =3D "AuthenticAMD";
> > +
> > +static const char sig_path[] =3D "/cpuinfo/cpu-signature";
> > +static const char rev_path[] =3D "/cpuinfo/microcode-revision";
> > +static const char  pf_path[] =3D "/cpuinfo/processor-flags";
>
> Together with the use below I conclude (without having looked at patch 1
> yet) that you only expose perhaps the BSP's data, rather than such for
> all CPUs. (And I was actually going to put up the question whether data
> like the one presented here might not also be of interest for parked
> CPUs.)

Yes, that comes from the BSP. Xen must make sure that all CPUs have
the same ucode revision for the system to work correctly.

Sergey

