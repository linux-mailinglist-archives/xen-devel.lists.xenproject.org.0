Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E1A58F52
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906291.1313744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZJh-0005Wm-3N; Mon, 10 Mar 2025 09:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906291.1313744; Mon, 10 Mar 2025 09:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZJg-0005VA-Vt; Mon, 10 Mar 2025 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 906291;
 Mon, 10 Mar 2025 09:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKOj=V5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1trZJf-0005TX-D1
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:20:55 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b4a020-fd90-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:20:53 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso6074546a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:20:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac27d8b2c31sm361480766b.1.2025.03.10.02.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:20:51 -0700 (PDT)
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
X-Inumbo-ID: f6b4a020-fd90-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741598452; x=1742203252; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OMmdjTJYGN5IlEQedbPslmeEUtLzdH2lHF+RoHjOKg=;
        b=DG8jm4hCX7ebufdH85Y8t5658nNXXqM0lgX/yYXvrsuOaE2UNkQaGM73H9lFSa3Hpo
         QAbjEjI9gbIadBOdsu2D+rIdSiYchZQaLFQauTGdEdWrGY67O67fVBIt4Vbq3p867oyU
         CPU7mqQSc3v00EoOhkOqjW8orw9S/tz9FYaqQBiX9uOFnLehmog6LPAOAtRaMwkw2Lof
         oHhcjLIDx0qOMeOhHggMBb1ai9FTRXFqY+ahAM9S8MppzWUhe1No/SHtKt+guFS7iTxG
         sht4vKQsodXZRMM5yUHLJKNXl1s454APaTrU+BiS1/Y3iZWxtFrilb4Q51yzW1L1W7Tl
         VjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598452; x=1742203252;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OMmdjTJYGN5IlEQedbPslmeEUtLzdH2lHF+RoHjOKg=;
        b=HgbH4iAyWvRUC6/6qd+8A6iq+3XaZnXCzLftbncyg7VwjrRoZ/CQU80f6h+1QXuj5H
         kVK7HvBT99m1vjw7Nhh/PZtxCStpOyD5Mcw1FNrITsAppw/UfQs6wnXlB9conG0S6FNK
         Qixsp5+vlw9z3N1PHYIzjseOggh3Y+Ecq/k0v+/Qua75vxJxp/OixXg8MLH+UgtkAjAN
         jlwn9BNwQWraiar7L+BhmLn9aru0DiMZvJ50TYgNUsZQGdHctZcgeg9vPsNp5nIGTrEv
         IfhaMHxypmbCU2C3g2GwFYJwjOK7dOvOvu9j+Zn0WVmQ+hrGPIKNikMvzru1NwBEWKb7
         4M8g==
X-Forwarded-Encrypted: i=1; AJvYcCWhjWtalPgYlvN3W8GwRolSUQm/0sS2CHvcMq4wvdCT0p1xxGCnkXVsDj7rcXEfay68NuLX4l55ufQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqqL2GS0lvkYqEfsf825/lJ+tabrivL02ZgmQQc6Qc2Cpikd1l
	4KKf4GM5sMn0FjMUDtN9znlgWes205nnWvwWUl/wk/sX0OTFc04/
X-Gm-Gg: ASbGncsQzLcu7Yc3K2ZyyZroas9m339+OpIBXHhLCHa1Yogekuiiz1cLEPjYKcSt5x2
	ykoEIOaJ7ZDOlYp4ZUmpGTz4CAOvvqnI1HIx8q71lXWDckXpUa3ZrRURsHGKhsDiPJ2n/Uu+USu
	9LHiNPIV8DZO+wdD/GeKSu3yfKeFrPzzJGIhcoKwHvz6+PYuSE1hVs5UbvJwlXi3/JjQtFy3ci2
	pQl4FdZboZjZImhrcBASUduMUmEl8bBWHBByG9vcMEIJW6d0HxB//BWygD1+8lfxBKiIV6ZR926
	ancItMSBYy/iULW521qf0+AeYcVYl6/8Sm3AZ4LuXpA4rNBD9BH1BpseFTbRD2bQfQdb8OV8NZ8
	2i4jbAnoq+Nzp5AJAw7FG
X-Google-Smtp-Source: AGHT+IEt2Ig+yygdQLgkSvLg2Ja0SzBATCVoOqvrZ2vcVaudl0/i6fjJ6RnIiRkM1uf16BMC4Bmnlw==
X-Received: by 2002:a17:907:94ce:b0:ac1:e1e1:1f37 with SMTP id a640c23a62f3a-ac25273af3dmr1575173666b.10.1741598451882;
        Mon, 10 Mar 2025 02:20:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------aIXzOtMcji8vsWlGRxtjYtQu"
Message-ID: <c21c47df-5b87-40c6-a98b-69236237058a@gmail.com>
Date: Mon, 10 Mar 2025 10:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] asm-generic: Introduce mm-types.h header
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com>

This is a multi-part message in MIME format.
--------------aIXzOtMcji8vsWlGRxtjYtQu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/6/25 7:25 PM, Shawn Anastasio wrote:
> Introduce a new header, mm-types.h, which will be used to define
> architecture-specific types pertinent to memory management. This will be
> used by a future commit to enable >32 bit PTE flags.
>
> Suggested-by: Jan Beulich<jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio<sanastasio@raptorengineering.com>
> Acked-by: Jan Beulich<jbeulich@suse.com>
> ---
> Changes in v4:
>    - Add Jan's Acked-by
>
>   xen/arch/arm/include/asm/Makefile   | 1 +
>   xen/arch/ppc/include/asm/Makefile   | 1 +
>   xen/arch/riscv/include/asm/Makefile | 1 +

Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>   xen/arch/x86/include/asm/Makefile   | 1 +
>   xen/include/asm-generic/mm-types.h  | 5 +++++
>   5 files changed, 9 insertions(+)
>   create mode 100644 xen/include/asm-generic/mm-types.h
>
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 4a4036c951..f8249b2439 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -3,6 +3,7 @@ generic-y += altp2m.h
>   generic-y += device.h
>   generic-y += hardirq.h
>   generic-y += iocap.h
> +generic-y += mm-types.h
>   generic-y += paging.h
>   generic-y += percpu.h
>   generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index c989a7f89b..c0dbc68ac6 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -5,6 +5,7 @@ generic-y += div64.h
>   generic-y += hardirq.h
>   generic-y += hypercall.h
>   generic-y += iocap.h
> +generic-y += mm-types.h
>   generic-y += paging.h
>   generic-y += percpu.h
>   generic-y += perfc_defn.h
> diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
> index c989a7f89b..c0dbc68ac6 100644
> --- a/xen/arch/riscv/include/asm/Makefile
> +++ b/xen/arch/riscv/include/asm/Makefile
> @@ -5,6 +5,7 @@ generic-y += div64.h
>   generic-y += hardirq.h
>   generic-y += hypercall.h
>   generic-y += iocap.h
> +generic-y += mm-types.h
>   generic-y += paging.h
>   generic-y += percpu.h
>   generic-y += perfc_defn.h
> diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
> index 2c27787d31..26650707e6 100644
> --- a/xen/arch/x86/include/asm/Makefile
> +++ b/xen/arch/x86/include/asm/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   generic-y += div64.h
> +generic-y += mm-types.h
> diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
> new file mode 100644
> index 0000000000..26490e48db
> --- /dev/null
> +++ b/xen/include/asm-generic/mm-types.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_MM_TYPES_H__
> +#define __ASM_GENERIC_MM_TYPES_H__
> +
> +#endif /* __ASM_GENERIC_MM_TYPES_H__ */
> --
> 2.30.2
>
--------------aIXzOtMcji8vsWlGRxtjYtQu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/6/25 7:25 PM, Shawn Anastasio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com">
      <pre wrap="" class="moz-quote-pre">Introduce a new header, mm-types.h, which will be used to define
architecture-specific types pertinent to memory management. This will be
used by a future commit to enable &gt;32 bit PTE flags.

Suggested-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Signed-off-by: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
Changes in v4:
  - Add Jan's Acked-by

 xen/arch/arm/include/asm/Makefile   | 1 +
 xen/arch/ppc/include/asm/Makefile   | 1 +
 xen/arch/riscv/include/asm/Makefile | 1 +</pre>
    </blockquote>
    <pre>Reviewed-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:a8417544cc8139ceafc1314acc6f9970358061ee.1741284947.git.sanastasio@raptorengineering.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/x86/include/asm/Makefile   | 1 +
 xen/include/asm-generic/mm-types.h  | 5 +++++
 5 files changed, 9 insertions(+)
 create mode 100644 xen/include/asm-generic/mm-types.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4a4036c951..f8249b2439 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -3,6 +3,7 @@ generic-y += altp2m.h
 generic-y += device.h
 generic-y += hardirq.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c989a7f89b..c0dbc68ac6 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index c989a7f89b..c0dbc68ac6 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += div64.h
 generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
+generic-y += mm-types.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
index 2c27787d31..26650707e6 100644
--- a/xen/arch/x86/include/asm/Makefile
+++ b/xen/arch/x86/include/asm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += div64.h
+generic-y += mm-types.h
diff --git a/xen/include/asm-generic/mm-types.h b/xen/include/asm-generic/mm-types.h
new file mode 100644
index 0000000000..26490e48db
--- /dev/null
+++ b/xen/include/asm-generic/mm-types.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_MM_TYPES_H__
+#define __ASM_GENERIC_MM_TYPES_H__
+
+#endif /* __ASM_GENERIC_MM_TYPES_H__ */
--
2.30.2

</pre>
    </blockquote>
  </body>
</html>

--------------aIXzOtMcji8vsWlGRxtjYtQu--

