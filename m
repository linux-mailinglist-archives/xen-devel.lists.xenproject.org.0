Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD31A211F2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 20:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878778.1288968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqsS-0000fB-9l; Tue, 28 Jan 2025 19:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878778.1288968; Tue, 28 Jan 2025 19:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqsS-0000cF-6Q; Tue, 28 Jan 2025 19:04:00 +0000
Received: by outflank-mailman (input) for mailman id 878778;
 Tue, 28 Jan 2025 19:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8nr=UU=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tcqsQ-0000c9-NS
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 19:03:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a04477da-ddaa-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 20:03:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e3621518so3175340f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 11:03:57 -0800 (PST)
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
X-Inumbo-ID: a04477da-ddaa-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738091037; x=1738695837; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E9des8+uKNTqFkgwRy/Jni2WaoGo4jFNwW33xKg+mEE=;
        b=IX/hIOqwuzsabmshsdrtxEzc5YZ1PeM4NNSEVS98ywApJRLFhQA6fELampIkd5XYO0
         jfj8PM0cAC9fax32/TrQeb3nG6mQadxi5B7AhqMogw1BZPM3BBBPPzKhprEebevrAB0E
         9atzehRNJwtojNM/fr+f5wJ5bmuSLt8watZy1L2nxwgnHLLeRF3oRcAp1G+YpRgdbD0Z
         24oYr72Npu3nO+G5Q8Wk6wRsR0bYYEBHtJb3LcX7c5+ogAE6FcVclxfTofI9Oy6mA6Ba
         IEe8UMoSVHRXzUguSa8uR92HwTgURDpd/D528zMfSq/OZKYAYVj5hPrJy36PSou/GU0D
         IlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738091037; x=1738695837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9des8+uKNTqFkgwRy/Jni2WaoGo4jFNwW33xKg+mEE=;
        b=S3H6ZC2hKgUDBsap2oUJAF11WHzdkcdPNfIPK3e+e4NO8rKk/RKN3FX5avAHunZLSJ
         iYfvX8rs7Efr7/qXNoht5PRyeMqMsrGL6WNgJlftO0BRmLelKVvbvfWXWs9F2VzrA5GV
         u3Z3VKBObjzxK3QXTpB0a7BvDNDwQ/27bcbXXP5+6yvOfQ4I8EkozAkOWqIzu8TznfM0
         46j8mthrfty9e/IPkmYb0XtZupHQYnhe9qQr2gr7OFfndS9HTI0VGtIbkam6F/CaAkc1
         Rqcwz2Q2ESNaDkL+jk8V1BVMiOl/EbYa5kYA6aiXexfVyMLKLdhOugDe+7Y5xx8s4rzL
         7HrQ==
X-Gm-Message-State: AOJu0YyuWG5mbMzmdT/PZvGbPPHc1cb4N9m3YyP8/gSp7bJD4GVaBdR6
	cX7wSW1lRSb2SmQKlKSfD3AVHAvul7n+bh6KeUBpY2dq6k62tzA9tpzbyEJEq75MKjSOsYpcMTJ
	WIWzyqjpe+bNxJCnbctQ/6vOBNdo=
X-Gm-Gg: ASbGncszfTAY7YfaEV/aN0oxoraWvd3B5Arf28JckH5M1soZw7oJKjyKlT7zWyH8J+W
	I2iiehcDFcweM8jrB/xYl3ND9QHNe0CR6l4/wX+VTgV/R1pUF+fFInkO04y4XQpkVaMzQTx0=
X-Google-Smtp-Source: AGHT+IES9C0uxBhBvZlHAAssZ3d3a3KnNV+hSY6mN2zNVjcftfXEN76umZ0Rd35GYh42V0hQqG+fVrpgPQuk42c6kkQ=
X-Received: by 2002:adf:f504:0:b0:38b:e109:1e0d with SMTP id
 ffacd0b85a97d-38c520b6629mr135714f8f.49.1738091036665; Tue, 28 Jan 2025
 11:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20250128094002.145755-1-michal.orzel@amd.com> <20250128094002.145755-2-michal.orzel@amd.com>
In-Reply-To: <20250128094002.145755-2-michal.orzel@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 28 Jan 2025 16:03:44 -0300
X-Gm-Features: AWEUYZmzu1Y8pm78xYAsiHyAQFMIxdPHdWeKJYrZed6AHoIunNplOtPsugDKDMc
Message-ID: <CAJ=z9a2m3UY=asS6zMtVu0sxSGZdK2vEk4if69DndGzsVcM8wg@mail.gmail.com>
Subject: Re: [for-4.20][PATCH v2 1/2] device-tree: bootfdt: Fix build issue
 when CONFIG_PHYS_ADDR_T_32=y
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	oleksii.kurochko@gmail.com
Content-Type: multipart/alternative; boundary="000000000000d3eea1062cc8da35"

--000000000000d3eea1062cc8da35
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 06:40, Michal Orzel <michal.orzel@amd.com> wrote:

> On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
> common/device-tree/bootfdt.c: In function 'build_assertions':
> ./include/xen/macros.h:47:31: error: static assertion failed:
> "!(alignof(struct membanks) != 8)"
>    47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond
> ")"); })
>       |                               ^~~~~~~~~~~~~~
> common/device-tree/bootfdt.c:31:5: note: in expansion of macro
> 'BUILD_BUG_ON'
>    31 |     BUILD_BUG_ON(alignof(struct membanks) != 8);
>
> When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,
> therefore the struct membanks alignment is 4B and not 8B. The check is
> there to ensure the struct membanks and struct membank, which is a
> member of the former, are equally aligned. Therefore modify the check to
> compare alignments obtained via alignof not to rely on hardcoded
> values.
>
> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory
> bank structures")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Reviewed-by: Julien Grall <julien@xen.org>

Cheers,



> ---
> Changes in v2:
>  - modify the check to test against alignment of struct membank
> ---
>  xen/common/device-tree/bootfdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/device-tree/bootfdt.c
> b/xen/common/device-tree/bootfdt.c
> index 47386d4fffea..529c91e603ab 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)
>       */
>      BUILD_BUG_ON((offsetof(struct membanks, bank) !=
>                   offsetof(struct meminfo, bank)));
> -    /* Ensure "struct membanks" is 8-byte aligned */
> -    BUILD_BUG_ON(alignof(struct membanks) != 8);
> +    /* Ensure "struct membanks" and "struct membank" are equally aligned
> */
> +    BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));
>  }
>
>  static bool __init device_tree_node_is_available(const void *fdt, int
> node)
> --
> 2.25.1
>
>

--000000000000d3eea1062cc8da35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 28 Jan 2025 at 06:40, Michal Orzel &lt;<a href=
=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Arm32, when CONFIG_PHYS_ADDR_T_32 is s=
et, a build failure is observed:<br>
common/device-tree/bootfdt.c: In function &#39;build_assertions&#39;:<br>
./include/xen/macros.h:47:31: error: static assertion failed: &quot;!(align=
of(struct membanks) !=3D 8)&quot;<br>
=C2=A0 =C2=A047 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), &qu=
ot;!(&quot; #cond &quot;)&quot;); })<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~<b=
r>
common/device-tree/bootfdt.c:31:5: note: in expansion of macro &#39;BUILD_B=
UG_ON&#39;<br>
=C2=A0 =C2=A031 |=C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(alignof(struct membanks) =
!=3D 8);<br>
<br>
When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long,<br>
therefore the struct membanks alignment is 4B and not 8B. The check is<br>
there to ensure the struct membanks and struct membank, which is a<br>
member of the former, are equally aligned. Therefore modify the check to<br=
>
compare alignments obtained via alignof not to rely on hardcoded<br>
values.<br>
<br>
Fixes: 2209c1e35b47 (&quot;xen/arm: Introduce a generic way to access memor=
y bank structures&quot;)<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
Release-Acked-by: Oleksii Kurochko &lt;<a href=3D"mailto:oleksii.kurochko@g=
mail.com" target=3D"_blank">oleksii.kurochko@gmail.com</a>&gt;</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Julien Grall &lt=
;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt;</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
---<br>
Changes in v2:<br>
=C2=A0- modify the check to test against alignment of struct membank<br>
---<br>
=C2=A0xen/common/device-tree/bootfdt.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/boot=
fdt.c<br>
index 47386d4fffea..529c91e603ab 100644<br>
--- a/xen/common/device-tree/bootfdt.c<br>
+++ b/xen/common/device-tree/bootfdt.c<br>
@@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)<=
br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON((offsetof(struct membanks, bank) !=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(str=
uct meminfo, bank)));<br>
-=C2=A0 =C2=A0 /* Ensure &quot;struct membanks&quot; is 8-byte aligned */<b=
r>
-=C2=A0 =C2=A0 BUILD_BUG_ON(alignof(struct membanks) !=3D 8);<br>
+=C2=A0 =C2=A0 /* Ensure &quot;struct membanks&quot; and &quot;struct memba=
nk&quot; are equally aligned */<br>
+=C2=A0 =C2=A0 BUILD_BUG_ON(alignof(struct membanks) !=3D alignof(struct me=
mbank));<br>
=C2=A0}<br>
<br>
=C2=A0static bool __init device_tree_node_is_available(const void *fdt, int=
 node)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000d3eea1062cc8da35--

