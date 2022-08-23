Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0059D5FF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391785.629743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPvo-0002mo-Jt; Tue, 23 Aug 2022 09:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391785.629743; Tue, 23 Aug 2022 09:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPvo-0002kk-GR; Tue, 23 Aug 2022 09:10:44 +0000
Received: by outflank-mailman (input) for mailman id 391785;
 Tue, 23 Aug 2022 09:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JwVP=Y3=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oQPvn-0002ke-Cf
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:10:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 768424ed-22c3-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 11:10:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id w19so26145863ejc.7
 for <xen-devel@lists.xenproject.org>; Tue, 23 Aug 2022 02:10:42 -0700 (PDT)
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
X-Inumbo-ID: 768424ed-22c3-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2u8Y+ycMFxdoVqEDjlWdaMOqsU7HmNTZqEDPUiMzZbY=;
        b=NZk1YLLTOycT/zm4r8GVbaEAfPh7ahEk7Mjwn2Xt9jB6051d0mLHgwQQRq0rV5lvZ6
         bNV35F+glQmTCCC/HYPIKUgQJJNk+1KIFHzu4OXXXaqWPzNOLq317f9nMv17BCg9Rqm1
         L45UzQOizHkJulGR84FhdgH2bZbJyJ4NoeKqPWY+WK1pa6wy8NNebTZvyR8UnYPZii4W
         /jcl4YatGD49O74H77TM/k6eURsKSde95cG36lAncQKNuvhaTkcoHMGK1lHNhsrojm6F
         TDv4ZcPUmbBXEUwV4RM2UatHBKM9vsvQRMiH7TGjMFf8vowYNF6zMltVjG9SpzZktW2d
         PjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2u8Y+ycMFxdoVqEDjlWdaMOqsU7HmNTZqEDPUiMzZbY=;
        b=7EY66Ya02Md0m2ezqLh8NJwxMUWAdCPHAkkejUMFLqbqKIUkbfrdSp0gFTSloPy4ZS
         BRutiWSZu3gnIg3zdS1K23vkHmYkk6vm0R2DOtdV0zuNNevzfn3JZ4tG+ounoo5uQn37
         AuFsds6OyrsHliSFrzWgnKh5DuaFPLE6x8R2x8RRSyLtqZi0YKuwrYBxKrW6mnRbuO9H
         D1aKugT0OIE1URW2LMU+weG5ORYk2sueP2tB1w6k4RWGTi9nAw49Q2rcMBNLdqEmnXIm
         CdUnEBGheGkbjSK/T9zAbo+AF+hnwyQ6G2ceIOVHTjk2d+m0ubWWks8YgK2GM59VAwU3
         ZtQw==
X-Gm-Message-State: ACgBeo3xzF+C32CWCPa0BGiYsnG+kgCeuuD2upbq0AHTOpWCwNENLvMF
	sGFzKuDct6EFIZJdoNIBL+l7y4f4dxuGiADFGtN7FqJgVj0yHw==
X-Google-Smtp-Source: AA6agR7h/V9Km9bsfLuonJKsBk+u4XN20hkhI3ArJE9VM7xvomLBqzK+LWlp/4qrmaF7d7og7IhE6w/mf7L29hbeH8Y=
X-Received: by 2002:a17:906:9749:b0:730:aaee:30e2 with SMTP id
 o9-20020a170906974900b00730aaee30e2mr15467084ejy.248.1661245841699; Tue, 23
 Aug 2022 02:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
 <f2550c1c-b843-cd04-c3f8-91737cc192ff@suse.com> <CABg_PyL3eaeWAvS_pJaE9vUrbWPC=SkQBj4q4z37EqCPQM9YpQ@mail.gmail.com>
In-Reply-To: <CABg_PyL3eaeWAvS_pJaE9vUrbWPC=SkQBj4q4z37EqCPQM9YpQ@mail.gmail.com>
From: A Sudheer <asr7247@gmail.com>
Date: Tue, 23 Aug 2022 14:40:30 +0530
Message-ID: <CABg_PyL1n4wyb1no0AHA4weRAs6BHoTS36-AZJv-PTp9ffzNig@mail.gmail.com>
Subject: Re: USB passthrough fails with 64GB drive but works fine with 8GB drive
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000047768405e6e4f0ae"

--00000000000047768405e6e4f0ae
Content-Type: text/plain; charset="UTF-8"

Hi

I am able to mount 64GB usb drive to DomU  after changing the controller
version to 3.
USB device i am using is version 3.2 Gen2 but the controller attached to
DomU was version:2. So usbdev-attach failed earlier.

#sudo xl usbctrl-attach VM3 version=3 ports=6
#sudo xl usbdev-attach VM3 hostbus=3 hostaddr=2

With above commands, i am able to access usb storage in DomU.

i assume this is PVUSB method. Can someone confirm it ?


Thanks
Sudheer


On Thu, Aug 18, 2022 at 2:49 PM A Sudheer <asr7247@gmail.com> wrote:

> Hi Juergen,
>
> Attached the qemu-dm-VM3.log .
> No errors are reported here.
> With 64GB drive  in DomU, both "lsusb" and "lsblk" commands   lists the
> USB drive but dmesg shows I/O error.
>
> Thanks
> Sudheer
>
>
> On Thu, Aug 18, 2022 at 12:02 PM Juergen Gross <jgross@suse.com> wrote:
>
>> [removing xen-users to avoid crossposting]
>>
>> On 18.08.22 08:18, A Sudheer wrote:
>> > Hi All
>> >
>> > On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB
>> mass
>> > storage device passthrough to DomU.
>> > I followed the PVUSB method mentioned in
>> > https://wiki.xenproject.org/wiki/Xen_USB_Passthrough
>> > <https://wiki.xenproject.org/wiki/Xen_USB_Passthrough>.
>> >
>> > With 8GB sandisk pen drive, i am able to do USB passthrough to DomU.
>> > But with 64GB sandisk pendrive, though able to mount/umount in Dom0,
>> not able to
>> > do passthrough to DomU.
>> > I see IO errors in dmesg  when tried to access the usb disk folder in
>> DomU.
>> > Both 8GB and 64GB disks are 3.2Gen1. (Not tried with 16GB & 32GB
>> drives).
>> >
>> > Does anyone know why 64GB usb disk passthrough fails with the below
>> error ?
>> >
>> > Dmesg Error:
>> > -----------------
>> > [  128.333409] usb 2-1: reset high-speed USB device number 2 using
>> ehci-pci
>> > [  128.502872] sd 2:0:0:0: [sda] tag#0 FAILED Result:
>> hostbyte=DID_ERROR
>> > driverbyte=DRIVER_OK cmd_age=0s
>> > [  128.502881] sd 2:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 7a b7
>> 00 00 3f 00
>> > [  128.502883] blk_update_request: I/O error, dev sda, sector 31415 op
>> > 0x0:(READ) flags 0x80700 phys_seg 63 prio class 0
>>
>> Do you have the related qemu log from dom0? Should be something like
>> /var/log/xen/qemu-dm-*.log
>>
>>
>> Juergen
>>
>

--00000000000047768405e6e4f0ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div><br></div><div>I am able to mount 64GB usb dr=
ive to DomU=C2=A0 after changing the controller version to 3.</div><div>USB=
 device i am using is version 3.2 Gen2 but the controller attached to DomU =
was version:2. So usbdev-attach failed earlier.</div><div><br></div><div>#s=
udo xl usbctrl-attach VM3 version=3D3 ports=3D6<br>#sudo xl usbdev-attach V=
M3 hostbus=3D3 hostaddr=3D2<br></div><div><br></div><div>With above command=
s, i am able to access usb storage in DomU.</div><div><br></div><div>i assu=
me this is PVUSB method. Can someone confirm it ?</div><div><br></div><div>=
<br></div><div>Thanks</div><div>Sudheer</div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 18,=
 2022 at 2:49 PM A Sudheer &lt;<a href=3D"mailto:asr7247@gmail.com" target=
=3D"_blank">asr7247@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Juergen,<div><br></div><di=
v>Attached the qemu-dm-VM3.log .</div><div>No errors are reported here.</di=
v><div>With 64GB drive=C2=A0 in DomU, both &quot;lsusb&quot; and &quot;lsbl=
k&quot; commands=C2=A0 =C2=A0lists the USB drive but dmesg shows I/O error.=
=C2=A0</div><div><br></div><div>Thanks</div><div>Sudheer</div><div><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Aug 18, 2022 at 12:02 PM Juergen Gross &lt;<a href=3D"mailto:jgro=
ss@suse.com" target=3D"_blank">jgross@suse.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">[removing xen-users to avoid =
crossposting]<br>
<br>
On 18.08.22 08:18, A Sudheer wrote:<br>
&gt; Hi All<br>
&gt; <br>
&gt; On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB m=
ass <br>
&gt; storage device passthrough to DomU.<br>
&gt; I followed the PVUSB method mentioned in <br>
&gt; <a href=3D"https://wiki.xenproject.org/wiki/Xen_USB_Passthrough" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Xen_USB_=
Passthrough</a> <br>
&gt; &lt;<a href=3D"https://wiki.xenproject.org/wiki/Xen_USB_Passthrough" r=
el=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Xen_US=
B_Passthrough</a>&gt;.<br>
&gt; <br>
&gt; With 8GB sandisk pen drive, i am able to do USB passthrough to DomU.<b=
r>
&gt; But with 64GB sandisk pendrive, though able to mount/umount in Dom0, n=
ot able to <br>
&gt; do passthrough to DomU.<br>
&gt; I see IO errors in dmesg=C2=A0 when tried to access the usb disk folde=
r in DomU.<br>
&gt; Both 8GB and 64GB disks are 3.2Gen1. (Not tried with 16GB &amp; 32GB d=
rives).<br>
&gt; <br>
&gt; Does anyone know why 64GB usb disk passthrough fails with the below er=
ror ?<br>
&gt; <br>
&gt; Dmesg Error:<br>
&gt; -----------------<br>
&gt; [ =C2=A0128.333409] usb 2-1: reset high-speed USB device number 2 usin=
g ehci-pci<br>
&gt; [ =C2=A0128.502872] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=3D=
DID_ERROR <br>
&gt; driverbyte=3DDRIVER_OK cmd_age=3D0s<br>
&gt; [ =C2=A0128.502881] sd 2:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 =
7a b7 00 00 3f 00<br>
&gt; [ =C2=A0128.502883] blk_update_request: I/O error, dev sda, sector 314=
15 op <br>
&gt; 0x0:(READ) flags 0x80700 phys_seg 63 prio class 0<br>
<br>
Do you have the related qemu log from dom0? Should be something like<br>
/var/log/xen/qemu-dm-*.log<br>
<br>
<br>
Juergen<br>
</blockquote></div>
</blockquote></div>

--00000000000047768405e6e4f0ae--

