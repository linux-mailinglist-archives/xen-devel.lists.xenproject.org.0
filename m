Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B142D546
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209080.365421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawHZ-0008N2-8d; Thu, 14 Oct 2021 08:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209080.365421; Thu, 14 Oct 2021 08:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawHZ-0008L6-4o; Thu, 14 Oct 2021 08:40:09 +0000
Received: by outflank-mailman (input) for mailman id 209080;
 Thu, 14 Oct 2021 08:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nGJ=PC=gmail.com=ysaikiran1997@srs-us1.protection.inumbo.net>)
 id 1mawHX-0008L0-Fz
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:40:07 +0000
Received: from mail-yb1-xb36.google.com (unknown [2607:f8b0:4864:20::b36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22bb5427-aed9-456e-912d-4b6dc3dbc337;
 Thu, 14 Oct 2021 08:40:05 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id a7so12861473yba.6
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 01:40:05 -0700 (PDT)
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
X-Inumbo-ID: 22bb5427-aed9-456e-912d-4b6dc3dbc337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtsxOh8d/WhChlp/Vvmhv2Ybki6Kg8BaVdg7lTTh+N8=;
        b=Tj+FQMSG+GZVtyd3QFOcXtBpXk/G1ujmuIB98ex5YBgU4eUrOwszi6e/AAAKYnOyBR
         z/78gOBlrcP0BHv12xAhEz3IXw2xVwmt9KnBRMPYhAfRZGe9g9d4UyAGBMBibuoab1K+
         pHeSPuV/FdoK7eluEN9eUP0tg4j4K/N5lV2yZgO8KA+HqZWk4w5fhHsI/pXw3RkOiTHT
         4tQ7t8IxUkEEEIaumuhTcvhFyCFu4wicmmucCyi8AKcmhK2uPzrJArNYJFoDFMkxCcva
         b5SMB5DnrUqLbL2+plArdIcSB+OzTye7hIZ7PR5IEq8bFxy8Gv/ut7n5/SLKmZMDD5dm
         dgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtsxOh8d/WhChlp/Vvmhv2Ybki6Kg8BaVdg7lTTh+N8=;
        b=6HeG2tDqm+Nx8ew/NV1XnWtDiP1Wg7cdIjiCeHbpv+nu3Erw5Se9242F4csLrUz9me
         Gh/OW4w53Wq8h/6jPoM0MN27sFlCkz1j9DrXL0dsajGALTAvXHtZ9bHW9c6IkQEVQ5Dd
         qr09iyA6TuDTklec4VwDP2gZHzo3OHFXtuoMODsMPR1KZuuV3nIOQ+SU0OdV6j4nIX8k
         O/sI3mhzLYUs7/XgQHBDljKaRGTXI3P4LWf/542ZqrLqnM/bjSzTr2D19iynq+hv/o7/
         pbXC6e1m3yTECekdhBOLPUGKnfh9OIoUEXUoXz9XJH90cFhFnryAnQ/lPhZCJvOrDEA7
         ZLYA==
X-Gm-Message-State: AOAM533rSqPMr5SvZsd6ij4qZYXa2RASaZqW4jJBv4tBzIQ/WHJw1itC
	++6n16JPz0hPSK4R0U5ueNUV384hlMSjFBm/Mak=
X-Google-Smtp-Source: ABdhPJzsuAqoULsbim9Nm8wel/diGFhLbhy00aMM3CQFw4dkK+DgajGeRhLXciFVC67idXlDXvV/75JLywC5ZdpMfkc=
X-Received: by 2002:a25:2610:: with SMTP id m16mr4792175ybm.508.1634200805017;
 Thu, 14 Oct 2021 01:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
 <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
 <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com>
 <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
 <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
 <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com> <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s>
From: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
Date: Thu, 14 Oct 2021 14:09:53 +0530
Message-ID: <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com>
Subject: Re: Xen Booting Problem on ARM Machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	xen-devel@lists.xenproject.org, kannan@cimware.in
Content-Type: multipart/alternative; boundary="000000000000798b7005ce4c0616"

--000000000000798b7005ce4c0616
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 5:45 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
> > On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       Yes there are other ways but without serial is going to be
> difficult
> >       because you are not going to see anything until everything works.
> >
> >       How do you boot Xen and Dom0 exactly from EDK2? Are you using GRU=
B
> or
> >       loading Xen directly from the EDK2 prompt? Please provide as many
> >       details as possible so that I might be able to spot any errors.
> >
> > I am using GRUB to load Xen. In the GRUB menu, I see two options.
> > Option 1: Debian 11 with latest Linux Kernel
> > Option 2: Debian 11(with Xen hypervisor) with latest Kernel
> >
> >       Can you provide the Device Tree you are using? If you are not
> passing
> >       any Device Tree  binary explicitely, then it might be passed
> >       automatically from EDK2 to Linux/Xen. In that case, just boot fro=
m
> Linux
> >       then do the following to retrieve the Device Tree:
> >
> >       dtc -I fs -O dts /proc/device-tree > host.dts
> >
> >       Then please attach host.dts to this email thread.
> >
> > Yeah, you are right. It looks like LInux is booting from ACPI. In the
> bootloader menu, "Automatic ACPI configuration" is disabled. So, I
> > thought that Linux may be booting from Device Tree. I have tried the
> "dtc" command you mentioned. But it looks like there's no device-tree
> > under "/proc". I also tried to get DT info, from
> "/sys/firmware/devicetree/base" . But, there's no info. under devicetree
> folder. I am not
> > quite sure how to get the DT info, if the Linux is booting from ACPI. I
> am attaching .dsl files, that contain the acpi info.
>
> OK, so it is pretty clear that even if "Automatic ACPI configuration" is
> disabled, it is still booting with ACPI.
>
>
> >       Also for your information it looks like Linux actually booted fro=
m
> ACPI,
> >       not from Device Tree, as you can see from all the "ACPI" messages
> in the
> >       kernel logs.
> >
> >       If you need to boot from ACPI, then you need to enable ACPI
> support in
> >       Xen, which is disabled by default. You can do that using make
> >       menuconfig.
> >
> > In the make menuconfig of Xen, I do not see any option to enable ACPI.
>
> You definitely need to enable ACPI support in Xen, if you are booting
> from ACPI, otherwise nothing is going to work.
>
> On the latest staging (https://gitlab.com/xen-project/xen) you can
> enable ACPI as follows:
>
>
> # export CROSS_COMPILE=3D/path/to/cross-compiler
> # export XEN_TARGET_ARCH=3Darm64
> # cd xen.git/xen
> # make menuconfig
> #   --> Configure UNSUPPORTED features
> #   --> Architecture Features --> ACPI
> # make
>

Hi

I got the code from Gitlab and installed it, enabling ACPI support in Xen.
As I reboot the system, I am able to see 2 options like before.
Option 1: Debian with latest kernel
Option 2 : Debian with Xen

I have selected Option 2. I did not see any bootinfo membanks error.
However, there is the following error in GRUB(just for a fraction of a
second).

"Using modules provided by boot loader in FDT
  Xen 4.16-unstable (c/s Wed Oct 13 13 13:28:43 2021 -0700 git:4cfab4425d)
EFI Loader
  Couldn't obtain the File System Protocol Interface: ErrCode:
0x8000000000000002"

I have enabled earlyprintk. I do not see any messages in the Serial. There
seems to be some problem with the gitlab version of Xen.



> Cheers,
>
> Stefano
>
>
> >       On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> >       > Hi,
> >       > Sorry about the delay. We have been trying to access the serial
> of the machine. Tried with couple of JTAG connectors. There's
> >       still no
> >       > debug messages on the serial. Is there any other way of figurin=
g
> this out?
> >       >
> >       > On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       Something is off. When you enabled earlyprintk in Xen, yo=
u
> should see
> >       >       something like this at boot time:
> >       >       https://marc.info/?l=3Dxen-devel&m=3D158829968025334
> >       >
> >       >       All the Xen logs starting with "(XEN)" on the serial. Do
> you have access
> >       >       to the serial of the machine? Without it, it is going to
> be hard to
> >       >       debug.
> >       >
> >       >
> >       >       On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> >       >       > In the folder "/var/log", there's a file called "xen",
> which is empty. As far as the boot logs are concerned, I don't
> >       see any
> >       >       debug
> >       >       > messages related to xen. I am attaching the log files,
> "kern.txt" and "boot.txt"
> >       >       >
> >       >       > On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrot=
e:
> >       >       >       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <
> julien@xen.org> wrote:
> >       >       >       >
> >       >       >       >
> >       >       >       >       On 08/09/2021 11:43, Sai Kiran wrote:
> >       >       >       >       > Hello,
> >       >       >       >
> >       >       >       >       Hi,
> >       >       >       >
> >       >       >       >       Thank you for the report. Moving the
> discussion back to xen-devel
> >       >       >       >       because this looks like a potential issue
> in the UEFI stub in Xen.
> >       >       >       >
> >       >       >       >       > I have Xen-4.15.0 on an ARM Machine,
> with Debian 11 installed on it.
> >       >       >       >
> >       >       >       >       Would you be able to give more details on
> the Arm machine you are using?
> >       >       >       >       Also, are you using ACPI or DT to boot?
> >       >       >       >
> >       >       >       >
> >       >       >       >    Sai >> DT . ACPI configuration is disabled i=
n
> Boot settings
> >       >       >       >
> >       >       >       >       >  I
> >       >       >       >       > am able to do =E2=80=9Cmake world=E2=80=
=9D and =E2=80=9Cmake
> install=E2=80=9D, after =E2=80=9C./configure=E2=80=9D, as
> >       >       >       >       > specified in README file. When I reboot
> the system, I get the following
> >       >       >       >       > message:
> >       >       >       >       >
> >       >       >       >       > Warning: All 128 bootinfo mem banks
> exhausted.
> >       >       >       >       >
> >       >       >       >       > Warning: All 128 bootinfo mem banks
> exhausted.
> >       >       >       >
> >       >       >       >       Hmmm... This means that you have more tha=
n
> 128 memory regions described
> >       >       >       >       in the EFI memory map. That's quite a lot=
.
> >       >       >       >
> >       >       >       >       Although, this should be harmless as it
> means Xen will not use the extra
> >       >       >       >       memory banks.
> >       >       >       >
> >       >       >       >       >
> >       >       >       >       > Cannot exit boot services: ErrCode:
> 0x8000000000000002
> >       >       >       >
> >       >       >       >       This means EFI_INVALID_PARAMETER. We have
> code to retry because AFAICT
> >       >       >       >       ExitBootServices() may sometime fails (I
> have CCed Jan may have more
> >       >       >       >       idea what's happening).
> >       >       >       >
> >       >       >       >       Would you be able to provide more details
> on the UEFI firmware you are
> >       >       >       >       using? Is it EDK2 or U-boot?
> >       >       >       >
> >       >       >       > Sai >>  EDK2
> >       >       >       >       Also, do you know if Linux is boot on the
> same system?
> >       >       >       >
> >       >       >       > Sai >> Yes
> >       >       >       >       However, AFAICT, the error message would
> not prevent Xen to continue
> >       >       >       >       booting. So you may get stuck later in th=
e
> boot process.
> >       >       >       >
> >       >       >       >       My suggestion would be to enable
> earlyprintk for your platform. You can
> >       >       >       >       setup it up from the menuconfig in
> "Debugging Options".
> >       >       >       >
> >       >       >       > Sai >> Yes, I have enabled earlyprintk.
> >       >       >       > I tried changing NR_MEM_BANKS(in
> xen/include/asm-arm/setup.h) value to 256, from 128. The error message is=
 no
> >       longer
> >       >       seen,
> >       >       >       but the device
> >       >       >       > is stuck in the boot process.
> >       >       >
> >       >       >       Could you please post the boot logs now that you
> enabled earlyprintk?
> >       >       >       Ideally not a camera picture but a textual
> copy/paste from the target
> >       >       >       serial?
> >       >       >
> >       >       >       Earlyprintk is pretty verbose, we should be able
> to figure out where it
> >       >       >       gets stuck.
> >       >       >
> >       >       >
> >       >       >
> >       >
> >       >
> >       >
> >
> >
> >


Thanks & Regards,
Sai Kiran.

--000000000000798b7005ce4c0616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 5:45 AM Stefa=
no Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@ker=
nel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt; On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini &lt;<a href=3D"mailt=
o:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yes there are other ways but without serial =
is going to be difficult<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0because you are not going to see anything un=
til everything works.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How do you boot Xen and Dom0 exactly from ED=
K2? Are you using GRUB or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0loading Xen directly from the EDK2 prompt? P=
lease provide as many<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0details as possible so that I might be able =
to spot any errors.<br>
&gt; <br>
&gt; I am using GRUB to load Xen. In the GRUB menu, I see two options.=C2=
=A0<br>
&gt; Option 1: Debian 11 with latest Linux Kernel<br>
&gt; Option 2: Debian 11(with Xen hypervisor) with latest Kernel<br>
&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Can you provide the Device Tree you are usin=
g? If you are not passing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0any Device Tree=C2=A0 binary explicitely, th=
en it might be passed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0automatically from EDK2 to Linux/Xen. In tha=
t case, just boot from Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0then do the following to retrieve the Device=
 Tree:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dtc -I fs -O dts /proc/device-tree &gt; host=
.dts<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Then please attach host.dts to this email th=
read.<br>
&gt; <br>
&gt; Yeah, you are right. It looks like LInux is booting from ACPI. In the =
bootloader menu, &quot;Automatic ACPI configuration&quot; is disabled. So, =
I<br>
&gt; thought that Linux may be booting from Device Tree. I have tried the &=
quot;dtc&quot; command you mentioned. But it looks like there&#39;s no devi=
ce-tree<br>
&gt; under &quot;/proc&quot;. I also tried to get DT info, from &quot;/sys/=
firmware/devicetree/base&quot; . But, there&#39;s no info. under devicetree=
 folder. I am not<br>
&gt; quite sure how to get the DT info, if the Linux is booting from ACPI. =
I am attaching .dsl files, that contain the acpi info.<br>
<br>
OK, so it is pretty clear that even if &quot;Automatic ACPI configuration&q=
uot; is<br>
disabled, it is still booting with ACPI.<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also for your information it looks like Linu=
x actually booted from ACPI,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not from Device Tree, as you can see from al=
l the &quot;ACPI&quot; messages in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel logs.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you need to boot from ACPI, then you need=
 to enable ACPI support in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen, which is disabled by default. You can d=
o that using make<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0menuconfig.<br>
&gt; <br>
&gt; In the make menuconfig of Xen, I do not see any option to enable ACPI.=
=C2=A0=C2=A0<br>
<br>
You definitely need to enable ACPI support in Xen, if you are booting<br>
from ACPI, otherwise nothing is going to work.<br>
<br>
On the latest staging (<a href=3D"https://gitlab.com/xen-project/xen" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/xen</a>) y=
ou can<br>
enable ACPI as follows:<br>
<br>
<br>
# export CROSS_COMPILE=3D/path/to/cross-compiler<br>
# export XEN_TARGET_ARCH=3Darm64<br>
# cd xen.git/xen<br>
# make menuconfig<br>
#=C2=A0 =C2=A0--&gt; Configure UNSUPPORTED features<br>
#=C2=A0 =C2=A0--&gt; Architecture Features --&gt; ACPI<br>
# make<br></blockquote><div><br></div><div>Hi</div><div><br></div><div>I go=
t the code from Gitlab and installed it, enabling ACPI support in Xen. As I=
 reboot the system, I am able to see 2 options like before.=C2=A0</div><div=
>Option 1: Debian with latest kernel</div><div>Option 2 : Debian with Xen</=
div><div><br></div><div>I have selected Option 2. I did not see any bootinf=
o membanks=C2=A0error. However, there is the following error in GRUB(just f=
or a fraction of a second).=C2=A0</div><div><br></div><div>&quot;Using modu=
les provided by boot loader in FDT</div><div>=C2=A0 Xen 4.16-unstable (c/s =
Wed Oct 13 13 13:28:43 2021 -0700 git:4cfab4425d) EFI Loader</div><div>=C2=
=A0 Couldn&#39;t obtain the File System Protocol Interface: ErrCode: 0x8000=
000000000002&quot;</div><div><br></div><div>I have enabled earlyprintk. I d=
o not see any messages in the Serial. There seems to be some problem with t=
he gitlab version of Xen.</div><div><br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sorry about the delay. We have been try=
ing to access the serial of the machine. Tried with couple of JTAG connecto=
rs. There&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0still no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; debug messages on the serial. Is there =
any other way of figuring this out?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Wed, Sep 15, 2021, 7:02 AM Stefano S=
tabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">s=
stabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Something is =
off. When you enabled earlyprintk in Xen, you should see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0something lik=
e this at boot time:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://marc.info/?l=3Dxen-devel&amp;m=3D158829968025334" rel=3D"noreferrer" =
target=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=3D158829968025334<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0All the Xen l=
ogs starting with &quot;(XEN)&quot; on the serial. Do you have access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to the serial=
 of the machine? Without it, it is going to be hard to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debug.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 14 Se=
p 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In the f=
older &quot;/var/log&quot;, there&#39;s a file called &quot;xen&quot;, whic=
h is empty. As far as the boot logs are=C2=A0concerned, I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0see any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; messages=
 related to xen. I am attaching the log files, &quot;kern.txt&quot; and &qu=
ot;boot.txt&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, =
Sep 14, 2021 at 3:08 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Sep 10, 2021 at 7:30 PM Julien Grall &lt;<=
a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 08/09/2021 11:43, Sai=
 Kiran wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Thank you for the report=
. Moving the discussion back to xen-devel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0because this looks like =
a potential issue in the UEFI stub in Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have Xen-4.15.0 o=
n an ARM Machine, with Debian 11 installed on it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Would you be able to giv=
e more details on the Arm machine you are using?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, are you using ACPI=
 or DT to boot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0Sai &gt;&gt; DT . ACPI configuration =
is disabled in Boot settings=C2=A0 =C2=A0=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; am able to do =E2=
=80=9Cmake world=E2=80=9D and =E2=80=9Cmake install=E2=80=9D, after =E2=80=
=9C./configure=E2=80=9D, as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; specified in README=
 file. When I reboot the system, I get the following<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Warning: All 128 bo=
otinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Warning: All 128 bo=
otinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hmmm... This means that =
you have more than 128 memory regions described<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in the EFI memory map. T=
hat&#39;s quite a lot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Although, this should be=
 harmless as it means Xen will not use the extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory banks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Cannot exit boot se=
rvices: ErrCode: 0x8000000000000002<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This means EFI_INVALID_P=
ARAMETER. We have code to retry because AFAICT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ExitBootServices() may s=
ometime fails (I have CCed Jan may have more<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0idea what&#39;s happenin=
g).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Would you be able to pro=
vide more details on the UEFI firmware you are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0using? Is it EDK2 or U-b=
oot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt;=C2=A0 EDK2=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, do you know if Lin=
ux is boot on the same system?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt; Yes=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0However, AFAICT, the err=
or message would not prevent Xen to continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0booting. So you may get =
stuck later in the boot process.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0My suggestion would be t=
o enable earlyprintk for your platform. You can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setup it up from the men=
uconfig in &quot;Debugging Options&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt; Yes, I have enabled earlyprintk.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; I tried changing NR_MEM_BANKS(in xen/include/asm-a=
rm/setup.h) value to 256, from 128. The error message is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0but the device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&gt; is stuck in the boot process.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Could you please post the boot logs now that you enable=
d earlyprintk?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Ideally not a camera picture but a textual copy/paste f=
rom the target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0serial?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Earlyprintk is pretty verbose, we should be able to fig=
ure out where it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0gets stuck.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt;</blockquote><div><br></div><div>Thanks &amp; Regards,</div><div>Sai Ki=
ran.=C2=A0</div></div></div>

--000000000000798b7005ce4c0616--

