Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351977FB840
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642985.1002833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vXh-0007g4-8Y; Tue, 28 Nov 2023 10:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642985.1002833; Tue, 28 Nov 2023 10:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vXh-0007dk-5T; Tue, 28 Nov 2023 10:42:13 +0000
Received: by outflank-mailman (input) for mailman id 642985;
 Tue, 28 Nov 2023 10:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ImyS=HJ=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r7vXg-0007Og-8K
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:42:12 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c87d1a86-8dda-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:42:10 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5488bf9e193so7222952a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:42:10 -0800 (PST)
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
X-Inumbo-ID: c87d1a86-8dda-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701168130; x=1701772930; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LMweMtKzlGGErdAPuMSZvkgbTLlKrcEIRSD6fpsoUS0=;
        b=FWRaZp6ILszCBxg+DiUeIKoRjHV+b4JnxsII0+bmr2AvnBhpzeay67zXQn3tOaJK6D
         E+mopvMBIc3f+GcIRRE4v9iQlufnOD9cxBdFcfvYYh2bKO/GU0CmckdSE5S/JzaupC9k
         L54hHw5cG6+sXZuNqOdLhaLI8opSUEkUteT5ZckfRVaGvM7N/jIkj65lQubK41EWNswY
         dG3sEtE6XG3PNgL2nUfsk6V/dUAcrsNv9Sxe7dAu9wLVlbFefHZepOV/4g9djum6C92Q
         AS6KXxLUN4Qo+IjX/MV2wST70/DhEhPmbvJQB77MRQErkdCu0X+/OQXpHF1qmlneezHH
         CDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701168130; x=1701772930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMweMtKzlGGErdAPuMSZvkgbTLlKrcEIRSD6fpsoUS0=;
        b=bTTfbpn6Gz7aY/pqm9bw4ZbhkSv4Bmfl/hqZ4BXWR9UWGvg2F+/zBy8dIlY1x6OPNx
         0WuWk5IcQQE123KD5wFKKpu2YAY74QfDldcG9jKNMAVhzDuZZM2C4mzyiN3aBVLitCXN
         jCp23VLf/XBaeoWrNIlr66QwqcFnpOiMuXdzLWUAuSIgKiCmURfQSG/K5vYmg5iT9Zge
         DVdnlOhw+7yWo5pr0kzUu2tX2AZ/Q2h4402ULbomI79F4doFhRQusQ0hWn8J1ikTaS95
         JhYE6o2sc+xHYKkcEFDvxsEPlgDdhvzvGVBJI5PL0WCncMZRkx+zQcxSAWz/BgMpNSZt
         tejA==
X-Gm-Message-State: AOJu0Yx8Ph21Gi6eLE6Q7otS4+0xOtwK2FfNX9NWrAjS02kyziTnkDfo
	Z2a46ktZUhzIfgQAExH42DEyF7xVEz5zBg56eXph5Bz1r+7GxEJO
X-Google-Smtp-Source: AGHT+IHZcUWhPB108UMRIaO5f7fhDCozfkVs9V1e8cwhD2mWotxO0DrJjV5gp3SavkH6Rqshd/4lfEwcVgEBuZObF/0=
X-Received: by 2002:a17:906:c307:b0:9d4:2080:61dc with SMTP id
 s7-20020a170906c30700b009d4208061dcmr11709602ejz.22.1701168129329; Tue, 28
 Nov 2023 02:42:09 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net> <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <alpine.DEB.2.22.394.2311271826370.3533093@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311271826370.3533093@ubuntu-linux-20-04-desktop>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 28 Nov 2023 11:41:32 +0100
Message-ID: <CA+1FSijGq3oByrb7sDy-Zw5zqFXamyeYGrYQ9jouhN42ZDrvYA@mail.gmail.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32 bit
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Elliott Mitchell <ehem+freebsd@m5p.com>
Content-Type: multipart/alternative; boundary="0000000000000d4e84060b3412b7"

--0000000000000d4e84060b3412b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

to try to compile the correct freebsd kernel that's recognized by xen using
the Elliott Michell code, are the commands below the correct ones ?

$ truncate -s 100G xenvm.img
$ mdconfig -f xenvm.img -u 0
$ newfs /dev/md0
$ mount /dev/md0 /mnt
$ git clone https://gitlab.com/ehem/freebsd-src.git
$ cd freebsd-src

$ make  -DNO_MODULES   KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 =
buildkernel

$ echo "/dev/xbd0       /       ufs     rw      1
1" > /mnt/etc/fstab

$ nano /build/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc"
xterm on secure")
$ umount /build
$ mdconfig -d -u 0

Do you see errors ? some missing ? very thanks.


On Tue, Nov 28, 2023 at 3:28=E2=80=AFAM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Mon, 27 Nov 2023, Chuck Zmudzinski wrote:
> > On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
> > > On 11/27/2023 7:45 AM, Mario Marietto wrote:
> > >> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They
> want to help us. The xen developers are great. Very good support for us.
> I'm sure that you can give a good contribution to understand what's our
> problem and how to implement a fix with the help of all those good guys.
> > >>
> > >> On Mon, Nov 27, 2023 at 11:56=E2=80=AFAM Roger Pau Monn=C3=A9 <
> roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
> > >>
> > >>     On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
> > >>     > +(xen-devel and Arm maintainers, including Julien)
> > >>     >
> > >>     > > On Nov 27, 2023, at 18:03, Mario Marietto <
> marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
> > >>     > > wrote:
> > >>     > >
> > >>     > > Hello.  We have just virtualized Debian 12 on our arm (32 bi=
t)
> > >>     > > Chromebook model xe303c12 . As host / dom0 we have chosen
> Devuan
> > >>     > > 5,and for guest / domU,Debian 12. It works great. But our
> goal is
> > >>     > > different. We want to virtualize FreeBSD as domU. Can we hav=
e
> a
> > >>     > > working Xen PV network driver for a FreeBSD arm guest ?. I
> found
> > >>     > > that Julien Grall has ported the Xen drivers to FreeBSD on
> arm. I
> > >>     > > would like to know if Julien's work was accepted upstream by
> > >>     > > FreeBSD, in which case FreeBSD as a Xen guest on arm should
> work
> > >>     > > if we enable the Xen PV drivers in the FreeBSD on arm kernel=
.
> If
> > >>     > > Julien's work was not accepted upstream by FreeBSD, we will
> have
> > >>     > > to find his patches and apply them ourselves to the FreeBSD
> on arm
> > >>     > > kernel.
> > >>
> > >>     I've added Elliot on Cc as he is working on upstreaming the
> patches to
> > >>     FreeBSD.  He will be able to provide a better update than myself=
.
> > >>
> > >>     Regards, Roger.
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
> You can use the DEBUG hypercalls to check how far we got into the
> booting process:
> https://wiki.xenproject.org/wiki/Xen_ARM_DEBUG_hypercalls
>
> For instance add the following to FreeBSD code:
>
> asm volatile("hvc 0xfffd");
>
>

--=20
Mario.

--0000000000000d4e84060b3412b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><br></div><div>to try to compile the=
 correct freebsd kernel that&#39;s recognized by xen using the Elliott Mich=
ell code, are the commands below the correct ones ?</div><div><br></div><di=
v><pre class=3D"gmail-_3GnarIQX9tD_qsgXkfSDz1"><code class=3D"gmail-_34q3Pg=
Lsx9zIU5BiSOjFoM">$ truncate -s 100G xenvm.img<br>$ mdconfig -f xenvm.img -=
u 0=20
$ newfs /dev/md0=20
$ mount /dev/md0 /mnt<br>$</code><span style=3D"font-family:monospace"><spa=
n style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"> git clone <=
a href=3D"https://gitlab.com/ehem/freebsd-src.git">https://gitlab.com/ehem/=
freebsd-src.git</a><br>$ </span></span>cd freebsd-src<br><br>$ make  -DNO_M=
ODULES   KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 buildkernel<co=
de class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM"><br><br>$ echo &quot;/dev/xbd0  =
     /       ufs     rw      1=20
1&quot; &gt; /mnt/etc/fstab =20

$ nano /build/etc/ttys (add the line &#39;xc0 &quot;/usr/libexec/getty Pc&q=
uot; xterm on secure&quot;)
$ umount /build<br>$ mdconfig -d -u 0<br><br></code></pre><pre class=3D"gma=
il-_3GnarIQX9tD_qsgXkfSDz1"><code class=3D"gmail-_34q3PgLsx9zIU5BiSOjFoM">D=
o you see errors ? some missing ? very thanks.<br></code></pre></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Nov 28, 2023 at 3:28=E2=80=AFAM Stefano Stabellini &lt;<a href=3D"mailto:=
sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 27 Nov 2023, Chuck Zm=
udzinski wrote:<br>
&gt; On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:<br>
&gt; &gt; On 11/27/2023 7:45 AM, Mario Marietto wrote:<br>
&gt; &gt;&gt; @Chuck Zmudzinski &lt;mailto:<a href=3D"mailto:brchuckz@netsc=
ape.net" target=3D"_blank">brchuckz@netscape.net</a>&gt; : Stay tuned. They=
 want to help us. The xen developers are great. Very good support for us. I=
&#39;m sure that you can give a good contribution to understand what&#39;s =
our problem and how to implement a fix with the help of all those good guys=
.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; On Mon, Nov 27, 2023 at 11:56=E2=80=AFAM Roger Pau Monn=C3=A9=
 &lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank">roger.pau@ci=
trix.com</a> &lt;mailto:<a href=3D"mailto:roger.pau@citrix.com" target=3D"_=
blank">roger.pau@citrix.com</a>&gt;&gt; wrote:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Nov 27, 2023 at 10:28:13AM +0000, =
Henry Wang wrote:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +(xen-devel and Arm maintainers, incl=
uding Julien)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Nov 27, 2023, at 18:03, Mario=
 Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">m=
arietto2008@gmail.com</a> &lt;mailto:<a href=3D"mailto:marietto2008@gmail.c=
om" target=3D"_blank">marietto2008@gmail.com</a>&gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; wrote:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Hello.=C2=A0 We have just virtua=
lized Debian 12 on our arm (32 bit)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Chromebook model xe303c12 . As h=
ost / dom0 we have chosen Devuan<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; 5,and for guest / domU,Debian 12=
. It works great. But our goal is<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; different. We want to virtualize=
 FreeBSD as domU. Can we have a<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; working Xen PV network driver fo=
r a FreeBSD arm guest ?. I found<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; that Julien Grall has ported the=
 Xen drivers to FreeBSD on arm. I<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would like to know if Julien&#39=
;s work was accepted upstream by<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; FreeBSD, in which case FreeBSD a=
s a Xen guest on arm should work<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; if we enable the Xen PV drivers =
in the FreeBSD on arm kernel. If<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Julien&#39;s work was not accept=
ed upstream by FreeBSD, we will have<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; to find his patches and apply th=
em ourselves to the FreeBSD on arm<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; kernel.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ve added Elliot on Cc as he is worki=
ng on upstreaming the patches to<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0FreeBSD.=C2=A0 He will be able to provide =
a better update than myself.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Regards, Roger.<br>
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
You can use the DEBUG hypercalls to check how far we got into the<br>
booting process:<br>
<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_DEBUG_hypercalls" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Xen_ARM_=
DEBUG_hypercalls</a><br>
<br>
For instance add the following to FreeBSD code:<br>
<br>
asm volatile(&quot;hvc 0xfffd&quot;);<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000000d4e84060b3412b7--

