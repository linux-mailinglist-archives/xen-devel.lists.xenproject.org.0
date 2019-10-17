Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01964DB093
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:00:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7Dz-0007bX-Su; Thu, 17 Oct 2019 14:57:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7Dy-0007bS-6s
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:57:58 +0000
X-Inumbo-ID: 8130e458-f0ee-11e9-a531-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8130e458-f0ee-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 14:57:57 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m19so2171632otp.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UO8y+iLdG9g2V4CwYbvIhKno0T8jlsZTKpOiMonsgII=;
 b=aoXEWvL8/r6DsnGg4Pzz8TVq1YVKHkv8Ridi7m0t88Ze9/gpMrEhhEoSgOSTQ+fWJ7
 kFrnwtwYFQEi+i4qQY5V+gfhzw72t9dUC75mMmsNEDCNiT6EJrJTMZaPw0V6ghyWjzca
 z8Vd6IUvshIipGtbu5Kd6G2oKZgbYVP16C4Y4OVM8tN1yuqVwr6cYA/kthPcOW5qJI1T
 Tn++LIs4hZJOV9T5q/cWKpLAmybTeN8B7Rl7NwSzF6YbjMldW+idzBGC6QOMfBl+txUZ
 AbdfQ9mWnHDr0VEguPg6Q9gn8SIiidEaSeIqeuEn0pEDncWqAHKnS7BUXOASPS8t/eNd
 3/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UO8y+iLdG9g2V4CwYbvIhKno0T8jlsZTKpOiMonsgII=;
 b=lBjj+b9pgUzU+g28RGdW9iGWT3OYezlYGOEv2wvQY9U249sRBIRbInDSoMQbAfHzr+
 IqX7cbnx0lSE7+UrebR+ErPrzbQj7VAbe+kkQqC4PCLcUAgCMKwrIWEIf7XVMmOwGagY
 zcg8h8yrKdeKyODYcpAyAx+Qg4TPtjnjMzvLQgntygqrVBj2tRsClo1X/9QMWZKH+LFY
 lKjl9lDXHU6fN+pTPqcRFn9puz3DdB8egBDbo8/4btU2/vTqvDdqAU/9ui2UB3WU2CnB
 ffIVjCUG6uBFR2mlM7Wi79o7DMQBWxYlKIlhd66A68RgaeqC6vELkjKKHAbKOoWXXRz+
 C1cA==
X-Gm-Message-State: APjAAAXdyfq14NyCqDaocUIgtQvSSkyK08UtQwo8yNq2fkY7+6q13e1l
 VTINgc213OyqBpzGW2sny4qfGRAJnxs8IAgsF1k=
X-Google-Smtp-Source: APXvYqwWAe+vSjSgjnG+5YAXfAGJX878tAPFljp8f/R9dQSCsB1wmfCOPr/krIrieBGxbclPDXbcwlgf6NAkmGruHdg=
X-Received: by 2002:a9d:5914:: with SMTP id t20mr3341811oth.306.1571324276848; 
 Thu, 17 Oct 2019 07:57:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:57:56
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-3-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-3-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:57:56 +0200
Message-ID: <CAL1e-=iC9hR-jqTSu9c6KtgiNWFwftnTMq9W87NWFPb37hjCoA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 02/32] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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
Content-Type: multipart/mixed; boundary="===============0227274570616633481=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0227274570616633481==
Content-Type: multipart/alternative; boundary="000000000000593e2905951c7108"

--000000000000593e2905951c7108
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> Move the KVM-related call to "sysemu/kvm.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/i386/pc.h | 1 -
>  include/sysemu/kvm.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>
Is there any other similar case in our code base?

A.



> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 6df4f4b6fb..09e74e7764 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -158,7 +158,6 @@ typedef struct PCMachineClass {
>
>  extern DeviceState *isa_pic;
>  qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
> -qemu_irq *kvm_i8259_init(ISABus *bus);
>  int pic_read_irq(DeviceState *d);
>  int pic_get_output(DeviceState *d);
>
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 9d143282bc..da8aa9f5a8 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -513,6 +513,7 @@ void kvm_irqchip_set_qemuirq_gsi(KVMState *s,
> qemu_irq irq, int gsi);
>  void kvm_pc_gsi_handler(void *opaque, int n, int level);
>  void kvm_pc_setup_irq_routing(bool pci_enabled);
>  void kvm_init_irq_routing(KVMState *s);
> +qemu_irq *kvm_i8259_init(ISABus *bus);
>
>  /**
>   * kvm_arch_irqchip_create:
> --
> 2.21.0
>
>
>

--000000000000593e2905951c7108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Move the KVM-related call to &quot;sysemu/kvm.h&quo=
t;.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/i386/pc.h | 1 -<br>
=C2=A0include/sysemu/kvm.h | 1 +<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
<br></blockquote><div><br></div><div>Is there any other similar case in our=
 code base?</div><div><br></div><div>A.</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index 6df4f4b6fb..09e74e7764 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -158,7 +158,6 @@ typedef struct PCMachineClass {<br>
<br>
=C2=A0extern DeviceState *isa_pic;<br>
=C2=A0qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);<br>
-qemu_irq *kvm_i8259_init(ISABus *bus);<br>
=C2=A0int pic_read_irq(DeviceState *d);<br>
=C2=A0int pic_get_output(DeviceState *d);<br>
<br>
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h<br>
index 9d143282bc..da8aa9f5a8 100644<br>
--- a/include/sysemu/kvm.h<br>
+++ b/include/sysemu/kvm.h<br>
@@ -513,6 +513,7 @@ void kvm_irqchip_set_qemuirq_gsi(<wbr>KVMState *s, qemu=
_irq irq, int gsi);<br>
=C2=A0void kvm_pc_gsi_handler(void *opaque, int n, int level);<br>
=C2=A0void kvm_pc_setup_irq_routing(bool pci_enabled);<br>
=C2=A0void kvm_init_irq_routing(KVMState *s);<br>
+qemu_irq *kvm_i8259_init(ISABus *bus);<br>
<br>
=C2=A0/**<br>
=C2=A0 * kvm_arch_irqchip_create:<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000593e2905951c7108--


--===============0227274570616633481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0227274570616633481==--

