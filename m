Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB26EA574
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 10:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524502.815494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplh8-0007lq-MC; Fri, 21 Apr 2023 08:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524502.815494; Fri, 21 Apr 2023 08:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplh8-0007jG-Hb; Fri, 21 Apr 2023 08:00:38 +0000
Received: by outflank-mailman (input) for mailman id 524502;
 Fri, 21 Apr 2023 08:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vNOs=AM=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pplh7-0007jA-MX
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 08:00:37 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b46450-e01a-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 10:00:36 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a686260adcso21610425ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 01:00:36 -0700 (PDT)
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
X-Inumbo-ID: 98b46450-e01a-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682064035; x=1684656035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bhQ3hOXOzC3JH2/73Y1/JWO8cHUiW9FljkTD3H4Mg2E=;
        b=DJpyup/j5MvnbBWSHmAUd74i15QkPld8cSy1W/2SqJAn7A7SQR/CXpBQnPIbKJTzOq
         lk70ROaT8EX+yvy9XAnue+IxFIDvu5mdc6R6rtNfQSBfq92WbuuOWgbtVM7Q/alK5vDc
         2pdSNX6336fYe9zzvWrjxjXa2iSnADDRwgjja7hlrq5IibCtIFZDaFuqJb0/W0/k4pjR
         Na7S7Hhnj8BCGC7CaIkpYi7y4vyaE0qHd9ep2VusjUwqF5idKT072+D0/z1tJccrQ0sH
         bF+VvAbdVlv1ZkV/7JXMZr18ligmdGv3Kik19eX6WkbLu07sdsGr6KQ8CoxF1b3sFq3b
         mNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682064035; x=1684656035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhQ3hOXOzC3JH2/73Y1/JWO8cHUiW9FljkTD3H4Mg2E=;
        b=g5LDrYvRsI+6KgkXCjDAsQ8tiNF/2ynp+k1doSj7M8zT15v48jG7EK6egZPH8fvhRP
         Dhov763G/wtwFIccfDNjXj5sPBTc5Ff/HLmtgM5QZRtGYsZzqTYCSaKI0Ib2J0Hz/cHY
         QRjAjckC/7ITqbeW9o53qqFxR6v9ncur0P/+y4jvK0SJTpCV9XdNV3XIQBwqryXYkie3
         QRbn+2SnRO5epNo6klosJlMq+1uv8tPYEDXNt3S1hTxSupv+usmynFGoJVHcBC0oDXBQ
         1kr/09HYL5Va1V4JGsxOVBImfx7g/qjiFpwZgHp8UXHP0Mxt3aTukWeDtYCfS8Ubjq2e
         x63w==
X-Gm-Message-State: AAQBX9cfrFUjORwyUAiIqnQFe6aW9lktF85o9sWN2C5zCDvv73DDkIZ5
	+dDSk9DTj0zf2sT0UGPiet2rFXmEoMzrIqtkxxA=
X-Google-Smtp-Source: AKy350aoP73b9DBz1Po3a40hRYUWBMViuIVW1bNK3/W4JO2UQS0rpl1GKiE0xk0qDMQS74uSnuCJlmSYpM2qBELY1Mk=
X-Received: by 2002:a17:902:fb0b:b0:1a6:9363:1632 with SMTP id
 le11-20020a170902fb0b00b001a693631632mr3240112plb.25.1682064034595; Fri, 21
 Apr 2023 01:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com> <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
In-Reply-To: <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Fri, 21 Apr 2023 11:04:54 +0300
Message-ID: <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Content-Type: multipart/alternative; boundary="00000000000045862f05f9d40d35"

--00000000000045862f05f9d40d35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michal,

Yes, I use yocto.

Yesterday all day long I tried to follow your suggestions.
I faced a problem.
Manually in the xen config build file I pasted the strings:

CONFIG_EARLY_PRINTK
CONFIG_EARLY_PRINTK_ZYNQMP
CONFIG_EARLY_UART_CHOICE_CADENCE

Host hangs in build time.
Maybe I did not set something in the config build file ?

Regards,
Oleg

=D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:57, Ole=
g Nikitenko <oleshiiwood@gmail.com>:

> Thanks Michal,
>
> You gave me an idea.
> I am going to try it today.
>
> Regards,
> O.
>
> =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:56, O=
leg Nikitenko <oleshiiwood@gmail.com>:
>
>> Thanks Stefano.
>>
>> I am going to do it today.
>>
>> Regards,
>> O.
>>
>> =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:05, =
Stefano Stabellini <sstabellini@kernel.org>:
>>
>>> On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
>>> > Hi Michal,
>>> >
>>> > I corrected xen's command line.
>>> > Now it is
>>> > xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D16=
00M
>>> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sched=3Dn=
ull
>>> > timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7";
>>>
>>> 4 colors is way too many for xen, just do xen_colors=3D0-0. There is no
>>> advantage in using more than 1 color for Xen.
>>>
>>> 4 colors is too few for dom0, if you are giving 1600M of memory to Dom0=
.
>>> Each color is 256M. For 1600M you should give at least 7 colors. Try:
>>>
>>> xen_colors=3D0-0 dom0_colors=3D1-8
>>>
>>>
>>>
>>> > Unfortunately the result was the same.
>>> >
>>> > (XEN)  - Dom0 mode: Relaxed
>>> > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
>>> > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
>>> > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>> > (XEN) Coloring general information
>>> > (XEN) Way size: 64kB
>>> > (XEN) Max. number of colors available: 16
>>> > (XEN) Xen color(s): [ 0 ]
>>> > (XEN) alternatives: Patching with alt table 00000000002cc690 ->
>>> 00000000002ccc0c
>>> > (XEN) Color array allocation failed for dom0
>>> > (XEN)
>>> > (XEN) ****************************************
>>> > (XEN) Panic on CPU 0:
>>> > (XEN) Error creating domain 0
>>> > (XEN) ****************************************
>>> > (XEN)
>>> > (XEN) Reboot in five seconds...
>>> >
>>> > I am going to find out how command line arguments passed and parsed.
>>> >
>>> > Regards,
>>> > Oleg
>>> >
>>> > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:2=
5, Oleg Nikitenko <oleshiiwood@gmail.com>:
>>> >       Hi Michal,
>>> >
>>> > You put my nose into the problem. Thank you.
>>> > I am going to use your point.
>>> > Let's see what happens.
>>> >
>>> > Regards,
>>> > Oleg
>>> >
>>> >
>>> > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:3=
7, Michal Orzel <michal.orzel@amd.com>:
>>> >       Hi Oleg,
>>> >
>>> >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
>>> >       >
>>> >       >
>>> >       >
>>> >       > Hello Stefano,
>>> >       >
>>> >       > Thanks for the clarification.
>>> >       > My company uses yocto for image generation.
>>> >       > What kind of information do you need to consult me in this
>>> case ?
>>> >       >
>>> >       > Maybe modules sizes/addresses which were mentioned by @Julien
>>> Grall <mailto:julien@xen.org> ?
>>> >
>>> >       Sorry for jumping into discussion, but FWICS the Xen command
>>> line you provided seems to be not the one
>>> >       Xen booted with. The error you are observing most likely is due
>>> to dom0 colors configuration not being
>>> >       specified (i.e. lack of dom0_colors=3D<> parameter). Although i=
n
>>> the command line you provided, this parameter
>>> >       is set, I strongly doubt that this is the actual command line i=
n
>>> use.
>>> >
>>> >       You wrote:
>>> >       xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_me=
m=3D1600M
>>> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative
>>> >       sched=3Dnull timer_slop=3D0 way_szize=3D65536 xen_colors=3D0-3
>>> dom0_colors=3D4-7";
>>> >
>>> >       but:
>>> >       1) way_szize has a typo
>>> >       2) you specified 4 colors (0-3) for Xen, but the boot log says
>>> that Xen has only one:
>>> >       (XEN) Xen color(s): [ 0 ]
>>> >
>>> >       This makes me believe that no colors configuration actually end
>>> up in command line that Xen booted with.
>>> >       Single color for Xen is a "default if not specified" and way
>>> size was probably calculated by asking HW.
>>> >
>>> >       So I would suggest to first cross-check the command line in use=
.
>>> >
>>> >       ~Michal
>>> >
>>> >
>>> >       >
>>> >       > Regards,
>>> >       > Oleg
>>> >       >
>>> >       > =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=
=B2 20:44, Stefano Stabellini <
>>> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>:
>>> >       >
>>> >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>>> >       >     > Hi Julien,
>>> >       >     >
>>> >       >     > >> This feature has not been merged in Xen upstream yet
>>> >       >     >
>>> >       >     > > would assume that upstream + the series on the ML [1]
>>> work
>>> >       >     >
>>> >       >     > Please clarify this point.
>>> >       >     > Because the two thoughts are controversial.
>>> >       >
>>> >       >     Hi Oleg,
>>> >       >
>>> >       >     As Julien wrote, there is nothing controversial. As you
>>> are aware,
>>> >       >     Xilinx maintains a separate Xen tree specific for Xilinx
>>> here:
>>> >       >     https://github.com/xilinx/xen <
>>> https://github.com/xilinx/xen>
>>> >       >
>>> >       >     and the branch you are using (xlnx_rebase_4.16) comes fro=
m
>>> there.
>>> >       >
>>> >       >
>>> >       >     Instead, the upstream Xen tree lives here:
>>> >       >     https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary <
>>> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>
>>> >       >
>>> >       >
>>> >       >     The Cache Coloring feature that you are trying to
>>> configure is present
>>> >       >     in xlnx_rebase_4.16, but not yet present upstream (there
>>> is an
>>> >       >     outstanding patch series to add cache coloring to Xen
>>> upstream but it
>>> >       >     hasn't been merged yet.)
>>> >       >
>>> >       >
>>> >       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't
>>> matter too much for
>>> >       >     you as you already have Cache Coloring as a feature there=
.
>>> >       >
>>> >       >
>>> >       >     I take you are using ImageBuilder to generate the boot
>>> configuration? If
>>> >       >     so, please post the ImageBuilder config file that you are
>>> using.
>>> >       >
>>> >       >     But from the boot message, it looks like the colors
>>> configuration for
>>> >       >     Dom0 is incorrect.
>>> >       >
>>> >
>>> >
>>> >
>>
>>

--00000000000045862f05f9d40d35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Michal,</div><div><br></div><div>Yes, I use yoc=
to.<br></div><div><br></div><div>Yesterday all day long I tried to follow y=
our suggestions.</div><div>I faced a problem.</div><div>Manually in the xen=
 config build file I pasted the strings:</div><div><br></div><div>CONFIG_EA=
RLY_PRINTK</div><div>CONFIG_EARLY_PRINTK_ZYNQMP</div><div>CONFIG_EARLY_UART=
_CHOICE_CADENCE<br></div><div><br></div><div>Host hangs in build time.=C2=
=A0</div><div>Maybe I did not set something in the config build file ?</div=
><div><br></div><div>Regards,</div><div>Oleg<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 20 =D0=
=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:57, Oleg Nikitenko &lt;<a h=
ref=3D"mailto:oleshiiwood@gmail.com">oleshiiwood@gmail.com</a>&gt;:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>T=
hanks Michal,</div><div><br></div><div>You gave me an idea.</div><div>I am =
going to try it today.</div><div><br></div><div>Regards,</div><div>O.<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">=D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:56,=
 Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bla=
nk">oleshiiwood@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>Thanks Stefano.</div><div><br></di=
v><div>I am going to do it today.</div><div><br></div><div>Regards,</div><d=
iv>O.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">=D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =
=D0=B2 23:05, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.o=
rg" target=3D"_blank">sstabellini@kernel.org</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 19 Apr 2023, Oleg Nikitenko w=
rote:<br>
&gt; Hi Michal,<br>
&gt; <br>
&gt; I corrected xen&#39;s command line.<br>
&gt; Now it is<br>
&gt; xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative sche=
d=3Dnull<br>
&gt; timer_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7&quo=
t;;<br>
<br>
4 colors is way too many for xen, just do xen_colors=3D0-0. There is no<br>
advantage in using more than 1 color for Xen.<br>
<br>
4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.<br=
>
Each color is 256M. For 1600M you should give at least 7 colors. Try:<br>
<br>
xen_colors=3D0-0 dom0_colors=3D1-8<br>
<br>
<br>
<br>
&gt; Unfortunately the result was the same.<br>
&gt; <br>
&gt; (XEN) =C2=A0- Dom0 mode: Relaxed<br>
&gt; (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt; (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>
&gt; (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource<br>
&gt; (XEN) Coloring general information<br>
&gt; (XEN) Way size: 64kB<br>
&gt; (XEN) Max. number of colors available: 16<br>
&gt; (XEN) Xen color(s): [ 0 ]<br>
&gt; (XEN) alternatives: Patching with alt table 00000000002cc690 -&gt; 000=
00000002ccc0c<br>
&gt; (XEN) Color array allocation failed for dom0<br>
&gt; (XEN)<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN) Panic on CPU 0:<br>
&gt; (XEN) Error creating domain 0<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN)<br>
&gt; (XEN) Reboot in five seconds...<br>
&gt; <br>
&gt; I am going to find out how command line arguments passed and parsed.<b=
r>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:25=
, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_bl=
ank">oleshiiwood@gmail.com</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Michal,<br>
&gt; <br>
&gt; You put my nose into the problem. Thank you.<br>
&gt; I am going to use your point.<br>
&gt; Let&#39;s see what happens.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Oleg<br>
&gt; <br>
&gt; <br>
&gt; =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37=
, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank=
">michal.orzel@amd.com</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 19/04/2023 09:03, Oleg Nikitenko wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; My company uses yocto for image generat=
ion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; What kind of information do you need to=
 consult me in this case ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Maybe modules sizes/addresses which wer=
e mentioned by @Julien Grall &lt;mailto:<a href=3D"mailto:julien@xen.org" t=
arget=3D"_blank">julien@xen.org</a>&gt; ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Sorry for jumping into discussion, but FWICS=
 the Xen command line you provided seems to be not the one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen booted with. The error you are observing=
 most likely is due to dom0 colors configuration not being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0specified (i.e. lack of dom0_colors=3D&lt;&g=
t; parameter). Although in the command line you provided, this parameter<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is set, I strongly doubt that this is the ac=
tual command line in use.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xen,xen-bootargs =3D &quot;console=3Ddtuart =
dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin bootscr=
ub=3D0 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sched=3Dnull timer_slop=3D0 way_szize=3D6553=
6 xen_colors=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01) way_szize has a typo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02) you specified 4 colors (0-3) for Xen, but=
 the boot log says that Xen has only one:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(XEN) Xen color(s): [ 0 ]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This makes me believe that no colors configu=
ration actually end up in command line that Xen booted with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Single color for Xen is a &quot;default if n=
ot specified&quot; and way size was probably calculated by asking HW.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So I would suggest to first cross-check the =
command line in use.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 20=
23=E2=80=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini &lt;<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a> &lt;mai=
lto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a>&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 2023,=
 Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; This f=
eature has not been merged in Xen upstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would assu=
me that upstream + the series on the ML [1] work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please clarify =
this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Because the two=
 thoughts are controversial.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0As Julien wrote, the=
re is nothing controversial. As you are aware,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Xilinx maintains a s=
eparate Xen tree specific for Xilinx here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://g=
ithub.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/xilinx/xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/xilinx/xen</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and the branch you a=
re using (xlnx_rebase_4.16) comes from there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Instead, the upstrea=
m Xen tree lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://x=
enbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=
=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a> &lt=
;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D=
"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The Cache Coloring f=
eature that you are trying to configure is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.16,=
 but not yet present upstream (there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0outstanding patch se=
ries to add cache coloring to Xen upstream but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0hasn&#39;t been merg=
ed yet.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Anyway, if you are u=
sing xlnx_rebase_4.16 it doesn&#39;t matter too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0you as you already h=
ave Cache Coloring as a feature there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I take you are using=
 ImageBuilder to generate the boot configuration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0so, please post the =
ImageBuilder config file that you are using.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But from the boot me=
ssage, it looks like the colors configuration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000045862f05f9d40d35--

