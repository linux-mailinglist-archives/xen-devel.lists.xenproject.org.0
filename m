Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968D72D6B5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 03:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547715.855287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8sVY-00042T-Nv; Tue, 13 Jun 2023 01:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547715.855287; Tue, 13 Jun 2023 01:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8sVY-0003zs-Ky; Tue, 13 Jun 2023 01:07:40 +0000
Received: by outflank-mailman (input) for mailman id 547715;
 Tue, 13 Jun 2023 01:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMKC=CB=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1q8sVX-0003zh-Kw
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 01:07:39 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aebddf2b-0986-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 03:07:37 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-56d549284bbso4269297b3.0; 
 Mon, 12 Jun 2023 18:07:36 -0700 (PDT)
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
X-Inumbo-ID: aebddf2b-0986-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686618455; x=1689210455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IZxBVTrJ/8k0TJYWn5v8UKzrmg/Gt9ZgBAmx9alb1Pk=;
        b=LVhsNiM3DSoX+YLwXhGSq7JfhpvEQAiqlSNnFbPF5ebuQbSQrhTNkQk2wNavSvUwPs
         7kkjA2tpla9Hn7NFjd+irk4v1lVty/xzzCqUWmyQ0MpyXSBpR9oIXaQ1TihwUKWdzzil
         Y+b3gSy1dXszcAfhA4bcTb852XbOT5dXuzddi1yAmrRlTmy33PH/kaO9mFuAkyXGXrvP
         MkqkPXpui/0pFhTGNpMHGhv++iUgz76Cjo+Vv/xAlgi/ZZbBYFz/W5T+SFZrtNrNgnmH
         EN1pAxyh0Y9PUTQxEVuqzM0crUE+56OmfXuyIyKV92Q5BeMXFAI/2GCC0Cg/vcRvuYEb
         i7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686618455; x=1689210455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZxBVTrJ/8k0TJYWn5v8UKzrmg/Gt9ZgBAmx9alb1Pk=;
        b=LYwgMKDxWY6tL4t+lDhtpJRMLGWMZqE3NsY6knIijVOQVeoSLDulDJowEeTEveazJ7
         tqA4MjSmy2wNB46mUhgPr96IoC5z0IIztWSzUvZV6Qbl3xoGdxxKiCsuYrGXMLMI4lGP
         HdG6DFmtocvZOZPAPBaqvH6s6zroQM55FfpthRfCTswHpCqdHnNaH8adhY6RswoJSqfR
         jb0WVYY+b9NFPrvYAeYKb0NdbRXtkrHDMy/nzM1loaWHscPJ3KQBDeC/4XqPdjJAnjLZ
         o6hUOfsCljwgETVa8hRmmp2x511S6yI9n55roMFYHO0wbIHIlL2XwN6dcXt3K4JFE/AC
         PYmA==
X-Gm-Message-State: AC+VfDwzqmBTMQhRgFRG4ox43LElwSDXVZpYVffDC7KZJ8bOsfdwjNRE
	GPgfra07r0i6VV9dI+9xeQET0JJ2W0oqNYu9mXETOSBy
X-Google-Smtp-Source: ACHHUZ7jPp41+KCaHt2wgfD/m5JO1Ek0kJs+hZAf38QkAHS4z2oRSSBuMOayGa+F+z0yWWcR/n/owY6zU/LccPFPEr8=
X-Received: by 2002:a81:4688:0:b0:569:5f72:4d4 with SMTP id
 t130-20020a814688000000b005695f7204d4mr425609ywa.4.1686618455200; Mon, 12 Jun
 2023 18:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org> <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org> <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com> <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
In-Reply-To: <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Tue, 13 Jun 2023 09:07:24 +0800
Message-ID: <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="000000000000e4d5e405fdf8752d"

--000000000000e4d5e405fdf8752d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano and Julien,

   Could you provide more insights for debugging? I tried to connect to
serial console through ipmitool sol activate and enabled ACPI, I do see
some logs but the machine is still stuck. BMC video screen is still not
responsive and black out.

Thank you  very much for the help!

Best Regards,
Jiatong Shen

On Sun, Jun 11, 2023 at 5:17=E2=80=AFPM Jiatong Shen <yshxxsjt715@gmail.com=
> wrote:

> Hello Stefano and Julien,
>
>    I tried to do some debugging by adding a printk inside the function
> idle_loop in file arm/domain.c. Looks like the idle function is running
> normally because the printk function is getting called without stalling.
> But the vga screen is still blacked out and the serial terminal does not
> display any login message.
>
> the grub config for xen 4.17 is
>
>  submenu 'Xen hypervisor, version 4.17' $menuentry_id_option
> 'xen-hypervisor-4.17-5ebc23af-c2e2-4ac3-b308-3e82ec786c04' {
> menuentry 'Debian GNU/Linux, with Xen 4.17 and Linux 5.10.0-23-arm64'
> --class debian --class gnu-linux --class gnu --class os --class xen
> $menuentry_id_option
> 'xen-gnulinux-5.10.0-23-arm64-advanced-5ebc23af-c2e2-4ac3-b308-3e82ec786c=
04'
> {
> insmod part_gpt
> insmod ext2
> set root=3D'hd0,gpt2'
> if [ x$feature_platform_search_hint =3D xy ]; then
>  search --no-floppy --fs-uuid --set=3Droot
> --hint-ieee1275=3D'ieee1275//sas/disk@20000,gpt2' --hint-bios=3Dhd0,gpt2
> --hint-efi=3Dhd0,gpt2 --hint-baremetal=3Dahci0,gpt2
>  5ebc23af-c2e2-4ac3-b308-3e82ec786c04
> else
>  search --no-floppy --fs-uuid --set=3Droot
> 5ebc23af-c2e2-4ac3-b308-3e82ec786c04
> fi
> echo 'Loading Xen 4.17 ...'
>        if [ "$grub_platform" =3D "pc" -o "$grub_platform" =3D "" ]; then
>            xen_rm_opts=3D
>        else
>            xen_rm_opts=3D"no-real-mode edd=3Doff"
>        fi
> xen_hypervisor /boot/xen-4.17 placeholder   ${xen_rm_opts}
> echo 'Loading Linux 5.10.0-23-arm64 ...'
> xen_module /boot/vmlinuz-5.10.0-23-arm64 placeholder
> root=3DUUID=3D5ebc23af-c2e2-4ac3-b308-3e82ec786c04 ro  quiet
> echo 'Loading initial ramdisk ...'
> xen_module --nounzip   /boot/initrd.img-5.10.0-23-arm64
> }
>
> The code I am modifying is
>
> static void noreturn idle_loop(void)
> {
>     unsigned int cpu =3D smp_processor_id();
>
>     for ( ; ; )
>     {
>         dprintk(XENLOG_INFO, "running idle loop \n");
>         if ( cpu_is_offline(cpu) )
>             stop_cpu();
>         }
> }
> }
>
> Hopes this debugging makes some sense.
>
> Best Regards,
> Jiatong Shen
>
> On Sun, Jun 11, 2023 at 12:00=E2=80=AFPM Jiatong Shen <yshxxsjt715@gmail.=
com>
> wrote:
>
>> Hello Stefano,
>>
>>     I am able to obtain some serial logging (by enabling debugging and
>> verbose debugging messages, hopefully select the right option). The mess=
age
>> looks like
>>
>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch inpu=
t)
>> (XEN) Freed 372kB init memory.
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36
>> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40
>>
>> Could you help find out where it is wrong ? Thank you very much for the
>> help!
>>
>> Best Regards,
>> Jiatong Shen
>>
>>
>> On Sat, Jun 10, 2023 at 7:15=E2=80=AFAM Jiatong Shen <yshxxsjt715@gmail.=
com>
>> wrote:
>>
>>> Hello Julien,
>>>
>>>     Thank you very much for your help!
>>>
>>> Best,
>>>
>>> Jiatong Shen
>>>
>>> On Fri, Jun 9, 2023 at 4:48=E2=80=AFPM Julien Grall <julien@xen.org> wr=
ote:
>>>
>>>> Hello,
>>>>
>>>> On 09/06/2023 03:32, Jiatong Shen wrote:
>>>> > Thank you for your answer. Can you teach me how to verify if acpi is
>>>> > enabled?
>>>>
>>>> You usually look at the .config. But I am not sure if this is provided
>>>> by the Debian package. If not, then your best option would be to build
>>>> your own Xen. To select ACPI, you want to use the menuconfig and selec=
t
>>>> UNSUPPORTED and ACPI.
>>>>
>>>> Cheers,
>>>>
>>>> --
>>>> Julien Grall
>>>>
>>>
>>>
>>> --
>>>
>>> Best Regards,
>>>
>>> Jiatong Shen
>>>
>>
>>
>> --
>>
>> Best Regards,
>>
>> Jiatong Shen
>>
>
>
> --
>
> Best Regards,
>
> Jiatong Shen
>


--=20

Best Regards,

Jiatong Shen

--000000000000e4d5e405fdf8752d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Stefano and Julien,<div><br></div><div>=C2=A0 =C2=A0=
Could you provide more insights for debugging? I tried=C2=A0to connect to s=
erial console through ipmitool sol activate and enabled ACPI, I do see=C2=
=A0</div><div>some logs but the machine is still stuck. BMC video screen is=
 still not responsive and black out.</div><div><br></div><div>Thank you=C2=
=A0 very much for the help!</div><div><br></div><div>Best Regards,</div><di=
v>Jiatong Shen</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, Jun 11, 2023 at 5:17=E2=80=AFPM Jiatong Shen &l=
t;<a href=3D"mailto:yshxxsjt715@gmail.com">yshxxsjt715@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr">Hello Stefano and Julien,<div><br></div><div>=C2=A0 =C2=A0I tried to =
do some debugging by adding a printk inside the function idle_loop in file =
arm/domain.c. Looks like the idle function is running</div><div>normally be=
cause the printk function is getting called without stalling. But the vga s=
creen is still blacked out and the serial terminal does not</div><div>displ=
ay any login message.</div><div><br></div><div>the grub config for xen 4.17=
 is=C2=A0</div><div><br></div><div>=C2=A0submenu &#39;Xen hypervisor, versi=
on 4.17&#39; $menuentry_id_option &#39;xen-hypervisor-4.17-5ebc23af-c2e2-4a=
c3-b308-3e82ec786c04&#39; {<br>		menuentry &#39;Debian GNU/Linux, with Xen =
4.17 and Linux 5.10.0-23-arm64&#39; --class debian --class gnu-linux --clas=
s gnu --class os --class xen $menuentry_id_option &#39;xen-gnulinux-5.10.0-=
23-arm64-advanced-5ebc23af-c2e2-4ac3-b308-3e82ec786c04&#39; {<br>			insmod =
part_gpt<br>			insmod ext2<br>			set root=3D&#39;hd0,gpt2&#39;<br>			if [ x=
$feature_platform_search_hint =3D xy ]; then<br>			 =C2=A0search --no-flopp=
y --fs-uuid --set=3Droot --hint-ieee1275=3D&#39;ieee1275//sas/disk@20000,gp=
t2&#39; --hint-bios=3Dhd0,gpt2 --hint-efi=3Dhd0,gpt2 --hint-baremetal=3Dahc=
i0,gpt2 =C2=A05ebc23af-c2e2-4ac3-b308-3e82ec786c04<br>			else<br>			 =C2=A0=
search --no-floppy --fs-uuid --set=3Droot 5ebc23af-c2e2-4ac3-b308-3e82ec786=
c04<br>			fi<br>			echo	&#39;Loading Xen 4.17 ...&#39;<br>		 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if [ &quot;$grub_platform&quot; =3D &quot;pc&quot; -o &quot;$g=
rub_platform&quot; =3D &quot;&quot; ]; then<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0xen_rm_opts=3D<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>		=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_rm_opts=3D&quot;no-real-mode =
edd=3Doff&quot;<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>			xen_hypervisor	/b=
oot/xen-4.17 placeholder =C2=A0 ${xen_rm_opts}<br>			echo	&#39;Loading Linu=
x 5.10.0-23-arm64 ...&#39;<br>			xen_module	/boot/vmlinuz-5.10.0-23-arm64 p=
laceholder root=3DUUID=3D5ebc23af-c2e2-4ac3-b308-3e82ec786c04 ro =C2=A0quie=
t<br>			echo	&#39;Loading initial ramdisk ...&#39;<br>			xen_module	--nounz=
ip =C2=A0 /boot/initrd.img-5.10.0-23-arm64<br>		}<br></div><div><br></div><=
div>The code I am modifying is=C2=A0</div><div><br></div><div>static void n=
oreturn idle_loop(void)<br>{<br>=C2=A0 =C2=A0 unsigned int cpu =3D smp_proc=
essor_id();<br><br>=C2=A0 =C2=A0 for ( ; ; )<br>=C2=A0 =C2=A0 {<br><span st=
yle=3D"background-color:rgb(255,255,255)"><font color=3D"#ff0000">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 dprintk(XENLOG_INFO, &quot;running idle loop \n&quot;)=
;<br></font></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( cpu_is_offline(cpu) )<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stop_cpu();</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }</div><div>}</div><div>}</div><div><br></div><div>Hop=
es this debugging makes some sense.</div><div><br></div><div>Best Regards,<=
/div><div>Jiatong Shen</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Jun 11, 2023 at 12:00=E2=80=AFPM Jiat=
ong Shen &lt;<a href=3D"mailto:yshxxsjt715@gmail.com" target=3D"_blank">ysh=
xxsjt715@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">Hello Stefano,<div><br></div><div>=C2=A0=
 =C2=A0 I am able to obtain some serial logging (by enabling debugging and =
verbose debugging messages, hopefully select the right option). The message=
 looks like=C2=A0</div><div><br></div><div>(XEN) *** Serial input to DOM0 (=
type &#39;CTRL-a&#39; three times to switch input)<br>(XEN) Freed 372kB ini=
t memory.<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to IC=
ACTIVER4<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICA=
CTIVER8<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER12<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER16<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER20<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER24<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER28<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER32<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER36<br>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICAC=
TIVER40<br></div><div><br></div><div>Could you help find out where it is wr=
ong ? Thank you very much for the help!</div><div><br></div><div>Best Regar=
ds,</div><div>Jiatong Shen</div><div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 10, 2023 at 7:15=
=E2=80=AFAM Jiatong Shen &lt;<a href=3D"mailto:yshxxsjt715@gmail.com" targe=
t=3D"_blank">yshxxsjt715@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello Julien,</div>=
<div><br></div>=C2=A0 =C2=A0 Thank you very much for your help!<br><div><br=
></div><div>Best,</div><div><br></div><div>Jiatong Shen</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9,=
 2023 at 4:48=E2=80=AFPM Julien Grall &lt;<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 09/06/2023 03:32, Jiatong Shen wrote:<br>
&gt; Thank you for your answer. Can you teach me how to verify if acpi is<b=
r>
&gt; enabled?<br>
<br>
You usually look at the .config. But I am not sure if this is provided <br>
by the Debian package. If not, then your best option would be to build <br>
your own Xen. To select ACPI, you want to use the menuconfig and select <br=
>
UNSUPPORTED and ACPI.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><br><div>Best Regards,</div><div><br></div><div>Jiatong Shen=
</div></div></div>

--000000000000e4d5e405fdf8752d--

