Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E654CEF05
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 01:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285569.484779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR1WQ-000358-FX; Mon, 07 Mar 2022 00:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285569.484779; Mon, 07 Mar 2022 00:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR1WQ-000328-Bj; Mon, 07 Mar 2022 00:46:46 +0000
Received: by outflank-mailman (input) for mailman id 285569;
 Mon, 07 Mar 2022 00:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kcw=TS=gmail.com=trigger.huang@srs-se1.protection.inumbo.net>)
 id 1nR1WP-000322-Ed
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 00:46:45 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f524b1b-9db0-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 01:46:44 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id bt26so3808691lfb.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Mar 2022 16:46:44 -0800 (PST)
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
X-Inumbo-ID: 0f524b1b-9db0-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Pzk0JtwNXrNrmpzZ90IWdTWwUgH6E9/0rIUma2TChI=;
        b=TIMjhFd8yru+zCOf6tUeCUGWoFLspzp1RhGjDMw2r1qZ2xJ3RVhXrojTukIHWdqQoZ
         3GvPArfheYbnpNTu5ozOTZe0yJDXRroDykhNvAnmhNRnT2Eh49Gi3qK3+Vt0cjt4falt
         0tJyBwrKEH4czGZBMsUKJ0qz2vZUilkNu1ycdy9nCqgsJZOxS7JGa14GXgkoYN25BSNw
         MmnJGa79ofYXwG/5WC7g9YJzOkD0QZql9Sd/qa1v9EEmk8UAwP7ftoSLxVDob0XHiluL
         brHmT+BwnAtvrvB+XAy7HWGw+e3PP2SwtEzM8Nx5SLYHkO77mehfjERQkEotRhP8iBZg
         c4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Pzk0JtwNXrNrmpzZ90IWdTWwUgH6E9/0rIUma2TChI=;
        b=B5ZyxrWz60TE2oyGUGpUq6sFBL9jr4i+VZYtfni5UIJ5ZdkcicHIFfD2jXFGTBd9BL
         nbaDu5VuQK+3LAeaAodSrevrWmhM90Bttdi80g4MKu4f3PBcAxeAAZPoRDvTLnk3UrFD
         qs+EhNeSWhELz0CflsbK1Ackqd01gCEfw6Od+kN07CyIpVjknCWrU0fDNo74ZzLgZ7Q0
         DzqbVaxJEcbKd+8M+D28rwUEgdjlaABmR3STw9m609Cq31Ni7DKZm6dzkSVssZE4FYXL
         uxYaFMlxAl03jzR8VGOpC1mP4elkNkqtq5X2XbjpmpsKNBd4P4K2U+B0Dr63u1raLaBN
         nJow==
X-Gm-Message-State: AOAM532cGfKAZp4V636SnBcwpTp4q0FTxoJrO6Uyg8X3OletWG8+kiZP
	HSd8j/LIEMqY++q3lqzWaLweKshreQkN/KYeLAFVEOVkhC0=
X-Google-Smtp-Source: ABdhPJw4srG3aqenhSU1/lIsSRTC310I7MoBaNyzBKHRm57ZrHCoXxPA3ByToraeedKhglBLKlqOUqlDaDuxfChzg6k=
X-Received: by 2002:a05:6512:3d04:b0:442:1093:aa9b with SMTP id
 d4-20020a0565123d0400b004421093aa9bmr6323801lfv.499.1646614003582; Sun, 06
 Mar 2022 16:46:43 -0800 (PST)
MIME-Version: 1.0
References: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
 <871qzhiwqg.fsf@linaro.org>
In-Reply-To: <871qzhiwqg.fsf@linaro.org>
From: Trigger Huang <trigger.huang@gmail.com>
Date: Mon, 7 Mar 2022 08:46:30 +0800
Message-ID: <CANH0Q9mF-vmW6gNDWnkMKR-VGQ2YbT+_55p=8F-N_L67Wuv5NQ@mail.gmail.com>
Subject: Re: How to create and start Xen guest VM by qemu-system-x86_64
 command line
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c409bc05d996323d"

--000000000000c409bc05d996323d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the response.

Actually my target is trying to enable virglrenderer on Xen based Qemu.
Before, I have successfully enabled it on KVM based Qemu by the Qemu
command line. Such as 'qemu-system-x86_64 *-device virtio-vga-gl*  xxxxxxx'
If change to use xl, I don't know how to set this kind of special
option(*-device
virtio-vga-gl* ) to qemu after I checked the xl's arguments. Or do you have
any idea? :)

Seems using XL is much more common than directly using the qemu command
line , right?

Thanks,
Trigger

On Fri, Mar 4, 2022 at 11:05 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Trigger Huang <trigger.huang@gmail.com> writes:
>
> > Hello,
> >
> > I have built & installed Xen 4.15 onto my Ubuntu20.04 platform
> successfully according to
> > https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source
> > After reboot, I entered Domain 0 successfully. The command xl info show=
s
> the right version string.
> > host                   : xvg
> > release                : 5.13.0-30-generic
> > version                : #33~20.04.1-Ubuntu SMP Mon Feb 7 14:25:10 UTC
> 2022
> > machine                : x86_64
> > nr_cpus                : 16
> > max_cpu_id             : 31
> > nr_nodes               : 1
> > cores_per_socket       : 8
> > threads_per_core       : 2
> > cpu_mhz                : 2994.377
> > hw_caps                :
> 178bf3ff:76d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:00000500
> > virt_caps              : pv hvm hvm_directio pv_directio hap shadow
> > total_memory           : 15719
> > free_memory            : 11425
> > sharing_freed_memory   : 0
> > sharing_used_memory    : 0
> > outstanding_claims     : 0
> > free_cpus              : 0
> > xen_major              : 4
> > xen_minor              : 15
> > xen_extra              : .3-pre-atg08
> > xen_version            : 4.15.3-pre-atg08
> > xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
> hvm-3.0-x86_64
> > xen_scheduler          : credit2
> > xen_pagesize           : 4096
> > platform_params        : virt_start=3D0xffff800000000000
> > xen_changeset          : Fri Mar 4 13:33:49 2022 +0800 git:6aa4cdbc31
> > xen_commandline        : placeholder dom0_mem=3D4096M,max:8192M
> no-real-mode edd=3Doff
> > cc_compiler            : gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
> > cc_compile_by          : xvg
> > cc_compile_domain      :
> > cc_compile_date        : Fri Mar  4 14:21:33 CST 2022
> > build_id               : 234929adcb7588b1414c2b6e5477fa95052b4ded
> > xend_config_format     : 4
> >
> > Then my next step is to create ubuntu guest VM(sudo or use root user):
> >    /usr/local/lib/xen/bin/qemu-system-x86_64 -smp 1 -xen-domid 4
> -machine xenfv -m 4G -net nic,model=3Dvirtio -net
> > user,hostfwd=3Dtcp::2222-:22 -hda ./u2004.qcow2 -boot d -cdrom
> ./ubuntu-20.04-desktop-amd64.iso
> > However, I always failed with the following error:
> >     qemu-system-x86_64: failed to map ioreq server resources: error 3
> handle=3D0x55eeb1f6c0b0
> >     qemu-system-x86_64: xen hardware virtual machine initialisation
> failed
> > After debugging, the error is caused by
> osdep_xenforeignmemory_map_resource failed to invoke
> IOCTL_PRIVCMD_MMAP_RESOURCE. And
> > this IOCTL will return -1.
>
> Why are you not launching your guests with the xl commands?
>
> >
> > So my question is, am I using the right qemu command? Anything else is
> needed to set/config?
> > Note, if I didn't specify the option ' -xen-domid 4 -machine xenfv ', I
> can start qemu successfully
> >
> > Would you please help with it?
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000c409bc05d996323d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,</div><div><br></div><div>Thanks for the resp=
onse.</div><div><br></div><div>Actually my target is trying to enable virgl=
renderer on Xen based Qemu. Before, I have successfully enabled it on KVM b=
ased Qemu by the Qemu command line. Such as &#39;qemu-system-x86_64 <b>-dev=
ice virtio-vga-gl</b>=C2=A0 xxxxxxx&#39;</div><div>If change to use xl, I d=
on&#39;t know how to set this kind of special option(<b>-device virtio-vga-=
gl</b>

) to qemu after I checked the xl&#39;s arguments. Or do you have any idea? =
:)<br></div><div><br></div><div>Seems using XL is much more common than=20
directly

using the qemu command line , right?<br></div><div><br></div><div>Thanks,</=
div><div>Trigger<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 11:05 PM Alex Benn=C3=A9e =
&lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Trigger Huang &lt;<a href=3D"mailto:trigger.huang@gmail.com" target=3D"_bla=
nk">trigger.huang@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; I have built &amp; installed Xen 4.15 onto my Ubuntu20.04 platform suc=
cessfully according to<br>
&gt; <a href=3D"https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source"=
 rel=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Comp=
iling_Xen_From_Source</a> <br>
&gt; After reboot, I entered Domain 0 successfully. The command xl info sho=
ws the right version string.<br>
&gt; host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: xvg<br>
&gt; release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 5.13.=
0-30-generic<br>
&gt; version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : #33~2=
0.04.1-Ubuntu SMP Mon Feb 7 14:25:10 UTC 2022<br>
&gt; machine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : x86_6=
4<br>
&gt; nr_cpus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 16<br=
>
&gt; max_cpu_id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 31<br>
&gt; nr_nodes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 1<br>
&gt; cores_per_socket=C2=A0 =C2=A0 =C2=A0 =C2=A0: 8<br>
&gt; threads_per_core=C2=A0 =C2=A0 =C2=A0 =C2=A0: 2<br>
&gt; cpu_mhz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 2994.=
377<br>
&gt; hw_caps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 178bf=
3ff:76d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:00000500<br>
&gt; virt_caps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : pv hvm hvm=
_directio pv_directio hap shadow<br>
&gt; total_memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 15719<br>
&gt; free_memory=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 11425<br>
&gt; sharing_freed_memory=C2=A0 =C2=A0: 0<br>
&gt; sharing_used_memory=C2=A0 =C2=A0 : 0<br>
&gt; outstanding_claims=C2=A0 =C2=A0 =C2=A0: 0<br>
&gt; free_cpus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0<br>
&gt; xen_major=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 4<br>
&gt; xen_minor=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 15<br>
&gt; xen_extra=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : .3-pre-atg=
08<br>
&gt; xen_version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 4.15.3-pre-atg0=
8<br>
&gt; xen_caps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: xen-3=
.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64<br>
&gt; xen_scheduler=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : credit2<br>
&gt; xen_pagesize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 4096<br>
&gt; platform_params=C2=A0 =C2=A0 =C2=A0 =C2=A0 : virt_start=3D0xffff800000=
000000<br>
&gt; xen_changeset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Fri Mar 4 13:33:49 2=
022 +0800 git:6aa4cdbc31<br>
&gt; xen_commandline=C2=A0 =C2=A0 =C2=A0 =C2=A0 : placeholder dom0_mem=3D40=
96M,max:8192M no-real-mode edd=3Doff<br>
&gt; cc_compiler=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : gcc (Ubuntu 9.3=
.0-17ubuntu1~20.04) 9.3.0<br>
&gt; cc_compile_by=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : xvg<br>
&gt; cc_compile_domain=C2=A0 =C2=A0 =C2=A0 :<br>
&gt; cc_compile_date=C2=A0 =C2=A0 =C2=A0 =C2=A0 : Fri Mar=C2=A0 4 14:21:33 =
CST 2022<br>
&gt; build_id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 23492=
9adcb7588b1414c2b6e5477fa95052b4ded<br>
&gt; xend_config_format=C2=A0 =C2=A0 =C2=A0: 4<br>
&gt;<br>
&gt; Then my next step is to create ubuntu guest VM(sudo or use root user):=
<br>
&gt;=C2=A0 =C2=A0 /usr/local/lib/xen/bin/qemu-system-x86_64 -smp 1 -xen-dom=
id 4 -machine xenfv -m 4G -net nic,model=3Dvirtio -net<br>
&gt; user,hostfwd=3Dtcp::2222-:22 -hda ./u2004.qcow2 -boot d -cdrom ./ubunt=
u-20.04-desktop-amd64.iso<br>
&gt; However, I always failed with the following error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-x86_64: failed to map ioreq server reso=
urces: error 3 handle=3D0x55eeb1f6c0b0<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-x86_64: xen hardware virtual machine in=
itialisation failed<br>
&gt; After debugging, the error is caused by osdep_xenforeignmemory_map_res=
ource failed to invoke IOCTL_PRIVCMD_MMAP_RESOURCE. And<br>
&gt; this IOCTL will return -1.<br>
<br>
Why are you not launching your guests with the xl commands? <br>
<br>
&gt;<br>
&gt; So my question is, am I using the right qemu command? Anything else is=
 needed to set/config?<br>
&gt; Note, if I didn&#39;t specify the option &#39; -xen-domid 4 -machine x=
enfv &#39;, I can start qemu successfully<br>
&gt;<br>
&gt; Would you please help with it?<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--000000000000c409bc05d996323d--

