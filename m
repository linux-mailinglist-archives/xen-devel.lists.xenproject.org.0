Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBA973A24
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795710.1205183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so23D-0004yQ-TI; Tue, 10 Sep 2024 14:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795710.1205183; Tue, 10 Sep 2024 14:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so23D-0004wN-QA; Tue, 10 Sep 2024 14:41:03 +0000
Received: by outflank-mailman (input) for mailman id 795710;
 Tue, 10 Sep 2024 14:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so23C-0003oG-0S
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:41:02 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b33637fe-6f82-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:41:01 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso1017485a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:41:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41bd4sm4323065a12.11.2024.09.10.07.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:41:00 -0700 (PDT)
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
X-Inumbo-ID: b33637fe-6f82-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979261; x=1726584061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JlkqykofbAb7CGlOxkQ+0hyYPlFf+ytgSxl8MBR56jg=;
        b=E5TB94dyLzJbSxEO2rJweQor0vfMBjiiYQiJswIT76zjrL123xwUQOvOIHLmnajnzm
         2NsiznBntsIjozsniFdaesNiAd/0gEcefrbAmWcI9TAiQtnGMdde2phMvvaox+ZPtJaf
         YbmWMXAobcNtsYBcliN1EC5cKUhqCGGn2+fssCy2vlPulgQb+8iJ3lbAYfXG3enYDz/m
         23gM7QlIOJi9cRRtOdwfMI1nzbQbivNeEEAFBaY4Y+nDxpZkoU5UvyOxMBbG5m+e5UH+
         FihMctPmoXDkHIC5eFmwbvIcQ8XRLUUwzjgV/6PR2AG5wWr0OKv2r2RqMQiGlTUXzg6T
         k+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979261; x=1726584061;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlkqykofbAb7CGlOxkQ+0hyYPlFf+ytgSxl8MBR56jg=;
        b=PKTER21Ei26mT9G3f/23qNKEjCaR3QIyoi97zIUHG7N+oGaLXD/pnr8Z9BF/26UK1L
         WNMHVrgbBkc1jEGij0MZDkjgHzUjWG5+ZcN2lcWVkRGLuVKsNHyOfp5wbTQBeGfkrvfo
         frouth+Nq+FlnkA2SMUgb/C3u83uHgBuhpQLQkDwaTzqO+SfPSyTZtgwmRKP16+LAzRa
         FS+DCftGgayRMKHyqiohZhMWp7uwCl1umuwrRH+MoUwGjcHrZLruz0C8w87TgdFKzWTZ
         xQkaUXNO38hhgQqll0lMfmGM3Ko+nEenGgwEyr3L6Cyq4Kh+arfyeA8/cLaaQ3pMmDsa
         wCVg==
X-Gm-Message-State: AOJu0YxBMLYjGGrV7OgpNfjdjaTiVaR+EKik0tjs8aNHqrVZT5KC+bCG
	DBklnlbvr+iIhqIunsOxtJOxiPo39BQPqh4nEfCXwPs0UN8trrDw54nnH0b1mM3aM+rr3FgxfaI
	=
X-Google-Smtp-Source: AGHT+IHaV8/7AnGV27K8IamtuurkTRAiSMga1aJeTyhE1r+GAyT1gEzRBD48QRS21zNNHcIwOjSLng==
X-Received: by 2002:a05:6402:5294:b0:5c2:6311:844f with SMTP id 4fb4d7f45d1cf-5c3dc79c527mr8322847a12.17.1725979260640;
        Tue, 10 Sep 2024 07:41:00 -0700 (PDT)
Message-ID: <bf1b1615-3ce4-4640-b825-7097b62b3ac0@suse.com>
Date: Tue, 10 Sep 2024 16:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/7] x86/HVM: drop stdvga's "sr[]" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Language: en-US
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
In-Reply-To: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No consumers are left, hence the producer and the array itself can also
go away. The static sr_mask[] is then orphaned and hence needs dropping,
too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -37,18 +37,6 @@
 #define VGA_MEM_BASE 0xa0000
 #define VGA_MEM_SIZE 0x20000
 
-/* force some bits to zero */
-static const uint8_t sr_mask[8] = {
-    (uint8_t)~0xfc,
-    (uint8_t)~0xc2,
-    (uint8_t)~0xf0,
-    (uint8_t)~0xc0,
-    (uint8_t)~0xf1,
-    (uint8_t)~0xff,
-    (uint8_t)~0xff,
-    (uint8_t)~0x00,
-};
-
 static int stdvga_outb(uint64_t addr, uint8_t val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
@@ -60,12 +48,6 @@ static int stdvga_outb(uint64_t addr, ui
         s->sr_index = val;
         break;
 
-    case 0x3c5:                 /* sequencer data register */
-        rc = (s->sr_index < sizeof(s->sr));
-        if ( rc )
-            s->sr[s->sr_index] = val & sr_mask[s->sr_index] ;
-        break;
-
     case 0x3ce:                 /* graphics address register */
         s->gr_index = val;
         break;
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -112,7 +112,6 @@ struct vpci_arch_msix_entry {
 
 struct hvm_hw_stdvga {
     uint8_t sr_index;
-    uint8_t sr[8];
     uint8_t gr_index;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;


