Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AD8A043C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703717.1099556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhiV-0003Bg-DD; Wed, 10 Apr 2024 23:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703717.1099556; Wed, 10 Apr 2024 23:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhiV-00039C-AU; Wed, 10 Apr 2024 23:50:59 +0000
Received: by outflank-mailman (input) for mailman id 703717;
 Wed, 10 Apr 2024 23:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=na/H=LP=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1ruhiU-000392-HG
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:50:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3a4abf-f795-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:50:56 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-346b94fa7ecso104762f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 16:50:56 -0700 (PDT)
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
X-Inumbo-ID: 2c3a4abf-f795-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712793055; x=1713397855; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww3u0ZO/gh18m48+nNGtoXihgeW317XcZOEOt9tWw7A=;
        b=EBcUciLxbvceFOP+KpNOyFnBPH32x6xdweQsWGjoKDfKqfZXQRyKHOFoJcV1fw7IXZ
         qX7lqiMasMf0DqKfEL2tU+PsGjU4OlErQe9cRKEKXdW3zz96X4J0xy9DnfTw7gF+Fbw3
         NyFANR5R6c92t+hSAMLBuLoxbaWAhkPCKgSpiZvB5VoY4td9YPpIso2zgrOgCuoMzjVR
         cmYzesWzu4Sl4jVRQE4rzEJEQusSygzwXLLVSmVC8K1p1HLQ2IXhJv2TGkWLWMSnIPG8
         Q7PbyXwPRzRK++T3lEBh3ZmNEBwQfivHURgciYmK9Lq4DOBsYVwk4s108amJwbrQFEHz
         N9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712793055; x=1713397855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ww3u0ZO/gh18m48+nNGtoXihgeW317XcZOEOt9tWw7A=;
        b=v2CTmpPKNv8K+6vVJIeT6EPxUxm1oPhsHGuS7dNoT8LvqAolQt8bFZoYRBc4r/f+pq
         cb6wUPBUSV/Xzd6L7uHBeJIwd3pfjKxZcxbnn3SEnsk3wdHokhs0gPvGzR+3uMI/2o88
         mthJYAGv7Hpi5zblNqeT6HPpiLHou/HQiJxQg9qVkT0RshOSZphr32rGWK77OmC0CONn
         eVS+7DrkKSVz5GXl3bb6kctbZei9+TCkh26scDQvqL1/N1e9Lf2QYOU3XThAUMLwqYge
         YPBOR60df/4v5XN/8j5xFZgBfSXA5eLs3YpwAwWzlX+YiNoPMWPTaYAQihWwPj2w8p6r
         l5/g==
X-Forwarded-Encrypted: i=1; AJvYcCX9phgLGH4hTOhuh7ahWrlI97neDTIM77YCzDR/KAKEnG+QQoA9HQqe4Wt9eGC7fpL4GkAlCrwi0sOqYkD9Vu/lb3e/i+z7cUARR8vbsWE=
X-Gm-Message-State: AOJu0YyzswGf2o1FXUhA02hyoeRrvkTO8jb1OISnEt7cBhokoC7LXITk
	o9fFKpa/Mt60X7hAItJFL5FY94yk1jGzAiqnCoN78UqCFG56PflrhpQ/VkjvXUG2cXFSq8fW/jx
	Egf5dxTG+aQG4eRhmJvdH0qZ22Pc=
X-Google-Smtp-Source: AGHT+IEYqEJX9xMACkrP53U7Kg/PWOnuqAwXuCRXxrQ+i9EEI2Hs9FFlurJhnF9/j3l0dIuE+MRI8V2lvY9BnwJ1JCs=
X-Received: by 2002:adf:e2cf:0:b0:346:aed4:7108 with SMTP id
 d15-20020adfe2cf000000b00346aed47108mr475354wrj.18.1712793055377; Wed, 10 Apr
 2024 16:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com>
In-Reply-To: <20240410234740.994001-1-stefano.stabellini@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 10 Apr 2024 19:50:44 -0400
Message-ID: <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers sizes/alignments
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
	george.dunlap@citrix.com, jbeulich@suse.com, michal.orzel@amd.com, 
	roger.pau@citrix.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a3bfde0615c6b514"

--000000000000a3bfde0615c6b514
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <stefano.stabellini@amd.com>
wrote:

> xen_ulong_t is widely used in public headers.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>
> Given that xen_ulong_t is used in public headers there could be a better
> place for documenting it but this was the most straightforward to add.
> ---
>  docs/misra/C-language-toolchain.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/docs/misra/C-language-toolchain.rst
> b/docs/misra/C-language-toolchain.rst
> index 5ddfe7bdbe..7a334260e6 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -531,6 +531,17 @@ A summary table of data types, sizes and alignment is
> below:
>       - 64 bits
>       - x86_64, ARMv8-A AArch64, RV64, PPC64
>
> +   * - xen_ulong_t
> +     - 32 bits
> +     - 32 bits
> +     - x86_32
> +
> +   * - xen_ulong_t
> +     - 64 bits
> +     - 64 bits
> +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
> +       AArch32, ARMv7-A


We support neither ARMv8-R nor ARMv8-A Aarch32.

I could possibly accept the latter because it works to. But the former is
so far misleading.

Cheers,


> +
>     * - long long
>       - 64-bit
>       - 32-bit
> --
> 2.25.1
>
>

--000000000000a3bfde0615c6b514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini &lt;<a hre=
f=3D"mailto:stefano.stabellini@amd.com">stefano.stabellini@amd.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">xen_ulong_t is widely used in public heade=
rs.<br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@=
amd.com" target=3D"_blank">stefano.stabellini@amd.com</a>&gt;<br>
---<br>
<br>
Given that xen_ulong_t is used in public headers there could be a better<br=
>
place for documenting it but this was the most straightforward to add.<br>
---<br>
=C2=A0docs/misra/C-language-toolchain.rst | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-to=
olchain.rst<br>
index 5ddfe7bdbe..7a334260e6 100644<br>
--- a/docs/misra/C-language-toolchain.rst<br>
+++ b/docs/misra/C-language-toolchain.rst<br>
@@ -531,6 +531,17 @@ A summary table of data types, sizes and alignment is =
below:<br>
=C2=A0 =C2=A0 =C2=A0 - 64 bits <br>
=C2=A0 =C2=A0 =C2=A0 - x86_64, ARMv8-A AArch64, RV64, PPC64<br>
<br>
+=C2=A0 =C2=A0* - xen_ulong_t<br>
+=C2=A0 =C2=A0 =C2=A0- 32 bits<br>
+=C2=A0 =C2=A0 =C2=A0- 32 bits <br>
+=C2=A0 =C2=A0 =C2=A0- x86_32<br>
+<br>
+=C2=A0 =C2=A0* - xen_ulong_t<br>
+=C2=A0 =C2=A0 =C2=A0- 64 bits<br>
+=C2=A0 =C2=A0 =C2=A0- 64 bits <br>
+=C2=A0 =C2=A0 =C2=A0- x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch3=
2, ARMv8-R<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AArch32, ARMv7-A</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">We support neither ARMv8-R nor ARMv8-A Aarch32.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I could possibly accept=
 the latter because it works to. But the former is so far misleading.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)" dir=3D"auto"><br>
+<br>
=C2=A0 =C2=A0 * - long long<br>
=C2=A0 =C2=A0 =C2=A0 - 64-bit<br>
=C2=A0 =C2=A0 =C2=A0 - 32-bit<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000a3bfde0615c6b514--

