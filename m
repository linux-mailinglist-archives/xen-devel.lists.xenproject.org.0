Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B772B11A
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jun 2023 11:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546715.853744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8HCj-00072H-5Y; Sun, 11 Jun 2023 09:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546715.853744; Sun, 11 Jun 2023 09:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8HCj-0006zV-0f; Sun, 11 Jun 2023 09:17:45 +0000
Received: by outflank-mailman (input) for mailman id 546715;
 Sun, 11 Jun 2023 09:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxjL=B7=gmail.com=yshxxsjt715@srs-se1.protection.inumbo.net>)
 id 1q8HCh-0006zK-7A
 for xen-devel@lists.xenproject.org; Sun, 11 Jun 2023 09:17:43 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0310c7e-0838-11ee-b232-6b7b168915f2;
 Sun, 11 Jun 2023 11:17:40 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-559409cc490so2179351eaf.3; 
 Sun, 11 Jun 2023 02:17:40 -0700 (PDT)
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
X-Inumbo-ID: d0310c7e-0838-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686475059; x=1689067059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmSPl/kaXaXB4tdb31L+AkRMB57ivEv/BcmsHj+zfgw=;
        b=luAkUYBGDWtzfs2536c8lK1G6wxl7L8mzK8OKK448DXTIKks+6sRuDN7gRK9e+p1B/
         ND2Uznz7ME75+ZtAsmmipBkxcinFxYz4kNcsLtyvu8AqJm4CUXcFo3540YPvENGqrFkB
         tzJ9+CI5OQJOsLX0TDPzBBIycaDOUx4J0ckRdaNCZoxINTvLa6wWC1WQj/qXdpkEJlDy
         o2Z979zQkbL9Yh6Mf/AW9g4J21rMzz+nRPwc3Y0r5rFroSlqI5XyR9njCs9xhk/ze7jp
         y6ykqbr5MhcM70nkZ7hwnvuzkzterEq5hEf/erNDnbIXo7hUQVNUFFOmxYPYthpaz4MD
         QNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686475059; x=1689067059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmSPl/kaXaXB4tdb31L+AkRMB57ivEv/BcmsHj+zfgw=;
        b=EKA6C/ThwV0Hc4p966CzmHWtX6yLJqg3GSzoxmLmGTazEC4jugNH1Fi9Zmsxw/fsgT
         ArcRQx3Bu5Tkgoe3pYSNOAKcvtVAlI0rYmSPQoYjGUkHkr4f8aWiwWv6guBCd+QQDRpD
         RMo4Yxk6OCiJmBNrlgfN51z+bGdNzOzyDNECd0p5s+au1lSZDRdkc0FpPXxHnEJztPGh
         4TKfQtD9b+tRWgoXPJRxbSanPIehP3m1jVw7VNvAdMTcmp2SDmqXm+QEyIGhXbEWUI3P
         gMW9WaOsxRCMgkEdMBiCODer7ZoGidnjjUwhQ8Nq9LBmvusB5PbdrgPZMHKS4iR8GSfR
         CM3Q==
X-Gm-Message-State: AC+VfDyh9XS0OK/q9QInZYldBNNhGtvIjIFcTPnvSKFXzT3owSVoAi6B
	qh1XWOqqXYzXx1OTCDCmqIuuCdFD5j1bwOxOGxo=
X-Google-Smtp-Source: ACHHUZ7krIHL3ojyo+MWFKI8+bRbqG6X0thvy6SUuicHQxYavj48sGBVtdm/jOvUYqY8gj2IQn1LzPjSoeSQVJ0LRwg=
X-Received: by 2002:a05:6358:5150:b0:12b:ea6b:8010 with SMTP id
 16-20020a056358515000b0012bea6b8010mr80331rwj.24.1686475059040; Sun, 11 Jun
 2023 02:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org> <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org> <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
In-Reply-To: <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Sun, 11 Jun 2023 17:17:27 +0800
Message-ID: <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Content-Type: multipart/mixed; boundary="000000000000d1987205fdd71298"

--000000000000d1987205fdd71298
Content-Type: multipart/alternative; boundary="000000000000d1987005fdd71296"

--000000000000d1987005fdd71296
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano and Julien,

   I tried to do some debugging by adding a printk inside the function
idle_loop in file arm/domain.c. Looks like the idle function is running
normally because the printk function is getting called without stalling.
But the vga screen is still blacked out and the serial terminal does not
display any login message.

the grub config for xen 4.17 is

 submenu 'Xen hypervisor, version 4.17' $menuentry_id_option
'xen-hypervisor-4.17-5ebc23af-c2e2-4ac3-b308-3e82ec786c04' {
menuentry 'Debian GNU/Linux, with Xen 4.17 and Linux 5.10.0-23-arm64'
--class debian --class gnu-linux --class gnu --class os --class xen
$menuentry_id_option
'xen-gnulinux-5.10.0-23-arm64-advanced-5ebc23af-c2e2-4ac3-b308-3e82ec786c04=
'
{
insmod part_gpt
insmod ext2
set root=3D'hd0,gpt2'
if [ x$feature_platform_search_hint =3D xy ]; then
 search --no-floppy --fs-uuid --set=3Droot
--hint-ieee1275=3D'ieee1275//sas/disk@20000,gpt2' --hint-bios=3Dhd0,gpt2
--hint-efi=3Dhd0,gpt2 --hint-baremetal=3Dahci0,gpt2
 5ebc23af-c2e2-4ac3-b308-3e82ec786c04
else
 search --no-floppy --fs-uuid --set=3Droot
5ebc23af-c2e2-4ac3-b308-3e82ec786c04
fi
echo 'Loading Xen 4.17 ...'
       if [ "$grub_platform" =3D "pc" -o "$grub_platform" =3D "" ]; then
           xen_rm_opts=3D
       else
           xen_rm_opts=3D"no-real-mode edd=3Doff"
       fi
xen_hypervisor /boot/xen-4.17 placeholder   ${xen_rm_opts}
echo 'Loading Linux 5.10.0-23-arm64 ...'
xen_module /boot/vmlinuz-5.10.0-23-arm64 placeholder
root=3DUUID=3D5ebc23af-c2e2-4ac3-b308-3e82ec786c04 ro  quiet
echo 'Loading initial ramdisk ...'
xen_module --nounzip   /boot/initrd.img-5.10.0-23-arm64
}

The code I am modifying is

static void noreturn idle_loop(void)
{
    unsigned int cpu =3D smp_processor_id();

    for ( ; ; )
    {
        dprintk(XENLOG_INFO, "running idle loop \n");
        if ( cpu_is_offline(cpu) )
            stop_cpu();
        }
}
}

Hopes this debugging makes some sense.

Best Regards,
Jiatong Shen

On Sun, Jun 11, 2023 at 12:00=E2=80=AFPM Jiatong Shen <yshxxsjt715@gmail.co=
m> wrote:

> Hello Stefano,
>
>     I am able to obtain some serial logging (by enabling debugging and
> verbose debugging messages, hopefully select the right option). The messa=
ge
> looks like
>
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input=
)
> (XEN) Freed 372kB init memory.
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40
>
> Could you help find out where it is wrong ? Thank you very much for the
> help!
>
> Best Regards,
> Jiatong Shen
>
>
> On Sat, Jun 10, 2023 at 7:15=E2=80=AFAM Jiatong Shen <yshxxsjt715@gmail.c=
om>
> wrote:
>
>> Hello Julien,
>>
>>     Thank you very much for your help!
>>
>> Best,
>>
>> Jiatong Shen
>>
>> On Fri, Jun 9, 2023 at 4:48=E2=80=AFPM Julien Grall <julien@xen.org> wro=
te:
>>
>>> Hello,
>>>
>>> On 09/06/2023 03:32, Jiatong Shen wrote:
>>> > Thank you for your answer. Can you teach me how to verify if acpi is
>>> > enabled?
>>>
>>> You usually look at the .config. But I am not sure if this is provided
>>> by the Debian package. If not, then your best option would be to build
>>> your own Xen. To select ACPI, you want to use the menuconfig and select
>>> UNSUPPORTED and ACPI.
>>>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
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

--000000000000d1987005fdd71296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Stefano and Julien,<div><br></div><div>=C2=A0 =C2=A0=
I tried to do some debugging by adding a printk inside the function idle_lo=
op in file arm/domain.c. Looks like the idle function is running</div><div>=
normally because the printk function is getting called without stalling. Bu=
t the vga screen is still blacked out and the serial terminal does not</div=
><div>display any login message.</div><div><br></div><div>the grub config f=
or xen 4.17 is=C2=A0</div><div><br></div><div>=C2=A0submenu &#39;Xen hyperv=
isor, version 4.17&#39; $menuentry_id_option &#39;xen-hypervisor-4.17-5ebc2=
3af-c2e2-4ac3-b308-3e82ec786c04&#39; {<br>		menuentry &#39;Debian GNU/Linux=
, with Xen 4.17 and Linux 5.10.0-23-arm64&#39; --class debian --class gnu-l=
inux --class gnu --class os --class xen $menuentry_id_option &#39;xen-gnuli=
nux-5.10.0-23-arm64-advanced-5ebc23af-c2e2-4ac3-b308-3e82ec786c04&#39; {<br=
>			insmod part_gpt<br>			insmod ext2<br>			set root=3D&#39;hd0,gpt2&#39;<b=
r>			if [ x$feature_platform_search_hint =3D xy ]; then<br>			 =C2=A0search=
 --no-floppy --fs-uuid --set=3Droot --hint-ieee1275=3D&#39;ieee1275//sas/di=
sk@20000,gpt2&#39; --hint-bios=3Dhd0,gpt2 --hint-efi=3Dhd0,gpt2 --hint-bare=
metal=3Dahci0,gpt2 =C2=A05ebc23af-c2e2-4ac3-b308-3e82ec786c04<br>			else<br=
>			 =C2=A0search --no-floppy --fs-uuid --set=3Droot 5ebc23af-c2e2-4ac3-b30=
8-3e82ec786c04<br>			fi<br>			echo	&#39;Loading Xen 4.17 ...&#39;<br>		 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$grub_platform&quot; =3D &quot;pc&quot; =
-o &quot;$grub_platform&quot; =3D &quot;&quot; ]; then<br>		 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0xen_rm_opts=3D<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
else<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_rm_opts=3D&quot;no-=
real-mode edd=3Doff&quot;<br>		 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>			xen_hyp=
ervisor	/boot/xen-4.17 placeholder =C2=A0 ${xen_rm_opts}<br>			echo	&#39;Lo=
ading Linux 5.10.0-23-arm64 ...&#39;<br>			xen_module	/boot/vmlinuz-5.10.0-=
23-arm64 placeholder root=3DUUID=3D5ebc23af-c2e2-4ac3-b308-3e82ec786c04 ro =
=C2=A0quiet<br>			echo	&#39;Loading initial ramdisk ...&#39;<br>			xen_modu=
le	--nounzip =C2=A0 /boot/initrd.img-5.10.0-23-arm64<br>		}<br></div><div><=
br></div><div>The code I am modifying is=C2=A0</div><div><br></div><div>sta=
tic void noreturn idle_loop(void)<br>{<br>=C2=A0 =C2=A0 unsigned int cpu =
=3D smp_processor_id();<br><br>=C2=A0 =C2=A0 for ( ; ; )<br>=C2=A0 =C2=A0 {=
<br><span style=3D"background-color:rgb(255,255,255)"><font color=3D"#ff000=
0">=C2=A0 =C2=A0 =C2=A0 =C2=A0 dprintk(XENLOG_INFO, &quot;running idle loop=
 \n&quot;);<br></font></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( cpu_is_offlin=
e(cpu) )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stop_cpu();</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div>}</div><div>}</div><div><br></div>=
<div>Hopes this debugging makes some sense.</div><div><br></div><div>Best R=
egards,</div><div>Jiatong Shen</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 11, 2023 at 12:00=E2=80=AFP=
M Jiatong Shen &lt;<a href=3D"mailto:yshxxsjt715@gmail.com">yshxxsjt715@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Hello Stefano,<div><br></div><div>=C2=A0 =C2=A0 I am=
 able to obtain some serial logging (by enabling debugging and verbose debu=
gging messages, hopefully select the right option). The message looks like=
=C2=A0</div><div><br></div><div>(XEN) *** Serial input to DOM0 (type &#39;C=
TRL-a&#39; three times to switch input)<br>(XEN) Freed 372kB init memory.<b=
r>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4<br=
>(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36<br>=
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40<br>=
</div><div><br></div><div>Could you help find out where it is wrong ? Thank=
 you very much for the help!</div><div><br></div><div>Best Regards,</div><d=
iv>Jiatong Shen</div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 10, 2023 at 7:15=E2=80=AFAM=
 Jiatong Shen &lt;<a href=3D"mailto:yshxxsjt715@gmail.com" target=3D"_blank=
">yshxxsjt715@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div>Hello Julien,</div><div><br></=
div>=C2=A0 =C2=A0 Thank you very much for your help!<br><div><br></div><div=
>Best,</div><div><br></div><div>Jiatong Shen</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9, 2023 at 4:=
48=E2=80=AFPM Julien Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"=
_blank">julien@xen.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello,<br>
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

--000000000000d1987005fdd71296--
--000000000000d1987205fdd71298
Content-Type: application/xml; name="xen-4.17.0.config"
Content-Disposition: attachment; filename="xen-4.17.0.config"
Content-Transfer-Encoding: base64
Content-ID: <f_lir7migf0>
X-Attachment-Id: f_lir7migf0

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIFhlbi9hcm0g
NC4xNy4wIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfQ0NfSVNfR0NDPXkKQ09ORklHX0dDQ19WRVJT
SU9OPTEwMDIwMQpDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19MRF9JU19HTlU9eQpDT05G
SUdfQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFPXkKQ09ORklHX0FSTV82ND15CkNPTkZJR19B
Uk09eQpDT05GSUdfQVJDSF9ERUZDT05GSUc9ImFyY2gvYXJtL2NvbmZpZ3MvYXJtNjRfZGVmY29u
ZmlnIgoKIwojIEFyY2hpdGVjdHVyZSBGZWF0dXJlcwojCkNPTkZJR182NEJJVD15CkNPTkZJR19O
Ul9DUFVTPTEyOApDT05GSUdfQUNQST15CkNPTkZJR19BUk1fRUZJPXkKQ09ORklHX0dJQ1YzPXkK
IyBDT05GSUdfSEFTX0lUUyBpcyBub3Qgc2V0CkNPTkZJR19IVk09eQojIENPTkZJR19ORVdfVkdJ
QyBpcyBub3Qgc2V0CkNPTkZJR19TQlNBX1ZVQVJUX0NPTlNPTEU9eQpDT05GSUdfQVJNX1NTQkQ9
eQpDT05GSUdfSEFSREVOX0JSQU5DSF9QUkVESUNUT1I9eQojIENPTkZJR19URUUgaXMgbm90IHNl
dAojIGVuZCBvZiBBcmNoaXRlY3R1cmUgRmVhdHVyZXMKCiMKIyBBUk0gZXJyYXRhIHdvcmthcm91
bmQgdmlhIHRoZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsKIwpDT05GSUdfQVJNNjRfRVJSQVRVTV84
MjczMTk9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MjQwNjk9eQpDT05GSUdfQVJNNjRfRVJSQVRV
TV84MTk0NzI9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84NDM0MTk9eQpDT05GSUdfQVJNNjRfRVJS
QVRVTV84MzIwNzU9eQpDT05GSUdfQVJNNjRfRVJSQVRVTV84MzQyMjA9eQpDT05GSUdfQVJNX0VS
UkFUVU1fODU4OTIxPXkKQ09ORklHX0FSTTY0X1dPUktBUk9VTkRfUkVQRUFUX1RMQkk9eQpDT05G
SUdfQVJNNjRfRVJSQVRVTV8xMjg2ODA3PXkKIyBlbmQgb2YgQVJNIGVycmF0YSB3b3JrYXJvdW5k
IHZpYSB0aGUgYWx0ZXJuYXRpdmUgZnJhbWV3b3JrCgpDT05GSUdfQVJNNjRfSEFSREVOX0JSQU5D
SF9QUkVESUNUT1I9eQpDT05GSUdfQUxMX1BMQVQ9eQojIENPTkZJR19RRU1VIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkNBUjMgaXMgbm90IHNldAojIENPTkZJR19NUFNPQyBpcyBub3Qgc2V0CiMgQ09O
RklHX05PX1BMQVQgaXMgbm90IHNldApDT05GSUdfQUxMNjRfUExBVD15CkNPTkZJR19NUFNPQ19Q
TEFURk9STT15CgojCiMgQ29tbW9uIEZlYXR1cmVzCiMKQ09ORklHX0dSQU5UX1RBQkxFPXkKQ09O
RklHX0hBU19BTFRFUk5BVElWRT15CkNPTkZJR19IQVNfREVWSUNFX1RSRUU9eQpDT05GSUdfSEFT
X0ZBU1RfTVVMVElQTFk9eQpDT05GSUdfSEFTX1BEWD15CkNPTkZJR19IQVNfUE1BUD15CkNPTkZJ
R19NRU1fQUNDRVNTPXkKIyBDT05GSUdfU1RBVElDX01FTU9SWSBpcyBub3Qgc2V0CgojCiMgU3Bl
Y3VsYXRpdmUgaGFyZGVuaW5nCiMKQ09ORklHX1NQRUNVTEFUSVZFX0hBUkRFTl9BUlJBWT15CiMg
ZW5kIG9mIFNwZWN1bGF0aXZlIGhhcmRlbmluZwoKIyBDT05GSUdfSFlQRlMgaXMgbm90IHNldAoj
IENPTkZJR19JT1JFUV9TRVJWRVIgaXMgbm90IHNldAojIENPTkZJR19FRklfU0VUX1ZJUlRVQUxf
QUREUkVTU19NQVAgaXMgbm90IHNldAojIENPTkZJR19YU00gaXMgbm90IHNldAojIENPTkZJR19B
UkdPIGlzIG5vdCBzZXQKCiMKIyBTY2hlZHVsZXJzCiMKQ09ORklHX1NDSEVEX0NSRURJVD15CkNP
TkZJR19TQ0hFRF9DUkVESVQyPXkKIyBDT05GSUdfU0NIRURfUlREUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDSEVEX0FSSU5DNjUzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfTlVMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDSEVEX0NSRURJVF9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVE
X0NSRURJVDJfREVGQVVMVD15CkNPTkZJR19TQ0hFRF9ERUZBVUxUPSJjcmVkaXQyIgojIGVuZCBv
ZiBTY2hlZHVsZXJzCgojIENPTkZJR19CT09UX1RJTUVfQ1BVUE9PTFMgaXMgbm90IHNldAojIENP
TkZJR19MSVZFUEFUQ0ggaXMgbm90IHNldAojIENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyBp
cyBub3Qgc2V0CkNPTkZJR19DTURMSU5FPSIiCkNPTkZJR19ET00wX01FTT0iIgpDT05GSUdfRFRC
X0ZJTEU9IiIKQ09ORklHX1RSQUNFQlVGRkVSPXkKIyBlbmQgb2YgQ29tbW9uIEZlYXR1cmVzCgoj
CiMgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfSEFTX05TMTY1NTA9eQpDT05GSUdfSEFTX0NBREVO
Q0VfVUFSVD15CkNPTkZJR19IQVNfSU1YX0xQVUFSVD15CkNPTkZJR19IQVNfTVZFQlU9eQpDT05G
SUdfSEFTX01FU09OPXkKQ09ORklHX0hBU19QTDAxMT15CkNPTkZJR19IQVNfU0NJRj15CkNPTkZJ
R19TRVJJQUxfVFhfQlVGU0laRT0xNjM4NApDT05GSUdfSEFTX1BBU1NUSFJPVUdIPXkKQ09ORklH
X0FSTV9TTU1VPXkKIyBDT05GSUdfSVBNTVVfVk1TQSBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9G
T1JDRV9QVF9TSEFSRT15CiMgZW5kIG9mIERldmljZSBEcml2ZXJzCgpDT05GSUdfRVhQRVJUPXkK
Q09ORklHX1VOU1VQUE9SVEVEPXkKCiMKIyBEZWJ1Z2dpbmcgT3B0aW9ucwojCkNPTkZJR19ERUJV
Rz15CkNPTkZJR19ERUJVR19JTkZPPXkKIyBDT05GSUdfRlJBTUVfUE9JTlRFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NPVkVSQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxF
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTE9DS1MgaXMgbm90IHNldAojIENPTkZJR19QRVJG
X0NPVU5URVJTIGlzIG5vdCBzZXQKQ09ORklHX1ZFUkJPU0VfREVCVUc9eQpDT05GSUdfREVWSUNF
X1RSRUVfREVCVUc9eQojIENPTkZJR19TQ1JVQl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1RSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiBpcyBub3Qgc2V0
CiMgZW5kIG9mIERlYnVnZ2luZyBPcHRpb25zCg==
--000000000000d1987205fdd71298--

