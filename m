Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8132CE5DE9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 17:20:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iONoj-0008E8-0y; Sat, 26 Oct 2019 15:17:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksR0=YT=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iONoh-0008E3-ES
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 15:17:23 +0000
X-Inumbo-ID: b4f16652-f803-11e9-beca-bc764e2007e4
Received: from mail-ot1-x32b.google.com (unknown [2607:f8b0:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4f16652-f803-11e9-beca-bc764e2007e4;
 Sat, 26 Oct 2019 15:17:21 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id 41so4006094oti.12
 for <xen-devel@lists.xenproject.org>; Sat, 26 Oct 2019 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VXp1pozG/6pqWkxKmxmDO6mXkiLNpkt/zCEUDPq+BKw=;
 b=qVz06MdHmebG6XVln9a/Mdo6V/CmXzljhCaVD7jroXfyEZ+DltkKiTfmcBiT8zOYYd
 yFzPEqj+7i/gKCAOWDtGSOk6NZzr+xGTjanpoifK+MqyKYguPovOSUX8EoYFdd0VQoD7
 pB8d/m4+py2CeKuuvY7SCmKABD+nNDslURx8jfSQCi68TMFH8JzybHfCy51yryvAaw/T
 9D/4cquZ0iWKuQA10SsRG7Oa8BHJylaz8LMsBkvoaQvHi6C4JNn30ofjKv044Iz9ybwx
 zvlAFXi+sW5+/Jvdvckvma+GYzN0yadjOPHY/+Xwlwam1Q/ya0Z6vZfhnH+WINRFq22x
 YRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VXp1pozG/6pqWkxKmxmDO6mXkiLNpkt/zCEUDPq+BKw=;
 b=fLviVAUWa+SwKkbcrNjStQhGIpIKWDlq2xHreXBRlERcqHC3CG53J11WDeuzcZVzo5
 mpfDmI09bpddPcasV18pKFn7QwObzjkEIWX1skrou8qhXstq8Tn9TylUQg2ER0ncFRQ7
 bEs9DvNJmFlP7LVad2dU55aTWuNR4bWREYn9JYq0h99DC6FD+w+iFdYr1rIqY5yI8Rxr
 SsLGr/pP2MN8gJh1R3Bebx5Js8zxHwheIDFSGeHxaJ5aRUElDJlYBbyZC+pNHBc/eBP9
 1NrurS5byRaeo0CVNqL26cwSFbyWByCBqQo4ue3olFpPbkcV6xzqRpMVe3u9pMx+cEME
 R3SA==
X-Gm-Message-State: APjAAAXDz/HZEQE9B8HTA//59/w+2eupiI5ymxITtzJSHuEEIHc45MXw
 1GOEoBwFe0Tmf34377c5ikwsEX+u2rGJ0vDWdPE=
X-Google-Smtp-Source: APXvYqw81MzgGvjmfw/S/R0GDMffquCOK3zhcEs3MCQz6i0/N9rG5usaOs42HY6gEi9mjkRaKxjycrEi3kJcTYgdqrE=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr7040583oth.306.1572103041194; 
 Sat, 26 Oct 2019 08:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Sat, 26 Oct 2019 08:17:20
 -0700 (PDT)
In-Reply-To: <bc8bf8fc-7140-8762-3061-0068ade6ef89@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <CAL1e-=ipp6u=qPj4UEWj+SB=KmDyVnJeOJwH1bQiQmQv1YyANQ@mail.gmail.com>
 <CAL1e-=jnjn-n=h3mDN+1z14H9WmGjp95thPQ7bYkW7095wHCKA@mail.gmail.com>
 <bc8bf8fc-7140-8762-3061-0068ade6ef89@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 26 Oct 2019 17:17:20 +0200
Message-ID: <CAL1e-=g-pUMjDiEKvkPb_OFMB5f7iDJPDkS2=cJ43HTaP2zmxg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] hw/i386/pc: Split PIIX3
 southbridge from i440FX northbridge
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============7174436209327333382=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7174436209327333382==
Content-Type: multipart/alternative; boundary="000000000000521fec0595d1c320"

--000000000000521fec0595d1c320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 26, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Hi Aleksandar,
>
> On 10/25/19 12:51 PM, Aleksandar Markovic wrote:
>
>> On Thursday, October 24, 2019, Aleksandar Markovic <
>> aleksandar.m.mail@gmail.com <mailto:aleksandar.m.mail@gmail.com>> wrote:
>>
>>
>>
>>     On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9
>>     <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>>
>>         Changes since v1 [0]:
>>         - Removed patch reintroducing DO_UPCAST() use (thuth)
>>         - Took various patches out to reduce series (thuth)
>>         - Added review tags (thanks all for reviewing!)
>>
>>
>>     Philippe,
>>
>>     Do you intend to submit v3? The softfreeze is close.
>>
>>     A.
>>
>>
>> Philippe,
>>
>> It looks you are very busy these days. Do you mind my integrating this
>> series in next Mips queue, in its present v2 state? (You can certainly d=
o
>> further refinements later on.)
>>
>
> I addressed the review comments from this version, however it can not
> be merged yet ...


OK. Let's not rush. Let me know if I can help in any way.

A.




>
>
>> Aleksandar
>>
>>         $ git backport-diff -u pc_split_i440fx_piix-v1 -r
>> mc146818rtc_init..
>>         Key:
>>         [----] : patches are identical
>>         [####] : number of functional differences between
>>         upstream/downstream patch
>>         [down] : patch is downstream-only
>>         The flags [FC] indicate (F)unctional and (C)ontextual
>>         differences, respectively
>>
>>         001/20:[----] [--] 'MAINTAINERS: Keep PIIX4 South Bridge
>>         separate from PC Chipsets'
>>         002/20:[0011] [FC] 'piix4: add Reset Control Register'
>>         003/20:[0014] [FC] 'piix4: add a i8259 interrupt controller as
>>         specified in datasheet'
>>         004/20:[----] [--] 'Revert "irq: introduce qemu_irq_proxy()"'
>>         005/20:[----] [--] 'piix4: rename PIIX4 object to piix4-isa'
>>         006/20:[----] [-C] 'piix4: add a i8257 dma controller as
>>         specified in datasheet'
>>         007/20:[----] [-C] 'piix4: add a i8254 pit controller as
>>         specified in datasheet'
>>         008/20:[----] [-C] 'piix4: add a mc146818rtc controller as
>>         specified in datasheet'
>>         009/20:[----] [--] 'hw/mips/mips_malta: Create IDE hard drive
>>         array dynamically'
>>         010/20:[----] [--] 'hw/mips/mips_malta: Extract the PIIX4
>>         creation code as piix4_create()'
>>         011/20:[----] [--] 'hw/isa/piix4: Move piix4_create() to
>>         hw/isa/piix4.c'
>>         012/20:[----] [--] 'hw/i386: Remove obsolete
>>         LoadStateHandler::load_state_old handlers'
>>         013/20:[----] [--] 'hw/pci-host/piix: Extract piix3_create()'
>>         014/20:[0010] [FC] 'hw/pci-host/piix: Move RCR_IOPORT register
>>         definition'
>>         015/20:[----] [--] 'hw/pci-host/piix: Define and use the PIIX
>>         IRQ Route Control Registers'
>>         016/20:[----] [--] 'hw/pci-host/piix: Move i440FX declarations
>>         to hw/pci-host/i440fx.h'
>>         017/20:[----] [--] 'hw/pci-host/piix: Fix code style issues'
>>         018/20:[0012] [FC] 'hw/pci-host/piix: Extract PIIX3 functions to
>>         hw/isa/piix3.c'
>>         019/20:[----] [--] 'hw/pci-host: Rename incorrectly named 'piix'
>>         as 'i440fx''
>>         020/20:[----] [-C] 'hw/pci-host/i440fx: Remove the last PIIX3
>>         traces'
>>
>>         Previous cover:
>>
>>         This series is a rework of "piix4: cleanup and improvements" [1]
>>         from Herv=C3=A9, and my "remove i386/pc dependency: PIIX cleanup=
" [2].
>>
>>         Still trying to remove the strong X86/PC dependency 2 years late=
r,
>>         one step at a time.
>>         Here we split the PIIX3 southbridge from i440FX northbridge.
>>         The i440FX northbridge is only used by the PC machine, while the
>>         PIIX southbridge is also used by the Malta MIPS machine.
>>
>>         This is also a step forward using KConfig with the Malta board.
>>         Without this split, it was impossible to compile the Malta witho=
ut
>>         pulling various X86 pieces of code.
>>
>>         The overall design cleanup is not yet perfect, but enough to pos=
t
>>         as a series.
>>
>>         Now that the PIIX3 code is extracted, the code duplication with
>> the
>>         PIIX4 chipset is obvious. Not worth improving for now because it
>>         isn't broken.
>>
>>         [0]
>>         https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg036
>> 85.html
>>         <https://lists.gnu.org/archive/html/qemu-devel/2019-10/
>> msg03685.html>
>>         [1]
>>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737.htm=
l
>> <https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737.html>
>>         [2]
>>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081.htm=
l
>> <https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081.html>
>>
>>         Based-on: <20191018133547.10936-1-philmd@redhat.com
>>         <mailto:20191018133547.10936-1-philmd@redhat.com>>
>>         mc146818rtc: Allow call object_initialize(MC146818_RTC) instead
>>         of rtc_init()
>>
>
> ... because it depends on this series which has been queued by Paolo but
> is not yet merged.
>
>         https://mid.mail-archive.com/20191018133547.10936-1-philmd@r
>> edhat.com
>>         <https://mid.mail-archive.com/20191018133547.10936-1-philmd@
>> redhat.com>
>>
>>         Herv=C3=A9 Poussineau (5):
>>            piix4: Add the Reset Control Register
>>            piix4: Add a i8259 Interrupt Controller as specified in
>> datasheet
>>            piix4: Rename PIIX4 object to piix4-isa
>>            piix4: Add a i8257 DMA Controller as specified in datasheet
>>            piix4: Add a i8254 PIT Controller as specified in datasheet
>>
>>         Philippe Mathieu-Daud=C3=A9 (15):
>>            MAINTAINERS: Keep PIIX4 South Bridge separate from PC Chipset=
s
>>            Revert "irq: introduce qemu_irq_proxy()"
>>            piix4: Add a MC146818 RTC Controller as specified in datashee=
t
>>            hw/mips/mips_malta: Create IDE hard drive array dynamically
>>            hw/mips/mips_malta: Extract the PIIX4 creation code as
>>         piix4_create()
>>            hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c
>>            hw/i386: Remove obsolete LoadStateHandler::load_state_old
>>         handlers
>>            hw/pci-host/piix: Extract piix3_create()
>>            hw/pci-host/piix: Move RCR_IOPORT register definition
>>            hw/pci-host/piix: Define and use the PIIX IRQ Route Control
>>         Registers
>>            hw/pci-host/piix: Move i440FX declarations to
>>         hw/pci-host/i440fx.h
>>            hw/pci-host/piix: Fix code style issues
>>            hw/pci-host/piix: Extract PIIX3 functions to hw/isa/piix3.c
>>            hw/pci-host: Rename incorrectly named 'piix' as 'i440fx'
>>            hw/pci-host/i440fx: Remove the last PIIX3 traces
>>
>>           MAINTAINERS                      |  14 +-
>>           hw/acpi/pcihp.c                  |   2 +-
>>           hw/acpi/piix4.c                  |  42 +--
>>           hw/core/irq.c                    |  14 -
>>           hw/i386/Kconfig                  |   3 +-
>>           hw/i386/acpi-build.c             |   5 +-
>>           hw/i386/pc_piix.c                |  10 +-
>>           hw/i386/xen/xen-hvm.c            |   5 +-
>>           hw/intc/apic_common.c            |  49 ----
>>           hw/isa/Kconfig                   |   4 +
>>           hw/isa/Makefile.objs             |   1 +
>>           hw/isa/piix3.c                   | 399
>>         +++++++++++++++++++++++++++++
>>           hw/isa/piix4.c                   | 151 ++++++++++-
>>           hw/mips/gt64xxx_pci.c            |   5 +-
>>           hw/mips/mips_malta.c             |  46 +---
>>           hw/pci-host/Kconfig              |   3 +-
>>           hw/pci-host/Makefile.objs        |   2 +-
>>           hw/pci-host/{piix.c =3D> i440fx.c} | 424
>>         +------------------------------
>>           hw/timer/i8254_common.c          |  40 ---
>>           include/hw/acpi/piix4.h          |   6 -
>>           include/hw/i386/pc.h             |  37 ---
>>           include/hw/irq.h                 |   5 -
>>           include/hw/isa/isa.h             |   2 +
>>           include/hw/pci-host/i440fx.h     |  36 +++
>>           include/hw/southbridge/piix.h    |  74 ++++++
>>           stubs/pci-host-piix.c            |   3 +-
>>           26 files changed, 699 insertions(+), 683 deletions(-)
>>           create mode 100644 hw/isa/piix3.c
>>           rename hw/pci-host/{piix.c =3D> i440fx.c} (58%)
>>           delete mode 100644 include/hw/acpi/piix4.h
>>           create mode 100644 include/hw/pci-host/i440fx.h
>>           create mode 100644 include/hw/southbridge/piix.h
>>
>>         --         2.21.0
>>
>>
>>

--000000000000521fec0595d1c320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><br><br>On Saturday, October 26, 2019, Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Aleksandar,<br>
<br>
On 10/25/19 12:51 PM, Aleksandar Markovic wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thursday, October 24, 2019, Aleksandar Markovic &lt;<a href=3D"mailto:al=
eksandar.m.mail@gmail.com" target=3D"_blank">aleksandar.m.mail@gmail.com</a=
> &lt;mailto:<a href=3D"mailto:aleksandar.m.mail@gmail.com" target=3D"_blan=
k">aleksandar.m.mail@<wbr>gmail.com</a>&gt;&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9<br>
=C2=A0 =C2=A0 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">ph=
ilmd@redhat.com</a> &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=
=3D"_blank">philmd@redhat.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Changes since v1 [0]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Removed patch reintroducing DO_UPCAST() use (=
thuth)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Took various patches out to reduce series (th=
uth)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Added review tags (thanks all for reviewing!)=
<br>
<br>
<br>
=C2=A0 =C2=A0 Philippe,<br>
<br>
=C2=A0 =C2=A0 Do you intend to submit v3? The softfreeze is close.<br>
<br>
=C2=A0 =C2=A0 A.<br>
<br>
<br>
Philippe,<br>
<br>
It looks you are very busy these days. Do you mind my integrating this seri=
es in next Mips queue, in its present v2 state? (You can certainly do furth=
er refinements later on.)<br>
</blockquote>
<br>
I addressed the review comments from this version, however it can not<br>
be merged yet ...</blockquote><div><br></div><div>OK. Let&#39;s not rush. L=
et me know if I can help in any way.</div><div><br></div><div>A.</div><div>=
<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Aleksandar<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git backport-diff -u pc_split_i440fx_piix-v1 =
-r mc146818rtc_init..<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Key:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [----] : patches are identical<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [####] : number of functional differences betwe=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 upstream/downstream patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [down] : patch is downstream-only<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The flags [FC] indicate (F)unctional and (C)ont=
extual<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 differences, respectively<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 001/20:[----] [--] &#39;MAINTAINERS: Keep PIIX4=
 South Bridge<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 separate from PC Chipsets&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 002/20:[0011] [FC] &#39;piix4: add Reset Contro=
l Register&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 003/20:[0014] [FC] &#39;piix4: add a i8259 inte=
rrupt controller as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified in datasheet&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 004/20:[----] [--] &#39;Revert &quot;irq: intro=
duce qemu_irq_proxy()&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 005/20:[----] [--] &#39;piix4: rename PIIX4 obj=
ect to piix4-isa&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 006/20:[----] [-C] &#39;piix4: add a i8257 dma =
controller as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified in datasheet&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 007/20:[----] [-C] &#39;piix4: add a i8254 pit =
controller as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified in datasheet&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 008/20:[----] [-C] &#39;piix4: add a mc146818rt=
c controller as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified in datasheet&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 009/20:[----] [--] &#39;hw/mips/mips_malta: Cre=
ate IDE hard drive<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 array dynamically&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 010/20:[----] [--] &#39;hw/mips/mips_malta: Ext=
ract the PIIX4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 creation code as piix4_create()&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 011/20:[----] [--] &#39;hw/isa/piix4: Move piix=
4_create() to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/isa/piix4.c&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 012/20:[----] [--] &#39;hw/i386: Remove obsolet=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LoadStateHandler::load_state_o<wbr>ld handlers&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 013/20:[----] [--] &#39;hw/pci-host/piix: Extra=
ct piix3_create()&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 014/20:[0010] [FC] &#39;hw/pci-host/piix: Move =
RCR_IOPORT register<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 definition&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 015/20:[----] [--] &#39;hw/pci-host/piix: Defin=
e and use the PIIX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IRQ Route Control Registers&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 016/20:[----] [--] &#39;hw/pci-host/piix: Move =
i440FX declarations<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to hw/pci-host/i440fx.h&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 017/20:[----] [--] &#39;hw/pci-host/piix: Fix c=
ode style issues&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 018/20:[0012] [FC] &#39;hw/pci-host/piix: Extra=
ct PIIX3 functions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/isa/piix3.c&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 019/20:[----] [--] &#39;hw/pci-host: Rename inc=
orrectly named &#39;piix&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 as &#39;i440fx&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 020/20:[----] [-C] &#39;hw/pci-host/i440fx: Rem=
ove the last PIIX3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 traces&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Previous cover:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This series is a rework of &quot;piix4: cleanup=
 and improvements&quot; [1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 from Herv=C3=A9, and my &quot;remove i386/pc de=
pendency: PIIX cleanup&quot; [2].<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Still trying to remove the strong X86/PC depend=
ency 2 years later,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 one step at a time.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Here we split the PIIX3 southbridge from i440FX=
 northbridge.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The i440FX northbridge is only used by the PC m=
achine, while the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX southbridge is also used by the Malta MIPS=
 machine.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is also a step forward using KConfig with =
the Malta board.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Without this split, it was impossible to compil=
e the Malta without<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pulling various X86 pieces of code.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The overall design cleanup is not yet perfect, =
but enough to post<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 as a series.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Now that the PIIX3 code is extracted, the code =
duplication with the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PIIX4 chipset is obvious. Not worth improving f=
or now because it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 isn&#39;t broken.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/q=
emu-devel/2019-10/msg03685.html" target=3D"_blank">https://lists.gnu.org/ar=
chive/<wbr>html/qemu-devel/2019-10/msg036<wbr>85.html</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://lists.gnu.org/archive/ht=
ml/qemu-devel/2019-10/msg03685.html" target=3D"_blank">https://lists.gnu.or=
g/archive<wbr>/html/qemu-devel/2019-10/<wbr>msg03685.html</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg500737.html" target=3D"_blank">https://www.mail-archive.c=
om/q<wbr>emu-devel@nongnu.org/msg500737<wbr>.html</a> &lt;<a href=3D"https:=
//www.mail-archive.com/qemu-devel@nongnu.org/msg500737.html" target=3D"_bla=
nk">https://www.mail-archive.com/<wbr>qemu-devel@nongnu.org/msg50073<wbr>7.=
html</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [2]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg504081.html" target=3D"_blank">https://www.mail-archive.c=
om/q<wbr>emu-devel@nongnu.org/msg504081<wbr>.html</a> &lt;<a href=3D"https:=
//www.mail-archive.com/qemu-devel@nongnu.org/msg504081.html" target=3D"_bla=
nk">https://www.mail-archive.com/<wbr>qemu-devel@nongnu.org/msg50408<wbr>1.=
html</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Based-on: &lt;<a href=3D"mailto:20191018133547.=
10936-1-philmd@redhat.com" target=3D"_blank">20191018133547.10936-1-<wbr>ph=
ilmd@redhat.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:20191018133547.109=
36-1-philmd@redhat.com" target=3D"_blank">20191018133547.10936-<wbr>1-philm=
d@redhat.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mc146818rtc: Allow call object_initialize(MC146=
818_RTC<wbr>) instead<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of rtc_init()<br>
</blockquote>
<br>
... because it depends on this series which has been queued by Paolo but is=
 not yet merged.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://mid.mail-archive.com/2019101=
8133547.10936-1-philmd@redhat.com" target=3D"_blank">https://mid.mail-archi=
ve.com/2<wbr>0191018133547.10936-1-philmd@r<wbr>edhat.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://mid.mail-archive.com/201=
91018133547.10936-1-philmd@redhat.com" target=3D"_blank">https://mid.mail-a=
rchive.com/<wbr>20191018133547.10936-1-philmd@<wbr>redhat.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Herv=C3=A9 Poussineau (5):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Add the Reset Control Regis=
ter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Add a i8259 Interrupt Contr=
oller as specified in datasheet<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Rename PIIX4 object to piix=
4-isa<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Add a i8257 DMA Controller =
as specified in datasheet<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Add a i8254 PIT Controller =
as specified in datasheet<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Philippe Mathieu-Daud=C3=A9 (15):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 MAINTAINERS: Keep PIIX4 South Brid=
ge separate from PC Chipsets<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Revert &quot;irq: introduce qemu_i=
rq_proxy()&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 piix4: Add a MC146818 RTC Controll=
er as specified in datasheet<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/mips/mips_malta: Create IDE har=
d drive array dynamically<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/mips/mips_malta: Extract the PI=
IX4 creation code as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix4_create()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/isa/piix4: Move piix4_create() =
to hw/isa/piix4.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/i386: Remove obsolete LoadState=
Handler::load_state_o<wbr>ld<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 handlers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Extract piix3_cr=
eate()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Move RCR_IOPORT =
register definition<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Define and use t=
he PIIX IRQ Route Control<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Registers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Move i440FX decl=
arations to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/pci-host/i440fx.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Fix code style i=
ssues<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/piix: Extract PIIX3 fu=
nctions to hw/isa/piix3.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host: Rename incorrectly na=
med &#39;piix&#39; as &#39;i440fx&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 hw/pci-host/i440fx: Remove the las=
t PIIX3 traces<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 42 +--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/core/irq.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/i386/Kconfig=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/intc/apic_common.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 49 ----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/isa/Makefile.objs=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 399<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++++++++++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 151 ++++++++++-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 46 +---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/pci-host/Makefile.objs=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/pci-host/{piix.c =3D&gt; i440fx.=
c} | 424<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----------------------------<wbr>-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0hw/timer/i8254_common.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/acpi/piix4.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/irq.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/isa/isa.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/pci-host/i440fx.<wbr>h=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0include/hw/southbridge/piix.<wbr>h=
=C2=A0 =C2=A0 |=C2=A0 74 ++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0stubs/pci-host-piix.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A026 files changed, 699 insertions(+)=
, 683 deletions(-)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 hw/isa/piix3.c<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename hw/pci-host/{piix.c =3D&gt; =
i440fx.c} (58%)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644 include/hw/acpi/=
piix4.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/hw/pci-h=
ost/i440fx.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 include/hw/south=
bridge/piix.h<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.21.0<br>
<br>
<br>
</blockquote>
</blockquote>

--000000000000521fec0595d1c320--


--===============7174436209327333382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7174436209327333382==--

