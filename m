Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE381F932
	for <lists+xen-devel@lfdr.de>; Thu, 28 Dec 2023 15:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660214.1029760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIrba-0006QB-Jv; Thu, 28 Dec 2023 14:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660214.1029760; Thu, 28 Dec 2023 14:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIrba-0006Nb-H0; Thu, 28 Dec 2023 14:43:26 +0000
Received: by outflank-mailman (input) for mailman id 660214;
 Thu, 28 Dec 2023 14:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PVOG=IH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rIrbY-0006NR-Fu
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2023 14:43:24 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72dd86a7-a58f-11ee-98ed-6d05b1d4d9a1;
 Thu, 28 Dec 2023 15:43:22 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso7369215a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Dec 2023 06:43:22 -0800 (PST)
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
X-Inumbo-ID: 72dd86a7-a58f-11ee-98ed-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1703774602; x=1704379402; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1+1BuuvnzvRtOPsSEVoAcLiaaF/Dsymm9T4vreZH10=;
        b=BF915vWHEk+jRAVECURqiScMApaFeQcL66OfCk1QBAxL6lkOIqJ4zInqvjeji98yZm
         poSa+mAQRt7snvXV+PUH0ecTym27pQ0xrojrAG1nZakB6DpvjzvFZK64Yjdlto4CtCl6
         C7pL428Az8iAgNiUu16RKhIWXROQtR8sCvJwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703774602; x=1704379402;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1+1BuuvnzvRtOPsSEVoAcLiaaF/Dsymm9T4vreZH10=;
        b=IjB7MQHjiVz3+VxnoHyzOtaqQ0zsN4dBTvdbL3RAPHcTH6T2mMhp8VafS9aHPEZkdO
         fo9dGvpQ0YUudTRoBud5yIMfS3U/hotvqWD8rgwduA6yYqZ+Y1zXNjxURgAHLsLlpxW2
         xKS1sF8oe8jZagyDp1WAtl8ckHmoogEACijZdepV2IxfogOBsEXSE4cpXFibR9DLWgbX
         3Ju+2sJjRSH+/Gy4CA0EuBbHKoTy/FG4bBiOOo1Dy+o2w7mqRWdaNyoS1RGPqvwKq3zA
         gXFc/emtgITG+arXeeDuqFSvetPiSCjtZaHHjZstkK8l90mQAvE/O8tsVH8dQ/85J07b
         YTAg==
X-Gm-Message-State: AOJu0YzpO9HQpPWFG/bGaDeNaJa4Br5EQ5eZBfaHbxac33DZY/nghYst
	bpTeu1x+lEeChe9d6V1C3vmtztmoUE/lWn+zAPNafbqCTkx2ijNdSnKD5zlsx8aGfA==
X-Google-Smtp-Source: AGHT+IFf32F1pi5DGPPfNI9NytEtrF8Pm/Eiyghbwwak+952OOljHtxZNrbonx87O3g3swU96POdfPnJtt3gCuYqvtg=
X-Received: by 2002:a50:cd88:0:b0:553:5b1d:956e with SMTP id
 p8-20020a50cd88000000b005535b1d956emr5714777edi.82.1703774601528; Thu, 28 Dec
 2023 06:43:21 -0800 (PST)
MIME-Version: 1.0
References: <185b7c2d-cc67-4bb1-8f43-31f8d9258af7@gmail.com>
 <CAO-mL=yV7dfUOP8qLX=ffO4bH8es4+oZHxw21G6Dqvp-pb7Y_w@mail.gmail.com> <d08f45d6-91a0-438d-9450-00dc85d123fa@gmail.com>
In-Reply-To: <d08f45d6-91a0-438d-9450-00dc85d123fa@gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 28 Dec 2023 14:42:45 +0000
Message-ID: <CAO-mL=z8tZUARqAR7ePYHx0KDm4hwEfwjjE9-tLVJm6Br7uaXA@mail.gmail.com>
Subject: Re: Wiki Access
To: jlpoole56@gmail.com, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e6e49c060d92ef6e"

--000000000000e6e49c060d92ef6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey John,

We have a glossary here that helps direct you to the relevant pages:
https://wiki.xenproject.org/wiki/Category:Glossary

However, for a glossary of terms it depends what you are searching for. I
don't believe we have a full page of terms on the old wiki but instead
pages split out by categories.
I'd suggest posting in the @xen-devel@lists.xenproject.org
<xen-devel@lists.xenproject.org> mailing list as a suggestion and see if
any of the other developers have the same idea. I'm sure it wouldn't be
difficult to set up, and you may even receive help from other members.

For the full pages, you can refer here:
https://wiki.xenproject.org/wiki/Special:AllPages

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Wed, Dec 27, 2023 at 10:58=E2=80=AFPM John L. Poole <jlpoole56@gmail.com=
> wrote:

> Thank you, Kelly.  I successfully edited a talk page concerning the
> definition of *VT-d*:  https://wiki.xenproject.org/wiki/Talk:VTd_HowTo
>
> I searched and did not readily find a glossary of terms within the Xen
> wiki.  I'm finding I keep encountering acronyms and terms of art which tr=
ip
> me up in fully digesting what is being said.  Is there a page where terms
> are defined?  I would go a long way to have terms linked to their
> definitions.  If not, what would be the best way to propose that the wiki
> have such a page?
>
> Best,
>
> John
> On 12/27/2023 1:53 PM, Kelly Choi wrote:
>
> Hi John,
>
> Thank you for your dedicated commitment to The Xen Project. We're gratefu=
l
> to individuals such as yourself who make the project successful.
>
> I've found your username under "jlpoole" and amended the access rights.
> You should be able to edit the pages now. We rely on community members to
> help us keep our documentation updated, so thank you for offering to help=
!
>
> We're going to be updating our documentation as part of a wider strategy
> but the Wiki will still be here until we do so. If you're interested we'd
> love to involve you during these steps too.
>
> Most of our developers chat on Matrix and send patches through our mailin=
g
> list. Please join us below and be sure to introduce yourself:
>
>
> =F0=9F=92=A1 XenProject: https://matrix.to/#/#XenProject:matrix.org
>
>
> =F0=9F=92=A1 XenDevel: https://matrix.to/#/#XenDevel:matrix.org
>
>
> =F0=9F=92=A1 XenSocial: https://matrix.to/#/#XenSocial:matrix.org
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>
>
> On Wed, Dec 27, 2023 at 5:08=E2=80=AFPM John L. Poole <jlpoole56@gmail.co=
m> wrote:
>
>> Dear Community Manager(s),
>>
>> my wiki username: jlpoole
>>
>> I think I've been using Xen for over a decade and possibly have had an
>> account on this wiki from the commencement of my voyage into Xen.
>>
>> You mustn't let the wiki be in a deep freeze.  I have colleagues
>> insisting I switch to KVM, but I resist and want to make Xen work,
>> especially after an incident several years ago where your top developers
>> where helping with a problem I faced (and, regrettably, it turned out to=
 be
>> a problem caused by Microsoft's wireless keyboard interfering somehow wi=
th
>> the boot process).
>>
>> For example, I am now building 2 new servers on Ryzen 7950+ processors
>> and am installing Xen on them.  I'm trying to learn and use the
>> pci-passthrough and I found a term "<guest virtual slot number>" at
>> https://wiki.xenproject.org/wiki/Xen_PCI_Passthrough#Verifying_that_the_=
device_is_ready_to_be_passed_through
>> .
>>
>> Hotplug
>>
>> Commands to hot-plug and unplug a device into a running VM are below:
>>
>> xl pci-attach <domain-id> <pci device> <guest virtual slot number>
>> xl pci-detach <domain-id> <pci device> <guest virtual slot number>
>>
>> (Replace xl with xm if you're using xend.)
>>
>> Google is unable to match "<guest virtual slot number>" with other
>> documentation, so it looks like the term was coined on this wiki page wi=
th
>> no further explanation.  I know what a <domain-id> is and it is defined
>> in other documentation.  That should be discussed and clarified.  Here's
>> what brought this term in focus: my attempt to follow the instruction le=
ft
>> me punting as to what the value is for the parameter "<guest virtual
>> slot number>" -- tried "0, but no success:
>>
>> ryzwork /home/jlpoole # date; xl pci-assignable-list
>> Wed Dec 27 08:04:12 AM PST 2023
>> ryzwork /home/jlpoole # xl pci-assignable-add 15:00.0
>> ryzwork /home/jlpoole # date; xl pci-assignable-list
>> Wed Dec 27 08:06:22 AM PST 2023
>> 0000:15:00.0
>> ryzwork /home/jlpoole # date
>> Wed Dec 27 08:10:51 AM PST 2023
>> ryzwork /home/jlpoole # xl list
>> Name                                        ID   Mem VCPUs      State
>> Time(s)
>> Domain-0                                     0  1024    32
>> r-----      30.5
>> ryzwork /home/jlpoole #  xl pci-attach 0 0000:15:00.0
>> libxl: error: libxl_pci.c:1536:libxl__device_pci_reset: write to
>> /sys/bus/pci/devices/0000:15:00.0/reset returned -1: Inappropriate ioctl
>> for device
>> libxl: error: libxl_pci.c:1498:pci_add_dm_done: xc_assign_device failed:
>> Invalid argument
>> libxl: error: libxl_pci.c:1777:device_pci_add_done: libxl__device_pci_ad=
d
>> failed for PCI device 0:15:0.0 (rc -3)
>> libxl: error: libxl_device.c:1414:device_addrm_aocomplete: unable to add
>> device
>> ryzwork /home/jlpoole # xl pci-attach 0 0000:15:00.0 0
>> libxl: error: libxl_pci.c:1536:libxl__device_pci_reset: write to
>> /sys/bus/pci/devices/0000:15:00.0/reset returned -1: Inappropriate ioctl
>> for device
>> libxl: error: libxl_pci.c:1498:pci_add_dm_done: xc_assign_device failed:
>> Invalid argument
>> libxl: error: libxl_pci.c:1777:device_pci_add_done: libxl__device_pci_ad=
d
>> failed for PCI device 0:15:0.0 (rc -3)
>> libxl: error: libxl_device.c:1414:device_addrm_aocomplete: unable to add
>> device
>> ryzwork /home/jlpoole #  date; xl pci-assignable-list
>> Wed Dec 27 08:13:46 AM PST 2023
>> 0000:15:00.0
>> ryzwork /home/jlpoole #
>>
>>
>> I was a software engineer at Oracle for 24 years, I retired January
>> 2023.
>> Please allow me to edit the wiki.
>>
>> Kind regards,
>> John
>> --
>>
>> John Laurence Poole
>> 1566 Court ST NE
>> Salem OR 97301-4241
>>
>> --
>
> John Laurence Poole
> 1566 Court ST NE
> Salem OR 97301-4241
>
>

--000000000000e6e49c060d92ef6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey John,=C2=A0<div><br></div><div>We have a glossary here=
 that helps direct you to the relevant pages:=C2=A0<a href=3D"https://wiki.=
xenproject.org/wiki/Category:Glossary">https://wiki.xenproject.org/wiki/Cat=
egory:Glossary</a>=C2=A0</div><div><br></div><div>However, for a glossary o=
f terms it depends what you are searching for. I don&#39;t believe we have =
a full page of terms on the old wiki but instead pages split out by categor=
ies.=C2=A0</div><div>I&#39;d suggest posting in the=C2=A0<a class=3D"gmail_=
plusreply" id=3D"plusReplyChip-0" href=3D"mailto:xen-devel@lists.xenproject=
.org" tabindex=3D"-1">@xen-devel@lists.xenproject.org</a>=C2=A0mailing list=
 as a suggestion and see if any of the other developers have the same idea.=
 I&#39;m sure it wouldn&#39;t be difficult to set up, and you may even rece=
ive help from other members.=C2=A0</div><div><br></div><div>For the full pa=
ges, you can refer here:=C2=A0<a href=3D"https://wiki.xenproject.org/wiki/S=
pecial:AllPages">https://wiki.xenproject.org/wiki/Special:AllPages</a>=C2=
=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,<=
/div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,1=
36,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen P=
roject=C2=A0<br></div></div></div></div></div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 27, 202=
3 at 10:58=E2=80=AFPM John L. Poole &lt;<a href=3D"mailto:jlpoole56@gmail.c=
om">jlpoole56@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Thank you, Kelly.=C2=A0 I successfully edited a talk page concerning
      the definition of <b>VT-d</b>:=C2=A0
      <a href=3D"https://wiki.xenproject.org/wiki/Talk:VTd_HowTo" target=3D=
"_blank">https://wiki.xenproject.org/wiki/Talk:VTd_HowTo</a><br>
    </p>
    <p>I searched and did not readily find a glossary of terms within
      the Xen wiki.=C2=A0 I&#39;m finding I keep encountering acronyms and =
terms
      of art which trip me up in fully digesting what is being said.=C2=A0 =
Is
      there a page where terms are defined?=C2=A0 I would go a long way to
      have terms linked to their definitions.=C2=A0 If not, what would be t=
he
      best way to propose that the wiki have such a page?</p>
    <p>Best,</p>
    <p>John<br>
    </p>
    <div>On 12/27/2023 1:53 PM, Kelly Choi
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hi John,
        <div><br>
        </div>
        <div>Thank you for your dedicated commitment=C2=A0to The Xen Projec=
t.
          We&#39;re grateful to individuals such as yourself who make the
          project successful.=C2=A0</div>
        <div><br>
        </div>
        <div>I&#39;ve found your username under &quot;jlpoole&quot; and ame=
nded the
          access rights. You should be able to edit the pages now. We
          rely on community members to help us keep our documentation
          updated, so thank you for offering to help!=C2=A0</div>
        <div><br>
        </div>
        <div>We&#39;re going to be updating our documentation as part of a
          wider strategy but the Wiki will still be here until we do so.
          If you&#39;re interested we&#39;d love to involve you during thes=
e
          steps too.=C2=A0</div>
        <div><br>
        </div>
        <div>Most of our developers chat on Matrix and send patches
          through our mailing list. Please join us below and be sure to
          introduce yourself:</div>
        <div>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;;min-height:15px"><br>
          </p>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;">=F0=9F=92=A1
            XenProject: <a href=3D"https://matrix.to/#/%23XenProject:matrix=
.org" target=3D"_blank">https://matrix.to/#/#XenProject:matrix.org</a></p>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;;min-height:15px"><br>
          </p>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;">=F0=9F=92=A1
            XenDevel: <a href=3D"https://matrix.to/#/%23XenDevel:matrix.org=
" target=3D"_blank">https://matrix.to/#/#XenDevel:matrix.org</a></p>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;;min-height:15px"><br>
          </p>
          <p style=3D"margin:0px;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;font-kerning:auto;font-feat=
ure-settings:normal;font-stretch:normal;font-size:13px;line-height:normal;f=
ont-family:&quot;Helvetica Neue&quot;"><span style=3D"font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;font-k=
erning:auto;font-feature-settings:normal;font-stretch:normal;line-height:no=
rmal;font-family:&quot;.Apple Color Emoji UI&quot;">=F0=9F=92=A1</span>
            XenSocial: <a href=3D"https://matrix.to/#/%23XenSocial:matrix.o=
rg" target=3D"_blank">https://matrix.to/#/#XenSocial:matrix.org</a></p>
        </div>
        <div><br>
        </div>
        <div>
          <div>
            <div dir=3D"ltr" class=3D"gmail_signature">
              <div dir=3D"ltr">
                <div>Many thanks,</div>
                <div>Kelly Choi</div>
                <div><br>
                </div>
                <div>
                  <div style=3D"color:rgb(136,136,136)">Community Manager</=
div>
                  <div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<b=
r>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 27, 2023 at
          5:08=E2=80=AFPM John L. Poole &lt;<a href=3D"mailto:jlpoole56@gma=
il.com" target=3D"_blank">jlpoole56@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <p>Dear Community Manager(s),<br>
            </p>
            <p>my wiki username: jlpoole</p>
            <p>I think I&#39;ve been using Xen for over a decade and
              possibly have had an account on this wiki from the
              commencement of my voyage into Xen.</p>
            <p>You mustn&#39;t let the wiki be in a deep freeze.=C2=A0 I ha=
ve
              colleagues insisting I switch to KVM, but I resist and
              want to make Xen work, especially after an incident
              several years ago where your top developers where helping
              with a problem I faced (and, regrettably, it turned out to
              be a problem caused by Microsoft&#39;s wireless keyboard
              interfering somehow with the boot process).</p>
            <p>For example, I am now building 2 new servers on Ryzen
              7950+ processors and am installing Xen on them.=C2=A0 I&#39;m
              trying to learn and use the pci-passthrough and I found a
              term &quot;<font face=3D"monospace">&lt;guest virtual slot
                number&gt;&quot;</font> at
              <a href=3D"https://wiki.xenproject.org/wiki/Xen_PCI_Passthrou=
gh#Verifying_that_the_device_is_ready_to_be_passed_through" target=3D"_blan=
k">https://wiki.xenproject.org/wiki/Xen_PCI_Passthrough#Verifying_that_the_=
device_is_ready_to_be_passed_through</a>.=C2=A0=C2=A0=C2=A0</p>
            <blockquote>
              <h3><span id=3D"m_-5792330574768745284m_1687509458263743493Ho=
tplug">Hotplug</span></h3>
              <p>Commands to hot-plug and unplug a device into a running
                VM are below: </p>
              <pre>xl pci-attach &lt;domain-id&gt; &lt;pci device&gt; &lt;g=
uest virtual slot number&gt;
xl pci-detach &lt;domain-id&gt; &lt;pci device&gt; &lt;guest virtual slot n=
umber&gt;
</pre>
              <p>(Replace <code>xl</code> with <code>xm</code> if
                you&#39;re using <code>xend</code>.) </p>
            </blockquote>
            <p>Google is unable to match &quot;<font face=3D"monospace">&lt=
;guest
                virtual slot number&gt;</font>&quot; with other
              documentation, so it looks like the term was coined on
              this wiki page with no further explanation.=C2=A0 I know what=
 a
              <font face=3D"monospace">&lt;domain-id&gt; </font>is and it
              is defined in other documentation.=C2=A0 That should be
              discussed and clarified.=C2=A0 Here&#39;s what brought this t=
erm in
              focus: my attempt to follow the instruction left me
              punting as to what the value is for the parameter &quot;<font=
 face=3D"monospace">&lt;guest virtual slot number&gt;</font>&quot;
              -- tried &quot;0, but no success:</p>
            <blockquote>
              <p><font face=3D"monospace">ryzwork /home/jlpoole # date; xl
                  pci-assignable-list<br>
                  Wed Dec 27 08:04:12 AM PST 2023<br>
                  ryzwork /home/jlpoole # xl pci-assignable-add 15:00.0<br>
                  ryzwork /home/jlpoole # date; xl pci-assignable-list<br>
                  Wed Dec 27 08:06:22 AM PST 2023<br>
                  0000:15:00.0<br>
                  ryzwork /home/jlpoole # date<br>
                  Wed Dec 27 08:10:51 AM PST 2023<br>
                  ryzwork /home/jlpoole # xl list<br>
                  Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem
                  VCPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 State=C2=A0=C2=A0 Tim=
e(s)<br>
                  Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0
                  1024=C2=A0=C2=A0=C2=A0 32=C2=A0=C2=A0=C2=A0=C2=A0 r-----=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30.5<br>
                  ryzwork /home/jlpoole #=C2=A0 xl pci-attach 0 0000:15:00.=
0<br>
                  libxl: error:
                  libxl_pci.c:1536:libxl__device_pci_reset: write to
                  /sys/bus/pci/devices/0000:15:00.0/reset returned -1:
                  Inappropriate ioctl for device<br>
                  libxl: error: libxl_pci.c:1498:pci_add_dm_done:
                  xc_assign_device failed: Invalid argument<br>
                  libxl: error: libxl_pci.c:1777:device_pci_add_done:
                  libxl__device_pci_add failed for PCI device 0:15:0.0
                  (rc -3)<br>
                  libxl: error:
                  libxl_device.c:1414:device_addrm_aocomplete: unable to
                  add device<br>
                  ryzwork /home/jlpoole # xl pci-attach 0 0000:15:00.0 0<br=
>
                  libxl: error:
                  libxl_pci.c:1536:libxl__device_pci_reset: write to
                  /sys/bus/pci/devices/0000:15:00.0/reset returned -1:
                  Inappropriate ioctl for device<br>
                  libxl: error: libxl_pci.c:1498:pci_add_dm_done:
                  xc_assign_device failed: Invalid argument<br>
                  libxl: error: libxl_pci.c:1777:device_pci_add_done:
                  libxl__device_pci_add failed for PCI device 0:15:0.0
                  (rc -3)<br>
                  libxl: error:
                  libxl_device.c:1414:device_addrm_aocomplete: unable to
                  add device<br>
                  ryzwork /home/jlpoole #=C2=A0 date; xl pci-assignable-lis=
t<br>
                  Wed Dec 27 08:13:46 AM PST 2023<br>
                  0000:15:00.0<br>
                  ryzwork /home/jlpoole #<br>
                  =C2=A0</font><br>
              </p>
            </blockquote>
            <p>I was a software engineer at Oracle for 24 years, I
              retired January 2023.=C2=A0 <br>
            </p>
            <div>Please allow me to edit the wiki.</div>
            <div><br>
            </div>
            <div>Kind regards,</div>
            <div>John<br>
            </div>
            <div>-- <br>
              <p><font size=3D"2" face=3D"Verdana">John Laurence Poole<br>
                  1566 Court ST NE<br>
                  Salem OR 97301-4241<br>
                  <br>
                </font></p>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <div>-- <br>
     =20
      <p><font size=3D"2" face=3D"Verdana">John Laurence Poole<br>
          1566 Court ST NE<br>
          Salem OR 97301-4241<br>
          <br>
        </font></p>
    </div>
  </div>

</blockquote></div>

--000000000000e6e49c060d92ef6e--

