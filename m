Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F16584717
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 22:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377163.610236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAGK-0004yG-3V; Thu, 28 Jul 2022 20:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377163.610236; Thu, 28 Jul 2022 20:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHAGK-0004vh-0N; Thu, 28 Jul 2022 20:37:40 +0000
Received: by outflank-mailman (input) for mailman id 377163;
 Thu, 28 Jul 2022 20:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z02H=YB=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1oHAGI-0004vW-B9
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 20:37:38 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d233ab8-0eb5-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 22:37:36 +0200 (CEST)
Received: by mail-vs1-xe2d.google.com with SMTP id k129so2706638vsk.2;
 Thu, 28 Jul 2022 13:37:36 -0700 (PDT)
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
X-Inumbo-ID: 1d233ab8-0eb5-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7KfOyniWmBnHgUyrywGj1WcU1DSXRDKQD4lcAGgSSO4=;
        b=H67LN8hmKDnvFgLiT2bgAXmXcy50sHrEp/wwm0yze7QGvxSWozneYd5s1qMtgKoBsG
         g6nx4QcqsX/napVQV4pqQLLFV//XGshp50jEh1VcGQBidK0OKQcrT+8RlHGbOOSDMWZD
         xWvIdAJtu7PtYzGjn0x9XfU1Tt7rwyc9rT5ZkMooEu5B+SbFzlUlq30xzxzRLrTolihi
         FEpsa+wkWF/EVVhFmTTOsCby41gkpSeNtXuHO5lCyOl6+4qpb/oHZ9tYkG153kU3v1QH
         BAwSpuc2k/3MYvH/LaCJurV1SXfkBQrbEVYdl9D+9Rr6TiRNBwXSjw7bljiFVk9C83Hn
         Vlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7KfOyniWmBnHgUyrywGj1WcU1DSXRDKQD4lcAGgSSO4=;
        b=sQpVhyVXleG48FTvCUSa1/oSU7DxggTLO6tpOIWsplE3XMpf3Cw1+rtyp3fWA0dmxH
         a/5DohJjTP0drm03161+pxkVDDEtBC0xYg/dGRcPu30kV8gw0OpIqYkAZAYb7f/ua9bS
         x0V0Uci5tPmmTuvzma1Ll+lpS+ap19RaLq5gsnTKX9naVdWTpRR4aTg22wN0ttpKQlo+
         wbS4dmYVKKPOXhLWi2BC8bvMTVMvaG2H1vQe607KEp90kXebILVuLQo3VKI2JtCk6SZD
         aT7CmEhRyr0XQJU23Onq+6ZFSfrgDm/3rZwmp/HMBcIm4Dhq5W5GTs3VrtbNWzzj/11b
         lPAQ==
X-Gm-Message-State: AJIora+4D4mo2v1mDpr73iRAOzOkXZ8S6H8NuMrYZrKHi2TXkoM1jpN+
	BdVkvPw7Sjeq1OMOBmdWieqASQRyFhWLnPfgf+eRwQpRV8s=
X-Google-Smtp-Source: AGRyM1vrIeO8g1W/rhrfq+259cw/A0QAzwVsnKUp3FHFTqx7sjDy2PVSrOq1PA/7QfBCEoO7e/OpPgdx3oqSXypvFmw=
X-Received: by 2002:a05:6102:41a4:b0:358:50ab:2cf1 with SMTP id
 cd36-20020a05610241a400b0035850ab2cf1mr173589vsb.40.1659040655395; Thu, 28
 Jul 2022 13:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB4297AA9CE29208A979437D889F959@DM6PR12MB4297.namprd12.prod.outlook.com>
 <CACMJ4GbiFNorOxWcVV=NZVckeBLrEGnmmY+5LeK514f6kUkytA@mail.gmail.com>
 <DM6PR12MB42970861BFDD03CAE8A8DF279F949@DM6PR12MB4297.namprd12.prod.outlook.com>
 <DM6PR12MB429755DCB52A5086F54C6E0E9F969@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB429755DCB52A5086F54C6E0E9F969@DM6PR12MB4297.namprd12.prod.outlook.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 28 Jul 2022 13:37:24 -0700
Message-ID: <CACMJ4GZ_acc8mj9Wx-OVC-hdjHQpDf=-vNTA9v0GvgZr4ScVig@mail.gmail.com>
Subject: Re: Enable audio virtualization in Xen
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>, 
	Daniel Smith <dpsmith@apertussolutions.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 12:05 PM SHARMA, JYOTIRMOY
<JYOTIRMOY.SHARMA@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Hi all,
>
> Can anyone please help here?

Hello

I have now been able to reproduce the HVM guest audio failure that you
reported, with the same versions of Ubuntu, Xen and Qemu that you
indicated. I have also been able to correct it and successfully enable
guest audio output. I hope we can enable the same for you.

The issues I encountered are:
1) The command line arguments passed to qemu from libxl need some
adjustment for this system configuration.
2) Pulseaudio on the host runs as the desktop session user, whereas
the qemu device emulator runs as root, and some configuration change
is required to connect the two.

I also had to ensure that I had a version of Qemu with SDL enabled to
match your configuration, and a recent enough version of seabios to
successfully boot the guest.

The following are workarounds. A new patch to libxl would be
appropriate for improving handling of passing audio configuration from
VM config files to qemu, and there is likely a better way of enabling
host audio configuration for qemu than my outline below, but this
appears to work and is hopefully sufficient for unblocking your
progress.

To work around the command line arguments to qemu:
# Move the qemu-system-i386 binary to a different filename:
mv /usr/lib/xen/bin/qemu-system-i386 /usr/lib/xen/bin/qemu-system-i386.real

# Create a wrapper script file in place of the previous binary, to add
the audio parameters: /usr/lib/xen/bin/qemu-system-i386
----
#!/bin/sh
/usr/lib/xen/bin/qemu-system-i386.real -audiodev id=3Dsnd0,driver=3Dpa
-device ich9-intel-hda -device hda-output,audiodev=3Dsnd0 $@
----
chmod 755 /usr/lib/xen/bin/qemu-system-i386

Ensure that you have removed any sound configuration from the VM
config file; the wrapper script will be providing this now instead.

To enable sound from the qemu process that is running as root, I
followed the answer on this page:
https://stackoverflow.com/questions/66775654/how-can-i-make-pulseaudio-run-=
as-root

Summarizing those pulseaudio configuration steps here, perform the
following as root:
# Write /etc/systemd/system/pulseaudio.service file:
----
[Unit]
Description=3DPulseAudio system server

[Service]
Type=3Dnotify
ExecStart=3Dpulseaudio --daemonize=3Dno --system --realtime --log-target=3D=
journal

[Install]
WantedBy=3Dmulti-user.target
----
# Enable the new service:
sudo systemctl --system enable pulseaudio.service
sudo systemctl --system start pulseaudio.service
sudo systemctl --system status pulseaudio.service

# Edit items in : /etc/pulse/client.conf
----
default-server =3D /var/run/pulse/native
autospawn =3D no
----
# Add root to pulse group
sudo adduser root pulse-access

# Also add your desktop user to pulse group, to retain working audio
for that host desktop user
sudo adduser $USER pulse-access

# Reboot
reboot

You should now be able to start your guest VM with working audio. I
would note that the qemu-dm log files in /var/log/xen/ can be useful
for observing error messages from Qemu if you still encounter
difficulty.

> Also, how can I make use of the xen front end drivers in a HVM guest?

I don't believe that the Xen audio front end drivers are necessary for
enabling HVM guest audio output, and I don't have experience with
using them yet but I am interested to hear of reports of using them on
x86.

thanks,

Christopher

>
> -----Original Message-----
> From: SHARMA, JYOTIRMOY
> Sent: Tuesday, July 26, 2022 4:27 PM
> To: Christopher Clark <christopher.w.clark@gmail.com>
> Cc: xen-devel@lists.xenproject.org; xen-users@lists.xenproject.org
> Subject: RE: Enable audio virtualization in Xen
>
> [AMD Official Use Only - General]
>
> Hi Christopher,
>
> Thank you for the quick response. Please find answers below.
>
> >> Does audio playback work OK from your Ubuntu dom0?
> Yes.
>
> >> Do you know which version of Ubuntu you are using? ('cat /etc/lsb-rele=
ase')
> Ubuntu 22.04 LTS.
>
> >> Do you know which version of Xen you are using? ('xl info' in dom0 sho=
uld help)
> 4.16.2-pre.
>
> >> Do you know which version of Qemu you have installed in dom0?
> QEMU emulator version 6.1.1.
>
> >> Did you build and install Xen from source code, or are you using binar=
y packages of Xen and its tools?
> We built and installed Xen from source code (git clone https://xenbits.xe=
n.org/git-http/xen.git).
>
> >> Are you using the xl tools, or libvirt tools for configuring and runni=
ng your guest? -- ie. how do you start your domU VM?
> We are using xl tools (sudo xl -v create <path to hvm config file>).
>
> >> When your domU is running, please could you run 'ps auxwww' in dom0 an=
d obtain the process information about the qemu instance that is running, s=
o that we can see what command line arguments have been supplied to it
>
> This is the log we get right after booting dom 0:
>
> root 723 0.0 0.2 243792 14468 ? Sl 15:51 0:00 /usr/local/lib/xen/bin/qemu=
-system-i386 -xen-domid 0 -xen-attach -name dom0 -nographic -M xenpv -daemo=
nize -monitor /dev/null -serial /dev/null -parallel /dev/null -pidfile /var=
/run/xen/qemu-dom0.pid
>
> This log is seen after we launch dom U (sudo xl -v create <path to hvm co=
nfig file>):
>
> root 2152 20.7 2.3 2858204 133496 ? Ssl 15:53 0:09 /usr/local/lib/xen/bin=
/qemu-system-i386 -xen-domid 1 -no-shutdown -chardev socket,id=3Dlibxl-cmd,=
path=3D/var/run/xen/qmp-libxl-1,server=3Don,wait=3Doff -mon chardev=3Dlibxl=
-cmd,mode=3Dcontrol -chardev socket,id=3Dlibxenstat-cmd,path=3D/var/run/xen=
/qmp-libxenstat-1,server=3Don,wait=3Doff -mon chardev=3Dlibxenstat-cmd,mode=
=3Dcontrol -nodefaults -no-user-config -name domu-ubuntu.hvm -vnc 127.0.0.1=
:0,to=3D99 -display sdl,gl=3Don -sdl -device virtio-vga-gl -boot order=3Ddc=
 -usb -usbdevice tablet -smp 2,maxcpus=3D2 -net none -machine xenfv,suppres=
s-vmdesc=3Don -m 2040 -drive file=3D/home/amd/u2004_ubuntu.qcow2,if=3Dide,i=
ndex=3D0,media=3Ddisk,format=3Dqcow2,cache=3Dwriteback
>
> >> A little more information about what you're running will help with pro=
viding guidance here. The xl man page indicates that there is a "soundhw" o=
ption in the VM configuration file for passing sound hardware configution t=
hrough to qemu, so if you are using the xl toolstack, you could try adding =
this to the config file: soundhw=3D"hda"
>
> I tried giving soundhw=3D"hda" option in the hvm config file. However, I =
do not hear any sound when I play a wave file in dom U. Here is the 'ps aux=
www' output after making this change:
>
> root 2568 14.8 2.3 2770864 134720 ? Ssl 15:58 0:09 /usr/local/lib/xen/bin=
/qemu-system-i386 -xen-domid 2 -no-shutdown -chardev socket,id=3Dlibxl-cmd,=
path=3D/var/run/xen/qmp-libxl-2,server=3Don,wait=3Doff -mon chardev=3Dlibxl=
-cmd,mode=3Dcontrol -chardev socket,id=3Dlibxenstat-cmd,path=3D/var/run/xen=
/qmp-libxenstat-2,server=3Don,wait=3Doff -mon chardev=3Dlibxenstat-cmd,mode=
=3Dcontrol -nodefaults -no-user-config -name domu-ubuntu-audio.hvm -vnc 127=
.0.0.1:0,to=3D99 -display sdl,gl=3Don -sdl -device virtio-vga-gl -boot orde=
r=3Ddc -usb -usbdevice tablet -soundhw hda -smp 2,maxcpus=3D2 -net none -ma=
chine xenfv,suppress-vmdesc=3Don -m 2040 -drive file=3D/home/amd/u2004_ubun=
tu.qcow2,if=3Dide,index=3D0,media=3Ddisk,format=3Dqcow2,cache=3Dwriteback
>
> Also, I tried giving soundhw=3D"all" in the config file, however this thr=
ows following error:
>
> libxl: error: libxl_dm.c:3130:device_model_spawn_outcome: Domain 4:domain=
 4 device model: spawn failed (rc=3D-3)
> libxl: error: libxl_dm.c:3350:device_model_postconfig_done: Domain 4:Post=
 DM startup configs failed, rc=3D-3
> libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain 4:de=
vice model did not start: -3
> libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model alrea=
dy exited
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 4:Non-exis=
tant domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 4:Unabl=
e to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 4:Destruction=
 of domain failed
>
> Can you please let me know what parameters I should use in the config fil=
e to play audio from dom U?
>
> Regards,
> Jyotirmoy
>
> -----Original Message-----
> From: Christopher Clark <christopher.w.clark@gmail.com>
> Sent: Tuesday, July 26, 2022 2:44 AM
> To: SHARMA, JYOTIRMOY <JYOTIRMOY.SHARMA@amd.com>
> Cc: xen-devel@lists.xenproject.org; xen-users@lists.xenproject.org
> Subject: Re: Enable audio virtualization in Xen
>
> [CAUTION: External Email]
>
> On Mon, Jul 25, 2022 at 4:45 AM SHARMA, JYOTIRMOY <JYOTIRMOY.SHARMA@amd.c=
om> wrote:
> >
> > [AMD Official Use Only - General]
> >
> >
> > Hi all,
>
> Hi Jyotirmoy,
>
> I have add the xen-users list to CC since this thread may be useful to th=
at forum.
>
> > I am using ubuntu as dom 0 and also dom U (HVM). I want to play audio f=
rom =E2=80=9Cdom U=E2=80=9D Ubuntu.
>
> I think that it should be possible to enable what you are attempting to d=
o. ie. audio output from a HVM Ubuntu guest VM.
>
> Some questions to support assisting you:
> * Does audio playback work OK from your Ubuntu dom0?
> * Do you know which version of Ubuntu you are using? ('cat /etc/lsb-relea=
se')
> * Do you know which version of Xen you are using? ('xl info' in dom0 shou=
ld help)
> * Do you know which version of Qemu you have installed in dom0?
> * Did you build and install Xen from source code, or are you using binary=
 packages of Xen and its tools?
> * Are you using the xl tools, or libvirt tools for configuring and runnin=
g your guest? -- ie. how do you start your domU VM?
> * When your domU is running, please could you run 'ps auxwww' in dom0 and=
 obtain the process information about the qemu instance that is running, so=
 that we can see what command line arguments have been supplied to it
>
> > I am new to Xen/virtualization in general.
>
> Welcome! :-)
>
> > From various reading I understood that I need to take following approac=
h:
> >
> > 1. Use Xen front end ALSA driver in dom U
>
> I'm not certain that this is necessary for your HVM guest. Instead of usi=
ng the Xen paravirtualized audio protocol, Qemu should be able to present a=
n emulated audio device to the HVM guest domU, and a standard audio driver =
(hda or ac97) in domU should suffice.
>
> > 2. Use Qemu to connect to the backend ALSA driver in Dom 0
>
> I think if Qemu is started with the correct command line arguments, it sh=
ould be able to play sound on behalf of the guest, if sound is correctly co=
nfigured and working in dom0.
>
> > Can you please let me know if this approach is fine? If yes, I have fol=
lowing questions:
> >
> > 1. Do I need to recompile Ubuntu to support Xen front end ALSA driver? =
Or will Ubuntu iso file already have it enabled?
>
> I think the latter, that the Ubuntu installation ISO should already conta=
in a suitable audio device driver that is compatible with the virtual audio=
 device that is emulated by Qemu.
>
> > 2. Ho do I configure Qemu to enable backend driver?
>
> A little more information about what you're running will help with provid=
ing guidance here. The xl man page indicates that there is a "soundhw" opti=
on in the VM configuration file for passing sound hardware configution thro=
ugh to qemu, so if you are using the xl toolstack, you could try adding thi=
s to the config file: soundhw=3D"hda"
>
> Christopher

