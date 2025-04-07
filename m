Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C416A7E54D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940500.1340257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1opL-0007Sd-0k; Mon, 07 Apr 2025 15:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940500.1340257; Mon, 07 Apr 2025 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1opK-0007QM-TW; Mon, 07 Apr 2025 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 940500;
 Mon, 07 Apr 2025 15:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5oi=WZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u1opI-0007QG-T6
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:55:56 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b81bcf-13c8-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:55:54 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso8666944a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 08:55:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c013f2b4sm759930766b.116.2025.04.07.08.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 08:55:53 -0700 (PDT)
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
X-Inumbo-ID: c9b81bcf-13c8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744041354; x=1744646154; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDJcoJzP2TRLEmt37u/biEtAENqcKhb6sfVOaTW7z1k=;
        b=bOvQnJh/wNoo5V72hNTO7IOsmqUonp6iSt4jEhs0vvbp6uLbvXctVN/d295dYWgYSB
         EaSY/BpQwvL/iE7KU3EGKZgpT/13a6PjiCEHn3hTNT4lD4ZskyA1nihAqlAvT6Sfsz0M
         Z/EzNRoVAGCV1cx6hV0/WN6wOkvrujcT46sSOTBVnb6hOiDIb60GVoMAnhiKd6J0ivrC
         8fEju0xigA5Vk3v6/gsGQ/Y9YaQisKpSHNbn8BP1ab+NH4R3Fuyzj8OqP7+SnHxUOv74
         GB6fktX52x/Z3aEvSzx9dokDVcv7WadMGw5fBPuLOgRZPVbudNxYEaiQknY0Ii2MJbMB
         eM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041354; x=1744646154;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDJcoJzP2TRLEmt37u/biEtAENqcKhb6sfVOaTW7z1k=;
        b=c2FrYIXuS/BaiutXKz+NpcUM+GFvk/2tq952LxJ0i+zTPCIWIz0C2vK3trXcks+jo8
         WJ+yOT4YC8VfWXiUv2ToZ+LORo0xR8IkVZO4eQwYp2X+yiq+rGcRYY95pccaa2LNKAJh
         nRKahBp1kHClK+sL+mdcZAWEsxEHJe3GHeOC5+fx8pjm8U381yg3Q178BS7uOEKCdHVr
         V4AFBJXlKUM/TXLvS0m+awrtpT4TJ0ZvCRCaPCY9rH1Im58MRTEYuMgJeM6ZWgE3Pnyd
         uHFaIeAUXAzLx0a6D03pq8kTNSQNJHzmX+uii13IeDqsjs1JkkFGK+6h3l/rKlpPwQEj
         lcNw==
X-Forwarded-Encrypted: i=1; AJvYcCWYsG119TRLDKsvLjQt9eqykt/RbVJeVE9m+EMRAHT2GHKk08/WvMcnEbQTsg/C1r7RD/DCep1IZqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxOztxjq4sv1CqIxb5etVzaWoVoRJ6EcorH8/xl31ZO1k21536
	UDgZXwbusfGWn+zdr8YsklrV00zOGp4bTU5ZtCFvn40OLS0redsz
X-Gm-Gg: ASbGnctAhwau/aSBLGaaVW4tZs7bXQmtL6nZO8wcX6Qg32IZOP2I3EeOUoH2e9H7OWT
	PaOBSdPbyOkJoHlC7nP0ZmOH8w6IfYDgpX+qThgjoldbD0f5v2WGGXf4o6VHom4+JzMeUYgeBzy
	ac2bnp49CyIloRDiiFupJyXEWF0YxvebCoWhYpCl9lLlYuPzwcWx2p2tsDmvITprLWU1SfmbkQD
	ltYrMeX2pWK4tCgcT5x+rWdMuPJvBGW/otjlZ8O6uxefo9ByWZFwHyUnASnSNEj6jA4w5C9HRb3
	E2X+3I1kT+Pm/p6vO+SgAaev9j3ZPzPwNSp4X4l0QXOFOs351GYyakshMLkRaiwoEhvjg2ecsTx
	RBSDNUfc9netcpZ146p+Q
X-Google-Smtp-Source: AGHT+IEPhFdcNX0Y2gA2onhPC+J38SeoEgjyITbs5teVf5weyDYGV5hy7BiKgG6Rq/sN41A7lPqpgQ==
X-Received: by 2002:a17:906:d269:b0:ac7:971b:ffd with SMTP id a640c23a62f3a-ac7d185cf4cmr1273933066b.10.1744041354016;
        Mon, 07 Apr 2025 08:55:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------vBgtPMZpJw7ySNy8kWzRdND6"
Message-ID: <a0a76f43-7106-43c0-9a5f-24d335bbfbe8@gmail.com>
Date: Mon, 7 Apr 2025 17:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Drop .fixup section from non-x86 architectures
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250403110003.1461522-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------vBgtPMZpJw7ySNy8kWzRdND6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/3/25 1:00 PM, Andrew Cooper wrote:
> The fixup section is only used by x86, and we're working to remove it there
> too.  Logic in the fixup section is unconnected to it's origin site, and
> interferes with backtraces/etc.
>
> Remove the section from the architectures which don't use it.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
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
> ---
>   xen/arch/arm/xen.lds.S   | 1 -
>   xen/arch/ppc/xen.lds.S   | 1 -
>   xen/arch/riscv/xen.lds.S | 1 -
>   3 files changed, 3 deletions(-)
>
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 86a6e311cfc5..ae1903246f69 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -45,7 +45,6 @@ SECTIONS
>          *(.text.*)
>   #endif
>   
> -       *(.fixup)
>          *(.gnu.warning)
>          _etext = .;             /* End of text section */
>     } :text = 0x9090
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 3f2a7676ec96..1366e2819eed 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -38,7 +38,6 @@ SECTIONS
>           *(.text.*)
>   #endif
>   
> -        *(.fixup)
>           *(.gnu.warning)
>           . = ALIGN(POINTER_ALIGN);
>           _etext = .;             /* End of text section */
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index dffc6ae11913..818aa4366949 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -33,7 +33,6 @@ SECTIONS
>           *(.text.ident)
>           _ident_end = .;
>   
> -        *(.fixup)
>           *(.gnu.warning)
>           . = ALIGN(POINTER_ALIGN);
>           _etext = .;             /* End of text section */

Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
  #riscv

~ Oleksii

>
> base-commit: ae5fd39be98c6219a302045aec7c25bdafa81781
--------------vBgtPMZpJw7ySNy8kWzRdND6
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
    <div class="moz-cite-prefix">On 4/3/25 1:00 PM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250403110003.1461522-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">The fixup section is only used by x86, and we're working to remove it there
too.  Logic in the fixup section is unconnected to it's origin site, and
interferes with backtraces/etc.

Remove the section from the architectures which don't use it.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
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
---
 xen/arch/arm/xen.lds.S   | 1 -
 xen/arch/ppc/xen.lds.S   | 1 -
 xen/arch/riscv/xen.lds.S | 1 -
 3 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 86a6e311cfc5..ae1903246f69 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -45,7 +45,6 @@ SECTIONS
        *(.text.*)
 #endif
 
-       *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } :text = 0x9090
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 3f2a7676ec96..1366e2819eed 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -38,7 +38,6 @@ SECTIONS
         *(.text.*)
 #endif
 
-        *(.fixup)
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
         _etext = .;             /* End of text section */
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index dffc6ae11913..818aa4366949 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -33,7 +33,6 @@ SECTIONS
         *(.text.ident)
         _ident_end = .;
 
-        *(.fixup)
         *(.gnu.warning)
         . = ALIGN(POINTER_ALIGN);
         _etext = .;             /* End of text section */</pre>
    </blockquote>
    <pre>Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
 #riscv

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250403110003.1461522-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

base-commit: ae5fd39be98c6219a302045aec7c25bdafa81781
</pre>
    </blockquote>
  </body>
</html>

--------------vBgtPMZpJw7ySNy8kWzRdND6--

