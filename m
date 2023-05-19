Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFD70A5D9
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 08:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537074.836521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Ffa-0002AK-Pq; Sat, 20 May 2023 06:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537074.836521; Sat, 20 May 2023 06:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Ffa-0001zn-JJ; Sat, 20 May 2023 06:02:22 +0000
Received: by outflank-mailman (input) for mailman id 537074;
 Fri, 19 May 2023 13:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQyD=BI=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1q00Eb-0007qv-Qa
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 13:33:30 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb3e465c-f649-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 15:33:26 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24e14a24c9dso2573239a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 May 2023 06:33:26 -0700 (PDT)
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
X-Inumbo-ID: bb3e465c-f649-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684503204; x=1687095204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OEEI39IrNGfso+EqF91j5RdJQZ9anQGMII+ULCY0T78=;
        b=ks/Mgju6qJ+G2BcmQmpf89e4b3+qQ9o2EaZJBzESO5wRlJzOZE4LYDOsvDvluoaurl
         glxz6b9prqh8tmrOcPJ56dcYclfeV4kkK7hlcCN1+T7ecGtjkiTI7jDveo9cco3+mJ3Z
         HBHV6jNVAOIOdYBth+Buj9BwDhwR8oXaBNKAW612i6CNRHvCS7l9EmiAddWpSeP+SLjH
         xrqaIAxfo6Ux8LxcG9Ok0Hd14ohM28FXSVQUbYYUnKvxqdW62irVOsmLcoE9WVvkvOCW
         ng7qsQY4Ll5HpmyXKoS+pT/M19RNfSxZayml8skgX9Ukkl0R1WsP9vNU44iwveT33Vuz
         hI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684503204; x=1687095204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEEI39IrNGfso+EqF91j5RdJQZ9anQGMII+ULCY0T78=;
        b=Yu7AThLPDbnuLDtXyGr5aVexwxAWvy8AffXrT+Kx1w6Stn4pT5gsytKZYlApZNuOXF
         u+ZzFea4A8sETIThvTwaX0LA7yksB+FC95J1NyV8WNUj4zf5wD9oO6a3uFXzh45B/40T
         XztKLhsWYjocvV5g/Vr3sU5x7RgP19OBQuVQ5Y5zcbyh3DYk6z95oeNXR/mOlKS4xtbE
         KraC+bPnR+1DivKAVkPiHxDDg9DtAZ4F6x1O37vi4ym0dDI9e/1xKb0qciaZBWsPMNYx
         gSPCR9jwwyEhKyv93zWTF5XLAulfj9tv3cqrqXF9ilM1Mdc8+5syX2mS6N5kPkLm3Da+
         se+Q==
X-Gm-Message-State: AC+VfDzXK8Q1KQbp/LCs7Q/EyUNaZR05J1a1SFwMFzo6DkgynYlB5ntM
	92L0+Sg9Jcfkin8E4tuVRUKn+lBQX3+zqY+dp8A=
X-Google-Smtp-Source: ACHHUZ4hBKr9YfPsxtg1DKVb68SthpLvpGuVq47imTCUeTs6lJNZZwioyZSdS7FsshyoXFESkGzT8/BqCqTmD8Ra/jE=
X-Received: by 2002:a17:90b:358b:b0:24b:8480:39d6 with SMTP id
 mm11-20020a17090b358b00b0024b848039d6mr2185017pjb.0.1684503203898; Fri, 19
 May 2023 06:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <alpine.DEB.2.22.394.2304271451420.3419@ubuntu-linux-20-04-desktop>
 <CA+SAi2u4rqdJwO5s_wU2brHgqtV=GrOpBkk+7ZXr9D4rpKME9w@mail.gmail.com>
 <4e859659-8532-7ba2-63b9-a06d91cb0ffc@amd.com> <CA+SAi2u3UdjDkpMWT0ScY8b84GutXmn+7hdMYSxJSDictgzhXw@mail.gmail.com>
 <CA+SAi2u9uT7R6u1csxg1PqTLnJ-i=+71H3ymP5REv09-srJEYA@mail.gmail.com>
 <alpine.DEB.2.22.394.2305091248560.974517@ubuntu-linux-20-04-desktop>
 <CA+SAi2u_gwuotOWexJ1MXii82NkLx8inx4VO_f_EjO9NqgM+CQ@mail.gmail.com>
 <bcac90c2-ef35-2908-9fe6-f09c1b1e2340@amd.com> <CA+SAi2sgHbUKk6mQVnFWQWJ1LBY29GW+eagrqHNN6TLDmv2AgQ@mail.gmail.com>
 <CA+SAi2tErcaAkRT5zhTwSE=-jszwAWNtEAnm5jNGEP1NoqbQ3w@mail.gmail.com>
 <53af4bc6-97ad-d806-003b-38e70ccd2b58@amd.com> <CA+SAi2vrB714Tc9dn4SbtDo3VrT3Q8OpSiFXRLRaO5=0BJo_rQ@mail.gmail.com>
 <f0e6ca10-2142-7c39-0c7b-042c454e7e08@amd.com> <CA+SAi2tCVDiQ1BLdvuH2XnvTDGDCnPBDCq70AVbsO+TZKMERSw@mail.gmail.com>
 <fa9ebe0a-6ba0-6f1a-0df1-ad65ec1e93b3@amd.com>
In-Reply-To: <fa9ebe0a-6ba0-6f1a-0df1-ad65ec1e93b3@amd.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Fri, 19 May 2023 16:38:27 +0300
Message-ID: <CA+SAi2u9uxSgUHZ6EdNuQHSh9FYn3YR0kEg9BB3BQwrkf11zCw@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Stewart.Hildebrand@amd.com
Content-Type: multipart/alternative; boundary="000000000000176ab505fc0bf7c0"

--000000000000176ab505fc0bf7c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks Michal.

Then the next question. Now it is more related to the integration than to
the development.
A license for the xen in 4.17 revision at branch xlnx_rebase_4.17 xilinx
repo has changed.
I found out when I built this version.
Now bitbake and yocto build fault by COPYING file md5 hashe inequality
reason.
I found out md5 hash stored at
sources/libs/meta-virtualization/recipes-extended/xen directory in files
xen-tools_4.15.bb
xen_4.15.bb
xen_git.bb
xen-tools_git.bb
xen-tools_4.16.bb
xen_4.16.bb
So this is a question. Should I update the license file for all our
branches or is it possible to keep an old one for old branches ?

Regards,
Oleg


=D0=B2=D1=82, 16 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 21:00, Mich=
al Orzel <michal.orzel@amd.com>:

>
>
> On 16/05/2023 17:14, Oleg Nikitenko wrote:
> >
> >
> >
> > Hi guys,
> >
> > Thanks Michal.
> >
> > So if I have more RAM It is possible to increase the color density.
> >
> > For example 8Gb/16 it is 512 Mb approximately.
> > Is this correct ?
> Yes.
> To my previous reply I should also add that the number of colors depends
> on the page size,
> but in Xen, we use 4kB pages so 64kB way size results in 16 colors.
>
> ~Michal
>
> > Regards,
> > Oleg
> >
> > =D0=B2=D1=82, 16 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 17:40, =
Michal Orzel <michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>:
> >
> >     Hi Oleg,
> >
> >     On 16/05/2023 14:15, Oleg Nikitenko wrote:
> >     >
> >     >
> >     >
> >     > Hello,
> >     >
> >     > Thanks a lot Michal.
> >     >
> >     > Then the next question.
> >     > When I just started my experiments with xen, Stefano mentioned
> that each cache's color size is 256M.
> >     > Is it possible to extend this figure ?
> >     With 16 colors (e.g. on Cortex-A53) and 4GB of memory, roughly each
> color is 256M (i.e. 4GB/16 =3D 256M).
> >     So as you can see this figure depends on the number of colors and
> memory size.
> >
> >     ~Michal
> >
> >     >
> >     > Regards,
> >     > Oleg
> >     >
> >     > =D0=BF=D0=BD, 15 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 1=
1:57, Michal Orzel <michal.orzel@amd.com
> <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>:
> >     >
> >     >     Hi Oleg,
> >     >
> >     >     On 15/05/2023 10:51, Oleg Nikitenko wrote:
> >     >     >
> >     >     >
> >     >     >
> >     >     > Hello guys,
> >     >     >
> >     >     > Thanks a lot.
> >     >     > After a long problem list I was able to run xen with Dom0
> with a cache color.
> >     >     > One more question from my side.
> >     >     > I want to run a guest with color mode too.
> >     >     > I inserted a string into guest config file llc-colors =3D
> "9-13"
> >     >     > I got an error
> >     >     > [  457.517004] loop0: detected capacity change from 0 to
> 385840
> >     >     > Parsing config from /xen/red_config.cfg
> >     >     > /xen/red_config.cfg:26: config parsing error near `-colors'=
:
> lexical error
> >     >     > warning: Config file looks like it contains Python code.
> >     >     > warning:  Arbitrary Python is no longer supported.
> >     >     > warning:  See https://wiki.xen.org/wiki/PythonInXlConfig <
> https://wiki.xen.org/wiki/PythonInXlConfig> <
> https://wiki.xen.org/wiki/PythonInXlConfig <
> https://wiki.xen.org/wiki/PythonInXlConfig>> <
> https://wiki.xen.org/wiki/PythonInXlConfig <
> https://wiki.xen.org/wiki/PythonInXlConfig> <
> https://wiki.xen.org/wiki/PythonInXlConfig <
> https://wiki.xen.org/wiki/PythonInXlConfig>>>
> >     >     > Failed to parse config: Invalid argument
> >     >     > So this is a question.
> >     >     > Is it possible to assign a color mode for the DomU by confi=
g
> file ?
> >     >     > If so, what string should I use?
> >     >     Please, always refer to the relevant documentation. In this
> case, for xl.cfg:
> >     >
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod=
.in#L2890
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod=
.in#L2890>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod=
.in#L2890
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod=
.in#L2890
> >>
> >     >
> >     >     ~Michal
> >     >
> >     >     >
> >     >     > Regards,
> >     >     > Oleg
> >     >     >
> >     >     > =D1=87=D1=82, 11 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =
=D0=B2 13:32, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>:
> >     >     >
> >     >     >     Hi Michal,
> >     >     >
> >     >     >     Thanks.
> >     >     >     This compilation previously had a name CONFIG_COLORING.
> >     >     >     It mixed me up.
> >     >     >
> >     >     >     Regards,
> >     >     >     Oleg
> >     >     >
> >     >     >     =D1=87=D1=82, 11 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3=
. =D0=B2 13:15, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>>:
> >     >     >
> >     >     >         Hi Oleg,
> >     >     >
> >     >     >         On 11/05/2023 12:02, Oleg Nikitenko wrote:
> >     >     >         >
> >     >     >         >
> >     >     >         >
> >     >     >         > Hello,
> >     >     >         >
> >     >     >         > Thanks Stefano.
> >     >     >         > Then the next question.
> >     >     >         > I cloned xen repo from xilinx site
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git>> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git>>> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git>> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git> <
> https://github.com/Xilinx/xen.git <https://github.com/Xilinx/xen.git>>>>
> >     >     >         > I managed to build a xlnx_rebase_4.17 branch in m=
y
> environment.
> >     >     >         > I did it without coloring first. I did not find
> any color footprints at this branch.
> >     >     >         > I realized coloring is not in the xlnx_rebase_4.1=
7
> branch yet.
> >     >     >         This is not true. Cache coloring is in
> xlnx_rebase_4.17. Please see the docs:
> >     >     >
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-c=
oloring.rst
> >>>
> >     >     >
> >     >     >         It describes the feature and documents the required
> properties.
> >     >     >
> >     >     >         ~Michal
> >     >     >
> >     >     >         >
> >     >     >         >
> >     >     >         > =D0=B2=D1=82, 9 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=
=D0=B3. =D0=B2 22:49, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>:
> >     >     >         >
> >     >     >         >     We test Xen Cache Coloring regularly on
> zcu102. Every Petalinux release
> >     >     >         >     (twice a year) is tested with cache coloring
> enabled. The last Petalinux
> >     >     >         >     release is 2023.1 and the kernel used is this=
:
> >     >     >         >
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS>> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS>>> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS>> <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS>
> >     <https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS <
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS>>>>
> >     >     >         >
> >     >     >         >
> >     >     >         >     On Tue, 9 May 2023, Oleg Nikitenko wrote:
> >     >     >         >     > Hello guys,
> >     >     >         >     >
> >     >     >         >     > I have a couple of more questions.
> >     >     >         >     > Have you ever run xen with the cache
> coloring at Zynq UltraScale+ MPSoC zcu102 xczu15eg ?
> >     >     >         >     > When did you run xen with the cache colorin=
g
> last time ?
> >     >     >         >     > What kernel version did you use for Dom0
> when you ran xen with the cache coloring last time ?
> >     >     >         >     >
> >     >     >         >     > Regards,
> >     >     >         >     > Oleg
> >     >     >         >     >
> >     >     >         >     > =D0=BF=D1=82, 5 =D0=BC=D0=B0=D1=8F 2023=E2=
=80=AF=D0=B3. =D0=B2 11:48, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>>:
> >     >     >         >     >       Hi Michal,
> >     >     >         >     >
> >     >     >         >     > Thanks.
> >     >     >         >     >
> >     >     >         >     > Regards,
> >     >     >         >     > Oleg
> >     >     >         >     >
> >     >     >         >     > =D0=BF=D1=82, 5 =D0=BC=D0=B0=D1=8F 2023=E2=
=80=AF=D0=B3. =D0=B2 11:34, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>>>:
> >     >     >         >     >       Hi Oleg,
> >     >     >         >     >
> >     >     >         >     >       Replying, so that you do not need to
> wait for Stefano.
> >     >     >         >     >
> >     >     >         >     >       On 05/05/2023 10:28, Oleg Nikitenko
> wrote:
> >     >     >         >     >       >
> >     >     >         >     >       >
> >     >     >         >     >       >
> >     >     >         >     >       > Hello Stefano,
> >     >     >         >     >       >
> >     >     >         >     >       > I would like to try a xen cache
> color property from this repo  https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git> <
> https://xenbits.xen.org/git-http/xen.git <
> https://xenbits.xen.org/git-http/xen.git>>>>>
> >     >     >         >     >       > Could you tell whot branch I should
> use ?
> >     >     >         >     >       Cache coloring feature is not part of
> the upstream tree and it is still under review.
> >     >     >         >     >       You can only find it integrated in th=
e
> Xilinx Xen tree.
> >     >     >         >     >
> >     >     >         >     >       ~Michal
> >     >     >         >     >
> >     >     >         >     >       >
> >     >     >         >     >       > Regards,
> >     >     >         >     >       > Oleg
> >     >     >         >     >       >
> >     >     >         >     >       > =D0=BF=D1=82, 28 =D0=B0=D0=BF=D1=80=
. 2023=E2=80=AF=D0=B3. =D0=B2 00:51, Stefano
> Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>>:
> >     >     >         >     >       >
> >     >     >         >     >       >     I am familiar with the zcu102
> but I don't know how you could possibly
> >     >     >         >     >       >     generate a SError.
> >     >     >         >     >       >
> >     >     >         >     >       >     I suggest to try to use
> ImageBuilder [1] to generate the boot
> >     >     >         >     >       >     configuration as a test because
> that is known to work well for zcu102.
> >     >     >         >     >       >
> >     >     >         >     >       >     [1]
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>>>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>>
> >     <https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder> <
> https://gitlab.com/xen-project/imagebuilder <
> https://gitlab.com/xen-project/imagebuilder>>>>>
> >     >     >         >     >       >
> >     >     >         >     >       >
> >     >     >         >     >       >     On Thu, 27 Apr 2023, Oleg
> Nikitenko wrote:
> >     >     >         >     >       >     > Hello Stefano,
> >     >     >         >     >       >     >
> >     >     >         >     >       >     > Thanks for clarification.
> >     >     >         >     >       >     > We nighter use ImageBuilder
> nor uboot boot script.
> >     >     >         >     >       >     > A model is zcu102 compatible.
> >     >     >         >     >       >     >
> >     >     >         >     >       >     > Regards,
> >     >     >         >     >       >     > O.
> >     >     >         >     >       >     >
> >     >     >         >     >       >     > =D0=B2=D1=82, 25 =D0=B0=D0=BF=
=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 21:21,
> Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org=
>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>>:
> >     >     >         >     >       >     >       This is interesting. Ar=
e
> you using Xilinx hardware by any chance? If so,
> >     >     >         >     >       >     >       which board?
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       Are you using
> ImageBuilder to generate your boot.scr boot script? If so,
> >     >     >         >     >       >     >       could you please post
> your ImageBuilder config file? If not, can you
> >     >     >         >     >       >     >       post the source of your
> uboot boot script?
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       SErrors are supposed to
> be related to a hardware failure of some kind.
> >     >     >         >     >       >     >       You are not supposed to
> be able to trigger an SError easily by
> >     >     >         >     >       >     >       "mistake". I have not
> seen SErrors due to wrong cache coloring
> >     >     >         >     >       >     >       configurations on any
> Xilinx board before.
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       The differences between
> Xen with and without cache coloring from a
> >     >     >         >     >       >     >       hardware perspective ar=
e:
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       - With cache coloring,
> the SMMU is enabled and does address translations
> >     >     >         >     >       >     >         even for dom0. Withou=
t
> cache coloring the SMMU could be disabled, and
> >     >     >         >     >       >     >         if enabled, the SMMU
> doesn't do any address translations for Dom0. If
> >     >     >         >     >       >     >         there is a hardware
> failure related to SMMU address translation it
> >     >     >         >     >       >     >         could only trigger
> with cache coloring. This would be my normal
> >     >     >         >     >       >     >         suggestion for you to
> explore, but the failure happens too early
> >     >     >         >     >       >     >         before any DMA-capabl=
e
> device is programmed. So I don't think this can
> >     >     >         >     >       >     >         be the issue.
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       - With cache coloring,
> the memory allocation is very different so you'll
> >     >     >         >     >       >     >         end up using differen=
t
> DDR regions for Dom0. So if your DDR is
> >     >     >         >     >       >     >         defective, you might
> only see a failure with cache coloring enabled
> >     >     >         >     >       >     >         because you end up
> using different regions.
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >       On Tue, 25 Apr 2023,
> Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       > Hi Stefano,
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > Thank you.
> >     >     >         >     >       >     >       > If I build xen withou=
t
> colors support there is not this error.
> >     >     >         >     >       >     >       > All the domains are
> booted well.
> >     >     >         >     >       >     >       > Hense it can not be a
> hardware issue.
> >     >     >         >     >       >     >       > This panic arrived
> during unpacking the rootfs.
> >     >     >         >     >       >     >       > Here I attached the
> boot log xen/Dom0 without color.
> >     >     >         >     >       >     >       > A highlighted strings
> printed exactly after the place where 1-st time panic arrived.
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >  Xen 4.16.1-pre
> >     >     >         >     >       >     >       > (XEN) Xen version
> 4.16.1-pre (nole2390@(none)) (aarch64-portable-linux-gcc (GCC) 11.3.0)
> debug=3Dy
> >     >     >         >     >       2023-04-21
> >     >     >         >     >       >     >       > (XEN) Latest
> ChangeSet: Wed Apr 19 12:56:14 2023 +0300 git:321687b231-dirty
> >     >     >         >     >       >     >       > (XEN) build-id:
> c1847258fdb1b79562fc710dda40008f96c0fde5
> >     >     >         >     >       >     >       > (XEN) Processor:
> 00000000410fd034: "ARM Limited", variant: 0x0, part 0xd03,rev 0x4
> >     >     >         >     >       >     >       > (XEN) 64-bit Executio=
n:
> >     >     >         >     >       >     >       > (XEN)   Processor
> Features: 0000000000002222 0000000000000000
> >     >     >         >     >       >     >       > (XEN)     Exception
> Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> >     >     >         >     >       >     >       > (XEN)     Extensions:
> FloatingPoint AdvancedSIMD
> >     >     >         >     >       >     >       > (XEN)   Debug
> Features: 0000000010305106 0000000000000000
> >     >     >         >     >       >     >       > (XEN)   Auxiliary
> Features: 0000000000000000 0000000000000000
> >     >     >         >     >       >     >       > (XEN)   Memory Model
> Features: 0000000000001122 0000000000000000
> >     >     >         >     >       >     >       > (XEN)   ISA Features:
>  0000000000011120 0000000000000000
> >     >     >         >     >       >     >       > (XEN) 32-bit Executio=
n:
> >     >     >         >     >       >     >       > (XEN)   Processor
> Features: 0000000000000131:0000000000011011
> >     >     >         >     >       >     >       > (XEN)     Instruction
> Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> >     >     >         >     >       >     >       > (XEN)     Extensions:
> GenericTimer Security
> >     >     >         >     >       >     >       > (XEN)   Debug
> Features: 0000000003010066
> >     >     >         >     >       >     >       > (XEN)   Auxiliary
> Features: 0000000000000000
> >     >     >         >     >       >     >       > (XEN)   Memory Model
> Features: 0000000010201105 0000000040000000
> >     >     >         >     >       >     >       > (XEN)
>          0000000001260000 0000000002102211
> >     >     >         >     >       >     >       > (XEN)   ISA Features:
> 0000000002101110 0000000013112111 0000000021232042
> >     >     >         >     >       >     >       > (XEN)
> 0000000001112131 0000000000011142 0000000000011121
> >     >     >         >     >       >     >       > (XEN) Using SMC
> Calling Convention v1.2
> >     >     >         >     >       >     >       > (XEN) Using PSCI v1.1
> >     >     >         >     >       >     >       > (XEN) SMP: Allowing 4
> CPUs
> >     >     >         >     >       >     >       > (XEN) Generic Timer
> IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 100000 KHz
> >     >     >         >     >       >     >       > (XEN) GICv2
> initialization:
> >     >     >         >     >       >     >       > (XEN)
> gic_dist_addr=3D00000000f9010000
> >     >     >         >     >       >     >       > (XEN)
> gic_cpu_addr=3D00000000f9020000
> >     >     >         >     >       >     >       > (XEN)
> gic_hyp_addr=3D00000000f9040000
> >     >     >         >     >       >     >       > (XEN)
> gic_vcpu_addr=3D00000000f9060000
> >     >     >         >     >       >     >       > (XEN)
> gic_maintenance_irq=3D25
> >     >     >         >     >       >     >       > (XEN) GICv2: Adjustin=
g
> CPU interface base to 0xf902f000
> >     >     >         >     >       >     >       > (XEN) GICv2: 192
> lines, 4 cpus, secure (IID 0200143b).
> >     >     >         >     >       >     >       > (XEN) Using scheduler=
:
> null Scheduler (null)
> >     >     >         >     >       >     >       > (XEN) Initializing
> null scheduler
> >     >     >         >     >       >     >       > (XEN) WARNING: This i=
s
> experimental software in development.
> >     >     >         >     >       >     >       > (XEN) Use at your own
> risk.
> >     >     >         >     >       >     >       > (XEN) Allocated
> console ring of 32 KiB.
> >     >     >         >     >       >     >       > (XEN) CPU0: Guest
> atomics will try 12 times before pausing the domain
> >     >     >         >     >       >     >       > (XEN) Bringing up CPU=
1
> >     >     >         >     >       >     >       > (XEN) CPU1: Guest
> atomics will try 13 times before pausing the domain
> >     >     >         >     >       >     >       > (XEN) CPU 1 booted.
> >     >     >         >     >       >     >       > (XEN) Bringing up CPU=
2
> >     >     >         >     >       >     >       > (XEN) CPU2: Guest
> atomics will try 13 times before pausing the domain
> >     >     >         >     >       >     >       > (XEN) CPU 2 booted.
> >     >     >         >     >       >     >       > (XEN) Bringing up CPU=
3
> >     >     >         >     >       >     >       > (XEN) CPU3: Guest
> atomics will try 13 times before pausing the domain
> >     >     >         >     >       >     >       > (XEN) Brought up 4 CP=
Us
> >     >     >         >     >       >     >       > (XEN) CPU 3 booted.
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: probing hardware configuration...
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: SMMUv2 with:
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: stage 2 translation
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: stream matching with 48 register groups, mask
> 0x7fff<2>smmu:
> >     >     >         >     >       /axi/smmu@fd800000: 16 context
> >     >     >         >     >       >     >       banks (0
> >     >     >         >     >       >     >       > stage-2 only)
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: Stage-2: 48-bit IPA -> 48-bit PA
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: registered 29 master devices
> >     >     >         >     >       >     >       > (XEN) I/O
> virtualisation enabled
> >     >     >         >     >       >     >       > (XEN)  - Dom0 mode:
> Relaxed
> >     >     >         >     >       >     >       > (XEN) P2M: 40-bit IPA
> with 40-bit PA and 8-bit VMID
> >     >     >         >     >       >     >       > (XEN) P2M: 3 levels
> with order-1 root, VTCR 0x0000000080023558
> >     >     >         >     >       >     >       > (XEN) Scheduling
> granularity: cpu, 1 CPU per sched-resource
> >     >     >         >     >       >     >       > (XEN) alternatives:
> Patching with alt table 00000000002cc5c8 -> 00000000002ccb2c
> >     >     >         >     >       >     >       > (XEN) *** LOADING
> DOMAIN 0 ***
> >     >     >         >     >       >     >       > (XEN) Loading d0
> kernel from boot module @ 0000000001000000
> >     >     >         >     >       >     >       > (XEN) Loading ramdisk
> from boot module @ 0000000002000000
> >     >     >         >     >       >     >       > (XEN) Allocating 1:1
> mappings totalling 1600MB for dom0:
> >     >     >         >     >       >     >       > (XEN) BANK[0]
> 0x00000010000000-0x00000020000000 (256MB)
> >     >     >         >     >       >     >       > (XEN) BANK[1]
> 0x00000024000000-0x00000028000000 (64MB)
> >     >     >         >     >       >     >       > (XEN) BANK[2]
> 0x00000030000000-0x00000080000000 (1280MB)
> >     >     >         >     >       >     >       > (XEN) Grant table
> range: 0x00000000e00000-0x00000000e40000
> >     >     >         >     >       >     >       > (XEN) smmu:
> /axi/smmu@fd800000: d0: p2maddr 0x000000087bf94000
> >     >     >         >     >       >     >       > (XEN) Allocating PPI
> 16 for event channel interrupt
> >     >     >         >     >       >     >       > (XEN) Extended region
> 0: 0x81200000->0xa0000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 1: 0xb1200000->0xc0000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 2: 0xc8000000->0xe0000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 3: 0xf0000000->0xf9000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 4: 0x100000000->0x600000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 5: 0x880000000->0x8000000000
> >     >     >         >     >       >     >       > (XEN) Extended region
> 6: 0x8001000000->0x10000000000
> >     >     >         >     >       >     >       > (XEN) Loading zImage
> from 0000000001000000 to 0000000010000000-0000000010e41008
> >     >     >         >     >       >     >       > (XEN) Loading d0
> initrd from 0000000002000000 to 0x0000000013600000-0x000000001ff3a617
> >     >     >         >     >       >     >       > (XEN) Loading d0 DTB
> to 0x0000000013400000-0x000000001340cbdc
> >     >     >         >     >       >     >       > (XEN) Initial low
> memory virq threshold set at 0x4000 pages.
> >     >     >         >     >       >     >       > (XEN) Std. Loglevel:
> All
> >     >     >         >     >       >     >       > (XEN) Guest Loglevel:
> All
> >     >     >         >     >       >     >       > (XEN) *** Serial inpu=
t
> to DOM0 (type 'CTRL-a' three times to switch input)
> >     >     >         >     >       >     >       > (XEN) null.c:353: 0
> <-- d0v0
> >     >     >         >     >       >     >       > (XEN) Freed 356kB ini=
t
> memory.
> >     >     >         >     >       >     >       > (XEN) d0v0 Unhandled
> SMC/HVC: 0x84000050
> >     >     >         >     >       >     >       > (XEN) d0v0 Unhandled
> SMC/HVC: 0x8600ff01
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER4
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER8
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER12
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER16
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER20
> >     >     >         >     >       >     >       > (XEN) d0v0: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER0
> >     >     >         >     >       >     >       > [    0.000000] Bootin=
g
> Linux on physical CPU 0x0000000000 [0x410fd034]
> >     >     >         >     >       >     >       > [    0.000000] Linux
> version 5.15.72-xilinx-v2022.1 (oe-user@oe-host)
> (aarch64-portable-linux-gcc (GCC)
> >     >     >         >     >       11.3.0, GNU ld (GNU
> >     >     >         >     >       >     >       Binutils)
> >     >     >         >     >       >     >       > 2.38.20220708) #1 SMP
> Tue Feb 21 05:47:54 UTC 2023
> >     >     >         >     >       >     >       > [    0.000000] Machin=
e
> model: D14 Viper Board - White Unit
> >     >     >         >     >       >     >       > [    0.000000] Xen
> 4.16 support found
> >     >     >         >     >       >     >       > [    0.000000] Zone
> ranges:
> >     >     >         >     >       >     >       > [    0.000000]   DMA
>    [mem 0x0000000010000000-0x000000007fffffff]
> >     >     >         >     >       >     >       > [    0.000000]   DMA3=
2
>    empty
> >     >     >         >     >       >     >       > [    0.000000]
> Normal   empty
> >     >     >         >     >       >     >       > [    0.000000] Movabl=
e
> zone start for each node
> >     >     >         >     >       >     >       > [    0.000000] Early
> memory node ranges
> >     >     >         >     >       >     >       > [    0.000000]   node
>   0: [mem 0x0000000010000000-0x000000001fffffff]
> >     >     >         >     >       >     >       > [    0.000000]   node
>   0: [mem 0x0000000022000000-0x0000000022147fff]
> >     >     >         >     >       >     >       > [    0.000000]   node
>   0: [mem 0x0000000022200000-0x0000000022347fff]
> >     >     >         >     >       >     >       > [    0.000000]   node
>   0: [mem 0x0000000024000000-0x0000000027ffffff]
> >     >     >         >     >       >     >       > [    0.000000]   node
>   0: [mem 0x0000000030000000-0x000000007fffffff]
> >     >     >         >     >       >     >       > [    0.000000] Initme=
m
> setup node 0 [mem 0x0000000010000000-0x000000007fffffff]
> >     >     >         >     >       >     >       > [    0.000000] On nod=
e
> 0, zone DMA: 8192 pages in unavailable ranges
> >     >     >         >     >       >     >       > [    0.000000] On nod=
e
> 0, zone DMA: 184 pages in unavailable ranges
> >     >     >         >     >       >     >       > [    0.000000] On nod=
e
> 0, zone DMA: 7352 pages in unavailable ranges
> >     >     >         >     >       >     >       > [    0.000000] cma:
> Reserved 256 MiB at 0x000000006e000000
> >     >     >         >     >       >     >       > [    0.000000] psci:
> probing for conduit method from DT.
> >     >     >         >     >       >     >       > [    0.000000] psci:
> PSCIv1.1 detected in firmware.
> >     >     >         >     >       >     >       > [    0.000000] psci:
> Using standard PSCI v0.2 function IDs
> >     >     >         >     >       >     >       > [    0.000000] psci:
> Trusted OS migration not required
> >     >     >         >     >       >     >       > [    0.000000] psci:
> SMC Calling Convention v1.1
> >     >     >         >     >       >     >       > [    0.000000] percpu=
:
> Embedded 16 pages/cpu s32792 r0 d32744 u65536
> >     >     >         >     >       >     >       > [    0.000000]
> Detected VIPT I-cache on CPU0
> >     >     >         >     >       >     >       > [    0.000000] CPU
> features: kernel page table isolation forced ON by KASLR
> >     >     >         >     >       >     >       > [    0.000000] CPU
> features: detected: Kernel page table isolation (KPTI)
> >     >     >         >     >       >     >       > [    0.000000] Built =
1
> zonelists, mobility grouping on.  Total pages: 403845
> >     >     >         >     >       >     >       > [    0.000000] Kernel
> command line: console=3Dhvc0 earlycon=3Dxen earlyprintk=3Dxen clk_ignore_=
unused
> fips=3D1
> >     >     >         >     >       root=3D/dev/ram0
> >     >     >         >     >       >     >       maxcpus=3D2
> >     >     >         >     >       >     >       > [    0.000000] Unknow=
n
> kernel command line parameters "earlyprintk=3Dxen fips=3D1", will be pass=
ed to
> user
> >     >     >         >     >       space.
> >     >     >         >     >       >     >       > [    0.000000] Dentry
> cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> >     >     >         >     >       >     >       > [    0.000000]
> Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> >     >     >         >     >       >     >       > [    0.000000] mem
> auto-init: stack:off, heap alloc:on, heap free:on
> >     >     >         >     >       >     >       > [    0.000000] mem
> auto-init: clearing system memory may take some time...
> >     >     >         >     >       >     >       > [    0.000000] Memory=
:
> 1121936K/1641024K available (9728K kernel code, 836K rwdata, 2396K rodata=
,
> 1536K
> >     >     >         >     >       init, 262K bss,
> >     >     >         >     >       >     >       256944K reserved,
> >     >     >         >     >       >     >       > 262144K cma-reserved)
> >     >     >         >     >       >     >       > [    0.000000] SLUB:
> HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
> >     >     >         >     >       >     >       > [    0.000000] rcu:
> Hierarchical RCU implementation.
> >     >     >         >     >       >     >       > [    0.000000] rcu:
> RCU event tracing is enabled.
> >     >     >         >     >       >     >       > [    0.000000] rcu:
> RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.
> >     >     >         >     >       >     >       > [    0.000000] rcu:
> RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> >     >     >         >     >       >     >       > [    0.000000] rcu:
> Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2
> >     >     >         >     >       >     >       > [    0.000000]
> NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> >     >     >         >     >       >     >       > [    0.000000] Root
> IRQ handler: gic_handle_irq
> >     >     >         >     >       >     >       > [    0.000000]
> arch_timer: cp15 timer(s) running at 100.00MHz (virt).
> >     >     >         >     >       >     >       > [    0.000000]
> clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles:
> 0x171024e7e0,
> >     >     >         >     >       max_idle_ns: 440795205315 ns
> >     >     >         >     >       >     >       > [    0.000000]
> sched_clock: 56 bits at 100MHz, resolution 10ns, wraps every 439804651110=
0ns
> >     >     >         >     >       >     >       > [    0.000258]
> Console: colour dummy device 80x25
> >     >     >         >     >       >     >       > [    0.310231] printk=
:
> console [hvc0] enabled
> >     >     >         >     >       >     >       > [    0.314403]
> Calibrating delay loop (skipped), value calculated using timer frequency.=
.
> 200.00 BogoMIPS
> >     >     >         >     >       (lpj=3D400000)
> >     >     >         >     >       >     >       > [    0.324851]
> pid_max: default: 32768 minimum: 301
> >     >     >         >     >       >     >       > [    0.329706] LSM:
> Security Framework initializing
> >     >     >         >     >       >     >       > [    0.334204] Yama:
> becoming mindful.
> >     >     >         >     >       >     >       > [    0.337865]
> Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> >     >     >         >     >       >     >       > [    0.345180]
> Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> >     >     >         >     >       >     >       > [    0.354743]
> xen:grant_table: Grant tables using version 1 layout
> >     >     >         >     >       >     >       > [    0.359132] Grant
> table initialized
> >     >     >         >     >       >     >       > [    0.362664]
> xen:events: Using FIFO-based ABI
> >     >     >         >     >       >     >       > [    0.366993] Xen:
> initializing cpu0
> >     >     >         >     >       >     >       > [    0.370515] rcu:
> Hierarchical SRCU implementation.
> >     >     >         >     >       >     >       > [    0.375930] smp:
> Bringing up secondary CPUs ...
> >     >     >         >     >       >     >       > (XEN) null.c:353: 1
> <-- d0v1
> >     >     >         >     >       >     >       > (XEN) d0v1: vGICD:
> unhandled word write 0x000000ffffffff to ICACTIVER0
> >     >     >         >     >       >     >       > [    0.382549]
> Detected VIPT I-cache on CPU1
> >     >     >         >     >       >     >       > [    0.388712] Xen:
> initializing cpu1
> >     >     >         >     >       >     >       > [    0.388743] CPU1:
> Booted secondary processor 0x0000000001 [0x410fd034]
> >     >     >         >     >       >     >       > [    0.388829] smp:
> Brought up 1 node, 2 CPUs
> >     >     >         >     >       >     >       > [    0.406941] SMP:
> Total of 2 processors activated.
> >     >     >         >     >       >     >       > [    0.411698] CPU
> features: detected: 32-bit EL0 Support
> >     >     >         >     >       >     >       > [    0.416888] CPU
> features: detected: CRC32 instructions
> >     >     >         >     >       >     >       > [    0.422121] CPU:
> All CPU(s) started at EL1
> >     >     >         >     >       >     >       > [    0.426248]
> alternatives: patching kernel code
> >     >     >         >     >       >     >       > [    0.431424]
> devtmpfs: initialized
> >     >     >         >     >       >     >       > [    0.441454] KASLR
> enabled
> >     >     >         >     >       >     >       > [    0.441602]
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s:
> >     >     >         >     >       7645041785100000 ns
> >     >     >         >     >       >     >       > [    0.448321] futex
> hash table entries: 512 (order: 3, 32768 bytes, linear)
> >     >     >         >     >       >     >       > [    0.496183] NET:
> Registered PF_NETLINK/PF_ROUTE protocol family
> >     >     >         >     >       >     >       > [    0.498277] DMA:
> preallocated 256 KiB GFP_KERNEL pool for atomic allocations
> >     >     >         >     >       >     >       > [    0.503772] DMA:
> preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> >     >     >         >     >       >     >       > [    0.511610] DMA:
> preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> >     >     >         >     >       >     >       > [    0.519478] audit:
> initializing netlink subsys (disabled)
> >     >     >         >     >       >     >       > [    0.524985] audit:
> type=3D2000 audit(0.336:1): state=3Dinitialized audit_enabled=3D0 res=3D1
> >     >     >         >     >       >     >       > [    0.529169]
> thermal_sys: Registered thermal governor 'step_wise'
> >     >     >         >     >       >     >       > [    0.533023]
> hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> >     >     >         >     >       >     >       > [    0.545608] ASID
> allocator initialised with 32768 entries
> >     >     >         >     >       >     >       > [    0.551030]
> xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB
> >     >     >         >     >       >     >       > [    0.559332]
> software IO TLB: mapped [mem 0x0000000011800000-0x0000000011c00000] (4MB)
> >     >     >         >     >       >     >       > [    0.583565] HugeTL=
B
> registered 1.00 GiB page size, pre-allocated 0 pages
> >     >     >         >     >       >     >       > [    0.584721] HugeTL=
B
> registered 32.0 MiB page size, pre-allocated 0 pages
> >     >     >         >     >       >     >       > [    0.591478] HugeTL=
B
> registered 2.00 MiB page size, pre-allocated 0 pages
> >     >     >         >     >       >     >       > [    0.598225] HugeTL=
B
> registered 64.0 KiB page size, pre-allocated 0 pages
> >     >     >         >     >       >     >       > [    0.636520] DRBG:
> Continuing without Jitter RNG
> >     >     >         >     >       >     >       > [    0.737187] raid6:
> neonx8   gen()  2143 MB/s
> >     >     >         >     >       >     >       > [    0.805294] raid6:
> neonx8   xor()  1589 MB/s
> >     >     >         >     >       >     >       > [    0.873406] raid6:
> neonx4   gen()  2177 MB/s
> >     >     >         >     >       >     >       > [    0.941499] raid6:
> neonx4   xor()  1556 MB/s
> >     >     >         >     >       >     >       > [    1.009612] raid6:
> neonx2   gen()  2072 MB/s
> >     >     >         >     >       >     >       > [    1.077715] raid6:
> neonx2   xor()  1430 MB/s
> >     >     >         >     >       >     >       > [    1.145834] raid6:
> neonx1   gen()  1769 MB/s
> >     >     >         >     >       >     >       > [    1.213935] raid6:
> neonx1   xor()  1214 MB/s
> >     >     >         >     >       >     >       > [    1.282046] raid6:
> int64x8  gen()  1366 MB/s
> >     >     >         >     >       >     >       > [    1.350132] raid6:
> int64x8  xor()   773 MB/s
> >     >     >         >     >       >     >       > [    1.418259] raid6:
> int64x4  gen()  1602 MB/s
> >     >     >         >     >       >     >       > [    1.486349] raid6:
> int64x4  xor()   851 MB/s
> >     >     >         >     >       >     >       > [    1.554464] raid6:
> int64x2  gen()  1396 MB/s
> >     >     >         >     >       >     >       > [    1.622561] raid6:
> int64x2  xor()   744 MB/s
> >     >     >         >     >       >     >       > [    1.690687] raid6:
> int64x1  gen()  1033 MB/s
> >     >     >         >     >       >     >       > [    1.758770] raid6:
> int64x1  xor()   517 MB/s
> >     >     >         >     >       >     >       > [    1.758809] raid6:
> using algorithm neonx4 gen() 2177 MB/s
> >     >     >         >     >       >     >       > [    1.762941] raid6:
> .... xor() 1556 MB/s, rmw enabled
> >     >     >         >     >       >     >       > [    1.767957] raid6:
> using neon recovery algorithm
> >     >     >         >     >       >     >       > [    1.772824]
> xen:balloon: Initialising balloon driver
> >     >     >         >     >       >     >       > [    1.778021] iommu:
> Default domain type: Translated
> >     >     >         >     >       >     >       > [    1.782584] iommu:
> DMA domain TLB invalidation policy: strict mode
> >     >     >         >     >       >     >       > [    1.789149] SCSI
> subsystem initialized
> >     >     >         >     >       >     >       > [    1.792820]
> usbcore: registered new interface driver usbfs
> >     >     >         >     >       >     >       > [    1.798254]
> usbcore: registered new interface driver hub
> >     >     >         >     >       >     >       > [    1.803626]
> usbcore: registered new device driver usb
> >     >     >         >     >       >     >       > [    1.808761]
> pps_core: LinuxPPS API ver. 1 registered
> >     >     >         >     >       >     >       > [    1.813716]
> pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <
> giometti@linux.it <mailto:giometti@linux.it> <mailto:giometti@linux.it
> <mailto:giometti@linux.it>> <mailto:giometti@linux.it <mailto:
> giometti@linux.it> <mailto:giometti@linux.it <mailto:giometti@linux.it>>>
> <mailto:giometti@linux.it <mailto:giometti@linux.it> <mailto:
> giometti@linux.it <mailto:giometti@linux.it>> <mailto:giometti@linux.it
> <mailto:giometti@linux.it> <mailto:giometti@linux.it <mailto:
> giometti@linux.it>>>>
> >     >     >         >     >       <mailto:giometti@linux.it <mailto:
> giometti@linux.it> <mailto:giometti@linux.it <mailto:giometti@linux.it>>
> <mailto:giometti@linux.it <mailto:giometti@linux.it> <mailto:
> giometti@linux.it <mailto:giometti@linux.it>>> <mailto:giometti@linux.it
> <mailto:giometti@linux.it> <mailto:giometti@linux.it <mailto:
> giometti@linux.it>> <mailto:giometti@linux.it <mailto:giometti@linux.it>
> <mailto:giometti@linux.it <mailto:giometti@linux.it>>>>>>
> >     >     >         >     >       >     >       > [    1.822903] PTP
> clock support registered
> >     >     >         >     >       >     >       > [    1.826893] EDAC
> MC: Ver: 3.0.0
> >     >     >         >     >       >     >       > [    1.830375]
> zynqmp-ipi-mbox mailbox@ff990400: Registered ZynqMP IPI mbox with TX/RX
> channels.
> >     >     >         >     >       >     >       > [    1.838863]
> zynqmp-ipi-mbox mailbox@ff990600: Registered ZynqMP IPI mbox with TX/RX
> channels.
> >     >     >         >     >       >     >       > [    1.847356]
> zynqmp-ipi-mbox mailbox@ff990800: Registered ZynqMP IPI mbox with TX/RX
> channels.
> >     >     >         >     >       >     >       > [    1.855907] FPGA
> manager framework
> >     >     >         >     >       >     >       > [    1.859952]
> clocksource: Switched to clocksource arch_sys_counter
> >     >     >         >     >       >     >       > [    1.871712] NET:
> Registered PF_INET protocol family
> >     >     >         >     >       >     >       > [    1.871838] IP
> idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
> >     >     >         >     >       >     >       > [    1.879392]
> tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes,
> linear)
> >     >     >         >     >       >     >       > [    1.887078]
> Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> >     >     >         >     >       >     >       > [    1.894846] TCP
> established hash table entries: 16384 (order: 5, 131072 bytes, linear)
> >     >     >         >     >       >     >       > [    1.902900] TCP
> bind hash table entries: 16384 (order: 6, 262144 bytes, linear)
> >     >     >         >     >       >     >       > [    1.910350] TCP:
> Hash tables configured (established 16384 bind 16384)
> >     >     >         >     >       >     >       > [    1.916778] UDP
> hash table entries: 1024 (order: 3, 32768 bytes, linear)
> >     >     >         >     >       >     >       > [    1.923509]
> UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
> >     >     >         >     >       >     >       > [    1.930759] NET:
> Registered PF_UNIX/PF_LOCAL protocol family
> >     >     >         >     >       >     >       > [    1.936834] RPC:
> Registered named UNIX socket transport module.
> >     >     >         >     >       >     >       > [    1.942342] RPC:
> Registered udp transport module.
> >     >     >         >     >       >     >       > [    1.947088] RPC:
> Registered tcp transport module.
> >     >     >         >     >       >     >       > [    1.951843] RPC:
> Registered tcp NFSv4.1 backchannel transport module.
> >     >     >         >     >       >     >       > [    1.958334] PCI:
> CLS 0 bytes, default 64
> >     >     >         >     >       >     >       > [    1.962709] Trying
> to unpack rootfs image as initramfs...
> >     >     >         >     >       >     >       > [    1.977090]
> workingset: timestamp_bits=3D62 max_order=3D19 bucket_order=3D0
> >     >     >         >     >       >     >       > [    1.982863]
> Installing knfsd (copyright (C) 1996 okir@monad.swb.de <mailto:
> okir@monad.swb.de> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de>>
> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de> <mailto:
> okir@monad.swb.de <mailto:okir@monad.swb.de>>> <mailto:okir@monad.swb.de
> <mailto:okir@monad.swb.de> <mailto:okir@monad.swb.de <mailto:
> okir@monad.swb.de>> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de>
> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de>>>> <mailto:
> okir@monad.swb.de <mailto:okir@monad.swb.de> <mailto:okir@monad.swb.de
> <mailto:okir@monad.swb.de>> <mailto:okir@monad.swb.de <mailto:
> okir@monad.swb.de> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de>>>
> <mailto:okir@monad.swb.de <mailto:okir@monad.swb.de> <mailto:
> okir@monad.swb.de <mailto:okir@monad.swb.de>> <mailto:okir@monad.swb.de
> <mailto:okir@monad.swb.de> <mailto:okir@monad.swb.de <mailto:
> okir@monad.swb.de>>>>>).
> >     >     >         >     >       >     >       > [    2.021045] NET:
> Registered PF_ALG protocol family
> >     >     >         >     >       >     >       > [    2.021122] xor:
> measuring software checksum speed
> >     >     >         >     >       >     >       > [    2.029347]
>  8regs           :  2366 MB/sec
> >     >     >         >     >       >     >       > [    2.033081]
>  32regs          :  2802 MB/sec
> >     >     >         >     >       >     >       > [    2.038223]
>  arm64_neon      :  2320 MB/sec
> >     >     >         >     >       >     >       > [    2.038385] xor:
> using function: 32regs (2802 MB/sec)
> >     >     >         >     >       >     >       > [    2.043614] Block
> layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
> >     >     >         >     >       >     >       > [    2.050959] io
> scheduler mq-deadline registered
> >     >     >         >     >       >     >       > [    2.055521] io
> scheduler kyber registered
> >     >     >         >     >       >     >       > [    2.068227]
> xen:xen_evtchn: Event-channel device installed
> >     >     >         >     >       >     >       > [    2.069281] Serial=
:
> 8250/16550 driver, 4 ports, IRQ sharing disabled
> >     >     >         >     >       >     >       > [    2.076190]
> cacheinfo: Unable to detect cache hierarchy for CPU 0
> >     >     >         >     >       >     >       > [    2.085548] brd:
> module loaded
> >     >     >         >     >       >     >       > [    2.089290] loop:
> module loaded
> >     >     >         >     >       >     >       > [    2.089341] Invali=
d
> max_queues (4), will use default max: 2.
> >     >     >         >     >       >     >       > [    2.094565] tun:
> Universal TUN/TAP device driver, 1.6
> >     >     >         >     >       >     >       > [    2.098655]
> xen_netfront: Initialising Xen virtual ethernet driver
> >     >     >         >     >       >     >       > [    2.104156]
> usbcore: registered new interface driver rtl8150
> >     >     >         >     >       >     >       > [    2.109813]
> usbcore: registered new interface driver r8152
> >     >     >         >     >       >     >       > [    2.115367]
> usbcore: registered new interface driver asix
> >     >     >         >     >       >     >       > [    2.120794]
> usbcore: registered new interface driver ax88179_178a
> >     >     >         >     >       >     >       > [    2.126934]
> usbcore: registered new interface driver cdc_ether
> >     >     >         >     >       >     >       > [    2.132816]
> usbcore: registered new interface driver cdc_eem
> >     >     >         >     >       >     >       > [    2.138527]
> usbcore: registered new interface driver net1080
> >     >     >         >     >       >     >       > [    2.144256]
> usbcore: registered new interface driver cdc_subset
> >     >     >         >     >       >     >       > [    2.150205]
> usbcore: registered new interface driver zaurus
> >     >     >         >     >       >     >       > [    2.155837]
> usbcore: registered new interface driver cdc_ncm
> >     >     >         >     >       >     >       > [    2.161550]
> usbcore: registered new interface driver r8153_ecm
> >     >     >         >     >       >     >       > [    2.168240]
> usbcore: registered new interface driver cdc_acm
> >     >     >         >     >       >     >       > [    2.173109]
> cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapte=
rs
> >     >     >         >     >       >     >       > [    2.181358]
> usbcore: registered new interface driver uas
> >     >     >         >     >       >     >       > [    2.186547]
> usbcore: registered new interface driver usb-storage
> >     >     >         >     >       >     >       > [    2.192643]
> usbcore: registered new interface driver ftdi_sio
> >     >     >         >     >       >     >       > [    2.198384]
> usbserial: USB Serial support registered for FTDI USB Serial Device
> >     >     >         >     >       >     >       > [    2.206118]
> udc-core: couldn't find an available UDC - added [g_mass_storage] to list
> of pending
> >     >     >         >     >       drivers
> >     >     >         >     >       >     >       > [    2.215332]
> i2c_dev: i2c /dev entries driver
> >     >     >         >     >       >     >       > [    2.220467] xen_wd=
t
> xen_wdt: initialized (timeout=3D60s, nowayout=3D0)
> >     >     >         >     >       >     >       > [    2.225923]
> device-mapper: uevent: version 1.0.3
> >     >     >         >     >       >     >       > [    2.230668]
> device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com>> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com>>> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com>> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com> <mailto:
> dm-devel@redhat.com <mailto:dm-devel@redhat.com>>>>
> >     >     >         >     >       <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com>> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com>>> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com>> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com> <mailto:dm-devel@redhat.com <mailto:
> dm-devel@redhat.com>>>>>
> >     >     >         >     >       >     >       > [    2.239315] EDAC
> MC0: Giving out device to module 1 controller synps_ddr_controller: DEV
> synps_edac
> >     >     >         >     >       (INTERRUPT)
> >     >     >         >     >       >     >       > [    2.249405] EDAC
> DEVICE0: Giving out device to module zynqmp-ocm-edac controller zynqmp_oc=
m:
> DEV
> >     >     >         >     >       >     >
>  ff960000.memory-controller (INTERRUPT)
> >     >     >         >     >       >     >       > [    2.261719] sdhci:
> Secure Digital Host Controller Interface driver
> >     >     >         >     >       >     >       > [    2.267487] sdhci:
> Copyright(c) Pierre Ossman
> >     >     >         >     >       >     >       > [    2.271890]
> sdhci-pltfm: SDHCI platform and OF driver helper
> >     >     >         >     >       >     >       > [    2.278157]
> ledtrig-cpu: registered to indicate activity on CPUs
> >     >     >         >     >       >     >       > [    2.283816]
> zynqmp_firmware_probe Platform Management API v1.1
> >     >     >         >     >       >     >       > [    2.289554]
> zynqmp_firmware_probe Trustzone version v1.0
> >     >     >         >     >       >     >       > [    2.327875]
> securefw securefw: securefw probed
> >     >     >         >     >       >     >       > [    2.328324] alg: N=
o
> test for xilinx-zynqmp-aes (zynqmp-aes)
> >     >     >         >     >       >     >       > [    2.332563]
> zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: AES Successfully Register=
ed
> >     >     >         >     >       >     >       > [    2.341183] alg: N=
o
> test for xilinx-zynqmp-rsa (zynqmp-rsa)
> >     >     >         >     >       >     >       > [    2.347667]
> remoteproc remoteproc0: ff9a0000.rf5ss:r5f_0 is available
> >     >     >         >     >       >     >       > [    2.353003]
> remoteproc remoteproc1: ff9a0000.rf5ss:r5f_1 is available
> >     >     >         >     >       >     >       > [    2.362605]
> fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered
> >     >     >         >     >       >     >       > [    2.366540]
> viper-xen-proxy viper-xen-proxy: Viper Xen Proxy registered
> >     >     >         >     >       >     >       > [    2.372525]
> viper-vdpp a4000000.vdpp: Device Tree Probing
> >     >     >         >     >       >     >       > [    2.377778]
> viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen: =
32
> >     >     >         >     >       >     >       > [    2.386432]
> viper-vdpp a4000000.vdpp: Unable to register tamper handler. Retrying...
> >     >     >         >     >       >     >       > [    2.394094]
> viper-vdpp-net a5000000.vdpp_net: Device Tree Probing
> >     >     >         >     >       >     >       > [    2.399854]
> viper-vdpp-net a5000000.vdpp_net: Device registered
> >     >     >         >     >       >     >       > [    2.405931]
> viper-vdpp-stat a8000000.vdpp_stat: Device Tree Probing
> >     >     >         >     >       >     >       > [    2.412037]
> viper-vdpp-stat a8000000.vdpp_stat: Build parameters: VTI Count: 512 Even=
t
> Count: 32
> >     >     >         >     >       >     >       > [    2.420856] defaul=
t
> preset
> >     >     >         >     >       >     >       > [    2.423797]
> viper-vdpp-stat a8000000.vdpp_stat: Device registered
> >     >     >         >     >       >     >       > [    2.430054]
> viper-vdpp-rng ac000000.vdpp_rng: Device Tree Probing
> >     >     >         >     >       >     >       > [    2.435948]
> viper-vdpp-rng ac000000.vdpp_rng: Device registered
> >     >     >         >     >       >     >       > [    2.441976] vmcu
> driver init
> >     >     >         >     >       >     >       > [    2.444922] VMCU: =
:
> (240:0) registered
> >     >     >         >     >       >     >       > [    2.444956] In K81
> Updater init
> >     >     >         >     >       >     >       > [    2.449003] pktgen=
:
> Packet Generator for packet performance testing. Version: 2.75
> >     >     >         >     >       >     >       > [    2.468833]
> Initializing XFRM netlink socket
> >     >     >         >     >       >     >       > [    2.468902] NET:
> Registered PF_PACKET protocol family
> >     >     >         >     >       >     >       > [    2.472729] Bridge
> firewalling registered
> >     >     >         >     >       >     >       > [    2.476785] 8021q:
> 802.1Q VLAN Support v1.8
> >     >     >         >     >       >     >       > [    2.481341]
> registered taskstats version 1
> >     >     >         >     >       >     >       > [    2.486394] Btrfs
> loaded, crc32c=3Dcrc32c-generic, zoned=3Dno, fsverity=3Dno
> >     >     >         >     >       >     >       > [    2.503145]
> ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 36, base_baud =3D 625=
0000)
> is a xuartps
> >     >     >         >     >       >     >       > [    2.507103]
> of-fpga-region fpga-full: FPGA Region probed
> >     >     >         >     >       >     >       > [    2.512986]
> xilinx-zynqmp-dma fd500000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.520267]
> xilinx-zynqmp-dma fd510000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.528239]
> xilinx-zynqmp-dma fd520000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.536152]
> xilinx-zynqmp-dma fd530000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.544153]
> xilinx-zynqmp-dma fd540000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.552127]
> xilinx-zynqmp-dma fd550000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.560178]
> xilinx-zynqmp-dma ffa80000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.567987]
> xilinx-zynqmp-dma ffa90000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.576018]
> xilinx-zynqmp-dma ffaa0000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.583889]
> xilinx-zynqmp-dma ffab0000.dma-controller: ZynqMP DMA driver Probe succes=
s
> >     >     >         >     >       >     >       > [    2.946379] spi-no=
r
> spi0.0: mt25qu512a (131072 Kbytes)
> >     >     >         >     >       >     >       > [    2.946467] 2
> fixed-partitions partitions found on MTD device spi0.0
> >     >     >         >     >       >     >       > [    2.952393]
> Creating 2 MTD partitions on "spi0.0":
> >     >     >         >     >       >     >       > [    2.957231]
> 0x000004000000-0x000008000000 : "bank A"
> >     >     >         >     >       >     >       > [    2.963332]
> 0x000000000000-0x000004000000 : "bank B"
> >     >     >         >     >       >     >       > [    2.968694] macb
> ff0b0000.ethernet: Not enabling partial store and forward
> >     >     >         >     >       >     >       > [    2.975333] macb
> ff0b0000.ethernet eth0: Cadence GEM rev 0x50070106 at 0xff0b0000 irq 25
> >     >     >         >     >       (18:41:fe:0f:ff:02)
> >     >     >         >     >       >     >       > [    2.984472] macb
> ff0c0000.ethernet: Not enabling partial store and forward
> >     >     >         >     >       >     >       > [    2.992144] macb
> ff0c0000.ethernet eth1: Cadence GEM rev 0x50070106 at 0xff0c0000 irq 26
> >     >     >         >     >       (18:41:fe:0f:ff:03)
> >     >     >         >     >       >     >       > [    3.001043]
> viper_enet viper_enet: Viper power GPIOs initialised
> >     >     >         >     >       >     >       > [    3.007313]
> viper_enet viper_enet vnet0 (uninitialized): Validate interface QSGMII
> >     >     >         >     >       >     >       > [    3.014914]
> viper_enet viper_enet vnet1 (uninitialized): Validate interface QSGMII
> >     >     >         >     >       >     >       > [    3.022138]
> viper_enet viper_enet vnet1 (uninitialized): Validate interface type 18
> >     >     >         >     >       >     >       > [    3.030274]
> viper_enet viper_enet vnet2 (uninitialized): Validate interface QSGMII
> >     >     >         >     >       >     >       > [    3.037785]
> viper_enet viper_enet vnet3 (uninitialized): Validate interface QSGMII
> >     >     >         >     >       >     >       > [    3.045301]
> viper_enet viper_enet: Viper enet registered
> >     >     >         >     >       >     >       > [    3.050958]
> xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM
> >     >     >         >     >       >     >       > [    3.057135]
> xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM
> >     >     >         >     >       >     >       > [    3.063538]
> xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM
> >     >     >         >     >       >     >       > [    3.069920]
> xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM
> >     >     >         >     >       >     >       > [    3.097729] si70xx=
:
> probe of 2-0040 failed with error -5
> >     >     >         >     >       >     >       > [    3.098042]
> cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer with timeout 60s
> >     >     >         >     >       >     >       > [    3.105111]
> cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer with timeout 10s
> >     >     >         >     >       >     >       > [    3.112457]
> viper-tamper viper-tamper: Device registered
> >     >     >         >     >       >     >       > [    3.117593]
> active_bank active_bank: boot bank: 1
> >     >     >         >     >       >     >       > [    3.122184]
> active_bank active_bank: boot mode: (0x02) qspi32
> >     >     >         >     >       >     >       > [    3.128247]
> viper-vdpp a4000000.vdpp: Device Tree Probing
> >     >     >         >     >       >     >       > [    3.133439]
> viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen: =
32
> >     >     >         >     >       >     >       > [    3.142151]
> viper-vdpp a4000000.vdpp: Tamper handler registered
> >     >     >         >     >       >     >       > [    3.147438]
> viper-vdpp a4000000.vdpp: Device registered
> >     >     >         >     >       >     >       > [    3.153007]
> lpc55_l2 spi1.0: registered handler for protocol 0
> >     >     >         >     >       >     >       > [    3.158582]
> lpc55_user lpc55_user: The major number for your device is 236
> >     >     >         >     >       >     >       > [    3.165976]
> lpc55_l2 spi1.0: registered handler for protocol 1
> >     >     >         >     >       >     >       > [    3.181999]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> >     >     >         >     >       >     >       > [    3.182856]
> rtc-lpc55 rtc_lpc55: registered as rtc0
> >     >     >         >     >       >     >       > [    3.188656]
> lpc55_l2 spi1.0: (2) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.193744]
> lpc55_l2 spi1.0: (3) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.198848]
> lpc55_l2 spi1.0: (4) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.202932] mmc0:
> SDHCI controller on ff160000.mmc [ff160000.mmc] using ADMA 64-bit
> >     >     >         >     >       >     >       > [    3.210689]
> lpc55_l2 spi1.0: (5) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.215694]
> lpc55_l2 spi1.0: rx error: -110
> >     >     >         >     >       >     >       > [    3.284438] mmc0:
> new HS200 MMC card at address 0001
> >     >     >         >     >       >     >       > [    3.285179]
> mmcblk0: mmc0:0001 SEM16G 14.6 GiB
> >     >     >         >     >       >     >       > [    3.291784]
>  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8
> >     >     >         >     >       >     >       > [    3.293915]
> mmcblk0boot0: mmc0:0001 SEM16G 4.00 MiB
> >     >     >         >     >       >     >       > [    3.299054]
> mmcblk0boot1: mmc0:0001 SEM16G 4.00 MiB
> >     >     >         >     >       >     >       > [    3.303905]
> mmcblk0rpmb: mmc0:0001 SEM16G 4.00 MiB, chardev (244:0)
> >     >     >         >     >       >     >       > [    3.582676]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> >     >     >         >     >       >     >       > [    3.583332]
> rtc-lpc55 rtc_lpc55: hctosys: unable to read the hardware clock
> >     >     >         >     >       >     >       > [    3.591252]
> cdns-i2c ff020000.i2c: recovery information complete
> >     >     >         >     >       >     >       > [    3.597085] at24
> 0-0050: supply vcc not found, using dummy regulator
> >     >     >         >     >       >     >       > [    3.603011]
> lpc55_l2 spi1.0: (2) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.608093] at24
> 0-0050: 256 byte spd EEPROM, read-only
> >     >     >         >     >       >     >       > [    3.613620]
> lpc55_l2 spi1.0: (3) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.619362]
> lpc55_l2 spi1.0: (4) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.624224]
> rtc-rv3028 0-0052: registered as rtc1
> >     >     >         >     >       >     >       > [    3.628343]
> lpc55_l2 spi1.0: (5) mcu still not ready?
> >     >     >         >     >       >     >       > [    3.633253]
> lpc55_l2 spi1.0: rx error: -110
> >     >     >         >     >       >     >       > [    3.639104]
> k81_bootloader 0-0010: probe
> >     >     >         >     >       >     >       > [    3.641628] VMCU: =
:
> (235:0) registered
> >     >     >         >     >       >     >       > [    3.641635]
> k81_bootloader 0-0010: probe completed
> >     >     >         >     >       >     >       > [    3.668346]
> cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 28
> >     >     >         >     >       >     >       > [    3.669154]
> cdns-i2c ff030000.i2c: recovery information complete
> >     >     >         >     >       >     >       > [    3.675412] lm75
> 1-0048: supply vs not found, using dummy regulator
> >     >     >         >     >       >     >       > [    3.682920] lm75
> 1-0048: hwmon1: sensor 'tmp112'
> >     >     >         >     >       >     >       > [    3.686548] i2c
> i2c-1: Added multiplexed i2c bus 3
> >     >     >         >     >       >     >       > [    3.690795] i2c
> i2c-1: Added multiplexed i2c bus 4
> >     >     >         >     >       >     >       > [    3.695629] i2c
> i2c-1: Added multiplexed i2c bus 5
> >     >     >         >     >       >     >       > [    3.700492] i2c
> i2c-1: Added multiplexed i2c bus 6
> >     >     >         >     >       >     >       > [    3.705157] pca954=
x
> 1-0070: registered 4 multiplexed busses for I2C switch pca9546
> >     >     >         >     >       >     >       > [    3.713049] at24
> 1-0054: supply vcc not found, using dummy regulator
> >     >     >         >     >       >     >       > [    3.720067] at24
> 1-0054: 1024 byte 24c08 EEPROM, read-only
> >     >     >         >     >       >     >       > [    3.724761]
> cdns-i2c ff030000.i2c: 100 kHz mmio ff030000 irq 29
> >     >     >         >     >       >     >       > [    3.731272] sfp
> viper_enet:sfp-eth1: Host maximum power 2.0W
> >     >     >         >     >       >     >       > [    3.737549]
> sfp_register_socket: got sfp_bus
> >     >     >         >     >       >     >       > [    3.740709]
> sfp_register_socket: register sfp_bus
> >     >     >         >     >       >     >       > [    3.745459]
> sfp_register_bus: ops ok!
> >     >     >         >     >       >     >       > [    3.749179]
> sfp_register_bus: Try to attach
> >     >     >         >     >       >     >       > [    3.753419]
> sfp_register_bus: Attach succeeded
> >     >     >         >     >       >     >       > [    3.757914]
> sfp_register_bus: upstream ops attach
> >     >     >         >     >       >     >       > [    3.762677]
> sfp_register_bus: Bus registered
> >     >     >         >     >       >     >       > [    3.766999]
> sfp_register_socket: register sfp_bus succeeded
> >     >     >         >     >       >     >       > [    3.775870]
> of_cfs_init
> >     >     >         >     >       >     >       > [    3.776000]
> of_cfs_init: OK
> >     >     >         >     >       >     >       > [    3.778211] clk:
> Not disabling unused clocks
> >     >     >         >     >       >     >       > [   11.278477] Freein=
g
> initrd memory: 206056K
> >     >     >         >     >       >     >       > [   11.279406] Freein=
g
> unused kernel memory: 1536K
> >     >     >         >     >       >     >       > [   11.314006] Checke=
d
> W+X mappings: passed, no W+X pages found
> >     >     >         >     >       >     >       > [   11.314142] Run
> /init as init process
> >     >     >         >     >       >     >       > INIT: version 3.01
> booting
> >     >     >         >     >       >     >       > fsck (busybox 1.35.0)
> >     >     >         >     >       >     >       > /dev/mmcblk0p1: clean=
,
> 12/102400 files, 238162/409600 blocks
> >     >     >         >     >       >     >       > /dev/mmcblk0p2: clean=
,
> 12/102400 files, 171972/409600 blocks
> >     >     >         >     >       >     >       > /dev/mmcblk0p3 was no=
t
> cleanly unmounted, check forced.
> >     >     >         >     >       >     >       > /dev/mmcblk0p3:
> 20/4096 files (0.0% non-contiguous), 663/16384 blocks
> >     >     >         >     >       >     >       > [   11.553073] EXT4-f=
s
> (mmcblk0p3): mounted filesystem without journal. Opts: (null). Quota mode=
:
> >     >     >         >     >       disabled.
> >     >     >         >     >       >     >       > Starting random numbe=
r
> generator daemon.
> >     >     >         >     >       >     >       > [   11.580662] random=
:
> crng init done
> >     >     >         >     >       >     >       > Starting udev
> >     >     >         >     >       >     >       > [   11.613159]
> udevd[142]: starting version 3.2.10
> >     >     >         >     >       >     >       > [   11.620385]
> udevd[143]: starting eudev-3.2.10
> >     >     >         >     >       >     >       > [   11.704481] macb
> ff0b0000.ethernet control_red: renamed from eth0
> >     >     >         >     >       >     >       > [   11.720264] macb
> ff0c0000.ethernet control_black: renamed from eth1
> >     >     >         >     >       >     >       > [   12.063396]
> ip_local_port_range: prefer different parity for start/end values.
> >     >     >         >     >       >     >       > [   12.084801]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> >     >     >         >     >       >     >       > hwclock: RTC_RD_TIME:
> Invalid exchange
> >     >     >         >     >       >     >       > Mon Feb 27 08:40:53
> UTC 2023
> >     >     >         >     >       >     >       > [   12.115309]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_set_time: bad result
> >     >     >         >     >       >     >       > hwclock: RTC_SET_TIME=
:
> Invalid exchange
> >     >     >         >     >       >     >       > [   12.131027]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> >     >     >         >     >       >     >       > Starting mcud
> >     >     >         >     >       >     >       > INIT: Entering
> runlevel: 5
> >     >     >         >     >       >     >       > Configuring network
> interfaces... done.
> >     >     >         >     >       >     >       > resetting network
> interface
> >     >     >         >     >       >     >       > [   12.718295] macb
> ff0b0000.ethernet control_red: PHY [ff0b0000.ethernet-ffffffff:02] driver
> [Xilinx
> >     >     >         >     >       PCS/PMA PHY] (irq=3DPOLL)
> >     >     >         >     >       >     >       > [   12.723919] macb
> ff0b0000.ethernet control_red: configuring for phy/gmii link mode
> >     >     >         >     >       >     >       > [   12.732151] pps
> pps0: new PPS source ptp0
> >     >     >         >     >       >     >       > [   12.735563] macb
> ff0b0000.ethernet: gem-ptp-timer ptp clock registered.
> >     >     >         >     >       >     >       > [   12.745724] macb
> ff0c0000.ethernet control_black: PHY [ff0c0000.ethernet-ffffffff:01] driv=
er
> [Xilinx
> >     >     >         >     >       PCS/PMA PHY]
> >     >     >         >     >       >     >       (irq=3DPOLL)
> >     >     >         >     >       >     >       > [   12.753469] macb
> ff0c0000.ethernet control_black: configuring for phy/gmii link mode
> >     >     >         >     >       >     >       > [   12.761804] pps
> pps1: new PPS source ptp1
> >     >     >         >     >       >     >       > [   12.765398] macb
> ff0c0000.ethernet: gem-ptp-timer ptp clock registered.
> >     >     >         >     >       >     >       > Auto-negotiation: off
> >     >     >         >     >       >     >       > Auto-negotiation: off
> >     >     >         >     >       >     >       > [   16.828151] macb
> ff0b0000.ethernet control_red: unable to generate target frequency:
> 125000000 Hz
> >     >     >         >     >       >     >       > [   16.834553] macb
> ff0b0000.ethernet control_red: Link is Up - 1Gbps/Full - flow control off
> >     >     >         >     >       >     >       > [   16.860552] macb
> ff0c0000.ethernet control_black: unable to generate target frequency:
> 125000000 Hz
> >     >     >         >     >       >     >       > [   16.867052] macb
> ff0c0000.ethernet control_black: Link is Up - 1Gbps/Full - flow control o=
ff
> >     >     >         >     >       >     >       > Starting Failsafe
> Secure Shell server in port 2222: sshd
> >     >     >         >     >       >     >       > done.
> >     >     >         >     >       >     >       > Starting rpcbind
> daemon...done.
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > [   17.093019]
> rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> >     >     >         >     >       >     >       > hwclock: RTC_RD_TIME:
> Invalid exchange
> >     >     >         >     >       >     >       > Starting State Manage=
r
> Service
> >     >     >         >     >       >     >       > Start state-manager
> restarter...
> >     >     >         >     >       >     >       > (XEN) d0v1 Forwarding
> AES operation: 3254779951
> >     >     >         >     >       >     >       > Starting
> /usr/sbin/xenstored....[   17.265256] BTRFS: device fsid
> 80efc224-c202-4f8e-a949-4dae7f04a0aa
> >     >     >         >     >       devid 1 transid 744
> >     >     >         >     >       >     >       /dev/dm-0
> >     >     >         >     >       >     >       > scanned by udevd (385=
)
> >     >     >         >     >       >     >       > [   17.349933] BTRFS
> info (device dm-0): disk space caching is enabled
> >     >     >         >     >       >     >       > [   17.350670] BTRFS
> info (device dm-0): has skinny extents
> >     >     >         >     >       >     >       > [   17.364384] BTRFS
> info (device dm-0): enabling ssd optimizations
> >     >     >         >     >       >     >       > [   17.830462] BTRFS:
> device fsid 27ff666b-f4e5-4f90-9054-c210db5b2e2e devid 1 transid 6
> >     >     >         >     >       /dev/mapper/client_prov scanned by
> >     >     >         >     >       >     >       mkfs.btrfs
> >     >     >         >     >       >     >       > (526)
> >     >     >         >     >       >     >       > [   17.872699] BTRFS
> info (device dm-1): using free space tree
> >     >     >         >     >       >     >       > [   17.872771] BTRFS
> info (device dm-1): has skinny extents
> >     >     >         >     >       >     >       > [   17.878114] BTRFS
> info (device dm-1): flagging fs with big metadata feature
> >     >     >         >     >       >     >       > [   17.894289] BTRFS
> info (device dm-1): enabling ssd optimizations
> >     >     >         >     >       >     >       > [   17.895695] BTRFS
> info (device dm-1): checking UUID tree
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > Setting domain 0 name=
,
> domid and JSON config...
> >     >     >         >     >       >     >       > Done setting up Dom0
> >     >     >         >     >       >     >       > Starting xenconsoled.=
..
> >     >     >         >     >       >     >       > Starting QEMU as disk
> backend for dom0
> >     >     >         >     >       >     >       > Starting domain
> watchdog daemon: xenwatchdogd startup
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > [   18.408647] BTRFS:
> device fsid 5e08d5e9-bc2a-46b9-af6a-44c7087b8921 devid 1 transid 6
> >     >     >         >     >       /dev/mapper/client_config scanned by
> >     >     >         >     >       >     >       mkfs.btrfs
> >     >     >         >     >       >     >       > (574)
> >     >     >         >     >       >     >       > [done]
> >     >     >         >     >       >     >       > [   18.465552] BTRFS
> info (device dm-2): using free space tree
> >     >     >         >     >       >     >       > [   18.465629] BTRFS
> info (device dm-2): has skinny extents
> >     >     >         >     >       >     >       > [   18.471002] BTRFS
> info (device dm-2): flagging fs with big metadata feature
> >     >     >         >     >       >     >       > Starting crond: [
> 18.482371] BTRFS info (device dm-2): enabling ssd optimizations
> >     >     >         >     >       >     >       > [   18.486659] BTRFS
> info (device dm-2): checking UUID tree
> >     >     >         >     >       >     >       > OK
> >     >     >         >     >       >     >       > starting rsyslogd ...
> Log partition ready after 0 poll loops
> >     >     >         >     >       >     >       > done
> >     >     >         >     >       >     >       > rsyslogd: cannot
> connect to 172.18.0.1:514 <http://172.18.0.1:514> <http://172.18.0.1:514 =
<
> http://172.18.0.1:514>> <http://172.18.0.1:514 <http://172.18.0.1:514> <
> http://172.18.0.1:514 <http://172.18.0.1:514>>> <http://172.18.0.1:514 <
> http://172.18.0.1:514> <http://172.18.0.1:514 <http://172.18.0.1:514>> <
> http://172.18.0.1:514 <http://172.18.0.1:514> <http://172.18.0.1:514 <
> http://172.18.0.1:514>>>> <http://172.18.0.1:514 <http://172.18.0.1:514> =
<
> http://172.18.0.1:514 <http://172.18.0.1:514>> <http://172.18.0.1:514 <
> http://172.18.0.1:514> <http://172.18.0.1:514 <http://172.18.0.1:514>>> <
> http://172.18.0.1:514 <http://172.18.0.1:514> <http://172.18.0.1:514 <
> http://172.18.0.1:514>> <http://172.18.0.1:514 <http://172.18.0.1:514> <
> http://172.18.0.1:514 <http://172.18.0.1:514>>>>>: Network is unreachable
> [v8.2208.0 try
> >     >     >         >     >       https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>>>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>>> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>> <https://www.rsyslog.com/e/2027
> >     <https://www.rsyslog.com/e/2027> <https://www.rsyslog.com/e/2027 <
> https://www.rsyslog.com/e/2027>>>>> ]
> >     >     >         >     >       >     >       > [   18.670637] BTRFS:
> device fsid 39d7d9e1-967d-478e-94ae-690deb722095 devid 1 transid 608
> /dev/dm-3
> >     >     >         >     >       scanned by udevd (518)
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > Please insert USB
> token and enter your role in login prompt.
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > login:
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > Regards,
> >     >     >         >     >       >     >       > O.
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       > =D0=BF=D0=BD, 24 =D0=
=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2
> 23:39, Stefano Stabellini <sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>>:
> >     >     >         >     >       >     >       >       Hi Oleg,
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       Here is the
> issue from your logs:
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       SError Interrup=
t
> on CPU0, code 0xbe000000 -- SError
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       SErrors are
> special signals to notify software of serious hardware
> >     >     >         >     >       >     >       >       errors.
> Something is going very wrong. Defective hardware is a
> >     >     >         >     >       >     >       >       possibility.
> Another possibility if software accessing address ranges
> >     >     >         >     >       >     >       >       that it is not
> supposed to, sometimes it causes SErrors.
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       Cheers,
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       Stefano
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       On Mon, 24 Apr
> 2023, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >       > Hello,
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       > Thanks guys.
> >     >     >         >     >       >     >       >       > I found out
> where the problem was.
> >     >     >         >     >       >     >       >       > Now dom0
> booted more. But I have a new one.
> >     >     >         >     >       >     >       >       > This is a
> kernel panic during Dom0 loading.
> >     >     >         >     >       >     >       >       > Maybe someone
> is able to suggest something ?
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       > Regards,
> >     >     >         >     >       >     >       >       > O.
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       > [    3.771362=
]
> sfp_register_bus: upstream ops attach
> >     >     >         >     >       >     >       >       > [    3.776119=
]
> sfp_register_bus: Bus registered
> >     >     >         >     >       >     >       >       > [    3.780459=
]
> sfp_register_socket: register sfp_bus succeeded
> >     >     >         >     >       >     >       >       > [    3.789399=
]
> of_cfs_init
> >     >     >         >     >       >     >       >       > [    3.789499=
]
> of_cfs_init: OK
> >     >     >         >     >       >     >       >       > [    3.791685=
]
> clk: Not disabling unused clocks
> >     >     >         >     >       >     >       >       > [   11.010355=
]
> SError Interrupt on CPU0, code 0xbe000000 -- SError
> >     >     >         >     >       >     >       >       > [   11.010380=
]
> CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
> >     >     >         >     >       >     >       >       > [   11.010393=
]
> Workqueue: events_unbound async_run_entry_fn
> >     >     >         >     >       >     >       >       > [   11.010414=
]
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> >     >     >         >     >       >     >       >       > [   11.010422=
]
> pc : simple_write_end+0xd0/0x130
> >     >     >         >     >       >     >       >       > [   11.010431=
]
> lr : generic_perform_write+0x118/0x1e0
> >     >     >         >     >       >     >       >       > [   11.010438=
]
> sp : ffffffc00809b910
> >     >     >         >     >       >     >       >       > [   11.010441=
]
> x29: ffffffc00809b910 x28: 0000000000000000 x27: ffffffef69ba88c0
> >     >     >         >     >       >     >       >       > [   11.010451=
]
> x26: 0000000000003eec x25: ffffff807515db00 x24: 0000000000000000
> >     >     >         >     >       >     >       >       > [   11.010459=
]
> x23: ffffffc00809ba90 x22: 0000000002aac000 x21: ffffff807315a260
> >     >     >         >     >       >     >       >       > [   11.010472=
]
> x20: 0000000000001000 x19: fffffffe02000000 x18: 0000000000000000
> >     >     >         >     >       >     >       >       > [   11.010481=
]
> x17: 00000000ffffffff x16: 0000000000008000 x15: 0000000000000000
> >     >     >         >     >       >     >       >       > [   11.010490=
]
> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> >     >     >         >     >       >     >       >       > [   11.010498=
]
> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> >     >     >         >     >       >     >       >       > [   11.010507=
]
> x8 : 0000000000000000 x7 : ffffffef693ba680 x6 : 000000002d89b700
> >     >     >         >     >       >     >       >       > [   11.010515=
]
> x5 : fffffffe02000000 x4 : ffffff807315a3c8 x3 : 0000000000001000
> >     >     >         >     >       >     >       >       > [   11.010524=
]
> x2 : 0000000002aab000 x1 : 0000000000000001 x0 : 0000000000000005
> >     >     >         >     >       >     >       >       > [   11.010534=
]
> Kernel panic - not syncing: Asynchronous SError Interrupt
> >     >     >         >     >       >     >       >       > [   11.010539=
]
> CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
> >     >     >         >     >       >     >       >       > [   11.010545=
]
> Hardware name: D14 Viper Board - White Unit (DT)
> >     >     >         >     >       >     >       >       > [   11.010548=
]
> Workqueue: events_unbound async_run_entry_fn
> >     >     >         >     >       >     >       >       > [   11.010556=
]
> Call trace:
> >     >     >         >     >       >     >       >       > [   11.010558=
]
>  dump_backtrace+0x0/0x1c4
> >     >     >         >     >       >     >       >       > [   11.010567=
]
>  show_stack+0x18/0x2c
> >     >     >         >     >       >     >       >       > [   11.010574=
]
>  dump_stack_lvl+0x7c/0xa0
> >     >     >         >     >       >     >       >       > [   11.010583=
]
>  dump_stack+0x18/0x34
> >     >     >         >     >       >     >       >       > [   11.010588=
]
>  panic+0x14c/0x2f8
> >     >     >         >     >       >     >       >       > [   11.010597=
]
>  print_tainted+0x0/0xb0
> >     >     >         >     >       >     >       >       > [   11.010606=
]
>  arm64_serror_panic+0x6c/0x7c
> >     >     >         >     >       >     >       >       > [   11.010614=
]
>  do_serror+0x28/0x60
> >     >     >         >     >       >     >       >       > [   11.010621=
]
>  el1h_64_error_handler+0x30/0x50
> >     >     >         >     >       >     >       >       > [   11.010628=
]
>  el1h_64_error+0x78/0x7c
> >     >     >         >     >       >     >       >       > [   11.010633=
]
>  simple_write_end+0xd0/0x130
> >     >     >         >     >       >     >       >       > [   11.010639=
]
>  generic_perform_write+0x118/0x1e0
> >     >     >         >     >       >     >       >       > [   11.010644=
]
>  __generic_file_write_iter+0x138/0x1c4
> >     >     >         >     >       >     >       >       > [   11.010650=
]
>  generic_file_write_iter+0x78/0xd0
> >     >     >         >     >       >     >       >       > [   11.010656=
]
>  __kernel_write+0xfc/0x2ac
> >     >     >         >     >       >     >       >       > [   11.010665=
]
>  kernel_write+0x88/0x160
> >     >     >         >     >       >     >       >       > [   11.010673=
]
>  xwrite+0x44/0x94
> >     >     >         >     >       >     >       >       > [   11.010680=
]
>  do_copy+0xa8/0x104
> >     >     >         >     >       >     >       >       > [   11.010686=
]
>  write_buffer+0x38/0x58
> >     >     >         >     >       >     >       >       > [   11.010692=
]
>  flush_buffer+0x4c/0xbc
> >     >     >         >     >       >     >       >       > [   11.010698=
]
>  __gunzip+0x280/0x310
> >     >     >         >     >       >     >       >       > [   11.010704=
]
>  gunzip+0x1c/0x28
> >     >     >         >     >       >     >       >       > [   11.010709=
]
>  unpack_to_rootfs+0x170/0x2b0
> >     >     >         >     >       >     >       >       > [   11.010715=
]
>  do_populate_rootfs+0x80/0x164
> >     >     >         >     >       >     >       >       > [   11.010722=
]
>  async_run_entry_fn+0x48/0x164
> >     >     >         >     >       >     >       >       > [   11.010728=
]
>  process_one_work+0x1e4/0x3a0
> >     >     >         >     >       >     >       >       > [   11.010736=
]
>  worker_thread+0x7c/0x4c0
> >     >     >         >     >       >     >       >       > [   11.010743=
]
>  kthread+0x120/0x130
> >     >     >         >     >       >     >       >       > [   11.010750=
]
>  ret_from_fork+0x10/0x20
> >     >     >         >     >       >     >       >       > [   11.010757=
]
> SMP: stopping secondary CPUs
> >     >     >         >     >       >     >       >       > [   11.010784=
]
> Kernel Offset: 0x2f61200000 from 0xffffffc008000000
> >     >     >         >     >       >     >       >       > [   11.010788=
]
> PHYS_OFFSET: 0x0
> >     >     >         >     >       >     >       >       > [   11.010790=
]
> CPU features: 0x00000401,00000842
> >     >     >         >     >       >     >       >       > [   11.010795=
]
> Memory Limit: none
> >     >     >         >     >       >     >       >       > [   11.277509=
]
> ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       > =D0=BF=D1=82,=
 21 =D0=B0=D0=BF=D1=80.
> 2023=E2=80=AF=D0=B3. =D0=B2 15:52, Michal Orzel <michal.orzel@amd.com <ma=
ilto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>
> >     <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>>>>:
> >     >     >         >     >       >     >       >       >       Hi Oleg=
,
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >       On
> 21/04/2023 14:49, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       > Hello
> Michal,
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       > I was
> not able to enable earlyprintk in the xen for now.
> >     >     >         >     >       >     >       >       >       > I
> decided to choose another way.
> >     >     >         >     >       >     >       >       >       > This
> is a xen's command line that I found out completely.
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       > (XEN)
> $$$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D=
2
> dom0_vcpus_pin
> >     >     >         >     >       bootscrub=3D0
> >     >     >         >     >       >     >       vwfi=3Dnative
> >     >     >         >     >       >     >       >       sched=3Dnull
> >     >     >         >     >       >     >       >       >
>  timer_slop=3D0
> >     >     >         >     >       >     >       >       >       Yes,
> adding a printk() in Xen was also a good idea.
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       > So yo=
u
> are absolutely right about a command line.
> >     >     >         >     >       >     >       >       >       > Now I
> am going to find out why xen did not have the correct parameters from the
> device
> >     >     >         >     >       tree.
> >     >     >         >     >       >     >       >       >       Maybe
> you will find this document helpful:
> >     >     >         >     >       >     >       >       >
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> >
> >     <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> >>>>
> >     >     >         >     >       <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> >
> >     <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt>
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> <
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> >>>>>
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >       ~Michal
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
> Regards,
> >     >     >         >     >       >     >       >       >       > Oleg
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       > =D0=
=BF=D1=82, 21
> =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16, Michal Orzel <mich=
al.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>
> >     >     >         >     >       <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com
> >     <mailto:michal.orzel@amd.com>>>> <mailto:michal.orzel@amd.com
> <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>>>>:
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >     O=
n
> 21/04/2023 10:04, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >       >       >     >
>
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> Hello Michal,
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> Yes, I use yocto.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> Yesterday all day long I tried to follow your suggestions.
> >     >     >         >     >       >     >       >       >       >     >
> I faced a problem.
> >     >     >         >     >       >     >       >       >       >     >
> Manually in the xen config build file I pasted the strings:
> >     >     >         >     >       >     >       >       >       >     I=
n
> the .config file or in some Yocto file (listing additional Kconfig option=
s)
> added
> >     >     >         >     >       to SRC_URI?
> >     >     >         >     >       >     >       >       >       >
>  You shouldn't really modify .config file but if you do, you should execu=
te
> "make
> >     >     >         >     >       olddefconfig"
> >     >     >         >     >       >     >       afterwards.
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> CONFIG_EARLY_PRINTK
> >     >     >         >     >       >     >       >       >       >     >
> CONFIG_EARLY_PRINTK_ZYNQMP
> >     >     >         >     >       >     >       >       >       >     >
> CONFIG_EARLY_UART_CHOICE_CADENCE
> >     >     >         >     >       >     >       >       >       >     I
> hope you added =3Dy to them.
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
>  Anyway, you have at least the following solutions:
> >     >     >         >     >       >     >       >       >       >     1=
)
> Run bitbake xen -c menuconfig to properly set early printk
> >     >     >         >     >       >     >       >       >       >     2=
)
> Find out how you enable other Kconfig options in your project (e.g.
> >     >     >         >     >       CONFIG_COLORING=3Dy that is not
> >     >     >         >     >       >     >       enabled by
> >     >     >         >     >       >     >       >       default)
> >     >     >         >     >       >     >       >       >       >     3=
)
> Append the following to "xen/arch/arm/configs/arm64_defconfig":
> >     >     >         >     >       >     >       >       >       >
>  CONFIG_EARLY_PRINTK_ZYNQMP=3Dy
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >
>  ~Michal
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> Host hangs in build time.
> >     >     >         >     >       >     >       >       >       >     >
> Maybe I did not set something in the config build file ?
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> Regards,
> >     >     >         >     >       >     >       >       >       >     >
> Oleg
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:57, O=
leg Nikitenko <oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com
> >     <mailto:oleshiiwood@gmail.com>>>> <mailto:oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >     <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>>
> <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>    Thanks Michal,
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>    You gave me an idea.
> >     >     >         >     >       >     >       >       >       >     >
>    I am going to try it today.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>    Regards,
> >     >     >         >     >       >     >       >       >       >     >
>    O.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>    =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:56=
, Oleg Nikitenko <oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com
> >     <mailto:oleshiiwood@gmail.com>>>> <mailto:oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >     <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>>
> <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>        Thanks Stefano.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>        I am going to do it today.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>        Regards,
> >     >     >         >     >       >     >       >       >       >     >
>        O.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>        =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 2=
3:05, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>>>
> >     >     >         >     >       >     >       <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org
> >>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >       >       >     >
>            > Hi Michal,
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > I corrected xen's command line.
> >     >     >         >     >       >     >       >       >       >     >
>            > Now it is
> >     >     >         >     >       >     >       >       >       >     >
>            > xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0
> dom0_mem=3D1600M
> >     >     >         >     >       dom0_max_vcpus=3D2
> >     >     >         >     >       >     >       dom0_vcpus_pin
> >     >     >         >     >       >     >       >       >
>  bootscrub=3D0 vwfi=3Dnative sched=3Dnull
> >     >     >         >     >       >     >       >       >       >     >
>            > timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=
=3D4-7";
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            4 colors is way too many for xen, just do xen_colors=3D0-0. Th=
ere
> is no
> >     >     >         >     >       >     >       >       >       >     >
>            advantage in using more than 1 color for Xen.
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            4 colors is too few for dom0, if you are giving 1600M of memor=
y
> to
> >     >     >         >     >       Dom0.
> >     >     >         >     >       >     >       >       >       >     >
>            Each color is 256M. For 1600M you should give at least 7 color=
s.
> Try:
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            xen_colors=3D0-0 dom0_colors=3D1-8
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            > Unfortunately the result was the same.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN)  - Dom0 mode: Relaxed
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) P2M: 3 levels with order-1 root, VTCR 0x00000000800235=
58
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Coloring general information
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Way size: 64kB
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Max. number of colors available: 16
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Xen color(s): [ 0 ]
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) alternatives: Patching with alt table 00000000002cc690=
 ->
> >     >     >         >     >       00000000002ccc0c
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Color array allocation failed for dom0
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN)
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) ****************************************
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Panic on CPU 0:
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Error creating domain 0
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) ****************************************
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN)
> >     >     >         >     >       >     >       >       >       >     >
>            > (XEN) Reboot in five seconds...
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > I am going to find out how command line arguments passed and
> parsed.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > Regards,
> >     >     >         >     >       >     >       >       >       >     >
>            > Oleg
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =
=D0=B2 11:25, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>
> >     >     >         >     >       >     >       <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >     <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >     <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>>
> <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com> <mailto:
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>>
> >     >     >         >     >       <mailto:oleshiiwood@gmail.com <mailto=
:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com> <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
>            >       Hi Michal,
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > You put my nose into the problem. Thank you.
> >     >     >         >     >       >     >       >       >       >     >
>            > I am going to use your point.
> >     >     >         >     >       >     >       >       >       >     >
>            > Let's see what happens.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > Regards,
> >     >     >         >     >       >     >       >       >       >     >
>            > Oleg
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =
=D0=B2 10:37, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>>
> >     >     >         >     >       <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>>
> >     >     >         >     >       >     >       <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com
> >     <mailto:michal.orzel@amd.com>>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>> <mailto:
> michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:
> michal.orzel@amd.com
> >     <mailto:michal.orzel@amd.com>>>>> <mailto:michal.orzel@amd.com
> <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>
> >     >     >         >     >       <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:
> michal.orzel@amd.com>>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
>            >       Hi Oleg,
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       > Hello Stefano,
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       > Thanks for the clarification.
> >     >     >         >     >       >     >       >       >       >     >
>            >       > My company uses yocto for image generation.
> >     >     >         >     >       >     >       >       >       >     >
>            >       > What kind of information do you need to consult me i=
n
> this
> >     >     >         >     >       case ?
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       > Maybe modules sizes/addresses which were mentioned b=
y
> @Julien
> >     >     >         >     >       Grall
> >     >     >         >     >       >     >       >       <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>>>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto=
:
> julien@xen.org <mailto:julien@xen.org>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>>>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto=
:
> julien@xen.org <mailto:julien@xen.org>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>>>>>> <mailto:julien@xen.org
> <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>
> <mailto:julien@xen.org <mailto:julien@xen.org>
> >     <mailto:julien@xen.org <mailto:julien@xen.org>>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>>>>
> >     >     >         >     >       <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>>> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:
> julien@xen.org <mailto:julien@xen.org>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>>>>
> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org
> <mailto:julien@xen.org>> <mailto:julien@xen.org <mailto:julien@xen.org>
> <mailto:julien@xen.org <mailto:julien@xen.org>>> <mailto:julien@xen.org
> <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>
> <mailto:julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org
> <mailto:julien@xen.org>>>> <mailto:julien@xen.org <mailto:julien@xen.org>
> <mailto:julien@xen.org <mailto:julien@xen.org>> <mailto:julien@xen.org
> <mailto:julien@xen.org> <mailto:julien@xen.org
> >     <mailto:julien@xen.org>>> <mailto:julien@xen.org <mailto:
> julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>> <mailto:
> julien@xen.org <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>>>>>>>> ?
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       Sorry for jumping into discussion, but FWICS the Xen
> command
> >     >     >         >     >       line you provided
> >     >     >         >     >       >     >       seems to be
> >     >     >         >     >       >     >       >       not the
> >     >     >         >     >       >     >       >       >       one
> >     >     >         >     >       >     >       >       >       >     >
>            >       Xen booted with. The error you are observing most like=
ly
> is due
> >     >     >         >     >       to dom0 colors
> >     >     >         >     >       >     >       >       configuration n=
ot
> >     >     >         >     >       >     >       >       >       being
> >     >     >         >     >       >     >       >       >       >     >
>            >       specified (i.e. lack of dom0_colors=3D<> parameter).
> Although in
> >     >     >         >     >       the command line you
> >     >     >         >     >       >     >       >       provided, this
> >     >     >         >     >       >     >       >       >       paramet=
er
> >     >     >         >     >       >     >       >       >       >     >
>            >       is set, I strongly doubt that this is the actual comma=
nd
> line
> >     >     >         >     >       in use.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       You wrote:
> >     >     >         >     >       >     >       >       >       >     >
>            >       xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial=
0
> >     >     >         >     >       dom0_mem=3D1600M dom0_max_vcpus=3D2
> >     >     >         >     >       >     >       >       dom0_vcpus_pin
> >     >     >         >     >       >     >       >       >
>  bootscrub=3D0 vwfi=3Dnative
> >     >     >         >     >       >     >       >       >       >     >
>            >       sched=3Dnull timer_slop=3D0 way_szize=3D65536 xen_colo=
rs=3D0-3
> >     >     >         >     >       dom0_colors=3D4-7";
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       but:
> >     >     >         >     >       >     >       >       >       >     >
>            >       1) way_szize has a typo
> >     >     >         >     >       >     >       >       >       >     >
>            >       2) you specified 4 colors (0-3) for Xen, but the boot
> log says
> >     >     >         >     >       that Xen has only
> >     >     >         >     >       >     >       one:
> >     >     >         >     >       >     >       >       >       >     >
>            >       (XEN) Xen color(s): [ 0 ]
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       This makes me believe that no colors configuration
> actually end
> >     >     >         >     >       up in command line
> >     >     >         >     >       >     >       that Xen
> >     >     >         >     >       >     >       >       booted
> >     >     >         >     >       >     >       >       >       with.
> >     >     >         >     >       >     >       >       >       >     >
>            >       Single color for Xen is a "default if not specified" a=
nd
> way
> >     >     >         >     >       size was probably
> >     >     >         >     >       >     >       calculated
> >     >     >         >     >       >     >       >       by asking
> >     >     >         >     >       >     >       >       >       HW.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       So I would suggest to first cross-check the command li=
ne
> in
> >     >     >         >     >       use.
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       ~Michal
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       > Regards,
> >     >     >         >     >       >     >       >       >       >     >
>            >       > Oleg
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=
=D0=B3. =D0=B2 20:44, Stefano Stabellini
> >     >     >         >     >       <sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>>>>>
> >     >     >         >     >       >     >       >       <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>>>>
> >     >     >         >     >       >     >       >       >       <mailto=
:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org
> >     <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org>>>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>
> >     <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>>
> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>
> >     >     >         >     >       <mailto:sstabellini@kernel.org
> <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>>>>>>>:
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     > Hi Julien,
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     > >> This feature has not been merged in Xen
> upstream yet
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     > > would assume that upstream + the series on t=
he
> ML [1]
> >     >     >         >     >       work
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     > Please clarify this point.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     > Because the two thoughts are controversial.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     Hi Oleg,
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     As Julien wrote, there is nothing controversial.
> As you
> >     >     >         >     >       are aware,
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     Xilinx maintains a separate Xen tree specific fo=
r
> Xilinx
> >     >     >         >     >       here:
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>
> >     >     >         >     >       <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>
> >     <https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>>>>
> >     >     >         >     >       >     >       >       <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen
> >     <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen
> >     <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>>>>
> >     >     >         >     >       <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>
> >     <https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>>> =
<
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>>
> >     >     >         >     >       <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>>>
> >     >     >         >     >       >     >       >       <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen
> >     <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen
> >     <https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>>>>>>>
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     and the branch you are using (xlnx_rebase_4.16)
> comes
> >     >     >         >     >       from there.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     Instead, the upstream Xen tree lives here:
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >     <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >     <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >     <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>
> >     >     >         >     >       >     >       >       >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>
> >     >     >         >     >       <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>>>>>>>
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     The Cache Coloring feature that you are trying t=
o
> >     >     >         >     >       configure is present
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     in xlnx_rebase_4.16, but not yet present upstrea=
m
> (there
> >     >     >         >     >       is an
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     outstanding patch series to add cache coloring t=
o
> Xen
> >     >     >         >     >       upstream but it
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     hasn't been merged yet.)
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     Anyway, if you are using xlnx_rebase_4.16 it
> doesn't
> >     >     >         >     >       matter too much for
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     you as you already have Cache Coloring as a feat=
ure
> >     >     >         >     >       there.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     I take you are using ImageBuilder to generate th=
e
> boot
> >     >     >         >     >       configuration? If
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     so, please post the ImageBuilder config file tha=
t
> you are
> >     >     >         >     >       using.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     But from the boot message, it looks like the col=
ors
> >     >     >         >     >       configuration for
> >     >     >         >     >       >     >       >       >       >     >
>            >       >     Dom0 is incorrect.
> >     >     >         >     >       >     >       >       >       >     >
>            >       >
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
>            >
> >     >     >         >     >       >     >       >       >       >     >
> >     >     >         >     >       >     >       >       >       >
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >       >
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >
> >     >     >         >     >       >     >
> >     >     >         >     >       >
> >     >     >         >     >
> >     >     >         >     >
> >     >     >         >     >
> >     >     >         >
> >     >     >
> >     >
> >
>

--000000000000176ab505fc0bf7c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Thanks Michal.</div><=
div><br></div><div></div><div>Then the next question. Now it is more relate=
d to the integration than to the development.</div><div>A license for the x=
en in 4.17 revision at branch xlnx_rebase_4.17 xilinx repo has changed.</di=
v><div>I found out when I built this version.</div><div>Now bitbake and yoc=
to build fault by COPYING file md5 hashe inequality reason.</div><div>I fou=
nd out md5 hash stored at sources/libs/meta-virtualization/recipes-extended=
/xen directory in files</div><div><a href=3D"http://xen-tools_4.15.bb">xen-=
tools_4.15.bb</a><br><a href=3D"http://xen_4.15.bb">xen_4.15.bb</a><br><a h=
ref=3D"http://xen_git.bb">xen_git.bb</a><br><a href=3D"http://xen-tools_git=
.bb">xen-tools_git.bb</a><br><a href=3D"http://xen-tools_4.16.bb">xen-tools=
_4.16.bb</a><br><a href=3D"http://xen_4.16.bb">xen_4.16.bb</a></div><div>So=
 this is a question. Should I update the license file for all our branches =
or is it possible to keep an old one for old branches ?</div><div><br></div=
><div>Regards,</div><div>Oleg<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 16 =D0=
=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 21:00, Michal Orzel &lt;<a href=
=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt;:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 16/05/2023 17:14, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Hi guys,<br>
&gt; <br>
&gt; Thanks Michal.<br>
&gt; <br>
&gt; So if I have more RAM It is possible=C2=A0to increase the color densit=
y.<br>
&gt; <br>
&gt; For example 8Gb/16 it is 512 Mb approximately.<br>
&gt; Is this correct ?<br>
Yes.<br>
To my previous reply I should also add that the number of colors depends on=
 the page size,<br>
but in Xen, we use 4kB pages so 64kB way size results in 16 colors.<br>
<br>
~Michal<br>
<br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D0=B2=D1=82, 16 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 17:40,=
 Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank"=
>michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com=
" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 16/05/2023 14:15, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks a lot Michal.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Then the next question.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When I just started my experiments with xen, S=
tefano mentioned that each cache&#39;s color size is 256M.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is it possible to extend this figure ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0With 16 colors (e.g. on Cortex-A53) and 4GB of memo=
ry, roughly each color is 256M (i.e. 4GB/16 =3D 256M).<br>
&gt;=C2=A0 =C2=A0 =C2=A0So as you can see this figure depends on the number=
 of colors and memory size.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D0=BD, 15 =D0=BC=D0=B0=D1=8F 2023=E2=80=
=AF=D0=B3. =D0=B2 11:57, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mai=
lto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 15/05/2023 10:51, Oleg N=
ikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello guys,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks a lot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; After a long problem l=
ist I was able to run xen with Dom0 with a cache color.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; One more question from=
 my side.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I want to run a guest =
with color mode too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I inserted a string in=
to guest config file llc-colors =3D &quot;9-13&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I got an error<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0457.517004] lo=
op0: detected capacity change from 0 to 385840<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Parsing config from /x=
en/red_config.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; /xen/red_config.cfg:26=
: config parsing error near `-colors&#39;: lexical error<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; warning: Config file l=
ooks like it contains Python code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; warning: =C2=A0Arbitra=
ry Python is no longer supported.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; warning: =C2=A0See <a =
href=3D"https://wiki.xen.org/wiki/PythonInXlConfig" rel=3D"noreferrer" targ=
et=3D"_blank">https://wiki.xen.org/wiki/PythonInXlConfig</a> &lt;<a href=3D=
"https://wiki.xen.org/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_=
blank">https://wiki.xen.org/wiki/PythonInXlConfig</a>&gt; &lt;<a href=3D"ht=
tps://wiki.xen.org/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_bla=
nk">https://wiki.xen.org/wiki/PythonInXlConfig</a> &lt;<a href=3D"https://w=
iki.xen.org/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_blank">htt=
ps://wiki.xen.org/wiki/PythonInXlConfig</a>&gt;&gt; &lt;<a href=3D"https://=
wiki.xen.org/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_blank">ht=
tps://wiki.xen.org/wiki/PythonInXlConfig</a> &lt;<a href=3D"https://wiki.xe=
n.org/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_blank">https://w=
iki.xen.org/wiki/PythonInXlConfig</a>&gt; &lt;<a href=3D"https://wiki.xen.o=
rg/wiki/PythonInXlConfig" rel=3D"noreferrer" target=3D"_blank">https://wiki=
.xen.org/wiki/PythonInXlConfig</a> &lt;<a href=3D"https://wiki.xen.org/wiki=
/PythonInXlConfig" rel=3D"noreferrer" target=3D"_blank">https://wiki.xen.or=
g/wiki/PythonInXlConfig</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Failed to parse config=
: Invalid argument<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; So this is a question.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is it possible to assi=
gn a color mode for the DomU by config file ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; If so, what string sho=
uld I use?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Please, always refer to the=
 relevant documentation. In this case, for xl.cfg:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.c=
om/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod.in#L2890" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebas=
e_4.17/docs/man/xl.cfg.5.pod.in#L2890</a> &lt;<a href=3D"https://github.com=
/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod.in#L2890" rel=3D"no=
referrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_=
4.17/docs/man/xl.cfg.5.pod.in#L2890</a>&gt; &lt;<a href=3D"https://github.c=
om/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod.in#L2890" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebas=
e_4.17/docs/man/xl.cfg.5.pod.in#L2890</a> &lt;<a href=3D"https://github.com=
/Xilinx/xen/blob/xlnx_rebase_4.17/docs/man/xl.cfg.5.pod.in#L2890" rel=3D"no=
referrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_=
4.17/docs/man/xl.cfg.5.pod.in#L2890</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D1=87=D1=82, 11 =D0=
=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 13:32, Oleg Nikitenko &lt;<a hr=
ef=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com=
</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">=
oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmai=
l.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"ma=
ilto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;=
&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">=
oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.co=
m" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt=
;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiw=
ood@gmail.com</a>&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi =
Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Tha=
nks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thi=
s compilation previously had a name CONFIG_COLORING.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0It =
mixed me up.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Reg=
ards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Ole=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=D1=
=87=D1=82, 11 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =D0=B2 13:15, Michal =
Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.=
orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:micha=
l.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a>&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0On 11/05/2023 12:02, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Thanks Stefano.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; Then the next question.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; I cloned xen repo from xilinx site <a href=3D"https://git=
hub.com/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/Xilinx/xen.git</a> &lt;<a href=3D"https://github.com/Xilinx/xen.git" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen.git</a>&g=
t; &lt;<a href=3D"https://github.com/Xilinx/xen.git" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/Xilinx/xen.git</a> &lt;<a href=3D"https:/=
/github.com/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/Xilinx/xen.git</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilin=
x/xen.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/x=
en.git</a> &lt;<a href=3D"https://github.com/Xilinx/xen.git" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/Xilinx/xen.git</a>&gt; &lt;<a hre=
f=3D"https://github.com/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/Xilinx/xen.git</a> &lt;<a href=3D"https://github.com/X=
ilinx/xen.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xili=
nx/xen.git</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/xen.git=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen.git</a=
> &lt;<a href=3D"https://github.com/Xilinx/xen.git" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/Xilinx/xen.git</a>&gt; &lt;<a href=3D"http=
s://github.com/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/Xilinx/xen.git</a> &lt;<a href=3D"https://github.com/Xilinx/xen=
.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen.gi=
t</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/xen.git" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/Xilinx/xen.git</a> &lt;<a href=
=3D"https://github.com/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/Xilinx/xen.git</a>&gt; &lt;<a href=3D"https://github.co=
m/Xilinx/xen.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/X=
ilinx/xen.git</a> &lt;<a href=3D"https://github.com/Xilinx/xen.git" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/xen.git</a>&gt;&gt;=
&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; I managed to build a xlnx_rebase_4.17 branch in my enviro=
nment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; I did it without coloring first. I did not find any color=
 footprints at this branch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; I realized coloring is not in the xlnx_rebase_4.17 branch=
 yet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0This is not true. Cache coloring is in xlnx_rebase_4.17. Pleas=
e see the docs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17=
/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-colori=
ng.rst</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.=
17/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-colo=
ring.rst</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_reb=
ase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cach=
e-coloring.rst</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_r=
ebase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/ca=
che-coloring.rst</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/b=
lob/xlnx_rebase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs/m=
isc/arm/cache-coloring.rst</a> &lt;<a href=3D"https://github.com/Xilinx/xen=
/blob/xlnx_rebase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/docs=
/misc/arm/cache-coloring.rst</a>&gt; &lt;<a href=3D"https://github.com/Xili=
nx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"noref=
errer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.1=
7/docs/misc/arm/cache-coloring.rst</a> &lt;<a href=3D"https://github.com/Xi=
linx/xen/blob/xlnx_rebase_4.17/docs/misc/arm/cache-coloring.rst" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4=
.17/docs/misc/arm/cache-coloring.rst</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0It describes the feature and documents the required properties=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt; =D0=B2=D1=82, 9 =D0=BC=D0=B0=D1=8F 2023=E2=80=AF=D0=B3. =
=D0=B2 22:49, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sst=
abellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabe=
llini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mail=
to:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@=
kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;m=
ailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabelli=
ni@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;=
&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0We test Xen Cache Coloring regularly o=
n zcu102. Every Petalinux release<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(twice a year) is tested with cache co=
loring enabled. The last Petalinux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0release is 2023.1 and the kernel used =
is this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/Xilinx/l=
inux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a hr=
ef=3D"https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree=
/xlnx_rebase_v6.1_LTS</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/linu=
x-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=
=3D"https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xln=
x_rebase_v6.1_LTS</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/linu=
x-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=
=3D"https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xln=
x_rebase_v6.1_LTS</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/linux-xl=
nx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=3D"h=
ttps://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noref=
errer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xlnx_reb=
ase_v6.1_LTS</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/linux=
-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=
=3D"https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xln=
x_rebase_v6.1_LTS</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/linux-xl=
nx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=3D"h=
ttps://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"noref=
errer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xlnx_reb=
ase_v6.1_LTS</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/linux-xln=
x/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=3D"ht=
tps://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xlnx_reba=
se_v6.1_LTS</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/Xilinx/linux-xlnx=
/tree/xlnx_rebase_v6.1_LTS" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS</a> &lt;<a href=3D"htt=
ps://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.1_LTS" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebas=
e_v6.1_LTS</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 9 May 2023, Oleg Nikitenko wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello guys,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have a couple of more questions=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Have you ever run xen with the ca=
che coloring at Zynq UltraScale+ MPSoC zcu102 xczu15eg ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; When did you run xen with the cac=
he coloring last time ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; What kernel version did you use f=
or Dom0 when you ran xen with the cache coloring last time ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D1=82, 5 =D0=BC=D0=B0=D1=
=8F 2023=E2=80=AF=D0=B3. =D0=B2 11:48, Oleg Nikitenko &lt;<a href=3D"mailto=
:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targe=
t=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targe=
t=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:=
<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmai=
l.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt;&gt;:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Mich=
al,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D1=82, 5 =D0=BC=D0=B0=D1=
=8F 2023=E2=80=AF=D0=B3. =D0=B2 11:34, Michal Orzel &lt;<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:=
<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.=
com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a=
> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mich=
al.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mi=
chal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt; =
&lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal=
.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targe=
t=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:mich=
al.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a =
href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_=
blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@a=
md.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Replyin=
g, so that you do not need to wait for Stefano.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 05/0=
5/2023 10:28, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; He=
llo Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I =
would like to try a xen cache color property from this repo=C2=A0 <a href=
=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"=
_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https:/=
/xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/git-http/xen.git</a>&gt; &lt;<a href=3D"https://xenbit=
s.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xe=
nbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.org/g=
it-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.o=
rg/git-http/xen.git</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/git-=
http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/=
git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.gi=
t" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xe=
n.git</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=
=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git<=
/a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"norefer=
rer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a>&gt;&gt;=
&gt; &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"norefe=
rrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt;<a=
 href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a>&gt; &lt;<a href=
=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"=
_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https:/=
/xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/git-http/xen.git</a>&gt;&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.o=
rg/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.x=
en.org/git-http/xen.git</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/git-=
http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/=
git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.gi=
t" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xe=
n.git</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/git-http/xen.git</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.o=
rg/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.x=
en.org/git-http/xen.git</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/=
git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.=
org/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xe=
n.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-htt=
p/xen.git</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" =
rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.g=
it</a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"nore=
ferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a>&gt;&=
gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt=
;<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a>&gt; &lt;<a hre=
f=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https:=
//xenbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">ht=
tps://xenbits.xen.org/git-http/xen.git</a>&gt;&gt; &lt;<a href=3D"https://x=
enbits.xen.org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https=
://xenbits.xen.org/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.=
org/git-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.=
xen.org/git-http/xen.git</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/git=
-http/xen.git" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org=
/git-http/xen.git</a> &lt;<a href=3D"https://xenbits.xen.org/git-http/xen.g=
it" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/git-http/x=
en.git</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Co=
uld you tell whot branch I should use ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cache c=
oloring feature is not part of the upstream tree and it is still under revi=
ew.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You can=
 only find it integrated in the Xilinx Xen tree.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Re=
gards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Ol=
eg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =
=D0=BF=D1=82, 28 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 00:51, Ste=
fano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bl=
ank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blan=
k">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel=
.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;ma=
ilto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellin=
i@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; =
&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ssta=
bellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_b=
lank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0I am familiar with the zcu102 but I don&#39;t know how you=
 could possibly<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0generate a SError.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0I suggest to try to use ImageBuilder [1] to generate the b=
oot<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0configuration as a test because that is known to work well=
 for zcu102.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0[1] <a href=3D"https://gitlab.com/xen-project/imagebuilder=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/image=
builder</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuild=
er</a>&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuild=
er</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a=
>&gt;&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuild=
er</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a=
>&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>=
 &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt;&=
gt;&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</=
a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt=
; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a> &lt=
;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt;&gt; =
&lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferr=
er" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a> &lt;<=
a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt; &lt;<a=
 href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a> &lt;<a href=
=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt;&gt;&gt;&gt;=
 &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a> &lt;=
<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt; &lt;<=
a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a> &lt;<a hre=
f=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.com/xen-project/image=
builder" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-projec=
t/imagebuilder</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuild=
er" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/ima=
gebuilder</a>&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilde=
r" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imag=
ebuilder</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuil=
der</a>&gt;&gt;&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuil=
der" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/im=
agebuilder</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebu=
ilder</a>&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebui=
lder</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder<=
/a>&gt;&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuild=
er</a> &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a=
>&gt; &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>=
 &lt;<a href=3D"https://gitlab.com/xen-project/imagebuilder" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/xen-project/imagebuilder</a>&gt;&=
gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0On Thu, 27 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; Hello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; Thanks for clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; We nighter use ImageBuilder nor uboot boot script.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; A model is zcu102 compatible.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt; =D0=B2=D1=82, 25 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=
=B3. =D0=B2 21:21, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" targ=
et=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstab=
ellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;m=
ailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabelli=
ni@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;=
&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bl=
ank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blan=
k">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel=
.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;ma=
ilto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellin=
i@kernel.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is interesting. Are yo=
u using Xilinx hardware by any chance? If so,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which board?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Are you using ImageBuilder =
to generate your boot.scr boot script? If so,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0could you please post your =
ImageBuilder config file? If not, can you<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0post the source of your ubo=
ot boot script?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SErrors are supposed to be =
related to a hardware failure of some kind.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You are not supposed to be =
able to trigger an SError easily by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mistake&quot;. I have=
 not seen SErrors due to wrong cache coloring<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configurations on any Xilin=
x board before.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The differences between Xen=
 with and without cache coloring from a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hardware perspective are:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- With cache coloring, the =
SMMU is enabled and does address translations<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 even for dom0. Witho=
ut cache coloring the SMMU could be disabled, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 if enabled, the SMMU=
 doesn&#39;t do any address translations for Dom0. If<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 there is a hardware =
failure related to SMMU address translation it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 could only trigger w=
ith cache coloring. This would be my normal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 suggestion for you t=
o explore, but the failure happens too early<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 before any DMA-capab=
le device is programmed. So I don&#39;t think this can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 be the issue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- With cache coloring, the =
memory allocation is very different so you&#39;ll<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 end up using differe=
nt DDR regions for Dom0. So if your DDR is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 defective, you might=
 only see a failure with cache coloring enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 because you end up u=
sing different regions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 25 Apr 2023, Oleg N=
ikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thank you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If I build xen without=
 colors support there is not this error.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; All the domains are bo=
oted well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hense it can not be a =
hardware issue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This panic arrived dur=
ing unpacking the rootfs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Here I attached the bo=
ot log xen/Dom0 without color.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; A highlighted strings =
printed exactly after the place where 1-st time panic arrived.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0Xen 4.16.1-pre<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Xen version 4.16=
.1-pre (nole2390@(none)) (aarch64-portable-linux-gcc (GCC) 11.3.0) debug=3D=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02023-04=
-21<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Latest ChangeSet=
: Wed Apr 19 12:56:14 2023 +0300 git:321687b231-dirty<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) build-id: c18472=
58fdb1b79562fc710dda40008f96c0fde5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Processor: 00000=
000410fd034: &quot;ARM Limited&quot;, variant: 0x0, part 0xd03,rev 0x4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) 64-bit Execution=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Processor=
 Features: 0000000000002222 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 Ex=
ception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 Ex=
tensions: FloatingPoint AdvancedSIMD<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Debug Fea=
tures: 0000000010305106 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Auxiliary=
 Features: 0000000000000000 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Memory Mo=
del Features: 0000000000001122 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 ISA Featu=
res: =C2=A00000000000011120 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) 32-bit Execution=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Processor=
 Features: 0000000000000131:0000000000011011<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 In=
struction Sets: AArch32 A32 Thumb Thumb-2 Jazelle<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 Ex=
tensions: GenericTimer Security<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Debug Fea=
tures: 0000000003010066<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Auxiliary=
 Features: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 Memory Mo=
del Features: 0000000010201105 0000000040000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00000000001260000 0000000002102211<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 ISA Featu=
res: 0000000002101110 0000000013112111 0000000021232042<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000001112131 0000000000011142=
 0000000000011121<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Using SMC Callin=
g Convention v1.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Using PSCI v1.1<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) SMP: Allowing 4 =
CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Generic Timer IR=
Q: phys=3D30 hyp=3D26 virt=3D27 Freq: 100000 KHz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) GICv2 initializa=
tion:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gic_dist_addr=3D00000000f9010000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gic_cpu_addr=3D00000000f9020000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gic_hyp_addr=3D00000000f9040000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gic_vcpu_addr=3D00000000f9060000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gic_maintenance_irq=3D25<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) GICv2: Adjusting=
 CPU interface base to 0xf902f000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) GICv2: 192 lines=
, 4 cpus, secure (IID 0200143b).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Using scheduler:=
 null Scheduler (null)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Initializing nul=
l scheduler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) WARNING: This is=
 experimental software in development.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Use at your own =
risk.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Allocated consol=
e ring of 32 KiB.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU0: Guest atom=
ics will try 12 times before pausing the domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Bringing up CPU1=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU1: Guest atom=
ics will try 13 times before pausing the domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU 1 booted.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Bringing up CPU2=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU2: Guest atom=
ics will try 13 times before pausing the domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU 2 booted.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Bringing up CPU3=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU3: Guest atom=
ics will try 13 times before pausing the domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Brought up 4 CPU=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) CPU 3 booted.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: probing hardware configuration...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: SMMUv2 with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: stage 2 translation<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: stream matching with 48 register groups, mask 0x7fff&lt;2&gt;smmu=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/axi/sm=
mu@fd800000: 16 context<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0banks (0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; stage-2 only)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: Stage-2: 48-bit IPA -&gt; 48-bit PA<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: registered 29 master devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) I/O virtualisati=
on enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0- Dom0 mod=
e: Relaxed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) P2M: 40-bit IPA =
with 40-bit PA and 8-bit VMID<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) P2M: 3 levels wi=
th order-1 root, VTCR 0x0000000080023558<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Scheduling granu=
larity: cpu, 1 CPU per sched-resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) alternatives: Pa=
tching with alt table 00000000002cc5c8 -&gt; 00000000002ccb2c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) *** LOADING DOMA=
IN 0 ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Loading d0 kerne=
l from boot module @ 0000000001000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Loading ramdisk =
from boot module @ 0000000002000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Allocating 1:1 m=
appings totalling 1600MB for dom0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) BANK[0] 0x000000=
10000000-0x00000020000000 (256MB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) BANK[1] 0x000000=
24000000-0x00000028000000 (64MB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) BANK[2] 0x000000=
30000000-0x00000080000000 (1280MB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Grant table rang=
e: 0x00000000e00000-0x00000000e40000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) smmu: /axi/smmu@=
fd800000: d0: p2maddr 0x000000087bf94000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Allocating PPI 1=
6 for event channel interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
0: 0x81200000-&gt;0xa0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
1: 0xb1200000-&gt;0xc0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
2: 0xc8000000-&gt;0xe0000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
3: 0xf0000000-&gt;0xf9000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
4: 0x100000000-&gt;0x600000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
5: 0x880000000-&gt;0x8000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Extended region =
6: 0x8001000000-&gt;0x10000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Loading zImage f=
rom 0000000001000000 to 0000000010000000-0000000010e41008<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Loading d0 initr=
d from 0000000002000000 to 0x0000000013600000-0x000000001ff3a617<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Loading d0 DTB t=
o 0x0000000013400000-0x000000001340cbdc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Initial low memo=
ry virq threshold set at 0x4000 pages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Std. Loglevel: A=
ll<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Guest Loglevel: =
All<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) *** Serial input=
 to DOM0 (type &#39;CTRL-a&#39; three times to switch input)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) null.c:353: 0 &l=
t;-- d0v0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Freed 356kB init=
 memory.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0 Unhandled S=
MC/HVC: 0x84000050<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0 Unhandled S=
MC/HVC: 0x8600ff01<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER12<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER16<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER20<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v0: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Booting Linux on physical CPU 0x0000000000 [0x410fd034]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Linux version 5.15.72-xilinx-v2022.1 (oe-user@oe-host) (aarch64-portable=
-linux-gcc (GCC)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A011.3.0,=
 GNU ld (GNU<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Binutils)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 2.38.20220708) #1 SMP =
Tue Feb 21 05:47:54 UTC 2023<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Machine model: D14 Viper Board - White Unit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Xen 4.16 support found<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Zone ranges:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x0000000010000000-0x000000007ffffff=
f]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 DMA32 =C2=A0 =C2=A0empty<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 Normal =C2=A0 empty<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Movable zone start for each node<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Early memory node ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 node =C2=A0 0: [mem 0x0000000010000000-0x000000001fffffff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 node =C2=A0 0: [mem 0x0000000022000000-0x0000000022147fff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 node =C2=A0 0: [mem 0x0000000022200000-0x0000000022347fff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 node =C2=A0 0: [mem 0x0000000024000000-0x0000000027ffffff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] =C2=A0 node =C2=A0 0: [mem 0x0000000030000000-0x000000007fffffff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Initmem setup node 0 [mem 0x0000000010000000-0x000000007fffffff]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] On node 0, zone DMA: 8192 pages in unavailable ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] On node 0, zone DMA: 184 pages in unavailable ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] On node 0, zone DMA: 7352 pages in unavailable ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] cma: Reserved 256 MiB at 0x000000006e000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] psci: probing for conduit method from DT.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] psci: PSCIv1.1 detected in firmware.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] psci: Using standard PSCI v0.2 function IDs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] psci: Trusted OS migration not required<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] psci: SMC Calling Convention v1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] percpu: Embedded 16 pages/cpu s32792 r0 d32744 u65536<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Detected VIPT I-cache on CPU0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] CPU features: kernel page table isolation forced ON by KASLR<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] CPU features: detected: Kernel page table isolation (KPTI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 403845<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Kernel command line: console=3Dhvc0 earlycon=3Dxen earlyprintk=3Dxen clk=
_ignore_unused fips=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0root=3D=
/dev/ram0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0maxcpus=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Unknown kernel command line parameters &quot;earlyprintk=3Dxen fips=3D1&=
quot;, will be passed to user<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0space.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] mem auto-init: stack:off, heap alloc:on, heap free:on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] mem auto-init: clearing system memory may take some time...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Memory: 1121936K/1641024K available (9728K kernel code, 836K rwdata, 239=
6K rodata, 1536K<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0init, 2=
62K bss,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0256944K reserved,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 262144K cma-reserved)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] rcu: Hierarchical RCU implementation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] rcu: RCU event tracing is enabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] rcu: RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] Root IRQ handler: gic_handle_irq<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] arch_timer: cp15 timer(s) running at 100.00MHz (virt).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1710=
24e7e0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0max_idl=
e_ns: 440795205315 ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00000=
0] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps every 43980465111=
00ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.00025=
8] Console: colour dummy device 80x25<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.31023=
1] printk: console [hvc0] enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.31440=
3] Calibrating delay loop (skipped), value calculated using timer frequency=
.. 200.00 BogoMIPS<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(lpj=3D=
400000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.32485=
1] pid_max: default: 32768 minimum: 301<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.32970=
6] LSM: Security Framework initializing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.33420=
4] Yama: becoming mindful.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.33786=
5] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.34518=
0] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.35474=
3] xen:grant_table: Grant tables using version 1 layout<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.35913=
2] Grant table initialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.36266=
4] xen:events: Using FIFO-based ABI<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.36699=
3] Xen: initializing cpu0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.37051=
5] rcu: Hierarchical SRCU implementation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.37593=
0] smp: Bringing up secondary CPUs ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) null.c:353: 1 &l=
t;-- d0v1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v1: vGICD: unh=
andled word write 0x000000ffffffff to ICACTIVER0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.38254=
9] Detected VIPT I-cache on CPU1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.38871=
2] Xen: initializing cpu1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.38874=
3] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.38882=
9] smp: Brought up 1 node, 2 CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.40694=
1] SMP: Total of 2 processors activated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.41169=
8] CPU features: detected: 32-bit EL0 Support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.41688=
8] CPU features: detected: CRC32 instructions<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.42212=
1] CPU: All CPU(s) started at EL1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.42624=
8] alternatives: patching kernel code<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.43142=
4] devtmpfs: initialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.44145=
4] KASLR enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.44160=
2] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_=
ns:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A07645041=
785100000 ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.44832=
1] futex hash table entries: 512 (order: 3, 32768 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.49618=
3] NET: Registered PF_NETLINK/PF_ROUTE protocol family<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.49827=
7] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.50377=
2] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.51161=
0] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocatio=
ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.51947=
8] audit: initializing netlink subsys (disabled)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.52498=
5] audit: type=3D2000 audit(0.336:1): state=3Dinitialized audit_enabled=3D0=
 res=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.52916=
9] thermal_sys: Registered thermal governor &#39;step_wise&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.53302=
3] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.54560=
8] ASID allocator initialised with 32768 entries<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.55103=
0] xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.55933=
2] software IO TLB: mapped [mem 0x0000000011800000-0x0000000011c00000] (4MB=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.58356=
5] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.58472=
1] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.59147=
8] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.59822=
5] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.63652=
0] DRBG: Continuing without Jitter RNG<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.73718=
7] raid6: neonx8 =C2=A0 gen() =C2=A02143 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.80529=
4] raid6: neonx8 =C2=A0 xor() =C2=A01589 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.87340=
6] raid6: neonx4 =C2=A0 gen() =C2=A02177 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A00.94149=
9] raid6: neonx4 =C2=A0 xor() =C2=A01556 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.00961=
2] raid6: neonx2 =C2=A0 gen() =C2=A02072 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.07771=
5] raid6: neonx2 =C2=A0 xor() =C2=A01430 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.14583=
4] raid6: neonx1 =C2=A0 gen() =C2=A01769 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.21393=
5] raid6: neonx1 =C2=A0 xor() =C2=A01214 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.28204=
6] raid6: int64x8 =C2=A0gen() =C2=A01366 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.35013=
2] raid6: int64x8 =C2=A0xor() =C2=A0 773 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.41825=
9] raid6: int64x4 =C2=A0gen() =C2=A01602 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.48634=
9] raid6: int64x4 =C2=A0xor() =C2=A0 851 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.55446=
4] raid6: int64x2 =C2=A0gen() =C2=A01396 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.62256=
1] raid6: int64x2 =C2=A0xor() =C2=A0 744 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.69068=
7] raid6: int64x1 =C2=A0gen() =C2=A01033 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.75877=
0] raid6: int64x1 =C2=A0xor() =C2=A0 517 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.75880=
9] raid6: using algorithm neonx4 gen() 2177 MB/s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.76294=
1] raid6: .... xor() 1556 MB/s, rmw enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.76795=
7] raid6: using neon recovery algorithm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.77282=
4] xen:balloon: Initialising balloon driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.77802=
1] iommu: Default domain type: Translated<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.78258=
4] iommu: DMA domain TLB invalidation policy: strict mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.78914=
9] SCSI subsystem initialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.79282=
0] usbcore: registered new interface driver usbfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.79825=
4] usbcore: registered new interface driver hub<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.80362=
6] usbcore: registered new device driver usb<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.80876=
1] pps_core: LinuxPPS API ver. 1 registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.81371=
6] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt=
;<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</=
a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giomet=
ti@linux.it</a>&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@lin=
ux.it" target=3D"_blank">giometti@linux.it</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;m=
ailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux=
.it</a>&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blan=
k">giometti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" ta=
rget=3D"_blank">giometti@linux.it</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;mailto:<=
a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a>=
&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giom=
etti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D=
"_blank">giometti@linux.it</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:giomett=
i@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;mailto:<a href=3D"m=
ailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a>&gt; &lt;ma=
ilto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.=
it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">gi=
ometti@linux.it</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.i=
t</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">gio=
metti@linux.it</a>&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" targ=
et=3D"_blank">giometti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@l=
inux.it" target=3D"_blank">giometti@linux.it</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;m=
ailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux=
.it</a>&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blan=
k">giometti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" ta=
rget=3D"_blank">giometti@linux.it</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;mailto:<=
a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a>=
&gt; &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giom=
etti@linux.it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D=
"_blank">giometti@linux.it</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:giomett=
i@linux.it" target=3D"_blank">giometti@linux.it</a> &lt;mailto:<a href=3D"m=
ailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a>&gt; &lt;ma=
ilto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.=
it</a> &lt;mailto:<a href=3D"mailto:giometti@linux.it" target=3D"_blank">gi=
ometti@linux.it</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.82290=
3] PTP clock support registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.82689=
3] EDAC MC: Ver: 3.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.83037=
5] zynqmp-ipi-mbox mailbox@ff990400: Registered ZynqMP IPI mbox with TX/RX =
channels.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.83886=
3] zynqmp-ipi-mbox mailbox@ff990600: Registered ZynqMP IPI mbox with TX/RX =
channels.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.84735=
6] zynqmp-ipi-mbox mailbox@ff990800: Registered ZynqMP IPI mbox with TX/RX =
channels.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.85590=
7] FPGA manager framework<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.85995=
2] clocksource: Switched to clocksource arch_sys_counter<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.87171=
2] NET: Registered PF_INET protocol family<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.87183=
8] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.87939=
2] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes=
, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.88707=
8] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.89484=
6] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linea=
r)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.90290=
0] TCP bind hash table entries: 16384 (order: 6, 262144 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.91035=
0] TCP: Hash tables configured (established 16384 bind 16384)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.91677=
8] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.92350=
9] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.93075=
9] NET: Registered PF_UNIX/PF_LOCAL protocol family<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.93683=
4] RPC: Registered named UNIX socket transport module.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.94234=
2] RPC: Registered udp transport module.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.94708=
8] RPC: Registered tcp transport module.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.95184=
3] RPC: Registered tcp NFSv4.1 backchannel transport module.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.95833=
4] PCI: CLS 0 bytes, default 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.96270=
9] Trying to unpack rootfs image as initramfs...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.97709=
0] workingset: timestamp_bits=3D62 max_order=3D19 bucket_order=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A01.98286=
3] Installing knfsd (copyright (C) 1996 <a href=3D"mailto:okir@monad.swb.de=
" target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir=
@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &lt=
;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.s=
wb.de</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D=
"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.=
de" target=3D"_blank">okir@monad.swb.de</a>&gt; &lt;mailto:<a href=3D"mailt=
o:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a =
href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&g=
t;&gt;&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank=
">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" tar=
get=3D"_blank">okir@monad.swb.de</a>&gt; &lt;mailto:<a href=3D"mailto:okir@=
monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D=
"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&gt;&gt; =
&lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@mona=
d.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_bla=
nk">okir@monad.swb.de</a>&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.d=
e" target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:oki=
r@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&gt;&gt;&gt;&gt; &lt=
;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.s=
wb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank"=
>okir@monad.swb.de</a>&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" =
target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@m=
onad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&gt;&gt; &lt;mailto:<a =
href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &=
lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad=
.swb.de</a>&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_=
blank">okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de=
" target=3D"_blank">okir@monad.swb.de</a>&gt;&gt;&gt; &lt;mailto:<a href=3D=
"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &lt;mail=
to:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de=
</a>&gt; &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">=
okir@monad.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" targe=
t=3D"_blank">okir@monad.swb.de</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oki=
r@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a> &lt;mailto:<a href=
=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>&gt; &=
lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad=
.swb.de</a> &lt;mailto:<a href=3D"mailto:okir@monad.swb.de" target=3D"_blan=
k">okir@monad.swb.de</a>&gt;&gt;&gt;&gt;&gt;).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.02104=
5] NET: Registered PF_ALG protocol family<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.02112=
2] xor: measuring software checksum speed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.02934=
7] =C2=A0 =C2=A08regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : =C2=A02366 MB/se=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.03308=
1] =C2=A0 =C2=A032regs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: =C2=A02802 MB/se=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.03822=
3] =C2=A0 =C2=A0arm64_neon =C2=A0 =C2=A0 =C2=A0: =C2=A02320 MB/sec<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.03838=
5] xor: using function: 32regs (2802 MB/sec)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.04361=
4] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.05095=
9] io scheduler mq-deadline registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.05552=
1] io scheduler kyber registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.06822=
7] xen:xen_evtchn: Event-channel device installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.06928=
1] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.07619=
0] cacheinfo: Unable to detect cache hierarchy for CPU 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.08554=
8] brd: module loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.08929=
0] loop: module loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.08934=
1] Invalid max_queues (4), will use default max: 2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.09456=
5] tun: Universal TUN/TAP device driver, 1.6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.09865=
5] xen_netfront: Initialising Xen virtual ethernet driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.10415=
6] usbcore: registered new interface driver rtl8150<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.10981=
3] usbcore: registered new interface driver r8152<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.11536=
7] usbcore: registered new interface driver asix<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.12079=
4] usbcore: registered new interface driver ax88179_178a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.12693=
4] usbcore: registered new interface driver cdc_ether<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.13281=
6] usbcore: registered new interface driver cdc_eem<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.13852=
7] usbcore: registered new interface driver net1080<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.14425=
6] usbcore: registered new interface driver cdc_subset<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.15020=
5] usbcore: registered new interface driver zaurus<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.15583=
7] usbcore: registered new interface driver cdc_ncm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.16155=
0] usbcore: registered new interface driver r8153_ecm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.16824=
0] usbcore: registered new interface driver cdc_acm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.17310=
9] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapt=
ers<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.18135=
8] usbcore: registered new interface driver uas<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.18654=
7] usbcore: registered new interface driver usb-storage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.19264=
3] usbcore: registered new interface driver ftdi_sio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.19838=
4] usbserial: USB Serial support registered for FTDI USB Serial Device<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.20611=
8] udc-core: couldn&#39;t find an available UDC - added [g_mass_storage] to=
 list of pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drivers=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.21533=
2] i2c_dev: i2c /dev entries driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.22046=
7] xen_wdt xen_wdt: initialized (timeout=3D60s, nowayout=3D0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.22592=
3] device-mapper: uevent: version 1.0.3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.23066=
8] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: <a href=3D"=
mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;m=
ailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@red=
hat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D=
"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redh=
at.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a> =
&lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-deve=
l@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" targ=
et=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel=
@redhat.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&gt;&gt; &lt;mail=
to:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat=
.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat.=
com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailto=
:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&gt; &lt=
;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@r=
edhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_=
blank">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@re=
dhat.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"m=
ailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&gt=
;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redha=
t.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blan=
k">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat=
.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailt=
o:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&gt; &l=
t;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@=
redhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"=
_blank">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:dm-devel@r=
edhat.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"=
mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a>&gt;&g=
t;&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">=
dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" t=
arget=3D"_blank">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mailto:d=
m-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mailto:<a=
 href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com<=
/a>&gt;&gt; &lt;mailto:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_bl=
ank">dm-devel@redhat.com</a> &lt;mailto:<a href=3D"mailto:dm-devel@redhat.c=
om" target=3D"_blank">dm-devel@redhat.com</a>&gt; &lt;mailto:<a href=3D"mai=
lto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a> &lt;mail=
to:<a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat=
.com</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.23931=
5] EDAC MC0: Giving out device to module 1 controller synps_ddr_controller:=
 DEV synps_edac<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(INTERR=
UPT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.24940=
5] EDAC DEVICE0: Giving out device to module zynqmp-ocm-edac controller zyn=
qmp_ocm: DEV<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ff960000.memory-controller =
(INTERRUPT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.26171=
9] sdhci: Secure Digital Host Controller Interface driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.26748=
7] sdhci: Copyright(c) Pierre Ossman<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.27189=
0] sdhci-pltfm: SDHCI platform and OF driver helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.27815=
7] ledtrig-cpu: registered to indicate activity on CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.28381=
6] zynqmp_firmware_probe Platform Management API v1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.28955=
4] zynqmp_firmware_probe Trustzone version v1.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.32787=
5] securefw securefw: securefw probed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.32832=
4] alg: No test for xilinx-zynqmp-aes (zynqmp-aes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.33256=
3] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: AES Successfully Registe=
red<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.34118=
3] alg: No test for xilinx-zynqmp-rsa (zynqmp-rsa)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.34766=
7] remoteproc remoteproc0: ff9a0000.rf5ss:r5f_0 is available<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.35300=
3] remoteproc remoteproc1: ff9a0000.rf5ss:r5f_1 is available<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.36260=
5] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.36654=
0] viper-xen-proxy viper-xen-proxy: Viper Xen Proxy registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.37252=
5] viper-vdpp a4000000.vdpp: Device Tree Probing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.37777=
8] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen:=
 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.38643=
2] viper-vdpp a4000000.vdpp: Unable to register tamper handler. Retrying...=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.39409=
4] viper-vdpp-net a5000000.vdpp_net: Device Tree Probing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.39985=
4] viper-vdpp-net a5000000.vdpp_net: Device registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.40593=
1] viper-vdpp-stat a8000000.vdpp_stat: Device Tree Probing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.41203=
7] viper-vdpp-stat a8000000.vdpp_stat: Build parameters: VTI Count: 512 Eve=
nt Count: 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.42085=
6] default preset<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.42379=
7] viper-vdpp-stat a8000000.vdpp_stat: Device registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.43005=
4] viper-vdpp-rng ac000000.vdpp_rng: Device Tree Probing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.43594=
8] viper-vdpp-rng ac000000.vdpp_rng: Device registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.44197=
6] vmcu driver init<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.44492=
2] VMCU: : (240:0) registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.44495=
6] In K81 Updater init<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.44900=
3] pktgen: Packet Generator for packet performance testing. Version: 2.75<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.46883=
3] Initializing XFRM netlink socket<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.46890=
2] NET: Registered PF_PACKET protocol family<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.47272=
9] Bridge firewalling registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.47678=
5] 8021q: 802.1Q VLAN Support v1.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.48134=
1] registered taskstats version 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.48639=
4] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dno, fsverity=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.50314=
5] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 36, base_baud =3D 62=
50000) is a xuartps<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.50710=
3] of-fpga-region fpga-full: FPGA Region probed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.51298=
6] xilinx-zynqmp-dma fd500000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.52026=
7] xilinx-zynqmp-dma fd510000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.52823=
9] xilinx-zynqmp-dma fd520000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.53615=
2] xilinx-zynqmp-dma fd530000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.54415=
3] xilinx-zynqmp-dma fd540000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.55212=
7] xilinx-zynqmp-dma fd550000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.56017=
8] xilinx-zynqmp-dma ffa80000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.56798=
7] xilinx-zynqmp-dma ffa90000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.57601=
8] xilinx-zynqmp-dma ffaa0000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.58388=
9] xilinx-zynqmp-dma ffab0000.dma-controller: ZynqMP DMA driver Probe succe=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.94637=
9] spi-nor spi0.0: mt25qu512a (131072 Kbytes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.94646=
7] 2 fixed-partitions partitions found on MTD device spi0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.95239=
3] Creating 2 MTD partitions on &quot;spi0.0&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.95723=
1] 0x000004000000-0x000008000000 : &quot;bank A&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.96333=
2] 0x000000000000-0x000004000000 : &quot;bank B&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.96869=
4] macb ff0b0000.ethernet: Not enabling partial store and forward<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.97533=
3] macb ff0b0000.ethernet eth0: Cadence GEM rev 0x50070106 at 0xff0b0000 ir=
q 25<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(18:41:=
fe:0f:ff:02)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.98447=
2] macb ff0c0000.ethernet: Not enabling partial store and forward<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A02.99214=
4] macb ff0c0000.ethernet eth1: Cadence GEM rev 0x50070106 at 0xff0c0000 ir=
q 26<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(18:41:=
fe:0f:ff:03)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.00104=
3] viper_enet viper_enet: Viper power GPIOs initialised<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.00731=
3] viper_enet viper_enet vnet0 (uninitialized): Validate interface QSGMII<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.01491=
4] viper_enet viper_enet vnet1 (uninitialized): Validate interface QSGMII<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.02213=
8] viper_enet viper_enet vnet1 (uninitialized): Validate interface type 18<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.03027=
4] viper_enet viper_enet vnet2 (uninitialized): Validate interface QSGMII<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.03778=
5] viper_enet viper_enet vnet3 (uninitialized): Validate interface QSGMII<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.04530=
1] viper_enet viper_enet: Viper enet registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.05095=
8] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.05713=
5] xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.06353=
8] xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.06992=
0] xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.09772=
9] si70xx: probe of 2-0040 failed with error -5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.09804=
2] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer with timeout 60s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.10511=
1] cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer with timeout 10s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.11245=
7] viper-tamper viper-tamper: Device registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.11759=
3] active_bank active_bank: boot bank: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.12218=
4] active_bank active_bank: boot mode: (0x02) qspi32<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.12824=
7] viper-vdpp a4000000.vdpp: Device Tree Probing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.13343=
9] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen:=
 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.14215=
1] viper-vdpp a4000000.vdpp: Tamper handler registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.14743=
8] viper-vdpp a4000000.vdpp: Device registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.15300=
7] lpc55_l2 spi1.0: registered handler for protocol 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.15858=
2] lpc55_user lpc55_user: The major number for your device is 236<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.16597=
6] lpc55_l2 spi1.0: registered handler for protocol 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.18199=
9] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.18285=
6] rtc-lpc55 rtc_lpc55: registered as rtc0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.18865=
6] lpc55_l2 spi1.0: (2) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.19374=
4] lpc55_l2 spi1.0: (3) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.19884=
8] lpc55_l2 spi1.0: (4) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.20293=
2] mmc0: SDHCI controller on ff160000.mmc [ff160000.mmc] using ADMA 64-bit<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.21068=
9] lpc55_l2 spi1.0: (5) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.21569=
4] lpc55_l2 spi1.0: rx error: -110<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.28443=
8] mmc0: new HS200 MMC card at address 0001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.28517=
9] mmcblk0: mmc0:0001 SEM16G 14.6 GiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.29178=
4] =C2=A0mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.29391=
5] mmcblk0boot0: mmc0:0001 SEM16G 4.00 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.29905=
4] mmcblk0boot1: mmc0:0001 SEM16G 4.00 MiB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.30390=
5] mmcblk0rpmb: mmc0:0001 SEM16G 4.00 MiB, chardev (244:0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.58267=
6] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.58333=
2] rtc-lpc55 rtc_lpc55: hctosys: unable to read the hardware clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.59125=
2] cdns-i2c ff020000.i2c: recovery information complete<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.59708=
5] at24 0-0050: supply vcc not found, using dummy regulator<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.60301=
1] lpc55_l2 spi1.0: (2) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.60809=
3] at24 0-0050: 256 byte spd EEPROM, read-only<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.61362=
0] lpc55_l2 spi1.0: (3) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.61936=
2] lpc55_l2 spi1.0: (4) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.62422=
4] rtc-rv3028 0-0052: registered as rtc1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.62834=
3] lpc55_l2 spi1.0: (5) mcu still not ready?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.63325=
3] lpc55_l2 spi1.0: rx error: -110<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.63910=
4] k81_bootloader 0-0010: probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.64162=
8] VMCU: : (235:0) registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.64163=
5] k81_bootloader 0-0010: probe completed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.66834=
6] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 28<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.66915=
4] cdns-i2c ff030000.i2c: recovery information complete<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.67541=
2] lm75 1-0048: supply vs not found, using dummy regulator<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.68292=
0] lm75 1-0048: hwmon1: sensor &#39;tmp112&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.68654=
8] i2c i2c-1: Added multiplexed i2c bus 3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.69079=
5] i2c i2c-1: Added multiplexed i2c bus 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.69562=
9] i2c i2c-1: Added multiplexed i2c bus 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.70049=
2] i2c i2c-1: Added multiplexed i2c bus 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.70515=
7] pca954x 1-0070: registered 4 multiplexed busses for I2C switch pca9546<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.71304=
9] at24 1-0054: supply vcc not found, using dummy regulator<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.72006=
7] at24 1-0054: 1024 byte 24c08 EEPROM, read-only<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.72476=
1] cdns-i2c ff030000.i2c: 100 kHz mmio ff030000 irq 29<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.73127=
2] sfp viper_enet:sfp-eth1: Host maximum power 2.0W<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.73754=
9] sfp_register_socket: got sfp_bus<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.74070=
9] sfp_register_socket: register sfp_bus<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.74545=
9] sfp_register_bus: ops ok!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.74917=
9] sfp_register_bus: Try to attach<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.75341=
9] sfp_register_bus: Attach succeeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.75791=
4] sfp_register_bus: upstream ops attach<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.76267=
7] sfp_register_bus: Bus registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.76699=
9] sfp_register_socket: register sfp_bus succeeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.77587=
0] of_cfs_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.77600=
0] of_cfs_init: OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.77821=
1] clk: Not disabling unused clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.278477] Fr=
eeing initrd memory: 206056K<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.279406] Fr=
eeing unused kernel memory: 1536K<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.314006] Ch=
ecked W+X mappings: passed, no W+X pages found<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.314142] Ru=
n /init as init process<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; INIT: version 3.01 boo=
ting<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fsck (busybox 1.35.0)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /dev/mmcblk0p1: clean,=
 12/102400 files, 238162/409600 blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /dev/mmcblk0p2: clean,=
 12/102400 files, 171972/409600 blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /dev/mmcblk0p3 was not=
 cleanly unmounted, check forced.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /dev/mmcblk0p3: 20/409=
6 files (0.0% non-contiguous), 663/16384 blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.553073] EX=
T4-fs (mmcblk0p3): mounted filesystem without journal. Opts: (null). Quota =
mode:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disable=
d.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting random number=
 generator daemon.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.580662] ra=
ndom: crng init done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting udev<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.613159] ud=
evd[142]: starting version 3.2.10<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.620385] ud=
evd[143]: starting eudev-3.2.10<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.704481] ma=
cb ff0b0000.ethernet control_red: renamed from eth0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.720264] ma=
cb ff0c0000.ethernet control_black: renamed from eth1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.063396] ip=
_local_port_range: prefer different parity for start/end values.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.084801] rt=
c-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; hwclock: RTC_RD_TIME: =
Invalid exchange<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Mon Feb 27 08:40:53 UT=
C 2023<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.115309] rt=
c-lpc55 rtc_lpc55: lpc55_rtc_set_time: bad result<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; hwclock: RTC_SET_TIME:=
 Invalid exchange<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.131027] rt=
c-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting mcud<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; INIT: Entering runleve=
l: 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Configuring network in=
terfaces... done.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; resetting network inte=
rface<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.718295] ma=
cb ff0b0000.ethernet control_red: PHY [ff0b0000.ethernet-ffffffff:02] drive=
r [Xilinx<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCS/PMA=
 PHY] (irq=3DPOLL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.723919] ma=
cb ff0b0000.ethernet control_red: configuring for phy/gmii link mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.732151] pp=
s pps0: new PPS source ptp0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.735563] ma=
cb ff0b0000.ethernet: gem-ptp-timer ptp clock registered.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.745724] ma=
cb ff0c0000.ethernet control_black: PHY [ff0c0000.ethernet-ffffffff:01] dri=
ver [Xilinx<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCS/PMA=
 PHY]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(irq=3DPOLL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.753469] ma=
cb ff0c0000.ethernet control_black: configuring for phy/gmii link mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.761804] pp=
s pps1: new PPS source ptp1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 12.765398] ma=
cb ff0c0000.ethernet: gem-ptp-timer ptp clock registered.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Auto-negotiation: off<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Auto-negotiation: off<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 16.828151] ma=
cb ff0b0000.ethernet control_red: unable to generate target frequency: 1250=
00000 Hz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 16.834553] ma=
cb ff0b0000.ethernet control_red: Link is Up - 1Gbps/Full - flow control of=
f<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 16.860552] ma=
cb ff0c0000.ethernet control_black: unable to generate target frequency: 12=
5000000 Hz<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 16.867052] ma=
cb ff0c0000.ethernet control_black: Link is Up - 1Gbps/Full - flow control =
off<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting Failsafe Secu=
re Shell server in port 2222: sshd<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; done.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting rpcbind daemo=
n...done.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.093019] rt=
c-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; hwclock: RTC_RD_TIME: =
Invalid exchange<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting State Manager=
 Service<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Start state-manager re=
starter...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) d0v1 Forwarding =
AES operation: 3254779951<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting /usr/sbin/xen=
stored....[ =C2=A0 17.265256] BTRFS: device fsid 80efc224-c202-4f8e-a949-4d=
ae7f04a0aa<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devid 1=
 transid 744<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/dm-0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; scanned by udevd (385)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.349933] BT=
RFS info (device dm-0): disk space caching is enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.350670] BT=
RFS info (device dm-0): has skinny extents<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.364384] BT=
RFS info (device dm-0): enabling ssd optimizations<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.830462] BT=
RFS: device fsid 27ff666b-f4e5-4f90-9054-c210db5b2e2e devid 1 transid 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/ma=
pper/client_prov scanned by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.btrfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (526)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.872699] BT=
RFS info (device dm-1): using free space tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.872771] BT=
RFS info (device dm-1): has skinny extents<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.878114] BT=
RFS info (device dm-1): flagging fs with big metadata feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.894289] BT=
RFS info (device dm-1): enabling ssd optimizations<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 17.895695] BT=
RFS info (device dm-1): checking UUID tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Setting domain 0 name,=
 domid and JSON config...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Done setting up Dom0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting xenconsoled..=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting QEMU as disk =
backend for dom0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting domain watchd=
og daemon: xenwatchdogd startup<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.408647] BT=
RFS: device fsid 5e08d5e9-bc2a-46b9-af6a-44c7087b8921 devid 1 transid 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/ma=
pper/client_config scanned by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.btrfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (574)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [done]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.465552] BT=
RFS info (device dm-2): using free space tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.465629] BT=
RFS info (device dm-2): has skinny extents<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.471002] BT=
RFS info (device dm-2): flagging fs with big metadata feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Starting crond: [ =C2=
=A0 18.482371] BTRFS info (device dm-2): enabling ssd optimizations<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.486659] BT=
RFS info (device dm-2): checking UUID tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; starting rsyslogd ... =
Log partition ready after 0 poll loops<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; rsyslogd: cannot conne=
ct to <a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferre=
r" target=3D"_blank">http://172.18.0.1:514</a>&gt; &lt;<a href=3D"http://17=
2.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a=
> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank=
">http://172.18.0.1:514</a>&gt;&gt; &lt;<a href=3D"http://172.18.0.1:514" r=
el=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=
=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.=
18.0.1:514</a>&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer"=
 target=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0=
.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a>&gt;&=
gt;&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"=
_blank">http://172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=
=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a>&gt; &lt;<a href=
=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.=
18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" tar=
get=3D"_blank">http://172.18.0.1:514</a>&gt;&gt; &lt;<a href=3D"http://172.=
18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a> =
&lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">=
http://172.18.0.1:514</a>&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"=
noreferrer" target=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=3D"http=
://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:5=
14</a>&gt;&gt;&gt;&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"norefer=
rer" target=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=3D"http://172.=
18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a>&=
gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_bla=
nk">http://172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"=
noreferrer" target=3D"_blank">http://172.18.0.1:514</a>&gt;&gt; &lt;<a href=
=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.=
18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" tar=
get=3D"_blank">http://172.18.0.1:514</a>&gt; &lt;<a href=3D"http://172.18.0=
.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a> &lt;=
<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http=
://172.18.0.1:514</a>&gt;&gt;&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=
=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=3D"=
http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0=
.1:514</a>&gt; &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" tar=
get=3D"_blank">http://172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:5=
14" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:514</a>&gt;&gt; =
&lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">=
http://172.18.0.1:514</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:514</a>&gt; &lt;<a href=3D"http=
://172.18.0.1:514" rel=3D"noreferrer" target=3D"_blank">http://172.18.0.1:5=
14</a> &lt;<a href=3D"http://172.18.0.1:514" rel=3D"noreferrer" target=3D"_=
blank">http://172.18.0.1:514</a>&gt;&gt;&gt;&gt;&gt;: Network is unreachabl=
e [v8.2208.0 try<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://www.rsyslog.com/e/2=
027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a=
>&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://ww=
w.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsys=
log.com/e/2027</a>&gt;&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" r=
el=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;=
<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.rsyslog.com/e/2027</a>&gt; &lt;<a href=3D"https://www.rsys=
log.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.co=
m/e/2027</a> &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferr=
er" target=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt;&gt;&gt; &lt;<a=
 href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blan=
k">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://www.rsyslog.co=
m/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/20=
27</a>&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer=
" target=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https=
://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www=
.rsyslog.com/e/2027</a>&gt;&gt; &lt;<a href=3D"https://www.rsyslog.com/e/20=
27" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a>=
 &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=
=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt; &lt;<a href=3D"https://w=
ww.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsy=
slog.com/e/2027</a> &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"n=
oreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt;&gt;&gt;=
&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" targ=
et=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://www=
.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsysl=
og.com/e/2027</a>&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D=
"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;<a hr=
ef=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">=
https://www.rsyslog.com/e/2027</a>&gt;&gt; &lt;<a href=3D"https://www.rsysl=
og.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com=
/e/2027</a> &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferre=
r" target=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt; &lt;<a href=3D"=
https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https:=
//www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://www.rsyslog.com/e/2027"=
 rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt=
;&gt;&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer"=
 target=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https:=
//www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.=
rsyslog.com/e/2027</a>&gt; &lt;<a href=3D"https://www.rsyslog.com/e/2027" r=
el=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a> &lt;=
<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.rsyslog.com/e/2027</a>&gt;&gt; &lt;<a href=3D"https://www.=
rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslo=
g.com/e/2027</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.rsyslog.com/e/2027" rel=
=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/e/2027</a>&gt; &l=
t;<a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" target=3D"_=
blank">https://www.rsyslog.com/e/2027</a> &lt;<a href=3D"https://www.rsyslo=
g.com/e/2027" rel=3D"noreferrer" target=3D"_blank">https://www.rsyslog.com/=
e/2027</a>&gt;&gt;&gt;&gt;&gt; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 18.670637] BT=
RFS: device fsid 39d7d9e1-967d-478e-94ae-690deb722095 devid 1 transid 608 /=
dev/dm-3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0scanned=
 by udevd (518)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Please insert USB toke=
n and enter your role in login prompt.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; login:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D0=BD, 24 =D0=
=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:39, Stefano Stabellini &lt;=
<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@ker=
nel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" targ=
et=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstab=
ellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mail=
to:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@=
kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ssta=
bellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Here is the issue from your logs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0SError Interrupt on CPU0, code 0xbe000000 -- SError<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0SErrors are special signals to notify software of serious hardware<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0errors.=C2=A0 Something is going very wrong. Defective hardware is a<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0possibility.=C2=A0 Another possibility if software accessing address =
ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0that it is not supposed to, sometimes it causes SErrors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0Stefano<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0On Mon, 24 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; Thanks guys.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; I found out where the problem was.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; Now dom0 booted more. But I have a new one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; This is a kernel panic during Dom0 loading.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; Maybe someone is able to suggest something ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.771362] sfp_register_bus: upstream ops attach<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.776119] sfp_register_bus: Bus registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.780459] sfp_register_socket: register sfp_bus s=
ucceeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.789399] of_cfs_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.789499] of_cfs_init: OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 =C2=A03.791685] clk: Not disabling unused clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010355] SError Interrupt on CPU0, code 0xbe000000 --=
 SError<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010380] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted=
 5.15.72-xilinx-v2022.1 #1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010393] Workqueue: events_unbound async_run_entry_fn=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010414] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -=
DIT -SSBS BTYPE=3D--)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010422] pc : simple_write_end+0xd0/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010431] lr : generic_perform_write+0x118/0x1e0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010438] sp : ffffffc00809b910<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010441] x29: ffffffc00809b910 x28: 0000000000000000 =
x27: ffffffef69ba88c0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010451] x26: 0000000000003eec x25: ffffff807515db00 =
x24: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010459] x23: ffffffc00809ba90 x22: 0000000002aac000 =
x21: ffffff807315a260<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010472] x20: 0000000000001000 x19: fffffffe02000000 =
x18: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010481] x17: 00000000ffffffff x16: 0000000000008000 =
x15: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010490] x14: 0000000000000000 x13: 0000000000000000 =
x12: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010498] x11: 0000000000000000 x10: 0000000000000000 =
x9 : 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010507] x8 : 0000000000000000 x7 : ffffffef693ba680 =
x6 : 000000002d89b700<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010515] x5 : fffffffe02000000 x4 : ffffff807315a3c8 =
x3 : 0000000000001000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010524] x2 : 0000000002aab000 x1 : 0000000000000001 =
x0 : 0000000000000005<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010534] Kernel panic - not syncing: Asynchronous SEr=
ror Interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted=
 5.15.72-xilinx-v2022.1 #1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010545] Hardware name: D14 Viper Board - White Unit =
(DT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010548] Workqueue: events_unbound async_run_entry_fn=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010556] Call trace:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010558] =C2=A0dump_backtrace+0x0/0x1c4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010567] =C2=A0show_stack+0x18/0x2c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010574] =C2=A0dump_stack_lvl+0x7c/0xa0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010583] =C2=A0dump_stack+0x18/0x34<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010588] =C2=A0panic+0x14c/0x2f8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010597] =C2=A0print_tainted+0x0/0xb0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010606] =C2=A0arm64_serror_panic+0x6c/0x7c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010614] =C2=A0do_serror+0x28/0x60<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010621] =C2=A0el1h_64_error_handler+0x30/0x50<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010628] =C2=A0el1h_64_error+0x78/0x7c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010633] =C2=A0simple_write_end+0xd0/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010639] =C2=A0generic_perform_write+0x118/0x1e0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010644] =C2=A0__generic_file_write_iter+0x138/0x1c4<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010650] =C2=A0generic_file_write_iter+0x78/0xd0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010656] =C2=A0__kernel_write+0xfc/0x2ac<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010665] =C2=A0kernel_write+0x88/0x160<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010673] =C2=A0xwrite+0x44/0x94<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010680] =C2=A0do_copy+0xa8/0x104<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010686] =C2=A0write_buffer+0x38/0x58<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010692] =C2=A0flush_buffer+0x4c/0xbc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010698] =C2=A0__gunzip+0x280/0x310<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010704] =C2=A0gunzip+0x1c/0x28<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010709] =C2=A0unpack_to_rootfs+0x170/0x2b0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010715] =C2=A0do_populate_rootfs+0x80/0x164<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010722] =C2=A0async_run_entry_fn+0x48/0x164<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010728] =C2=A0process_one_work+0x1e4/0x3a0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010736] =C2=A0worker_thread+0x7c/0x4c0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010743] =C2=A0kthread+0x120/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010750] =C2=A0ret_from_fork+0x10/0x20<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010757] SMP: stopping secondary CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010784] Kernel Offset: 0x2f61200000 from 0xffffffc00=
8000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010788] PHYS_OFFSET: 0x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010790] CPU features: 0x00000401,00000842<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.010795] Memory Limit: none<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; [ =C2=A0 11.277509] ---[ end Kernel panic - not syncing: Asynchr=
onous SError Interrupt ]---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt; =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2=
 15:52, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"=
_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@=
amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.c=
om" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto=
:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;m=
ailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orze=
l@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"=
_blank">michal.orzel@amd.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:=
<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.=
com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a=
> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mich=
al.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mi=
chal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&=
gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" t=
arget=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:=
michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orze=
l@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt=
; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mich=
al.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&g=
t;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 21/04/2023 14:49, Oleg Nikitenko wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I was not able to enable earlypri=
ntk in the xen for now.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I decided to choose another way.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This is a xen&#39;s command line =
that I found out completely.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) $$$$ console=3Ddtuart dtuar=
t=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootscr=
ub=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0sched=3Dnull<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0timer_slop=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, adding a printk() in Xen was also=
 a good idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So you are absolutely right about=
 a command line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Now I am going to find out why xe=
n did not have the correct parameters from the device<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tree.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Maybe you will find this document help=
ful:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/Xilinx/x=
en/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.=
16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a href=3D"https://github.=
com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xl=
nx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a>&gt; &lt;<a href=3D=
"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-t=
ree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xi=
linx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &l=
t;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/=
arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/bootin=
g.txt</a>&gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_re=
base_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/a=
rm/device-tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/xen=
/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16=
/docs/misc/arm/device-tree/booting.txt</a>&gt; &lt;<a href=3D"https://githu=
b.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.tx=
t" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/=
xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a href=3D"h=
ttps://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tre=
e/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xili=
nx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a>&gt;&=
gt;&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/=
docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-t=
ree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_=
rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/=
arm/device-tree/booting.txt</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/Xilinx/xen/blob/x=
lnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/m=
isc/arm/device-tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilin=
x/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase=
_4.16/docs/misc/arm/device-tree/booting.txt</a>&gt;&gt; &lt;<a href=3D"http=
s://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/b=
ooting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/=
xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a =
href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/d=
evice-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt=
</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16=
/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx=
_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc=
/arm/device-tree/booting.txt</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/d=
evice-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt=
</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/doc=
s/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree=
/booting.txt</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx=
_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc=
/arm/device-tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/x=
en/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.=
16/docs/misc/arm/device-tree/booting.txt</a>&gt;&gt; &lt;<a href=3D"https:/=
/github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/boot=
ing.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen=
/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a hre=
f=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/devi=
ce-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a=
>&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/do=
cs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tre=
e/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_re=
base_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/a=
rm/device-tree/booting.txt</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.co=
m/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx=
_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a href=3D"https=
://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/bo=
oting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/x=
en/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/Xilinx/xen/blob/x=
lnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/m=
isc/arm/device-tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilin=
x/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase=
_4.16/docs/misc/arm/device-tree/booting.txt</a>&gt;&gt; &lt;<a href=3D"http=
s://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/b=
ooting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilinx/=
xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a> &lt;<a =
href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/d=
evice-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt=
</a>&gt; &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16=
/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt</a> &lt;<a href=3D"https://github.com/Xilinx/xen/blob/xlnx=
_rebase_4.16/docs/misc/arm/device-tree/booting.txt" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc=
/arm/device-tree/booting.txt</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=
=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16, Michal Orzel &lt;<a href=3D"mailto:=
michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_=
blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@a=
md.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a hr=
ef=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</=
a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mic=
hal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com=
" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targ=
et=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a=
 href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"=
_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@=
amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@=
amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orze=
l@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt=
;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" t=
arget=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mich=
al.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blan=
k">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orz=
el@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt; &lt;mailto:<=
a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.c=
om</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank"=
>michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd=
.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mail=
to:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targ=
et=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a=
 href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.co=
m</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mai=
lto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a hr=
ef=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</=
a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mic=
hal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com=
" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt=
;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.or=
zel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:micha=
l.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mai=
lto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 21/04/2023 =
10:04, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello Mic=
hal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, I us=
e yocto.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yesterday=
 all day long I tried to follow your suggestions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I faced a=
 problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Manually =
in the xen config build file I pasted the strings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In the .config=
 file or in some Yocto file (listing additional Kconfig options) added<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to SRC_=
URI?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You shouldn&#3=
9;t really modify .config file but if you do, you should execute &quot;make=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0olddefc=
onfig&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0afterwards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EA=
RLY_PRINTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EA=
RLY_PRINTK_ZYNQMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; CONFIG_EA=
RLY_UART_CHOICE_CADENCE<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I hope you add=
ed =3Dy to them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Anyway, you ha=
ve at least the following solutions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A01) Run bitbake=
 xen -c menuconfig to properly set early printk<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A02) Find out ho=
w you enable other Kconfig options in your project (e.g.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_=
COLORING=3Dy that is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enabled by<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0default)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A03) Append the =
following to &quot;xen/arch/arm/configs/arm64_defconfig&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_EARLY_P=
RINTK_ZYNQMP=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Host hang=
s in build time.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Maybe I d=
id not set something in the config build file ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =D1=87=D1=
=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:57, Oleg Nikiten=
ko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiw=
ood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targe=
t=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:=
<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmai=
l.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:=
<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmai=
l.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a =
href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.c=
om</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank=
">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank=
">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &=
lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshi=
iwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &=
lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshi=
iwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwo=
od@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D=
"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com=
" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;m=
ailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwoo=
d@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0Thanks Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0You gave me an idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0I am going to try it today.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0=D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 =
11:56, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiw=
ood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiw=
ood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a hr=
ef=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com=
</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmai=
l.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targe=
t=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:=
<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmai=
l.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:=
<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmai=
l.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a =
href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.c=
om</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank=
">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank=
">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &=
lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshi=
iwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &=
lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshi=
iwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwo=
od@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D=
"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com=
" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;m=
ailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwoo=
d@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Thanks Stefano.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0I am going to do it today.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=
=D0=B3. =D0=B2 23:05, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@=
kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bl=
ank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabell=
ini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel=
.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt=
; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"m=
ailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> =
&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ssta=
bellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_b=
lank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@k=
ernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:=
<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@ker=
nel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sst=
abellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabe=
llini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mail=
to:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@=
kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sst=
abellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">=
sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&g=
t;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 19 Apr 2023, Oleg Nikitenko w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I corrected xen&#39;s command li=
ne.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Now it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; xen,xen-bootargs =3D &quot;conso=
le=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0_ma=
x_vcpus=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0_vcpus_pin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootscrub=3D0 vwfi=3Dnative sched=3Dnu=
ll<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; timer_slop=3D0 way_size=3D65536 =
xen_colors=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 colors is way too many for xen, jus=
t do xen_colors=3D0-0. There is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0advantage in using more than 1 color =
for Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 colors is too few for dom0, if you =
are giving 1600M of memory to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Dom0.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Each color is 256M. For 1600M you sho=
uld give at least 7 colors. Try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_colors=3D0-0 dom0_colors=3D1-8<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Unfortunately the result was the=
 same.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) =C2=A0- Dom0 mode: Relaxed=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) P2M: 40-bit IPA with 40-bi=
t PA and 8-bit VMID<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) P2M: 3 levels with order-1=
 root, VTCR 0x0000000080023558<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Scheduling granularity: cp=
u, 1 CPU per sched-resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Coloring general informati=
on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Way size: 64kB<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Max. number of colors avai=
lable: 16<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) alternatives: Patching wit=
h alt table 00000000002cc690 -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A00000000=
0002ccc0c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Color array allocation fai=
led for dom0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) **************************=
**************<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Panic on CPU 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Error creating domain 0<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) **************************=
**************<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) Reboot in five seconds...<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am going to find out how comma=
nd line arguments passed and parsed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=
=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:25, Oleg Nikitenko &lt;<a href=3D"mailt=
o:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;ma=
ilto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood=
@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targ=
et=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshi=
iwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;ma=
ilto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood=
@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mail=
to:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@g=
mail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;ma=
ilto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood=
@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" targ=
et=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshi=
iwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;ma=
ilto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood=
@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mail=
to:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@g=
mail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=
=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiw=
ood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"=
_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@=
gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwo=
od@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D=
"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com<=
/a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">o=
leshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com=
" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail=
.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; =
&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">olesh=
iiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" ta=
rget=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;=
mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwo=
od@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:o=
leshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&g=
t;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_b=
lank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gm=
ail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"=
mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</=
a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.=
com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&g=
t; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ol=
eshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com"=
 target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mail=
to:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;m=
ailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwoo=
d@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@=
gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D=
"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood=
@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:oleshii=
wood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.co=
m</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank"=
>oleshiiwood@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:oleshiiwood@gma=
il.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Mic=
hal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; You put my nose into the problem=
. Thank you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am going to use your point.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Let&#39;s see what happens.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=
=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37, Michal Orzel &lt;<a href=3D"mailto:=
michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_=
blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@a=
md.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a hr=
ef=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</=
a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mic=
hal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com=
" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targ=
et=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a=
 href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.co=
m</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"=
_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@=
amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@=
amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orze=
l@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt=
;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" t=
arget=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mich=
al.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blan=
k">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orz=
el@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D=
"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel=
@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a =
href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com=
</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.c=
om" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto=
:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&g=
t; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mic=
hal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" ta=
rget=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:m=
ichal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:=
<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.=
com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.=
orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a hre=
f=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a=
>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"m=
ailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;=
mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orz=
el@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targe=
t=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.o=
rzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt; &lt;ma=
ilto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel=
@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_=
blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orz=
el@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blan=
k">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.c=
om" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"ma=
ilto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;m=
ailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orze=
l@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt; &lt;mai=
lto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@=
amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orze=
l@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt=
;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.co=
m" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:=
michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;ma=
ilto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel=
@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_=
blank">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal=
.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a hr=
ef=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</=
a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank"=
>michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com=
" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt; &lt;m=
ailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orze=
l@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"=
_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt; &lt;mailto:<=
a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.c=
om</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank"=
>michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd=
.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mail=
to:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;=
 &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">micha=
l.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targ=
et=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:mic=
hal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a=
 href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.co=
m</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.or=
zel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">mi=
chal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@am=
d.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mai=
lto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &l=
t;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.o=
rzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@=
amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_b=
lank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailto:michal.orze=
l@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D=
"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt=
;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com"=
 target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto:<a href=3D"mailt=
o:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mail=
to:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@a=
md.com</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" t=
arget=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:mich=
al.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt; &lt;mailto=
:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd=
.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blan=
k">michal.orzel@amd.com</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:michal.orz=
el@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a href=
=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>=
&gt; &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">m=
ichal.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" =
target=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Ole=
g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 19/=
04/2023 09:03, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; H=
ello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; T=
hanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; M=
y company uses yocto for image generation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; W=
hat kind of information do you need to consult me in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case ?<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; M=
aybe modules sizes/addresses which were mentioned by @Julien<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Grall<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien=
@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank"=
>julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:=
julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"=
mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:=
<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;=
mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</=
a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.=
org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:juli=
en@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:=
<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; =
&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julie=
n@xen.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" =
target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xe=
n.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailt=
o:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt=
;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org<=
/a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@x=
en.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:jul=
ien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a =
href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&=
gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">juli=
en@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" targ=
et=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.or=
g" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:julien@xe=
n.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:ju=
lien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:=
<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@x=
en.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">j=
ulien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> =
&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.=
org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:juli=
en@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;&gt; &lt;mailto=
:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt=
;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org<=
/a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">juli=
en@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" =
target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xe=
n.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailt=
o:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;=
 &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.=
org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">juli=
en@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_=
blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" targ=
et=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:julie=
n@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailt=
o:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailt=
o:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt=
;&gt;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:juli=
en@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mail=
to:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:=
<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;=
mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=
=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> =
&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.=
org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:juli=
en@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> =
&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">j=
ulien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_b=
lank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.or=
g" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien=
@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a hre=
f=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt=
; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen=
.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">jul=
ien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"=
_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" tar=
get=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:juli=
en@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mail=
to:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a h=
ref=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mail=
to:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&g=
t;&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_=
blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" targ=
et=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xe=
n.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:ju=
lien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mailto:<a hr=
ef=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailt=
o:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt=
; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen=
.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">jul=
ien@xen.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" ta=
rget=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.=
org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:=
julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"=
mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;&gt; &lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> =
&lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">j=
ulien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_b=
lank">julien@xen.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:julie=
n@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailt=
o:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a hr=
ef=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailt=
o:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt=
;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien=
@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank"=
>julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:julien@xen.org" target=
=3D"_blank">julien@xen.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:jul=
ien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &lt;mailto:<a =
href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a> &lt;mai=
lto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&=
gt;&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">juli=
en@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blan=
k">julien@xen.org</a>&gt; &lt;mailto:<a href=3D"mailto:julien@xen.org" targ=
et=3D"_blank">julien@xen.org</a> &lt;mailto:<a href=3D"mailto:julien@xen.or=
g" target=3D"_blank">julien@xen.org</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ?<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sorry =
for jumping into discussion, but FWICS the Xen command<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0line yo=
u provided<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seems to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0not the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0one<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen bo=
oted with. The error you are observing most likely is due<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to dom0=
 colors<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0configuration not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0being<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied (i.e. lack of dom0_colors=3D&lt;&gt; parameter). Although in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the com=
mand line you<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0provided, this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is set=
, I strongly doubt that this is the actual command line<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in use.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen,xe=
n-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0_me=
m=3D1600M dom0_max_vcpus=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0dom0_vcpus_pin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootscrub=3D0 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sched=
=3Dnull timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0_co=
lors=3D4-7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01) way=
_szize has a typo<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02) you=
 specified 4 colors (0-3) for Xen, but the boot log says<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that Xe=
n has only<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0one:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) =
Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This m=
akes me believe that no colors configuration actually end<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0up in c=
ommand line<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0booted<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Single=
 color for Xen is a &quot;default if not specified&quot; and way<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size wa=
s probably<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0calculated<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0by asking<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0HW.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So I w=
ould suggest to first cross-check the command line in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0use.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Micha=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; R=
egards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; O=
leg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =
=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44, Ste=
fano Stabellini<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel=
.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bl=
ank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mail=
to:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@=
kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ssta=
bellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&g=
t;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sst=
abellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">=
sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&g=
t;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;m=
ailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabelli=
ni@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;=
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@=
kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@=
kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;ma=
ilto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellin=
i@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mail=
to:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@=
kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org"=
 target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sst=
abellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;=
mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabell=
ini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" tar=
get=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bla=
nk">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a hre=
f=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.or=
g</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank=
">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &=
lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstab=
ellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt; &lt;mailto:<a href=3D"mai=
lto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &l=
t;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabe=
llini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&=
gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">=
sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.=
org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D=
"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a=
> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.=
org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@kernel.org=
" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&g=
t;&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto=
:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;m=
ailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabelli=
ni@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;=
&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel=
.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a hr=
ef=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.o=
rg</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@=
kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sst=
abellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailt=
o:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@k=
ernel.org</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt=
;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabel=
lini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt; &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@ke=
rnel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=
=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D=
"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; &lt;mailto:<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; This feature has not been merged in Xen u=
pstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt; &gt; would assume that upstream + the series on th=
e ML [1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0work<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt; Please clarify this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0&gt; Because the two thoughts are controversial.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0As Julien wrote, there is nothing controversial. As you=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0are awa=
re,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0Xilinx maintains a separate Xen tree specific for Xilin=
x<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0here:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/xilinx/xen" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;=
<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github=
.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xi=
linx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"h=
ttps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;=
&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://githu=
b.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/x=
ilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"=
https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https:/=
/github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://githu=
b.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/x=
ilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"=
https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt=
; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github=
.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xi=
linx/xen</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt; &lt;<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt=
;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D=
"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.com/x=
ilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/x=
en</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https:/=
/github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"no=
referrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<=
a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xili=
nx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen<=
/a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D=
"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;=
<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xil=
inx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen=
</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt; &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt=
; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github=
.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xi=
linx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xili=
nx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen<=
/a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a h=
ref=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/=
xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>=
&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://githu=
b.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/x=
ilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a>&gt;&gt;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D=
"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xe=
n" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &=
lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://git=
hub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt=
;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://=
github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/x=
ilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/x=
en</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt; &lt;<a href=3D"https://=
github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xe=
n" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&g=
t;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://git=
hub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"no=
referrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.co=
m/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilin=
x/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &l=
t;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/x=
ilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/x=
en</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"https=
://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://=
github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.c=
om/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xili=
nx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"htt=
ps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;=
 &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.co=
m/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilin=
x/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://gith=
ub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D=
"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;=
<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xil=
inx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen=
</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt;&gt; &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt=
; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github=
.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xi=
linx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx=
/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a=
> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"ht=
tps://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/xilinx/xen</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xili=
nx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen<=
/a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://gi=
thub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a h=
ref=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/=
xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>=
&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://githu=
b.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/x=
ilinx/xen</a>&gt;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a =
href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"http=
s://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a=
 href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilin=
x/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</=
a>&gt;&gt;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D=
"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xe=
n" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &=
lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://git=
hub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt=
;&gt;&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://=
github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/xilinx/xen</a>&gt; &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a> &lt;<a hre=
f=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/x=
ilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/x=
en</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt; &lt=
;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/xilinx/xen</a> &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0and the branch you are using (xlnx_rebase_4.16) comes<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from th=
ere.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0Instead, the upstream Xen tree lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"ht=
tps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" t=
arget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a=
> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" r=
el=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/=
?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenb=
its.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenb=
its.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;=
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"=
noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a hre=
f=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"norefe=
rrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:/=
/xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_b=
lank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&g=
t;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" tar=
get=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&=
gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>=
&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;&gt; &lt;=
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"=
noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.x=
en.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_b=
lank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a hr=
ef=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noref=
errer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsu=
mmary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.gi=
t;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"=
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer"=
 target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary<=
/a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" r=
el=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.=
org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenb=
its.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a h=
ref=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nore=
ferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Ds=
ummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:/=
/xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" tar=
get=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&=
gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>=
&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt; =
&lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=
=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.x=
en.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_b=
lank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a hr=
ef=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noref=
errer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsu=
mmary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.gi=
t;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"=
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer"=
 target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary<=
/a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" r=
el=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.=
org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenb=
its.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a h=
ref=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nore=
ferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Ds=
ummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:/=
/xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" tar=
get=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&=
gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>=
&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;&gt; &lt;=
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"=
noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.x=
en.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_b=
lank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a hr=
ef=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noref=
errer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsu=
mmary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.gi=
t;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"=
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer"=
 target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary<=
/a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" r=
el=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen=
.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.=
org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenb=
its.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_=
blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a h=
ref=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nore=
ferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Ds=
ummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:/=
/xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://xenbits.xen.org=
/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"http=
s://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" tar=
get=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&=
gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary"=
 rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dx=
en.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.or=
g/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"htt=
ps://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" ta=
rget=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>=
&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a =
href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"nor=
eferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https:=
//xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt=
;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummar=
y" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a href=3D"https://xe=
nbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D=
"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a>&gt;&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbit=
s.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_bl=
ank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt; &lt;<a=
 href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gi=
tweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xe=
n.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank"=
>https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D=
"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer=
" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary=
</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsum=
mary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?=
p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbi=
ts.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0The Cache Coloring feature that you are trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configu=
re is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.16, but not yet present upstream (ther=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is an<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0outstanding patch series to add cache coloring to Xen<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0upstrea=
m but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0hasn&#39;t been merged yet.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0Anyway, if you are using xlnx_rebase_4.16 it doesn&#39;=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0matter =
too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0you as you already have Cache Coloring as a feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0there.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0I take you are using ImageBuilder to generate the boot<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configu=
ration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0so, please post the ImageBuilder config file that you a=
re<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0using.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0But from the boot message, it looks like the colors<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configu=
ration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=
=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=
=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000176ab505fc0bf7c0--

