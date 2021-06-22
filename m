Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E43B0C76
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146011.268585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvkoP-0000GJ-74; Tue, 22 Jun 2021 18:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146011.268585; Tue, 22 Jun 2021 18:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvkoP-0000E0-3G; Tue, 22 Jun 2021 18:07:49 +0000
Received: by outflank-mailman (input) for mailman id 146011;
 Tue, 22 Jun 2021 18:07:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wlN=LQ=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1lvkoM-0000DV-Vh
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:07:47 +0000
Received: from mail-ed1-x52a.google.com (unknown [2a00:1450:4864:20::52a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2012609d-82fa-4712-9328-f34c21e8bed9;
 Tue, 22 Jun 2021 18:07:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r7so24874377edv.12
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 11:07:45 -0700 (PDT)
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
X-Inumbo-ID: 2012609d-82fa-4712-9328-f34c21e8bed9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zOAHJHWGJHsn5RVDzqZZ0AJDt6ARJeAKc3ID1hRRB/Y=;
        b=Bv9aB99aaBeThtB+2eazKlzvjKHsaBXClmNbb2YG9y0VsozXKbakwx5Tq54g8vAwdg
         Ri83LEkawTngXVVsWAUyuCsq6G3kX8Ak53+zlKTbFioDjfMF78erkMsDgbEXDd2W4++5
         p+DgN1J0UVGwNLBZ1vR9M/veerChRVtgbO4g4Rrpil9PZMRh1EaNYva7QBpl3M0dYwji
         3UxiZjU1UKyf3snHr4H3XM2Yzv+X6DdHbRbG5u+AIqj9FCWh6hUuBOTfPtiW9QwUomHV
         mYNOIJZYUDQffW6Y66RpBVol3SQzGYx6vIwdNpv2CK6LDBaYcucjxkiatLcUkl/KvyY0
         Zblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zOAHJHWGJHsn5RVDzqZZ0AJDt6ARJeAKc3ID1hRRB/Y=;
        b=OwzIIr0yKxYqOgKBj4KnlAlz5UExbO6xiCi3U03KRfuOzbWHzDnEbWi86aLO/Ttk2j
         +D3DcLVHZC2OahSKarwpH42tyE6ajCFO+C/kkZ7VynqxZy4d5lIdghsD/QVRS82os9jJ
         Id/I2Ja/UoPTqtFrIZw5krxpc1uTqRvv5kYEwkOQRotvGEDVcvuHOByu0J3Ak8K8/yUD
         rsXKX0J+4zHlxC78nl7vkPF0HER9mUJ1nmb7S3r0hGMQHRjSdbd8CH48j0rpH87UHbGZ
         RFhx0Am/O5P2algYZ3NvsrvxzQtBjRnmeDNecfeK44TqW0b+Xcj3aKb3DZz928X7bAkG
         Biuw==
X-Gm-Message-State: AOAM533+VjSpLALZfH2ILU4LeGsEvxPD6E8tZgtXsBN/cxPIH30+t9Wm
	AhEyoNBIFGuPrjqJCiPEcPf0k20FU3gAz8ElS8A=
X-Google-Smtp-Source: ABdhPJwPWFij88Efr88aaS3I7q4Qxf18Mf0HwkuRPYF+1jfK5QJQ+6fj2Llua6NVEH7n/rNsTC9VKs3DCYXc7JQIpw4=
X-Received: by 2002:a05:6402:54c:: with SMTP id i12mr6881031edx.64.1624385264789;
 Tue, 22 Jun 2021 11:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
 <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
 <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com> <CABfawh=W92ioejsZ-zu+WVofw_jfxVLteVieC2Ysfxd3Wrs+Og@mail.gmail.com>
In-Reply-To: <CABfawh=W92ioejsZ-zu+WVofw_jfxVLteVieC2Ysfxd3Wrs+Og@mail.gmail.com>
From: Neil Sikka <neilsikka@gmail.com>
Date: Tue, 22 Jun 2021 14:07:33 -0400
Message-ID: <CAHPMNWcfz+9zUv7gfwu5V6zPVBHiFc-EZDJ70-4DWHjOtyBOHg@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000afae1705c55eaad2"

--000000000000afae1705c55eaad2
Content-Type: text/plain; charset="UTF-8"

I tried that, but it seems like I'm getting an interrupt storm on the
debugger VM (CPU spends all its time in the kernel) when I try to attach
the debugger. This observation furthers my suspicion that there is
communication, but there is something wrong with the protocol...

On Tue, Jun 22, 2021 at 12:43 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

> I used Xen 4.15 and a pretty new version of Windows 10. It is a bit
> finicky, you have to run the debug commands on the debugee and then
> reboot. When the VM is rebooting the domain ID changes so you have to
> start the serial bridge then. Windbg will attach afterwards. Just make
> sure both VMs have serial='pty' set in their config file.
>
> Tamas
>
> On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka <neilsikka@gmail.com> wrote:
> >
> > Thanks for the quick response, Tamas. I tried what you said and windbg
> waits and the debugee hangs when I click the break button in windbg, but I
> don't see any output in windbg. This means that there is SOME communication
> over the serial port that causes the debugee to hang when I click break.
> Could it be a debugger protocol issue? I also tried the guidance here by
> running the crlf program:
> > https://www.qubes-os.org/doc/windows-debugging/
> > But windbg waits and the debugee hangs in a similar manner.
> >
> > What versions of WIndows and Xen are you using?
> >
> > On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel <
> tamas.k.lengyel@gmail.com> wrote:
> >>
> >> I have managed to get windbg working with a serial bridge between two
> >> Win10 VMs using the following script:
> >>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/serial-bridge.sh
> .
> >> The debugee has to enable a couple options so that windbg can attach:
> >>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/debug.cmd
> .
> >>
> >> Tamas
> >>
> >> On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com>
> wrote:
> >> >
> >> > Hello,
> >> > Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger
> attached when running the Windows10 debugger VM and the Windows10 debugee
> VM on Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization
> failed" error. I tried the suggestions in the discussion here (
> https://bugzilla.redhat.com/show_bug.cgi?id=1947015):
> >> > -cpu
> Skylake-Server-IBRS,ss=on,vmx=on,hypervisor=on,tsc-adjust=on,clflushopt=on,umip=on,pku=on,md-clear=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,ibpb=on,amd-ssbd=on,
> \
> >> >
> skip-l1dfl-vmentry=on,mpx=off,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=0x1fff,hv-vendor-id=KVMKVMKVM
> >> >
> >> > note: i had to remove the following 2 arguments due to errors from
> QEMU:
> >> > pschange-mc-no=on
> >> > hv_vpindex
> >> >
> >> > Here was the error:
> >> > C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
> >> >
> >> > Network debugging is supported on the following NICs:
> >> > busparams=0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in.
> >> > The Microsoft hypervisor running this VM does not support KDNET.
> >> > Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or
> later.
> >> >
> >> > KDNET initialization failed.  Status = 0xC0000182.
> >> > NIC hardware initialization failed.
> >> >
> >> > I am using an Intel e1000 NIC emulated through QEMU because its
> supposedly a supported NIC for Windows kernel NET debugging.
> >> >
> >> > Thanks in Advance!
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

--000000000000afae1705c55eaad2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tried that, but it seems like I&#39;m getting an interru=
pt storm on the debugger VM (CPU spends all its=C2=A0time in the kernel) wh=
en I try to attach the debugger. This observation furthers my suspicion tha=
t there is communication, but there is something wrong with the protocol...=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Jun 22, 2021 at 12:43 PM Tamas K Lengyel &lt;<a href=3D"mailto:tama=
s.k.lengyel@gmail.com">tamas.k.lengyel@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I used Xen 4.15 and a prett=
y new version of Windows 10. It is a bit<br>
finicky, you have to run the debug commands on the debugee and then<br>
reboot. When the VM is rebooting the domain ID changes so you have to<br>
start the serial bridge then. Windbg will attach afterwards. Just make<br>
sure both VMs have serial=3D&#39;pty&#39; set in their config file.<br>
<br>
Tamas<br>
<br>
On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka &lt;<a href=3D"mailto:neilsikka=
@gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for the quick response, Tamas. I tried what you said and windbg=
 waits and the debugee hangs when I click the break button in windbg, but I=
 don&#39;t see any output in windbg. This means that there is SOME communic=
ation over the serial port that causes the debugee to hang when I click bre=
ak. Could it be a debugger protocol issue? I also tried the guidance here b=
y running the crlf program:<br>
&gt; <a href=3D"https://www.qubes-os.org/doc/windows-debugging/" rel=3D"nor=
eferrer" target=3D"_blank">https://www.qubes-os.org/doc/windows-debugging/<=
/a><br>
&gt; But windbg waits and the debugee hangs in a similar manner.<br>
&gt;<br>
&gt; What versions of WIndows and Xen are you using?<br>
&gt;<br>
&gt; On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel &lt;<a href=3D"mailto=
:tamas.k.lengyel@gmail.com" target=3D"_blank">tamas.k.lengyel@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I have managed to get windbg working with a serial bridge between =
two<br>
&gt;&gt; Win10 VMs using the following script:<br>
&gt;&gt; <a href=3D"https://github.com/intel/kernel-fuzzer-for-xen-project/=
blob/master/scripts/serial-bridge.sh" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/=
serial-bridge.sh</a>.<br>
&gt;&gt; The debugee has to enable a couple options so that windbg can atta=
ch:<br>
&gt;&gt; <a href=3D"https://github.com/intel/kernel-fuzzer-for-xen-project/=
blob/master/scripts/debug.cmd" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/debug.c=
md</a>.<br>
&gt;&gt;<br>
&gt;&gt; Tamas<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka &lt;<a href=3D"mailto:=
neilsikka@gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt; Has anyone gotten a Windows10 (Version 1709 of later) kernel =
debugger attached when running the Windows10 debugger VM and the Windows10 =
debugee VM on Xen 4.13.0 hypervisor? I am getting a &quot;NIC hardware init=
ialization failed&quot; error. I tried the suggestions in the discussion he=
re (<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1947015" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1947015</a>):<br>
&gt;&gt; &gt; -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc=
-adjust=3Don,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,ar=
ch-capabilities=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \<br>
&gt;&gt; &gt; skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic=
,hv-spinlocks=3D0x1fff,hv-vendor-id=3DKVMKVMKVM<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; note: i had to remove the following 2 arguments due to errors=
 from QEMU:<br>
&gt;&gt; &gt; pschange-mc-no=3Don<br>
&gt;&gt; &gt; hv_vpindex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Here was the error:<br>
&gt;&gt; &gt; C:\Users\user\Desktop\oldDebuggers\x64&gt;kdnet.exe<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Network debugging is supported on the following NICs:<br>
&gt;&gt; &gt; busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Connection, P=
lugged in.<br>
&gt;&gt; &gt; The Microsoft hypervisor running this VM does not support KDN=
ET.<br>
&gt;&gt; &gt; Please upgrade to the hypervisor shipped in Windows 8 or WS20=
12 or later.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; KDNET initialization failed.=C2=A0 Status =3D 0xC0000182.<br>
&gt;&gt; &gt; NIC hardware initialization failed.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am using an Intel e1000 NIC emulated through QEMU because i=
ts supposedly a supported NIC for Windows kernel NET debugging.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks in Advance!<br>
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

--000000000000afae1705c55eaad2--

