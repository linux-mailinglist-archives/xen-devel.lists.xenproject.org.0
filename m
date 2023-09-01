Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132D790142
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 19:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594710.928120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc7j5-00008r-6X; Fri, 01 Sep 2023 17:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594710.928120; Fri, 01 Sep 2023 17:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc7j5-00005O-3E; Fri, 01 Sep 2023 17:14:31 +0000
Received: by outflank-mailman (input) for mailman id 594710;
 Fri, 01 Sep 2023 17:14:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo8w=ER=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qc7j3-00005I-RI
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 17:14:29 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 016f0cc6-48eb-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 19:14:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-500b0f06136so4114775e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Sep 2023 10:14:27 -0700 (PDT)
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
X-Inumbo-ID: 016f0cc6-48eb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693588467; x=1694193267; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjDbzrnGSnUK7H0wJDD3glLnq1OAJMvqikMxhZu2eAg=;
        b=Byl/8DundIjGc5w/MUusoNrOa12D2aeKG3RFz9hGJ8dkmTCVWsnGkFTzg2Ye7esVSV
         93wVe0QeIXryzY3N6FCIdNcfuCtbO0v1rU+cJLqU4yZcPeQsOFfG7EJnrpn274o84+CN
         JLBb5AvT+hgOMa6FRtckKlmt0Kt0wu6ZgS3ouOSw3rv6gKyUBMqXbyVKAnkahrEymqWS
         f+CH4b8OqcRh6ABk17NhpRD4KcRt01BSTEwL4hCNYIwusD/78PoU5waOPed1YypnDeVf
         K8LIhQkRGy3Eqt7cmd8QpMUdkzz2Jxpr6bknpBpmujXhKYPZ1RKr2qqaUnFrSYKXSAlY
         7ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693588467; x=1694193267;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjDbzrnGSnUK7H0wJDD3glLnq1OAJMvqikMxhZu2eAg=;
        b=WSjRxR3SUbkxgh0MnSAGFupbhXkbOp775Mo6SWammlcfJ7kidNtPuMdffejSgPZE4I
         /6PiX8rNMlivUt97mGefYC9HnSRhRm4pXVeaQFJ+7QbqR5I92sa9R1Sq1t3yXQ343yl+
         FXVR+u43wjGXEpkCCW07d0VRucBjLjh/gE9I5/d7NyYPq3dSdxg+/VtWtqEIrCrZADoh
         rV8EEn6UeB9DwAQx8OtzSx+BUi8OG2iVyCielsC8F7290EA5k1MOfOAI/T06Oej7KytE
         48uI3qq1/WIJMCmHGpDhoeEjO3BcYUpvZXMKHVKvHiLiugnF8e2+OjwwJ5/yhYPef/gE
         T2rA==
X-Gm-Message-State: AOJu0YyziL2YPhNShb5oXSBJfPGP6jhcZJ0mRl1cMgqUskeGp2deQWhN
	L4h1IC3CB0mui2gWi09yqGF4YVIaSPIPLdTzc74I/PNj
X-Google-Smtp-Source: AGHT+IGw/K7DDCdPCi4pM+XZZvgv4ALT099vrc4/tSVBBSORcaiDl0VxdSRL0QXYMZrtyEwbvnf3Q8Josi12m/k8JBE=
X-Received: by 2002:a05:6512:2214:b0:4ff:a02e:a53f with SMTP id
 h20-20020a056512221400b004ffa02ea53fmr2642379lfu.52.1693588466449; Fri, 01
 Sep 2023 10:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693583721.git.oleksii.kurochko@gmail.com> <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
In-Reply-To: <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Fri, 1 Sep 2023 19:14:15 +0200
Message-ID: <CAMacjJz4-Zd8ferGuZKh83qiUCw_hh91Rep903Qys6pAx3kDfQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to asm-generic
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f03f8a06044f4ae3"

--000000000000f03f8a06044f4ae3
Content-Type: text/plain; charset="UTF-8"

The change which adds generic-y += vm_event.h to ARM's Kbuild was lost
during creation of the patch. Should be added in the next patch version

On Fri, Sep 1, 2023, 18:02 Oleksii Kurochko <oleksii.kurochko@gmail.com>
wrote:

> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> asm-generic dir.
>
> Original asm/vm_event.h from ARM was updated:
>  * use SPDX-License-Identifier.
>  * update comment messages of stubs.
>  * update #ifdef.
>  * change public/domctl.h to public/vm_event.h.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in V4:
>  - update path of vm_event.h from include/asm-generic/asm to
> include/asm-generic
> ---
> Changes in V3:
>  - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen:
> move arm/include/asm/vm_event.h to asm-generic"
>  - update SPDX tag.
>  - move asm/vm_event.h to asm-generic.
> ---
> Changes in V2:
>  - change public/domctl.h to public/vm_event.h.
>  - update commit message of [PATCH v2 2/2] xen: move
> arm/include/asm/vm_event.h to stubs
> ---
>  xen/include/asm-generic/vm_event.h | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 xen/include/asm-generic/vm_event.h
>
> diff --git a/xen/include/asm-generic/vm_event.h
> b/xen/include/asm-generic/vm_event.h
> new file mode 100644
> index 0000000000..620c7b971c
> --- /dev/null
> +++ b/xen/include/asm-generic/vm_event.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +/*
> + * vm_event.h: stubs for architecture specific vm_event handling routines
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + */
> +
> +#ifndef __ASM_GENERIC_VM_EVENT_H__
> +#define __ASM_GENERIC_VM_EVENT_H__
> +
> +#include <xen/sched.h>
> +#include <public/vm_event.h>
> +
> +static inline int vm_event_init_domain(struct domain *d)
> +{
> +    /* Nothing to do. */
> +    return 0;
> +}
> +
> +static inline void vm_event_cleanup_domain(struct domain *d)
> +{
> +    memset(&d->monitor, 0, sizeof(d->monitor));
> +}
> +
> +static inline void vm_event_toggle_singlestep(struct domain *d, struct
> vcpu *v,
> +                                              vm_event_response_t *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t
> *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_sync_event(struct vcpu *v, bool value)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_reset_vmtrace(struct vcpu *v)
> +{
> +    /* Nothing to do. */
> +}
> +
> +#endif /* __ASM_GENERIC_VM_EVENT_H__ */
> --
> 2.41.0
>
>

--000000000000f03f8a06044f4ae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The change which adds generic-y +=3D vm_event.h to ARM&#3=
9;s Kbuild was lost during creation of the patch. Should be added in the ne=
xt patch version=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Sep 1, 2023, 18:02 Oleksii Kurochko &lt;<a hr=
ef=3D"mailto:oleksii.kurochko@gmail.com">oleksii.kurochko@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">asm/vm_event.h is common fo=
r ARM and RISC-V so it will be moved to<br>
asm-generic dir.<br>
<br>
Original asm/vm_event.h from ARM was updated:<br>
=C2=A0* use SPDX-License-Identifier.<br>
=C2=A0* update comment messages of stubs.<br>
=C2=A0* update #ifdef.<br>
=C2=A0* change public/domctl.h to public/vm_event.h.<br>
<br>
Signed-off-by: Oleksii Kurochko &lt;<a href=3D"mailto:oleksii.kurochko@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">oleksii.kurochko@gmail.com</a>&=
gt;<br>
Acked-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" =
target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>&gt;<br>
---<br>
Changes in V4:<br>
=C2=A0- update path of vm_event.h from include/asm-generic/asm to include/a=
sm-generic<br>
---<br>
Changes in V3:<br>
=C2=A0- add Acked-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@=
kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini@kernel.org</a>=
&gt; for &quot;xen: move arm/include/asm/vm_event.h to asm-generic&quot;<br=
>
=C2=A0- update SPDX tag.<br>
=C2=A0- move asm/vm_event.h to asm-generic.<br>
---<br>
Changes in V2:<br>
=C2=A0- change public/domctl.h to public/vm_event.h.<br>
=C2=A0- update commit message of [PATCH v2 2/2] xen: move arm/include/asm/v=
m_event.h to stubs<br>
---<br>
=C2=A0xen/include/asm-generic/vm_event.h | 55 +++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 55 insertions(+)<br>
=C2=A0create mode 100644 xen/include/asm-generic/vm_event.h<br>
<br>
diff --git a/xen/include/asm-generic/vm_event.h b/xen/include/asm-generic/v=
m_event.h<br>
new file mode 100644<br>
index 0000000000..620c7b971c<br>
--- /dev/null<br>
+++ b/xen/include/asm-generic/vm_event.h<br>
@@ -0,0 +1,55 @@<br>
+/* SPDX-License-Identifier:=C2=A0 GPL-2.0-only */<br>
+/*<br>
+ * vm_event.h: stubs for architecture specific vm_event handling routines<=
br>
+ *<br>
+ * Copyright (c) 2015 Tamas K Lengyel (<a href=3D"mailto:tamas@tklengyel.c=
om" target=3D"_blank" rel=3D"noreferrer">tamas@tklengyel.com</a>)<br>
+ */<br>
+<br>
+#ifndef __ASM_GENERIC_VM_EVENT_H__<br>
+#define __ASM_GENERIC_VM_EVENT_H__<br>
+<br>
+#include &lt;xen/sched.h&gt;<br>
+#include &lt;public/vm_event.h&gt;<br>
+<br>
+static inline int vm_event_init_domain(struct domain *d)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static inline void vm_event_cleanup_domain(struct domain *d)<br>
+{<br>
+=C2=A0 =C2=A0 memset(&amp;d-&gt;monitor, 0, sizeof(d-&gt;monitor));<br>
+}<br>
+<br>
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcp=
u *v,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vm_event_response_t *rsp)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+}<br>
+<br>
+static inline<br>
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *r=
sp)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+}<br>
+<br>
+static inline<br>
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+}<br>
+<br>
+static inline<br>
+void vm_event_sync_event(struct vcpu *v, bool value)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+}<br>
+<br>
+static inline<br>
+void vm_event_reset_vmtrace(struct vcpu *v)<br>
+{<br>
+=C2=A0 =C2=A0 /* Nothing to do. */<br>
+}<br>
+<br>
+#endif /* __ASM_GENERIC_VM_EVENT_H__ */<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div>

--000000000000f03f8a06044f4ae3--

