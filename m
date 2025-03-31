Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8675A768B9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932724.1334809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGV9-00055e-78; Mon, 31 Mar 2025 14:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932724.1334809; Mon, 31 Mar 2025 14:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGV9-00053W-41; Mon, 31 Mar 2025 14:52:35 +0000
Received: by outflank-mailman (input) for mailman id 932724;
 Mon, 31 Mar 2025 14:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kof6=WS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tzGV7-00053Q-4x
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:52:33 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c565c32c-0e3f-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 16:52:30 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so7240396a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 07:52:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71961f8f0sm633929666b.95.2025.03.31.07.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 07:52:29 -0700 (PDT)
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
X-Inumbo-ID: c565c32c-0e3f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743432750; x=1744037550; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56j89lkfPfxSdGbzQRzqFqwelwa8evuVeQi8eK4fRqA=;
        b=hNzi5PGYm5HRzAos8Yr6o9uC20OslZP/nZKWw2+Cq0dqPhm5v7Gs7lqH6jU7u/6J0J
         1FllGhAWaYSHvlVTN5SnFHy9NPWKJqo0FdEa/MK/ynyj8kGfC34BbCkK/3k0OGn7XVY6
         efeYlRD0CUng50tL8VWAgR/YSB7oEh0caZmQ6UbjyD7lfiR+z43PwHnSktrZNhqFT8eN
         ZZTT2ylxIv8Fki08KeVRF+KFDwtEIzb+CPlyWAObcHPYQZeQSRxXEkv90bpwlN627iER
         3xhQPgIEQ8z2ZSJLIECy+Xr8o7tG6u8PCMMRreV8HrBYkD8NzgVtdxwSEHgngWqCy8uZ
         CfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432750; x=1744037550;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56j89lkfPfxSdGbzQRzqFqwelwa8evuVeQi8eK4fRqA=;
        b=kmUFg15EGZCu3VMOPVmtMIhegGE9pgFxJr0SFKQpfcBODXL9u4a35Uf+F/Jckj09Yr
         NNn6dyBUDXXaKQ9p31Xetd3EUcY8kqCgWU779o0toPuq56PctIx4+tZajBcKs7/rhoHw
         h0MPlDLCwcOVuuK1AagegnF33s8oPfwbCSR3xO1g0aNNtsoIFDo3VBGAYEZNFgwFDsdd
         ZtW2c4t3eiLyVjo8D8OP5fq+FRZbM5+ZGphWsz9A+K4qd9JoJXErfDJYEhDWNNozWVBz
         hwHmzSgrYeAfFHT9TA6bptLT3sSj6vxxzTxN5akPjSQ2lIh5tDVu+WLR/QFXtzguR/qc
         oZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUkWh541SOU2Zsx7ZuBeeTcCU2rq68UVmB7kwMba30f9BD37s+4Mcsc+50HsF6u+WG38zvRg4H+5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza8Tap9rxrXdIo6dc7sjkws39DAyRIaw8qhDigAcf48wbmeeiw
	/t6j3PDS/kHHZMXA077iwyTyV+v2Sw4CCoToO/BVXe4i9zXyZoAY
X-Gm-Gg: ASbGncuzpiexFEabn2WpUa7nsRX3+6coOQB/KgNvp1zMSyqKsOxZKiUT8UUrVN92RSF
	G1PWi1irRfUPCgQugNcj9ntYclmFZDUZ84+BArNAR8Xtx0AmkNhhmi1YABFLa3sD6fUZDFMoSXE
	zSnH2FxwMb0CTYQI9ugr3GCso0/fLFajur9X6UZivHCEQjmthl/xzh4p8R0LpvMC4MOXoGClRpl
	TwpSEhoT4wzFc3Po3jrdhdBG1UiBilxz5yv1j1yl6o1Az3MFLpY+LNC5NCcM8wo82i2y8ZKGw3B
	j3JoLae3NHJZ7Kkl2nOt14Ojp0Dsknr/ln2+g7qF8+yAjXe56uYns88YSkBVEytrzmVqCpKf7KL
	0u5Ui7r/JaIm6HzS0ZwlH
X-Google-Smtp-Source: AGHT+IGiel+6UOkM8sHCVhhK+uGCOL1mG+DNamM7lCeVBXzG7Q+ndfapxQCHRQvG3BGBAvMh4rkRHg==
X-Received: by 2002:a17:907:2ce4:b0:abf:4da0:28e3 with SMTP id a640c23a62f3a-ac7389bb03amr835434866b.18.1743432750170;
        Mon, 31 Mar 2025 07:52:30 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NOEJoo4c3yVrXwBVlKSVL3pd"
Message-ID: <47abb093-90ed-4661-943f-fa35bcb655c7@gmail.com>
Date: Mon, 31 Mar 2025 16:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/16] riscv: Remove asm/byteorder.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-16-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250328134427.874848-16-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------NOEJoo4c3yVrXwBVlKSVL3pd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/28/25 2:44 PM, Andrew Cooper wrote:
> With the common code moved fully onto xen/byteorder.h, clean up the dregs.
>
> The use of byteorder.h in io.h appears to have been copy&paste from ARM.  It's
> not needed, but macros and types are.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>

Reviewed-by:Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith<dpsmith@apertussolutions.com>
> CC: Lin Liu<lin.liu@citrix.com>
>
> v5:
>   * New
> ---
>   xen/arch/riscv/include/asm/byteorder.h | 14 --------------
>   xen/arch/riscv/include/asm/io.h        |  3 ++-
>   2 files changed, 2 insertions(+), 15 deletions(-)
>   delete mode 100644 xen/arch/riscv/include/asm/byteorder.h
>
> diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
> deleted file mode 100644
> index a32bca02df38..000000000000
> --- a/xen/arch/riscv/include/asm/byteorder.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#ifndef ASM__RISCV__BYTEORDER_H
> -#define ASM__RISCV__BYTEORDER_H
> -
> -#include <xen/byteorder.h>
> -
> -#endif /* ASM__RISCV__BYTEORDER_H */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
> index 55f329dde321..8bab4ffa0390 100644
> --- a/xen/arch/riscv/include/asm/io.h
> +++ b/xen/arch/riscv/include/asm/io.h
> @@ -38,7 +38,8 @@
>   #ifndef ASM__RISCV__IO_H
>   #define ASM__RISCV__IO_H
>   
> -#include <asm/byteorder.h>
> +#include <xen/macros.h>
> +#include <xen/types.h>
>   
>   /*
>    * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
--------------NOEJoo4c3yVrXwBVlKSVL3pd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/28/25 2:44 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250328134427.874848-16-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">With the common code moved fully onto xen/byteorder.h, clean up the dregs.

The use of byteorder.h in io.h appears to have been copy&amp;paste from ARM.  It's
not needed, but macros and types are.

No functional change.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>Reviewed-by: <span style="white-space: pre-wrap">Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</span></pre>
    <pre><span style="white-space: pre-wrap">Thanks.</span></pre>
    <pre><span style="white-space: pre-wrap">~ Oleksii</span></pre>
    <blockquote type="cite"
      cite="mid:20250328134427.874848-16-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Daniel P. Smith <a class="moz-txt-link-rfc2396E" href="mailto:dpsmith@apertussolutions.com">&lt;dpsmith@apertussolutions.com&gt;</a>
CC: Lin Liu <a class="moz-txt-link-rfc2396E" href="mailto:lin.liu@citrix.com">&lt;lin.liu@citrix.com&gt;</a>

v5:
 * New
---
 xen/arch/riscv/include/asm/byteorder.h | 14 --------------
 xen/arch/riscv/include/asm/io.h        |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 xen/arch/riscv/include/asm/byteorder.h

diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
deleted file mode 100644
index a32bca02df38..000000000000
--- a/xen/arch/riscv/include/asm/byteorder.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef ASM__RISCV__BYTEORDER_H
-#define ASM__RISCV__BYTEORDER_H
-
-#include &lt;xen/byteorder.h&gt;
-
-#endif /* ASM__RISCV__BYTEORDER_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 55f329dde321..8bab4ffa0390 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -38,7 +38,8 @@
 #ifndef ASM__RISCV__IO_H
 #define ASM__RISCV__IO_H
 
-#include &lt;asm/byteorder.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/types.h&gt;
 
 /*
  * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
</pre>
    </blockquote>
  </body>
</html>

--------------NOEJoo4c3yVrXwBVlKSVL3pd--

