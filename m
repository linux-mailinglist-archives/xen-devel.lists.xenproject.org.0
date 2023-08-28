Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F778BAD1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591809.924325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakRn-0007VR-41; Mon, 28 Aug 2023 22:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591809.924325; Mon, 28 Aug 2023 22:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakRn-0007SV-04; Mon, 28 Aug 2023 22:10:59 +0000
Received: by outflank-mailman (input) for mailman id 591809;
 Mon, 28 Aug 2023 22:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlNL=EN=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1qakRl-0007R2-N4
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:10:57 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2dfccfe-45ef-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:10:56 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so5750843e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 15:10:56 -0700 (PDT)
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
X-Inumbo-ID: c2dfccfe-45ef-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693260656; x=1693865456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pm/yDoVrGNtEmYF9yEGMyBaULNerhK+FexTs4L/jq1Q=;
        b=J026VufGph2F9K3iHQEkvEeBd69rCcHAwNGyHjKAinZUCgblTChHh8KoP347VeKgoO
         LNa6pNxKh0v+CZPOTFEUbKBtA/knStl+geUCGM4x76V9/F2FcfprOx8UqtYDoP49gohA
         a9VXa7qBRYdkbSBL7MNqL1SV4nc3vI9JzIA+3Vl/q5PcM9kU6wxjgPZSalTEZK1Fq51J
         gRsL39xTj/cUEAeL97FrMwDZCBn7gwyPOUDhKeIFKLZP9LBz5dmOLRZeN5UVswDkI/6h
         JQV4Gc2RxncKs9linaIAI+sZqDqWP0yAavfL7InhmSizxN/Lp1WRXRcAwbcWkUpasVVh
         32WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693260656; x=1693865456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm/yDoVrGNtEmYF9yEGMyBaULNerhK+FexTs4L/jq1Q=;
        b=WwauEiG0rjf9TId2ov+Ek0uhvzOmmGkZmoKb/yB23fWv3dOwOXticBRV5qbFxHj4SS
         jJtzZ/E3SsZDfFvWmyQhb3u+sxuxQ2VqVNDtsEyW7umEQUT0O9kXFio1NUjlNrCKp3MB
         0V/eCVIS6eToTGcE2B/4KJWTROMNIKpps1XeMTgVob5LjZRPCxzg6fInWHmHiaAR6rAj
         XIXdLLbw87yO40NSKQyq0CCn4nfcMv56xT5IlrPWx+0uMf+VeZNiNnT72sB062/Ve1fL
         T5l+Op3WgVBlgGFg4Z55n27KGUGs5WyRHBoRCO16EfnFPH56oVMotOqwel8yQ6yuOUKA
         6PFA==
X-Gm-Message-State: AOJu0YxMJ9KUAbaFbZHbi1kk0+8y+qYC1hajZP61eq4COXUusLhlts6N
	6RU9p/3vdgJpoz8fybkpTNqryUWKeNh1SxQLR+4=
X-Google-Smtp-Source: AGHT+IGptMAJ53NJYNKJJjLpbbJCvdRLYtQpnr1ZnagjkbazwfxtMLyjqVvl4g72CUfrYwjeDkZqYOSuTmRuvTAUoCI=
X-Received: by 2002:a05:6512:4003:b0:500:848a:80df with SMTP id
 br3-20020a056512400300b00500848a80dfmr19597978lfb.66.1693260655674; Mon, 28
 Aug 2023 15:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
In-Reply-To: <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 28 Aug 2023 18:10:44 -0400
Message-ID: <CAJ=z9a2hnjCAkGN_YtCQRh8ZcyMMawxBhF8LOwgrQ5-nML1chg@mail.gmail.com>
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Directive 4.10
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com, sstabellini@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e4c9f2060402f772"

--000000000000e4c9f2060402f772
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 28 Aug 2023 at 09:20, Simone Ballarin <simone.ballarin@bugseng.com>
wrote:

> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
>
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
>
> Mechanical change.
>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/arm/efi/efi-boot.h          | 6 ++++++
>  xen/arch/arm/include/asm/hypercall.h | 6 +++---
>  xen/arch/arm/include/asm/iocap.h     | 6 +++---
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 1c3640bb65..aba522ead5 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef __ARM_EFI_EFI_BOOT_H__
> +#define __ARM_EFI_EFI_BOOT_H__
> +
>  #include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <asm/setup.h>
> @@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const
> void *vaddr, UINTN size)
>      __flush_dcache_area(vaddr, size);
>  }
>
> +#endif /* __ARM_EFI_EFI_BOOT_H__*/
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/include/asm/hypercall.h
> b/xen/arch/arm/include/asm/hypercall.h
> index ccd26c5184..4f4d96f1f2 100644
> --- a/xen/arch/arm/include/asm/hypercall.h
> +++ b/xen/arch/arm/include/asm/hypercall.h
> @@ -1,10 +1,10 @@
> +#ifndef __ASM_ARM_HYPERCALL_H__
> +#define __ASM_ARM_HYPERCALL_H__
> +
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include
> xen/hypercall.h instead"
>  #endif
>
> -#ifndef __ASM_ARM_HYPERCALL_H__
> -#define __ASM_ARM_HYPERCALL_H__
> -


I understand that you are trying to fix a misra violation. However, this
feels like it was done on purpose.

With the new change, you would not always check that the file were included
at the correct place. I am not against this change but this ought to be
explained.


>  #include <public/domctl.h> /* for arch_do_domctl */
>
>  long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> diff --git a/xen/arch/arm/include/asm/iocap.h
> b/xen/arch/arm/include/asm/iocap.h
> index 276fefbc59..4db1b16839 100644
> --- a/xen/arch/arm/include/asm/iocap.h
> +++ b/xen/arch/arm/include/asm/iocap.h
> @@ -1,10 +1,10 @@
> -#ifndef __X86_IOCAP_H__
> -#define __X86_IOCAP_H__
> +#ifndef __ASM_ARM_IOCAP_H__
> +#define __ASM_ARM_IOCAP_H__
>
>  #define cache_flush_permitted(d)                        \
>      (!rangeset_is_empty((d)->iomem_caps))
>
> -#endif
> +#endif /* __ASM_ARM_IOCAP_H__ */


I don=E2=80=99t understand how this is related to the rest of the patch. Yo=
u wrote
that inclusion must appear first and this is the case here.

However the name is technically not correct. Is this really related to
directive 4.10? If so, this should be clarified in the commit message. If
not, then I think this should be in a separate commit.

Cheers,


>
>  /*
>   * Local variables:
> --
> 2.34.1
>
>

--000000000000e4c9f2060402f772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Aug 2023 at 09=
:20, Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@bugseng.com">sim=
one.ballarin@bugseng.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Add or move inclusion guards to address violations of<br>
MISRA C:2012 Directive 4.10 (&quot;Precautions shall be taken in order<br>
to prevent the contents of a header file being included more than<br>
once&quot;).<br>
<br>
Inclusion guards must appear at the beginning of the headers<br>
(comments are permitted anywhere).<br>
<br>
Mechanical change.<br>
<br>
Signed-off-by: Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@bugsen=
g.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/arm/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++=
+++<br>
=C2=A0xen/arch/arm/include/asm/hypercall.h | 6 +++---<br>
=C2=A0xen/arch/arm/include/asm/iocap.h=C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A03 files changed, 12 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h<br>
index 1c3640bb65..aba522ead5 100644<br>
--- a/xen/arch/arm/efi/efi-boot.h<br>
+++ b/xen/arch/arm/efi/efi-boot.h<br>
@@ -3,6 +3,10 @@<br>
=C2=A0 * is intended to be included by common/efi/boot.c _only_, and<br>
=C2=A0 * therefore can define arch specific global variables.<br>
=C2=A0 */<br>
+<br>
+#ifndef __ARM_EFI_EFI_BOOT_H__<br>
+#define __ARM_EFI_EFI_BOOT_H__<br>
+<br>
=C2=A0#include &lt;xen/device_tree.h&gt;<br>
=C2=A0#include &lt;xen/libfdt/libfdt.h&gt;<br>
=C2=A0#include &lt;asm/setup.h&gt;<br>
@@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const v=
oid *vaddr, UINTN size)<br>
=C2=A0 =C2=A0 =C2=A0__flush_dcache_area(vaddr, size);<br>
=C2=A0}<br>
<br>
+#endif /* __ARM_EFI_EFI_BOOT_H__*/<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Local variables:<br>
=C2=A0 * mode: C<br>
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/as=
m/hypercall.h<br>
index ccd26c5184..4f4d96f1f2 100644<br>
--- a/xen/arch/arm/include/asm/hypercall.h<br>
+++ b/xen/arch/arm/include/asm/hypercall.h<br>
@@ -1,10 +1,10 @@<br>
+#ifndef __ASM_ARM_HYPERCALL_H__<br>
+#define __ASM_ARM_HYPERCALL_H__<br>
+<br>
=C2=A0#ifndef __XEN_HYPERCALL_H__<br>
=C2=A0#error &quot;asm/hypercall.h should not be included directly - includ=
e xen/hypercall.h instead&quot;<br>
=C2=A0#endif<br>
<br>
-#ifndef __ASM_ARM_HYPERCALL_H__<br>
-#define __ASM_ARM_HYPERCALL_H__<br>
-</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I understand th=
at you are trying to fix a misra violation. However, this feels like it was=
 done on purpose.</div><div dir=3D"auto"><br></div><div dir=3D"auto">With t=
he new change, you would not always check that the file were included at th=
e correct place. I am not against this change but this ought to be explaine=
d.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
=C2=A0#include &lt;public/domctl.h&gt; /* for arch_do_domctl */<br>
<br>
=C2=A0long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,<b=
r>
diff --git a/xen/arch/arm/include/asm/iocap.h b/xen/arch/arm/include/asm/io=
cap.h<br>
index 276fefbc59..4db1b16839 100644<br>
--- a/xen/arch/arm/include/asm/iocap.h<br>
+++ b/xen/arch/arm/include/asm/iocap.h<br>
@@ -1,10 +1,10 @@<br>
-#ifndef __X86_IOCAP_H__<br>
-#define __X86_IOCAP_H__<br>
+#ifndef __ASM_ARM_IOCAP_H__<br>
+#define __ASM_ARM_IOCAP_H__<br>
<br>
=C2=A0#define cache_flush_permitted(d)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0(!rangeset_is_empty((d)-&gt;iomem_caps))<br>
<br>
-#endif<br>
+#endif /* __ASM_ARM_IOCAP_H__ */</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">I don=E2=80=99t understand how this is related to the rest=
 of the patch. You wrote that inclusion must appear first and this is the c=
ase here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However the na=
me is technically not correct. Is this really related to directive 4.10? If=
 so, this should be clarified in the commit message. If not, then I think t=
his should be in a separate commit.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
=C2=A0/*<br>
=C2=A0 * Local variables:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000e4c9f2060402f772--

