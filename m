Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824B7429E3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556935.869854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtr9-0006S8-At; Thu, 29 Jun 2023 15:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556935.869854; Thu, 29 Jun 2023 15:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtr9-0006Pq-7Z; Thu, 29 Jun 2023 15:46:51 +0000
Received: by outflank-mailman (input) for mailman id 556935;
 Thu, 29 Jun 2023 15:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtr7-0006AR-Qv
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:46:49 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 282067ab-1694-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:46:48 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc0981755so5162085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:46:48 -0700 (PDT)
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
X-Inumbo-ID: 282067ab-1694-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688053607; x=1690645607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qcptGNYXouZ6DvI4j4ewjdDkrCqSPX19A4IN3FJBXl8=;
        b=YfY/9x6/Ta6bmAXA/kUn47fyY++rIUVif6tw5sHHAGul4+wy/GghxsfrmttFtxwVUi
         3ar0hUb4UCfLoQuooGY+sRTdr0faysFpkAwfA/I8V1MyfUqzhX9HjA0KQBcfYCNE4Pei
         k15Mh6JIzJTWgh/SQjLubm5kHx0Qw6ViBC01E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688053607; x=1690645607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcptGNYXouZ6DvI4j4ewjdDkrCqSPX19A4IN3FJBXl8=;
        b=NcVJyWGRdTv+jNCsCfQYgcPue1A+mQxq0RUYwpgTw4U781brj0J9ZFxSpO5iCFdVZE
         6vUj20A7POK5RoHaj0ZWlDUdre0qGXSti6isXgBhT2tVIvT1H6dIgCggoDAUN2cPbAkx
         jWi6ChDHBN3bdaGbUpYSmvKkEmBpgd6yXB3x0Klz+5ZIWQa8u1RIZ4MD5Jdgg4zQF17R
         eyOslPCNPmFrQFOYjmyD8gzdP62wjU/ph7VKc9EesnOukZzvmMuBK8PtPd+LLizecdZB
         nilEFAPI0BNe74q/fPmLGCydVV6afc2QsLdTwVMAC7Gkw4QosmBydd8KkIBiCJitVNvk
         WRAQ==
X-Gm-Message-State: AC+VfDyKYfbFPe5xQd+XGWuEdRAxOHgszTpfgO7YI2Duiw2thJRAPTqv
	+vUDsE4CaHs1fBDhW7V2t0YtWu6TW2prVykM041GjPaD6sNlqc+n
X-Google-Smtp-Source: ACHHUZ5+SRckBx33Rfc1gFu90iDK1UxCOlYPwBm0poWH2pPQ/B03yNEU+k46ES6ii48CYNSO/oZYpmwRsCQq+gb7x1I=
X-Received: by 2002:a7b:c392:0:b0:3fa:8fb1:50fe with SMTP id
 s18-20020a7bc392000000b003fa8fb150femr10869666wmj.15.1688053607327; Thu, 29
 Jun 2023 08:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com> <20230629121713.1211-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629121713.1211-2-alejandro.vallejo@cloud.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Date: Thu, 29 Jun 2023 16:46:37 +0100
Message-ID: <CAFi36o11vYv4ghCq5+gNg7uPYW-kk1oTT8k5MrnUU6Pwf9tYuw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] tools: Add __AC() macro to common-macros.h
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000a07fe605ff469b68"

--000000000000a07fe605ff469b68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM Alejandro Vallejo <
alejandro.vallejo@cloud.com> wrote:

> Currently libxl and the x86-emulator tests carry their own versions. Fact=
or
> those out into the common macros header so every library can make use of
> it. This is required so the following patch can add this macro to a heade=
r
> used both in Xen and tools/libs.
>
> No functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/include/xen-tools/common-macros.h | 3 +++
>  tools/libs/light/libxl_internal.h       | 2 --
>  tools/tests/x86_emulator/x86-emulate.h  | 3 ---
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/tools/include/xen-tools/common-macros.h
> b/tools/include/xen-tools/common-macros.h
> index 168691be0e..6d7de1bc0a 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -84,4 +84,7 @@
>      (type *)((char *)mptr__ - offsetof(type, member));  \
>  })
>
> +#define __AC(X,Y)   (X##Y)
> +#define _AC(X,Y)    __AC(X,Y)
> +
>  #endif /* __XEN_TOOLS_COMMON_MACROS__ */
> diff --git a/tools/libs/light/libxl_internal.h
> b/tools/libs/light/libxl_internal.h
> index 61f4fe1dec..1cf3d400bf 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -125,8 +125,6 @@
>  #define PVSHIM_CMDLINE "pv-shim console=3Dxen,pv"
>
>  /* Size macros. */
> -#define __AC(X,Y)   (X##Y)
> -#define _AC(X,Y)    __AC(X,Y)
>  #define MB(_mb)     (_AC(_mb, ULL) << 20)
>  #define GB(_gb)     (_AC(_gb, ULL) << 30)
>
> diff --git a/tools/tests/x86_emulator/x86-emulate.h
> b/tools/tests/x86_emulator/x86-emulate.h
> index aa1ed75ec8..350d1a0abf 100644
> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -59,9 +59,6 @@
>
>  #define cf_check /* No Control Flow Integriy checking */
>
> -#define AC_(n,t) (n##t)
> -#define _AC(n,t) AC_(n,t)
> -
>  #ifdef __GCC_ASM_FLAG_OUTPUTS__
>  # define ASM_FLAG_OUT(yes, no) yes
>  #else
> --
> 2.34.1
>

@mantainers

--000000000000a07fe605ff469b68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jun 29, 2023 at 1:17=E2=80=AFPM A=
lejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cloud.com">alejand=
ro.vallejo@cloud.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Currently libxl and the x86-=
emulator tests carry their own versions. Factor<br>
those out into the common macros header so every library can make use of<br=
>
it. This is required so the following patch can add this macro to a header<=
br>
used both in Xen and tools/libs.<br>
<br>
No functional change.<br>
<br>
Signed-off-by: Alejandro Vallejo &lt;<a href=3D"mailto:alejandro.vallejo@cl=
oud.com" target=3D"_blank">alejandro.vallejo@cloud.com</a>&gt;<br>
---<br>
=C2=A0tools/include/xen-tools/common-macros.h | 3 +++<br>
=C2=A0tools/libs/light/libxl_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br=
>
=C2=A0tools/tests/x86_emulator/x86-emulate.h=C2=A0 | 3 ---<br>
=C2=A03 files changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-to=
ols/common-macros.h<br>
index 168691be0e..6d7de1bc0a 100644<br>
--- a/tools/include/xen-tools/common-macros.h<br>
+++ b/tools/include/xen-tools/common-macros.h<br>
@@ -84,4 +84,7 @@<br>
=C2=A0 =C2=A0 =C2=A0(type *)((char *)mptr__ - offsetof(type, member));=C2=
=A0 \<br>
=C2=A0})<br>
<br>
+#define __AC(X,Y)=C2=A0 =C2=A0(X##Y)<br>
+#define _AC(X,Y)=C2=A0 =C2=A0 __AC(X,Y)<br>
+<br>
=C2=A0#endif /* __XEN_TOOLS_COMMON_MACROS__ */<br>
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_int=
ernal.h<br>
index 61f4fe1dec..1cf3d400bf 100644<br>
--- a/tools/libs/light/libxl_internal.h<br>
+++ b/tools/libs/light/libxl_internal.h<br>
@@ -125,8 +125,6 @@<br>
=C2=A0#define PVSHIM_CMDLINE &quot;pv-shim console=3Dxen,pv&quot;<br>
<br>
=C2=A0/* Size macros. */<br>
-#define __AC(X,Y)=C2=A0 =C2=A0(X##Y)<br>
-#define _AC(X,Y)=C2=A0 =C2=A0 __AC(X,Y)<br>
=C2=A0#define MB(_mb)=C2=A0 =C2=A0 =C2=A0(_AC(_mb, ULL) &lt;&lt; 20)<br>
=C2=A0#define GB(_gb)=C2=A0 =C2=A0 =C2=A0(_AC(_gb, ULL) &lt;&lt; 30)<br>
<br>
diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emula=
tor/x86-emulate.h<br>
index aa1ed75ec8..350d1a0abf 100644<br>
--- a/tools/tests/x86_emulator/x86-emulate.h<br>
+++ b/tools/tests/x86_emulator/x86-emulate.h<br>
@@ -59,9 +59,6 @@<br>
<br>
=C2=A0#define cf_check /* No Control Flow Integriy checking */<br>
<br>
-#define AC_(n,t) (n##t)<br>
-#define _AC(n,t) AC_(n,t)<br>
-<br>
=C2=A0#ifdef __GCC_ASM_FLAG_OUTPUTS__<br>
=C2=A0# define ASM_FLAG_OUT(yes, no) yes<br>
=C2=A0#else<br>
-- <br>
2.34.1<br></blockquote><div><br></div><div><a class=3D"gmail_plusreply" id=
=3D"plusReplyChip-0">@mantainers</a>=C2=A0</div></div></div>

--000000000000a07fe605ff469b68--

