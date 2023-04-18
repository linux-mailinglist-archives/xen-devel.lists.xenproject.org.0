Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9466E5FB4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 13:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522766.812346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojOI-0005g7-L5; Tue, 18 Apr 2023 11:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522766.812346; Tue, 18 Apr 2023 11:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojOI-0005cp-Gy; Tue, 18 Apr 2023 11:20:54 +0000
Received: by outflank-mailman (input) for mailman id 522766;
 Tue, 18 Apr 2023 11:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bo8Z=AJ=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pojOG-0005cj-RY
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 11:20:53 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ea4000-dddb-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 13:20:51 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-63b5312bd4fso9425542b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Apr 2023 04:20:51 -0700 (PDT)
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
X-Inumbo-ID: 12ea4000-dddb-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816850; x=1684408850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ttz40n3jb2Gl/JJd/9WHgffwssF2y2cEEdgzY8wbPRY=;
        b=ivkg0ecCjVkkTgBgbAX4cFwKJGMuv1TBbLBLxHIsP76ClvZpqV6mYHoNFG6T+94w8p
         p/I7tNZpkuunTHgemAtZcdgeZPUvJ7pYXscpx1MnEWYU8wmALVnLvRry0lAHfCrBrfbP
         8/Atfz6TspFXrdwIkkM1gQ+3s3+wN1joCnIxLTYftpc7W2CaYia6r8bA+LlbUS36d0m7
         ojn5XKF3cD/Yk4GaTOIoTfQKAOjFrU2zobz5xr6rcKGH1jcINB9Zy5jEv1LVWBbu1RVT
         jDyJUxfuisysRUPQ7/M45VxzeRai69siA07iQy1rEe2gW6ZUb/kzGBgDXXQTlkGXVcOY
         kzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816850; x=1684408850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ttz40n3jb2Gl/JJd/9WHgffwssF2y2cEEdgzY8wbPRY=;
        b=I+Ulm0CGdiroPFM14RQmnnpvMEzdZFN2B9x/XSXABBxv2jsVz9w4L1g/fc6zAgTWkD
         uq2cW5n2TtShKhuk9VVHzfW6BeOESFv2nOj5thgmGa3YRxPzTnqdNxWfN8CbmmH6lfId
         /KQxRFimNVl67ZcidkuooDkHTHb4tjBzjMHydZZOfF7PeMg6sEKWweAWc5JlgtKi1Oh+
         bR5t57llaIMo3nJKrTKCH6pQOkIVtj1AoJ4cHK4HKwOLqQpmkGEe4t8Mzi9EZhWSWU4E
         9rc8C4bTXZSWeNrcoOMey0bwAoHWtW53zyT2cUfeAX372kTfQcC+7MLWfNHqFYPIt74e
         QcgQ==
X-Gm-Message-State: AAQBX9fR+ssGnWwqDdYLHufvAKu+9f2r0DVEAkcAcQWniKha3u3XVNVp
	46cZoWDnJpkfENidCnmhkUbs9ImDOUBBDgq3AlI=
X-Google-Smtp-Source: AKy350YvX4/zGxYhziZRAEryAT7HJSIJ+DO839nnG/fFPBb5rL5v9/Z1SrQwGjGS8nVcQpWVn9Rv7tvhHvZknu4+jdY=
X-Received: by 2002:a17:902:e743:b0:1a0:76e8:a4d with SMTP id
 p3-20020a170902e74300b001a076e80a4dmr1921357plf.14.1681816849574; Tue, 18 Apr
 2023 04:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com> <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org>
In-Reply-To: <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Tue, 18 Apr 2023 14:26:52 +0300
Message-ID: <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="000000000000e570bf05f99a7f7c"

--000000000000e570bf05f99a7f7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

>> This feature has not been merged in Xen upstream yet

> would assume that upstream + the series on the ML [1] work

Please clarify this point.
Because the two thoughts are controversial.

Regards,
Oleg

=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 14:09, Jul=
ien Grall <julien@xen.org>:

> Hi,
>
> I have added back xen-devel and the others. Please reply to all, so they
> can have the full conversation.
>
> On 18/04/2023 11:13, Oleg Nikitenko wrote:
> >> HW
> > Board: Xilinx ZynqMP
> >> Where are the banks located?
> >
> >> Where are the banks located?
> > I did not catch this question. Could you rephrase it ?
>
> I am referring to the memory bank. But you provided the board, so we
> should be able to infer them.
>
> >
> >> Where do you load the various modules (e.g. kernel, xen...)?
> > BOOTMOD_XEN,
> > BOOTMOD_FDT,
> > BOOTMOD_KERNEL
>
> At which address do you load them? What are there size?
>
> >
> > Should I use another branch ?
> > If yes then which one ?
>
> I don't know which branch would work on Xilinx ZynqMP with cache
> coloring (although I would assume that upstream + the series on the ML
> [1] work).
>
>
>  > A company's active branch is xlnx_rebase_4.16.
>
> The branch you pointed out is not directly maintained by Xen Project and
> from what you wrote below there are some differences with upstream. So
> it would be best if you speak directly with Xilinx/AMD. Stefano in CC
> should be able to assist you.
>
> Cheers,
>
> >
> > Regards,
> > Oleg
> >
> > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 12:31,=
 Oleg Nikitenko <oleshiiwood@gmail.com>:
> >
> >> Hi Julien,
> >>
> >> Thanks for the answer.
> >>
> >> A company's active branch is xlnx_rebase_4.16.
> >> There are added there patches
> >>
> >>  From c14a26b9c9e6dc5711f3155e44adee8dfa634e33 Mon Sep 17 00:00:00 200=
1
> >> From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
> >> Date: Mon, 25 Apr 2022 11:21:19 +0100
> >> Subject: [PATCH 1/6] xen/arm: smmuv1: Remove iommu group when deassign
> >>
> >>  From 6a7ace399f70f0001664d727476c59f211f389f5 Mon Sep 17 00:00:00 200=
1
> >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >> Date: Thu, 23 Jun 2022 11:52:47 -0700
> >> Subject: [PATCH 2/6] libxl: add support for emulated TPM on ARM
> >>
> >>  From 6dc26f1d82a8942dc5a00c55ee29ce4be5359529 Mon Sep 17 00:00:00 200=
1
> >> From: Tanmay Shah <tanmay.shah@xilinx.com>
> >> Date: Wed, 3 Aug 2022 08:56:56 -0700
> >> Subject: [PATCH 3/6] xen/eemi: Add EEMI calls to support SGI
> registration
> >>
> >>  From 9fd67311c1253a170b1364de070a7535551bba52 Mon Sep 17 00:00:00 200=
1
> >> From: Tanmay Shah <tanmay.shah@amd.com>
> >> Date: Thu, 4 Aug 2022 16:34:31 -0700
> >> Subject: [PATCH 4/6] xen: eemi: make xen passthrough for unknown EEMI
> calls
> >>   from Dom0
> >>
> >>  From f81a621a28dfde7b8d0d5c5c125f2f250291b7e8 Mon Sep 17 00:00:00 200=
1
> >> From: Michal Orzel <michal.orzel@amd.com>
> >> Date: Mon, 29 Aug 2022 15:09:07 +0200
> >> Subject: [PATCH 5/6] platforms: xilinx: Add support for mapping PM nod=
es
> >> into
> >>   64-bit addresses
> >>
> >>  From 47ce40314bbec31b683da56d007d14603f002d0c Mon Sep 17 00:00:00 200=
1
> >> From: Ayan Kumar Halder <ayankuma@amd.com>
> >> Date: Tue, 30 Aug 2022 12:48:25 +0100
> >> Subject: [PATCH 6/6] Arm: Enable BOOT_PIN_CTRL for Dom0
> >>
> >> Regards,
> >> Oleg
> >>
> >> =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:59=
, Julien Grall <julien@xen.org>:
> >>
> >>> +Stefano, + Bertrand, +Carlo,
> >>>
> >>> On 18/04/2023 09:43, Oleg Nikitenko wrote:
> >>>> Hello,
> >>>
> >>> Hi,
> >>>
> >>>> I tried to turn on this scheme and ran into panic.
> >>>> Where was I wrong ?
> >>>
> >>> This feature has not been merged in Xen upstream yet. So can you tell
> us
> >>> what patches did you apply or which tree?
> >>>
> >>>>
> >>>> Xen command line
> >>>> xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1=
600M
> >>>> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=
=3Dnull
> >>>> timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7"=
;
> >>>
> >>> Can you provide the following information:
> >>>    * HW
> >>>    * Where are the banks located?
> >>>    * Where do you load the various modules (e.g. kernel, xen...)?
> >>>
> >>>>
> >>>> Xen config color build settings
> >>>> CONFIG_COLORING=3Dy
> >>>>
> >>>> Xen log:
> >>>> (XEN) I/O virtualisation enabled
> >>>> (XEN)  - Dom0 mode: Relaxed
> >>>> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> >>>> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> >>>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> >>>> (XEN) Coloring general information
> >>>> (XEN) Way size: 64kB
> >>>> (XEN) Max. number of colors available: 16
> >>>> (XEN) Xen color(s): [ 0 ]
> >>>> (XEN) alternatives: Patching with alt table 00000000002cc690 ->
> >>>> 00000000002ccc0c
> >>>> (XEN) Color array allocation failed for dom0
> >>>> (XEN)
> >>>> (XEN) ****************************************
> >>>> (XEN) Panic on CPU 0:
> >>>> (XEN) Error creating domain 0
> >>>> (XEN) ****************************************
> >>>> (XEN)
> >>>> (XEN) Reboot in five seconds...
> >>>
> >>> Cheers,
> >>>
> >>> --
> >>> Julien Grall
> >>>
> >>
> >
>
> [1]
>
> https://lore.kernel.org/xen-devel/20230123154735.74832-1-carlo.nonato@min=
ervasys.tech
>
> --
> Julien Grall
>

--000000000000e570bf05f99a7f7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>&gt;&gt; This fea=
ture has not been merged in Xen upstream yet</div><div><br></div><div>&gt; =
would assume that upstream + the series on the ML [1] work</div><div><br></=
div><div>Please clarify this point.</div><div>Because the two thoughts are =
controversial.</div><div><br></div><div>Regards,</div><div>Oleg<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 14:09, Jul=
ien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt;:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I have added back xen-devel and the others. Please reply to all, so they <b=
r>
can have the full conversation.<br>
<br>
On 18/04/2023 11:13, Oleg Nikitenko wrote:<br>
&gt;&gt; HW<br>
&gt; Board: Xilinx ZynqMP<br>
&gt;&gt; Where are the banks located?<br>
&gt; <br>
&gt;&gt; Where are the banks located?<br>
&gt; I did not catch this question. Could you rephrase it ?<br>
<br>
I am referring to the memory bank. But you provided the board, so we <br>
should be able to infer them.<br>
<br>
&gt; <br>
&gt;&gt; Where do you load the various modules (e.g. kernel, xen...)?<br>
&gt; BOOTMOD_XEN,<br>
&gt; BOOTMOD_FDT,<br>
&gt; BOOTMOD_KERNEL<br>
<br>
At which address do you load them? What are there size?<br>
<br>
&gt; <br>
&gt; Should I use another branch ?<br>
&gt; If yes then which one ?<br>
<br>
I don&#39;t know which branch would work on Xilinx ZynqMP with cache <br>
coloring (although I would assume that upstream + the series on the ML <br>
[1] work).<br>
<br>
<br>
=C2=A0&gt; A company&#39;s active branch is xlnx_rebase_4.16.<br>
<br>
The branch you pointed out is not directly maintained by Xen Project and <b=
r>
from what you wrote below there are some differences with upstream. So <br>
it would be best if you speak directly with Xilinx/AMD. Stefano in CC <br>
should be able to assist you.<br>
<br>
Cheers,<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 12:31=
, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;:<br>
&gt; <br>
&gt;&gt; Hi Julien,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the answer.<br>
&gt;&gt;<br>
&gt;&gt; A company&#39;s active branch is xlnx_rebase_4.16.<br>
&gt;&gt; There are added there patches<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From c14a26b9c9e6dc5711f3155e44adee8dfa634e33 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Ayan Kumar Halder &lt;<a href=3D"mailto:ayan.kumar.halder@xi=
linx.com" target=3D"_blank">ayan.kumar.halder@xilinx.com</a>&gt;<br>
&gt;&gt; Date: Mon, 25 Apr 2022 11:21:19 +0100<br>
&gt;&gt; Subject: [PATCH 1/6] xen/arm: smmuv1: Remove iommu group when deas=
sign<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From 6a7ace399f70f0001664d727476c59f211f389f5 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@=
amd.com" target=3D"_blank">stefano.stabellini@amd.com</a>&gt;<br>
&gt;&gt; Date: Thu, 23 Jun 2022 11:52:47 -0700<br>
&gt;&gt; Subject: [PATCH 2/6] libxl: add support for emulated TPM on ARM<br=
>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From 6dc26f1d82a8942dc5a00c55ee29ce4be5359529 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Tanmay Shah &lt;<a href=3D"mailto:tanmay.shah@xilinx.com" ta=
rget=3D"_blank">tanmay.shah@xilinx.com</a>&gt;<br>
&gt;&gt; Date: Wed, 3 Aug 2022 08:56:56 -0700<br>
&gt;&gt; Subject: [PATCH 3/6] xen/eemi: Add EEMI calls to support SGI regis=
tration<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From 9fd67311c1253a170b1364de070a7535551bba52 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Tanmay Shah &lt;<a href=3D"mailto:tanmay.shah@amd.com" targe=
t=3D"_blank">tanmay.shah@amd.com</a>&gt;<br>
&gt;&gt; Date: Thu, 4 Aug 2022 16:34:31 -0700<br>
&gt;&gt; Subject: [PATCH 4/6] xen: eemi: make xen passthrough for unknown E=
EMI calls<br>
&gt;&gt;=C2=A0 =C2=A0from Dom0<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From f81a621a28dfde7b8d0d5c5c125f2f250291b7e8 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
&gt;&gt; Date: Mon, 29 Aug 2022 15:09:07 +0200<br>
&gt;&gt; Subject: [PATCH 5/6] platforms: xilinx: Add support for mapping PM=
 nodes<br>
&gt;&gt; into<br>
&gt;&gt;=C2=A0 =C2=A064-bit addresses<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 From 47ce40314bbec31b683da56d007d14603f002d0c Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; From: Ayan Kumar Halder &lt;<a href=3D"mailto:ayankuma@amd.com" ta=
rget=3D"_blank">ayankuma@amd.com</a>&gt;<br>
&gt;&gt; Date: Tue, 30 Aug 2022 12:48:25 +0100<br>
&gt;&gt; Subject: [PATCH 6/6] Arm: Enable BOOT_PIN_CTRL for Dom0<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Oleg<br>
&gt;&gt;<br>
&gt;&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 1=
1:59, Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">=
julien@xen.org</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt;&gt; +Stefano, + Bertrand, +Carlo,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 18/04/2023 09:43, Oleg Nikitenko wrote:<br>
&gt;&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I tried to turn on this scheme and ran into panic.<br>
&gt;&gt;&gt;&gt; Where was I wrong ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This feature has not been merged in Xen upstream yet. So can y=
ou tell us<br>
&gt;&gt;&gt; what patches did you apply or which tree?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Xen command line<br>
&gt;&gt;&gt;&gt; xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Dseria=
l0 dom0_mem=3D1600M<br>
&gt;&gt;&gt;&gt; dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnat=
ive sched=3Dnull<br>
&gt;&gt;&gt;&gt; timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3 dom0_col=
ors=3D4-7&quot;;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you provide the following information:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 * HW<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 * Where are the banks located?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 * Where do you load the various modules (e.g. ker=
nel, xen...)?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Xen config color build settings<br>
&gt;&gt;&gt;&gt; CONFIG_COLORING=3Dy<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Xen log:<br>
&gt;&gt;&gt;&gt; (XEN) I/O virtualisation enabled<br>
&gt;&gt;&gt;&gt; (XEN)=C2=A0 - Dom0 mode: Relaxed<br>
&gt;&gt;&gt;&gt; (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt;&gt;&gt;&gt; (XEN) P2M: 3 levels with order-1 root, VTCR 0x000000008002=
3558<br>
&gt;&gt;&gt;&gt; (XEN) Scheduling granularity: cpu, 1 CPU per sched-resourc=
e<br>
&gt;&gt;&gt;&gt; (XEN) Coloring general information<br>
&gt;&gt;&gt;&gt; (XEN) Way size: 64kB<br>
&gt;&gt;&gt;&gt; (XEN) Max. number of colors available: 16<br>
&gt;&gt;&gt;&gt; (XEN) Xen color(s): [ 0 ]<br>
&gt;&gt;&gt;&gt; (XEN) alternatives: Patching with alt table 00000000002cc6=
90 -&gt;<br>
&gt;&gt;&gt;&gt; 00000000002ccc0c<br>
&gt;&gt;&gt;&gt; (XEN) Color array allocation failed for dom0<br>
&gt;&gt;&gt;&gt; (XEN)<br>
&gt;&gt;&gt;&gt; (XEN) ****************************************<br>
&gt;&gt;&gt;&gt; (XEN) Panic on CPU 0:<br>
&gt;&gt;&gt;&gt; (XEN) Error creating domain 0<br>
&gt;&gt;&gt;&gt; (XEN) ****************************************<br>
&gt;&gt;&gt;&gt; (XEN)<br>
&gt;&gt;&gt;&gt; (XEN) Reboot in five seconds...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Julien Grall<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
[1] <br>
<a href=3D"https://lore.kernel.org/xen-devel/20230123154735.74832-1-carlo.n=
onato@minervasys.tech" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/xen-devel/20230123154735.74832-1-carlo.nonato@minervasys.tech</a><=
br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

--000000000000e570bf05f99a7f7c--

