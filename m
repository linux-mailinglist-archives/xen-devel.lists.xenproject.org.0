Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA38A3A2F6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892085.1301099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQZz-0005Nm-5O; Tue, 18 Feb 2025 16:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892085.1301099; Tue, 18 Feb 2025 16:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQZz-0005Lp-2D; Tue, 18 Feb 2025 16:36:15 +0000
Received: by outflank-mailman (input) for mailman id 892085;
 Tue, 18 Feb 2025 16:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p1uV=VJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tkQZx-0005Ft-9H
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:36:13 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f5de087-ee16-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:35:59 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5dee07e51aaso8708516a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:35:59 -0800 (PST)
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
X-Inumbo-ID: 6f5de087-ee16-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739896559; x=1740501359; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y39IuXLb8+Yv2MA9uCKmIr6MY5yiNZEZ7BG41cUuj8Y=;
        b=GVr55pc+tmj/h1Fykq5RHM1a4+Rzegt5KHiL3F6e8fTKgM44Bu9a4gLTkFWQ281w8i
         iqPsrDu4B4LJM13nUDXvpOYL6JTfEFieUjPca2CqvlT28t9oqRcdbb8vo7SMQ6wLZmcT
         ilJ/6Lhz9kaV+9gqlk7hRzHvNJOXvYOWtln+VpOSSocYH9HDPq3NdOb+/3Nc4scCsfTu
         g+wZEN+XxEfbVWiHL8r/GvgMG9+poWA72CpUYgl7Ez+52vRRpadX2qXu9OL+to1vDes2
         5CTm+Qh8d070fz0bo1cNk7Nmr2XByBEtRhdOW4wmVTVd4A9HU/AEHjNDbqFzY/wsHB6n
         HTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896559; x=1740501359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y39IuXLb8+Yv2MA9uCKmIr6MY5yiNZEZ7BG41cUuj8Y=;
        b=qF6EdHsAIGO95ZzBBrrLnqIIc2Cf2/Q37pUipv7mb1bv5sbP/6U6lD7L7utCsiqlr2
         cVzplKRgB+DiVcJMY/b4cCJG1fD9/Z7JVR8Mh+d/fmPP4VOkyeMqSKPFsCUTtq399LxP
         uxtfo1IUEI0JItTloLlURjtk/JeA/UbiAY1DZbUjl4d73euWvKGsAVfvHwswyFWS3/sN
         E5h9oM5+lglbGodjzWbVlyZXSyt/j2Vxhlgf1h/B8g+x0hWWygu/E3lT+89wPQtmm6ER
         OncJRaWPbWoTM9UcDQzWxbThEN2coMy/3Pp/8ECLYjK2tQy52bivGrfG66stIqYzBuGb
         3A8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTMv41Mrvf2w27BgQ2N6YMBl/Cqz/LKo8UGUh5aagL3/EVKoi5nMfBQuLrzR3+UvJArPl/KNl7kWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO00taw5oo7jpIoO0/Z+ItQyUBtUJW8J7MgQ+oS45lRRvFb/Jd
	mMGD9wAKy1PN0arhOBVUgv3RmOPxRiYaSeFZ+P2DDGCB0R4pfV6duw+AB3C7HTRU8Kn5faJtzi7
	/M5koiZ2Od9nT9tUew61OfwRWrcs=
X-Gm-Gg: ASbGncukQbSLmKdJI3J4AkvsUZRiS+4Z7CutYrpL5iQf3nbF+K3GVpV5HfVRa+VErQG
	gXerlcVkP8744gUiTrv+j8OlI74nWjjXhkAtP0aIuP7ZOwLjCM0unaqPFAWOl8Fos4o6D3gYD
X-Google-Smtp-Source: AGHT+IGsi6pDp5KGIzXDY9W2Eu6c+PAcuUiMEkChzpkJPE4hiwDK0DmLJGWyZs2Hu/Why8gso05aXw6DKWENPyl43og=
X-Received: by 2002:a05:6402:5246:b0:5db:f5e9:6745 with SMTP id
 4fb4d7f45d1cf-5e035f4cbcemr15926636a12.0.1739896558995; Tue, 18 Feb 2025
 08:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20250218162618.46167-1-philmd@linaro.org> <20250218162618.46167-2-philmd@linaro.org>
In-Reply-To: <20250218162618.46167-2-philmd@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:35:45 -0600
X-Gm-Features: AWEUYZngkCBYmTsrxRCCzUblDe0MPj8n_01v-kvqpONaymoS4p_xVYJeHIFfDo4
Message-ID: <CAJy5ezoHT1RehKYvLJtU7=0SR_Ahs2AUBpu==cqvo6zVj1+vXg@mail.gmail.com>
Subject: Re: [PATCH 1/8] accel/Kconfig: Link XenPVH with GPEX PCIe bridge
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, 
	Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth <thuth@redhat.com>, 
	Jan Beulich <jbeulich@suse.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005856d9062e6d3cc9"

--0000000000005856d9062e6d3cc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> XenPVH requires the PCIe/GPEX device. Add it to Kconfig
> to avoid when configuring using --without-default-devices:
>
>   /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in
> function `xenpvh_gpex_init':
>   hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num'
>   /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in
> function `pci_dev_bus_num':
>   include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
>   /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to
> `pci_bus_num'
>   /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to
> `pci_bus_num'
>   /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to
> `pci_bus_num'
>   /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to
> `pci_bus_num'
>   /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in
> function `cpu_ioreq_config':
>   hw/xen/xen-hvm-common.c:412: undefined reference to
> `pci_host_config_read_common'
>   /usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to
> `pci_host_config_read_common'
>   /usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to
> `pci_host_config_write_common'
>
> Fixes: f22e598a72c ("hw/xen: pvh-common: Add support for creating
> PCIe/GPEX")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  accel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 794e0d18d21..4263cab7227 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -16,4 +16,5 @@ config KVM
>  config XEN
>      bool
>      select FSDEV_9P if VIRTFS
> +    select PCI_EXPRESS_GENERIC_BRIDGE
>      select XEN_BUS
> --
> 2.47.1
>
>

--0000000000005856d9062e6d3cc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">XenPVH requires the=
 PCIe/GPEX device. Add it to Kconfig<br>
to avoid when configuring using --without-default-devices:<br>
<br>
=C2=A0 /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: =
in function `xenpvh_gpex_init&#39;:<br>
=C2=A0 hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_nu=
m&#39;<br>
=C2=A0 /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: =
in function `pci_dev_bus_num&#39;:<br>
=C2=A0 include/hw/pci/pci.h:337: undefined reference to `pci_bus_num&#39;<b=
r>
=C2=A0 /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_b=
us_num&#39;<br>
=C2=A0 /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_b=
us_num&#39;<br>
=C2=A0 /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_b=
us_num&#39;<br>
=C2=A0 /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_b=
us_num&#39;<br>
=C2=A0 /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: =
in function `cpu_ioreq_config&#39;:<br>
=C2=A0 hw/xen/xen-hvm-common.c:412: undefined reference to `pci_host_config=
_read_common&#39;<br>
=C2=A0 /usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to `pc=
i_host_config_read_common&#39;<br>
=C2=A0 /usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to `pc=
i_host_config_write_common&#39;<br>
<br>
Fixes: f22e598a72c (&quot;hw/xen: pvh-common: Add support for creating PCIe=
/GPEX&quot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.ig=
lesias@amd.com">edgar.iglesias@amd.com</a>&gt;</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0accel/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/accel/Kconfig b/accel/Kconfig<br>
index 794e0d18d21..4263cab7227 100644<br>
--- a/accel/Kconfig<br>
+++ b/accel/Kconfig<br>
@@ -16,4 +16,5 @@ config KVM<br>
=C2=A0config XEN<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select FSDEV_9P if VIRTFS<br>
+=C2=A0 =C2=A0 select PCI_EXPRESS_GENERIC_BRIDGE<br>
=C2=A0 =C2=A0 =C2=A0select XEN_BUS<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--0000000000005856d9062e6d3cc9--

