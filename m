Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07FDB0AF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7G7-0008KP-8s; Thu, 17 Oct 2019 15:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7G6-0008KJ-O5
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:00:10 +0000
X-Inumbo-ID: cfa6369c-f0ee-11e9-a531-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfa6369c-f0ee-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 15:00:09 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id i185so2395132oif.9
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=M5Y5S4bU2xkOzKBGjT0DmAhs+QC4phjwSWTyUm/ZWo4=;
 b=DgOCllxVk+7vJLGmedLbu/nQL2Z9+Hb+ND/4SVae1h8tWWQueFNLYOMaAARFkLYL55
 jhsKA54/5Wdbg3bP/sDljVyiyxKJTN9R2TVC5S9WmL9eSYVpZR9AYgqUrlYDTVa6puKF
 g+b/FI5ZCfdy/f5eGnbfhqN/HR4c4ts9lGeG/IAOUSfzqxQTAJApkZ/e5jTpbJcA8RTH
 8bia4TLBp+W1pUYNuSKxv049R1VnDmGhw/SQMX7tpyuQqLO1RACt5nKxWyk2MqB4Wut6
 QnUAT2zueO5vXvcnBQDc+RoGJ3L9+p76BI4Xprpx82/R9AYLtT+QvT6MwB05EaYmooIn
 tsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=M5Y5S4bU2xkOzKBGjT0DmAhs+QC4phjwSWTyUm/ZWo4=;
 b=NDzI5yfRMcH3AxoRNZNS8kqXr8il7i64+ddWNuFhde3QRUrT8rkaEOW+aOK1S3yW/P
 uJYh5YKSq0nwv6uA1FJ5DP+lwwkUGVRPWRpeYqCu2rpNmPewkzuhLKuti7hsiIUN2ewv
 vZ7fWWhQM7m/Zq8n1O69H6oqYkuUS/tGTEYqKanDTVNN1qxmEg0mQuDlWiU9Rd1gpZK3
 /7nLMKUOFNO34GoKpy9ZvsitYZXAG3lWhkjUapnXoc4MqS8q/myG/RCwzzv+EJuIrGc/
 bBG8ELbFPiTAUklx/NNLmRd+rwsSkw+AYa9lv3xebgcz0xfA6PO+RJZJzarkDHpc5bpB
 YCAA==
X-Gm-Message-State: APjAAAUf5oF6j8SeO70ygsLyU4Hl+oL5qDmQYFhgDvOKn6ioK6ocHpqt
 duQ9x6CEee9xJrprE3p7/13mB2PiIuKLFswdP+s=
X-Google-Smtp-Source: APXvYqwlhAh0sKvyLqI7nCmavqIbjFOtTsBOMv/I2tNto28moIFL1Cj0mLBEV4gsN+xS/ZGyiMAIMkRmYIn2cXd5uzY=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3618429oib.53.1571324408479; 
 Thu, 17 Oct 2019 08:00:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:00:07
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-4-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-4-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:00:07 +0200
Message-ID: <CAL1e-=isxvTctgthzP2Z-4ETKYSZ2P8KOee7-a6K6_LPppn6iw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 03/32] mc146818rtc: move structure to header
 file
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
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============2639689482356242250=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2639689482356242250==
Content-Type: multipart/alternative; boundary="00000000000031c31505951c791d"

--00000000000031c31505951c791d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> We are now able to embed a timer in another object.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-4-hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/timer/mc146818rtc.c         | 30 ------------------------------
>  include/hw/timer/mc146818rtc.h | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 30 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
> index 6cb378751b..e40b54e743 100644
> --- a/hw/timer/mc146818rtc.c
> +++ b/hw/timer/mc146818rtc.c
> @@ -71,36 +71,6 @@
>  #define RTC_CLOCK_RATE            32768
>  #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
>
> -#define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RT=
C)
> -
> -typedef struct RTCState {
> -    ISADevice parent_obj;
> -
> -    MemoryRegion io;
> -    MemoryRegion coalesced_io;
> -    uint8_t cmos_data[128];
> -    uint8_t cmos_index;
> -    int32_t base_year;
> -    uint64_t base_rtc;
> -    uint64_t last_update;
> -    int64_t offset;
> -    qemu_irq irq;
> -    int it_shift;
> -    /* periodic timer */
> -    QEMUTimer *periodic_timer;
> -    int64_t next_periodic_time;
> -    /* update-ended timer */
> -    QEMUTimer *update_timer;
> -    uint64_t next_alarm_time;
> -    uint16_t irq_reinject_on_ack_count;
> -    uint32_t irq_coalesced;
> -    uint32_t period;
> -    QEMUTimer *coalesced_timer;
> -    LostTickPolicy lost_tick_policy;
> -    Notifier suspend_notifier;
> -    QLIST_ENTRY(RTCState) link;
> -} RTCState;
> -
>  static void rtc_set_time(RTCState *s);
>  static void rtc_update_time(RTCState *s);
>  static void rtc_set_cmos(RTCState *s, const struct tm *tm);
> diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/
> mc146818rtc.h
> index fe6ed63f71..0f1c886e5b 100644
> --- a/include/hw/timer/mc146818rtc.h
> +++ b/include/hw/timer/mc146818rtc.h
> @@ -1,10 +1,43 @@
>  #ifndef MC146818RTC_H
>  #define MC146818RTC_H
>
> +#include "qapi/qapi-types-misc.h"
> +#include "qemu/queue.h"
> +#include "qemu/timer.h"
>  #include "hw/isa/isa.h"
>  #include "hw/timer/mc146818rtc_regs.h"
>
>  #define TYPE_MC146818_RTC "mc146818rtc"
> +#define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RT=
C)
> +
> +typedef struct RTCState {
> +    ISADevice parent_obj;
> +
> +    MemoryRegion io;
> +    MemoryRegion coalesced_io;
> +    uint8_t cmos_data[128];
> +    uint8_t cmos_index;
> +    int32_t base_year;
> +    uint64_t base_rtc;
> +    uint64_t last_update;
> +    int64_t offset;
> +    qemu_irq irq;
> +    int it_shift;
> +    /* periodic timer */
> +    QEMUTimer *periodic_timer;
> +    int64_t next_periodic_time;
> +    /* update-ended timer */
> +    QEMUTimer *update_timer;
> +    uint64_t next_alarm_time;
> +    uint16_t irq_reinject_on_ack_count;
> +    uint32_t irq_coalesced;
> +    uint32_t period;
> +    QEMUTimer *coalesced_timer;
> +    Notifier clock_reset_notifier;
> +    LostTickPolicy lost_tick_policy;
> +    Notifier suspend_notifier;
> +    QLIST_ENTRY(RTCState) link;
> +} RTCState;
>
>  ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                               qemu_irq intercept_irq);
> --
> 2.21.0
>
>
>

--00000000000031c31505951c791d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
We are now able to embed a timer in another object.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-4-hpoussin@reactos.o=
rg">20171216090228.28505-4-hpoussin@reactos.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/timer/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 --------=
----------------------<br>
=C2=A0include/hw/timer/mc146818rtc.h | 33 ++++++++++++++++++++++++++++++<wb=
r>+++<br>
=C2=A02 files changed, 33 insertions(+), 30 deletions(-)<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dbfeb33c93ed97" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;margin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_1=
6dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div c=
lass=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: A=
leksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"=
_blank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div><=
/div><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" ta=
bindex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:bo=
th"></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=
=3D"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16d=
bfecd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcrepl=
y_16dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=
=3D"V j td"></div></div></div></div></div></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c<br>
index 6cb378751b..e40b54e743 100644<br>
--- a/hw/timer/mc146818rtc.c<br>
+++ b/hw/timer/mc146818rtc.c<br>
@@ -71,36 +71,6 @@<br>
=C2=A0#define RTC_CLOCK_RATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32768=
<br>
=C2=A0#define UIP_HOLD_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(8 * =
NANOSECONDS_PER_SECOND / 32768)<br>
<br>
-#define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RTC)=
<br>
-<br>
-typedef struct RTCState {<br>
-=C2=A0 =C2=A0 ISADevice parent_obj;<br>
-<br>
-=C2=A0 =C2=A0 MemoryRegion io;<br>
-=C2=A0 =C2=A0 MemoryRegion coalesced_io;<br>
-=C2=A0 =C2=A0 uint8_t cmos_data[128];<br>
-=C2=A0 =C2=A0 uint8_t cmos_index;<br>
-=C2=A0 =C2=A0 int32_t base_year;<br>
-=C2=A0 =C2=A0 uint64_t base_rtc;<br>
-=C2=A0 =C2=A0 uint64_t last_update;<br>
-=C2=A0 =C2=A0 int64_t offset;<br>
-=C2=A0 =C2=A0 qemu_irq irq;<br>
-=C2=A0 =C2=A0 int it_shift;<br>
-=C2=A0 =C2=A0 /* periodic timer */<br>
-=C2=A0 =C2=A0 QEMUTimer *periodic_timer;<br>
-=C2=A0 =C2=A0 int64_t next_periodic_time;<br>
-=C2=A0 =C2=A0 /* update-ended timer */<br>
-=C2=A0 =C2=A0 QEMUTimer *update_timer;<br>
-=C2=A0 =C2=A0 uint64_t next_alarm_time;<br>
-=C2=A0 =C2=A0 uint16_t irq_reinject_on_ack_count;<br>
-=C2=A0 =C2=A0 uint32_t irq_coalesced;<br>
-=C2=A0 =C2=A0 uint32_t period;<br>
-=C2=A0 =C2=A0 QEMUTimer *coalesced_timer;<br>
-=C2=A0 =C2=A0 LostTickPolicy lost_tick_policy;<br>
-=C2=A0 =C2=A0 Notifier suspend_notifier;<br>
-=C2=A0 =C2=A0 QLIST_ENTRY(RTCState) link;<br>
-} RTCState;<br>
-<br>
=C2=A0static void rtc_set_time(RTCState *s);<br>
=C2=A0static void rtc_update_time(RTCState *s);<br>
=C2=A0static void rtc_set_cmos(RTCState *s, const struct tm *tm);<br>
diff --git a/include/hw/timer/<wbr>mc146818rtc.h b/include/hw/timer/<wbr>mc=
146818rtc.h<br>
index fe6ed63f71..0f1c886e5b 100644<br>
--- a/include/hw/timer/<wbr>mc146818rtc.h<br>
+++ b/include/hw/timer/<wbr>mc146818rtc.h<br>
@@ -1,10 +1,43 @@<br>
=C2=A0#ifndef MC146818RTC_H<br>
=C2=A0#define MC146818RTC_H<br>
<br>
+#include &quot;qapi/qapi-types-misc.h&quot;<br>
+#include &quot;qemu/queue.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc_regs.h&quot;<br>
<br>
=C2=A0#define TYPE_MC146818_RTC &quot;mc146818rtc&quot;<br>
+#define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RTC)=
<br>
+<br>
+typedef struct RTCState {<br>
+=C2=A0 =C2=A0 ISADevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion io;<br>
+=C2=A0 =C2=A0 MemoryRegion coalesced_io;<br>
+=C2=A0 =C2=A0 uint8_t cmos_data[128];<br>
+=C2=A0 =C2=A0 uint8_t cmos_index;<br>
+=C2=A0 =C2=A0 int32_t base_year;<br>
+=C2=A0 =C2=A0 uint64_t base_rtc;<br>
+=C2=A0 =C2=A0 uint64_t last_update;<br>
+=C2=A0 =C2=A0 int64_t offset;<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+=C2=A0 =C2=A0 int it_shift;<br>
+=C2=A0 =C2=A0 /* periodic timer */<br>
+=C2=A0 =C2=A0 QEMUTimer *periodic_timer;<br>
+=C2=A0 =C2=A0 int64_t next_periodic_time;<br>
+=C2=A0 =C2=A0 /* update-ended timer */<br>
+=C2=A0 =C2=A0 QEMUTimer *update_timer;<br>
+=C2=A0 =C2=A0 uint64_t next_alarm_time;<br>
+=C2=A0 =C2=A0 uint16_t irq_reinject_on_ack_count;<br>
+=C2=A0 =C2=A0 uint32_t irq_coalesced;<br>
+=C2=A0 =C2=A0 uint32_t period;<br>
+=C2=A0 =C2=A0 QEMUTimer *coalesced_timer;<br>
+=C2=A0 =C2=A0 Notifier clock_reset_notifier;<br>
+=C2=A0 =C2=A0 LostTickPolicy lost_tick_policy;<br>
+=C2=A0 =C2=A0 Notifier suspend_notifier;<br>
+=C2=A0 =C2=A0 QLIST_ENTRY(RTCState) link;<br>
+} RTCState;<br>
<br>
=C2=A0ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000031c31505951c791d--


--===============2639689482356242250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2639689482356242250==--

