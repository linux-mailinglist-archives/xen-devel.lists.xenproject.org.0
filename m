Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A180AAA50F0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973834.1361868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9nI-0002I7-WE; Wed, 30 Apr 2025 15:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973834.1361868; Wed, 30 Apr 2025 15:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9nI-0002FB-Sw; Wed, 30 Apr 2025 15:56:20 +0000
Received: by outflank-mailman (input) for mailman id 973834;
 Wed, 30 Apr 2025 15:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9nG-0002F1-Q6
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:56:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a629a90c-25db-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:56:16 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso2063599a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:56:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703831b5csm8873047a12.65.2025.04.30.08.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:56:15 -0700 (PDT)
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
X-Inumbo-ID: a629a90c-25db-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746028576; x=1746633376; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIIm9sMnJx3R9m93jDqQRNtYV1uSDut5QMkJ9c1BK44=;
        b=dH6E7zKaZ55Iwak+mjqzP5vKBx33sLVof85KGzGFx4AuSy2kRJrOV7jUzSDJE4JB34
         1gbVHi2hu+UpI8Wt2rVYF7Ca33o/oWOYB7MplIL/jUZ5QzUWUXWWn8F7oeqwzLk2xPgp
         mCQVusQZ5m9igSvHfBq/5a8eeEdwhLvefVRu4SLJv7txhe6KNgP/OrTMZEbNcHxfDOVB
         ztqgzH+L4JOOrn7Bm+j84JFi/YPdGBqlTJbScoYI5ROJZymC5bla1z02xHzMrHI9Zak9
         oC4J0tZWhQqcceuQ8NlVQiPQhG/xQVPb9J/wyTaCHTVPkOWCMcWIZHGFwW7EWz5/Mzka
         N3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028576; x=1746633376;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIIm9sMnJx3R9m93jDqQRNtYV1uSDut5QMkJ9c1BK44=;
        b=i8HvQwqdeobrF2i60pSgjdzu/ccg5GDe1L+iLs+ep9ufjGXwLbqZM4cBQlzkAhAe7F
         CD+NALRS5AZHQMmzPMjCgu2pw1qoLNUwLuiQ47IzuJqUCoitoWgsB7ciNU33z/pA5Msk
         2yltIJUNoOyaBZSCgKTCPNO7C99SPI41k1rCV0JKe9TQbAGM8xZmrx/PqpHLqKfJa1jU
         2PxXdx5ZsaA8MhVV9ebMYKbnhde6hpd4mNdpianvl+TlSBx4sgISBg3KpUEw7IMnCEs/
         We8ZP9y4fG298ZoUzVb01qAownAd5ZkAEcESpmsToTK/Lx5uODI63z6uq8u6srlrrhh6
         Gmmg==
X-Gm-Message-State: AOJu0YzSTDZfmzTgbuaJg5f7eqWnoet7/MBMBEM/pDNrIj925iQFgp+r
	3b6yZLQmNkNl6+fuWOnAsZAfflPZPKIjsfJCoDH8KRWd6KlKX61e+y82PI9MVIs9pNzszwv6VsI
	=
X-Gm-Gg: ASbGncuRMRkBbTaIT1jqXE6YmWqsNYIl3Jh+CIPuIpU/eE/kunR43KLG5hrh8umY7sY
	gduj4EL5mQ3IDEQybutpIQBtn/USpCy1BQDXgYVUvTn7pTAlWWKdaRqbnWvGOvY2PxbYYY8g/vV
	FFUtBvWimpiAvHF1lb7mgC8XXWMaASvdUMWJ4GbFtk1cXCB3afc/0qp40xT1PZt3jJNOBw4TkqT
	/BQhC/WeLrTSiBti7FSuEh+eoTIs88U/smjE6jEEOr1+nxjQzUPf5JWA+G/wG1+ituxw+TvgEEE
	nAseNC8CmYjGt01qQ6uyaYT8YKEQcgVnHZwVXVPeEI//matMIb/8oRkO0ioDaU6SPcB06gNd63R
	Iy8BovChLo0HN/vMY1QXRlKJgpPa17BSnn0r4
X-Google-Smtp-Source: AGHT+IEmQpeOYBdGfkong6yyDejetchBWKcvjhpKyytn8x9xSS3CUxAzx9Hyhtb5Joy/e5XIscxd5A==
X-Received: by 2002:a05:6402:5244:b0:5f7:2852:2010 with SMTP id 4fb4d7f45d1cf-5f89fe51a09mr3332576a12.13.1746028576108;
        Wed, 30 Apr 2025 08:56:16 -0700 (PDT)
Message-ID: <262b9929-5cbd-4bb1-ac2a-35916273cba5@suse.com>
Date: Wed, 30 Apr 2025 17:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] mm: move paddr_to_pdx()
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's nothing arch-specific about it.

While there, on x86 visually separate the vmap_to_*() macros from those
covered by the earlier comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -237,7 +237,6 @@ static inline void __iomem *ioremap_wc(p
 /* Convert between frame number and address formats.  */
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
-#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
 #define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -13,7 +13,6 @@ void setup_initial_pagetables(void);
 
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
-#define paddr_to_pdx(pa)  mfn_to_pdx(maddr_to_mfn(pa))
 #define gfn_to_gaddr(gfn) pfn_to_paddr(gfn_x(gfn))
 #define gaddr_to_gfn(ga)  _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn) pfn_to_paddr(mfn_x(mfn))
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -19,7 +19,6 @@ extern vaddr_t directmap_virt_start;
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
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

