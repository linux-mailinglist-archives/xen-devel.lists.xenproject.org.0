Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE67FAE3E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 00:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642673.1002307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7kvf-0005iR-FV; Mon, 27 Nov 2023 23:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642673.1002307; Mon, 27 Nov 2023 23:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7kvf-0005g5-Bx; Mon, 27 Nov 2023 23:22:15 +0000
Received: by outflank-mailman (input) for mailman id 642673;
 Mon, 27 Nov 2023 23:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJnr=HI=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r7kvd-0005fz-H0
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 23:22:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99ae52f-8d7b-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 00:22:10 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9fd0059a967so1122429466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 15:22:10 -0800 (PST)
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
X-Inumbo-ID: c99ae52f-8d7b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701127329; x=1701732129; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57DF+as5OT3YcN1tasSYT/2Li56Bsht+emeOpvyzrvg=;
        b=lkMoMScZN5jkZ9gK5xvDV9aYkumOIfzxvFn+/1nFEbTAYSQBvwPuI+3BqtGJ+oAGQc
         BGrCrgJmWfzHQdmwsBrDd5oRe8fZtEARtmAwn1cjCur5FN93HuB9rYvqbMgfQ3bPQDKe
         68sbC1UpehPmX5zv9pOAnEGNfE4CLOFUa9ZIDuYa4R9b9VLnf5i2oq3GS4nTas9tggvY
         3W07Q5J8lT7uDx4eAyDRHvu7eJ8OV909rcM9OzLbhdVoSGY+B+6NQC/KzcGZGmZPb7OD
         Ni1a6XFp7WvHU32k8MwqNivDidqcG59CTnB4sIV1pRhjCAkzND0Y3RedtDSUN5e3HZKE
         dTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701127329; x=1701732129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57DF+as5OT3YcN1tasSYT/2Li56Bsht+emeOpvyzrvg=;
        b=H/XIUhLQ49/TXDJftYm8QlhUaygpNgbHDgQ1VbZ4Omm5kah9X7bhJ+5/l9e/S8bqip
         Zp6jWPtiZNK01mWcvuoEMkOSNTaMoaeexxjgQnZS3Qx2mL3C/kdzb/xo5EbSgcle+TTl
         PNUbH9jW5b3uRNCN0COwKTdo1SQcPC52e/Kl7egV6AKmkX1oJRYWx1MvhZKgE2XZSYi+
         2FM3rst2sgGPMzgsmX3Y3P7eD9p9Eu6p+lpj/IR5DKG5Br65UlEYlho3aqhw2VM+c9HE
         N3v8iKsXvQ+i/a1ChjQYzIS1Cy+zB+mLHkWroIDCmOIzSzJW2UAP5z6x5pcD1kroRA8P
         oFRA==
X-Gm-Message-State: AOJu0Yzq1T+RmC3aEVD7rPOoEKExLbrmT9zqRQbHLNx0x9rVStpPnEai
	EBhKWJvmQFIQvKf8PLnPiRKRy6epmEYBEhJZy2M=
X-Google-Smtp-Source: AGHT+IGusc6u/tCxvbZ7C5bA8J1owms8jL2DypfIAVyhJ0wFyqMVBVbGIXQ/yKR3iluDBizbQFmQH8lz3oMZGlwOmlA=
X-Received: by 2002:a17:906:e17:b0:9e8:1ba0:18fb with SMTP id
 l23-20020a1709060e1700b009e81ba018fbmr13751354eji.29.1701127328944; Mon, 27
 Nov 2023 15:22:08 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net> <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
In-Reply-To: <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 28 Nov 2023 00:21:32 +0100
Message-ID: <CA+1FSijOZW_OTH2B3Zh3xkEFDt1h0TJo+kmZMtrO4yzga-RrGg@mail.gmail.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32 bit
To: Elliott Mitchell <ehem+freebsd@m5p.com>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: multipart/alternative; boundary="00000000000028d415060b2a92f6"

--00000000000028d415060b2a92f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I know two FreeBSD developers that can commit your patches,if they think
that they are good. I could drop an email to them. I've hardly helped one
of them with the testing when we have implemented the passthrough of a
recent nvidia gpu on Linux. The second one is experienced with arm and
virtualization. Plus I know the main developer of bhyve. I'm happy to ask
them to review your work.

On Tue, Nov 28, 2023 at 12:04=E2=80=AFAM Elliott Mitchell <ehem+freebsd@m5p=
.com>
wrote:

> On Mon, Nov 27, 2023 at 10:57:42AM -0500, Chuck Zmudzinski wrote:
> > On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
> > >
> > > I have been collaborating with Mario, and I can explain what we have
> done so far :
> > >
> > > We are using Julien's patch set against an old development version of
> FreeBSD 11
> > > from 2014-12-03 :
> > >
> > >
> https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dshortl=
og;h=3Drefs/heads/xen-arm-v2.2
> > >
> > > We successfully built the XENVIRT kernel and FreeBSD world, and
> created the
> > > FreeBSD rootfs according to Julien's instructions here :
> > >
> > >
> https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
> > >
> > > There were some adjustments to the instructions :
> > >
> > > To build the kernel, we used :
> > >
> > > $ sudo make TARGET_ARCH=3Darmv6 KERNCONF=3DXENVIRT buildkernel
> > >
> > > instead of
> > >
> > > $ sudo make TARGET_ARCH=3Darmv6 KERNCONF=3DXENHVM buildkernel
> > >
> > > The FreeBSD 'kernel' file is in ELF format and did not work, and we
> spent
> > > some time trying to convert it to the zImage format without realizing
> the
> > > build of the FreeBSD kernel creates the 'kernel.bin' file in the
> zImage format.
> > > So when booting with the 'kernel.bin' file instead, it actually boots=
 :
> > >
> > > user@devuan-bunsen ~ % sudo xl create freebsd.cfg
> > > Parsing config from freebsd.cfg
> > > user@devuan-bunsen ~ % sudo xl li
> > > Name                                        ID   Mem VCPUs  State
>  Time(s)
> > > Domain-0                                     0   768     2     r-----
>   1439.4
> > > freebsd                                      1  1152     1     r-----
>      3.0
> > > user@devuan-bunsen ~ %
> > >
> > > However, the guest is still not working correctly :
> > >
> > > 1. Attaching the console with the -c option at creation or with
> > >    'xl console freebsd' results in no output to the console.
> > >
> > > 2. The timestamp on the virtual disk image file shows that the
> filesystem
> > >    was at best mounted read-only, if it was mounted at all by the gue=
st
> > >    FreeBSD kernel.
> > >
> > > 3. The 'xl shutdown freebsd' command does not work, it just hangs. To
> stop
> > >    the guest, you need to do 'xl destroy freebsd'.
> > >
> > > However, I think we can get the console to work and the rootfs to
> mount because I
> > > just realized I forgot to do the steps from Julien's instructions of
> editing the
> > > /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
> > >
> > > $ echo "/dev/xbd0       /       ufs     rw      1       1" >
> /mnt/etc/fstab
> > > $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm o=
n
> secure")
> > >
> > > I will add those and see if the console and disk are working.
> >
> > Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device
> in
> > /etc/fstab did not make the console or disk work. Still no output on th=
e
> > xen console from the guest kernel, and the timestamp on the rootfs imag=
e
> > file did not change so it did not mount read-write.
> >
> > We could use some advice for troubleshooting this. Now, we are blind
> because
> > we are not getting any xen console output But I am pleased we were able
> to
> > demonstrate that Julien's old patch set for FreeBSD 11 allows us to boo=
t
> > FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
> > stable Xen 4.17 packages.
>
> The only method for booting I ever tried was Tianocore/EDK2.  As brought
> up previously, that needs an update for Xen 4.17 though:
> https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00278.htm=
l
> Essentially they had two uses of the shared info page, one was unmapped
> and the other never got unmapped.  That is good enough for FreeBSD's
> bootloader to function.
>
> FreeBSD's handling of patches is unfortunately very friendly to people
> who have permission to commit, or know someone responsible for a
> particular area.  If you're trying to get patches for something which
> has shared responsibility and you're unfunded you're SoL.  As such my
> work has basically stalled.  Everything works, but without anyone with
> an interest it is simply sitting here mouldering.  Combined with the
> annoyance curse it is simply sitting.
>
> Julien Grall's patches are very much PoC.  As such I've done a lot of
> updating.  Take a look at branch "submit":
> https://gitlab.com/ehem/freebsd-src.git
>
> Problem is FreeBSD's interrupt situation is troublesome.  Rather than 1
> interrupt framework, there are 4.  Each has different built-in
> assumptions.  "INTRNG" was designed for ARM and deliberately threw away
> the x86 assumptions, but then added other assumptions.
>
> The tip of the "submit" branch has a mix of different potential
> approaches to working with "INTRNG".  Several of these might be rejected,
> but hopefully one might be accepted.  Really I need someone in the
> FreeBSD organization with the authority to override Michal Meloun's
> proselytizing about INTRNG being perfect.
>
> The other problem is no one in the FreeBSD organization wants to deal
> with it's interrupt disaster.  By the time anyone is allowed to commit,
> they've been thoroughly burned by the situation and are unwilling to
> touch the interrupt system.  Thus leading to the antipattern of it being
> just barely maintained.
>
> I've got it working, just I'm stuck.
>
>
> BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look at the
> "royger" branch?
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>
>

--=20
Mario.

--00000000000028d415060b2a92f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><br></div><div>I know two FreeBSD de=
velopers that can commit your patches,if they think that they are good. I c=
ould drop an email to them. I&#39;ve hardly helped one of them with the tes=
ting when we have implemented the passthrough of a recent nvidia gpu on Lin=
ux. The second one is experienced with arm and virtualization. Plus I know =
the main developer of bhyve. I&#39;m happy to ask them to review your work.=
=C2=A0 <br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Nov 28, 2023 at 12:04=E2=80=AFAM Elliott Mitchell =
&lt;<a href=3D"mailto:ehem%2Bfreebsd@m5p.com">ehem+freebsd@m5p.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, N=
ov 27, 2023 at 10:57:42AM -0500, Chuck Zmudzinski wrote:<br>
&gt; On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:<br>
&gt; &gt; <br>
&gt; &gt; I have been collaborating with Mario, and I can explain what we h=
ave done so far :<br>
&gt; &gt; <br>
&gt; &gt; We are using Julien&#39;s patch set against an old development ve=
rsion of FreeBSD 11<br>
&gt; &gt; from 2014-12-03 :<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/fre=
ebsd.git;a=3Dshortlog;h=3Drefs/heads/xen-arm-v2.2" rel=3D"noreferrer" targe=
t=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git=
;a=3Dshortlog;h=3Drefs/heads/xen-arm-v2.2</a><br>
&gt; &gt; <br>
&gt; &gt; We successfully built the XENVIRT kernel and FreeBSD world, and c=
reated the<br>
&gt; &gt; FreeBSD rootfs according to Julien&#39;s instructions here :<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://lists.freebsd.org/pipermail/freebsd-xen/2014-N=
ovember/002202.html" rel=3D"noreferrer" target=3D"_blank">https://lists.fre=
ebsd.org/pipermail/freebsd-xen/2014-November/002202.html</a><br>
&gt; &gt; <br>
&gt; &gt; There were some adjustments to the instructions :<br>
&gt; &gt; <br>
&gt; &gt; To build the kernel, we used :<br>
&gt; &gt; <br>
&gt; &gt; $ sudo make TARGET_ARCH=3Darmv6 KERNCONF=3DXENVIRT buildkernel<br=
>
&gt; &gt; <br>
&gt; &gt; instead of<br>
&gt; &gt; <br>
&gt; &gt; $ sudo make TARGET_ARCH=3Darmv6 KERNCONF=3DXENHVM buildkernel<br>
&gt; &gt; <br>
&gt; &gt; The FreeBSD &#39;kernel&#39; file is in ELF format and did not wo=
rk, and we spent<br>
&gt; &gt; some time trying to convert it to the zImage format without reali=
zing the<br>
&gt; &gt; build of the FreeBSD kernel creates the &#39;kernel.bin&#39; file=
 in the zImage format.<br>
&gt; &gt; So when booting with the &#39;kernel.bin&#39; file instead, it ac=
tually boots :<br>
&gt; &gt; <br>
&gt; &gt; user@devuan-bunsen ~ % sudo xl create freebsd.cfg<br>
&gt; &gt; Parsing config from freebsd.cfg<br>
&gt; &gt; user@devuan-bunsen ~ % sudo xl li<br>
&gt; &gt; Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ID=C2=A0 =C2=A0Mem VCPUs=C2=A0 State=C2=A0 =C2=A0Time(s)<br>
&gt; &gt; Domain-0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00=C2=A0 =C2=A0768=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0r-----=C2=A0 =
=C2=A0 1439.4<br>
&gt; &gt; freebsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1=C2=A0 1152=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0r-----=C2=A0 =C2=
=A0 =C2=A0 =C2=A03.0<br>
&gt; &gt; user@devuan-bunsen ~ %<br>
&gt; &gt; <br>
&gt; &gt; However, the guest is still not working correctly :<br>
&gt; &gt; <br>
&gt; &gt; 1. Attaching the console with the -c option at creation or with<b=
r>
&gt; &gt;=C2=A0 =C2=A0 &#39;xl console freebsd&#39; results in no output to=
 the console.<br>
&gt; &gt; <br>
&gt; &gt; 2. The timestamp on the virtual disk image file shows that the fi=
lesystem<br>
&gt; &gt;=C2=A0 =C2=A0 was at best mounted read-only, if it was mounted at =
all by the guest<br>
&gt; &gt;=C2=A0 =C2=A0 FreeBSD kernel.<br>
&gt; &gt; <br>
&gt; &gt; 3. The &#39;xl shutdown freebsd&#39; command does not work, it ju=
st hangs. To stop<br>
&gt; &gt;=C2=A0 =C2=A0 the guest, you need to do &#39;xl destroy freebsd&#3=
9;.<br>
&gt; &gt; <br>
&gt; &gt; However, I think we can get the console to work and the rootfs to=
 mount because I<br>
&gt; &gt; just realized I forgot to do the steps from Julien&#39;s instruct=
ions of editing the<br>
&gt; &gt; /etc/fstab and /etc/ttys files in the FreeBSD rootfs :<br>
&gt; &gt; <br>
&gt; &gt; $ echo &quot;/dev/xbd0=C2=A0 =C2=A0 =C2=A0 =C2=A0/=C2=A0 =C2=A0 =
=C2=A0 =C2=A0ufs=C2=A0 =C2=A0 =C2=A0rw=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =
=C2=A0 =C2=A01&quot; &gt; /mnt/etc/fstab<br>
&gt; &gt; $ vi /mnt/etc/ttys (add the line &#39;xc0 &quot;/usr/libexec/gett=
y Pc&quot; xterm on secure&quot;)<br>
&gt; &gt; <br>
&gt; &gt; I will add those and see if the console and disk are working.<br>
&gt; <br>
&gt; Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root devic=
e in<br>
&gt; /etc/fstab did not make the console or disk work. Still no output on t=
he<br>
&gt; xen console from the guest kernel, and the timestamp on the rootfs ima=
ge<br>
&gt; file did not change so it did not mount read-write.<br>
&gt; <br>
&gt; We could use some advice for troubleshooting this. Now, we are blind b=
ecause<br>
&gt; we are not getting any xen console output But I am pleased we were abl=
e to<br>
&gt; demonstrate that Julien&#39;s old patch set for FreeBSD 11 allows us t=
o boot<br>
&gt; FreeBSD 11 on a modern version of Xen on arm - we are using the Debian=
<br>
&gt; stable Xen 4.17 packages.<br>
<br>
The only method for booting I ever tried was Tianocore/EDK2.=C2=A0 As broug=
ht<br>
up previously, that needs an update for Xen 4.17 though:<br>
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg=
00278.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.o=
rg/archives/html/xen-devel/2023-10/msg00278.html</a><br>
Essentially they had two uses of the shared info page, one was unmapped<br>
and the other never got unmapped.=C2=A0 That is good enough for FreeBSD&#39=
;s<br>
bootloader to function.<br>
<br>
FreeBSD&#39;s handling of patches is unfortunately very friendly to people<=
br>
who have permission to commit, or know someone responsible for a<br>
particular area.=C2=A0 If you&#39;re trying to get patches for something wh=
ich<br>
has shared responsibility and you&#39;re unfunded you&#39;re SoL.=C2=A0 As =
such my<br>
work has basically stalled.=C2=A0 Everything works, but without anyone with=
<br>
an interest it is simply sitting here mouldering.=C2=A0 Combined with the<b=
r>
annoyance curse it is simply sitting.<br>
<br>
Julien Grall&#39;s patches are very much PoC.=C2=A0 As such I&#39;ve done a=
 lot of<br>
updating.=C2=A0 Take a look at branch &quot;submit&quot;:<br>
<a href=3D"https://gitlab.com/ehem/freebsd-src.git" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.com/ehem/freebsd-src.git</a><br>
<br>
Problem is FreeBSD&#39;s interrupt situation is troublesome.=C2=A0 Rather t=
han 1<br>
interrupt framework, there are 4.=C2=A0 Each has different built-in<br>
assumptions.=C2=A0 &quot;INTRNG&quot; was designed for ARM and deliberately=
 threw away<br>
the x86 assumptions, but then added other assumptions.<br>
<br>
The tip of the &quot;submit&quot; branch has a mix of different potential<b=
r>
approaches to working with &quot;INTRNG&quot;.=C2=A0 Several of these might=
 be rejected,<br>
but hopefully one might be accepted.=C2=A0 Really I need someone in the<br>
FreeBSD organization with the authority to override Michal Meloun&#39;s<br>
proselytizing about INTRNG being perfect.<br>
<br>
The other problem is no one in the FreeBSD organization wants to deal<br>
with it&#39;s interrupt disaster.=C2=A0 By the time anyone is allowed to co=
mmit,<br>
they&#39;ve been thoroughly burned by the situation and are unwilling to<br=
>
touch the interrupt system.=C2=A0 Thus leading to the antipattern of it bei=
ng<br>
just barely maintained.<br>
<br>
I&#39;ve got it working, just I&#39;m stuck.<br>
<br>
<br>
BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look at the<br>
&quot;royger&quot; branch?<br>
<br>
<br>
-- <br>
(\___(\___(\______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --=3D&gt; 8-) EHM &lt;=
=3D--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ______/)___/)___/)<br>
=C2=A0\BS (=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mail=
to:ehem%2Bsigmsg@m5p.com" target=3D"_blank">ehem+sigmsg@m5p.com</a>=C2=A0 P=
GP 87145445=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 )=C2=A0 =C2=A0/=
<br>
=C2=A0 \_CS\=C2=A0 =C2=A0|=C2=A0 _____=C2=A0 -O #include &lt;stddisclaimer.=
h&gt; O-=C2=A0 =C2=A0_____=C2=A0 |=C2=A0 =C2=A0/=C2=A0 _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--00000000000028d415060b2a92f6--

