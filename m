Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A00964376
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785678.1195164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdcU-0004HJ-SV; Thu, 29 Aug 2024 11:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785678.1195164; Thu, 29 Aug 2024 11:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdcU-0004Eo-PP; Thu, 29 Aug 2024 11:47:18 +0000
Received: by outflank-mailman (input) for mailman id 785678;
 Thu, 29 Aug 2024 11:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdcT-0004E6-7f
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:47:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70102f73-65fc-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 13:47:15 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso96785066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:47:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891daebcsm70409766b.170.2024.08.29.04.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:47:14 -0700 (PDT)
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
X-Inumbo-ID: 70102f73-65fc-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932035; x=1725536835; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef/TO3RUZp7UJLqGV5F3Bdki7XY3CnYxHWBDiwP5ghs=;
        b=BppJBfqK///3Co+jyImR27QTzDNm2lXycy1Z1ciP5d3gYtwqx7VHr3ExXcIGlWzeNJ
         DS8ER3EU0W1mkG6PKbHzwPCuYClRkkFiWZ9pjolYbOH1yUnkex5tNcMLh1KTOPWjIQ27
         7oswdd8UniAxt0Uwr6uF5xdd/2QDS2fG2p8yL7Q45jFqoh1CKH53tRtaFLp/v5tH222/
         OgECEddjL/3tYViXD6210Z0+QK8fG678HeQ3EDffSsdtDT6uS2Hovb8sXs2HrSX6p8wI
         8aX2RP0w6Aji87kagK8qqc/zxrBRUoYuOoyu9fAb2XWVtQ3D3IPBq/mCLWjmjYuP4r1m
         YIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932035; x=1725536835;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ef/TO3RUZp7UJLqGV5F3Bdki7XY3CnYxHWBDiwP5ghs=;
        b=qz93xl6d2jK7puiPgStS4EUA/j4Yaw9QLivvhSZm1OntG+ehZVlHqFVZKQdIeMYBnZ
         nc5tBbhU/7tOUIpdPDr0C6FPMzsnKO58Y0LIilOk78WnNkirU+OXMT6ufCh/Q29ExfPb
         ///hztu03TT9yDzKgyzwEej+Z7WN6P7FOhpTPqccpUDUhF4sOEHzegcFAgmvII3Oevse
         zcflfxGEKtRZ9Eq1Iypzf2VaHR7co5I6uDHHyNeNOQvgqHOpGdB/3eMXwsTw2z9qMqoD
         OLOj/gPNgSpjlXKQrXE4LmARB8+hR21Ql5L5qaa4GlT9GaQCIt4+g/BYmVut1NQo42ey
         Y8sA==
X-Gm-Message-State: AOJu0YxojlZiFkBG/eb0Jv4M3yrlvYllEXk04htRiNvWakuiCYgIhWat
	Nl8w3fx88OmHpyklY/dyjKeS8ygMIXPiqeVeTGcas0H7qovl7p1LZVB//5JXvOHFOGqciXhEeUU
	=
X-Google-Smtp-Source: AGHT+IG1hf/954NdGq5xjwiHQfApGyexVCeOsm4FQnOmNzbHd3B0zmwCxzHlnqSh8aYLd7egeFd+Dg==
X-Received: by 2002:a17:907:3f14:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a898c473f1dmr183119166b.22.1724932035136;
        Thu, 29 Aug 2024 04:47:15 -0700 (PDT)
Message-ID: <71348420-c60a-4d5c-9548-8e5f24f82c76@suse.com>
Date: Thu, 29 Aug 2024 13:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop map-low-16Mb leftovers
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

Prior work has fully eliminated that hardcoded boundary. Drop both the
linker script assertion (the upper bound is now the stubs area) and the
artificial extending of xen.efi's image size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -359,14 +359,6 @@ SECTIONS
 
   DWARF2_DEBUG_SECTIONS
 
-#ifdef EFI
-  /* Trick the linker into setting the image size to no less than 16Mb. */
-  __image_end__ = .;
-  .pad ALIGN(__section_alignment__) : {
-    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
-  }
-#endif
-
 #ifdef CONFIG_HYPERV_GUEST
   hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
 #endif
@@ -429,6 +421,3 @@ ASSERT((trampoline_end - trampoline_star
     "not enough room for trampoline and mbi data")
 ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
     "wakeup stack too small")
-
-/* Plenty of boot code assumes that Xen isn't larger than 16M. */
-ASSERT(_end - _start <= MB(16), "Xen too large for early-boot assumptions")

