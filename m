Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DCEAA5FD9
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 16:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974173.1362105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUnz-00019N-6k; Thu, 01 May 2025 14:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974173.1362105; Thu, 01 May 2025 14:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUnz-00017Z-3z; Thu, 01 May 2025 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 974173;
 Thu, 01 May 2025 14:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VVDx=XR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAUnx-00017R-PY
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 14:22:25 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33d78bf-2697-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 16:22:23 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so169740066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 07:22:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad0c70f0972sm47478966b.67.2025.05.01.07.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 07:22:22 -0700 (PDT)
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
X-Inumbo-ID: b33d78bf-2697-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746109343; x=1746714143; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcWkAx97F8Z0cL8jd65I5dp4bYaWPn+MnAx5RymJTZs=;
        b=DifhO5BYS2iT2qehjsfr9hXbPOxp6/aB0nRs2ulKtjFUv8JOxMb3UtelpQ+6ULWKxk
         qbWmJtdT6Q9vmgtZYrIV5+PBdpC9QIrr1vwQ+O4hMOkViDHY99a7dCLHmFdyHpCxo/g3
         aykLVLPcU20XGIuY+6ccHO1YVhZwbnk6ozi/iN8mg1O3fxD45FhTiXza65Yg9a0wlYSf
         J3LtaKY/MirBYmkSM7rAOX5WoflLM6j4dflS4uI3xTWYz4EndQZpXoJKX/zFtdRxOK9d
         pyoAWBSRCxRMCVqDXZc/pZEl6wihaRvldFXlzMsX7YXU6Vf9qzPuSUWAhxvxb2XZ4HJ4
         amrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109343; x=1746714143;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcWkAx97F8Z0cL8jd65I5dp4bYaWPn+MnAx5RymJTZs=;
        b=nilXhgowfks3zDAIM5JIZFfsES9emKiAn7bbapTZEVqjkJ0BTOYxfUS242byG9ZhTS
         EH56uCROu5P72d8qXCeMUF3/T2Ak5WwasoWcED7QCOSMHLt3tbXJgSOw7LjN4Lh8TUvK
         73g3qwciwnPXMqIFo8KhfIIl/Ut0bDptpES9EYyPmyVHM6pdc1BEgu9LnqkRFj0UvlD1
         VX4i3bNuI+6mgNRDanh3ENiUSmA5FwqLXxRmUP1RSFy1rE7BS2VAEJAZM+tBa/NCiw/D
         D7PFEd2+I5+dAC8oW1N8vA4MXt4hPBIiPqS/E5t82UaMw5nGrGRrkZQRPbGFjnKlTAxC
         igFw==
X-Forwarded-Encrypted: i=1; AJvYcCWChJ2f8D2XQ23Qj5m239fhmL8lttd8+KL0nmLZm+xKU3zGNZt9fBS4+n7MqICpLYdEj6q09wkV8XE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR70fJ/dCMX7973qbxCzQKDOkqeAD4SM0qIbXLD9RXyW6bR9Hg
	/1iNjuUEY1A+mYaLS5m8dOYGgvHA165L7BybRpRuXgSDsIkRNbHpjuM9pg==
X-Gm-Gg: ASbGncuqfsjj47Bypv63v1dt8H99ptDrOQ8os7V4YVYkbOxZihdH/onlkP8SEP2WAcH
	mD1oakUdxzXBWC6ebm8pv08AKoXUJrjfkgq72hpyy97rfpLP1gRHaruVUOHntZYBCS21vTBAtNj
	Bn6m9E+t5l6MZceMV7jtUZqIM5KKog1FCho8QE2W93xGz6ONqAdxlr1N2YdUJ/YAOvTdhD/Wzxf
	rooUmqvLs5D4hc4azaMD12AGsqLg9xAHxvw/mhYJR6thGmgNowLRtrR7tdsGQoSiKaDbMS2x6Gn
	Hf9IDTnnO/tTSoh6wwM/O40gc706LCZH3AdefkOWdtXdQ3lcgZwi/j3hqyTiIl/k7Ar2qPk7tVu
	hsooDLuLriD0LDVju
X-Google-Smtp-Source: AGHT+IHSD75/z72ccQbKP/AvG9/c0GBkbRJZA0jl0y2xGp1/CjoKpEdTJy/JuEfBErKqrym6wWGj2Q==
X-Received: by 2002:a17:907:980d:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-acef4bc6d35mr284958066b.48.1746109343006;
        Thu, 01 May 2025 07:22:23 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Vx5DhOCTs6yFoRmsUPGQ1AFS"
Message-ID: <9105a64f-e2e0-4a94-9cfa-3d9250c2714e@gmail.com>
Date: Thu, 1 May 2025 16:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move paddr_to_pdx()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com>

This is a multi-part message in MIME format.
--------------Vx5DhOCTs6yFoRmsUPGQ1AFS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/30/25 5:56 PM, Jan Beulich wrote:
> There's nothing arch-specific about it.
>
> While there, on x86 visually separate the vmap_to_*() macros from those
> covered by the earlier comment.
>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -237,7 +237,6 @@ static inline void __iomem *ioremap_wc(p
>   /* Convert between frame number and address formats.  */
>   #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>   #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> -#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
>   #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
>   #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
>   #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -13,7 +13,6 @@ void setup_initial_pagetables(void);
>   
>   #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>   #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
> -#define paddr_to_pdx(pa)  mfn_to_pdx(maddr_to_mfn(pa))
>   #define gfn_to_gaddr(gfn) pfn_to_paddr(gfn_x(gfn))
>   #define gaddr_to_gfn(ga)  _gfn(paddr_to_pfn(ga))
>   #define mfn_to_maddr(mfn) pfn_to_paddr(mfn_x(mfn))
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h

Reveiwed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

> @@ -19,7 +19,6 @@ extern vaddr_t directmap_virt_start;
>   #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>   #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>   
> -#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
>   #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
>   #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
>   #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -258,7 +258,8 @@ void scrub_page_cold(void *);
>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>   #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
>   #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
> -#define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
> +
> +/* Specialized forms acting on vmap() addresses. */
>   #define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)(va))
>   #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
>   
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -98,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
>   #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>   #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>   
> +#define paddr_to_pdx(pa) pfn_to_pdx(paddr_to_pfn(pa))
> +
>   #ifdef CONFIG_PDX_COMPRESSION
>   
>   extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
--------------Vx5DhOCTs6yFoRmsUPGQ1AFS
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
    <div class="moz-cite-prefix">On 4/30/25 5:56 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com">
      <pre wrap="" class="moz-quote-pre">There's nothing arch-specific about it.

While there, on x86 visually separate the vmap_to_*() macros from those
covered by the earlier comment.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -237,7 +237,6 @@ static inline void __iomem *ioremap_wc(p
 /* Convert between frame number and address formats.  */
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) &lt;&lt; PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) &gt;&gt; PAGE_SHIFT))
-#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
 #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -13,7 +13,6 @@ void setup_initial_pagetables(void);
 
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) &lt;&lt; PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) &gt;&gt; PAGE_SHIFT))
-#define paddr_to_pdx(pa)  mfn_to_pdx(maddr_to_mfn(pa))
 #define gfn_to_gaddr(gfn) pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)  _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn) pfn_to_paddr(mfn_x(mfn))
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h</pre>
    </blockquote>
    <pre>Reveiwed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com">
      <pre wrap="" class="moz-quote-pre">
@@ -19,7 +19,6 @@ extern vaddr_t directmap_virt_start;
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) &lt;&lt; PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) &gt;&gt; PAGE_SHIFT))
 
-#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
 #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -258,7 +258,8 @@ void scrub_page_cold(void *);
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
-#define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
+
+/* Specialized forms acting on vmap() addresses. */
 #define vmap_to_mfn(va)     xen_map_to_mfn((unsigned long)(va))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -98,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
+#define paddr_to_pdx(pa) pfn_to_pdx(paddr_to_pfn(pa))
+
 #ifdef CONFIG_PDX_COMPRESSION
 
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
</pre>
    </blockquote>
  </body>
</html>

--------------Vx5DhOCTs6yFoRmsUPGQ1AFS--

