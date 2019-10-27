Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A0E6182
	for <lists+xen-devel@lfdr.de>; Sun, 27 Oct 2019 08:47:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOdDn-0004sh-5I; Sun, 27 Oct 2019 07:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s7BU=YU=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iOdDl-0004sa-Ix
 for xen-devel@lists.xenproject.org; Sun, 27 Oct 2019 07:44:17 +0000
X-Inumbo-ID: 93462c4c-f88d-11e9-beca-bc764e2007e4
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93462c4c-f88d-11e9-beca-bc764e2007e4;
 Sun, 27 Oct 2019 07:44:15 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id b19so2453629otq.10
 for <xen-devel@lists.xenproject.org>; Sun, 27 Oct 2019 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YOKuiXdfPO3KK/txzpZ/LHVNC8on230B40nga34VpW4=;
 b=OHeMeX2KMoJ+RqLr2nryXUV4lna1v/SISAEWu6MUvZtfkbzl5krRthanDSklG9Vljj
 IuMpptEpINoSYQTuTyfnQY6BfbpdvMVfC3joMWZStNfXmyKHmecK5wnHwd2utdRH71aV
 JGsLuAhO1VcQnZ2OinxSrOWbriEiXCpe3NGaTDrBqAqRF3TuA16KZaIsrdlZ3Dqncqe+
 m012t2GB0uRagm/J+Ml3LMZmLWq9PSPaJbGJbT/CN7t35r7W4lL2E51qUgVsO3LnnU4A
 hAewwhJ/JVhfSMBo7v1iAvQExUxa5u69TUwZ7ojqo4G0wmrdn4UnYwin08dHM8YSEgbj
 VARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YOKuiXdfPO3KK/txzpZ/LHVNC8on230B40nga34VpW4=;
 b=otd/zOhGSxqSK7EJ4H99PB9zqe4i5U5h7BojbL7IOgC79C7HOb5BnAzy44SEYvCKmt
 YQYwjsZGyS43Dr0zllBHEE9T+FY0v6pXRqPp1kBY0fgxgijd0RjzRKShPYmQm7UcYDjU
 O7qZZ6BtPWdfpUznSVZ1ETYNRO7l+rgAuqC1Y/qQuEjIdWRwdPjT5kLeV+d3CzBd/PwT
 St822qilnYXv32pBQhhbkOJrnm0JsVyxVpzNa2qrtHfYiNPofPKEzwI11880x07wdw4Q
 HHPyQCyYteVLU7+ZqLc8MqVgfB/nZNq3OgvLmoeVxTqKC/+8kpduQr7cdV2SMEICdKJx
 JP4w==
X-Gm-Message-State: APjAAAWUEnuaV7T2kmL0aeQlSj93HQWYfRJKuEalKqIE3RFxmzrWGaut
 Z/y/CynRkc3j+Tq5fJ3gu9sgdLvqbIA/KNGCrRc=
X-Google-Smtp-Source: APXvYqzXS3djOEZPvpKIoo/YFqcqo1HnoMHVgN1zwBZLu3UwCLet/xiamRKgH+nQEN9RcIqrdAL3jF7oFoEcnpF18rQ=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr3435887otl.64.1572162255112; 
 Sun, 27 Oct 2019 00:44:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Sun, 27 Oct 2019 00:44:14
 -0700 (PDT)
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sun, 27 Oct 2019 08:44:14 +0100
Message-ID: <CAL1e-=jW0Jmk=Y9o_UpdeOo6vfTm-qXyPVtk4O+RLOUN_5Y_cw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v3 00/20] hw/i386/pc: Split PIIX3
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============3423181742954870852=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3423181742954870852==
Content-Type: multipart/alternative; boundary="000000000000becf960595df8c56"

--000000000000becf960595df8c56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 26, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Changes since v2 [0]:
> - Use a #define
> - Reword one description
> - Added review tags (thanks all for reviewing!)
>
> Changes since v1 [1]:
> - Removed patch reintroducing DO_UPCAST() use (thuth)
> - Took various patches out to reduce series (thuth)
> - Added review tags (thanks all for reviewing!)
>
> $ git backport-diff -u pc_split_i440fx_piix-v2
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream pat=
ch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences,
> respectively
>
> 001/20:[----] [--] 'MAINTAINERS: Keep PIIX4 South Bridge separate from PC
> Chipsets'
> 002/20:[0004] [FC] 'piix4: Add the Reset Control Register'
> 003/20:[0002] [FC] 'piix4: Add an i8259 Interrupt Controller as specified
> in datasheet'
> 004/20:[----] [--] 'Revert "irq: introduce qemu_irq_proxy()"'
> 005/20:[----] [--] 'piix4: Rename PIIX4 object to piix4-isa'
> 006/20:[----] [--] 'piix4: Add an i8257 DMA Controller as specified in
> datasheet'
> 007/20:[----] [-C] 'piix4: Add an i8254 PIT Controller as specified in
> datasheet'
> 008/20:[0004] [FC] 'piix4: Add a MC146818 RTC Controller as specified in
> datasheet'
> 009/20:[----] [--] 'hw/mips/mips_malta: Create IDE hard drive array
> dynamically'
> 010/20:[----] [--] 'hw/mips/mips_malta: Extract the PIIX4 creation code a=
s
> piix4_create()'
> 011/20:[----] [-C] 'hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c'
> 012/20:[----] [--] 'hw/i386: Remove obsolete LoadStateHandler::load_state=
_old
> handlers'
> 013/20:[----] [--] 'hw/pci-host/piix: Extract piix3_create()'
> 014/20:[0002] [FC] 'hw/pci-host/piix: Move RCR_IOPORT register definition=
'
> 015/20:[----] [--] 'hw/pci-host/piix: Define and use the PIIX IRQ Route
> Control Registers'
> 016/20:[----] [-C] 'hw/pci-host/piix: Move i440FX declarations to
> hw/pci-host/i440fx.h'
> 017/20:[----] [--] 'hw/pci-host/piix: Fix code style issues'
> 018/20:[----] [--] 'hw/pci-host/piix: Extract PIIX3 functions to
> hw/isa/piix3.c'
> 019/20:[----] [--] 'hw/pci-host: Rename incorrectly named 'piix' as
> 'i440fx''
> 020/20:[0004] [FC] 'hw/pci-host/i440fx: Remove the last PIIX3 traces'
>
> Previous cover:
>
> This series is a rework of "piix4: cleanup and improvements" [2]
> from Herv=C3=A9, and my "remove i386/pc dependency: PIIX cleanup" [3].
>
> Still trying to remove the strong X86/PC dependency 2 years later,
> one step at a time.
> Here we split the PIIX3 southbridge from i440FX northbridge.
> The i440FX northbridge is only used by the PC machine, while the
> PIIX southbridge is also used by the Malta MIPS machine.
>
> This is also a step forward using KConfig with the Malta board.
> Without this split, it was impossible to compile the Malta without
> pulling various X86 pieces of code.
>
> The overall design cleanup is not yet perfect, but enough to post
> as a series.
>
> Now that the PIIX3 code is extracted, the code duplication with the
> PIIX4 chipset is obvious. Not worth improving for now because it
> isn't broken.
>
> Based-on: <1572097538-18898-1-git-send-email-pbonzini@redhat.com>
> to include:
> mc146818rtc: Allow call object_initialize(MC146818_RTC) instead of
> rtc_init()
> https://mid.mail-archive.com/20191018133547.10936-1-philmd@redhat.com
>
> Since Aleksandar offered me to send the pull request [4] I plan to do
> it once Paolo's pull [5] is merged.
>
>
Philippe,

I attempted the other day the integration of v2 of this series into MIPS
pull request, but couldn't do it - since another series of yours was
already merged, acting on the same code, making rebasing difficult. Now
this, v3, series can't be applied since certain patches in some, on
surface, unrelated series aren't megred, and v3 assumes they are merged.

If you send a series, it should preferably be based on the latest (current)
code base, not on some imagined future state.

Why did you create this such mess with interdependencies of your own
multiple series, and just right before softfreeze? :( You should have
distributed submitting those series over longer time interval, and
absolutely avoid, if possible, this hectic around-softfreeze period. You
did the opposite: waited for softfreeze to become close, and sent several
interdependant series in matter of days - creating stress without any real
technical reason.

In case you, for any reason, can't complete this by softfreeze, I advice
you not to rush, and postpone the integration to 5.0.

Thanks,
Aleksandar



> Thanks,
>
> Phil.
>
> CI results:
> https://travis-ci.org/philmd/qemu/builds/603253987
> https://app.shippable.com/github/philmd/qemu/runs/550/summary/console
>
> [0] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg04662.html
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg03685.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737.html
> [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081.html
> [4] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg04959.html
> [5] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07339.html
>
> Herv=C3=A9 Poussineau (5):
>   piix4: Add the Reset Control Register
>   piix4: Add an i8259 Interrupt Controller as specified in datasheet
>   piix4: Rename PIIX4 object to piix4-isa
>   piix4: Add an i8257 DMA Controller as specified in datasheet
>   piix4: Add an i8254 PIT Controller as specified in datasheet
>
> Philippe Mathieu-Daud=C3=A9 (15):
>   MAINTAINERS: Keep PIIX4 South Bridge separate from PC Chipsets
>   Revert "irq: introduce qemu_irq_proxy()"
>   piix4: Add a MC146818 RTC Controller as specified in datasheet
>   hw/mips/mips_malta: Create IDE hard drive array dynamically
>   hw/mips/mips_malta: Extract the PIIX4 creation code as piix4_create()
>   hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c
>   hw/i386: Remove obsolete LoadStateHandler::load_state_old handlers
>   hw/pci-host/piix: Extract piix3_create()
>   hw/pci-host/piix: Move RCR_IOPORT register definition
>   hw/pci-host/piix: Define and use the PIIX IRQ Route Control Registers
>   hw/pci-host/piix: Move i440FX declarations to hw/pci-host/i440fx.h
>   hw/pci-host/piix: Fix code style issues
>   hw/pci-host/piix: Extract PIIX3 functions to hw/isa/piix3.c
>   hw/pci-host: Rename incorrectly named 'piix' as 'i440fx'
>   hw/pci-host/i440fx: Remove the last PIIX3 traces
>
>  MAINTAINERS                      |  14 +-
>  hw/acpi/pcihp.c                  |   2 +-
>  hw/acpi/piix4.c                  |  42 +--
>  hw/core/irq.c                    |  14 -
>  hw/i386/Kconfig                  |   3 +-
>  hw/i386/acpi-build.c             |   5 +-
>  hw/i386/pc_piix.c                |  10 +-
>  hw/i386/xen/xen-hvm.c            |   5 +-
>  hw/intc/apic_common.c            |  49 ----
>  hw/isa/Kconfig                   |   4 +
>  hw/isa/Makefile.objs             |   1 +
>  hw/isa/piix3.c                   | 399 +++++++++++++++++++++++++++++
>  hw/isa/piix4.c                   | 151 ++++++++++-
>  hw/mips/gt64xxx_pci.c            |   5 +-
>  hw/mips/mips_malta.c             |  46 +---
>  hw/pci-host/Kconfig              |   3 +-
>  hw/pci-host/Makefile.objs        |   2 +-
>  hw/pci-host/{piix.c =3D> i440fx.c} | 424 +------------------------------
>  hw/timer/i8254_common.c          |  40 ---
>  include/hw/acpi/piix4.h          |   6 -
>  include/hw/i386/pc.h             |  37 ---
>  include/hw/irq.h                 |   5 -
>  include/hw/isa/isa.h             |   2 +
>  include/hw/pci-host/i440fx.h     |  36 +++
>  include/hw/southbridge/piix.h    |  74 ++++++
>  stubs/pci-host-piix.c            |   3 +-
>  26 files changed, 699 insertions(+), 683 deletions(-)
>  create mode 100644 hw/isa/piix3.c
>  rename hw/pci-host/{piix.c =3D> i440fx.c} (58%)
>  delete mode 100644 include/hw/acpi/piix4.h
>  create mode 100644 include/hw/pci-host/i440fx.h
>  create mode 100644 include/hw/southbridge/piix.h
>
> --
> 2.21.0
>
>
>

--000000000000becf960595df8c56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, October 26, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Changes since v2 [0]:<br>
- Use a #define<br>
- Reword one description<br>
- Added review tags (thanks all for reviewing!)<br>
<br>
Changes since v1 [1]:<br>
- Removed patch reintroducing DO_UPCAST() use (thuth)<br>
- Took various patches out to reduce series (thuth)<br>
- Added review tags (thanks all for reviewing!)<br>
<br>
$ git backport-diff -u pc_split_i440fx_piix-v2<br>
Key:<br>
[----] : patches are identical<br>
[####] : number of functional differences between upstream/downstream patch=
<br>
[down] : patch is downstream-only<br>
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely<br>
<br>
001/20:[----] [--] &#39;MAINTAINERS: Keep PIIX4 South Bridge separate from =
PC Chipsets&#39;<br>
002/20:[0004] [FC] &#39;piix4: Add the Reset Control Register&#39;<br>
003/20:[0002] [FC] &#39;piix4: Add an i8259 Interrupt Controller as specifi=
ed in datasheet&#39;<br>
004/20:[----] [--] &#39;Revert &quot;irq: introduce qemu_irq_proxy()&quot;&=
#39;<br>
005/20:[----] [--] &#39;piix4: Rename PIIX4 object to piix4-isa&#39;<br>
006/20:[----] [--] &#39;piix4: Add an i8257 DMA Controller as specified in =
datasheet&#39;<br>
007/20:[----] [-C] &#39;piix4: Add an i8254 PIT Controller as specified in =
datasheet&#39;<br>
008/20:[0004] [FC] &#39;piix4: Add a MC146818 RTC Controller as specified i=
n datasheet&#39;<br>
009/20:[----] [--] &#39;hw/mips/mips_malta: Create IDE hard drive array dyn=
amically&#39;<br>
010/20:[----] [--] &#39;hw/mips/mips_malta: Extract the PIIX4 creation code=
 as piix4_create()&#39;<br>
011/20:[----] [-C] &#39;hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c=
&#39;<br>
012/20:[----] [--] &#39;hw/i386: Remove obsolete LoadStateHandler::load_sta=
te_<wbr>old handlers&#39;<br>
013/20:[----] [--] &#39;hw/pci-host/piix: Extract piix3_create()&#39;<br>
014/20:[0002] [FC] &#39;hw/pci-host/piix: Move RCR_IOPORT register definiti=
on&#39;<br>
015/20:[----] [--] &#39;hw/pci-host/piix: Define and use the PIIX IRQ Route=
 Control Registers&#39;<br>
016/20:[----] [-C] &#39;hw/pci-host/piix: Move i440FX declarations to hw/pc=
i-host/i440fx.h&#39;<br>
017/20:[----] [--] &#39;hw/pci-host/piix: Fix code style issues&#39;<br>
018/20:[----] [--] &#39;hw/pci-host/piix: Extract PIIX3 functions to hw/isa=
/piix3.c&#39;<br>
019/20:[----] [--] &#39;hw/pci-host: Rename incorrectly named &#39;piix&#39=
; as &#39;i440fx&#39;&#39;<br>
020/20:[0004] [FC] &#39;hw/pci-host/i440fx: Remove the last PIIX3 traces&#3=
9;<br>
<br>
Previous cover:<br>
<br>
This series is a rework of &quot;piix4: cleanup and improvements&quot; [2]<=
br>
from Herv=C3=A9, and my &quot;remove i386/pc dependency: PIIX cleanup&quot;=
 [3].<br>
<br>
Still trying to remove the strong X86/PC dependency 2 years later,<br>
one step at a time.<br>
Here we split the PIIX3 southbridge from i440FX northbridge.<br>
The i440FX northbridge is only used by the PC machine, while the<br>
PIIX southbridge is also used by the Malta MIPS machine.<br>
<br>
This is also a step forward using KConfig with the Malta board.<br>
Without this split, it was impossible to compile the Malta without<br>
pulling various X86 pieces of code.<br>
<br>
The overall design cleanup is not yet perfect, but enough to post<br>
as a series.<br>
<br>
Now that the PIIX3 code is extracted, the code duplication with the<br>
PIIX4 chipset is obvious. Not worth improving for now because it<br>
isn&#39;t broken.<br>
<br>
Based-on: &lt;<a href=3D"mailto:1572097538-18898-1-git-send-email-pbonzini@=
redhat.com">1572097538-18898-1-git-send-email-pbonzini@redhat.com</a>&gt;<b=
r>
to include:<br>
mc146818rtc: Allow call object_initialize(MC146818_<wbr>RTC) instead of rtc=
_init()<br>
<a href=3D"https://mid.mail-archive.com/20191018133547.10936-1-philmd@redha=
t.com" target=3D"_blank">https://mid.mail-archive.com/<wbr>20191018133547.1=
0936-1-philmd@<wbr>redhat.com</a><br>
<br>
Since Aleksandar offered me to send the pull request [4] I plan to do<br>
it once Paolo&#39;s pull [5] is merged.<br>
<br></blockquote><div><br></div><div>Philippe,</div><div><br></div><div>I a=
ttempted the other day the integration of v2 of this series into MIPS pull =
request, but couldn&#39;t do it - since another series of yours was already=
 merged, acting on the same code, making rebasing difficult. Now this, v3, =
series can&#39;t be applied since certain patches in some, on surface, unre=
lated series aren&#39;t megred, and v3 assumes they are merged.</div><div><=
br></div><div>If you send a series, it should preferably be based on the la=
test (current) code base, not on some imagined future state.</div><div><br>=
</div><div>Why did you create this such mess with interdependencies of your=
 own multiple series, and just right before softfreeze? :( You should have =
distributed submitting those series over longer time interval, and absolute=
ly avoid, if possible, this hectic around-softfreeze period. You did the op=
posite: waited for softfreeze to become close, and sent several interdepend=
ant series in matter of days - creating stress without any real technical r=
eason.</div><div><br></div><div>In case you, for any reason, can&#39;t comp=
lete this by softfreeze, I advice you not to rush, and postpone the integra=
tion to 5.0.</div><div><br></div><div>Thanks,</div><div>Aleksandar</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
Phil.<br>
<br>
CI results:<br>
<a href=3D"https://travis-ci.org/philmd/qemu/builds/603253987" target=3D"_b=
lank">https://travis-ci.org/philmd/<wbr>qemu/builds/603253987</a><br>
<a href=3D"https://app.shippable.com/github/philmd/qemu/runs/550/summary/co=
nsole" target=3D"_blank">https://app.shippable.com/<wbr>github/philmd/qemu/=
runs/550/<wbr>summary/console</a><br>
<br>
[0] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg046=
62.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html/qemu-dev=
el/2019-10/<wbr>msg04662.html</a><br>
[1] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg036=
85.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html/qemu-dev=
el/2019-10/<wbr>msg03685.html</a><br>
[2] <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737=
.html" target=3D"_blank">https://www.mail-archive.com/<wbr>qemu-devel@nongn=
u.org/<wbr>msg500737.html</a><br>
[3] <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081=
.html" target=3D"_blank">https://www.mail-archive.com/<wbr>qemu-devel@nongn=
u.org/<wbr>msg504081.html</a><br>
[4] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg049=
59.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html/qemu-dev=
el/2019-10/<wbr>msg04959.html</a><br>
[5] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg073=
39.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html/qemu-dev=
el/2019-10/<wbr>msg07339.html</a><br>
<br>
Herv=C3=A9 Poussineau (5):<br>
=C2=A0 piix4: Add the Reset Control Register<br>
=C2=A0 piix4: Add an i8259 Interrupt Controller as specified in datasheet<b=
r>
=C2=A0 piix4: Rename PIIX4 object to piix4-isa<br>
=C2=A0 piix4: Add an i8257 DMA Controller as specified in datasheet<br>
=C2=A0 piix4: Add an i8254 PIT Controller as specified in datasheet<br>
<br>
Philippe Mathieu-Daud=C3=A9 (15):<br>
=C2=A0 MAINTAINERS: Keep PIIX4 South Bridge separate from PC Chipsets<br>
=C2=A0 Revert &quot;irq: introduce qemu_irq_proxy()&quot;<br>
=C2=A0 piix4: Add a MC146818 RTC Controller as specified in datasheet<br>
=C2=A0 hw/mips/mips_malta: Create IDE hard drive array dynamically<br>
=C2=A0 hw/mips/mips_malta: Extract the PIIX4 creation code as piix4_create(=
)<br>
=C2=A0 hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c<br>
=C2=A0 hw/i386: Remove obsolete LoadStateHandler::load_state_<wbr>old handl=
ers<br>
=C2=A0 hw/pci-host/piix: Extract piix3_create()<br>
=C2=A0 hw/pci-host/piix: Move RCR_IOPORT register definition<br>
=C2=A0 hw/pci-host/piix: Define and use the PIIX IRQ Route Control Register=
s<br>
=C2=A0 hw/pci-host/piix: Move i440FX declarations to hw/pci-host/i440fx.h<b=
r>
=C2=A0 hw/pci-host/piix: Fix code style issues<br>
=C2=A0 hw/pci-host/piix: Extract PIIX3 functions to hw/isa/piix3.c<br>
=C2=A0 hw/pci-host: Rename incorrectly named &#39;piix&#39; as &#39;i440fx&=
#39;<br>
=C2=A0 hw/pci-host/i440fx: Remove the last PIIX3 traces<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 42 +--<br>
=C2=A0hw/core/irq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 -<br>
=C2=A0hw/i386/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 +-<br>
=C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A0hw/intc/apic_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 49 ----<br>
=C2=A0hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/isa/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 399 +++++++++++++++++++++++++++++<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 151 ++++++++++-<br>
=C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 46 +---<br>
=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +-<br>
=C2=A0hw/pci-host/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 =
+-<br>
=C2=A0hw/pci-host/{piix.c =3D&gt; i440fx.c} | 424 +------------------------=
-----<wbr>-<br>
=C2=A0hw/timer/i8254_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 =
---<br>
=C2=A0include/hw/acpi/piix4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 -<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 ---<br>
=C2=A0include/hw/irq.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0include/hw/isa/isa.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/pci-host/i440fx.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0include/hw/southbridge/piix.h=C2=A0 =C2=A0 |=C2=A0 74 ++++++<br>
=C2=A0stubs/pci-host-piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A026 files changed, 699 insertions(+), 683 deletions(-)<br>
=C2=A0create mode 100644 hw/isa/piix3.c<br>
=C2=A0rename hw/pci-host/{piix.c =3D&gt; i440fx.c} (58%)<br>
=C2=A0delete mode 100644 include/hw/acpi/piix4.h<br>
=C2=A0create mode 100644 include/hw/pci-host/i440fx.h<br>
=C2=A0create mode 100644 include/hw/southbridge/piix.h<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000becf960595df8c56--


--===============3423181742954870852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3423181742954870852==--

