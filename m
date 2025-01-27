Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F9A1D53C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877759.1287908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN9y-0008Gx-BI; Mon, 27 Jan 2025 11:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877759.1287908; Mon, 27 Jan 2025 11:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcN9y-0008Fy-7m; Mon, 27 Jan 2025 11:20:06 +0000
Received: by outflank-mailman (input) for mailman id 877759;
 Mon, 27 Jan 2025 11:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zo7v=UT=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tcN9w-00080G-SG
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:20:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a71ba185-dca0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 12:20:03 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38637614567so2007700f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:20:03 -0800 (PST)
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
X-Inumbo-ID: a71ba185-dca0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737976802; x=1738581602; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mXfdOJ+RgG7pJjUQf0zW2Jw1uQOQIvQ/648lA6oQ02Q=;
        b=OsDSyHpl1TXee9HUbEoYgw40rkSCoJq69145oZ32i+YIrSa+8w0IJFPbaWoBV69ire
         0JUZGOsijToFgIyFn51fiYDrz3eAynK7cZle20r/ReJndSMN54CumSzKdBiV6VMkBoE4
         gSyjTRdZK9jX9Hw4l6wzM8OettdMF7pcUm0nLZpxnKJPY6Cf++PyznTXPSf4XEY2mbjT
         XQ24ZIYlLdFt7eEwIRfJ4D9GlJszt6ApEmBhCBSQk2MUmmQQ6oWwXPJ+lcktv5b3twLF
         8M+AV/INfRcv6dJLd9G4g9ag2HzacXA6PnGpp8UAvvdZ0gtOT44zCJN9kWE1h6hgcK65
         7juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976802; x=1738581602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXfdOJ+RgG7pJjUQf0zW2Jw1uQOQIvQ/648lA6oQ02Q=;
        b=jnTMK1YchX+se5cknM10kgfWP/YwRSVIEGyBmuxtKtuoIBOrqVcWdWMIZF4iIl3UZt
         MVpjX5e/cIPaX6FztkasMSGvp7khox76IzJc6h0+euNp71kXkNQrn61THdya8HN4snm4
         h6NpGnjmICt9KDk5+ZU+QPGZq1c+34+LH7a5xywW/MFLqF2uwZXm867m3hdioGR35qpf
         LRFrMbcOyxdq6cuSDeKNc2WUtAIGUirryS/vrEi2c/RZWYTRFl/Aqgy/uZUZEuh0TRly
         DRCCgjNqJZ8iczZMjd4KdgEX0MpqflzHtY88VDaCJfVKh1PbVSSDy6i/QSc4nieAnTVh
         7Djg==
X-Gm-Message-State: AOJu0YwvViEOBE5jhRPKwp4NL6rL7/jteHw1CzX7Botjs87R61Mf7B+2
	iCQze/t6o8rN6APZ1+ln1ory8U6ZFoj9QLBxDvdOKRNWvJkthVDlif1mBX0uCLnbIyZ2ydU6u0R
	nL9etouw+ne7Oh9Gt9kBztp7DOh4=
X-Gm-Gg: ASbGncsH3YqqZ4dIdM4ZBgKG9aYqE9XSjZtMpbRiIHc7xHRVVBzXtV7Vt2HZJzX/UH+
	1kHMSiNGN8UnnIcN093QNxRCBeSx3BHpQPU1vb1rge9WNR6iTOzq5VtzEerCX
X-Google-Smtp-Source: AGHT+IELobLiQtzkh0ybrp8Oor3ODkT4/kGvZ0dqBC00TYbI3Wvqs+46iBcrT7txNyAc6F+qatiZhDS4sy61VwBSFrc=
X-Received: by 2002:a5d:668b:0:b0:385:ed16:c8b with SMTP id
 ffacd0b85a97d-38bf5674631mr31270954f8f.23.1737976800723; Mon, 27 Jan 2025
 03:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20250127104556.175641-1-michal.orzel@amd.com> <20250127104556.175641-2-michal.orzel@amd.com>
In-Reply-To: <20250127104556.175641-2-michal.orzel@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Jan 2025 08:19:49 -0300
X-Gm-Features: AWEUYZnba3JVHcFI5c4SopWf8Xa-2oL-auOCpkzkutvXXRI9dDW3mqGn_nbgqPU
Message-ID: <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com>
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	oleksii.kurochko@gmail.com
Content-Type: multipart/alternative; boundary="000000000000d5c959062cae41d1"

--000000000000d5c959062cae41d1
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 07:46, Michal Orzel <michal.orzel@amd.com> wrote:

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
> therefore the struct membanks alignment is 4B. Fix it.


Usually, we add a BUILD_BUG_ON when other parts of the code rely on a
specific property (in this case alignment). Can you explain in the commit
message why the new check is still ok?

Cheers,



>
> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory
> bank structures")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/common/device-tree/bootfdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/device-tree/bootfdt.c
> b/xen/common/device-tree/bootfdt.c
> index 47386d4fffea..511700ccc2ba 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -27,8 +27,8 @@ static void __init __maybe_unused build_assertions(void)
>       */
>      BUILD_BUG_ON((offsetof(struct membanks, bank) !=
>                   offsetof(struct meminfo, bank)));
> -    /* Ensure "struct membanks" is 8-byte aligned */
> -    BUILD_BUG_ON(alignof(struct membanks) != 8);
> +    /* Ensure "struct membanks" is paddr aligned */
> +    BUILD_BUG_ON(alignof(struct membanks) != sizeof(paddr_t));
>  }
>
>  static bool __init device_tree_node_is_available(const void *fdt, int
> node)
> --
> 2.25.1
>
>

--000000000000d5c959062cae41d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Jan 2025 at 07:=
46, Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@a=
md.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Arm32, whe=
n CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:<br>
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
therefore the struct membanks alignment is 4B. Fix it.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Usually, we add a BUILD_BUG_ON when o=
ther parts of the code rely on a specific property (in this case alignment)=
. Can you explain in the commit message why the new check is still ok?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Fixes: 2209c1e35b47 (&quot;xen/arm: Introduce a generic way to access memor=
y bank structures&quot;)<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
---<br>
=C2=A0xen/common/device-tree/bootfdt.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/boot=
fdt.c<br>
index 47386d4fffea..511700ccc2ba 100644<br>
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
+=C2=A0 =C2=A0 /* Ensure &quot;struct membanks&quot; is paddr aligned */<br=
>
+=C2=A0 =C2=A0 BUILD_BUG_ON(alignof(struct membanks) !=3D sizeof(paddr_t));=
<br>
=C2=A0}<br>
<br>
=C2=A0static bool __init device_tree_node_is_available(const void *fdt, int=
 node)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000d5c959062cae41d1--

