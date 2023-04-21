Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF06EAAB8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 14:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524570.815610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppq8b-0006tP-TL; Fri, 21 Apr 2023 12:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524570.815610; Fri, 21 Apr 2023 12:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppq8b-0006qD-Ny; Fri, 21 Apr 2023 12:45:17 +0000
Received: by outflank-mailman (input) for mailman id 524570;
 Fri, 21 Apr 2023 12:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vNOs=AM=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1ppq8Z-0006q7-Pv
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 12:45:16 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb817dd-e042-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 14:45:14 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a8097c1ccfso24228895ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 05:45:13 -0700 (PDT)
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
X-Inumbo-ID: 5bb817dd-e042-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682081112; x=1684673112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A4gG0rQ74kXCDWOS46pNxleDjo9didPPqpRTQSkB1RE=;
        b=VKbxMr6bJRA+q/7wsJsfQs37LCnN6Y78Av3U2mLOkilNVkMhI2KwweAveXbOg9hjYe
         LotBSzd5uTahjZrHAOQTE7Rcu7GL7/IdbXoGrn/rXEiYSekpHbK/U20PFbhI3YG/1kmd
         Ci63tdDkAL2sl75WoUdLQWirhtVnVvgxzMp1QM17GgSezHMVBsdh4eBjfC6RR0HN0z5s
         Nrd1k4Ri0cNCW2/nJ9pgt8kFWskYsW3pOhyDYiZfhxb4+u33nZ/fTPBUyfH2Vdans/+Z
         shZ3RUmSdW13KISSZrwehfwaw9/fF6GvSkBvR6/3cvOkS4/4oTjN2DXeTWWvWcPFoNFD
         TSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682081112; x=1684673112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4gG0rQ74kXCDWOS46pNxleDjo9didPPqpRTQSkB1RE=;
        b=Tl+f0EZTslC1+mpPRBYklMf1G9Jydyd/XKzCkFtkM7/bb3g3YlsFQQx2UM6vCRa+JX
         PVibvQoJ0NXZU//WnJYIe8WardE+WedPcJcJYpZ1w6oGIOUeNQvXTLxDQe1I+B0Xjn+6
         gYBbN74Nf9dG0CEu8IIRON+MC7iW7Ci2DMZHEV4oAa7oNF8I/qLhfled49eAdptKByxX
         1Pn0YW+UanhSZW21NG/VOu9QjhyXnxRkqrt2Dg46an6xOwf420SPu8VRRSAYWFMmooHR
         Mi2i0D6K5KVI+QgX09fmhcjgadoJBNLaB6j4mBXD4PvwAwAXsG8L/8GbutO7kxaFc52G
         bJmg==
X-Gm-Message-State: AAQBX9emQ2j1m10E/KOPpMQ0oaDsuMLBY9qBq+kYWBhhaTLDdrUEvM/x
	QJT/esRMIlB8PbEJ2vxRH9XUXXMnNdem/Ei8rX0=
X-Google-Smtp-Source: AKy350bIXozbSDqI+IeXGgSHUcUQgbhOi7SfDLZDzi1lDvxOyklUwotWm0VJaZucnZsIMM+IkjNWYh9qM1Emk0ho6e0=
X-Received: by 2002:a17:903:11c4:b0:1a6:81bd:c4d9 with SMTP id
 q4-20020a17090311c400b001a681bdc4d9mr5404301plh.39.1682081112063; Fri, 21 Apr
 2023 05:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com>
 <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
 <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com> <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com>
In-Reply-To: <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Fri, 21 Apr 2023 15:49:32 +0300
Message-ID: <CA+SAi2upd1P=KzbQS2BpD5zr3+OA=mrq7JiC7Zou9XSEJ_OYhA@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="0000000000002b03cd05f9d80721"

--0000000000002b03cd05f9d80721
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michal,

I was not able to enable earlyprintk in the xen for now.
I decided to choose another way.
This is a xen's command line that I found out completely.

(XEN) $$$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpu=
s=3D2
dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dnull timer_slop=3D0

So you are absolutely right about a command line.
Now I am going to find out why xen did not have the correct parameters from
the device tree.

Regards,
Oleg

=D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16, Mic=
hal Orzel <michal.orzel@amd.com>:

>
> On 21/04/2023 10:04, Oleg Nikitenko wrote:
> >
> >
> >
> > Hello Michal,
> >
> > Yes, I use yocto.
> >
> > Yesterday all day long I tried to follow your suggestions.
> > I faced a problem.
> > Manually in the xen config build file I pasted the strings:
> In the .config file or in some Yocto file (listing additional Kconfig
> options) added to SRC_URI?
> You shouldn't really modify .config file but if you do, you should execut=
e
> "make olddefconfig" afterwards.
>
> >
> > CONFIG_EARLY_PRINTK
> > CONFIG_EARLY_PRINTK_ZYNQMP
> > CONFIG_EARLY_UART_CHOICE_CADENCE
> I hope you added =3Dy to them.
>
> Anyway, you have at least the following solutions:
> 1) Run bitbake xen -c menuconfig to properly set early printk
> 2) Find out how you enable other Kconfig options in your project (e.g.
> CONFIG_COLORING=3Dy that is not enabled by default)
> 3) Append the following to "xen/arch/arm/configs/arm64_defconfig":
> CONFIG_EARLY_PRINTK_ZYNQMP=3Dy
>
> ~Michal
>
> >
> > Host hangs in build time.
> > Maybe I did not set something in the config build file ?
> >
> > Regards,
> > Oleg
> >
> > =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:57,=
 Oleg Nikitenko <oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com>>:
> >
> >     Thanks Michal,
> >
> >     You gave me an idea.
> >     I am going to try it today.
> >
> >     Regards,
> >     O.
> >
> >     =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11=
:56, Oleg Nikitenko <oleshiiwood@gmail.com
> <mailto:oleshiiwood@gmail.com>>:
> >
> >         Thanks Stefano.
> >
> >         I am going to do it today.
> >
> >         Regards,
> >         O.
> >
> >         =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=
=B2 23:05, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
> >
> >             On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
> >             > Hi Michal,
> >             >
> >             > I corrected xen's command line.
> >             > Now it is
> >             > xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0
> dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dn=
ative
> sched=3Dnull
> >             > timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3
> dom0_colors=3D4-7";
> >
> >             4 colors is way too many for xen, just do xen_colors=3D0-0.
> There is no
> >             advantage in using more than 1 color for Xen.
> >
> >             4 colors is too few for dom0, if you are giving 1600M of
> memory to Dom0.
> >             Each color is 256M. For 1600M you should give at least 7
> colors. Try:
> >
> >             xen_colors=3D0-0 dom0_colors=3D1-8
> >
> >
> >
> >             > Unfortunately the result was the same.
> >             >
> >             > (XEN)  - Dom0 mode: Relaxed
> >             > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> >             > (XEN) P2M: 3 levels with order-1 root, VTCR
> 0x0000000080023558
> >             > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resour=
ce
> >             > (XEN) Coloring general information
> >             > (XEN) Way size: 64kB
> >             > (XEN) Max. number of colors available: 16
> >             > (XEN) Xen color(s): [ 0 ]
> >             > (XEN) alternatives: Patching with alt table
> 00000000002cc690 -> 00000000002ccc0c
> >             > (XEN) Color array allocation failed for dom0
> >             > (XEN)
> >             > (XEN) ****************************************
> >             > (XEN) Panic on CPU 0:
> >             > (XEN) Error creating domain 0
> >             > (XEN) ****************************************
> >             > (XEN)
> >             > (XEN) Reboot in five seconds...
> >             >
> >             > I am going to find out how command line arguments passed
> and parsed.
> >             >
> >             > Regards,
> >             > Oleg
> >             >
> >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3.=
 =D0=B2 11:25, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>:
> >             >       Hi Michal,
> >             >
> >             > You put my nose into the problem. Thank you.
> >             > I am going to use your point.
> >             > Let's see what happens.
> >             >
> >             > Regards,
> >             > Oleg
> >             >
> >             >
> >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3.=
 =D0=B2 10:37, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
> >             >       Hi Oleg,
> >             >
> >             >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
> >             >       >
> >             >       >
> >             >       >
> >             >       > Hello Stefano,
> >             >       >
> >             >       > Thanks for the clarification.
> >             >       > My company uses yocto for image generation.
> >             >       > What kind of information do you need to consult m=
e
> in this case ?
> >             >       >
> >             >       > Maybe modules sizes/addresses which were mentione=
d
> by @Julien Grall <mailto:julien@xen.org <mailto:julien@xen.org>> ?
> >             >
> >             >       Sorry for jumping into discussion, but FWICS the Xe=
n
> command line you provided seems to be not the one
> >             >       Xen booted with. The error you are observing most
> likely is due to dom0 colors configuration not being
> >             >       specified (i.e. lack of dom0_colors=3D<> parameter)=
.
> Although in the command line you provided, this parameter
> >             >       is set, I strongly doubt that this is the actual
> command line in use.
> >             >
> >             >       You wrote:
> >             >       xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dser=
ial0
> dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dn=
ative
> >             >       sched=3Dnull timer_slop=3D0 way_szize=3D65536
> xen_colors=3D0-3 dom0_colors=3D4-7";
> >             >
> >             >       but:
> >             >       1) way_szize has a typo
> >             >       2) you specified 4 colors (0-3) for Xen, but the
> boot log says that Xen has only one:
> >             >       (XEN) Xen color(s): [ 0 ]
> >             >
> >             >       This makes me believe that no colors configuration
> actually end up in command line that Xen booted with.
> >             >       Single color for Xen is a "default if not specified=
"
> and way size was probably calculated by asking HW.
> >             >
> >             >       So I would suggest to first cross-check the command
> line in use.
> >             >
> >             >       ~Michal
> >             >
> >             >
> >             >       >
> >             >       > Regards,
> >             >       > Oleg
> >             >       >
> >             >       > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=
=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
> >             >       >
> >             >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> >             >       >     > Hi Julien,
> >             >       >     >
> >             >       >     > >> This feature has not been merged in Xen
> upstream yet
> >             >       >     >
> >             >       >     > > would assume that upstream + the series o=
n
> the ML [1] work
> >             >       >     >
> >             >       >     > Please clarify this point.
> >             >       >     > Because the two thoughts are controversial.
> >             >       >
> >             >       >     Hi Oleg,
> >             >       >
> >             >       >     As Julien wrote, there is nothing
> controversial. As you are aware,
> >             >       >     Xilinx maintains a separate Xen tree specific
> for Xilinx here:
> >             >       >     https://github.com/xilinx/xen <
> https://github.com/xilinx/xen> <https://github.com/xilinx/xen <
> https://github.com/xilinx/xen>>
> >             >       >
> >             >       >     and the branch you are using
> (xlnx_rebase_4.16) comes from there.
> >             >       >
> >             >       >
> >             >       >     Instead, the upstream Xen tree lives here:
> >             >       >
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>>
> >             >       >
> >             >       >
> >             >       >     The Cache Coloring feature that you are tryin=
g
> to configure is present
> >             >       >     in xlnx_rebase_4.16, but not yet present
> upstream (there is an
> >             >       >     outstanding patch series to add cache colorin=
g
> to Xen upstream but it
> >             >       >     hasn't been merged yet.)
> >             >       >
> >             >       >
> >             >       >     Anyway, if you are using xlnx_rebase_4.16 it
> doesn't matter too much for
> >             >       >     you as you already have Cache Coloring as a
> feature there.
> >             >       >
> >             >       >
> >             >       >     I take you are using ImageBuilder to generate
> the boot configuration? If
> >             >       >     so, please post the ImageBuilder config file
> that you are using.
> >             >       >
> >             >       >     But from the boot message, it looks like the
> colors configuration for
> >             >       >     Dom0 is incorrect.
> >             >       >
> >             >
> >             >
> >             >
> >
>

--0000000000002b03cd05f9d80721
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbyBNaWNoYWwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JIHdhcyBub3QgYWJsZSB0byBlbmFibGUgZWFybHlwcmludGsgaW4gdGhlIHhlbiBmb3Igbm93
LjwvZGl2PjxkaXY+SSBkZWNpZGVkIHRvIGNob29zZSBhbm90aGVyIHdheS48L2Rpdj48ZGl2PlRo
aXMgaXMgYSB4ZW4mIzM5O3MgY29tbWFuZCBsaW5lIHRoYXQgSSBmb3VuZCBvdXQgY29tcGxldGVs
eS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PihYRU4pICQkJCQgY29uc29sZT1kdHVhcnQgZHR1
YXJ0PXNlcmlhbDAgZG9tMF9tZW09MTYwME0gZG9tMF9tYXhfdmNwdXM9MiBkb20wX3ZjcHVzX3Bp
biBib290c2NydWI9MCB2d2ZpPW5hdGl2ZSBzY2hlZD1udWxsIHRpbWVyX3Nsb3A9MDwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+U28geW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0IGFib3V0IGEgY29t
bWFuZCBsaW5lLjwvZGl2PjxkaXY+Tm93IEkgYW0gZ29pbmcgdG8gZmluZCBvdXQgd2h5IHhlbiBk
aWQgbm90IGhhdmUgdGhlIGNvcnJlY3QgcGFyYW1ldGVycyBmcm9tIHRoZSBkZXZpY2UgdHJlZS48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHMsPC9kaXY+PGRpdj5PbGVnPGJyPjwvZGl2
PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9
ImdtYWlsX2F0dHIiPtC/0YIsIDIxINCw0L/RgC4gMjAyM+KAr9CzLiDQsiAxMToxNiwgTWljaGFs
IE9yemVsICZsdDs8YSBocmVmPSJtYWlsdG86bWljaGFsLm9yemVsQGFtZC5jb20iPm1pY2hhbC5v
cnplbEBhbWQuY29tPC9hPiZndDs6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+DQpPbiAyMS8wNC8yMDIz
IDEwOjA0LCBPbGVnIE5pa2l0ZW5rbyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqA8YnI+DQom
Z3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyBIZWxsbyBNaWNoYWwsPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7IFllcywgSSB1c2UgeW9jdG8uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFllc3RlcmRheSBhbGwg
ZGF5IGxvbmcgSSB0cmllZCB0byBmb2xsb3cgeW91ciBzdWdnZXN0aW9ucy48YnI+DQomZ3Q7IEkg
ZmFjZWQgYSBwcm9ibGVtLjxicj4NCiZndDsgTWFudWFsbHkgaW4gdGhlIHhlbiBjb25maWcgYnVp
bGQgZmlsZSBJIHBhc3RlZCB0aGUgc3RyaW5nczo8YnI+DQpJbiB0aGUgLmNvbmZpZyBmaWxlIG9y
IGluIHNvbWUgWW9jdG8gZmlsZSAobGlzdGluZyBhZGRpdGlvbmFsIEtjb25maWcgb3B0aW9ucykg
YWRkZWQgdG8gU1JDX1VSST88YnI+DQpZb3Ugc2hvdWxkbiYjMzk7dCByZWFsbHkgbW9kaWZ5IC5j
b25maWcgZmlsZSBidXQgaWYgeW91IGRvLCB5b3Ugc2hvdWxkIGV4ZWN1dGUgJnF1b3Q7bWFrZSBv
bGRkZWZjb25maWcmcXVvdDsgYWZ0ZXJ3YXJkcy48YnI+DQo8YnI+DQomZ3Q7IDxicj4NCiZndDsg
Q09ORklHX0VBUkxZX1BSSU5USzxicj4NCiZndDsgQ09ORklHX0VBUkxZX1BSSU5US19aWU5RTVA8
YnI+DQomZ3Q7IENPTkZJR19FQVJMWV9VQVJUX0NIT0lDRV9DQURFTkNFPGJyPg0KSSBob3BlIHlv
dSBhZGRlZCA9eSB0byB0aGVtLjxicj4NCjxicj4NCkFueXdheSwgeW91IGhhdmUgYXQgbGVhc3Qg
dGhlIGZvbGxvd2luZyBzb2x1dGlvbnM6PGJyPg0KMSkgUnVuIGJpdGJha2UgeGVuIC1jIG1lbnVj
b25maWcgdG8gcHJvcGVybHkgc2V0IGVhcmx5IHByaW50azxicj4NCjIpIEZpbmQgb3V0IGhvdyB5
b3UgZW5hYmxlIG90aGVyIEtjb25maWcgb3B0aW9ucyBpbiB5b3VyIHByb2plY3QgKGUuZy4gQ09O
RklHX0NPTE9SSU5HPXkgdGhhdCBpcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0KTxicj4NCjMpIEFw
cGVuZCB0aGUgZm9sbG93aW5nIHRvICZxdW90O3hlbi9hcmNoL2FybS9jb25maWdzL2FybTY0X2Rl
ZmNvbmZpZyZxdW90Ozo8YnI+DQpDT05GSUdfRUFSTFlfUFJJTlRLX1pZTlFNUD15PGJyPg0KPGJy
Pg0Kfk1pY2hhbDxicj4NCjxicj4NCiZndDsgPGJyPg0KJmd0OyBIb3N0IGhhbmdzIGluIGJ1aWxk
IHRpbWUuwqA8YnI+DQomZ3Q7IE1heWJlIEkgZGlkIG5vdCBzZXQgc29tZXRoaW5nIGluIHRoZSBj
b25maWcgYnVpbGQgZmlsZSA/PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFJlZ2FyZHMsPGJyPg0KJmd0
OyBPbGVnPGJyPg0KJmd0OyA8YnI+DQomZ3Q7INGH0YIsIDIwINCw0L/RgC4gMjAyM+KAr9CzLiDQ
siAxMTo1NywgT2xlZyBOaWtpdGVua28gJmx0OzxhIGhyZWY9Im1haWx0bzpvbGVzaGlpd29vZEBn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5vbGVzaGlpd29vZEBnbWFpbC5jb208L2E+ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOm9sZXNoaWl3b29kQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPm9sZXNoaWl3b29kQGdtYWlsLmNvbTwvYT4mZ3Q7Jmd0Ozo8YnI+DQomZ3Q7IDxicj4NCiZn
dDvCoCDCoCDCoFRoYW5rcyBNaWNoYWwsPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBZb3Ug
Z2F2ZSBtZSBhbiBpZGVhLjxicj4NCiZndDvCoCDCoCDCoEkgYW0gZ29pbmcgdG8gdHJ5IGl0IHRv
ZGF5Ljxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAg
wqBPLjxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKg0YfRgiwgMjAg0LDQv9GALiAyMDIz4oCv
0LMuINCyIDExOjU2LCBPbGVnIE5pa2l0ZW5rbyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9sZXNoaWl3
b29kQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm9sZXNoaWl3b29kQGdtYWlsLmNvbTwvYT4g
Jmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86b2xlc2hpaXdvb2RAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+b2xlc2hpaXdvb2RAZ21haWwuY29tPC9hPiZndDsmZ3Q7Ojxicj4NCiZndDsgPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgVGhhbmtzIFN0ZWZhbm8uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqBJIGFtIGdvaW5nIHRvIGRvIGl0IHRvZGF5Ljxicj4NCiZndDsgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBPLjxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg0YHRgCwgMTkg0LDQv9GALiAyMDIz4oCv0LMu
INCyIDIzOjA1LCBTdGVmYW5vIFN0YWJlbGxpbmkgJmx0OzxhIGhyZWY9Im1haWx0bzpzc3RhYmVs
bGluaUBrZXJuZWwub3JnIiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwv
YT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86c3N0YWJlbGxpbmlAa2VybmVsLm9yZyIgdGFy
Z2V0PSJfYmxhbmsiPnNzdGFiZWxsaW5pQGtlcm5lbC5vcmc8L2E+Jmd0OyZndDs6PGJyPg0KJmd0
OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqBPbiBXZWQsIDE5IEFwciAyMDIzLCBPbGVn
IE5pa2l0ZW5rbyB3cm90ZTo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IEhpIE1p
Y2hhbCw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyBJIGNvcnJlY3RlZCB4ZW4mIzM5O3MgY29tbWFuZCBsaW5lLjxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgTm93IGl0IGlzPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyB4ZW4seGVuLWJvb3RhcmdzID0gJnF1b3Q7Y29uc29sZT1kdHVhcnQg
ZHR1YXJ0PXNlcmlhbDAgZG9tMF9tZW09MTYwME0gZG9tMF9tYXhfdmNwdXM9MiBkb20wX3ZjcHVz
X3BpbiBib290c2NydWI9MCB2d2ZpPW5hdGl2ZSBzY2hlZD1udWxsPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyB0aW1lcl9zbG9wPTAgd2F5X3NpemU9NjU1MzYgeGVuX2NvbG9ycz0w
LTMgZG9tMF9jb2xvcnM9NC03JnF1b3Q7Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgNCBjb2xvcnMgaXMgd2F5IHRvbyBtYW55IGZvciB4ZW4sIGp1c3QgZG8geGVuX2Nv
bG9ycz0wLTAuIFRoZXJlIGlzIG5vPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgYWR2YW50
YWdlIGluIHVzaW5nIG1vcmUgdGhhbiAxIGNvbG9yIGZvciBYZW4uPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqA0IGNvbG9ycyBpcyB0b28gZmV3IGZvciBkb20wLCBpZiB5
b3UgYXJlIGdpdmluZyAxNjAwTSBvZiBtZW1vcnkgdG8gRG9tMC48YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqBFYWNoIGNvbG9yIGlzIDI1Nk0uIEZvciAxNjAwTSB5b3Ugc2hvdWxkIGdpdmUg
YXQgbGVhc3QgNyBjb2xvcnMuIFRyeTo8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoHhlbl9jb2xvcnM9MC0wIGRvbTBfY29sb3JzPTEtODxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgVW5mb3J0dW5h
dGVseSB0aGUgcmVzdWx0IHdhcyB0aGUgc2FtZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVOKSDCoC0gRG9tMCBt
b2RlOiBSZWxheGVkPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVOKSBQMk06
IDQwLWJpdCBJUEEgd2l0aCA0MC1iaXQgUEEgYW5kIDgtYml0IFZNSUQ8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7IChYRU4pIFAyTTogMyBsZXZlbHMgd2l0aCBvcmRlci0xIHJvb3Qs
IFZUQ1IgMHgwMDAwMDAwMDgwMDIzNTU4PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
OyAoWEVOKSBTY2hlZHVsaW5nIGdyYW51bGFyaXR5OiBjcHUsIDEgQ1BVIHBlciBzY2hlZC1yZXNv
dXJjZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgKFhFTikgQ29sb3JpbmcgZ2Vu
ZXJhbCBpbmZvcm1hdGlvbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgKFhFTikg
V2F5IHNpemU6IDY0a0I8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IChYRU4pIE1h
eC4gbnVtYmVyIG9mIGNvbG9ycyBhdmFpbGFibGU6IDE2PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAoWEVOKSBYZW4gY29sb3Iocyk6IFsgMCBdPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyAoWEVOKSBhbHRlcm5hdGl2ZXM6IFBhdGNoaW5nIHdpdGggYWx0IHRhYmxl
IDAwMDAwMDAwMDAyY2M2OTAgLSZndDsgMDAwMDAwMDAwMDJjY2MwYzxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDsgKFhFTikgQ29sb3IgYXJyYXkgYWxsb2NhdGlvbiBmYWlsZWQgZm9y
IGRvbTA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IChYRU4pPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVOKSBQYW5p
YyBvbiBDUFUgMDo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IChYRU4pIEVycm9y
IGNyZWF0aW5nIGRvbWFpbiAwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVO
KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0OyAoWEVOKTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgKFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4uLjxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IEkgYW0gZ29pbmcg
dG8gZmluZCBvdXQgaG93IGNvbW1hbmQgbGluZSBhcmd1bWVudHMgcGFzc2VkIGFuZCBwYXJzZWQu
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IE9s
ZWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyDRgdGALCAxOSDQsNC/0YAuIDIwMjPigK/Qsy4g0LIgMTE6MjUsIE9sZWcg
TmlraXRlbmtvICZsdDs8YSBocmVmPSJtYWlsdG86b2xlc2hpaXdvb2RAZ21haWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+b2xlc2hpaXdvb2RAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpvbGVzaGlpd29vZEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5vbGVzaGlpd29v
ZEBnbWFpbC5jb208L2E+Jmd0OyZndDs6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgSGkgTWljaGFsLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFlvdSBwdXQgbXkgbm9zZSBpbnRvIHRo
ZSBwcm9ibGVtLiBUaGFuayB5b3UuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBJ
IGFtIGdvaW5nIHRvIHVzZSB5b3VyIHBvaW50Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgTGV0JiMzOTtzIHNlZSB3aGF0IGhhcHBlbnMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IE9sZWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDsg0YHRgCwgMTkg0LDQv9GALiAyMDIz4oCv0LMuINCyIDEw
OjM3LCBNaWNoYWwgT3J6ZWwgJmx0OzxhIGhyZWY9Im1haWx0bzptaWNoYWwub3J6ZWxAYW1kLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPm1pY2hhbC5vcnplbEBhbWQuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzptaWNoYWwub3J6ZWxAYW1kLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1pY2hh
bC5vcnplbEBhbWQuY29tPC9hPiZndDsmZ3Q7Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoEhpIE9sZWcsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoE9uIDE5LzA0LzIw
MjMgMDk6MDMsIE9sZWcgTmlraXRlbmtvIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBIZWxsbyBTdGVmYW5vLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0OyBNeSBjb21wYW55IHVzZXMgeW9jdG8gZm9y
IGltYWdlIGdlbmVyYXRpb24uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0OyBXaGF0IGtpbmQgb2YgaW5mb3JtYXRpb24gZG8geW91IG5lZWQgdG8gY29uc3Vs
dCBtZSBpbiB0aGlzIGNhc2UgPzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7IE1heWJlIG1vZHVsZXMgc2l6ZXMvYWRkcmVzc2VzIHdoaWNoIHdlcmUgbWVudGlvbmVkIGJ5
IEBKdWxpZW4gR3JhbGwgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86anVsaWVuQHhlbi5vcmci
IHRhcmdldD0iX2JsYW5rIj5qdWxpZW5AeGVuLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86anVsaWVuQHhlbi5vcmciIHRhcmdldD0iX2JsYW5rIj5qdWxpZW5AeGVuLm9yZzwvYT4m
Z3Q7Jmd0OyA/PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFNvcnJ5IGZvciBqdW1waW5nIGludG8gZGlz
Y3Vzc2lvbiwgYnV0IEZXSUNTIHRoZSBYZW4gY29tbWFuZCBsaW5lIHlvdSBwcm92aWRlZCBzZWVt
cyB0byBiZSBub3QgdGhlIG9uZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoFhlbiBib290ZWQgd2l0aC4gVGhlIGVycm9yIHlvdSBhcmUgb2JzZXJ2aW5nIG1vc3Qg
bGlrZWx5IGlzIGR1ZSB0byBkb20wIGNvbG9ycyBjb25maWd1cmF0aW9uIG5vdCBiZWluZzxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoHNwZWNpZmllZCAoaS5lLiBs
YWNrIG9mIGRvbTBfY29sb3JzPSZsdDsmZ3Q7IHBhcmFtZXRlcikuIEFsdGhvdWdoIGluIHRoZSBj
b21tYW5kIGxpbmUgeW91IHByb3ZpZGVkLCB0aGlzIHBhcmFtZXRlcjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoGlzIHNldCwgSSBzdHJvbmdseSBkb3VidCB0aGF0
IHRoaXMgaXMgdGhlIGFjdHVhbCBjb21tYW5kIGxpbmUgaW4gdXNlLjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqBZb3Ugd3JvdGU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgeGVuLHhlbi1ib290YXJncyA9ICZxdW90O2NvbnNvbGU9ZHR1YXJ0IGR0dWFydD1zZXJpYWww
IGRvbTBfbWVtPTE2MDBNIGRvbTBfbWF4X3ZjcHVzPTIgZG9tMF92Y3B1c19waW4gYm9vdHNjcnVi
PTAgdndmaT1uYXRpdmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqBzY2hlZD1udWxsIHRpbWVyX3Nsb3A9MCB3YXlfc3ppemU9NjU1MzYgeGVuX2NvbG9ycz0wLTMg
ZG9tMF9jb2xvcnM9NC03JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBidXQ6PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgMSkgd2F5X3N6aXplIGhhcyBhIHR5
cG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAyKSB5b3Ugc3Bl
Y2lmaWVkIDQgY29sb3JzICgwLTMpIGZvciBYZW4sIGJ1dCB0aGUgYm9vdCBsb2cgc2F5cyB0aGF0
IFhlbiBoYXMgb25seSBvbmU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgKFhFTikgWGVuIGNvbG9yKHMpOiBbIDAgXTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBUaGlz
IG1ha2VzIG1lIGJlbGlldmUgdGhhdCBubyBjb2xvcnMgY29uZmlndXJhdGlvbiBhY3R1YWxseSBl
bmQgdXAgaW4gY29tbWFuZCBsaW5lIHRoYXQgWGVuIGJvb3RlZCB3aXRoLjxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFNpbmdsZSBjb2xvciBmb3IgWGVuIGlzIGEg
JnF1b3Q7ZGVmYXVsdCBpZiBub3Qgc3BlY2lmaWVkJnF1b3Q7IGFuZCB3YXkgc2l6ZSB3YXMgcHJv
YmFibHkgY2FsY3VsYXRlZCBieSBhc2tpbmcgSFcuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFNvIEkg
d291bGQgc3VnZ2VzdCB0byBmaXJzdCBjcm9zcy1jaGVjayB0aGUgY29tbWFuZCBsaW5lIGluIHVz
ZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgfk1pY2hhbDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDsgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IE9sZWc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgJmd0OyDQstGCLCAxOCDQsNC/0YAuIDIwMjPigK/Qsy4g0LIgMjA6NDQsIFN0
ZWZhbm8gU3RhYmVsbGluaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNzdGFiZWxsaW5pQGtlcm5lbC5v
cmciIHRhcmdldD0iX2JsYW5rIj5zc3RhYmVsbGluaUBrZXJuZWwub3JnPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnIiB0YXJnZXQ9Il9ibGFuayI+
c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
OnNzdGFiZWxsaW5pQGtlcm5lbC5vcmciIHRhcmdldD0iX2JsYW5rIj5zc3RhYmVsbGluaUBrZXJu
ZWwub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+c3N0YWJlbGxpbmlAa2VybmVsLm9yZzwvYT4mZ3Q7Jmd0OyZn
dDs6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoE9uIFR1
ZSwgMTggQXByIDIwMjMsIE9sZWcgTmlraXRlbmtvIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDsgSGkgSnVsaWVuLDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAm
Z3Q7ICZndDsmZ3Q7IFRoaXMgZmVhdHVyZSBoYXMgbm90IGJlZW4gbWVyZ2VkIGluIFhlbiB1cHN0
cmVhbSB5ZXQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgJmd0OyAmZ3Q7IHdvdWxkIGFzc3VtZSB0aGF0IHVwc3RyZWFtICsgdGhlIHNl
cmllcyBvbiB0aGUgTUwgWzFdIHdvcms8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgJmd0OyBQbGVhc2UgY2xhcmlmeSB0aGlzIHBvaW50
Ljxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCZndDsgQmVjYXVzZSB0aGUgdHdvIHRob3VnaHRzIGFyZSBjb250cm92ZXJzaWFsLjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBIaSBPbGVnLDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBBcyBKdWxpZW4gd3JvdGUs
IHRoZXJlIGlzIG5vdGhpbmcgY29udHJvdmVyc2lhbC4gQXMgeW91IGFyZSBhd2FyZSw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqBYaWxpbngg
bWFpbnRhaW5zIGEgc2VwYXJhdGUgWGVuIHRyZWUgc3BlY2lmaWMgZm9yIFhpbGlueCBoZXJlOjxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoDxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS94aWxpbngveGVuIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20veGlsaW54L3hlbjwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS94aWxpbngveGVuIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdl
dD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20veGlsaW54L3hlbjwvYT4mZ3Q7ICZsdDs8YSBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20veGlsaW54L3hlbiIgcmVsPSJub3JlZmVycmVyIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3hpbGlueC94ZW48L2E+ICZsdDs8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20veGlsaW54L3hlbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3hpbGlueC94ZW48L2E+Jmd0OyZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgYW5kIHRoZSBicmFuY2gg
eW91IGFyZSB1c2luZyAoeGxueF9yZWJhc2VfNC4xNikgY29tZXMgZnJvbSB0aGVyZS48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoEluc3RlYWQsIHRoZSB1cHN0cmVhbSBY
ZW4gdHJlZSBsaXZlcyBoZXJlOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoDxhIGhyZWY9Imh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD14ZW4uZ2l0O2E9c3VtbWFyeSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zdW1tYXJ5PC9hPiAm
bHQ7PGEgaHJlZj0iaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1z
dW1tYXJ5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXN1bW1hcnk8L2E+Jmd0OyAmbHQ7PGEgaHJlZj0i
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zdW1tYXJ5IiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9eGVuLmdpdDthPXN1bW1hcnk8L2E+ICZsdDs8YSBocmVmPSJodHRwczovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXN1bW1hcnkiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9
c3VtbWFyeTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgVGhlIENhY2hlIENvbG9yaW5nIGZlYXR1cmUgdGhhdCB5b3UgYXJlIHRyeWluZyB0byBjb25m
aWd1cmUgaXMgcHJlc2VudDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoGluIHhsbnhfcmViYXNlXzQuMTYsIGJ1dCBub3QgeWV0IHByZXNlbnQg
dXBzdHJlYW0gKHRoZXJlIGlzIGFuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgb3V0c3RhbmRpbmcgcGF0Y2ggc2VyaWVzIHRvIGFkZCBjYWNo
ZSBjb2xvcmluZyB0byBYZW4gdXBzdHJlYW0gYnV0IGl0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgaGFzbiYjMzk7dCBiZWVuIG1lcmdlZCB5
ZXQuKTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgQW55d2F5LCBpZiB5
b3UgYXJlIHVzaW5nIHhsbnhfcmViYXNlXzQuMTYgaXQgZG9lc24mIzM5O3QgbWF0dGVyIHRvbyBt
dWNoIGZvcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoHlvdSBhcyB5b3UgYWxyZWFkeSBoYXZlIENhY2hlIENvbG9yaW5nIGFzIGEgZmVhdHVy
ZSB0aGVyZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoEkgdGFrZSB5
b3UgYXJlIHVzaW5nIEltYWdlQnVpbGRlciB0byBnZW5lcmF0ZSB0aGUgYm9vdCBjb25maWd1cmF0
aW9uPyBJZjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoHNvLCBwbGVhc2UgcG9zdCB0aGUgSW1hZ2VCdWlsZGVyIGNvbmZpZyBmaWxlIHRoYXQg
eW91IGFyZSB1c2luZy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgQnV0IGZyb20gdGhlIGJvb3QgbWVzc2FnZSwgaXQgbG9va3MgbGlrZSB0aGUgY29sb3Jz
IGNvbmZpZ3VyYXRpb24gZm9yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgRG9tMCBpcyBpbmNvcnJlY3QuPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyA8YnI+DQomZ3Q7IDxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj4NCg==
--0000000000002b03cd05f9d80721--

