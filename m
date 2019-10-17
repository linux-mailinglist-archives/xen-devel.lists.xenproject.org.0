Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7ADB0AE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7Hz-0008SA-UR; Thu, 17 Oct 2019 15:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7Hy-0008S2-Po
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:02:06 +0000
X-Inumbo-ID: 15643a1c-f0ef-11e9-beca-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15643a1c-f0ef-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 15:02:06 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id s22so2157431otr.6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=V3T+1azaMg8NUc9PO9jV2L5D2pl3K6geSnd7GbRgO0g=;
 b=F+eHOyXVsh6t3wEA1YUsddrsm4eQb+ddP7zJw0ik0Huxs6jvW27NTdvxsBJAlP2Xc5
 4Yywje6GYOLulBwneOK5sGa3pUZfS3ofECu72/bi94jzshCh6c63qh4D/dHAGWCzhLgd
 i9C/01ybPe5To80K9XV0doMtquTGURapEagG0yn2FQo8izUlBGLdVo40tOW72npraeof
 5IBtfBRT87gAflNX+zf0yJ4z+3HGb7sXVh3BF6/IAQuj8p09/W4mwp7BA8MWAH32XLT/
 w0NOTTZHY8pyD5nvhMMWP+NwSj7vvBziMKe5bOrmSh6kTIUmR/QO86C1jjibCcT+2HC2
 Mrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=V3T+1azaMg8NUc9PO9jV2L5D2pl3K6geSnd7GbRgO0g=;
 b=Bwh6mTVo47fyFUcsC0w0pltzVwGU5vi4S71rtKi4ijDywRydUbHlGWyNC5p9dbmnm6
 p3YNjfu4hEii6Hh8FQlb+ie/9exS8Z7FtGa69RccRir/LNiHCmmg1ujfY4Gic378NfER
 f32Ijf8KqAwmAH4ENXbDIxxu4fx2puRRF+Hvx01AM/o8KDxNEoBr4ccI2EYrjG+Omj3Q
 HfV5oipNxGixcV+LOt57jfONvKKK/SZpmSCnzeaN0eLiRkvJDBzbBtZfdjiBK/ajMagS
 mg30yNqEcW8juwVob9STd32RpCIuNhCzELNB/HrkTEImSlMu1WPuD6ci1dzeKAAGaVAS
 rvUw==
X-Gm-Message-State: APjAAAU76FAnXFiQ2afAP/InoQ81Y4sZ49LlBGishAzYGC2YDTCoLqNN
 /v5+lCMwNKWy8YZ4UN7Ljcah11I+MtzF7KF3xqs=
X-Google-Smtp-Source: APXvYqyrU9aaOe5JLw52+PJAGLKf5ISS7fmybl6MLdyj3TO5lWzr8SBUelK5f5TBnqVykPQUzg2Iv3XF60Pcze4mF9s=
X-Received: by 2002:a9d:684c:: with SMTP id c12mr3506598oto.341.1571324525196; 
 Thu, 17 Oct 2019 08:02:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:02:02
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-5-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-5-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:02:02 +0200
Message-ID: <CAL1e-=jOiMe2--=ht0Wgwh0a_At=sDhUzX7EkNU86nPt230a-g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 04/32] mc146818rtc: Move RTC_ISA_IRQ
 definition
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============4213621335246324163=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4213621335246324163==
Content-Type: multipart/alternative; boundary="00000000000026bad505951c80e1"

--00000000000026bad505951c80e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The ISA default number for the RTC devices is not related to its
> registers neither. Move this definition to "hw/timer/mc146818rtc.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/timer/mc146818rtc.h      | 2 ++
>  include/hw/timer/mc146818rtc_regs.h | 2 --
>  tests/rtc-test.c                    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
>
Philippe, do this and related patches clash with your recent reorganization
of timers/rtcs?

A.



> diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/
> mc146818rtc.h
> index 0f1c886e5b..17761cf6d9 100644
> --- a/include/hw/timer/mc146818rtc.h
> +++ b/include/hw/timer/mc146818rtc.h
> @@ -39,6 +39,8 @@ typedef struct RTCState {
>      QLIST_ENTRY(RTCState) link;
>  } RTCState;
>
> +#define RTC_ISA_IRQ 8
> +
>  ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                               qemu_irq intercept_irq);
>  void rtc_set_memory(ISADevice *dev, int addr, int val);
> diff --git a/include/hw/timer/mc146818rtc_regs.h b/include/hw/timer/
> mc146818rtc_regs.h
> index bfbb57e570..631f71cfd9 100644
> --- a/include/hw/timer/mc146818rtc_regs.h
> +++ b/include/hw/timer/mc146818rtc_regs.h
> @@ -27,8 +27,6 @@
>
>  #include "qemu/timer.h"
>
> -#define RTC_ISA_IRQ 8
> -
>  #define RTC_SECONDS             0
>  #define RTC_SECONDS_ALARM       1
>  #define RTC_MINUTES             2
> diff --git a/tests/rtc-test.c b/tests/rtc-test.c
> index 6309b0ef6c..18f895690f 100644
> --- a/tests/rtc-test.c
> +++ b/tests/rtc-test.c
> @@ -15,6 +15,7 @@
>
>  #include "libqtest-single.h"
>  #include "qemu/timer.h"
> +#include "hw/timer/mc146818rtc.h"
>  #include "hw/timer/mc146818rtc_regs.h"
>
>  #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
> --
> 2.21.0
>
>
>

--00000000000026bad505951c80e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
The ISA default number for the RTC devices is not related to its<br>
registers neither. Move this definition to &quot;hw/timer/mc146818rtc.h&quo=
t;.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/timer/mc146818rtc.h=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0include/hw/timer/mc146818rtc_<wbr>regs.h | 2 --<br>
=C2=A0tests/rtc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A03 files changed, 3 insertions(+), 2 deletions(-)<br>
<br></blockquote><div><br></div><div>Philippe, do this and related patches =
clash with your recent reorganization of timers/rtcs?</div><div><br></div><=
div>A.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/include/hw/timer/<wbr>mc146818rtc.h b/include/hw/timer/<wbr>mc=
146818rtc.h<br>
index 0f1c886e5b..17761cf6d9 100644<br>
--- a/include/hw/timer/<wbr>mc146818rtc.h<br>
+++ b/include/hw/timer/<wbr>mc146818rtc.h<br>
@@ -39,6 +39,8 @@ typedef struct RTCState {<br>
=C2=A0 =C2=A0 =C2=A0QLIST_ENTRY(RTCState) link;<br>
=C2=A0} RTCState;<br>
<br>
+#define RTC_ISA_IRQ 8<br>
+<br>
=C2=A0ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);<br>
=C2=A0void rtc_set_memory(ISADevice *dev, int addr, int val);<br>
diff --git a/include/hw/timer/<wbr>mc146818rtc_regs.h b/include/hw/timer/<w=
br>mc146818rtc_regs.h<br>
index bfbb57e570..631f71cfd9 100644<br>
--- a/include/hw/timer/<wbr>mc146818rtc_regs.h<br>
+++ b/include/hw/timer/<wbr>mc146818rtc_regs.h<br>
@@ -27,8 +27,6 @@<br>
<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
<br>
-#define RTC_ISA_IRQ 8<br>
-<br>
=C2=A0#define RTC_SECONDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0#define RTC_SECONDS_ALARM=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
=C2=A0#define RTC_MINUTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
diff --git a/tests/rtc-test.c b/tests/rtc-test.c<br>
index 6309b0ef6c..18f895690f 100644<br>
--- a/tests/rtc-test.c<br>
+++ b/tests/rtc-test.c<br>
@@ -15,6 +15,7 @@<br>
<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
+#include &quot;hw/timer/mc146818rtc.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc_regs.h&quot;<br>
<br>
=C2=A0#define UIP_HOLD_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(8 * =
NANOSECONDS_PER_SECOND / 32768)<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000026bad505951c80e1--


--===============4213621335246324163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4213621335246324163==--

