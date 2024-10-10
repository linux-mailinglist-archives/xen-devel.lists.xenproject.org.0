Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4C998A18
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816244.1230440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuOC-0007fF-3X; Thu, 10 Oct 2024 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816244.1230440; Thu, 10 Oct 2024 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuOC-0007d8-0j; Thu, 10 Oct 2024 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 816244;
 Thu, 10 Oct 2024 14:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syuOA-0007d2-Ni
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:43:38 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08546042-8716-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:43:37 +0200 (CEST)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5e5a0519d00so393218eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 07:43:37 -0700 (PDT)
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
X-Inumbo-ID: 08546042-8716-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728571416; x=1729176216; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0G/lY9SnA2OLILoaWPsygJS4HfGd0u87apXswA8bNo=;
        b=fY3lGbpClg2ZEJUazeY4Ecof8wik+Qjpb8LM4LNGnwOStrjj01rTHWiviFmlBVSAAH
         1v2UIBu3autFVqja4tPuLHYZE9cB5G4oEUIpxHRtRnqmYOVOkMcCZ4sLdysqwSZDmMz4
         QP3SALuD+8Rd1YaUUVBS6bp6OS8azGXf1PMZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571416; x=1729176216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0G/lY9SnA2OLILoaWPsygJS4HfGd0u87apXswA8bNo=;
        b=fex07HHtzcMyJ77Ha7ogEGITQbCrprLXR0boBJYourGBLe+FchatHFS79nZnjQTBq6
         hzFP9llvMOBO9Xqi7Y0Zx9CKMPvXxg6JRLffLpY1i+jG9qtkeavItlEd/FL1+f/YOw3y
         5OG7OYQfelaruEvzcM+Y4DQ3JoMP8F/jOP6nV+RYKx9CPUfO3AUgLuaWJ3wrenZsVWAU
         BPAfya0H87Xah5kM4/eAhmQlWyU3hcUiso+rWotnzJv04Rf7z+6hActS9oRyErAldKci
         Cul5rg7gZ7s3GBRCoGsjGWE5Clrr6Ic+MT9e+k4OFj1aLtvEfvIEA1wJscnQ44DQy94X
         /6UA==
X-Gm-Message-State: AOJu0YzUEtTBp0IWxvhJcQW+ig6l4yBjNj9nAwGE559IcD0nmUUh4GGh
	9tyltX0n7FXrDGoBhl+o+E38SqOBj9OytlDXsxIx4jyRMseLt87JUnqmaVamxmBlfxNWNYgdup8
	r+ouQWhdtKjmUU3cdMdWoku/zPPZvxnF1HQIKCQ==
X-Google-Smtp-Source: AGHT+IElaDQNs8+4ygfiT/fzbWhSpgVMQRsOZ3zlnOkPGGpsptcNjDD4nBpOEsPe1INJHl4FBDPoR4v8eb1jBZbnArI=
X-Received: by 2002:a05:6870:d1c9:b0:26c:5312:a13b with SMTP id
 586e51a60fabf-288344bfaa7mr4440598fac.30.1728571416404; Thu, 10 Oct 2024
 07:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com> <20241010140351.309922-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-2-ayan.kumar.halder@amd.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 15:43:25 +0100
Message-ID: <CACHz=Zh402HGV-=5Lbm5auZS0qX6KXH7ZPHvT3WUZ=EjJ4JE2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:05=E2=80=AFPM Ayan Kumar Halder
<ayan.kumar.halder@amd.com> wrote:
>
> If the BSS section is empty, then the function can just return.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>
> v1..v2 - New patch introduced in v3.
>
>  xen/arch/arm/arm64/head.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 14c3720d80..72c7b24498 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
>          PRINT("- Zero BSS -\r\n")
>          ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) */
>          ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)   */
> +        cmp   x1, x0
> +        beq   skip_bss
>
>  1:      str   xzr, [x0], #8
>          cmp   x0, x1

Why not just transforming the "do while" loop into a "while" one and
just jump to cmp?

Something like (not tested)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 14c3720d80..987f243578 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -346,9 +346,10 @@ FUNC_LOCAL(zero_bss)
        PRINT("- Zero BSS -\r\n")
        ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) */
        ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)   */
+        b     2f

1:      str   xzr, [x0], #8
-        cmp   x0, x1
+2:      cmp   x0, x1
        b.lo  1b

skip_bss:

Frediano

