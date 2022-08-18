Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43895980B5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 11:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389398.626277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObgu-00005Q-2P; Thu, 18 Aug 2022 09:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389398.626277; Thu, 18 Aug 2022 09:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObgt-0008UU-Vn; Thu, 18 Aug 2022 09:19:51 +0000
Received: by outflank-mailman (input) for mailman id 389398;
 Thu, 18 Aug 2022 09:19:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E7Ox=YW=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oObgs-0008UO-5B
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 09:19:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e86cf372-1ed6-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 11:19:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id uj29so2197115ejc.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 02:19:49 -0700 (PDT)
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
X-Inumbo-ID: e86cf372-1ed6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0VMHRDxh41DodWKlfsNd/uNxqqwjHqDDSqrlGHuWWgg=;
        b=WyzSVoDbl4i/eCf2v4h4L1vtjVs91mCj717+iFEMjkVvjPcIlLlngtu46u2JWLru1I
         6yg4nyVh7NzXd5SZTIi8UX62l3JawvNiv4ZTMb/SVhQgHDnxgB3iRgeMq4NNXDgxRu6k
         GspheHKocFoEW+k8EjeUE+EX2mH/R6kcIm9PLOa3zosMyGgj79GehmKdOU7SkgJx1E2f
         RizF6xh4W3xJdXtiwvV+SJ3QK+tWEm07t334pUNVXrspBtQ6I/xxb9fojy5qbd7qBnml
         oLfhc4uQX1wG80OEdXvxPwav6HrWLbs94dAvvo3whFiWek5FmbR04xhiwVAC2N7U36Wd
         VQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0VMHRDxh41DodWKlfsNd/uNxqqwjHqDDSqrlGHuWWgg=;
        b=PVnH/X7e7t982p/GyJ3/wBDR2HpOEWAX7moy9MhlrtskKfS8mjJcSY5g9qa0TqEU5N
         wzvwpzSL8/iWtXTdG23ZqPTz8HnIwG/PhqLCg5Iz+dGdxSL3u1WihkuOaqXR4OgQymcm
         y1CUTL8ryp7fXz6D3seM0DOClX7X2efwpiHLul7FYl2Juc5CYWJ/hCwGKeWvw4j+EM94
         Xi5eFs81cleXBmzv2vK6+3/2xblXLfImmfKBrVhAiKl4L8+JdtLGdSpoxS0RfnusJn/K
         kHUZcKyHazZQmof+AjZp4gYZsaSfpeLC+QY7JtHlUmFmaQiwZaxBGX0+tSB6Dh+yi3gq
         0TNA==
X-Gm-Message-State: ACgBeo24eax0Hi+rdc7TF0frLgi/ZQVms6rzyFA96f2t9FwnwORHhgQL
	OLnxqtgzX2ZlBMdp2z04msCKaQBQVxGVkPC2XjrLiLvMjGE=
X-Google-Smtp-Source: AA6agR5Vig59QQWoccyQ5KpvlNY6M8CYOWjIKAdd8BnbSmTeibOM/G4nfED6YJREcvjrhBfw8AVKtT+JvCrqvJUV7BQ=
X-Received: by 2002:a17:906:9b16:b0:730:d5f4:d46e with SMTP id
 eo22-20020a1709069b1600b00730d5f4d46emr1331618ejc.701.1660814388496; Thu, 18
 Aug 2022 02:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
 <f2550c1c-b843-cd04-c3f8-91737cc192ff@suse.com>
In-Reply-To: <f2550c1c-b843-cd04-c3f8-91737cc192ff@suse.com>
From: A Sudheer <asr7247@gmail.com>
Date: Thu, 18 Aug 2022 14:49:36 +0530
Message-ID: <CABg_PyL3eaeWAvS_pJaE9vUrbWPC=SkQBj4q4z37EqCPQM9YpQ@mail.gmail.com>
Subject: Re: USB passthrough fails with 64GB drive but works fine with 8GB drive
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000aa42ee05e6807ba8"

--000000000000aa42ee05e6807ba8
Content-Type: multipart/alternative; boundary="000000000000aa42ec05e6807ba6"

--000000000000aa42ec05e6807ba6
Content-Type: text/plain; charset="UTF-8"

Hi Juergen,

Attached the qemu-dm-VM3.log .
No errors are reported here.
With 64GB drive  in DomU, both "lsusb" and "lsblk" commands   lists the USB
drive but dmesg shows I/O error.

Thanks
Sudheer


On Thu, Aug 18, 2022 at 12:02 PM Juergen Gross <jgross@suse.com> wrote:

> [removing xen-users to avoid crossposting]
>
> On 18.08.22 08:18, A Sudheer wrote:
> > Hi All
> >
> > On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB
> mass
> > storage device passthrough to DomU.
> > I followed the PVUSB method mentioned in
> > https://wiki.xenproject.org/wiki/Xen_USB_Passthrough
> > <https://wiki.xenproject.org/wiki/Xen_USB_Passthrough>.
> >
> > With 8GB sandisk pen drive, i am able to do USB passthrough to DomU.
> > But with 64GB sandisk pendrive, though able to mount/umount in Dom0, not
> able to
> > do passthrough to DomU.
> > I see IO errors in dmesg  when tried to access the usb disk folder in
> DomU.
> > Both 8GB and 64GB disks are 3.2Gen1. (Not tried with 16GB & 32GB drives).
> >
> > Does anyone know why 64GB usb disk passthrough fails with the below
> error ?
> >
> > Dmesg Error:
> > -----------------
> > [  128.333409] usb 2-1: reset high-speed USB device number 2 using
> ehci-pci
> > [  128.502872] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_ERROR
> > driverbyte=DRIVER_OK cmd_age=0s
> > [  128.502881] sd 2:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 7a b7
> 00 00 3f 00
> > [  128.502883] blk_update_request: I/O error, dev sda, sector 31415 op
> > 0x0:(READ) flags 0x80700 phys_seg 63 prio class 0
>
> Do you have the related qemu log from dom0? Should be something like
> /var/log/xen/qemu-dm-*.log
>
>
> Juergen
>

--000000000000aa42ec05e6807ba6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Juergen,<div><br></div><div>Attached the qemu-dm-VM3.lo=
g .</div><div>No errors are reported here.</div><div>With 64GB drive=C2=A0 =
in DomU, both &quot;lsusb&quot; and &quot;lsblk&quot; commands=C2=A0 =C2=A0=
lists the USB drive but dmesg shows I/O error.=C2=A0</div><div><br></div><d=
iv>Thanks</div><div>Sudheer</div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 18, 2022 at 12:=
02 PM Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">[=
removing xen-users to avoid crossposting]<br>
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

--000000000000aa42ec05e6807ba6--
--000000000000aa42ee05e6807ba8
Content-Type: application/octet-stream; name="qemu-dm-VM3.log"
Content-Disposition: attachment; filename="qemu-dm-VM3.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l6ytpj080>
X-Attachment-Id: f_l6ytpj080

Vk5DIHNlcnZlciBydW5uaW5nIG9uIDEyNy4wLjAuMTo1OTAwCmdsX3ZlcnNpb24gNDYgLSBjb3Jl
IHByb2ZpbGUgZW5hYmxlZApHTFNMIGZlYXR1cmUgbGV2ZWwgNDYwCnFlbXUtc3lzdGVtLWkzODY6
IHRlcm1pbmF0aW5nIG9uIHNpZ25hbCAxIGZyb20gcGlkIDMyNTIgKHhsKQo=
--000000000000aa42ee05e6807ba8--

