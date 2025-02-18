Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4667A3A341
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892138.1301139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQr9-0006cO-AF; Tue, 18 Feb 2025 16:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892138.1301139; Tue, 18 Feb 2025 16:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQr9-0006ZF-6y; Tue, 18 Feb 2025 16:53:59 +0000
Received: by outflank-mailman (input) for mailman id 892138;
 Tue, 18 Feb 2025 16:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p1uV=VJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tkQr8-0006Z9-Am
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:53:58 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1977a31-ee18-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 17:53:57 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ded46f323fso7516323a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:53:57 -0800 (PST)
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
X-Inumbo-ID: f1977a31-ee18-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739897637; x=1740502437; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Acb0jfafFBvGRn8ztsO8g3jMuK72zhcxVEVRGIlU1Vs=;
        b=QmJUkE1dawzbgPY0nvDTW/4ObcuilUACE84hBVcqDG3njJqy3zPsmdWXWPvBoFKHly
         dmL5aghka3GdLZkjRKdYlspOQJu0884hD7zpXaTe4OcD7ZG3h4v13vngunTj218EH0R1
         Dcwa76m3ZuYk69amXJjAAAZx1BGMKLtVawQejC8301jhzi2mVIPaLySLfgY55pFJ33nM
         Hfx3rrSwTEoNMS/qy4r7Bq9zcFAsSExfPvpVrM1m6Ny/8dY5v95CDJk+4f/39WPYOivh
         9ce33Yf6J4blZOaM4P41nxR9o0Y2hYbwYN8wp+5qa9AHhrHdh6r1LrDOHZVyM9Ny85pi
         09CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897637; x=1740502437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Acb0jfafFBvGRn8ztsO8g3jMuK72zhcxVEVRGIlU1Vs=;
        b=Pd7RlemI5RZKchAt6I9QDnEKljGzoZ/6KINYY3usAGVe8xrk4jH2swrKkrBrJQLaKQ
         tXtujgYlUsiDNbGESofvICutmIRQOmNZXPHmQrdhQQ//tIRvypWUiU6q76AgsvtX7puP
         RFAR35gvyGAGV85S0vHVu4x9J4CSimtRcmlq6wJo1QrwgfYNvJqcsCO4W737EzVVxdVT
         2QKadcRkld2lPnUE5cmSXfOWrN2YvDqWrhOsW7jumS/CLKKOEjstsUt0NyC+rd2J84Dh
         7RP6TT1yBvhTpG8YMsa/K7KrbVQ3srDPX4SN2nSJ1g7NE+2na518X2dH34oT34xcxUzY
         JSEw==
X-Forwarded-Encrypted: i=1; AJvYcCWydiBjuCOr/avQDHfWtYx5GYiYn+/V3rNpRfFlzYdqcdFYzsiHLbHnOSvGC7nBHWk8k9PSN5sqmao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL84bqBW01o03ZTZLSkaOFnW3ZSWV+jlb5WI/Fd0E84FmQBYwU
	GnapXfsZQw1hifw41BNULmBjFzlMupMxMdKoz7JjouwONFL+Jddb2NjaCpYFITS9ZIUJGPgIl8a
	CVPGP67/cQK+i0L87OO7jr5o4pdw=
X-Gm-Gg: ASbGncsk1klq0kbCaW/08sB1NX6vXcsO8AuNsBRVcqlnFkbsHMYOW/dZLsrSh+YwHie
	wTNF5xDx7mSyHMlI5/k3DvIMfNfvp/huBeUPArMHwrRT25nag8vMv6eNRdzxpPa5wq+fM+TqA
X-Google-Smtp-Source: AGHT+IE82RdGpOOQt788QYI3K5YCt9GM1K2GlWlFLbzIFEDHHwfwC7nTpn0uHDYFjBGQFnqR1ULjYxJ3fSiQwLQNOvY=
X-Received: by 2002:a05:6402:27d2:b0:5e0:892f:89ae with SMTP id
 4fb4d7f45d1cf-5e0894fdf59mr103476a12.4.1739897636603; Tue, 18 Feb 2025
 08:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20250218162618.46167-1-philmd@linaro.org> <20250218162618.46167-5-philmd@linaro.org>
In-Reply-To: <20250218162618.46167-5-philmd@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 18 Feb 2025 10:53:44 -0600
X-Gm-Features: AWEUYZn5LuwzDkSx-rCRGTZteyxVR1TO-BVtf7sL7mpzeZj8f9Gh31H3E0RzwDk
Message-ID: <CAJy5ezqZcT5gSGhy1tmXK_j439j2YRbc68sThQEWPoJ0qT6Z2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] hw/xen/xen-pvh: Reduce included headers
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
Content-Type: multipart/alternative; boundary="000000000000934ffe062e6d7ceb"

--000000000000934ffe062e6d7ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philm=
d@linaro.org>
wrote:

> Have "hw/xen/xen-pvh-common.h" include the bare minimal set
> of headers. Adapt sources to avoid errors when refactoring
> unrelated headers such:
>
>     hw/i386/xen/xen-pvh.c: In function =E2=80=98xen_pvh_machine_class_ini=
t=E2=80=99:
>     hw/i386/xen/xen-pvh.c:84:28: error: =E2=80=98TARGET_DEFAULT_CPU_TYPE=
=E2=80=99
> undeclared (first use in this function)
>        84 |     mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
>           |                            ^~~~~~~~~~~~~~~~~~~~~~~
>     hw/xen/xen-pvh-common.c: In function =E2=80=98xen_pvh_init=E2=80=99:
>     hw/xen/xen-pvh-common.c:217:43: error: =E2=80=98MiB=E2=80=99 undeclar=
ed (first use in
> this function)
>       217 |         if (s->cfg.pci_ecam.size !=3D 256 * MiB) {
>           |                                           ^~~
>     hw/xen/xen-hvm-common.c:18:6: error: no previous prototype for
> =E2=80=98xen_mr_is_memory=E2=80=99 [-Werror=3Dmissing-prototypes]
>        18 | bool xen_mr_is_memory(MemoryRegion *mr)
>           |      ^~~~~~~~~~~~~~~~
>
>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/xen/xen-pvh-common.h | 8 ++++----
>  hw/i386/xen/xen-pvh.c           | 1 +
>  hw/xen/xen-pvh-common.c         | 6 ++----
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/xen/xen-pvh-common.h
> b/include/hw/xen/xen-pvh-common.h
> index 5cdd23c2f4d..17c5a58a5a4 100644
> --- a/include/hw/xen/xen-pvh-common.h
> +++ b/include/hw/xen/xen-pvh-common.h
> @@ -9,11 +9,11 @@
>  #ifndef XEN_PVH_COMMON_H__
>  #define XEN_PVH_COMMON_H__
>
> -#include <assert.h>
> -#include "hw/sysbus.h"
> -#include "hw/hw.h"
> -#include "hw/xen/xen-hvm-common.h"
> +#include "exec/memory.h"
> +#include "qom/object.h"
> +#include "hw/boards.h"
>  #include "hw/pci-host/gpex.h"
> +#include "hw/xen/xen-hvm-common.h"
>
>  #define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME("xen-pvh-base")
>  OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,
> diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> index 33c10279763..f6356f2a7ed 100644
> --- a/hw/i386/xen/xen-pvh.c
> +++ b/hw/i386/xen/xen-pvh.c
> @@ -14,6 +14,7 @@
>  #include "hw/xen/arch_hvm.h"
>  #include <xen/hvm/hvm_info_table.h>
>  #include "hw/xen/xen-pvh-common.h"
> +#include "target/i386/cpu.h"
>
>  #define TYPE_XEN_PVH_X86  MACHINE_TYPE_NAME("xenpvh")
>  OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index 9c21fa858d3..19876ad7e8d 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -7,15 +7,13 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "qemu/error-report.h"
> -#include "qapi/error.h"
> +#include "qemu/units.h"
>  #include "qapi/visitor.h"
>  #include "hw/boards.h"
>  #include "hw/irq.h"
> -#include "hw/sysbus.h"
> -#include "system/system.h"
>  #include "system/tpm.h"
>  #include "system/tpm_backend.h"
> +#include "system/runstate.h"
>  #include "hw/xen/xen-pvh-common.h"
>  #include "trace.h"
>
> --
> 2.47.1
>
>

--000000000000934ffe062e6d7ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 18, 2025 at 10:26=E2=80=AFAM =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd=
@linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_conta=
iner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Have &quot;hw/xen/x=
en-pvh-common.h&quot; include the bare minimal set<br>
of headers. Adapt sources to avoid errors when refactoring<br>
unrelated headers such:<br>
<br>
=C2=A0 =C2=A0 hw/i386/xen/xen-pvh.c: In function =E2=80=98xen_pvh_machine_c=
lass_init=E2=80=99:<br>
=C2=A0 =C2=A0 hw/i386/xen/xen-pvh.c:84:28: error: =E2=80=98TARGET_DEFAULT_C=
PU_TYPE=E2=80=99 undeclared (first use in this function)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A084 |=C2=A0 =C2=A0 =C2=A0mc-&gt;default_cpu_type =
=3D TARGET_DEFAULT_CPU_TYPE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~=
~~~~~~~~<br>
=C2=A0 =C2=A0 hw/xen/xen-pvh-common.c: In function =E2=80=98xen_pvh_init=E2=
=80=99:<br>
=C2=A0 =C2=A0 hw/xen/xen-pvh-common.c:217:43: error: =E2=80=98MiB=E2=80=99 =
undeclared (first use in this function)<br>
=C2=A0 =C2=A0 =C2=A0 217 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;cfg.p=
ci_ecam.size !=3D 256 * MiB) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>
=C2=A0 =C2=A0 hw/xen/xen-hvm-common.c:18:6: error: no previous prototype fo=
r =E2=80=98xen_mr_is_memory=E2=80=99 [-Werror=3Dmissing-prototypes]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A018 | bool xen_mr_is_memory(MemoryRegion *mr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~<b=
r>
<br></blockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;</div>=
<div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/xen/xen-pvh-common.h | 8 ++++----<br>
=C2=A0hw/i386/xen/xen-pvh.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<b=
r>
=C2=A0hw/xen/xen-pvh-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++----<b=
r>
=C2=A03 files changed, 7 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-commo=
n.h<br>
index 5cdd23c2f4d..17c5a58a5a4 100644<br>
--- a/include/hw/xen/xen-pvh-common.h<br>
+++ b/include/hw/xen/xen-pvh-common.h<br>
@@ -9,11 +9,11 @@<br>
=C2=A0#ifndef XEN_PVH_COMMON_H__<br>
=C2=A0#define XEN_PVH_COMMON_H__<br>
<br>
-#include &lt;assert.h&gt;<br>
-#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;hw/hw.h&quot;<br>
-#include &quot;hw/xen/xen-hvm-common.h&quot;<br>
+#include &quot;exec/memory.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/pci-host/gpex.h&quot;<br>
+#include &quot;hw/xen/xen-hvm-common.h&quot;<br>
<br>
=C2=A0#define TYPE_XEN_PVH_MACHINE MACHINE_TYPE_NAME(&quot;xen-pvh-base&quo=
t;)<br>
=C2=A0OBJECT_DECLARE_TYPE(XenPVHMachineState, XenPVHMachineClass,<br>
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c<br>
index 33c10279763..f6356f2a7ed 100644<br>
--- a/hw/i386/xen/xen-pvh.c<br>
+++ b/hw/i386/xen/xen-pvh.c<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;hw/xen/arch_hvm.h&quot;<br>
=C2=A0#include &lt;xen/hvm/hvm_info_table.h&gt;<br>
=C2=A0#include &quot;hw/xen/xen-pvh-common.h&quot;<br>
+#include &quot;target/i386/cpu.h&quot;<br>
<br>
=C2=A0#define TYPE_XEN_PVH_X86=C2=A0 MACHINE_TYPE_NAME(&quot;xenpvh&quot;)<=
br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(XenPVHx86State, XEN_PVH_X86)<br>
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c<br>
index 9c21fa858d3..19876ad7e8d 100644<br>
--- a/hw/xen/xen-pvh-common.c<br>
+++ b/hw/xen/xen-pvh-common.c<br>
@@ -7,15 +7,13 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;qemu/error-report.h&quot;<br>
-#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
-#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;system/system.h&quot;<br>
=C2=A0#include &quot;system/tpm.h&quot;<br>
=C2=A0#include &quot;system/tpm_backend.h&quot;<br>
+#include &quot;system/runstate.h&quot;<br>
=C2=A0#include &quot;hw/xen/xen-pvh-common.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
-- <br>
2.47.1<br>
<br>
</blockquote></div></div>

--000000000000934ffe062e6d7ceb--

