Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196C3B0FF3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 00:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146099.268753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvofN-0004hl-55; Tue, 22 Jun 2021 22:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146099.268753; Tue, 22 Jun 2021 22:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvofN-0004fw-1s; Tue, 22 Jun 2021 22:14:45 +0000
Received: by outflank-mailman (input) for mailman id 146099;
 Tue, 22 Jun 2021 22:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wlN=LQ=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1lvofL-0004fq-SJ
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 22:14:43 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d72308e-ec4a-461a-8cbb-6445ecc69c20;
 Tue, 22 Jun 2021 22:14:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m14so785566edp.9
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 15:14:42 -0700 (PDT)
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
X-Inumbo-ID: 7d72308e-ec4a-461a-8cbb-6445ecc69c20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQhxyhRnTRTY0cR8GsvGYgrV9DB7RNLvWVlnB6Bthts=;
        b=Lh8JSPc1M0omiw4UZ0sBQxYU+C1Zpod/Msvcbpq/60CtEtcmuw8x9HKFXtLSJlCxcZ
         g7Jmnl9tUAzCdd9jloamHl5B2OtYH0yJdXlURQT5uVvciyQdNO3IJeDQSOjrZqp/x6v+
         gm3rKmqMJ7ZVnCsbY2luiB5PKnHvMyA5ZSvxyaAFFJtmpASerC+qb2M73pkCMpaMcIMR
         SrGrTnxMeOKOiTHrKtbarSrKfQAKK/NfgHAopwUNl8eYQqhDtjhneaIme+2AOhWFQdkp
         THKxDUdkhaXO00FTWqP4vpKFOTNng89Rq/DBAa9HH1LtkRFIkDqse2CLnu7ywpTBYa/3
         OQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQhxyhRnTRTY0cR8GsvGYgrV9DB7RNLvWVlnB6Bthts=;
        b=E2im2DvBJPDd4ngORayOiO+cV+2PFFZFaTK91RNX/U3zeh38xZ8xY1C9koKzulRwl3
         amt3p5x3G5e/qDuxVikhB4a1NmLkUmU0KLHF1d2N2P9P4u8PfDqbpdZTItJZ+Q2uAzzo
         EXIbr1iawjxb68WPJcUw95+faMulYGESiuuQD1SWtErBT7VsfEYfVDNc9JczgBhJHhwg
         t2z/P0DUDgGxyrI2ANzzHqR360n9wWkiSsCvrYAY95gcVZoc7CUlVijjGIdQ/AJlTajY
         LPpYLN6MM36L2Sek83P3ZXHzZhLWmwcQErEbAQnZsOea6RWzrn2D6yoBEpN9EJNRTJa0
         08LA==
X-Gm-Message-State: AOAM532IELkLXl9X2E6s+74eRekvHukb6fc1HpuzhtuyD4VCbNeNlsli
	uVFqzA0Npd0y58Gmfwfmr0PeiTVw7IUBxYA2ugw=
X-Google-Smtp-Source: ABdhPJx5ubdq1k8iUYuQVNi+WzSoOERtGQEBP5z7vjQZOdSgGI0F08X+GnmH45Vv9SoCYeuU+K9HMrTKLA/crd9pgqo=
X-Received: by 2002:a50:fd1a:: with SMTP id i26mr7972891eds.181.1624400081183;
 Tue, 22 Jun 2021 15:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
 <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
 <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com>
 <CABfawh=W92ioejsZ-zu+WVofw_jfxVLteVieC2Ysfxd3Wrs+Og@mail.gmail.com>
 <CAHPMNWcfz+9zUv7gfwu5V6zPVBHiFc-EZDJ70-4DWHjOtyBOHg@mail.gmail.com> <CABfawhkMb8Pnr6+NxsoaXKCyaBH8Tax8_1ABHjyGGp5j9hOkVA@mail.gmail.com>
In-Reply-To: <CABfawhkMb8Pnr6+NxsoaXKCyaBH8Tax8_1ABHjyGGp5j9hOkVA@mail.gmail.com>
From: Neil Sikka <neilsikka@gmail.com>
Date: Tue, 22 Jun 2021 18:14:29 -0400
Message-ID: <CAHPMNWc4CjdpusJ_8RsdE1UMd1KjbTaRE7=cxxvd01A=tmWVcg@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000cfe63405c5621dab"

--000000000000cfe63405c5621dab
Content-Type: text/plain; charset="UTF-8"

I figured it out. Microsoft did not document that testsigning needs to be
enabled for kdnet to work.

On Tue, Jun 22, 2021 at 2:12 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

> Make sure windbg is already waiting for the connection from the
> debugee by the time Windows starts booting. If you try to attach
> windbg later it won't work. It worked for me but obviously YMMV.
>
> Tamas
>
> On Tue, Jun 22, 2021 at 2:07 PM Neil Sikka <neilsikka@gmail.com> wrote:
> >
> > I tried that, but it seems like I'm getting an interrupt storm on the
> debugger VM (CPU spends all its time in the kernel) when I try to attach
> the debugger. This observation furthers my suspicion that there is
> communication, but there is something wrong with the protocol...
> >
> > On Tue, Jun 22, 2021 at 12:43 PM Tamas K Lengyel <
> tamas.k.lengyel@gmail.com> wrote:
> >>
> >> I used Xen 4.15 and a pretty new version of Windows 10. It is a bit
> >> finicky, you have to run the debug commands on the debugee and then
> >> reboot. When the VM is rebooting the domain ID changes so you have to
> >> start the serial bridge then. Windbg will attach afterwards. Just make
> >> sure both VMs have serial='pty' set in their config file.
> >>
> >> Tamas
> >>
> >> On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka <neilsikka@gmail.com>
> wrote:
> >> >
> >> > Thanks for the quick response, Tamas. I tried what you said and
> windbg waits and the debugee hangs when I click the break button in windbg,
> but I don't see any output in windbg. This means that there is SOME
> communication over the serial port that causes the debugee to hang when I
> click break. Could it be a debugger protocol issue? I also tried the
> guidance here by running the crlf program:
> >> > https://www.qubes-os.org/doc/windows-debugging/
> >> > But windbg waits and the debugee hangs in a similar manner.
> >> >
> >> > What versions of WIndows and Xen are you using?
> >> >
> >> > On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel <
> tamas.k.lengyel@gmail.com> wrote:
> >> >>
> >> >> I have managed to get windbg working with a serial bridge between two
> >> >> Win10 VMs using the following script:
> >> >>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/serial-bridge.sh
> .
> >> >> The debugee has to enable a couple options so that windbg can attach:
> >> >>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/debug.cmd
> .
> >> >>
> >> >> Tamas
> >> >>
> >> >> On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com>
> wrote:
> >> >> >
> >> >> > Hello,
> >> >> > Has anyone gotten a Windows10 (Version 1709 of later) kernel
> debugger attached when running the Windows10 debugger VM and the Windows10
> debugee VM on Xen 4.13.0 hypervisor? I am getting a "NIC hardware
> initialization failed" error. I tried the suggestions in the discussion
> here (https://bugzilla.redhat.com/show_bug.cgi?id=1947015):
> >> >> > -cpu
> Skylake-Server-IBRS,ss=on,vmx=on,hypervisor=on,tsc-adjust=on,clflushopt=on,umip=on,pku=on,md-clear=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,ibpb=on,amd-ssbd=on,
> \
> >> >> >
> skip-l1dfl-vmentry=on,mpx=off,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=0x1fff,hv-vendor-id=KVMKVMKVM
> >> >> >
> >> >> > note: i had to remove the following 2 arguments due to errors from
> QEMU:
> >> >> > pschange-mc-no=on
> >> >> > hv_vpindex
> >> >> >
> >> >> > Here was the error:
> >> >> > C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
> >> >> >
> >> >> > Network debugging is supported on the following NICs:
> >> >> > busparams=0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged
> in.
> >> >> > The Microsoft hypervisor running this VM does not support KDNET.
> >> >> > Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or
> later.
> >> >> >
> >> >> > KDNET initialization failed.  Status = 0xC0000182.
> >> >> > NIC hardware initialization failed.
> >> >> >
> >> >> > I am using an Intel e1000 NIC emulated through QEMU because its
> supposedly a supported NIC for Windows kernel NET debugging.
> >> >> >
> >> >> > Thanks in Advance!
> >> >> >
> >> >> > --
> >> >> > My Blog: http://www.neilscomputerblog.blogspot.com/
> >> >> > Twitter: @neilsikka
> >> >
> >> >
> >> >
> >> > --
> >> > My Blog: http://www.neilscomputerblog.blogspot.com/
> >> > Twitter: @neilsikka
> >
> >
> >
> > --
> > My Blog: http://www.neilscomputerblog.blogspot.com/
> > Twitter: @neilsikka
>


-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--000000000000cfe63405c5621dab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I figured it out. Microsoft did not document that testsign=
ing needs to be enabled for kdnet to work.<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 22, 2021 at 2:12 =
PM Tamas K Lengyel &lt;<a href=3D"mailto:tamas.k.lengyel@gmail.com">tamas.k=
.lengyel@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Make sure windbg is already waiting for the connection fr=
om the<br>
debugee by the time Windows starts booting. If you try to attach<br>
windbg later it won&#39;t work. It worked for me but obviously YMMV.<br>
<br>
Tamas<br>
<br>
On Tue, Jun 22, 2021 at 2:07 PM Neil Sikka &lt;<a href=3D"mailto:neilsikka@=
gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I tried that, but it seems like I&#39;m getting an interrupt storm on =
the debugger VM (CPU spends all its time in the kernel) when I try to attac=
h the debugger. This observation furthers my suspicion that there is commun=
ication, but there is something wrong with the protocol...<br>
&gt;<br>
&gt; On Tue, Jun 22, 2021 at 12:43 PM Tamas K Lengyel &lt;<a href=3D"mailto=
:tamas.k.lengyel@gmail.com" target=3D"_blank">tamas.k.lengyel@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I used Xen 4.15 and a pretty new version of Windows 10. It is a bi=
t<br>
&gt;&gt; finicky, you have to run the debug commands on the debugee and the=
n<br>
&gt;&gt; reboot. When the VM is rebooting the domain ID changes so you have=
 to<br>
&gt;&gt; start the serial bridge then. Windbg will attach afterwards. Just =
make<br>
&gt;&gt; sure both VMs have serial=3D&#39;pty&#39; set in their config file=
.<br>
&gt;&gt;<br>
&gt;&gt; Tamas<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka &lt;<a href=3D"mailto:=
neilsikka@gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for the quick response, Tamas. I tried what you said a=
nd windbg waits and the debugee hangs when I click the break button in wind=
bg, but I don&#39;t see any output in windbg. This means that there is SOME=
 communication over the serial port that causes the debugee to hang when I =
click break. Could it be a debugger protocol issue? I also tried the guidan=
ce here by running the crlf program:<br>
&gt;&gt; &gt; <a href=3D"https://www.qubes-os.org/doc/windows-debugging/" r=
el=3D"noreferrer" target=3D"_blank">https://www.qubes-os.org/doc/windows-de=
bugging/</a><br>
&gt;&gt; &gt; But windbg waits and the debugee hangs in a similar manner.<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What versions of WIndows and Xen are you using?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel &lt;<a href=
=3D"mailto:tamas.k.lengyel@gmail.com" target=3D"_blank">tamas.k.lengyel@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I have managed to get windbg working with a serial bridge=
 between two<br>
&gt;&gt; &gt;&gt; Win10 VMs using the following script:<br>
&gt;&gt; &gt;&gt; <a href=3D"https://github.com/intel/kernel-fuzzer-for-xen=
-project/blob/master/scripts/serial-bridge.sh" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master=
/scripts/serial-bridge.sh</a>.<br>
&gt;&gt; &gt;&gt; The debugee has to enable a couple options so that windbg=
 can attach:<br>
&gt;&gt; &gt;&gt; <a href=3D"https://github.com/intel/kernel-fuzzer-for-xen=
-project/blob/master/scripts/debug.cmd" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/script=
s/debug.cmd</a>.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Tamas<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka &lt;<a href=
=3D"mailto:neilsikka@gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt;&gt; &gt; Has anyone gotten a Windows10 (Version 1709 of later=
) kernel debugger attached when running the Windows10 debugger VM and the W=
indows10 debugee VM on Xen 4.13.0 hypervisor? I am getting a &quot;NIC hard=
ware initialization failed&quot; error. I tried the suggestions in the disc=
ussion here (<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D19470=
15" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_b=
ug.cgi?id=3D1947015</a>):<br>
&gt;&gt; &gt;&gt; &gt; -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=
=3Don,tsc-adjust=3Don,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stib=
p=3Don,arch-capabilities=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don=
, \<br>
&gt;&gt; &gt;&gt; &gt; skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed=
,hv-vapic,hv-spinlocks=3D0x1fff,hv-vendor-id=3DKVMKVMKVM<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; note: i had to remove the following 2 arguments due =
to errors from QEMU:<br>
&gt;&gt; &gt;&gt; &gt; pschange-mc-no=3Don<br>
&gt;&gt; &gt;&gt; &gt; hv_vpindex<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Here was the error:<br>
&gt;&gt; &gt;&gt; &gt; C:\Users\user\Desktop\oldDebuggers\x64&gt;kdnet.exe<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Network debugging is supported on the following NICs=
:<br>
&gt;&gt; &gt;&gt; &gt; busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Conn=
ection, Plugged in.<br>
&gt;&gt; &gt;&gt; &gt; The Microsoft hypervisor running this VM does not su=
pport KDNET.<br>
&gt;&gt; &gt;&gt; &gt; Please upgrade to the hypervisor shipped in Windows =
8 or WS2012 or later.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; KDNET initialization failed.=C2=A0 Status =3D 0xC000=
0182.<br>
&gt;&gt; &gt;&gt; &gt; NIC hardware initialization failed.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I am using an Intel e1000 NIC emulated through QEMU =
because its supposedly a supported NIC for Windows kernel NET debugging.<br=
>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Thanks in Advance!<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; My Blog: <a href=3D"http://www.neilscomputerblog.blo=
gspot.com/" rel=3D"noreferrer" target=3D"_blank">http://www.neilscomputerbl=
og.blogspot.com/</a><br>
&gt;&gt; &gt;&gt; &gt; Twitter: @neilsikka<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; My Blog: <a href=3D"http://www.neilscomputerblog.blogspot.com=
/" rel=3D"noreferrer" target=3D"_blank">http://www.neilscomputerblog.blogsp=
ot.com/</a><br>
&gt;&gt; &gt; Twitter: @neilsikka<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; My Blog: <a href=3D"http://www.neilscomputerblog.blogspot.com/" rel=3D=
"noreferrer" target=3D"_blank">http://www.neilscomputerblog.blogspot.com/</=
a><br>
&gt; Twitter: @neilsikka<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div>My Blog: <a href=3D"http://www.neilscompute=
rblog.blogspot.com/" target=3D"_blank">http://www.neilscomputerblog.blogspo=
t.com/</a></div><div>Twitter: @neilsikka</div></div>

--000000000000cfe63405c5621dab--

