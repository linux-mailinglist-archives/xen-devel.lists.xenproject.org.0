Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8485AA9D6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397474.638071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1vx-00072m-II; Fri, 02 Sep 2022 08:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397474.638071; Fri, 02 Sep 2022 08:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1vx-0006zW-EL; Fri, 02 Sep 2022 08:21:49 +0000
Received: by outflank-mailman (input) for mailman id 397474;
 Fri, 02 Sep 2022 08:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rShR=ZF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oU1vv-0006e3-8z
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:21:47 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 476cd04a-2a98-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 10:21:46 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso4856201pjk.0; 
 Fri, 02 Sep 2022 01:21:44 -0700 (PDT)
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
X-Inumbo-ID: 476cd04a-2a98-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=h9T3pk4GTDCw9FXAZGEOSHbembkbx8obAhaOxGlfp6I=;
        b=LITsmZNARCXxFT4TbsvrTZmZTdp4WSHLEKoV5Drd17BqN7uO/w+uHRHQTD7nJXcmEB
         aX0k7TkTeeJxmg86oOFmdUcOUPoSoHiraXoel/yfW9krFxUc4aQCD67SEqH7qIk3PSMY
         +4nNO4QNsmf7Tmv/iG+T/tof3Fw+qpuJ8gn5OkGgj2/MP5cIJZrTTvMUmAUtxy+wljxj
         ob8lpzmu1yBrJbSGHmlW/wH0Fj+cZTH61Bv8psBBsHzsiq6luu6MY9hI/m8oZtrHMfv0
         Vwf8fHSWH3er0lPPrxLD9kU9SblD7EsqMzjvoTJ+jBpYAZgVnGkHHTnTYpMt1NgHMHO7
         Q7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=h9T3pk4GTDCw9FXAZGEOSHbembkbx8obAhaOxGlfp6I=;
        b=XC7oRbYunsbvSs/lEl7FIh3aTTq/WC4RuvwaFXCbonIIiN0SkNQSjwnzryeS83I8LE
         L8yZUal3tSi574ZD13PAH/1kkljzoFS4Etpwp19OQvXJcdUyWTqJ3WGJ9/9VGmVIx2cZ
         G4k0K+SqEbAx4Arv/NI4ZCXy4++EdFjA1gWIpj3Go6N3Vp+Cu4MeuLIRIBob6ywjiLZB
         eqO6Jz08xM4WJFBV4IwmRzlqPRAPrpMI82UAy5xjnoH94y/xvp0/qcRpJVK8MBN9VV6W
         wK1Px+gU3pSFjzHZwuZ317gOrq+yodKj9UIJfSM94baGPFZCscRXssTwHOaHt+dk6rvW
         ropg==
X-Gm-Message-State: ACgBeo0fS/IocJU8k7zX4LJfs/vr1CNof/r4vV8CzMYzX/d3uSi5JLxS
	Hw5TByrDCiw3oUTO+3t1VMYUEoyLYfNv/I1N1Ps=
X-Google-Smtp-Source: AA6agR5O36MIo0q4j/q9AJUj5ZyoVfCiBnac2fcRNhe7gTmFlsB/mU3nDzR4IAEHGxpzvwn8dKTbobrJCXZS7uM530k=
X-Received: by 2002:a17:902:e80e:b0:16f:14ea:897b with SMTP id
 u14-20020a170902e80e00b0016f14ea897bmr33803088plg.6.1662106903328; Fri, 02
 Sep 2022 01:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB42978C6A0680DD661E24D1E59F7B9@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB42978C6A0680DD661E24D1E59F7B9@DM6PR12MB4297.namprd12.prod.outlook.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 2 Sep 2022 11:21:31 +0300
Message-ID: <CAPD2p-kmXvKOV8BH_NqJsZkiAcM8QbasXEdgnYGSKNQd41k0Sw@mail.gmail.com>
Subject: Re: Enable audio virtualization in Xen
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
Cc: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, 
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, 
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000008d3af905e7ad6b84"

--0000000000008d3af905e7ad6b84
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 11:58 AM SHARMA, JYOTIRMOY <JYOTIRMOY.SHARMA@amd.com>
wrote:

> [AMD Official Use Only - General]
>
> Hi all,
>

Hello Jyotirmoy.

[sorry for the possible format issues]



>
>
> Forgot to mention that I am able to play audio from HVM guest with Pulse
> Audio as back end.
>


good.



> Here is the corresponding HVM configuration:
>
>
>
> vsnd = [[ 'card, backend=Domain-0, buffer-size=65536, short-name=VCard,
> long-name=Virtual sound card, sample-rates=44100, sample-formats=s16_le',
> 'pcm, name=dev1', 'stream, unique-id=pulse, type=P' ]]
>
>
>
> I have used xen front end and snd_be (along with libxenbe) as back end as
> suggested by Christopher earlier in this thread.
>
>
>
> Only when I change unique-id=alsa, audio is not working from HVM guest.
>
>
>
> If anyone has tried ALSA back end (instead of PA), please let me know what
> I am missing.
>


We use snd_be over pulse and it works fine. I am not too familiar with all
that sound's internals. But I would suggest looking at the following thread
where Oleksandr Grytsov (the author of the snd_be) mentioned the need of HW
parameters matching for alsa [1].

I made an experiment with alsa (however I am not 100% sure whether it is
correct), nevertheless details are below.

I changed guest config to use alsa:
vsnd = [[ 'card, backend=DomD, buffer-size=65536, short-name=VCard,
long-name=Virtual sound card,
sample-rates=8000;11025;16000;22050;32000;44100;48000,
sample-formats=s16_le',
     'pcm, name=dev1', 'stream, unique-id=alsa, type=P'
    ]]

And checked that snd_be started using alsa:
03.07.22 03:37:17.185 | SndFrontend  | DBG - Parse stream id: alsa
03.07.22 03:37:17.186 | SndFrontend  | DBG - Create pcm device, type: ALSA,
device: , propName: , propValue:
...

With that command running in DomU I heard the audio in headphones:
root@salvator-x-h3-4x2g-xt-domu:~# cat /dev/urandom | aplay -f S16_LE -c 2
-D hw:0,0
Playing raw data 'stdin' : Signed 16 bit Little Endian, Rate 8000 Hz, Stereo

This is the output of "aplay -l" in both domains just in case:
root@salvator-x-h3-4x2g-xt-domd:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: rcarsound [rcar-sound], device 0: rsnd-dai.0-ak4613-hifi
ak4613-hifi-0 []
 Subdevices: 0/1
 Subdevice #0: subdevice #0
root@salvator-x-h3-4x2g-xt-domu:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: vsnd [], device 0: dev1 [Virtual card PCM]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

Please check your HW params as suggested at [1].
[1]
https://lore.kernel.org/xen-devel/CACvf2oW7gHCLdkqYi8w1s7-FBuX8zcAwAnfZa07XhVg-ioaXaQ@mail.gmail.com/



>
>
> Regards,
>
> Jyotirmoy
>
>
>


-- 
Regards,

Oleksandr Tyshchenko

--0000000000008d3af905e7ad6b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 1, 2022 at 11:58 AM SHARM=
A, JYOTIRMOY &lt;<a href=3D"mailto:JYOTIRMOY.SHARMA@amd.com" target=3D"_bla=
nk">JYOTIRMOY.SHARMA@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div>





<div lang=3D"EN-US">
<p align=3D"Left" style=3D"margin:0px"><span style=3D"font-size:10pt;font-f=
amily:Arial;color:rgb(0,0,255)">[AMD Official Use Only - General]</span></p=
>
<br>
<div>
<p class=3D"MsoNormal">Hi all,</p></div></div></div></blockquote><div><br><=
/div><div>Hello=C2=A0Jyotirmoy.</div><div><br></div><div>[sorry for the pos=
sible format issues]</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div lang=3D"EN-US"><div><p class=3D"=
MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Forgot to mention that I am able to play audio from =
HVM guest with Pulse Audio as back end.</p></div></div></div></blockquote><=
div>=C2=A0</div><div><br></div><div>good.</div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div lang=3D"EN-=
US"><div><p class=3D"MsoNormal">Here is the corresponding HVM configuration=
:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">vsnd =3D [[ &#39;card, backend=3DDomain-0, buffer-si=
ze=3D65536, short-name=3DVCard, long-name=3DVirtual sound card, sample-rate=
s=3D44100, sample-formats=3Ds16_le&#39;, &#39;pcm, name=3Ddev1&#39;, &#39;s=
tream, unique-id=3Dpulse, type=3DP&#39; ]]<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I have used xen front end and snd_be (along with lib=
xenbe) as back end as suggested by Christopher earlier in this thread.<u></=
u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Only when I change unique-id=3Dalsa, audio is not wo=
rking from HVM guest.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If anyone has tried ALSA back end (instead of PA), p=
lease let me know what I am missing.</p></div></div></div></blockquote><div=
>=C2=A0</div><div><br></div><div>We use snd_be over pulse and it works fine=
. I am not too familiar with all that sound&#39;s internals. But I would su=
ggest looking at the following thread where Oleksandr Grytsov (the author o=
f the snd_be) mentioned the need of HW parameters matching for alsa [1].</d=
iv><div><br>I made an experiment with alsa (however I am not 100% sure whet=
her it is correct), nevertheless details are below.</div><div><br>I changed=
 guest config to use alsa:<br>vsnd =3D [[ &#39;card, backend=3DDomD, buffer=
-size=3D65536, short-name=3DVCard, long-name=3DVirtual sound card, sample-r=
ates=3D8000;11025;16000;22050;32000;44100;48000, sample-formats=3Ds16_le&#3=
9;,<br>=C2=A0 =C2=A0 =C2=A0&#39;pcm, name=3Ddev1&#39;, &#39;stream, unique-=
id=3Dalsa, type=3DP&#39;<br>=C2=A0 =C2=A0 ]]</div><div><br>And checked that=
 snd_be started using alsa:<br>03.07.22 03:37:17.185 | SndFrontend =C2=A0| =
DBG - Parse stream id: alsa<br>03.07.22 03:37:17.186 | SndFrontend =C2=A0| =
DBG - Create pcm device, type: ALSA, device: , propName: , propValue:<br>..=
.</div><div><br>With that command running in DomU I heard the audio in head=
phones:<br>root@salvator-x-h3-4x2g-xt-domu:~# cat /dev/urandom | aplay -f S=
16_LE -c 2 -D hw:0,0<br>Playing raw data &#39;stdin&#39; : Signed 16 bit Li=
ttle Endian, Rate 8000 Hz, Stereo</div><div><br>This is the output of &quot=
;aplay -l&quot; in both domains just in case:<br>root@salvator-x-h3-4x2g-xt=
-domd:~# aplay -l<br>**** List of PLAYBACK Hardware Devices ****<br>card 0:=
 rcarsound [rcar-sound], device 0: rsnd-dai.0-ak4613-hifi ak4613-hifi-0 []<=
br>=C2=A0Subdevices: 0/1<br>=C2=A0Subdevice #0: subdevice #0</div><div>root=
@salvator-x-h3-4x2g-xt-domu:~# aplay -l<br>**** List of PLAYBACK Hardware D=
evices ****<br>card 0: vsnd [], device 0: dev1 [Virtual card PCM]<br>=C2=A0=
 Subdevices: 1/1<br>=C2=A0 Subdevice #0: subdevice #0</div><div><br>Please =
check your HW params as suggested at [1].<br>[1] <a href=3D"https://lore.ke=
rnel.org/xen-devel/CACvf2oW7gHCLdkqYi8w1s7-FBuX8zcAwAnfZa07XhVg-ioaXaQ@mail=
.gmail.com/">https://lore.kernel.org/xen-devel/CACvf2oW7gHCLdkqYi8w1s7-FBuX=
8zcAwAnfZa07XhVg-ioaXaQ@mail.gmail.com/</a><br></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div lan=
g=3D"EN-US"><div><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Jyotirmoy<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span=
 style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><span style=
=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font=
></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=
=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenk=
o</font></span></div></div></div></div></div></div></div></div>

--0000000000008d3af905e7ad6b84--

